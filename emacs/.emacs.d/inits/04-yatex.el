;;保留
;;yatex(tex環境)
(use-package yatex
  :ensure t
  :mode (("\\.tex$" . yatex-mode))
  :bind (("C-c C-t" . YaTeX-typeset-menu))
  :config
  (setq tex-command "/Library/TeX/texbin/platex")
  (setq dvi2-command "open -a TeXShop")
  (setq tex-pdfview-command "open -a TeXShop")
   )
