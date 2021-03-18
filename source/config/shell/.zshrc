# General
setopt PROMPT_SUBST
[ -r "$XDG_CONFIG_HOME"/shell/shrc ] && . "$XDG_CONFIG_HOME"/shell/shrc

# Changing directories
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
setopt PUSHD_TO_HOME

# Completion
setopt COMPLETE_ALIASES
setopt COMPLETE_IN_WORD
zstyle ":completion:*" menu select
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"
autoload -U compinit && compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump
_comp_options+=(globdots)

# History
export HISTFILE="/dev/null"
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# Vi mode
bindkey -v
export KEYTIMEOUT=1
zmodload zsh/complist
bindkey -M menuselect "\e" send-break
bindkey -M menuselect "k" vi-up-line-or-history
bindkey -M menuselect "j" vi-down-line-or-history
bindkey -M menuselect "h" vi-backward-char
bindkey -M menuselect "l" vi-forward-char
