;;rainbow-delimiters(()の色を変える)
(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  (rainbow-delimiters-faces)
  )