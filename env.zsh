# PATH stuff
typeset -U path

# Homebrew for Apple Silicon
if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    prepend_path /opt/homebrew/bin
    prepend_path /opt/homebrew/sbin
fi
# Homebrew for Apple x86_64
if [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
    prepend_path /usr/local/bin
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

# Pyenv
if (( $+commands[pyenv] )); then
    eval "$(pyenv init --path)"
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
fi

# TCL/Tk
TK_BIN_PATH=${HOMEBREW_PREFIX}/opt/tcl-tk/bin
if [[ -x $TK_BIN_PATH ]]; then
    append_path $TK_BIN_PATH
fi

# TEX Live
TEXLIVE_DIR=${HOMEBREW_PREFIX}/texlive/2021
if [[ -d $TEXLIVE_DIR ]]; then
    append_path ${TEXLIVE_DIR}/bin/universal-darwin
fi

# McFly Ctrl-R replacement
if (( $+commands[mcfly] )); then
    export MCFLY_KEY_SCHEME=vim
    export MCFLY_FUZZY=2
    eval "$(mcfly init zsh)"
fi
