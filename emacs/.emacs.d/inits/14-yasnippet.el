;;ちょっと保留
;;yasnippet(スニペット登録)
;;スニペットファイルを落としてくる必要あり
(use-package yasnippet-snippets)
(use-package yasnippet
  :bind
  ("C-c Y" . yas-new-snippet)
  :config
  (setq yas-snippet-dirs '("~/.emacs.d/straight/repos/yasnippet-snippets/snippets"))
)
  
