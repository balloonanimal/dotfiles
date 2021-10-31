;;; nano-face-override.el -*- lexical-binding: t; -*-

; this is my way of customizing the faces used by nano.
; by default, nano's faces are too limiting in my opinion;
; syntax highlighting is much less effective when so many
; fields receive the same face attributes.

(set-face-attribute 'nano-face-critical nil
                    :foreground "#9c2f18" :background nil)

(set-face-attribute 'link nil
                    :underline  t                        )
(set-face-attribute 'button nil
                    :underline  t                        )

(set-face-attribute 'org-link nil
                    :underline  t                        )

(set-face-attribute 'font-lock-builtin-face nil
                    :foreground "#664273"                )

; for reference
;(set-face-attribute face nil
;                    :foreground 'unspecified :background 'unspecified
;                    :family     'unspecified :slant      'unspecified
;                    :weight     'unspecified :height     'unspecified
;                    :underline  'unspecified :overline   'unspecified
;                    :box        'unspecified :inherit    style)

(provide 'nano-face-override)
