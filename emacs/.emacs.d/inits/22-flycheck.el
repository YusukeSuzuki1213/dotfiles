
;;flycheck(シンタックスチェック)
(use-package flycheck
  :config
   (add-hook 'after-init-hook #'global-flycheck-mode)
  )
