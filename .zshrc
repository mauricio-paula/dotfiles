export ZSH="/home/doom/.oh-my-zsh"
export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"
export TERM=xterm-256color
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
export BC_ENV_ARGS="$HOME/.bc"

alias ofd="xdg-open ."
alias lc='colorls -1'
alias lca='colorls -1a'
alias lcf='colorls -la'
alias lcg='colorls -la --gs'
alias cls='clear; echo; echo; seq 1 $(tput cols) | sort -R | spark | lolcat; echo; echo'
alias goo='google'
alias ogr='open_command https://github.com/cardoso-thiago/${PWD##*/}'
alias kbatt='upower -i /org/freedesktop/UPower/devices/keyboard_hid_dco2co26oe6o81o9b_battery | grep percentage | lolcat'

plugins=(git docker docker-compose chucknorris alias-finder bgnotify common-aliases copydir copyfile sudo extract web-search z kubectl zsh-autosuggestions)

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_ALIAS_FINDER_AUTOMATIC=true

if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

source $HOME/.fzf/key-bindings.zsh
source $HOME/.fzf/completion.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"

colorscript random
