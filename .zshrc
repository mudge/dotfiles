# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

fpath=(/usr/local/share/zsh/site-functions $fpath)

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Use the funky menu completion.
zstyle ':completion:*' menu select

# Load colors as $F{grey} doesn't seem to exist.
autoload -Uz colors
colors

export CLICOLOR="Yes" EDITOR="vim" PATH="/usr/local/bin:/usr/local/sbin:/Applications/Postgres.app/Contents/Versions/latest/bin:$HOME/.cargo/bin:${PATH}"

export FZF_DEFAULT_COMMAND="rg --files --hidden --no-ignore-vcs"

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats "%b"
zstyle ':vcs_info:git*' actionformats "%b|%a"

precmd() { vcs_info }

setopt prompt_subst
PROMPT="%{%F{yellow}%}%~%{%f%}> "
RPROMPT='%{%F{red}%}${vcs_info_msg_0_}%{%f%}'

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

source /usr/local/share/chnode/chnode.sh
source /usr/local/share/chnode/auto.sh

alias git=hub

# Key bindings.
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward
bindkey '^[b' backward-word
bindkey '^[f' forward-word
bindkey '^[[3~' delete-char

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

function termsupport_chpwd {
  local PWD_URL="file://$HOSTNAME${PWD// /%20}"
  printf '\e]7;%s\a' "$PWD_URL"
}

chpwd_functions+=(termsupport_chpwd)
