;;----------------------------------------
;;基本設定
;;----------------------------------------
;; emacs 起動時は英数モードから始める
(add-hook 'after-init-hook 'mac-change-language-to-us)

;; minibuffer 内は英数モードにする
(add-hook 'minibuffer-setup-hook 'mac-change-language-to-us)

;; [migemo]isearch のとき IME を英数モードにする
(add-hook 'isearch-mode-hook 'mac-change-language-to-us)

;;マーク履歴(helmで代用可)
;;(setq set-mark-command-repeat-pop t);;C-u C-spc C-spc...
(setq mark-ring-max 32);;mark-ringを増やす

;;ポイント履歴
;;(save-place-mode 1)

;;GOPATH
;;(setenv "GOPATH" "/home/yusukesuzuki/go")
;;(add-to-list 'exec-path (expand-file-name "/home/yusukesuzuki/go/bin"))

;;読み込むelsipのパス
(add-to-list 'load-path "~/.emacs.d/themes/")
(load "faces")

;;起動メッセージ非表示
;;(setq inhibiwt-startup-message t)

;;最大化してEmacs起動
(set-frame-parameter nil 'fullscreen 'fullboth)

;; ツールバーを非表示
(tool-bar-mode -1)

;; メニューバーを非表示
(menu-bar-mode -1)

;;クリップボードとキルリやング共有
(setq x-select-enable-clipboard t)

;;背景の透明度
(set-frame-parameter nil 'alpha 90)

;;起動時に画面横2分割
;;(setq inhibit-startup-message t)
;; (setq w (selected-window))
;; (setq w2(split-window w nil t))

;; ;; フォント
;; (custom-set-faces
;;  '(default ((t (:foundry "Source Code Pro" :family "Source Code Pro":height 140)))))
;; ;; Japanese font
;; (set-fontset-font t 'japanese-jisx0208 (font-spec :family "IPAExGothic"))

;;yes/no入力をy/nに
(defalias 'yes-or-no-p 'y-or-n-p)

; 簡単にウインドを切り変える
(define-key global-map (kbd "C-o") 'other-window)

;; バックアップファイル(hoge.txt~)を作らない
(setq backup-inhibited t)
(setq make-backup-files nil)

;;バックアップとオートセーブファイルを~/.emacs.d/backups/へ集める
(add-to-list 'backup-directory-alist
            (cons "." "~/.emacs.d/backups/"))
(setq auto-save-file-name-transforms
     `((".*" ,(expand-file-name "~/.emacs.d/backups/") t)))

;;オートセーブファイル(.saves-0000-user name)を作らない
(setq auto-save-list-file-prefix nil)

;;行、列表示
(global-linum-mode t)
(setq linum-format "%4d|")
(column-number-mode t)

;;タイトルバーにファイルパスを表示
(setq frame-title-format "%f")

;;00-init.elを開く
(global-set-key
(kbd "C-c i 0")
(lambda () (interactive)
(switch-to-buffer (find-file-noselect "~/.emacs.d/inits/00-init.el"))))


;;インストールされたパッケージの内容(package-selected-package)をinit.elに書き込まない
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;;カーソル位置にあるElisp関数や変数の情報をエコーエリアに表示
;(defun elisp-mode-hooks ()
;  "lisp-mode-hooks"
;  (when (require 'eldoc nil t)
;  (setq eldoc-idle-delay 0.2)
;  (setq eldoc-echo-area-use-multiline-p t)
;  (turn-on-eldoc-mode)))

;;日本語切り替え
;(global-set-key (kbd "C-<muhenkan>") 'toggle-input-method)
;(add-hook 'mozc-mode-hook
;  (lambda()
;    (define-key mozc-mode-map (kbd "C-<muhenkan>") 'toggle-input-method)))

;;カーソルの色を入力モードモードごとに変える
(add-hook 'input-method-activate-hook
          (lambda() (set-cursor-color "red")))
(add-hook 'input-method-inactivate-hook
          (lambda() (set-cursor-color "green")))

;;指定行に移動
(define-key global-map (kbd "C-c j") 'goto-line)

;;スクロール
(setq scroll-conservatively 1)
(setq next-screen-context-lines 1)

;; 現在行をハイラト
(global-hl-line-mode t)

;; 対応する括弧をハイライト
(show-paren-mode t)
(setq show-paren-style 'mixed)

;; タブにスペースを使用する
(setq-default tab-width 4 indent-tabs-mode nil)

;;tabの幅
;;(setq-default tab-width 4)

;;複数行選択して文字挿入
(define-key global-map (kbd "C-c  <right>") 'string-rectangle)

;;行を持って移動
(defun move-line-down ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines 1))
    (forward-line)
    (move-to-column col)))
(defun move-line-up ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line )
      (transpose-lines -1))
        (forward-line -1 )
    (move-to-column col)))
(global-set-key (kbd "M-P") 'move-line-up)
(global-set-key (kbd "M-N") 'move-line-down)

;;閉じ括弧補完
(electric-pair-mode t)
(add-to-list 'electric-pair-pairs '(?{ . ?})) ;;{}
;(add-to-list 'electric-pair-pairs '(?< . ?>)) ;;<>

;;閉じ括弧補完のあといい感じで改行
(electric-layout-mode t)
;(add-to-list 'electric-layout-rules '(?{ . after) )

;;行のどの位置からでも行切り取り
(global-set-key (kbd "C-c K")
                (lambda ()
                  (interactive)
                  (move-beginning-of-line 1)
                  (kill-line)
                  (backward-delete-char-untabify 1 nil)
                  (message "%s  を切り取りました。"(substring (car kill-ring-yank-pointer) 0 nil))
                  )
                )

;;行のどの位置からでも行コピー
(global-set-key (kbd "C-c c")
                (lambda()
                  (interactive)
                  (move-beginning-of-line 1)
                  (kill-line)
                  (yank)
                  (message "%s  をコピーしました。"(substring (car kill-ring-yank-pointer) 0 nil))
                  (move-beginning-of-line 1)
                  (forward-line 1)
                  )
                )

;;切り取ったあと行頭だったらバックスペース
(global-set-key (kbd "C-k")
                (lambda()
                  (interactive)
                  (kill-line)
                  (if (bolp)
                      (backward-delete-char-untabify 1 nil)
                    )
                  )
                )

;;M-wをC-.に
(define-key global-map (kbd "C-.") 'kill-ring-save)

;;DeleteをC-h
(global-set-key "\C-h" 'delete-backward-char)

;;¥→ \
(define-key global-map [?¥] [?\\])

;;行番号を指定して範囲選択
(define-key global-map (kbd "C-c s")
  (lambda(linenum)
    (interactive "n何行目まで？：")
    (let (abj)
      (if (< linenum (line-number-at-pos))
          (progn
            (setq abj linenum )
            (forward-line 1)
            )
        (setq abj (+ linenum 1))
        )
        (goto-char (point-at-bol))
        (set-mark-command nil)
        (goto-line  abj)
        )
      )
    )
  
;;カラーテーマ
;;黒系
;;(load-theme 'zenburn t);;caskでDLしてるのでロードパス確認
(load-theme 'tsdh-dark t)
;;(load-theme 'deeper-blue t)
;;(load-theme 'manoj-dark t)
;;(load-theme 'misterioso t)
;;(load-theme 'tango-dark t)
;;(load-theme 'wheatgrass t)
;;(load-theme 'wombat t)

;;白系
;;(load-theme 'adwaita t)

;;起動時に3画面分割してshellを配置
;;(defun split-window-and-run-shell()
;;     (setq w (selected-window))
;;    (setq w3 (split-window w -4 nil))
;;    (select-window w3)
;;    (shell)
;;    (setq w2 (split-window w nil t))
;;    (select-window w))
;;(add-hook 'after-init-hook (lambda()(split-;window-and-run-shell)))

;; 対応するカッコにジャンプ
;(defun match-paren-japanese (arg)
;  "Go to the matching parenthesis."
;  (interactive "p")
; (cond ((looking-at "[([{（｛［「『《〔【〈]") (forward-sexp 1) (backward-char))
;        ((looking-at "[])}）｛］」』》〕】〉]") (forward-char) (backward-sexp 1))
;        (t (message "match-paren-japanese ignored"))))
;(global-set-key [f5] 'match-paren-japanese)

