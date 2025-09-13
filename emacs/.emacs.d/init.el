; prevents emacs from shitting inside your config
; you'll need to load a colorscheme manually
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(when (file-exists-p custom-file)
        (load custom-file))

; window decorations
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

; numberline
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

; greeter
(setq inhibit-startup-screen t)

; font
(set-face-attribute 'default nil
        :font "UbuntuMono Nerd Font"
        :height 180)

; wrap indicator
(setq-default fringe-indicator-alist
        (assq-delete-all 'continuation
                (assq-delete-all 'truncation fringe-indicator-alist)))

; indentation
(setq-default tab-width 8)

; pdf viewer
(pdf-tools-install)
