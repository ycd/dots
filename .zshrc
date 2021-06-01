# export JAVA_HOME="/Users/yagizcandegirmenci/Library/Caches/Coursier/jvm/adopt@1.8.0-292/Contents/Home"
# export COURSIER="/Users/yagizcandegirmenci/Library/Application Support/Coursier/bin"
# export PATH=$PATH:$GOPATH:$GOBIN:$JAVA_HOME:$COURSIER
export ZSH="/Users/yagizcandegirmenci/.oh-my-zsh"
export JAVA_PATH="/usr/local/Cellar/openjdk/16.0.1/bin"
export JAVA_11_PATH="/usr/local/opt/openjdk@11/bin"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-16.0.1.jdk/Contents/Home"
export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
alias java8="export JAVA_HOME=$JAVA_8_HOME"
export PATH=/opt/homebrew/bin:$PATH
#export GOPATH=$HOME/go
#export GOBIN=$GOPATH/bin
#:$GOPATH:$GOBIN

export PATH=$PATH:$JAVA_PATH:$JAVA_HOME:$JAVA_11_PATH

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


# Load custom plugins 
for plug in $HOME/.zsh_plugins/*.zsh; do
	[ -e "$plug" ] || continue
	source $plug
done


# source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
# source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"


export FZF_DEFAULT_OPTS="
--layout=reverse
--height=80%
--multi
--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
--prompt='∼ ' --pointer='▶' --marker='✓'
--bind '?:toggle-preview'
--bind 'ctrl-a:select-all'
--bind 'ctrl-y:execute-silent(echo {+} | pbcopy)'
--bind 'ctrl-e:execute(echo {+} | xargs -o vim)'
--bind 'ctrl-v:execute(code {+})'
"

export FZF_DEFAULT_COMMAND="rg --files --hidden"
