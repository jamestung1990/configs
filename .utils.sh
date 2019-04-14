#!/bin/bash

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
  KUBE_PS1_SYMBOL_USE_IMG=true
  KUBE_PS1_NS_ENABLE=false
  source ~/.kube/tools/kube-ps1.sh
  PROMPT=$PROMPT'$(kube_ps1) '
}
#setUpK8SPrompt
alias applyK8S='setUpK8SConf && setUpK8SPrompt'
alias applyK8SProxy='kubectl proxy --accept-hosts '.*' &'

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
