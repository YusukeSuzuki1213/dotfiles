
;;markdown-mode
;; リアルタイムプレビューは保留(libxml2でのコンパイルをしなければならない)
;;brew install multimarkdownする必要あり
;;テキストスタイル(C-c C-s i/b)
;;リンク(C-c C-l)
;;画像(C-c C-i)
;;見出し#(C-c C-s 数字)
;;html変換してフッファに(C-c C-c m)
;;html変換して保存(C-c C-c e)
;;mdファイル内のリンクへジャンプ(C-c C-o)
;;* (M-RET)
;;*の入れ替え(C-c up/down)
;;コード(C-c C-s c)
;;言語指定コード(C-c C-s C)
;;プレビュー(C-c C-c p)
(use-package markdown-mode
  :commands (markdown-mode gfm-mode w3m)
  :mode(
        ("README\\.md\\'" . gfm-mode)
        ("\\.md\\'" . markdown-mode)
        ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown")
  :bind (:map
         markdown-mode-map
         ("C-c t p" .
          (lambda ()
            (interactive)
            (setq html-file-name (concat (file-name-sans-extension (buffer-file-name)) ".html"))
            (markdown-export html-file-name)
            (if (one-window-p) (split-window))
            (other-window 1)
            (w3m-find-file html-file-name))
          )
         )
  )
