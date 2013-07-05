# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Use the funky menu completion.
zstyle ':completion:*' menu select

# Load colors as $F{grey} doesn't seem to exist.
autoload -Uz colors
colors

export CLICOLOR="Yes" EDITOR="vim" JAVA_OPTS="-d32 -client" PATH="$(brew --prefix josegonzalez/php/php53)/bin:/usr/local/share/npm/bin:$HOME/.rbenv/bin:$PATH"

# rbenv and hub initialization.
eval "$(rbenv init -)"
eval "$(hub alias -s)"

setopt prompt_subst
source /usr/local/etc/bash_completion.d/git-prompt.sh

PROMPT="%{%F{yellow}%}%~%{%f%}> "
RPROMPT='%{%F{red}%}$(__git_ps1 "%s")%{%f%}'

# Key bindings.
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward
bindkey '^[b' backward-word
bindkey '^[f' forward-word
bindkey '^[[3~' delete-char
