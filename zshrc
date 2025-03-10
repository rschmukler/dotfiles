################################################################################
# Variables
################################################################################
os=`uname`
export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=~/.zsh_history
export DEVPATH=~/dev
export GOPATH=~/dev/golang
export GPG_TTY=$(tty)
export XDG_CONFIG_HOME=$HOME/.config
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS

alias ecw="emacsclient --c"
export EDITOR=emacsclient
bindkey -e # Explicitly set emacs-style key bindings since it switches to vim
           # mode after setting the editor above.

################################################################################
# ZSH Initialization
################################################################################
autoload -Uz compinit
compinit

################################################################################
# Shell Extensions
################################################################################

# Antibody related config
source ~/dev/rschmukler/dotfiles/zsh_plugins.sh

################################################################################
# Path Fixes
################################################################################
export PATH=~/.cargo/bin:~/.local/bin:/usr/local/bin:$GOPATH/bin:$PATH

if [[ "$os" == 'Darwin' ]]; then
  export PATH=~/Library/Python/3.9/bin:$PATH
  export PATH=/opt/homebrew/opt/openjdk/bin:$PATH
  export LD_LIBRARY_PATH=/usr/local/opt/openssl@1.1/lib:/usr/local/opt/sqlite/lib:/usr/local/lib:$LD_LIBRARY_PATH
  export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"
fi

################################################################################
# Spaceship Config
################################################################################
export SPACESHIP_CHAR_SYMBOL="λ "

export SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  julia         # Julia section
  docker        # Docker section
  aws           # Amazon Web Services section
  #gcloud        # Google Cloud Platform section
  venv          # virtualenv section
  conda         # conda virtualenv section
  dotnet        # .NET section
  kubectl       # Kubectl context section
  terraform     # Terraform workspace section
  ibmcloud      # IBM Cloud section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)


################################################################################
# Dev Functions
################################################################################

function clone() {
  mkdir -p $DEVPATH/$1 && gh repo clone $1 $DEVPATH/$1 && cd $DEVPATH/$1
}


################################################################################
# Port Related Utilities
################################################################################

function port() {
  lsof -i ":${1:-80}"
}

function kport() {
  kill -9 `port $1 | tail -n 1 | cut -d' ' -f 5`
}


################################################################################
# Hero Command Line Tools
################################################################################

if hash exa 2>/dev/null; then
  alias ls=exa
fi
if hash eza 2>/dev/null; then
  alias ls=eza
fi
if hash dua 2>/dev/null; then
  alias du=dua
fi
if hash htop 2>/dev/null; then
  alias top=htop
fi
if hash bat 2>/dev/null; then
  alias less=bat
  alias cat=bat
fi
if hash nvim 2>/dev/null; then
  alias vim=nvim
fi

if hash rg 2>/dev/null; then
  alias grep=rg
fi

if hash keychain 2>/dev/null; then
  eval `keychain --eval --systemd --agents ssh,gpg id_ed25519 8B8A78D65E9DD33EBC0FD04FCE4061A6406FBD44` && emacsclient -e '(keychain-refresh-environment)' > /dev/null
fi

if hash litecli 2>/dev/null; then
  alias sqlite3=litecli
fi

if hash pyenv 2>/dev/null; then
  eval "$(pyenv init -)"
  export PATH=$(pyenv root)/shims:$PATH
fi

if hash procs 2>/dev/null; then
  alias ps=procs
fi

if hash autojump 2>/dev/null; then
  if [ -f /opt/homebrew/etc/profile.d/autojump.sh ]; then
    source /opt/homebrew/etc/profile.d/autojump.sh
  else
    alias j=autojump
  fi
fi

################################################################################
# Git Config
################################################################################

alias 'git clean'='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias glp="git log --graph --pretty=format:'%Cred%h%Creset -%Cblue %an %Creset - %C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gsr='git setref'
alias gdm='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias gprom='git pull --rebase origin master'
alias gcom='git checkout master'
alias gre='git reset --hard'
alias gcan="git commit --amend --no-edit"
alias gpf="git push --force"
alias gpu='git push -u origin "$(git symbolic-ref --short HEAD)"'

################################################################################
# DOOM
################################################################################

if [ -d "$HOME/.emacs.d/bin" ]; then
  PATH=~/.emacs.d/bin:$PATH
fi

################################################################################
# Docker Config
################################################################################

alias dm='TERM=xterm docker-machine'
alias dip='docker-machine ip'
alias dls='docker-machine ls'
alias dma='docker-machine active'
alias dc='docker compose'
alias rc='rancher-compose'
alias dps='docker ps'

