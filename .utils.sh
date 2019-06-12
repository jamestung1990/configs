#!/bin/bash

alias openutils='e ~/configs/.utils.sh'

# curDir=$(pwd)

applyPythonEnv() {
  local envName="${1:-pydevenv}"
  if [ ! -d "$HOME/.pyenv" ]; then
    mkdir "$HOME/.pyenv"
  fi

  if [ ! -d "$HOME/.pyenv/$envName" ]; then
    python3 -m venv "$HOME/.pyenv/$envName"
  fi
  . "$HOME/.pyenv/$envName/bin/activate"
}

# k8s
setUpK8SConf(){
  envList=$(echo `ls -d /d/James/.kube/env/**`|sed 's/ /:/g')
  export KUBECONFIG="$envList"
}
#setUpK8SConf

setUpK8SPrompt(){
  KUBE_PS1_SYMBOL_ENABLE=true
  KUBE_PS1_SYMBOL_USE_IMG=true
  KUBE_PS1_NS_ENABLE=true
  source ~/.kube/tools/kube-ps1.sh
  PROMPT='$(kube_ps1) '$PROMPT 
  export kubectx=/d/James/.kube/tools/kubectx
  export PATH="$kubectx:/d/Jammes/.local/bin:/d/James/.yarn/bin:$PATH"
}

detachK8SPrompt(){
  export PATH="${PATH#$kubectx}" # remove kubectx from PATH variable
  PROMPT="${PROMPT#$(kube_ps1)} "
  unset kubectx
}
#setUpK8SPrompt
alias applyK8S='setUpK8SConf && setUpK8SPrompt'
alias applyK8SProxy='kubectl proxy --accept-hosts ".*" &'
alias detachK8S='detachK8SPrompt'

# export PYTHONSTARTUP=~/.config/pythonrc.py

# Codi
# # Usage: codi [filetype] [filename]
codi() {
  local syntax="${1:-python}"
  shift
  vim -c \
    "let g:startify_disable_at_vimenter = 1 |\
    set bt=nofile ls=0 noru nonu nornu |\
    hi ColorColumn ctermbg=NONE |\
    hi VertSplit ctermbg=NONE |\
    hi NonText ctermfg=0 |\
    Codi $syntax" "$@"
  }

getK8SDashboardToken() {
  kubectl -n kube-system describe secret \
    $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')
}

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# fzf preview setting
fzfPreviewSetting='[[ $(file --mime {}) =~ binary ]] &&
                   echo {} is a binary file ||
                   (bat --style=numbers --color=always {} ||
                   highlight -O ansi -l {} ||
                   coderay {} ||
                   rougify {} ||
                   cat {}) 2> /dev/null | head -500'
# alias for enable fzf preview
alias openb='vim $(fzf --preview $fzfPreviewSetting)'
export FZF_CTRL_T_OPTS="--preview '$fzfPreviewSetting'"
alias open='fzf'

_fzf_compgen_path() {
  fd --hidden --follow --exclude "pyenv" . "$1"
}


# # For default of docker machine
# # you can change default machine by invoke alias 'applyDocker [docker machine name]'
export DOCKER_CERT_PATH="/mnt/d/James/.docker/machine/machines/default"

#source <(~/.bin/docker-env)
#alias docker-machine="docker-machine.exe"
#alias docker="docker.exe" 
# Native docker client is used instead, less issues with environment variables
#docker-machine.exe start default && # autostart docker-machine
# docker-compose path compatibility
#export COMPOSE_CONVERT_WINDOWS_PATHS=1
#alias docker=docker.exe
#alias docker-compose=docker-compose.exe

# Docker
applyDockerMachine(){ 
  local machine="${1:-default}"
  [ "$(docker-machine status $machine)" = "does not exist" ] && echo "Machine $machine does not exist"
  [ "$(docker-machine status $machine)" = "Stopped" ] && docker-machine start $machine
  docker-machine env --shell zsh $machine
  eval $(docker-machine env --shell zsh $machine)
  export DOCKER_CERT_PATH=/d/James/.docker/machine/machines/$machine
}
#;applyDockerMachine
alias applyDocker='applyDockerMachine'
# [ "$(docker-machine status default)" = "Running" ] && applyDocker default

applySwarm(){ 
  local machine="${1:-default}"
  [ "$(docker-machine status $machine)" = "does not exist" ] && echo "Machine $machine does not exist"
  [ "$(docker-machine status $machine)" = "Stopped" ] && docker-machine start $machine
  docker-machine env --shell zsh --swarm $machine
    eval $(docker-machine env --shell zsh --swarm $machine)
    export DOCKER_CERT_PATH=/d/James/.docker/machine/machines/$machine
}
#;applySwarm'
alias applyDockerSwarm='applySwarm'

# alias applyDockerCert='applyDockerMachineCert() { export DOCKER_CERT_PATH=/d/James/.docker/machine/machines/1$; };applyDockerMachineCert'
# alias enterContainer="docker exec -it "
# alias cfgDocker="configDocker() { DOCKER_COMMAND=`echo -n "$@" | sed -E 's/\/mnt\/([a-z])\//\/\/\1\//g'`; eval /usr/bin/docker $DOCKER_COMMAND; };configDocker"

alias dkpud='docker-compose up -d'
alias dkpr='docker-compose stop && docker-compose rm -f'
alias dklogf='docker-compose logs -f'

# alias drminone="do() { docker rmi `docker images | grep '^<none>' | awk '{print $3}'`; };"
dockerrmi() { docker rmi `docker images --filter "dangling=true" -q --no-trunc`; }
alias dockerrmnone='dockerrmi'

alias vagrantssh="VAGRANT_PREFER_SYSTEM_BIN=1 vagrant ssh"

alias jupyspark="HADOOP_HOME=/mnt/c/opt/hadoop-2.8.0 \
  SPARK_HOME=/mnt/c/opt/spark \
  PATH='$HADOOP_HOME/bin:$SPARK_HOME/bin:$PATH' \
  PYSPARK_DRIVER_PYTHON=jupyter \
  PYSPARK_DRIVER_PYTHON_OPTS='notebook' \
  pyspark"

alias ptpyspark='PYSPARK_PYTHON=python3 PYSPARK_DRIVER_PYTHON=ptpython pyspark'

alias kn='k -n'
alias k8sl=kubectl

#alias k8s='kubectl'
#alias k8sns='kubectl -n kube-system'
# For current user's home directory
alias k8s='kubectl --kubeconfig ~/.kube/config'
alias k8sns='kubectl --kubeconfig ~/.kube/config'

# For current working directory
alias k8sc='kubectl --kubeconfig .kube/config'
alias k8scns='kubectl -n kube-system --kubeconfig .kube/config'

# For specific any kube config file
alias k8scf='kubectl --kubeconfig'
alias k8scfns='kubectl -n kube-system --kubeconfig'

alias kkubeproxy='kill -9 $(pgrep -U james kubectl)'

alias killbyn='killbyname() { echo kill $1 by following command: kill -9 \`pgrep -U $(whoami) $1\`; kill -9 `pgrep -U $(whoami) $1`; };killbyname'

