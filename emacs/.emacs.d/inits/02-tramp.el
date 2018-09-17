;;tramp(ssh先のファイルをローカルのemacsで編集)
(use-package tramp
  :config
  (setq tramp-default-method "ssh")
)
