;;; lisp/themer.el -*- lexical-binding: t; -*-

;; A theme will take a (hash) mapping of faces to classes
;; And the definition of some classes

;; (defun themer-classes-to-facelist (classes)
;;   (mapcar (lambda (class) (list (car class) (cdr class))) classes))
;; takes an list of elements (FACE :PROP VAL :PROP VAL ...)
;; returns a list of elements (FACE SPEC [NOW [COMMENT]])


;; NOTE does composition work??
(defun themer-facespec-to-facelist (facespec)
  (message "%s" (type-of facespec))
  (let (facelist)
    (maphash
     (lambda (face class)
       (push
        `(,face ((t (:family              unspecified
                     :foundry             unspecified
                     :width               unspecified
                     :height              unspecified
                     :weight              unspecified
                     :slant               unspecified
                     :foreground          unspecified
                     :distant-foreground  unspecified
                     :background          unspecified
                     :underline           unspecified
                     :overline            unspecified
                     :strike-through      unspecified
                     :box                 unspecified
                     :inverse-video       unspecified
                     :stipple             unspecified
                     :font                unspecified
                     :fontset             unspecified
                     :extend              unspecified
                     :inherit             ,class))))
        facelist))
     facespec)
    facelist))

;; `((,(car spec) ((t ,(cdr spec))))))

(let ((map (make-hash-table)))
  (puthash 'bold (list 'bold-class 'italic-class) map)
  `(list ,@(themer-facespec-to-facelist map)))


(defun def-themer-theme (name docstring classes facespec)
  "Define a themer theme, named NAME"
  (declare (doc-string 2))
  (let* ()
    (custom-declare-theme name (custom-make-theme-feature name) docstring)
    (apply #'custom-theme-set-faces name classes)
    (apply #'custom-theme-set-faces name (themer-facespec-to-facelist facespec))
    (provide-theme name)))


;; (defmacro def-themer-theme (name docstring classes facespec)
;;   "Define a themer theme, named NAME"
;;   (declare (doc-string 2))
;;   `(let* ((classes ,classes)
;;           (facespec ,facespec))
;;      (deftheme ,name ,docstring)
;;      (list ,@facespec)
;;      ;; (custom-theme-set-faces
;;      ;;  ',name  ,@classes)
;;      ;; (custom-theme-set-faces
;;      ;;  ',name ,@(themer-classes-to-facelist classes))
;;      ;; (custom-theme-set-faces
;;      ;;  ',name ,@(themer-facespec-to-facelist facespec))
;;      (provide-theme ',name)))


;; (let ((classes (list (list 'bold :weight 'bold)
;;                      (list 'italic :slant 'italic)))
;;       (facespec (let ((map (make-hash-table)))
;;                   (puthash 'bold-face 'bold map)
;;                   (puthash 'italic-face 'italic map)
;;                   (puthash 'both-face '(bold italic) map)
;;                   map)))
;;   (def-themer-theme test-theme
;;     "It's my test theme"
;;     classes facespec))


(defun z/get-all-faces ()
  "TODO ignores aliases for now"
  (let (nonaliasfaces aliasfaces)
    (mapatoms (lambda (s)
                (if (facep s)
                    (if (get s 'face-alias)
                        (push s aliasfaces)
                      (push s nonaliasfaces)))))
    nonaliasfaces))


;; (defun z/face-attributes (face)
;;   `((:family . ,(face-attribute face :family))
;;     (:foundry . ,(face-attribute face :foundry))
;;     (:width . ,(face-attribute face :width))
;;     (:height . ,(face-attribute face :height))
;;     (:weight . ,(face-attribute face :weight))
;;     (:slant . ,(face-attribute face :slant))
;;     (:foreground . ,(face-attribute face :foreground))
;;     (:distant-foreground . ,(face-attribute face :distant-foreground))
;;     (:background . ,(face-attribute face :background))
;;     (:underline . ,(face-attribute face :underline))
;;     (:overline . ,(face-attribute face :overline))
;;     (:strike-through . ,(face-attribute face :strike-through))
;;     (:box . ,(face-attribute face :box))
;;     (:inverse-video . ,(face-attribute face :inverse-video))
;;     (:stipple . ,(face-attribute face :stipple))
;;     (:font . ,(face-attribute face :font))
;;     (:fontset . ,(face-attribute face :fontset))
;;     (:extend . ,(face-attribute face :extend))
;;     (:inherit . ,(face-attribute face :inherit))))


;; (defun z/get-all-faces-rich ()
;;   (let ((faces (z/get-all-faces)))
;;     (mapcar
;;      (lambda (s)
;;        (list s (z/face-attributes s)))
;;      faces)))

;; (defun z/face-inherits? (face)
;;   (let ((inherit (face-attribute face :inherit)))
;;     (not (or (eq 'unspecified inherit)
;;              (null inherit)))))


;; ;; (length (z/get-all-faces)) ; => 966
;; ;; (length (-filter (lambda (f) (z/face-inherits? f)) (z/get-all-faces))) ; => 600


;; (defun z/theme-build-class (class)
;;   (let ((name (car class))
;;         (props (cdr class)))
;;     `(list
;;       ',name
;;       )))


;; (defmacro z/deftheme (name &rest body)
;;   (declare (indent defun))
;;   ;; (declare (doc-string 2))
;;   (let* ((docstring (when (stringp (car body)) (car body)))
;;          (body      (if docstring (cdr body) body))
;;          (classes   (alist-get :classes body))
;;          (faces     (alist-get :faces body)))
;;     `(progn
;;        ,(if docstring `(deftheme ,name ,docstring) `(deftheme name))
;;        (custom-theme-set-faces
;;         ',name ,@(mapcar #'z/theme-build-class classes))
;;        (custom-theme-set-faces
;;         ',name ,@(mapcar #'z/theme-build-face faces))
;;        (provide-theme ',name))))


;; (comment
;;  (z/deftheme name-of-my-theme
;;              "here's a docstring for ya"
;;              ;; :base
;;              ;; for a base theme to inherit from
;;              ;; NOTE: can accept a single theme or a list of themes, with inheritance
;;              ;; order left to right
;;              ;; NOTE: what to do if one of these themes inherits from
;;              ;; (nano-theme :override
;;              ;;             (default default)
;;              ;;             (subtle subtle)
;;              ;;             (popout popout)
;;              ;;             (faded faded)
;;              ;;             (strong strong)
;;              ;;             (salient salient)
;;              ;;             (critical critical))
;;              ;; :init
;;              ;; for running arbitrary code
;;              ;; NOTE: maybe don't?
;;              :classes
;;              ;; defining classes for use in face inheritance
;;              ;; NOTE: should be automatically namespaced so default => name-of-my-theme--class-default
;;              ;; NOTE: inheritance maybe shouldn't be allowed for classes? Keep it shallow stupid?
;;              ;; NOTE: add the additional keyword :replaces for replacing classes in the base theme
;;              (default  :foreground "#ECEFF4" :background "#2E3440")
;;              (subtle   :background "#434C5E")
;;              (popout   :foreground "#D08770")
;;              (faded    :foreground "#677691" :weight light)
;;              (strong   :foreground "#ECEFF4" :weight bold)
;;              (salient  :foreground "#81A1C1" :weight light)
;;              (critical :foreground "#2E3440" :background "#EBCB8B")

;;              :faces
;;              ;; NOTE: should faces be allowed to define their own attributes? Might be
;;              ;; better if concrete faces are only allowed to derive from a class

;;              ;; font-lock
;;              (font-lock-comment-face       :override nano-face-faded)
;;              (font-lock-doc-face           :override nano-face-faded)
;;              (font-lock-string-face        :override nano-face-popout)
;;              (font-lock-constant-face      :override nano-face-salient)
;;              (font-lock-warning-face       :override nano-face-popout)
;;              (font-lock-function-name-face :override nano-face-strong)
;;              (font-lock-variable-name-face :override nano-face-strong)
;;              (font-lock-builtin-face       :override nano-face-salient)
;;              (font-lock-type-face          :override nano-face-salient)
;;              (font-lock-keyword-face       :override nano-face-salient)
;;              ;; etc...

;;              )
;;  ;; faces are concrete, only allowed to inherit
;;  ;; classes are abstract, not allowed display
;;  ;; separate data from behavior
;;  ;; a face is a list of behavior, a class is a behavior
;;  ;; but provide back doors to get around if neccesary?

;;  )
