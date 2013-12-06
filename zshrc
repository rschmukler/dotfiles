# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh


os=`uname`

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="rs2"

#Enable vim keybindings
bindkey -v

plugins=(brew git heroku osx rvm)
source $ZSH/oh-my-zsh.sh

export PATH=/usr/local/bin:$PATH




## Set up ruby for patched version
RUBY_HEAP_MIN_SLOTS=1000000
RUBY_HEAP_SLOTS_INCREMENT=1000000
RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
RUBY_GC_MALLOC_LIMIT=1000000000
RUBY_HEAP_FREE_MIN=500000



# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)



# WomStreet Variables
export WOMSTREET_EMAIL="ryan@womstreet.com"


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

#Additional Customizations
define_vim_wrappers()

# GitHub Goodness

export GITHUB_USER=rschmukler

if [[ "$os" == 'Darwin' ]]; then
  alias ls="/usr/local/bin/gls --color=auto -hF"
  # Set ulimit for component
  ulimit -n 10240
fi

alias cgrep="grep --color=auto"
alias :q="exit"
alias :wq="exit"
alias pg_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg_stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias mg_start='sudo mongod run --config /usr/local/Cellar/mongodb/2.0.2-x86_64/mongod.conf'
alias updatedb='sudo /usr/libexec/locate.updatedb'
alias spec=rspec
alias cleardns='sudo dscacheutil -flushcache'
alias rehash='hash -r'

# Tmux Aliases
function tn() {
  tmux new -s "$1"
}

function ta() {
  tmux attach -t "$1"
}

function tt() {
  if tmux has-session -t "$1" 2> /dev/null; then
    tmux attach -t "$1"
  else
    tmux_script=~/.dotfiles/files/tmux-scripts/$1
    if [[ -e $tmux_script ]]; then
      zsh "$tmux_script"
    else
      tmux new -s "$1"
    fi
  fi
}

function _tls() {
  reply=( $(tmux list-sessions | cut -d: -f1) )
}

function _tscripts() {
  reply=( $(tmux list-sessions | cut -d: -f1) )
  reply+=( $(ls ~/.dotfiles/files/tmux-scripts) )
}

function tk() {
  tmux kill-session -t $1
}

compctl -K _tls tk
compctl -K _tscripts tt

alias tls="tmux list-sessions";

# Git Aliases
alias 'glp'="git log --graph --pretty=format:'%Cred%h%Creset -%Cblue %an %Creset - %C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gsr='git setref'
alias gdm='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

alias 'lol'='echo "Haha, what is so god damn funny?"'

# Zeus Aliases
alias zrr='zeus rake routes'
alias zdb='zeus rake db:migrate; zeus rake db:test:prepare'
alias zts='zeus test spec'

# Mocha Aliases
alias mtc='jscoverage lib lib-cov; TEST_COV=true mocha --reporter html-cov > lib-cov/report.html'

# Add Homebrew Cask options
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

export NODE_PATH=/usr/local/share/npm/lib/node_modules:./lib

#Load NVM
[[ -s "$HOME/.nvm/nvm.sh" ]] && . /Users/ryan/.nvm/nvm.sh  # This loads NVM
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion # This gives me tab completion

#Load RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.

