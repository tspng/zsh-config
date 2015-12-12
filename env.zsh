# Path
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:$PATH
export MANPATH=/usr/local/share/man:$MANPATH

# Lanugage settings
export LANG='de_CH.UTF-8'
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
JAVA_HOME=`/usr/libexec/java_home`

# Python virtualenv settings
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper_lazy.sh
