autoload zmv

export EDITOR=nvim

#Enable vim keybindings
bindkey -v

source ~/.dotfiles/zsh/load-antigen.zsh
source ~/.dotfiles/zsh/private-env.crypt.sh &> /dev/null

unalias grep

export PATH=~/.local/bin:$PATH

if hash node 2>/dev/null; then
  export PATH=./node_modules/.bin:/usr/local/bin:$PATH
fi

if hash go 2>/dev/null; then
  export PATH=`go env GOROOT`/bin/:`go env GOPATH`/bin/:$PATH
  export GOPATH=~/Dev/go
fi

if hash cargo 2>/dev/null; then
  export PATH=/Users/ryan/.multirust/toolchains/nightly/cargo/bin:$PATH
  export RUST_SRC_PATH=/usr/local/src/rust/nightly/
fi

if hash htop 2>/dev/null; then
  alias top='htop'
fi

if hash gpg2 2>/dev/null; then
  alias gpg='gpg2'
fi

if hash nvim 2>/dev/null; then
  alias 'vim'='nvim'
  alias 'vi'='nvim'
fi



# export phantomjs
export PHANTOMJS_BIN=/usr/local/bin/phantomjs


function port() {
  lsof -i ":${1:-80}"
}

function kport() {
  kill -9 `port $1 | tail -n 1 | cut -d' ' -f 5`
}

#Additional Customizations

export GITHUB_USER=rschmukler
export NVIM_TUI_ENABLE_TRUE_COLOR=true


os=`uname`

if [[ "$os" == 'Darwin' ]]; then

  alias ls="/usr/local/bin/gls --color=auto -hF"
  alias cleardns='sudo dscacheutil -flushcache'
  alias updatedb='sudo /usr/libexec/locate.updatedb'
  alias 'xc5'='sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer'
  alias 'xc6'='sudo xcode-select --switch /Applications/Xcode6-Beta2.app/Contents/Developer'

  export PATH="/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:${PATH}"



  # Add Homebrew Cask options
  export HOMEBREW_CASK_OPTS="--appdir=/Applications"

  # Set ulimit for component
  ulimit -n 10240

  # add docker support
  eval $(docker-machine env dev 2>/dev/null )

  alias ssh='TERM=xterm ssh'
fi

alias :q="exit"
alias :wq="exit"
alias pg_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg_stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias mg_start='sudo mongod run --config /usr/local/Cellar/mongodb/2.0.2-x86_64/mongod.conf'
alias spec=rspec
alias rehash='hash -r'

# Disable autocorrect for things commonly found in ./
alias mocha='nocorrect mocha'
alias karma='nocorrect karma'
alias gulp='nocorrect gulp'

# Programming Aliases

alias 'letsgo'='cd ~/Dev/go/src/github.com/rschmukler'

# Zeus Aliases
alias zrr='zeus rake routes'
alias zdb='zeus rake db:migrate; zeus rake db:test:prepare'
alias zts='zeus test spec'

function path() {
  type -p "$1" | cut -d ' ' -f 3
}

# Tmux Aliases
function tn() {
  tmux new -s "$1"
}

function ta() {
  tmux attach -t "$1"
}

tmux_search_paths=( ~/Dev ~/Dev/node ~/Dev/go/src/github.com/rschmukler ~/Dev/angular ~/Dev/consulting ~/Dev/offmarket )

function tt() {
  sessionName=`echo "$1" | nip "return line.split('.').pop()"`
  if ! tmux has-session -t "$sessionName" 2> /dev/null; then
    tmux_script=~/.dotfiles/files/tmux-scripts/$1
    if [[ -e $tmux_script ]]; then
      zsh "$tmux_script"
    else
      oldTMUX=$TMUX
      unset TMUX
      tmux new -d -s $sessionName
      export TMUX=$oldTMUX
      unset oldTMUX
      for searches in $tmux_search_paths; do
        dir=$searches/$1
        if [[ -d $dir ]]; then
          tmux send-keys -t "${sessionName}" "cd $dir; clear" "C-m"
          break
        fi
      done
      unset searches
      unset tmux_scripts
      unset dir
    fi
  fi
  if [[ -n $TMUX ]]; then
    tmux switch-client -t $sessionName
  else
    tmux attach -t $sessionName
  fi
}

function _tls() {
  reply=( $(tmux list-sessions 2> /dev/null | cut -d: -f1) )
}

function _tscripts() {
  reply=( $(tmux list-sessions 2> /dev/null | cut -d: -f1) )
  reply+=( $(ls ~/.dotfiles/files/tmux-scripts) )
  for dir in $tmux_search_paths; do
    reply+=( $(ls $dir/*/) )
  done
}

function tk() {
  tmux kill-session -t $1
}

alias tka='tmux kill-server';

function tm() {
  tmux new-session -t $1
}

compctl -K _tls tk
compctl -K _tls tm
compctl -K _tscripts tt

alias tls="tmux list-sessions";

# Git Aliases
alias 'git clean'='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias 'glp'="git log --graph --pretty=format:'%Cred%h%Creset -%Cblue %an %Creset - %C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gsr='git setref'
alias gdm='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias gprom='git pull --rebase origin master'
alias gcom='git checkout master'
alias gre='git reset --hard'

# Docker Aliases
alias dm='TERM=xterm docker-machine'
alias dip='docker-machine ip'
alias dls='docker-machine ls'
alias dma='docker-machine active'
alias dc='docker-compose'
alias rc='rancher-compose'
alias dps='docker ps'

function dme() {
  eval $(docker-machine env $1 $2)
}

function drm() {
  docker stop "$1"; docker rm -v "$1";
}

function swarm-run() {
  machines=("${(@f)$(docker-machine ls | grep -E $1 | cut -f1 -d ' ')}")
  shift
  for m in "${machines[@]}"; do
    echo =================== $m ===================
    $(docker-machine env $m);
    docker $@;
  done
}

# Mocha Aliases
alias mtc='jscoverage lib lib-cov; TEST_COV=true mocha --reporter html-cov > lib-cov/report.html'

export NODE_PATH=/usr/local/share/npm/lib/node_modules:./lib

# Useful functions

function port() {
 lsof -i ":${1:-80}"
}

function pk() {
  local killport=`lsof -i ":${1:-80}" | tail -n1 | awk '{print $2}'`
  kill -9 $killport
}

function upgradeNode() {
  local oldVersion=`nvm current`;
  nvm install $1;
  nvm alias default $1;
  nvm use default;
  nvm reinstall-packages $oldVersion
  nvm uninstall $oldVersion
}

function upgradeRust() {
  multirust update nightly && \
  curl https://static.rust-lang.org/dist/rustc-nightly-src.tar.gz > /tmp/rust-nightly.tar.gz && \
  rm -rf /usr/local/src/rust/nightly && \
  mkdir -p /usr/local/src/rust/nightly && \
  tar -xzf /tmp/rust-nightly.tar.gz -C /usr/local/src/rust/nightly --strip-components=2 rustc-nightly/src && \
  rm -rf /tmp/rust-nightly.tar.gz 
}


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"


if [ ! -z "$IS_DOCKER"]; then
  cd /src
  tmux new-session -A -s dev && exit
fi
