#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
export TERM=xterm-color
alias ls='ls -lha --color'

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

 export LANG=ja_JP.UTF-8
  alias zsh-up='source ~/.zshrc'

  # カレントデュレクトリが変化した時のフック
  function chpwd() {
    emulate -L zsh
    ls -a
  }

# zplug
source $HOME/.zplug/init.zsh

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
    echo
fi

# fzf(検索)
zplug "junegunn/fzf-bin", \
  from:gh-r, \
  as:command, \
  rename-to:fzf, \
  use:"*darwin*amd64*"
export FZF_DEFAULT_OPTS='--height 50% --reverse --border'
function select-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history
 
 zplug load




# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/suzukiyusuke/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/suzukiyusuke/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/suzukiyusuke/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/suzukiyusuke/google-cloud-sdk/completion.zsh.inc'; fi
alias em='emacs'
