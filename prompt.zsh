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
zstyle ':vcs_info:*' formats " (%{$fg[yellow]%}%b%{$reset_color%}%m%u%c)"
zstyle ':vcs_info:*' actionformats " (%{$fg[yellow]%}%b%{$reset_color%}) [%a]"
zstyle ':vcs_info:*' nvcsformats "" ""

function prompt_precmd {
    vcs_info
    pyenv_info
}

function pyenv_info {
    if (( ${+PYENV_VERSION} )); then
        pyenv_info="($PYENV_VERSION) "
    else
        pyenv_info=""
    fi
}

function set_prompt {
    setopt prompt_subst

    # Load required functions.
    autoload -Uz vcs_info
    autoload -Uz add-zsh-hook

    # Add hook for calling vcs_info before each command.
    add-zsh-hook precmd prompt_precmd

    # Color settings
    local name_color="%{$fg[blue]%}"

    if [[ $UID == 0 ]]; then
    # Highlight root user
        local name_color="%{$fg_bold[red]%}"
    fi
    local max_path_chars=35

    # Make sure to escape the $ for pyenv_info, so that the string
    # ${pyenv_info} will used. `prompt_subst` will then re-evaluate
    # the string ${pyenv_info} on every new line.
    PROMPT="\${pyenv_info}[${name_color}%n%{$reset_color%}@%m"'${vcs_info_msg_0_}'"]%b%f "
    RPROMPT="[%{$fg_bold[blue]%}%${max_path_chars}<...<%~%<<%{$reset_color%}]"
}

set_prompt
