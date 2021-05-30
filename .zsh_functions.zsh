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
 : | fzf \
  --reverse \
  --preview='bash -c {q}' \
  --preview-window=down:60 \
  --print-query \
  --color=dark \
  --color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f \
  --color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
}


function gaf() {
  git add --dry-run . | awk '{print $2}' | sed s/\'//g | fzf --reverse --preview='git diff {+}' --multi | xargs git add 
}
