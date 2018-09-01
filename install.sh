#!/bin/sh
ln -nfs ~/dotfiles/emacs/.emacs.d/ ~/.emacs.d
ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
mkdir -p ~/.config/fish
ln -nfs ~/dotfiles/fish/config.fish ~/.config/fish/config.fish

if [ `which code` ]; then
    cat ~/dotfiles/vscode/extensions | while read line
    do
        echo 0 | code --install-extension $line # When never version exsists, inputing '0' is installing that
    done
else
    echo 'Command "code" is not found.'
fi

