f [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

xport ZSH="/home/ycd/.oh-my-zsh"

SH_THEME="robbyrussell"
plugins=(git docker docker-compose alias-finder zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh


## ---- ALIASES ----- ## 
alias pip=pip3
alias pypy=pypy3
alias python=python3

# Python Virtualenv
alias virt="python -m venv env && source env/bin/activate"
alias avirt="source env/bin/activate"
alias uvi="uvicorn main:app --reload"
alias uvi4="uvicorn main:app --workers 4"
export PIP_REQUIRE_VIRTUALENV=true

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
