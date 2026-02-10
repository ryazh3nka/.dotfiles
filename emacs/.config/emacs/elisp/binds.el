;;; binds.el -- custom keybindings

;; Duplicate current line
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

;; Kill unused buffers
(defun rc/close-other-buffers ()
  "Kill all buffers except the current one and the *scratch* buffer."
  (interactive)
  (let ((current (current-buffer)))
    (dolist (buf (buffer-list))
      (unless (or (eq buf current)
                  (string-equal (buffer-name buf) "*scratch*"))
        (kill-buffer buf)))))
(global-set-key (kbd "C-c k") 'rc/close-other-buffers)

;; Copy files as text/uri-list in dired
(defun rc/dired-copy-files-to-clipboard (&optional plain-text)
  "Copy marked files to the clipboard. With a prefix arg copy plain text; otherwise copy a text/uri-list."
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
(global-set-key (kbd "C-c c") 'rc/dired-copy-files-to-clipboard)

(provide 'binds)
