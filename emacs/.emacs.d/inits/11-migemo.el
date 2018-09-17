;;migemo(日本語をローマ字検索)
;;環境にcmigemoをインストールする必要あり
;;[参考]https://dev.classmethod.jp/tool/emacs-migemo/
(use-package migemo
  :config
  (setq migemo-command "/usr/local/bin/cmigemo")
  (setq migemo-options '("-q" "--emacs" "-i" "\a"))
  (setq migemo-dictionary (expand-file-name "~/.emacs.d/dict/migemo/migemo-dict"))
  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  (migemo-init)
  )