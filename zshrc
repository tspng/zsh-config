ZCONF_BASE=${HOME}/.zsh

source ${ZCONF_BASE}/colors.zsh
source ${ZCONF_BASE}/setopt.zsh
source ${ZCONF_BASE}/env.zsh
if [[ -a ${ZCONF_BASE}/env_local.zsh ]]; then
    source ${ZCONF_BASE}/env_local.zsh
fi
source ${ZCONF_BASE}/prompt.zsh
source ${ZCONF_BASE}/completion.zsh
source ${ZCONF_BASE}/aliases.zsh
source ${ZCONF_BASE}/bindkeys.zsh
source ${ZCONF_BASE}/functions.zsh
source ${ZCONF_BASE}/history.zsh
source ${ZCONF_BASE}/zsh_hooks.zsh

precmd() {
  if [[ -n "$TMUX" ]]; then
    tmux setenv "$(tmux display -p 'TMUX_PWD_#D')" "$PWD"
  fi
}
