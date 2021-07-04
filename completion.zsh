# Add zsh-completions for Homebrew
if type brew &>/dev/null; then
    fpath=("$(brew --prefix)/share/zsh-completions" $fpath)
fi
fpath=("${0:h}/completions" $fpath)

autoload -Uz compinit
compinit

# Enable ability to highlight matches, scroll through long lists and
# a different style of completion menu
zmodload -i zsh/complist

# Enable completion caching, use rehash to clear
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

# Zsh to use the same colors as ls
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}  

# Make 'cd ..<TAB>' completion work
zstyle ':completion:*' special-dirs true

## Make the list prompt friendly
#zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
#
## Make the selection prompt friendly when there are a lot of choices
#zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
#
## Add simple colors to kill
#zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
#
## list of completers to use
zstyle ':completion:*' completer _complete _ignored _correct _approximate

# How many spelling errors will be corrected
zstyle ':completion:*' max-errors 1

#zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
#
#zstyle ':completion:*' menu select=1 _complete _ignored _approximate
#
## insert all expansions for expand completer
## zstyle ':completion:*:expand:*' tag-order all-expansions
# 

## Completion Matching Control
# Exact match first, then allow partial-word Completion:  expand 'f.b' to 'foo.bar', etc., in one go.
zstyle ':completion:*' matcher-list '' 'r:|[._-]=** r:|=**'

## offer indexes before parameters in subscripts
#zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
#
## formatting and messages
#zstyle ':completion:*' verbose yes
#zstyle ':completion:*:descriptions' format '%B%d%b'
#zstyle ':completion:*:messages' format '%d'
#zstyle ':completion:*:warnings' format 'No matches for: %d'
#zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
#zstyle ':completion:*' group-name ''
# 
## ignore completion functions (until the _ignored completer)
#zstyle ':completion:*:functions' ignored-patterns '_*'
#zstyle ':completion:*:scp:*' tag-order files users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
#zstyle ':completion:*:scp:*' group-order files all-files users hosts-domain hosts-host hosts-ipaddr
#zstyle ':completion:*:ssh:*' tag-order users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
#zstyle ':completion:*:ssh:*' group-order hosts-domain hosts-host users hosts-ipaddr
#zstyle '*' single-ignored show
#
#
## ZAW styles
#zstyle ':filter-select:highlight' matched fg=yellow,standout
#zstyle ':filter-select' max-lines 10 # use 10 lines for filter-select
#zstyle ':filter-select' max-lines -10 # use $LINES - 10 for filter-select
#zstyle ':filter-select' rotate-list yes # enable rotation for filter-select
#zstyle ':filter-select' case-insensitive yes # enable case-insensitive search
#zstyle ':filter-select' extended-search no # see below
