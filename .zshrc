export ZSH="/Users/yagizcandegirmenci/.oh-my-zsh"
export PATH=/opt/homebrew/bin:$PATH
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PULUMI_PATH="/Users/yagizcandegirmenci/.pulumi/bin"
export GPG_TTY=$(tty)

export PATH=$PATH:$PULUMI_PATH:$MONO_PATH:$GOPATH

ZSH_THEME="robbyrussell"

plugins=(git z fd zsh-autosuggestions alias-finder git-extras gcloud aws )

source $ZSH/oh-my-zsh.sh 
~/.tmux/plugins/tpm/tpm

# Settings
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=999999999
export SAVEHIST=$HISTSIZE

# Load custom functions
if [[ -f "$HOME/.zsh_functions.zsh" ]]; then
	source "$HOME/.zsh_functions.zsh"
else
	echo >&2 "WARNING: can't load shell functions"
fi

# Load custom aliases
if [[ -f "$HOME/.zsh_aliases.zsh" ]]; then
	source "$HOME/.zsh_aliases.zsh"
else
	echo >&2 "WARNING: can't load shell aliases"
fi

if [[ -f "/Users/yagizcandegirmenci/.zsh_secrets.zsh" ]]; then
        source "/Users/yagizcandegirmenci/.zsh_secrets.zsh"
else
        echo >&2 "WARNING: can't load secret variables"
fi

# Load custom plugins 
for plug in $HOME/.zsh_plugins/*.zsh; do
	[ -e "$plug" ] || continue
	source $plug
done


source <(kubectl completion zsh)


export FZF_DEFAULT_OPTS="
--ansi
--layout=reverse
--height=80%
--multi
--preview-window 'right:60%'
--preview '([[ -f {} ]] && (bat --style=numbers --color=always --style=header,grid {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
--prompt='∼ ' --pointer='▶' --marker='✓'
--bind '?:toggle-preview'
--bind 'ctrl-a:select-all'
--bind 'ctrl-y:execute-silent(echo {+} | pbcopy)'
--bind 'ctrl-e:execute(echo {+} | xargs -o nvim)'
--bind 'ctrl-v:execute(code {+})'
"

export FZF_DEFAULT_COMMAND="rg --files --hidden"

export KUBE_EDTIOR="/Users/yagizcandegirmenci/.local/bin/lvim"
export EDITOR="/Users/yagizcandegirmenci/.local/bin/lvim"

# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin
export PATH="/usr/local/opt/gnupg@2.2/bin:$PATH"

# 
export GOROOT=/Users/yagizcandegirmenci/.go
export PATH=$GOROOT/bin:$PATH
export GOPATH=/Users/yagizcandegirmenci/go
export PATH=$GOPATH/bin:$PATH
export HOMEBREW_NO_AUTO_UPDATE=1
export CARGO_NET_GIT_FETCH_WITH_CLI=true

# GoLang
export GOROOT=/Users/yagizcandegirmenci/.go
export PATH=$GOROOT/bin:$PATH
export GOPATH=/Users/yagizcandegirmenci/go
export PATH=$GOPATH/bin:$PATH
