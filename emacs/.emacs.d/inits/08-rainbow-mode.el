;;rainbow-mode(カラーコードなどのの色を表示)
(use-package rainbow-mode
  :config
  (setq rainbow-html-colors t)
  (setq rainbow-x-colors t)
  (setq rainbow-latex-colors t)
  (setq rainbow-ansi-colors t)
  (add-hook 'prog-mode-hook 'rainbow-mode)
  )
