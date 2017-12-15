;;--------------------
;;色設定
;;--------------------

;;powerline
(defun powerline-faces()
  (make-face 'mode-line-1-fg)
  (set-face-attribute 'mode-line-1-fg nil
                      :foreground "#282c34" :background "OliveDrab1" :box nil :weight 'bold)
  (make-face 'mode-line-2-fg)
  (set-face-attribute 'mode-line-2-fg nil
                      :foreground "#aaaaaa" :background "#2f343d" :box nil :weight 'bold)
  (make-face 'mode-line-1-arrow)
  (set-face-attribute 'mode-line-1-arrow nil
                      :foreground "#aaaaaa" :background "#3e4451" :box nil :weight 'bold)
  (make-face 'mode-line-2-arrow)
  (set-face-attribute 'mode-line-2-arrow nil
                      :foreground "#aaaaaa" :background "#3e4451" :box nil :weight 'bold)
  )

;;rainbow-delimiters-faces
(defun rainbow-delimiters-faces()
  (set-face-attribute 'rainbow-delimiters-depth-2-face nil
                      :foreground "#ffaf87")
  (set-face-attribute 'rainbow-delimiters-depth-3-face nil
                      :foreground "#fff487")
  (set-face-attribute 'rainbow-delimiters-depth-4-face nil
                      :foreground "#adffa8")
  (set-face-attribute 'rainbow-delimiters-depth-5-face nil
                      :foreground "#89fcff")
  (set-face-attribute 'rainbow-delimiters-depth-6-face nil
                      :foreground "#999eff")
  (set-face-attribute 'rainbow-delimiters-depth-7-face nil
                      :foreground "#ffaaf9")
  )

;;ace-jump-mode-faces
(defun ace-jump-mode-faces()
  (set-face-attribute 'ace-jump-face-background nil
                      :background "#3c3d3e" :foreground "honeydew");;backはzenburn用
  (set-face-attribute 'ace-jump-face-foreground nil
                      :background "Red" :foreground "yellow")
  )

;;mozc
(defun mozc-faces()
  (set-face-attribute 'mozc-cand-overlay-even-face 'nil
                      :background "OliveDrab3" :foreground "black")
  (set-face-attribute 'mozc-cand-overlay-odd-face 'nil
                      :background "OliveDrab3" :foreground "black")
  )

;;whitespace
(defun whitespace-faces()
  (defvar my/bg-color "#3c3d3e")
  (set-face-attribute 'whitespace-trailing nil
                      :background "DeepPink")
  (set-face-attribute 'whitespace-tab nil
                      :background my/bg-color
                      :foreground "LightSkyBlue"
                      :underline t)
  (set-face-attribute 'whitespace-space nil
                      :background my/bg-color
                      :foreground "GreenYellow"
                      :weight 'bold)
  (set-face-attribute 'whitespace-empty nil
                      :background my/bg-color)
  )


;;company
(defun company-faces()
  (set-face-attribute 'company-tooltip nil
                      :foreground "black" :background "OliveDrab3")
  (set-face-attribute 'company-tooltip-common nil
                      :foreground "black" :background "OliveDrab3")
  (set-face-attribute 'company-tooltip-common-selection nil
                      :foreground "white" :background "OliveDrab4")
  (set-face-attribute 'company-tooltip-selection nil
                      :foreground "black" :background "OliveDrab4")
  (set-face-attribute 'company-preview-common nil
                      :background nil :foreground "OliveDrab4" :underline t)
  (set-face-attribute 'company-scrollbar-fg nil
                      :background "orange")
  (set-face-attribute 'company-scrollbar-bg nil
                      :background "OliveDrab4")
  )

