#
# A simple theme that displays only relevant information.
#
# Authors:
#   Thomas Spreng <thomas.spreng@gmail.com>
#
# Features:
#   - One line.
#   - Path information in the right prompt.
#   - Shows the current branch name if vcs
#   - Shows if logged in as root or not.
#

# Set vcs_info parameters.
zstyle ':vcs_info:*' enable git svn hg
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:*' formats "(%{$fg[yellow]%}%b%{$reset_color%}%m%u%c) "
zstyle ':vcs_info:*' actionformats "(%{$fg[yellow]%}%b%{$reset_color%}) [%a] "
zstyle ':vcs_info:*' nvcsformats "" ""

function prompt_precmd {
    vcs_info
    pyenv_info
}

function pyenv_info {
    if (( ${+PYENV_VERSION} )); then
        pyenv_info="%F{blue}$PYENV_VERSION%f "
    else
        pyenv_local=$(pyenv local 2> /dev/null)
        if [ $? -eq 0 ]; then
            pyenv_info="%F{blue}${pyenv_local}%f "
        else
            pyenv_info=""
        fi
    fi
}

function set_prompt {
    setopt prompt_subst

    # Load required functions.
    autoload -Uz vcs_info
    autoload -Uz add-zsh-hook

    # Add hook for calling vcs_info before each command.
    add-zsh-hook precmd prompt_precmd

    local max_path_chars=35
    local return_status="%(?..%F{red}➜ %?%f )"
    local prompt_symbol="%(!.%F{red}#%f.%B>%b) "
    local prompt_host=""
    if [[ -n "$SSH_CONNECTION" ]]; then
        prompt_host="%B@%b%m "
    fi
    # Make sure to escape the $ for pyenv_info and vcs_info_msg_0_,
    # so that the string ${pyenv_info} will used. `prompt_subst` will then
    # re-evaluate the string ${pyenv_info} on every new line.

    PROMPT="${return_status}\${pyenv_info}${prompt_host}\${vcs_info_msg_0_}${prompt_symbol}"
    RPROMPT="[%{$fg_bold[blue]%}%${max_path_chars}<...<%~%<<%{$reset_color%}]"
}

set_prompt
