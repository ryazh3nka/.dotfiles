(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package gruvbox-theme
  :config (load-theme 'gruvbox))
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))
(use-package magit)
(use-package pdf-tools
  :config (pdf-loader-install))
(use-package haskell-mode)
(use-package tuareg)

(provide 'packages)
