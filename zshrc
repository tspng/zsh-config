# Uncomment the following line to enable zsh startup function profiling
#zmodload zsh/zprof

ZCONF_BASE=${HOME}/.zsh

source ${ZCONF_BASE}/functions.zsh
source ${ZCONF_BASE}/colors.zsh
source ${ZCONF_BASE}/setopt.zsh
source ${ZCONF_BASE}/terminal.zsh
source ${ZCONF_BASE}/bindkeys.zsh
source ${ZCONF_BASE}/env.zsh
if [[ -a ${ZCONF_BASE}/env_local.zsh ]]; then
    source ${ZCONF_BASE}/env_local.zsh
fi
source ${ZCONF_BASE}/prompt.zsh
source ${ZCONF_BASE}/completion.zsh
source ${ZCONF_BASE}/aliases.zsh
source ${ZCONF_BASE}/history.zsh
source ${ZCONF_BASE}/zsh_hooks.zsh

# Uncomment the following line list profiling results 
#zprof
