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
(setq scroll-preserve-screen-position t)

;; window move
(global-set-key (kbd "M-o") 'other-window)

;; tramp
(require 'tramp)
(setq tramp-default-method "ssh")

;; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

;;; automatic package install
(setq my-el-get-packages
      (append
       '(
         company-mode
         direx
         emmet-mode
         go-mode
         guide-key
         helm
         helm-ag
         helm-ls-git
         markdown-mode
         popwin
         slim-mode
         tomorrow-theme
         undo-tree
         web-mode
         yaml-mode
         yasnippet
         )))
(el-get 'sync my-el-get-packages)

;; theme
(load-theme 'tomorrow-day t)

;; company-mode
(global-company-mode)
(define-key company-active-map (kbd "M-n") nil)
(define-key company-active-map (kbd "M-p") nil)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)

;; helm
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-r") 'helm-recentf)
(global-set-key (kbd "C-x C-o") 'helm-occur)
(helm-mode 1)
(require 'helm-ls-git)

;; yasnippet
(yas-global-mode 1)

;; emmet-mode
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode)

;; popwin
(require 'popwin)
(popwin-mode 1)

;; ruby-mode
(custom-set-variables
 '(ruby-insert-encoding-magic-comment nil))

;; web-mode
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
