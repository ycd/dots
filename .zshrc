
export ZSH="/Users/yagizcandegirmenci/.oh-my-zsh"
export PATH=/opt/homebrew/bin:$PATH


ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

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


source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

