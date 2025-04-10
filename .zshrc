export ZSH="$HOME/.oh-my-zsh"
export PATH=/opt/homebrew/bin:$PATH
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export GPG_TTY=$(tty)
export LOCAL_BIN="$HOME/.local/bin"
export LATEX_BIN="/Library/TeX/texbin"

export PATH=$PATH:$PULUMI_PATH:$MONO_PATH:$GOPATH:$LOCAL_BIN:$LATEX_BIN

ZSH_THEME="robbyrussell"

plugins=(git z zsh-autosuggestions alias-finder git-extras gcloud aws kube-ps1 )

source $ZSH/oh-my-zsh.sh 

alias vim="lvim"
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

# Load custom aliaseks
if [[ -f "$HOME/.zsh_aliases.zsh" ]]; then
	source "$HOME/.zsh_aliases.zsh"
else
	echo >&2 "WARNING: can't load shell aliases"
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

export KUBE_EDTIOR="$HOME/.local/bin/lvim"
export EDITOR="$HOME/.local/bin/lvim"

# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin
export PATH="/usr/local/opt/gnupg@2.2/bin:$PATH"
 

export HOMEBREW_NO_AUTO_UPDATE=1
export CARGO_NET_GIT_FETCH_WITH_CLI=true

# GoLang
export GOROOT=$HOME/.go
export PATH=$GOROOT/bin:$PATH
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/Downloads/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/Downloads/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc"; fi

# GoLang
export GOROOT=$HOME/.go
export PATH=$GOROOT/bin:$PATH
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

# Added by LM Studio CLI (lms)
export PATH="$PATH:$HOME/.cache/lm-studio/bin"


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r "$HOME/.opam/opam-init/init.zsh" ]] || source "$HOME/.opam/opam-init/init.zsh" > /dev/null 2> /dev/null
# END opam configuration
#
alias coreutils="$HOME/personal/coreutils/target/release/coreutils"
alias dcoreutils="$HOME/personal/coreutils/target/debug/coreutils"

alias zcommit="$HOME/personal/zcommit/zcommit.sh"
alias zc="zcommit"
eval "$(atuin init zsh)"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
