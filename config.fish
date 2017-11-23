set  --export GOPATH $HOME/go
set  --export PATH /usr/local/go/bin $HOME/.cask/bin $GOPATH/bin /usr/local/bin/peg-multimarkdown $PATH

set fish_theme agnoster
set fish_plugins theme peco

# encoding
set -x LANG ja_JP.UTF-8

# cd したら  ls
function cd
  builtin cd $argv
  ls -a
end

#選択的な過去のデュレクトリ移動を実行
function peco_select_recentd
        z -l | peco --layout=bottom-up | awk '{ print $2 }' | read recentd
        cd $recentd
end

#選択的に過去のコマンドを実行
function peco_select_history
  if test (count $argv) = 0
    set peco_flags --layout=bottom-up
  else
    set peco_flags --layout=bottom-up --query "$argv"
  end
  history|peco $peco_flags|read foo
  if [ $foo ]
    commandline $foo
  else
    commandline ''
  end
end

function fish_user_key_bindings
        bind \cr peco_select_recentd
		bind \ch 'peco_select_history (commandline -b)'
end

alias ls 'ls -a --color=auto'
