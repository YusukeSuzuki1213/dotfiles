;; point-history(カーソル履歴をたどる)
(use-package point-history
  :straight (point-history :type git :host github :repo "blue0513/point-history")
  :bind ("C-c p" . point-history-show)
  :config
  (point-history-mode t)
  )
