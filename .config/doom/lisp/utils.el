;;; lisp/utils.el -*- lexical-binding: t; -*-

(defmacro comment (&rest body)
  "Ignores body, yields nil"
  nil)

(defun z/inheritance-chain (mode)
  (let ((l '()))
    (while mode
      (setq l (cons mode l))
      (setq mode (get mode 'derived-mode-parent)))
    l))

(defun z/align-let (start end)
  (interactive "r")
  (align-regexp start end "\\(\\s-*\\) " 1 1 t))
