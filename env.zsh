# PATH stuff
typeset -U path
prepend_path ~/bin

# Lanugage settings
export LANG='en_US.UTF-8'
export LC_CTYPE='en_US.UTF-8'
# CTAGS Sorting in VIM/Emacs is better behaved with this in place
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
export JAVA_HOME=`/usr/libexec/java_home`

# Golang
export GOPATH=~/Code/go
append_path /usr/local/opt/go/libexec/bin

# CUDA
CUDA_VERSION=10.0
append_path /Developer/NVIDIA/CUDA-${CUDA_VERSION}/bin
export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-10.0/lib${DYLD_LIBRARY_PATH:+:${DYLD_LIBRARY_PATH}}

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi
