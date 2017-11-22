# dotfiles
This is a repository with my configuration files.

## Installation of dotfiles
```shell
$ cd ~
$ git clone https://github.com/YusukeSuzuki1213/dotfiles.git
$ cd dotfiles
$ install.sh
```

## Emacs
### Installation of Emacs
If you haven't installed Emacs, plese,install latest version of Emacs like the following.(The following is a example of installation.)
```shell
sudo apt-add-repository -y ppa:adrozdoff/emacs
sudo apt-get update
sudo apt-get install emacs25
```

### Installation of Cask
I use Cask to manage Emacs packages. Please,install Cask.
```shell
$ curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
```

### Installation of Emacs packages with Cask
Packages written on .emacs.d/Cask are installed by typing the following.
```shell
$ cd ~/.emacs.d
$ cask install
```

## Vim
I hardly use Vim. So, you don't have to install anything.

## fish
My keybind setting
* Ctrl + r : Selective movement of directory.  
* Ctrl + h : Selective execution of command history.

### Installation of fish
```shell
$ sudo apt-add-repository ppa:fish-shell/release-2
$ sudo apt-get update
$ sudo apt-get install fish
#Changing your default shell to fish.
$ chsh -s /usr/bin/fish
```

### Installation of fisherman
I use fisherman to manage fish plugins.
```shell
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
```

### Installation of fish plugins
Plese,install plugins written on fishfile. You can install `$fisher "plugin name"`
