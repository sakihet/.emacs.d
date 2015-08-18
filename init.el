;; no backup
(setq make-backup-files nil)
(setq auto-save-default nil)
;; display
(menu-bar-mode 0)
(show-paren-mode t)
(column-number-mode t)
(global-hl-line-mode t)
(custom-set-variables
 '(show-trailing-whitespace t))
(setq-default indent-tabs-mode nil)
;; ui
(delete-selection-mode t)
(defalias 'yes-or-no-p 'y-or-n-p)
(electric-pair-mode 1)
