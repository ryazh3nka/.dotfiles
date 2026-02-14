;;; packages.el -- configuration for external packages from (m)elpa
;; For built-in packages, see config.el

;;; Add and initialize package archives
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(require 'use-package)
(setq use-package-always-ensure t)

;;; Package management
(use-package gruvbox-theme
 :config (load-theme 'gruvbox))
(use-package solarized-theme)
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))
(use-package pdf-tools
  :config (pdf-loader-install))
(use-package eshell-syntax-highlighting
  :hook (eshell-mode . eshell-syntax-highlighting-mode))
(use-package haskell-mode)
(use-package tuareg)
(use-package magit)

(provide 'packages)
