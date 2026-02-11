;; package
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; (package-refresh-contents)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(company queue rust-mode vertico))
 '(show-trailing-whitespace t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; backup
(setq make-backup-files nil)
(setq auto-save-default nil)

;; theme
(load-theme 'modus-operandi t)

;; display
(menu-bar-mode 0)
(global-display-line-numbers-mode t)
(column-number-mode t)
(global-hl-line-mode t)

;; ui
(delete-selection-mode t)
(electric-pair-mode 1)
(setq scroll-preserve-screen-position t)
(setq scroll-conservatively 1)
(setq scroll-margin 5)

;; my function
(defun reload-init-el ()
  (interactive)
  (load-file user-init-file)
  (message "Reloaded init.el"))
(defun indent-whole-buffer ()
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max))
    )
  )

;; company
(use-package company
  :ensure t
  :init
  (global-company-mode)
  :config
  (setq company-idle-delay 0
	company-minimum-prefix-length 1))

;; vertico
(use-package vertico
  :custom
  (vertico-count 20)
  :init
  (vertico-mode))

;; savehist
(use-package savehist
  :init
  (savehist-mode))

;; web-mode
(use-package web-mode
  :ensure t
  :mode (("\\.ts\\'" . web-mode)
         ("\\.js\\'" . web-mode)
         ("\\.mjs\\'" . web-mode)
         ("\\.tsx\\'" . web-mode)
         ("\\.jsx\\'" . web-mode))
  :config
  (setq web-mode-content-types-alist
	'(("jsx" . "\\.js[x]?\\'"))))
