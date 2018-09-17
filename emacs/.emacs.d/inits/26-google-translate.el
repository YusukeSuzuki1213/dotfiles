;;日本語→英語、英語→日本語変換
(use-package google-translate
:init 
(setq google-translate-translation-directions-alist '(("en" . "ja") ("ja" . "en")) )
:bind
("C-c g" . google-translate-smooth-translate)
)
