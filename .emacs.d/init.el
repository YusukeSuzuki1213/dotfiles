;;------------------------------------------------------------------------------------------------------------------------------------------------
;;基本設定
;;------------------------------------------------------------------------------------------------------------------------------------------------

;;起動メッセージ非表示
(setq inhibiwt-startup-message t)

;; ツールバーを非表示
(tool-bar-mode -1)

;; メニューバーを非表示
(menu-bar-mode -1)

;;クリップボードとキルリング共有
(setq x-select-enable-clipboard t)

;;背景の透明度
(set-frame-parameter nil 'alpha 90)

;;起動時に画面横2分割
(setq inhibit-startup-message t)
(setq w (selected-window))
(setq w2 (split-window w nil t))

;;起動時に3画面分割してshellを配置
;;(defun split-window-and-run-shell()
;;	(setq w (selected-window))
;;	(setq w3 (split-window w -4 nil))
;;	(select-window w3)
;;	(shell)
;;	(setq w2 (split-window w nil t))
;;	(select-window w))
;;(add-hook 'after-init-hook (lambda()(split-;window-and-run-shell)))

;; フォント
(custom-set-faces
 '(default ((t (:foundry "Source Code Pro" :family "Source Code Pro")))))
;; Japanese font
(set-fontset-font t 'japanese-jisx0208 (font-spec :family "IPAExGothic"))

;;yes/no入力をy/nに
(defalias 'yes-or-no-p 'y-or-n-p)

; 簡単にウインドを切り変える
(define-key global-map (kbd "C-o") 'other-window)

;;文字コードを設定する
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

;; バックアップファイル(hoge.txt~)を作らない
(setq backup-inhibited t)
(setq make-backup-files nil)

;;バックアップとオートセーブファイルを~/.emacs.d/backups/へ集める
;(add-to-list 'backup-directory-alist
;			 (cons "." "~/.emacs.d/backups/"))
;(setq auto-save-file-name-transforms
;	  `((".*" ,(expand-file-name "~/.emacs.d/backups/") t)))

;;オートセーブファイル(.saves-0000-user name)を作らない
(setq auto-save-list-file-prefix nil)

;;オートセーブファイル作成までの秒間隔
;(setq auto-save-timeout 50)

;; 終了時にオートセーブファイルを消す
;;(setq delete-auto-save-files t)

;;行、列表示
(global-linum-mode t)
(setq linum-format "%4d|")
(column-number-mode t)

;;タイトルバーにファイルパスを表示
(setq frame-title-format "%f")

;;init.elを開く
(global-set-key
(kbd "C-c i")
(lambda () (interactive)
(switch-to-buffer (find-file-noselect "~/.emacs.d/init.el"))))

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

;;カラーテーマ
;(load-theme 'tsdh-dark t)
(load-theme 'deeper-blue t)
;(load-theme 'manoj-dark t)
;(load-theme 'misterioso t)
;(load-theme 'tango-dark t)
;(load-theme 'wheatgrass t)
;(load-theme 'wombat t)


;;------------------------------------------------------------------------------------------------------------------------------------------------
;;エディタ設定
;;------------------------------------------------------------------------------------------------------------------------------------------------

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
(add-to-list 'electric-pair-pairs '(?< . ?>)) ;;<>

;;閉じ括弧補完のあといい感じで改行
(electric-layout-mode t)
(add-to-list 'electric-layout-rules '(?{ . after) )

;;行のどの位置からでも行切り取り
(global-set-key (kbd "C-c x") (lambda () (interactive) (beginning-of-line) (kill-line)))

;;行のどの位置からでも行コピー
(global-set-key (kbd "C-c c") 'copy-whole-line)
(defun copy-whole-line (&optional arg)
  "Copy current line."
  (interactive "p")
  (or arg (setq arg 1))
  (if (and (> arg 0) (eobp) (save-excursion (forward-visible-line 0) (eobp)))
	  (signal 'end-of-buffer nil))
  (if (and (< arg 0) (bobp) (save-excursion (end-of-visible-line) (bobp)))
	  (signal 'beginning-of-buffer nil))
  (unless (eq last-command 'copy-region-as-kill)
	(kill-new "")
	(setq last-command 'copy-region-as-kill))
  (cond ((zerop arg)
		 (save-excursion
		   (copy-region-as-kill (point) (progn (forward-visible-line 0) (point)))
		   (copy-region-as-kill (point) (progn (end-of-visible-line) (point)))))
		((< arg 0)
		 (save-excursion
		   (copy-region-as-kill (point) (progn (end-of-visible-line) (point)))
		   (copy-region-as-kill (point)
								(progn (forward-visible-line (1+ arg))
									   (unless (bobp) (backward-char))
									   (point)))))
		(t
		 (save-excursion
		   (copy-region-as-kill (point) (progn (forward-visible-line 0) (point)))
		   (copy-region-as-kill (point)
								(progn (forward-visible-line arg) (point))))))
    (message (substring (car kill-ring-yank-pointer) 0 -1)))

;; 対応するカッコにジャンプ
;(defun match-paren-japanese (arg)
;  "Go to the matching parenthesis."
;  (interactive "p")
; (cond ((looking-at "[([{（｛［「『《〔【〈]") (forward-sexp 1) (backward-char))
;		((looking-at "[])}）｛］」』》〕】〉]") (forward-char) (backward-sexp 1))
;		(t (message "match-paren-japanese ignored"))))
;(global-set-key [f5] 'match-paren-japanese)

;; 対応するカッコまでをコピー
;(defun match-paren-kill-ring-save ()
;  "Copy region from here to the matching parenthesis to kill ring and save."
;  (interactive)
;  (set-mark-command nil)
;  (match-paren-japanese nil)
;  (forward-char)
;  (exchange-point-and-mark)
;  (clipboard-kill-ring-save (mark) (point))
;  (let ((c (abs (- (mark) (point)))))
;	(message "match-paren-kill-ring-save: %d characters saved" c)))
;(global-set-key [C-f5] 'match-paren-kill-ring-save)

;;------------------------------------------------------------------------------------------------------------------------------------------------
;;パッケージ設定
;;------------------------------------------------------------------------------------------------------------------------------------------------

;;cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;;yasnippet(スニペット登録)
(require 'yasnippet)
(require 'helm-c-yasnippet)
(setq helm-yas-space-match-any-greedy t)
(global-set-key (kbd "C-c s") 'helm-yas-complete)
(yas-global-mode 1)
(yas-load-directory "~/dotfiles/.emacs.d")

;;; smooth-scroll
(require 'smooth-scroll)
(smooth-scroll-mode t)

;;Magit(git管理)
(require 'magit)
(global-set-key (kbd "C-c m") 'magit-status)

;;multiple-cursors(カーソルを複数に)
(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;;company(補完機能)
(package-initialize)
(global-company-mode) ; 全バッファで有効にする
(setq company-idle-delay 0) ; デフォルトは0.5
(setq company-minimum-prefix-length 2) ; デフォルトは4
(setq company-selection-wrap-around t) ; 候補の一番下でさらに下に行こうとすると一番上に戻る

;;dashboard(起動画面カスタマイズ)
;;CUI環境では崩れる可能性あり
(require 'dashboard)
;;(setq inhibit-startup-message t)
(dashboard-setup-startup-hook)			
;;(setq dashboard-items '((recents  . 5)))

;;flycheck(シンタックスチェック)
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-cask-setup))

;;undo-tree(C-x u)
(require 'undo-tree)
(global-undo-tree-mode)
(global-set-key (kbd "C-c .") 'undo-tree-redo)

;;helmの設定
(require 'helm-config)
(helm-mode 1)
(semantic-mode 1)
(global-set-key (kbd "C-c h") 'helm-for-files);;色々検索
(global-set-key (kbd "C-c k") 'helm-show-kill-ring);;キルリング履歴
(global-set-key (kbd "C-x C-f") 'helm-find-files);;ファイル検索
(global-set-key (kbd "C-c j") 'helm-imenu);;関数や定義検索
(global-set-key (kbd "C-c f") 'helm-occur);;文字列検索
(global-set-key (kbd "C-c b") 'helm-google-suggest);;ブラウザ検索
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action);;タブ補完
(setq recentf-max-saved-items 100) ;; 最近のファイル100個を保存する
(setq recentf-exclude '("/TAGS$" "/var/tmp/")) ;;最近のファイルに加えない

;;redo+(undo-treeで代用可)
;;(require 'redo+)
;;(global-set-key(kbd "C-c .") 'redo)
;;
;;package.elの設定(caskで代用可)
;;(when (require 'package nil t)
;;  (add-to-list 'package-archives
;;			   '("marmalade" . "http://marmalade-repo.org/packages/"))
;;  (add-to-list 'package-archives
;;			   '("ELPA" . "http://tromey.com/elpa/"))
;;  (add-to-list 'package-archives
;;			 '("melpa" . "https://melpa.org/packages/")))


;;;;Elisp配置用のディレクトリを作成
;;(when (< emacs-major-version 23)
;;  (defvar user-emacs-directory "~/.emacs.d/"))

;;;; load-path を追加する関数を定義
;;(defun add-to-load-path (&rest paths)
;;  (let (path)
;;    (dolist (path paths paths)
;;      (let ((default-directory
;;              (expand-file-name (concat user-emacs-directory path))))
;;        (add-to-list 'load-path default-directory)
;;        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
;;            (normal-top-level-add-subdirs-to-load-path))))))
;;
;;;; 引数のディレクトリとそのサブディレクトリをload-pathに追加
;;(add-to-load-path "elisp" "conf" "public_repos")

;;;;init-loader.el(分割した設定ファイルを自動的に読み込むための)を利用する
;;(require 'init-loader)
;;(init-loader-load "~/.emacs.d/conf");設定ファイルがあるデュレクトリを選択

;;;;auto-installの設定
;;(when (require 'auto-install)
;;  ;;インストールデュレクトリを設定する
;;  (setq auto-install-directory "~/.emacs.d/elisp/")
;;  ;;Emacswikiに登録されているelispの名前を取得する
;;  (auto-install-update-emacswiki-package-name t)
;;  ;;install-elispの関数を利用可能にする
;;  (auto-install-compatibility-setup))
