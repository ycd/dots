function kubectl() {
  if ! type __start_kubectl >/dev/null 2>&1; then
      source <(command kubectl completion zsh)
  fi

  command kubectl "$@"
}


function hist() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}


function bpl() {
 print -z $(: | fzf \
  --reverse \
  --preview='bash -c {q}' \
  --preview-window=down:60 \
  --print-query )
}


function gaf() {
  git add --dry-run . | awk '{print $2}' | sed s/\'//g | fzf --reverse --preview='git diff --color=always {+}' --multi | xargs git add 
}


function gsw() {
  branch=$( git branch -l | fzf | sed s/\ //g )
  without_prefix=$(startswith $branch "*")
  if [[ $? -eq 0 ]]; then 
    branch=$without_prefix
  fi 
  git switch $branch
}

function glt() {
  git tag | tail -n 1
}

function ipv4ToBinary() {
  ip="$@";
  for i in $(echo ${ip} | tr '.' ' '); do echo "obase=2 ; $i" | bc; done | awk '{printf ".%08d", $1}' | cut -c2- | tr "." ""
}
