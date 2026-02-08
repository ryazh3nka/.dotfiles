;;; init.el -- a dirty starting point for my emacs configuration
;; All useful config files are in $XDG_CONFIG_HOME/emacs/elisp,
;; and all related data is in $XDG_DATA_HOME/emacs

;;; Force emacs to store its data in ~/.local/share (including backups/lockfiles and elpa cache)
;; It's more of a hack in case you really want to follow the XDG dir spec to a T
(setq user-emacs-directory
      (expand-file-name "emacs/"
                        (or (getenv "XDG_DATA_HOME") "~/.local/share/")))

(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))
(unless (file-exists-p user-emacs-directory)
  (make-directory user-emacs-directory t))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(make-directory (expand-file-name "auto-save/" user-emacs-directory) t)
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "auto-save/" user-emacs-directory) t))) 
(setq auto-save-list-file-prefix
      (expand-file-name "auto-save/.saves-" user-emacs-directory))

(make-directory (expand-file-name "backups/" user-emacs-directory) t)
(setq backup-directory-alist
      `(("." . ,(expand-file-name "backups/" user-emacs-directory))))

(make-directory (expand-file-name "eln-cache/" user-emacs-directory) t)
(setq native-comp-eln-load-path
      (list (expand-file-name "eln-cache/" user-emacs-directory))) 

;;; Organize Emacs config dir like Neovim's
(defconst rc/emacs-config-dir (file-name-directory user-init-file))
(add-to-list 'load-path (expand-file-name "elisp" rc/emacs-config-dir))

(require 'packages)
(require 'config)
(require 'binds)
(require 'hooks)
