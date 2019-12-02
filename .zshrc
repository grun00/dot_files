export DOTNET_CLI_TELEMETRY_OPTOUT=1
export ZSH="/home/grun/.oh-my-zsh"
export TERM=xterm-256color

#ZSH_THEME="gnzh"
#ZSH_THEME="af-magic"
#ZSH_THEME="agnoster"
#ZSH_THEME="wedisagree"
#ZSH_THEME="aussiegeek"
#ZSH_THEME="xiong-chiamiov-plus" 
ZSH_THEME=powerlevel10k/powerlevel10k

CASE_SENSITIVE="true" 
DISABLE_UPDATE_PROMPT="true" 
export UPDATE_ZSH_DAYS=15 
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true" 
ZSH_CUSTOM=~/.config/zsh_configs 

plugins=(git rvm rails vi-mode vundle web-search zsh_reload)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

export EDITOR='nvim'

# For a full list of active aliases, run `alias`.  
alias sl="exa"
alias ls="exa"
alias cd..="cd .."
alias ps="ps auxf --forest"
alias rs="rails s"
alias rc="rails c"
alias vim="nvim -p"
#alias vi="vim -p"
alias cmatrix="cmatrix -C magenta" 


export PATH=$PATH:/home/grun/.scripts:/home/grun/.rustup:/home/grun/.cargo/bin:/home/grun/.gem/ruby/2.6.4/bin:/root/.gem/ruby/2.6.4/bin:/usr/share/rvm/bin:/home/grun/.rvm/gems/ruby-2.6.3/bin:/home/grun/.rvm/gems/ruby-2.6.3@global/bin:/home/grun/.rvm/rubies/ruby-2.6.3/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/grun/.rvm/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/grun/.vimpkg/bin:/home/grun/.local/lib

#Fuzzy finder
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
export FZF_DEFAULT_OPTS='--height 50% --border'
export FZF_COMPLETION_TRIGGER='çç'
export FZF_DEFAULT_COMMAND='find -L'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

#EXTRA
#History Files
HISTFILE=~/.config/zsh_configs/hist/history
#Vi Mode
bindkey -v
export KEYTIMEOUT=1
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
