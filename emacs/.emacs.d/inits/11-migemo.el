;;migemo(日本語をローマ字検索)
;;環境にcmigemoをインストールする必要あり
;;[参考]https://dev.classmethod.jp/tool/emacs-migemo/
(use-package migemo
  :config
  (setq migemo-command "/usr/local/bin/cmigemo")
  (setq migemo-options '("-q" "--emacs"))
  ;; Set your installed path
  (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  (migemo-init)
  )
