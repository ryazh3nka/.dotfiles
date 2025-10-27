;; prevents emacs from shitting inside your config
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(when (file-exists-p custom-file)
  (load custom-file))

(make-directory (expand-file-name "auto-save/" user-emacs-directory) t)
(setq auto-save-file-name-transforms
      `((".*" ,(concat user-emacs-directory "auto-save/") t))) 

;; window decorations
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; pasting deletes highlighted text
(delete-selection-mode 1)

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

;; autocompletion and stuff
(setq read-file-name-completion-ignore-case t)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(require 'electric)
(electric-pair-mode 1)
(global-set-key (kbd "M-\"") (lambda () (interactive) (insert "\"")))
(global-set-key (kbd "M-'") (lambda () (interactive) (insert "'")))
(global-set-key (kbd "M-(") (lambda () (interactive) (insert "(")))
(global-set-key (kbd "M-)") (lambda () (interactive) (insert ")")))

;; wrap indicator
(setq-default fringe-indicator-alist
              (assq-delete-all 'continuation
                               (assq-delete-all 'truncation fringe-indicator-alist)))

;; indentation
(setq-default tab-width 8)

;; cmode kernel coding style
(setq-default tab-width 8)
(setq c-default-style "linux")

(custom-set-faces
 '(line-number ((t (:inherit default :background nil :foreground "#7c6f64"))))
 '(line-number-current-line ((t (:inherit line-number :background nil :foreground "#fabd2f")))))

; follow symlinks
(setq vc-follow-symlinks t)

;; functions!
; duplicate current line
(defun my/duplicate-line ()
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

(global-set-key (kbd "C-,") 'my/duplicate-line)

; copy files in dired
(defun my/dired-copy-files-to-clipboard (&optional plain-text)
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

(global-set-key (kbd "C-c w") #'my/dired-copy-files-to-clipboard)

;; package management
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'pdf-tools)
  (package-install 'pdf-tools))
(pdf-loader-install)

;; ugly hack to silence noncritical warnings like
;; Error running timer ‘pdf-cache--prefetch-start’:
;; (wrong-type-argument number-or-marker-p nil)
;; TODO: figure out what the problem is
(with-eval-after-load 'pdf-cache
  (advice-add 'pdf-cache--prefetch-start :around
              (lambda (orig-fun &rest args)
                (ignore-errors
                  (apply orig-fun args)))))

(unless (package-installed-p 'gruvbox-theme)
  (package-install 'gruvbox-theme))
(load-theme 'gruvbox)

(unless (package-installed-p 'magit)
  (package-install 'magit))

;; colorscheme tweaks
(set-face-attribute 'ido-subdir nil
                    :foreground "#bdae93"
                    :weight 'bold)

(set-face-attribute 'ido-first-match nil
                    :foreground "#fabd2f"
                    :weight 'normal)

(set-face-attribute 'ido-only-match nil
                    :foreground "#fabd2f"
                    :weight 'normal)

(defun my/set-default-font ()
  (set-face-attribute 'default nil
                      :font "UbuntuMono Nerd Font"
                      :height 180))

(add-hook 'after-make-frame-functions
          (lambda (frame)
            (with-selected-frame frame
              (my/set-default-font))))
