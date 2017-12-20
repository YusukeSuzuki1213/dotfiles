;;-----------------------------
;;パッケージ設定
;;-----------------------------

;;usepackage
(require 'use-package)

;;evil(Emacsでvimを使う)
;; (use-package evil
;;   :config
;;   (evil-mode 1)
;;   )

;;yatex(tex環境)
(use-package yatex
  :ensure t
  :mode (("\\.tex$" . yatex-mode))
  :bind (("C-c C-t" . YaTeX-typeset-menu))
  :config
  ;; automatically selected according to current language
  ;; (setq YaTeX-japan t)
  ;; change default kanji-code from 2:JIS to 4:UTF-8
   (setq latex-message-kanji-code 4)
   (setq YaTeX-kanji-code 4)
   (setq YaTeX-coding-system 4)
  ;; variables are declared in yatexlib.el
  (setq YaTeX-inhibit-prefix-letter t)
  ;; local dictionary is NOT needed
  (setq YaTeX-nervous nil)
  ;; variables are declared in yatex.el
  (setq tex-command "ptex2pdf -l")
  (setq bibtex-command "pbibtex")
  (setq dvi2-command "open -a Preview")
  (setq tex-pdfview-command "open -a Preview")
  (setq dviprint-command-format "dvipdfmx %s")
  (setq YaTeX-skip-default-reader t)
  (setq YaTeX-simple-messages t)
  ;; (setq YaTeX-template-file "...")
  )

;;hlinum(行番号ハイライト)
(use-package hlinum
  :config
  (hlinum-activate)
  )

;;powerline(モードラインテーマ)
(use-package powerline
  :config
  (powerline-faces)
  (setq powerline-current-separator 'utf-8)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face1 (if active 'mode-line-1-fg 'mode-line-2-fg))
                          (face2 (if active 'mode-line-1-arrow 'mode-line-2-arrow))
                          (separator-left (intern (format "powerline-%s-%s"
                                                          (powerline-current-separator)
                                                          (car powerline-default-separator-dir))))
                          (lhs (list (powerline-raw " " face1)
                                     (powerline-major-mode face1)
                                     (powerline-raw " " face1)
                                     (funcall separator-left face1 face2)
                                     (powerline-buffer-id nil )
                                     (powerline-raw " [ ")
                                     (powerline-raw mode-line-mule-info nil)
                                     (powerline-raw "%*" nil)
                                     (powerline-raw " |")
                                     (powerline-process nil)
                                     (powerline-vc)
                                     (powerline-raw " ]")
                                     ))
                          (rhs (list (powerline-raw "%4l" 'l)
                                     (powerline-raw ":" 'l)
                                     (powerline-raw "%2c" 'l)
                                     (powerline-raw " | ")                                  
                                     (powerline-raw "%6p" )
                                     (powerline-raw " ")
                                     )))
                     (concat (powerline-render lhs)
                             (powerline-fill nil (powerline-width rhs)) 
                             (powerline-render rhs)
                             )
                     )
                   )
                  )
                )
  )

;;; web-mode
(use-package web-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-css-colorization t)
  )

;;rainbow-mode(カラーコードなどのの色を表示)
(use-package rainbow-mode
  :config
  (setq rainbow-html-colors t)
  (setq rainbow-x-colors t)
  (setq rainbow-latex-colors t)
  (setq rainbow-ansi-colors t)
  (add-hook 'prog-mode-hook 'rainbow-mode)
  )

;;rainbow-delimiters(()の色を変える)
(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  (rainbow-delimiters-faces)
  )

