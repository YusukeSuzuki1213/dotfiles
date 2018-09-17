;;slime(Common Lisp実行環境)
;;sbclなどLisp処理系のインストールが必要
(setq slime-net-coding-system 'utf-8-unix)
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq load-path (cons (expand-file-name "~/.emacs.d/straight/repos/slime") load-path))
(use-package slime-company)
(use-package slime
  :config
  (slime-setup '(slime-repl slime-fancy slime-banner slime-company))
  )