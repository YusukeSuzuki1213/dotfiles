;;ace-jump-mode(画面内のカーソル移動)
(use-package ace-jump-mode
  :config
  (global-set-key (kbd "C-c SPC") 'ace-jump-mode)
  (ace-jump-mode-faces)
  )