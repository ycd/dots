
# History with FZF
function hist() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

# kubectl with autocomplete
function kubectl() {
    if ! type __start_kubectl >/dev/null 2>&1; then
        source <(command kubectl completion zsh)
    fi

    command kubectl "$@"
}

# git add with fzf
function gaf() {
  git add . --dry-run | awk '{print $2}' | fzf --multi  | xargs git add 
}
