;;; startup
(setq gc-cons-threshold most-positive-fixnum)

(setq inhibit-startup-screen            t
      inhibit-startup-echo-area-message t
      initial-scratch-message           nil)

(scroll-bar-mode 0)
(tool-bar-mode   0)
(tooltip-mode    0)
(set-fringe-mode 0)
(menu-bar-mode   0)

(setf ring-bell-function #'ignore)

(set-face-attribute 'default nil :font "Iosevka" :height 140)

(load-theme 'whiteboard)

;;; packages
(setf package-enable-at-startup nil)

;; straight bootstrap
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage)) 

(defmacro straight-use-packages (&rest package-forms)
  `(progn
     ,@(mapcar
        (lambda (package-form) `(straight-use-package ',@(mapcar #'identity package-form)))
        package-forms)))

(straight-use-packages [use-package]
                       [evil]
                       [vertico]
                       [which-key]
                       [gcmh])

(require 'svg)
(setf z/mode-line-height-pad-image (svg-image (svg-create 1 28) :ascent 'center))
(setq-default mode-line-format
              '((:eval (propertize " " 'display z/mode-line-height-pad-image))
                " "
                (:eval (cond
                        ((and buffer-file-name (buffer-modified-p)) "XX")
                        (buffer-read-only                           "RO")
                        (t                                          "RW")))
                "      "
                "%b"
                "      "
                "(" mode-name ")"
                "      "
                "%l:%C"))

(use-package vertico
  :bind (:map vertico-map
         ("C-j" . vertico-next)
         ("C-k" . vertico-previous))
  :config
  (setq vertico-cycle t)
  :init
  (vertico-mode 1))

(use-package evil
  :init
  (evil-mode 1))

(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(setf display-line-numbers-type 'relative) 
(column-number-mode)

(setq-default indent-tabs-mode nil)

(use-package which-key
  :init (which-key-mode)
  :config
  (setq which-key-idle-delay 1.0))

;; restore gc
(gcmh-mode 1)
