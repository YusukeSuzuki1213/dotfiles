;;helmの設定
(use-package helm
  :config
  (helm-migemo-mode);;helm-find-filesのときはワンスペース必要
  (setq recentf-max-saved-items 100) ;; 最近のファイル100個を保存する
  (setq recentf-exclude '("/TAGS$" "/var/tmp/")) ;;最近のファイルに加えない
  :bind(
  ("M-x" . helm-M-x);;M-xをhelm仕様に
  ("C-c h" . helm-for-files);;色々検索
  ("C-c k" . helm-show-kill-ring);;キルリング履歴
  ("C-x C-f" . helm-find-files);;ファイル検索;;rename(M-R) delete(M-D)copy(M-C)
  ;;("C-s" . helm-occur);;文字列検索
  ("C-c G" . helm-google-suggest);;ブラウザ検索
  ("C-x C-x" . helm-mark-ring);;マークリング履歴
  ("C-c i m" . helm-imenu);;関数や定義検索
  :map helm-map
     ("<tab>" . helm-execute-persistent-action)
     ("C-z" . helm-select-action)
     )
  )
