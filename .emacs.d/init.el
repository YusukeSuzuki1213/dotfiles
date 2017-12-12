;;-----------------------------------------------------------------------------------------------------------------------
;;基本設定
;;-----------------------------------------------------------------------------------------------------------------------

;;起動メッセージ非表示

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq inhibiwt-startup-message t)

;;最大化してEmacs起動
(set-frame-parameter nil 'fullscreen 'maximized)

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
;;     (setq w (selected-window))
;;    (setq w3 (split-window w -4 nil))
;;    (select-window w3)
;;    (shell)
;;    (setq w2 (split-window w nil t))
;;    (select-window w))
;;(add-hook 'after-init-hook (lambda()(split-;window-and-run-shell)))

;; フォント
(custom-set-faces
 '(default ((t (:foundry "Source Code Pro" :family "Source Code Pro":height 135)))))
;; Japanese font
(set-fontset-font t 'japanese-jisx0208 (font-spec :family "IPAExGothic"))

;;yes/no入力をy/nに
(defalias 'yes-or-no-p 'y-or-n-p)

; 簡単にウインドを切り変える
(define-key global-map (kbd "C-o") 'other-window)

;;Emacs再起動
 (define-key global-map
  (kbd "C-c 3") (kbd "C-u C-u C-u")
  )
;;(global-set-key (kbd "C-c R") (lambda() (interactive)(restart-emacs-)))

;;文字コードを設定する
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

;; バックアップファイル(hoge.txt~)を作らない
(setq backup-inhibited t)
(setq make-backup-files nil)

;;バックアップとオートセーブファイルを~/.emacs.d/backups/へ集める
;(add-to-list 'backup-directory-alist
;             (cons "." "~/.emacs.d/backups/"))
;(setq auto-save-file-name-transforms
;      `((".*" ,(expand-file-name "~/.emacs.d/backups/") t)))

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
(load-theme 'tsdh-dark t)
;(load-theme 'deeper-blue t)
;(load-theme 'manoj-dark t)
;(load-theme 'misterioso t)
;(load-theme 'tango-dark t)
;(load-theme 'wheatgrass t)
;(load-theme 'wombat t)


;;-----------------------------------------------------------------------------------------------------------------------
;;エディタ設定
;;-----------------------------------------------------------------------------------------------------------------------

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
;;(add-to-list 'electric-pair-pairs '(?< . ?>)) ;;<>

;;閉じ括弧補完のあといい感じで改行
(electric-layout-mode t)
(add-to-list 'electric-layout-rules '(?{ . after) )

;;行のどの位置からでも行切り取り
(global-set-key (kbd "C-c x") (lambda () (interactive) (beginning-of-line) (kill-line)))

;;行のどの位置からでも行コピー
(global-set-key (kbd "C-c c") 'copy-whole-line)
(defun copy-whole-line (&optional arg)
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
;        ((looking-at "[])}）｛］」』》〕】〉]") (forward-char) (backward-sexp 1))
;        (t (message "match-paren-japanese ignored"))))
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
;    (message "match-paren-kill-ring-save: %d characters saved" c)))
;(global-set-key [C-f5] 'match-paren-kill-ring-save)

;;-----------------------------------------------------------------------------------------------------------------------
;;パッケージ設定
;;-----------------------------------------------------------------------------------------------------------------------

;;cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;;usepackage
(require 'use-package)

;;org-mode(メモ)
;;M-RET 見出し
;;M-right/left 見出しの*の数
;;C-c C-l リンク作成
;; (setq org-startup-with-inline-images t)
;; (global-set-key (kbd "C-c 1 ") 'org-capture)
;; (global-set-key (kbd "C-c 2") 'org-agenda)
;; ;; org-captureで2種類のメモを扱うようにする
;; (setq org-capture-templates
;;       '(("t" "New TODO" entry
;;          (file+headline "~/.emacs.d/org/todo.org" "予定")
;;          "* TODO %?\n\n")
;;         ("m" "Memo" entry
;;          (file+headline "~/.emacs.d/org/memo.org" "メモ")
;;          "* %U%?\n%i\n%a")))
;; ;; org-agendaでaを押したら予定表とTODOリストを表示
;; (setq org-agenda-custom-commands
;;       '(("a" "Agenda and TODO"
;;          ((agenda "")
;;           (alltodo "")))))
;; ;; org-agendaで扱うファイルは複数可だが、
;; ;; TODO・予定用のファイルのみ指定
;; (setq org-agenda-files '("~.emacs.d/org/todo.org"))
;; ;; TODOリストに日付つきTODOを表示しない
;; (setq org-agenda-todo-ignore-with-date t)
;; ;; 今日から予定を表示させる
;; (setq org-agenda-start-on-weekday nil)


;;yatex(tex環境)
;; (use-package yatex
;;   :ensure t
;;   :mode (("\\.tex$" . yatex-mode))
;;   :bind (("C-c C-t" . YaTeX-typeset-menu))
;;   :config
;;   ;; automatically selected according to current language
;;   ;; (setq YaTeX-japan t)
;;   ;; change default kanji-code from 2:JIS to 4:UTF-8
;;    (setq latex-message-kanji-code 4)
;;    (setq YaTeX-kanji-code 4)
;;    (setq YaTeX-coding-system 4)
;;   ;; variables are declared in yatexlib.el
;;   (setq YaTeX-inhibit-prefix-letter t)
;;   ;; local dictionary is NOT needed
;;   (setq YaTeX-nervous nil)
;;   ;; variables are declared in yatex.el
;;   (setq tex-command "ptex2pdf -l")
;;   (setq bibtex-command "pbibtex")
;;   (setq dvi2-command "open -a Preview")
;;   (setq tex-pdfview-command "open -a Preview")
;;   (setq dviprint-command-format "dvipdfmx %s")
;;   (setq YaTeX-skip-default-reader t)
;;   (setq YaTeX-simple-messages t)
;;   ;; (setq YaTeX-template-file "...")
;;   )

;;whitespace(空白可視化)
(use-package whitespace
  :config
  (setq whitespace-style '(face trailing tabs spaces empty space-mark tab-mark))
  (setq whitespace-display-mappings
        '((space-mark ?\u3000 [?\u25a1])
          (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))
  (setq whitespace-space-regexp "\\(\u3000+\\)");;全角のみ可視化
  (global-whitespace-mode 1)
  (defvar my/bg-color "#232323")
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

;;migemo(日本語をローマ字検索)
;;環境にcmigemoをインストールする必要あり
(use-package migemo
  :config
  (setq migemo-command "cmigemo")
  (setq migemo-options '("-q" "--emacs" "-i" "\a"))
  (setq migemo-dictionary (expand-file-name "~/.emacs.d/dict/migemo/migemo-dict"))
  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  (migemo-init)
  )

;;; ddskk(日本語入力)
(use-package skk-study
  :config
  (setq default-input-method "japanese-skk")
  :bind
  ("C-x C-j" . skk-mode)
  ("C-x j" . skk-auto-fill-mode)
  )

;;markdown-mode
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
  :commands (markdown-mode gfm-mode)
  :mode(
        ("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown")
  )

;;yasnippet(スニペット登録)
(use-package yasnippet
  :bind("C-c Y" . yas-new-snippet)
  )

;;helm-c-yasnippet(helmでyasnippet仕様)
(use-package helm-c-yasnippet
  :config
  (setq helm-yas-space-match-any-greedy t)
  (yas-global-mode 1)
  (yas-load-directory "~/dotfiles/.emacs.d")
  :bind ("C-c y" . helm-yas-complete)
  )

;;; smooth-scroll
(use-package smooth-scroll
  :config (smooth-scroll-mode t)
  )

;;Magit(git管理)
(use-package magit
  :bind
  ("C-c m" . magit-status)
  )

;;multiple-cursors(カーソルを複数に)
(use-package multiple-cursors
  :bind
  ("C->"       . mc/mark-next-like-this)
  ("C-<"       . mc/mark-previous-like-this)
  ("C-c C-<". mc/mark-all-like-this )
  )

;; (use-package irony
;; :config
;; (add-hook 'c-mode-hook 'irony-mode)
;; (add-hook 'c++-mode-hook 'irony-mode)
;; (add-hook 'objc-mode-hook 'irony-mode)
;; (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;; ;(add-to-list 'company-backends 'company-irony) ; backend追加
;; )


;; (use-package company-irony
;;   :after company irony
;;   :config
;;   (setq company-backends (remove 'company-clang company-backends))
;;   (add-to-list 'company-backends 'company-irony)
;;   )


;;company(補完機能)
(use-package company
  :config
  (global-company-mode) ; 全バッファで有効にする
  (setq company-idle-delay 0) ; デフォルトは0.5
  (setq company-minimum-prefix-length 2) ; デフォルトは4
  (setq company-selection-wrap-around t) ; 候補の一番下でさらに下に行こうとすると一番上に戻る
  )

;;dashboard(起動画面カスタマイズ)
;;CUI環境では崩れる可能性あり
(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  )
;;(setq inhibit-startup-message t)
;;(setq dashboard-items '((recents  . 5)))

;;flycheck(シンタックスチェック)
(use-package flycheck
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode)
  (eval-after-load 'flycheck'(add-hook 'flycheck-mode-hook #'flycheck-cask-setup))
  )

;;undo-tree
(use-package undo-tree
  :config (global-undo-tree-mode)
  :bind
  ("C-c /" . undo-tree-redo)
  ("C-c u" . undo-tree-visualize)
  )

(use-package helm
  :config
  (helm-migemo-mode);;helm-find-filesのときはワンスペース必要
  )

;;helmの設定
(use-package helm-config
  :config
  (helm-mode 1)
  (semantic-mode 1)
  (setq recentf-max-saved-items 100) ;; 最近のファイル100個を保存する
  (setq recentf-exclude '("/TAGS$" "/var/tmp/")) ;;最近のファイルに加えない
  :bind
  ("M-x" . helm-M-x);;M-xをhelm仕様に
  ("C-c h" . helm-for-files);;色々検索
  ("C-c k" . helm-show-kill-ring);;キルリング履歴
  ("C-x C-f" . helm-find-files);;ファイル検索
  ("C-c f" . helm-occur);;文字列検索
  ("C-c G" . helm-google-suggest);;ブラウザ検索
  ("C-x C-x" . helm-mark-ring);;マークリング履歴
  ;;("C-c j" . helm-imenu);;関数や定義検索
  (:map helm-find-files-map("C-h" . helm-execute-persistent-action));;タブ補完
  )

;;redo+(undo-treeで代用可)
;;(require 'redo+)
;;(global-set-key(kbd "C-c .") 'redo)
;;
;;package.elの設定(caskで代用可)
;;(when (require 'package nil t)
;;  (add-to-list 'package-archives
;;               '("marmalade" . "http://marmalade-repo.org/packages/"))
;;  (add-to-list 'package-archives
;;               '("ELPA" . "http://tromey.com/elpa/"))
;;  (add-to-list 'package-archives
;;             '("melpa" . "https://melpa.org/packages/")))


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
