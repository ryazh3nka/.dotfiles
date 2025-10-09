;; prevents emacs from shitting inside your config
;; you'll need to load a colorscheme manually
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(when (file-exists-p custom-file)
  (load custom-file))

(make-directory "~/.emacs.d/auto-save/" t)
(setq auto-save-file-name-transforms
      `((".*" ,(concat user-emacs-directory "auto-save/") t)))

;; window decorations
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; numberline
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)
(add-hook 'pdf-view-mode-hook (lambda () (display-line-numbers-mode -1)))

;; greeter
(setq inhibit-startup-screen t)

;; tabwidth
(setq-default tab-width 8)
(setq-default indent-tabs-mode nil)

;; font
(set-face-attribute 'default nil
                    :font "UbuntuMono Nerd Font"
                    :height 180)

;; Wrap indicator
(setq-default fringe-indicator-alist
              (assq-delete-all 'continuation
                               (assq-delete-all 'truncation fringe-indicator-alist)))

;; indentation
(setq-default tab-width 8)

;; pdf viewer
(pdf-tools-install)

;; c code style
(setq c-default-style "linux")
