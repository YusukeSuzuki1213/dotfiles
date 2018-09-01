#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
export TERM=xterm-color
alias ls='ls -a --color'


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

  ls

# Customize to your needs...
