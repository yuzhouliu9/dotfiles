# Enable autocomplete for zsh
autoload -Uz compinit
compinit

# Terraform autocomplete
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform


## Set up the prompt
# git info
git_branch_test_color() {
  local ref=$(git symbolic-ref --short HEAD 2> /dev/null)
  if [ -n "${ref}" ]; then
    if [ -n "$(git status --porcelain)" ]; then
      local gitstatuscolor='%F{red}'
    else
      local gitstatuscolor='%F{green}'
    fi
    echo "${gitstatuscolor}(${ref}) "
  else
    echo ""
  fi
}
setopt PROMPT_SUBST
PROMPT='%~ $(git_branch_test_color)%F{none}> '

# add 24h time the right side
#RPROMPT='%D{%k:%M:%S}'


## Set up status bar display
source "${HOME}/.iterm2_shell_integration.zsh"

## activate iTerm2 shell integration
function iterm2_print_user_vars() {
  iterm2_set_user_var awsProfile "$AWS_ACCOUNT"
  # slow but can't find a better solution :(
  #iterm2_set_user_var pythonVirtualenv "$(pyenv version-name)"
  # this command is kind of ugly, but faster than multiple kubectl calls
  iterm2_set_user_var kubeContext "$(kubectl config get-contexts | grep '^\*' | awk '{print $2" : "$5}')"
}

# text color: b2b2b2
# background color: 333333
