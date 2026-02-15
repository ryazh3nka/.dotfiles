;;; hooks.el -- automation and mode-specific hooks
;; For external packages, see packages.el

;;; Numberline
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'conf-mode-hook 'display-line-numbers-mode)
(add-hook 'text-mode-hook 'display-line-numbers-mode)

;;; Set a font for a new frame
;; Had to do this because Emacs wouldn't accept `set-face-attribute` as is,
;; and I also had weird issues with the numberline scaling
(defun rc/set-default-font (&optional frame)
  (with-selected-frame (or frame (selected-frame))
    (set-face-attribute 'default nil
                        :font "UbuntuMono Nerd Font"
                        :height 180)
    (set-face-attribute 'line-number nil :inherit 'default :height 1.0)
    (set-face-attribute 'line-number-current-line nil :inherit 'default :height 1.0)))
(add-hook 'window-setup-hook #'rc/set-default-font)
(add-hook 'after-make-frame-functions #'rc/set-default-font)

(provide 'hooks)
