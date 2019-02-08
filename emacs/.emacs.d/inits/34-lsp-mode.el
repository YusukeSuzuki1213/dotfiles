;;lsp(補完、定義ジャンプなど)


(use-package lsp-mode
  :commands lsp
  :config
  (require 'lsp-clients)
  (add-hook 'prog-mode-hook 'lsp))

(use-package company-lsp
  :commands company-lsp
  :config
  (push 'company-lsp company-backends)
  )

(use-package lsp-ui
  :config
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  )


