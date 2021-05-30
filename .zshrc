export ZSH="/home/ycd/.oh-my-zsh"
export EDITOR=vim

ZSH_THEME="robbyrussell"
plugins=(git docker docker-compose alias-finder zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh


# cd on steroids
alias fcd='cd $(fd --type directory | fzf)'



## ---- ALIASES ----- ## 
alias pip=pip3
alias pypy=pypy3
alias python=python3

# Python Virtualenv
alias virt="python -m venv env && source env/bin/activate"
alias avirt="source env/bin/activate"
alias uvi="uvicorn main:app --reload"
alias uvi4="uvicorn main:app --workers 4"
# export PIP_REQUIRE_VIRTUALENV=true

# Git Aliases
alias gc='git commit'
alias gic="git clone"
alias gpuf="git add . && git commit -m 'small fix' && git push"

# Docker
alias ali="docker run --rm -it nakabonne/ali ali"
alias gomt='gomodifytags -add-tags json -transform camelcase -all -w -file "$@"'

# tmux-vim etc.
alias tmrp="tmux resizep"
alias xo="xdg-open"

# PB copy
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'


bindkey '^H' backward-kill-word
alias video_to_ffmpeg="ffmpeg  -i \"$@\" -filter_complex \
\"fps=10,scale=700:-1:flags=lanczos[x];[x]split[x1][x2]; \
[x1]palettegen[p];[x2][p]paletteuse\"  -r \"15\" output.gif"


# lovely modern tools
alias black="python -m black"
alias ls="exa"
alias vi="vim"
alias less="bat"
alias ps="procs"
alias hptime="hyperfine"

alias vim="nvim"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/ycd/build/google-cloud-sdk/path.zsh.inc' ]; then . '/home/ycd/build/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/ycd/build/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/ycd/build/google-cloud-sdk/completion.zsh.inc'; fi

alias k=kubectl


function hist() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}






# testing setup for macos

function kubectl() {
    if ! type __start_kubectl >/dev/null 2>&1; then
        source <(command kubectl completion zsh)
    fi

    command kubectl "$@"
}


function kp() {
local pid=$(ps -ef | sed 1d | eval "fzf ${FZF_DEFAULT_OPTS} -m --header='[kill:process]'" | awk '{print $2}')

if [ "x$pid" != "x" ]
then
  echo $pid | xargs kill -${1:-9}
  kp
fi
}

