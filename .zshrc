# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/mnt/d/James/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="honukai"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

ZSH_DISABLE_COMPFIX="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  docker
  autojump
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-completions
  kubectl
  # vi-mode
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

source ~/.shortcuts
source ~/configs/.utils.sh

source ~/.helmrc
source ~/.optrc

if [ -f ~/.dir_colors ]; then
  eval `dircolors ~/.dir_colors`
fi

[[ -s /mnt/d/James/.autojump/etc/profile.d/autojump.sh ]] && \
  source /mnt/d/James/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u
unsetopt BG_NICE

export PATH="/mnt/d/James/.local/bin:$PATH:/mnt/c/ProgramData/Chocolatey/bin:
/mnt/c/Program Files/Oracle/VirtualBox"
export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
export VAGRANT_WSL_WINDOWS_ACCESS_USER_HOME_PATH="/mnt/d/James"

#source <(kubectl completion zsh)
#source ~/.minikube-docker-env

export JAVA_HOME=/usr/lib/jvm/java-8-oracle/
export SPARK_HOME=/mnt/c/opt/spark
export HADOOP_HOME=/mnt/c/opt/hadoop-2.8.0
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
export CASSANDRA_HOME=/mnt/c/opt/cassandra
export HIVE_HOME=/mnt/c/opt/hive
export HADOOP_OPTS="$HADOOP_OPTS -Djava.library.path=$HADOOP_HOME/lib/native"

export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$PATH:$HIVE_HOME/bin:$CASSANDRA_HOME/bin:$SPARK_HOME/bin:
$SPARK_HOME/sbin:$HADOOP_HOME/bin"

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin

#export DOCKER_HOST=tcp://192.168.99.100:2376
#export DISPLAY=:0
#export DISPLAY=127.0.0.1:0

#sudo umount /mnt/d
#sudo mount -t drvfs D: /mnt/d -o metadata
#cd
#pwd
#sudo umount /mnt/c
#sudo mount -t drvfs C: /mnt/C -o metadata
sudo mount --bind /mnt/c /c
sudo mount --bind /mnt/d /d

export GTK_IM_MODULE=hime
export QT_IM_MODULE=hime

# added by Anaconda3 installer
#export PATH="/mnt/d/James/anaconda3/bin:$JAVA_HOME/bin:$PATH"


# # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"


# #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# export SDKMAN_DIR="/mnt/d/James/.sdkman"
# [[ -s "/mnt/d/James/.sdkman/bin/sdkman-init.sh" ]] && \
#   source "/mnt/d/James/.sdkman/bin/sdkman-init.sh"


# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#  # This loads nvm bash_completion
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 



# export http_proxy=http://192.168.1.18:808
# export https_proxy=http://192.168.1.18:808
# export socks_proxy=http://192.168.1.18:1808


