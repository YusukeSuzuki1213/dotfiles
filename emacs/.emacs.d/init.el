;;GUIなら
(if window-system 
    (progn
        (let 
            (
                (bootstrap-file 
                    (concat user-emacs-directory "straight/repos/straight.el/bootstrap.el"))
                (bootstrap-version 3))
            (unless 
                (file-exists-p bootstrap-file)
                (with-current-buffer
                    (url-retrieve-synchronously
"https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
'silent'inhibit-cookies)
                    (goto-char 
                        (point-max))
                    (eval-print-last-sexp)))
            (load bootstrap-file nil 'nomessage))

;;use-packageをインストールする
        (straight-use-package 'use-package)

;;オプションなしで自動的にuse-packageをstraight.elにフォールバックする
        (setq straight-use-package-by-default t)

;;init-loaderをインストール&読み込み
        (use-package init-loader)
        (init-loader-load "~/.emacs.d/inits/")
))

;;CUIなら
(if (not window-system)
    (progn
				;; MACのクリップボードを共有
        (defun copy-from-osx 
            ()
            (shell-command-to-string "pbpaste"))

        (defun paste-to-osx 
            (text &optional push)
            (let 
                (
                    (process-connection-type nil))
                (let 
                    (
                        (proc 
                            (start-process "pbcopy" "*Messages*" "pbcopy")))
                    (process-send-string proc text)
                    (process-send-eof proc))))

        (setq interprogram-cut-function 'paste-to-osx)
        (setq interprogram-paste-function 'copy-from-osx)
				;;M-wをC-.に
				(define-key global-map (kbd "C-.") 'kill-ring-save)
				;; 対応する括弧をハイライト
				(show-paren-mode t)
				(setq show-paren-style 'mixed)
				;;クリップボードとキルリやング共有
				(setq x-select-enable-clipboard t)
				;; バックアップファイル(hoge.txt~)を作らない
				(setq backup-inhibited t)
				(setq make-backup-files nil)

))

;;init.elendshere
