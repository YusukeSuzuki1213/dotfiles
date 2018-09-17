;;undo-tree
(use-package undo-tree
  :config (global-undo-tree-mode)
  :bind
  ("C-c /" . undo-tree-redo)
  ("C-c u" . undo-tree-visualize)
  )