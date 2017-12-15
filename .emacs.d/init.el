;;----------------
;;init.el --->caskとinit-loderをrequire
;;~/.emacs.d/inits/00-init.el ---> 基本設定
;;~/.emacs.d/inits/01-package.el ---> パッケージ設定
;;~/.emacs.d/inits/faces.el ---> 色設定
;;---------------

(package-initialize)

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(require 'init-loader)
(init-loader-load "~/.emacs.d/inits/")

;;init.el ends here
