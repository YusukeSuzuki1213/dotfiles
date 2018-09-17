;;company(補完機能)
(use-package company
  :config
  (global-company-mode) ; 全バッファで有効にする
  (setq company-idle-delay 0) ; デフォルトは0.5
  (setq company-minimum-prefix-length 2)
  (setq company-selection-wrap-around t)
  ;(add-hook 'go-mode-hook (lambda ()
  ;                          (set (make-local-variable 'company-backends) '(company-go))
  ;                          (company-mode)))
  (company-faces)
  )
