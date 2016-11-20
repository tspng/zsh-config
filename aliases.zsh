# General
alias psgrep='ps wwaux|grep'

# Mac specific
alias bs='brew services'
alias clipkey='cat ~/.ssh/id_rsa.pub|pbcopy'

# Development stuff
alias activate='source `find . -name activate -type f|head -1)`'
alias rm_pyc='find . -name \*\.pyc -exec rm {} \;'

# Docker
alias dshell_lastest='docker exec -i -t $(docker ps -n1 --format "{{.ID}}") bash -l'
alias denv='eval $(docker-machine env default)'
