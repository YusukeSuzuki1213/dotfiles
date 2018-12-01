;;yasnippet(スニペット貼り付け)
(use-package yasnippet
  :bind
  ("C-c Y" . yas-visit-snippet-file)
  ("C-c y" . yas-insert-snippet)
  :config
  (setq yas-snippet-dirs '("~/.emacs.d/straight/repos/yasnippet-snippets/snippets"))
  (yas-global-mode 1)
)
  
