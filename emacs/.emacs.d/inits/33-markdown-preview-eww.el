;;保留
;;markdownをバッファ内プレビュー
;; brew install w3m
;; (use-package w3m
;;   :config
;;   (define-key markdown-mode-map (kbd "\C-c \C-c \C-v")
;;   (lambda ()
;;     (interactive)
;;     (setq html-file-name (concat (file-name-sans-extension (buffer-file-name)) ".html"))
;;     (markdown-export html-file-name)
;;     (if (one-window-p) (split-window))
;;     (other-window 1)
;;     (w3m-find-file html-file-name))
;;   )
;;  )