;;ace-jump-mode(画面内のカーソル移動)
(use-package ace-jump-mode
  :config
  (global-set-key (kbd "C-c SPC") 'ace-jump-mode)
  (ace-jump-mode-faces)
  )

;;mozc(もずく)(日本語入力の予測変換など)
(use-package mozc
  :config
  (set-language-environment "Japanese")
  (setq default-input-method "japanese-mozc")
  (setq mozc-candidate-style 'overlay)
  (mozc-faces)
  )

;;whitespace(空白可視化)
(use-package whitespace
  :config
  (setq whitespace-style '(face  tabs spaces empty space-mark tab-mark))
  (setq whitespace-display-mappings
        '((space-mark ?\u3000 [?\u25a1])
          (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))
  (setq whitespace-space-regexp "\\(\u3000+\\)");;全角のみ可視化
  (global-whitespace-mode 1)
  (whitespace-faces)
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
(use-package skk
  :config
  (require 'skk-study)
  (setq default-input-method "japanese-skk")
  (setq skk-server-prog "/usr/local/bin/google-ime-skk") 
  (setq skk-server-inhibit-startup-server nil)
  (setq skk-server-host "localhost")
  (setq skk-server-portnum 55100)
  (setq skk-share-private-jisyo t)
  (setq skk-show-candidates-always-pop-to-buffer t) 
  (setq skk-henkan-show-candidates-rows 2)
  (setq skk-dcomp-activate t)
  (setq skk-dcomp-multiple-activate t)
  (setq skk-dcomp-multiple-rows 10)
  (setq skk-egg-like-newline t)
  (setq skk-use-look t)
  (setq skk-search-katakana 'jisx0201-kana)
  (setq skk-delete-implies-kakutei nil)
  :bind
  ("<hiragana-katakana>" . skk-mode)
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

;;helm-c-yasnippet(helmでyasnippet使用)
(use-package helm-c-yasnippet
  :config
  (setq helm-yas-space-match-any-greedy t)
  (yas-global-mode 1)
  (yas-load-directory "~/.emacs.d")
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

;;company(補完機能)
(use-package company
  :config
  (global-company-mode) ; 全バッファで有効にする
  (setq company-idle-delay 0) ; デフォルトは0.5
  (setq company-minimum-prefix-length 2)
  (setq company-selection-wrap-around t)
  (add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))
  (company-faces)
  )

;;python補完
(use-package jedi-core
  :config
  (setq jedi:complete-on-dot t)
  (setq jedi:use-shortcuts t)
  (add-hook 'python-mode-hook 'jedi:setup)
  (add-to-list 'company-backends 'company-jedi)
  )

;;golang
(add-hook 'go-mode-hook
          (lambda ()
            (setq-default)
            (setq space-width 4)
            (setq standard-indent 4)
            (setq indent-tabs-mode nil)
            )
          )

;; (use-package irony
;;   :config
;;   (add-hook 'c-mode-hook 'irony-mode)
;;   (add-hook 'c++-mode-hook 'irony-mode)
;;   (add-hook 'objc-mode-hook 'irony-mode)
;;   (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;;   (add-to-list 'company-backends 'company-irony) ; backend追加
;;   )

;; (use-package company-irony
;;   :after company irony
;;   :config
;;   (setq company-backends (remove 'company-clang company-backends))
;;   (add-to-list 'company-backends 'company-irony)
;;   )

;;dashboard(起動画面カスタマイズ)
;;CUI環境では崩れる可能性あり
(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  )

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

;;helmの設定
(use-package helm
  :config
  (helm-migemo-mode);;helm-find-filesのときはワンスペース必要
  )
(use-package helm-config
  :config
  (helm-mode 1)
  (semantic-mode 1)
  (setq recentf-max-saved-items 100) ;; 最近のファイル100個を保存する
  (setq recentf-exclude '("/TAGS$" "/var/tmp/")) ;;最近のファイルに加えない
  :bind(
  ("M-x" . helm-M-x);;M-xをhelm仕様に
  ("C-c h" . helm-for-files);;色々検索
  ("C-c k" . helm-show-kill-ring);;キルリング履歴
  ("C-x C-f" . helm-find-files);;ファイル検索
  ("C-c f" . helm-occur);;文字列検索
  ("C-c G" . helm-google-suggest);;ブラウザ検索
  ("C-x C-x" . helm-mark-ring);;マークリング履歴
  ;;("C-c j" . helm-imenu);;関数や定義検索
  :map helm-map
     ("<tab>" . helm-execute-persistent-action)
     ("C-z" . helm-select-action)
     )
  )

;;redo+(undo-treeで代用可)
;;(require 'redo+)
;;(global-set-key(kbd "C-c .") 'redo)


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

;;文字コードを設定する
(coding-system-priority-list 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)


;;packages.el ends here
