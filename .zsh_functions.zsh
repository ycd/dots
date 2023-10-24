function kubectl() {
  if ! type __start_kubectl >/dev/null 2>&1; then
      source <(command kubectl completion zsh)
  fi

  command kubectl "$@"
}

function exportenv() {
  export $(cat .env | xargs)
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

function ytmp3() {
  youtube-dl -f bestaudio -i -c -w --extract-audio --audio-format mp3 --audio-quality 0 $1 
}

function extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar e $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)     echo "'$1' cannot be extracted via extract()" ;;
       esac
   else
       echo "'$1' is not a valid file"
   fi
}


function goinstall() {
  wget -q -O - https://git.io/vQhTU | bash -s -- --version $1
}

function gmi() {
  go mod init $1
  mkdir internal pkg 
  touch README.md 
}

function gitblame() {
  local RANGE=$1
  local FILE_NAME=$2
  echo $RANGE $FILE_NAME
  git blame -L $RANGE -- $FILE_NAME
}