function dme() {
  eval $(docker-machine env $1 $2)
}

function drm() {
  docker stop "$1"; docker rm -v "$1";
}


################################################################################
# Darwin Config
################################################################################

if [[ "$os" == 'Darwin' ]]; then
  alias cleardns='sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder; say cache flushed'
fi



################################################################################
# Tmux Config
################################################################################

alias tls="tmux list-sessions";

function tn() {
  tmux new -s "$1"
}

function ta() {
  tmux attach -t "$1"
}

function tt() {
  sessionName=`echo "$1" | nip "return line.split('.').pop()"`
  if ! tmux has-session -t "$sessionName" 2> /dev/null; then
    tmux_script=~/dev/rschmukler/dotfiles/files/tmux-scripts/$1
    if [[ -e $tmux_script ]]; then
      zsh "$tmux_script"
    else
      oldTMUX=$TMUX
      unset TMUX
      tmux new -d -s $sessionName
      export TMUX=$oldTMUX
      unset oldTMUX
      tmux send-keys -t "$sessionName" "j $sessionName; clear" "C-m"
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
  reply+=( $(ls ~/dev/rschmukler/dotfiles/files/tmux-scripts) )
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


################################################################################
# GCloud SDK
################################################################################

if [ -f '/usr/local/share/google-cloud-sdk/path.zsh.inc' ]; then . '/usr/local/share/google-cloud-sdk/path.zsh.inc'; fi

################################################################################
# NVM
################################################################################

if [ -f '/usr/share/nvm/init-nvm.sh' ]; then . '/usr/share/nvm/init-nvm.sh'; fi

################################################################################
# Extended tab completion
################################################################################

if hash kubectl 2>/dev/null; then
  $(eval `kubectl completion zsh`)
fi

################################################################################
# Secrets
################################################################################
source $HOME/dev/rschmukler/dotfiles/zsh/private-env.crypt.sh

################################################################################
# Direnv
################################################################################
if hash direnv 2>/dev/null; then
  eval "$(direnv hook zsh)"
fi

################################################################################
# Kafkactl
################################################################################
if hash kafkactl 2>/dev/null; then
  source <(kafkactl completion zsh)
fi

################################################################################
# Babashka
################################################################################
if hash bb 2>/dev/null; then
  _bb_tasks() {
      local matches=(`bb tasks |tail -n +3 |cut -f1 -d ' '`)
      compadd -a matches
      _files # autocomplete filenames as well
  }
  compdef _bb_tasks bb
fi

################################################################################
# GraalVM
################################################################################

if [ -d '/usr/lib/jvm/java-8-graal/' ]; then
  export GRAALVM_HOME=/usr/lib/jvm/java-8-graal/;
fi
if [ -d '/Library/Java/JavaVirtualMachines/graalvm-ce-java11-19.3.0/Contents/Home' ]; then
  export GRAALVM_HOME=/Library/Java/JavaVirtualMachines/graalvm-ce-java11-19.3.0/Contents/Home;
fi

if [ -d '/usr/lib/jvm/java-11-graalvm/' ]; then
  export GRAALVM_HOME=/usr/lib/jvm/java-11-graalvm/;
fi

################################################################################
# Confluent
################################################################################

if [ -d "$HOME/.confluent/" ]; then
  export CONFLUENT_HOME=$HOME/.confluent;
  export PATH=$CONFLUENT_HOME/bin:$PATH;
fi

################################################################################
# Nix
################################################################################

if [ -f "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then
  source "$HOME/.nix-profile/etc/profile.d/nix.sh";
elif [ -d "$HOME/.nix-profile/bin" ]; then
  export PATH=$HOME/.nix-profile/bin:$PATH;
fi


################################################################################
# Gerbil Scheme
################################################################################

if [ -d "/opt/gerbil-scheme-git" ]; then
  export GERBIL_HOME=/opt/gerbil-scheme-git;
  export GERBIL_GSC=/usr/bin/gambitc;
  export PATH=$GERBIL_HOME/bin:$PATH;
fi



################################################################################
# Startup
################################################################################
if [ -f "$HOME/.config/wpg/sequences" ]; then
  (/bin/cat $HOME/.config/wpg/sequences &)
fi

if hash neofetch 2>/dev/null; then
  clear
  neofetch
fi

# opam configuration
test -r /home/ryan/.opam/opam-init/init.zsh && . /home/ryan/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true


################################################################################
# Direnv / Lorri
################################################################################

if hash direnv 2>/dev/null; then
  eval "$(direnv hook zsh)"
fi
