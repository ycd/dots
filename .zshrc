
export ZSH="/Users/yagizcandegirmenci/.oh-my-zsh"
export PATH=/opt/homebrew/bin:$PATH


ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh



# ALIASES
alias pip=pip3
alias pypy=pypy3
alias python=python3
alias gc='git commit'
alias gic="git clone"
alias ls="exa"
alias vi="vim"
alias less="bat"
alias ps="procs"
alias hptime="hyperfine"
alias vim="nvim"
alias k="kubectl"


# FUNCTIONS
function hist() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}
