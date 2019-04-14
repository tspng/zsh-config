# PATH stuff
typeset -U path

# Homebrew
if (( $+commands[brew] )); then
    prepend_path /usr/local/sbin
fi

# Local binaries
prepend_path ~/bin

# Language settings
export LANG='en_US.UTF-8'
export LC_CTYPE='en_US.UTF-8'
# CTAGS sorting in VIM/Emacs is better behaved with this in place
export LC_COLLATE=C

# Enable color in grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

if [[ "$OSTYPE" == darwin* ]]; then
    export BROWSER='open'
fi

export EDITOR='vim'
export PAGER='less'
export LESSCHARSET='utf-8'

# Java
JAVA_HOME_PATH=/usr/libexec/java_home
if [[ -x $JAVA_HOME_PATH ]]; then
    export JAVA_HOME=`$JAVA_HOME_PATH`
fi

# Golang
if (( $+commands[go] )); then
    export GOPATH=~/Code/go
    append_path /usr/local/opt/go/libexec/bin
fi

# pyenv
if (( $+commands[pyenv] )); then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# Nvidia CUDA
CUDA_VERSION=10.0
CUDA_DIR=/Developer/NVIDIA/CUDA-${CUDA_VERSION}
if [[ -d $CUDA_DIR ]]; then
    append_path ${CUDA_DIR}/bin
    export DYLD_LIBRARY_PATH=${CUDA_DIR}/lib${DYLD_LIBRARY_PATH:+:${DYLD_LIBRARY_PATH}}
fi
