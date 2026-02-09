;;; Frame decorations
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;;; Delete selection
(delete-selection-mode 1)

;;; Syntax highlighting
(global-font-lock-mode 1)

;;; Lockfiles
(setq create-lockfiles nil)

;;; Which-key
(which-key-mode)

;;; Scrolling
(setq scroll-conservatively 101)
(setq scroll-margin 0)
(setq scroll-step 1)

;;; Greeter
(setq inhibit-startup-screen t)

;;; Tabs
;; (setq-default tab-width 8)
(setq-default indent-tabs-mode nil)

;;; Compile-mode
(global-set-key (kbd "C-c r") 'recompile)

;;; Numberline
(setq display-line-numbers-type 'relative)
(setq display-line-numbers-width-start t)

;;; Autocompletion & stuff
(setq read-file-name-completion-ignore-case t)
(setq ido-enable-flex-matching t)
(setq ido-use-virtual-buffers t)
(setq ido-everywhere t)
(ido-mode 1)

;;; Recent files
(require 'recentf)
(recentf-mode 1)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
(setq recentf-max-menu-items 25)

;;; Manpages
(require 'man)
(set-face-attribute 'Man-overstrike nil :inherit font-lock-type-face :bold t)
(set-face-attribute 'Man-underline nil :inherit font-lock-keyword-face :underline t)

;;; Whitespace-mode
(setq whitespace-line-column 100)
(global-set-key (kbd "C-c w") 'whitespace-mode)

;;; Pixel-precise scrolling
(pixel-scroll-precision-mode 1)

;;; Wrap indicator
(setq-default fringe-indicator-alist
              (assq-delete-all 'continuation
                               (assq-delete-all 'truncation fringe-indicator-alist)))

;;; C-mode
(setq c-default-style "gnu")            ; blasphemy!

;;; Mode line
(column-number-mode 1)

;;; Follow symlinks
(setq vc-follow-symlinks t)

;;; Dired
(setq dired-listing-switches "-ABhl --sort=extension --group-directories-first")
(setq dired-dwim-target t)
(setq dired-kill-when-opening-new-dired-buffer t)

;;; Silence non-critical warnings
(with-eval-after-load 'pdf-cache
  (advice-add 'pdf-cache--prefetch-start :around
              (lambda (orig-fun &rest args)
                (ignore-errors
                  (apply orig-fun args)))))

(provide 'config)
