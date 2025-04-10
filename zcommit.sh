#!/bin/bash

# Check if git is installed
if ! command -v git &> /dev/null
then
    echo "git could not be found. Please install git."
    exit 1
fi

# Determine operation mode: amend or new commit
if [ "$1" = "--amend" ]; then
    echo "Amending last commit..."
    staged_changes=$(git diff HEAD^ HEAD)
    commit_message=$(git log -1 --pretty=%B)
    operation="amend"
else
    # Get the staged changes
    staged_changes=$(git diff --staged)
    operation="new"
fi

# Check if there are any staged changes
if [ -z "$staged_changes" ]; then
  echo "No staged changes to commit."
  exit 0
fi

recent_commits=$(git log -n 5 --pretty=%B)

GEMINI_API_KEY="API_KEY_HERE"

# Prepare the prompt for Gemini
prompt="Please generate a concise commit message following the Conventional Commits specification based on the following changes:

\`\`\`diff
$staged_changes
\`\`\`

Recent Commit History:
\`\`\`
$recent_commits
\`\`\`

The commit message should include a type (feat, fix, docs, etc.), an optional scope, and a description. If the changes include a breaking change, indicate it with a '!'. If the change is breaking, include a BREAKING CHANGE footer. The response should be only the commit message. Do not include any commentary or conversation.

Examples
* Commit message with description and breaking change footer

feat: allow provided config object to extend other configs

BREAKING CHANGE: \\\`extends\\\` key in config file is now used for extending other config files

* Commit message with ! to draw attention to breaking change

feat!: send an email to the customer when a product is shipped

* Commit message with scope and ! to draw attention to breaking change

feat(api)!: send an email to the customer when a product is shipped

* Commit message with both ! and BREAKING CHANGE footer

chore!: drop support for Node 6

BREAKING CHANGE: use JavaScript features not available in Node 6.

* Commit message with no body

docs: correct spelling of CHANGELOG

* Commit message with scope

feat(lang): add Polish language


Also if it is a big change, please add a description, make it very detailed.
"

# Properly escape the prompt for JSON
json_prompt=$(echo "$prompt" | jq -Rs .)

# Call Gemini API with generation config
gemini_response=$(curl -s -X POST \
  "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$GEMINI_API_KEY" \
  -H "Content-Type: application/json" \
  -d "{
    \"contents\": [{
      \"parts\":[{\"text\":$json_prompt}]
    }],
    \"generationConfig\": {
      \"temperature\": 0.6,
      \"response_mime_type\": \"application/json\",
      \"response_schema\": {
        \"type\": \"OBJECT\",
        \"properties\": {
          \"title\": {\"type\": \"STRING\", \"example\": \"feat: add new feature\"},
          \"description\": {\"type\": \"STRING\", \"example\": \"This is a description of the feature(s) in a bullet point format\"},
        },
        \"required\": [\"title\", \"description\"]
      }
    }
  }")

# Check if the API call was successful
if [ $? -ne 0 ]; then
  echo "Error calling Gemini API."
  echo "$gemini_response"
  exit 1
fi

# Extract the commit message and body from the Gemini response
commit_title=$(echo "$gemini_response" | jq -r '.candidates[0].content.parts[0].text' | jq -r '.title // empty')
commit_description=$(echo "$gemini_response" | jq -r '.candidates[0].content.parts[0].text' | jq -r '.description // empty')

# Check if the commit message is empty or "null"
if [ -z "$commit_title" ] || [ "$commit_title" = "null" ]; then
  echo "Failed to generate a commit message."
  echo "Gemini Response: $gemini_response"
  exit 1
fi

# Commit the changes with the generated message
# if auto-commit is true, commit the changes with the generated message
if [ "$auto_commit" = true ]; then
#   echo "Commit command to be executed:"
  if [ -n "$commit_description" ]; then
    echo "git commit -m \"$commit_title\" -m \"$commit_description\""
    # ask for confirmation
    read -p "Are you sure you want to commit these changes? (Y/n): " confirm
    if [ "$confirm" = "Y" ]; then
        if [ "$operation" = "amend" ]; then
            git commit --amend -m "$commit_title" -m "$commit_description"
        else
            git commit -m "$commit_title" -m "$commit_description"
        fi
    else
      echo "Commit cancelled."
    fi
  else
    echo "git commit -m \"$commit_title\""
    # ask for confirmation
    read -p "Are you sure you want to commit these changes? (Y/n): " confirm
    if [ "$confirm" = "Y" ]; then
        if [ "$operation" = "amend" ]; then
            git commit --amend -m "$commit_title"
        else
            git commit -m "$commit_title"
        fi
    else
      echo "Commit cancelled."
    fi
  fi
  echo "Successfully committed changes."
else
  # if auto-commit is false, print the commit message and body
  if [ -n "$commit_description" ]; then
    echo "Commit Title: $commit_title"
    echo "Commit Description: $commit_description"
  else
    echo "Commit Title: $commit_title"
  fi
  # should we auto commit, ask for confirmation
  read -p "Should we auto commit? (Y/n): " confirm
  if [ "$confirm" = "Y" ] || [ "$confirm" = "y" ]; then
    if [ -n "$commit_description" ]; then
        if [ "$operation" = "amend" ]; then
            git commit --amend -m "$commit_title" -m "$commit_description"
        else
            git commit -m "$commit_title" -m "$commit_description"
        fi
    else
        if [ "$operation" = "amend" ]; then
            git commit --amend -m "$commit_title"
        else
            git commit -m "$commit_title"
        fi
    fi
  else
    echo "Skipping auto-commit."
  fi
fi
