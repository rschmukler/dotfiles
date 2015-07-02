autoload zmv
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="rs2"

#Enable vim keybindings
bindkey -v

source ~/.dotfiles/zsh/load-antigen.zsh
source ~/.dotfiles/zsh/private-env.crypt.sh

if hash go 2>/dev/null; then
  export PATH=./node_modules/.bin:/usr/local/bin:`go env GOROOT`/bin/:`go env GOPATH`/bin/:$PATH
  export GOPATH=~/Dev/go
fi


# export phantomjs
export PHANTOMJS_BIN=/usr/local/bin/phantomjs


function define_vim_wrappers()
{
  vim_commands=(
    eview evim gview gvim gvimdiff gvimtutor rgview
    rgvim rview rvim vim vimdiff vimtutor xxd mvim
  )

  for cmd in ${vim_commands[@]}; do
    cmd_path=`/usr/bin/env which -a "${cmd}" 2>/dev/null | grep '^/'`
    if [ -x "${cmd_path}" ]; then
      eval "function ${cmd} () { (unset GEM_HOME; unset GEM_PATH; $cmd_path \$@) }"
    fi
  done
}

function port() {
  lsof -i ":${1:-80}"
}

function kport() {
  kill -9 `port $1 | tail -n 1 | cut -d' ' -f 5`
}

#Additional Customizations
define_vim_wrappers()

export GITHUB_USER=rschmukler

os=`uname`
if [[ "$os" == 'Darwin' ]]; then
  alias ls="/usr/local/bin/gls --color=auto -hF"
  alias cleardns='sudo dscacheutil -flushcache'
  alias updatedb='sudo /usr/libexec/locate.updatedb'
  alias 'xc5'='sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer'
  alias 'xc6'='sudo xcode-select --switch /Applications/Xcode6-Beta2.app/Contents/Developer'
  alias 'swift'='xcrun swift'
  alias 'vim'='nvim'

  # Add Homebrew Cask options
  export HOMEBREW_CASK_OPTS="--appdir=/Applications"

  # Set ulimit for component
  ulimit -n 10240

  # add docker support
  eval $(docker-machine env)
fi

\alias :q="exit"
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
  sessionName=`echo "$1" | nip "return (line.match(/-/g) || []).length > 1 ? line.match(/\w*\.?\w*$/)[0].replace(/\./g,'-') : line"`
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
alias dm='docker-machine'
alias dip='docker-machine ip'
alias dls='docker-machine ls'
alias dma='docker-machine active'
alias dc='docker-compose'
alias dps='docker ps'

function dme() {
  docker-machine active $1
  eval $(docker-machine env $1 $2)
}

function drm() {
  docker stop "$1"; docker rm "$1";
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

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
