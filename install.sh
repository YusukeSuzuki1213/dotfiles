#!/bin/sh
#Emacs
ln -nfs ~/dotfiles/emacs/.emacs.d/ ~/.emacs.d
#Vim
ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
#fish
mkdir -p ~/.config/fish
ln -nfs ~/dotfiles/fish/config.fish ~/.config/fish/config.fish
#zsh 
## zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
zplug install
## prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
## link
ln -sf ~/dotfiles/zsh/.zshenv ~/.zshenv
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/zsh/.zpreztorc ~/.zpreztorc

#vscode
if [ `which code` ]; then
    cat ~/dotfiles/vscode/extensions | while read line
    do
        echo 0 | code --install-extension $line # When never version exsists, inputing '0' is installing that
    done
else
    echo 'Command "code" is not found.'
fi

