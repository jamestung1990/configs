# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="babun"
ZSH_THEME="honukai"

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump zsh-syntax-highlighting web-search history history-substring-search)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

. ~/configs/.shortcuts

[[ -s /cygdrive/d/James/.autojump/etc/profile.d/autojump.sh ]] && source /cygdrive/d/James/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

export M2_HOME=/cygdrive/d/tools/apache-maven-3.3.9
export JAVA_HOME=/cygdrive/c/Program\ Files/Java/jdk1.8.0_121

export PATH="$JAVA_HOME/bin:$M2_HOME/bin:$PATH"

# If you don't want to update Ansible every time set BOOTSTRAP_ANSIBLE_UPDATE=0
export BOOTSTRAP_ANSIBLE_UPDATE=0
source /cygdrive/d/James/ansible-babun-bootstrap/ansible-babun-bootstrap.sh

if [ ! -e ~/.ssh ]
then
  ln -s /cygdrive/c/Users/James/.ssh .
fi

sshAgentPid=${"$(ps -ef|grep ssh-agent|awk '{print $2}'|head -1)":-"0"}
if [ "$sshAgentPid" = "0" ]
then
  echo "Setup ssh agent..."
  eval $(ssh-agent)
  ssh-add ~/.ssh/id_rsa
  echo "ssh agent setup done"
fi

source '/cygdrive/d/James/.babun-docker/setup.sh'

export ANT_HOME="/cygdrive/d/tools/apache-ant-1.10.1"
export PATH="$ANT_HOME/bin:$PATH"

