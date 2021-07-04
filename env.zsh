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
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
fi

# TCL/Tk
TK_BIN_PATH=/usr/local/opt/tcl-tk/bin
if [[ -x $TK_BIN_PATH ]]; then
    append_path $TK_BIN_PATH
fi

# TEX Live
TEXLIVE_DIR=/usr/local/texlive/2019
if [[ -d $TEXLIVE_DIR ]]; then
    append_path ${TEXLIVE_DIR}/bin/x86_64-darwin
fi
