;;; load-nano.el -*- lexical-binding: t; -*-

;; This file loads nano. Enable by putting (require 'load-nano) in config.el

(require 'nano-layout)

;; (require 'nano-base-colors)
;; (require 'nano-theme-light)
;; (require 'nano-theme-dark)
;; (require 'nano-faces)
;; (nano-faces)
;; (require 'nano-theme)
;; (nano-theme)

;; (require 'nano-modeline)

;; (require 'nano-face-override)

(setq display-line-numbers-type nil
      evil-default-cursor t
      custom-blue "#718591")


; still haven't figured out what is up with point
; related to nano. this is a stopgap measure to
; get a decent looking cursor
(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (set-cursor-color custom-blue))))
  (set-cursor-color custom-blue))

(provide 'load-nano)
