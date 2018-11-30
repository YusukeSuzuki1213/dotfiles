;;avy-migemo(画面内のカーソル移動)
(use-package avy-migemo
  :bind (
         ("C-c SPC" . avy-migemo-goto-char-2)
         )
  :config
  (avy-migemo-mode 1)
  )
