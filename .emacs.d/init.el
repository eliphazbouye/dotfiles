;;; init.el --- Summary
;;; Commentary:
;;; This is my init.el config

;; MELPA
(require 'package)
;;; Code:
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; Straight
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq package-enable-at-startup nil) ;; Important to add for Emacs >= 27

;; SETTINGS
(ido-mode t)
(setq mouse-avoidance-mode 'exile)
;; Backup & Auto-Saving
(setq make-backup-files nil)
(setq backup-directory-alist '("." . "~/.saves-emacs"))
(setq auto-save-default nil)

;; Line number
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

;; Tabs
(setq-default indent-tabs-mode nil
	      tab-width 4)

;; Bell
(setq ring-bell-function 'ignore)

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; FONTS
(add-to-list 'default-frame-alist '(font . "Iosevka 12" ))
(set-face-attribute 'default t :font "Iosevka 12" )

(use-package gruber-darker-theme
  :ensure t)
;;(load-file "~/.emacs.d/themes/tokyo-night.el")
(load-theme 'gruber-darker t)

;; MELPA GENERATED SETTINGS
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(copilot dotenv-mode dotenv company-lsp git-gutter-fringe git-gutter lsp-ui lsp-mode web-mode yasnippet-snippets yasnippet flycheck typescript-mode typescript company-box company smex use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Tree-sitter
(require 'treesit)

(use-package smex
  :ensure t
  :bind (("M-x" . smex)
	 ("M-X" . smex-major-mode-commands)))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode))

(use-package yasnippet
  :ensure t
  :init (yas-global-mode t))

(use-package yasnippet-snippets
  :ensure t
  :after (yasnippet))

(use-package company
  :ensure t
  :straight t
  :init (global-company-mode)
  :config
  (setq company-idle-delay 0.3))

(use-package company-box
  :straight t
  :ensure t
  :hook (company-mode . company-box-mode))

(use-package python
  :commands python-mode
  :ensure nil
  :config
  (setq python-indent-guess-indent-offset-verbose nil))

(use-package typescript-mode
  :ensure t
  :mode ("\\.tsx?\\'" . typescript-mode)
  :config
  (setq typescript-indent-level 2))

(use-package php-mode
  :ensure t
  :straight t)

(use-package web-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html\\.twig\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode)))

(use-package json-mode
  :ensure t)

(use-package yaml-mode
  :ensure t)

(use-package dockerfile-mode
  :ensure t)

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
  ((python-mode typescript-mode php-mode js-mode web-modesp) . lsp-deferred)
  (lsp-mode . lsp-lens-mode)
  :commands lsp
  :config
  (setq lsp-log-io nil)
  (setq lsp-restart 'auto-restart)
  (setq lsp-completion-enable t)
  (setq read-process-output-max (* 1024 1024)) ;; 1MB
  (setq lsp-idle-delay 0.5))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-enable nil)
  (setq lsp-ui-doc-header t)
  (setq lsp-ui-doc-include-signature t)
  (setq lsp-ui-doc-border (face-foreground 'default))
  (setq lsp-ui-sideline-show-code-actions t)
  (setq lsp-ui-sideline-delay 0.05))

;; Git
(use-package git-gutter
  :ensure t
  :config
  (setq git-gutter:update-interval 0.02))

(use-package git-gutter-fringe
  :ensure t
  :hook (prog-mode . git-gutter-mode)
  :config
  (define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil 'bottom))

(use-package smartparens-mode
  :ensure smartparens  ;; install the package
  :hook (prog-mode text-mode markdown-mode) ;; add `smartparens-mode` to these hooks
  :config
  ;; load default config
  (require 'smartparens-config))

(use-package dotenv-mode
  :ensure t)
(add-to-list 'auto-mode-alist '("\\.env\\..*\\'" . dotenv-mode))

(use-package copilot
  :straight (:host github :repo "zerolfx/copilot.el" :files ("dist" "*.el"))
  :ensure t
  :hook (prog-mode . copilot-mode)
  :config
  (setq copilot-node-executable "/home/eliphaz/.envm/nodejs/node-v20.9.0-linux-x64/bin/node")
  (define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
  (define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion))

;;; init.el ends here
