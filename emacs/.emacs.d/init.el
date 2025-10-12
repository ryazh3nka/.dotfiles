;; prevents emacs from shitting inside your config
;; you'll need to load a colorscheme manually though
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
(global-display-line-numbers-mode t)
(add-hook 'pdf-view-mode-hook (lambda () (display-line-numbers-mode -1)))

;; greeter
(setq inhibit-startup-screen t)

;; tabwidth
(setq-default tab-width 8)
(setq-default indent-tabs-mode nil)

;; autocompletion and stuff
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq read-file-name-completion-ignore-case t)

;; font
(set-face-attribute 'default nil
                    :font "UbuntuMono Nerd Font"
                    :height 220)

;; wrap indicator
(setq-default fringe-indicator-alist
              (assq-delete-all 'continuation
                               (assq-delete-all 'truncation fringe-indicator-alist)))

;; indentation
(setq-default tab-width 8)

;; c code style
(setq-default tab-width 8)
(setq c-default-style "linux")

(custom-set-faces
 '(line-number ((t (:background nil))))
 '(line-number-current-line ((t (:background nil)))))

;; functions!

; duplicate current line
(defun duplicate-line ()
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

(global-set-key (kbd "C-,") 'duplicate-line)

; copy files in dired
(defun dired-copy-files-to-clipboard (&optional plain-text)
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

(global-set-key (kbd "C-c w") #'dired-copy-files-to-clipboard)

;; package management:
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'pdf-tools)
  (package-install 'pdf-tools))
(pdf-loader-install)

(unless (package-installed-p 'gruvbox-theme)
  (package-install 'gruvbox-theme))
(load-theme 'gruvbox)

(set-face-attribute 'mode-line nil
                    :background "#504945"
                    :box nil)
(set-face-attribute 'mode-line-inactive nil
                    :background "#3c3836"
                    :box nil)
