;;いい感じにウィンドウを出してくれる
(use-package popwin
:config
(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:popup-window-position 'bottom);; ポップアップを画面下に表示
(push '("*Google Translate*") popwin:special-display-config);; google-translate.elの翻訳バッファをポップアップで表示させる
)