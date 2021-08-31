
## PROMPT
# username@host directory
# PROMPT="%n@%m %1d $ "
# PROMPT="%1d $ "

## exports
export PATH="$PATH:/usr/local/opt/python/libexec/bin"
export PATH="$PATH:/Applications/Sublime Text.app/Contents/SharedSupport/bin"
export KUBECONFIG=~/.kube/config.staging:~/.kube/config.prod:~/.kube/config.test

## file handling aliases
alias ls="ls -p"
alias ll="ls -al"
alias ..="cd ../"
alias .2="cd ../../"
alias .3="cd ../../../"
alias .4="cd ../../../../"
alias .5="cd ../../../../../"

## kubernetes aliases
alias kcon="kubectl config get-contexts"
alias kcon-minikube="kubectl config use-context minikube"
alias kcon-test="kubectl config use-context api.test.corp.mongodb.com"
alias kcon-staging="kubectl config use-context api.staging.corp.mongodb.com"
alias kcon-prod="kubectl config use-context api.prod.corp.mongodb.com"

# git aliases
alias glog="git log | less"
alias gstat="git status"

# misc aliases
alias unload_dns="sudo launchctl unload /Library/LaunchDaemons/com.opendns.osx.RoamingClientConfigUpdater.plist"

# kubernetes functions
kns() {
	kubectl config set-context $(kubectl config current-context) --namespace "$1"
}

## evals
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
