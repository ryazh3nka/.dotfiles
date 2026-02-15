;;; packages.el -- configuration for external packages from (m)elpa
;; For general configuration, check config.el

(require 'package)
(require 'use-package)

;;; Add and initialize package archives
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;;; External packages
(setq use-package-always-ensure t)

(use-package gruvbox-theme
  :config (load-theme 'gruvbox))

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package pdf-tools
  :ensure t
  :config (pdf-loader-install)
  (with-eval-after-load 'pdf-cache))

(use-package eshell-syntax-highlighting
  :hook (eshell-mode . eshell-syntax-highlighting-mode))

(use-package magit)
(use-package solarized-theme)
(use-package haskell-mode)
(use-package tuareg)

;;; Built-ins
(setq use-package-always-ensure nil)

(use-package recentf
  :bind ("C-x C-r" . recentf-open-files)
  :custom (recentf-max-menu-items 25)
  :init (recentf-mode 1))

(use-package dired
  :custom
  (dired-listing-switches "-ABhl --sort=extension --group-directories-first")
  (dired-dwim-target t)
  (dired-kill-when-opening-new-dired-buffer t))

(use-package ido
  :init (ido-mode 1)
  :custom
  (ido-enable-flex-matching t)
  (ido-use-virtual-buffers t)
  (ido-everywhere t)
  (read-file-name-completion-ignore-case t))

(use-package eshell
  :custom
  (eshell-directory-name (expand-file-name "eshell/" (or (getenv "XDG_CONFIG_HOME") "~/.config")))
  (eshell-history-file-name (expand-file-name ".eshell_history" (or (getenv "XDG_CACHE_HOME") "~/.cache"))))

(use-package whitespace
  :bind ("C-c w" . whitespace-mode)
  :custom (whitespace-line-column 80))

(use-package man
  :config
  (set-face-attribute 'Man-overstrike nil :inherit font-lock-type-face :bold t)
  (set-face-attribute 'Man-underline nil :inherit font-lock-keyword-face :underline t))

(use-package cc-mode
  :custom (c-default-style "gnu"))

(use-package which-key
  :init (which-key-mode 1))

(provide 'packages)
