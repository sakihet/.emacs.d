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
;; helm
(global-set-key (kbd "M-x") 'helm-M-x)
(helm-mode 1)
;; yasnippet
(yas-global-mode 1)
;; emmet-mode
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
