
autoload -U compinit; compinit

# Autocomplete hidden files
_comp_options+=(globdots)

zmodload zsh/complist

# vi keys for completion menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Complete from both ends of a word.
setopt COMPLETE_IN_WORD

# Move cursor to the end of a completed word.
setopt ALWAYS_TO_END

# Perform path search even on command names with slashes.
setopt PATH_DIRS

# Show completion menu on a successive tab press.
#setopt AUTO_MENU

# Automatically list choices on ambiguous completion.
setopt AUTO_LIST

# If completed parameter is a directory, add a trailing slash.
setopt AUTO_PARAM_SLASH

# Needed for file modification glob modifiers with compinit
setopt EXTENDED_GLOB

# Do not autoselect the first completion entry.
unsetopt MENU_COMPLETE

# Disable start/stop characters in shell editor.
#unsetopt FLOW_CONTROL

# Use caching for completion.
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "$XDG_CACHE_HOME/.zcompcache"

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
unsetopt CASE_GLOB

# Group matches and describe.
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{green}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

# Don't complete unavailable commands.
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
