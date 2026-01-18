;; prevents emacs from shitting inside this file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(when (file-exists-p custom-file)
  (load custom-file))

(make-directory (expand-file-name "auto-save/" user-emacs-directory) t)
(setq auto-save-file-name-transforms
      `((".*" ,(concat user-emacs-directory "auto-save/") t))) 

;;; general
;; frame decorations
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; pasting deletes highlighted text
(delete-selection-mode 1)

;; syntax highlighting
(global-font-lock-mode t)

;; numberline
(setq display-line-numbers-type 'relative)
(setq display-line-numbers-width-start t)
(global-display-line-numbers-mode t)
(add-hook 'pdf-view-mode-hook (lambda () (display-line-numbers-mode -1)))
(add-hook 'image-mode-hook (lambda () (display-line-numbers-mode -1)))
(add-hook 'Man-mode-hook (lambda () (display-line-numbers-mode -1)))

;; scrolling out of view
(setq scroll-conservatively 101)
(setq scroll-margin 0)
(setq scroll-step 1)

;; greeter
(setq inhibit-startup-screen t)

;; tabwidth
(setq-default tab-width 8)
(setq-default indent-tabs-mode nil)

;; compile-mode
(global-set-key (kbd "C-c r") #'recompile)

;; autocompletion and stuff
(setq read-file-name-completion-ignore-case t)

(setq ido-enable-flex-matching t)
(setq ido-use-virtual-buffers t)
(setq ido-everywhere t)
(ido-mode 1)

;; recent files
(require 'recentf)
(recentf-mode 1)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
(setq recentf-max-menu-items 25)

;; manpages
(require 'man)
(set-face-attribute 'Man-overstrike nil :inherit font-lock-type-face :bold t)
(set-face-attribute 'Man-underline nil :inherit font-lock-keyword-face :underline t)

;; whitespace-mode
(global-set-key (kbd "C-c w") 'whitespace-mode)

;; wrap indicator
(setq-default fringe-indicator-alist
              (assq-delete-all 'continuation
                               (assq-delete-all 'truncation fringe-indicator-alist)))

;; c-mode
(setq c-default-style "linux")

;; mode line
(column-number-mode t)

;; follow symlinks
(setq vc-follow-symlinks t)

;; dired
(setq dired-listing-switches "-ABhl --sort=extension --group-directories-first")
(setq dired-dwim-target t)
(setq dired-kill-when-opening-new-dired-buffer t)

;;; functions!
;; duplicate current line
(defun rc/duplicate-line ()
  "Duplicate current line"
  (interactive)
  (let ((column (- (point) (point-at-bol)))
        (line (let ((s (thing-at-point 'line t)))
                (if s (string-remove-suffix "\n" s) ""))))
    (move-end-of-line 1)
    (newline)
    (insert line)
    (move-beginning-of-line 1)
    (forward-char column)))

(global-set-key (kbd "C-,") 'rc/duplicate-line)

;; set a font for a new frame
(defun rc/set-default-font ()
  (set-face-attribute 'default nil
                      :font "UbuntuMono Nerd Font"
                      :height 180))

(add-hook 'window-setup-hook #'rc/set-default-font)

(add-hook 'after-make-frame-functions
          (lambda (frame)
            (with-selected-frame frame
              (rc/set-default-font))))

;; kill unused buffers
(defun rc/close-other-buffers ()
  "Kill all buffers except the current one and the *scratch* buffer."
  (interactive)
  (let ((current (current-buffer)))
    (dolist (buf (buffer-list))
      (unless (or (eq buf current)
                  (string-equal (buffer-name buf) "*scratch*"))
        (kill-buffer buf)))))

(global-set-key (kbd "C-c k") #'rc/close-other-buffers)

;; copy files in dired
(defun rc/dired-copy-files-to-clipboard (&optional plain-text)
  "Copy marked files to the clipboard.
With a prefix arg copy plain text; otherwise copy a text/uri-list."
  (interactive "P")
  (let ((files (dired-get-marked-files)))
    (unless (executable-find "wl-copy")
      (user-error "wl-copy not found"))
    (with-temp-buffer
      (dolist (f files)
        (insert (if plain-text
                    (expand-file-name f)
                  (concat "file://" (expand-file-name f)))
                "\n"))
      (call-process-region
       (point-min) (point-max)
       "wl-copy" nil nil nil
       "-t" (if plain-text "text/plain" "text/uri-list")))
    (message "Copied %s as %s"
             (format "%d file(s)%s" (length files) (if (> (length files) 1) "s" ""))
             (if plain-text "plain text" "URI list"))))

(global-set-key (kbd "C-c c") #'rc/dired-copy-files-to-clipboard)

;;; package management
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'pdf-tools)
  (package-install 'pdf-tools))
(pdf-loader-install)

;; ugly hack to silence noncritical errors like
;; Error running timer ‘pdf-cache--prefetch-start’:
;; (wrong-type-argument number-or-marker-p nil)
;; TODO: figure out what the problem is
(with-eval-after-load 'pdf-cache
  (advice-add 'pdf-cache--prefetch-start :around
              (lambda (orig-fun &rest args)
                (ignore-errors
                  (apply orig-fun args)))))

(unless (package-installed-p 'rainbow-delimiters)
  (package-install 'rainbow-delimiters))
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(unless (package-installed-p 'gruvbox-theme)
  (package-install 'gruvbox-theme))
(load-theme 'gruvbox)

(unless (package-installed-p 'magit)
  (package-install 'magit))

(unless (package-installed-p 'haskell-mode)
  (package-install 'haskell-mode))

(unless (package-installed-p 'which-key)
  (package-install 'which-key))
(which-key-mode)
;; (which-key-setup-side-window-bottom)

(unless (package-installed-p 'tuareg)
  (package-install 'tuareg))
  
(add-to-list 'load-path
             "/home/ryazhenka/.opam/default/share/emacs/site-lisp")
(require 'ocp-indent)

;;; colorscheme tweaks
(set-face-attribute 'line-number-current-line nil
                    :inherit 'line-number
                    :background 'unspecified'
                    :foreground "#fabd2f")

(set-face-attribute 'line-number nil
                    :inherit 'default
                    :background 'unspecified'
                    :foreground "#7c6f64")

(set-face-attribute 'ido-subdir nil
                    :inherit 'default
                    :foreground "#fabd2f")
