;; 範囲選択を賢く
(use-package expand-region
:bind(
  ("C-c ." . er/expand-region)
  ("C-c C-c ." . er/contract-region)
)
:config
(transient-mark-mode t)
)



