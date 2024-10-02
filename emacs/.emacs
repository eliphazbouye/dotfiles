(load-file "~/emacs-config/emacs-pm/emacs-pm.el")
(package-initialize)

(setq warning-minimum-level :errors)

;;(pm/require-theme 'kanagawa)
;;(load-theme 'kanagawa-wave t)


(pm/require-theme 'atom-one-dark)
(load-theme 'atom-one-dark t)

(setq backup-directory-alist '(("" . "~/.emacs.d/emacs_backups")))

(setq custom-file "~/emacs-config/emacs-custom.el")
(load custom-file)

(setq inhibit-startup-screen t)

(tool-bar-mode 0)
(scroll-bar-mode 0)
(menu-bar-mode 0)

(global-display-line-numbers-mode 1)
(setq-default display-line-numbers-type 'relative)

(ido-mode 1)

(add-to-list 'default-frame-alist '(font . "Iosevka-18" ))

(pm/require 'magit)

(pm/require 'typescript-mode)
(pm/require 'json-mode)
(pm/require 'rjsx-mode)

;;(global-whitespace-mode 1)
;;(setq  whitespace-toggle-options '(trailing))


(setq-default indent-tabs-mode nil)
(setq typescript-indent-level 2)
