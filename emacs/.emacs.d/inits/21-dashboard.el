;;dashboard(起動画面カスタマイズ)
;;CUI環境では崩れる可能性あり
(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents  . 20)))
  (add-hook 'window-setup-hook (lambda () (forward-line 8) (forward-char 5)))
)
