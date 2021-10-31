;;; themes/mono-white-theme.el -*- lexical-binding: t; -*-

(load! "../lisp/themer.el")

;; FIXME this is a bad hack!
(defface faded-background nil "")
(defface faded-block nil "")
;; (defface h1 nil "")
;; (defface h2 nil "")

(setq mono-white-classes
      '((foreground          ((t (:foreground "#000000"))))
        (background          ((t (:background "#F7F7F7"))))
        ;; (inverted            ((t (:foreground "#F7F7F7"
        ;;                           :background "#000000"))))
        (faded-background    ((t (:background "#DDDDDD"))))
        (faded-block         ((t (:background "#DDDDDD"
                                  :extend t))))
        (bold                ((t (:weight bold))))
        (italic              ((t (:slant italic))))
        (underline           ((t (:underline (:style line)))))
        ;; (h1                  ((t (:height 1.7))))
        ;; (h2                  ((t (:height 1.4))))

        (nano-face-default  ((t (:foreground "#000000"))))
        (nano-face-critical ((t (:foreground "#000000"))))
        (nano-face-popout   ((t (:foreground "#000000"))))
        (nano-face-strong   ((t (:foreground "#000000"))))
        (nano-face-salient  ((t (:foreground "#000000"))))
        (nano-face-faded    ((t (:foreground "#000000"))))
        (nano-face-subtle   ((t (:background "#F7F7F7"))))

        ;; these are just faces
        (default             ((t (:foreground "#000000"
                                  :background "#F7F7F7"))))
        (mode-line ((t (:weight     light
                        :background "#EEEEEE"
                        :box        `(:line-width 1
                                      :color "#F7F7F7"
                                      :style nil)))))
        (window-divider ((t (:foreground "#F7F7F7"))))
        ))

(setq mono-facespec
      #s(hash-table
         data
         (
          bold-italic                          bold
          region                               faded-background
          highlight                            faded-background
          fixed-pitch-serif                    nano-face-default
          variable-pitch                       nano-face-default
          cursor                               nano-face-default

          ;;              cursor :background nano-color-foreground
          window-divider-first-pixel           foreground
          window-divider-last-pixel           foreground
          ;;              vertical-border :foreground nano-color-subtle

          ;; semantic
          shadow                               nano-face-faded
          success                              nano-face-salient
          warning                              nano-face-popout
          error                                nano-face-critical
          match                                faded-background

          ;; general
          buffer-menu-buffer                   bold
          minibuffer-prompt                    bold
          link                                 underline
          ;; (puthash     fringe                               nano-face-faded
          ;;          :foreground nano-color-subtle
          ;;          :background nano-color-background map)
          isearch                              bold
          isearch-fail                         nano-face-faded
          lazy-highlight                       faded-background
          trailing-whitespace                  faded-background
          show-paren-match                     nano-face-salient
          show-paren-mismatch                  nano-face-default
          secondary-selection                  faded-background
          completions-common-part              nano-face-faded
          completions-first-difference         nano-face-default

          ;; font-lock
          font-lock-comment-face               foreground
          font-lock-doc-face                   foreground
          font-lock-string-face                foreground
          font-lock-constant-face              foreground
          font-lock-warning-face               foreground
          font-lock-function-name-face         foreground
          font-lock-variable-name-face         foreground
          font-lock-builtin-face               foreground
          font-lock-type-face                  foreground
          font-lock-keyword-face               foreground

          ;; mode-line
          mode-line-inactive                   mode-line
          mode-line-emphasis                   bold

          ;; hl-line
          hl-line                              faded-background

          ;; buttons
          ;; (puthash     custom-button :foreground nano-color-faded
          ;;          :background nano-color-background
          ;;          :box `(:line-width 1 :style nil) map)
          ;; (puthash     custom-button-mouse :foreground nano-color-faded
          ;;          :background nano-color-subtle
          ;;          :box `(:line-width 1 :style nil) map)
          ;; (puthash     custom-button-pressed :foreground nano-color-foreground
          ;;          :background nano-color-salient
          ;;              nano-face-salient
          ;;          :box `(:line-width 1
          ;;                 :color ,nano-color-salient
          ;;                 :style nil) map)

          ;; info
          info-menu-header                     bold
          info-header-node                     nano-face-default
          info-index-match                     nano-face-salient
          Info-quoted                          nano-face-faded
          info-title-1                         bold
          info-title-2                         bold
          info-title-3                         bold
          info-title-4                         bold

          ;; speedbar
          speedbar-button-face                 nano-face-faded
          speedbar-directory-face              bold
          speedbar-file-face                   nano-face-default
          speedbar-highlight-face              nano-face-highlight
          speedbar-selected-face               faded-background
          speedbar-separator-face              nano-face-faded
          speedbar-tag-face                    nano-face-faded

          ;; bookmark
          bookmark-menu-heading                bold
          bookmark-menu-bookmark               nano-face-salient
          bookmark-face                        faded-background

          ;; message
          message-cited-text-1                 nano-face-faded
          message-cited-text-2                 nano-face-faded
          message-cited-text-3                 nano-face-faded
          message-cited-text-4                 nano-face-faded
          message-cited-text                   nano-face-faded
          message-header-cc                    nano-face-default
          message-header-name                  bold
          message-header-newsgroups            nano-face-default
          message-header-other                 nano-face-default
          message-header-subject               nano-face-salient
          message-header-to                    nano-face-salient
          message-header-xheader               nano-face-default
          message-mml                          nano-face-popout
          message-separator                    nano-face-faded

          ;; outline
          outline-1                            bold
          outline-2                            bold
          outline-3                            bold
          outline-4                            bold
          outline-5                            bold
          outline-6                            bold
          outline-7                            bold
          outline-8                            bold

          ;; customize
          widget-field                         faded-background
          widget-button                        bold
          widget-single-line-field             faded-background
          custom-group-subtitle                bold
          custom-group-tag                     bold
          custom-group-tag-1                   bold
          custom-comment                       nano-face-faded
          custom-comment-tag                   nano-face-faded
          custom-changed                       nano-face-salient
          custom-modified                      nano-face-salient
          custom-face-tag                      bold
          custom-variable-tag                  nano-face-default
          custom-invalid                       nano-face-popout
          custom-visibility                    nano-face-salient
          custom-state                         nano-face-salient
          custom-link                          nano-face-salient

          ;; package
          package-description                  nano-face-default
          package-help-section-name            nano-face-default
          package-name                         nano-face-salient
          package-status-avail-obso            nano-face-faded
          package-status-available             nano-face-default
          package-status-built-in              nano-face-salient
          package-status-dependency            nano-face-salient
          package-status-disabled              nano-face-faded
          package-status-external              nano-face-default
          package-status-held                  nano-face-default
          package-status-incompat              nano-face-faded
          package-status-installed             nano-face-salient
          package-status-new                   nano-face-default
          package-status-unsigned              nano-face-default

          ;; flyspell
          flyspell-duplicate                   nano-face-popout
          flyspell-incorrect                   nano-face-popout

          ;; ido
          ido-first-match                      nano-face-salient
          ido-only-match                       nano-face-faded
          ido-subdir                           bold

          ;; diff
          diff-header                          nano-face-faded
          diff-file-header                     bold
          diff-context                         nano-face-default
          diff-removed                         nano-face-faded
          diff-changed                         nano-face-popout
          diff-added                           nano-face-salient
          diff-refine-added                    (nano-face-salient bold)
          diff-refine-changed                  nano-face-popout
          ;; (puthash     diff-refine-removed                  nano-face-faded
          ;;          :strike-through t map)

          ;; calendar
          calendar-today                       bold

          ;; agenda
          org-agenda-calendar-event            nano-face-default
          org-agenda-calendar-sexp             nano-face-salient
          org-agenda-clocking                  nano-face-faded
          org-agenda-column-dateline           nano-face-faded
          org-agenda-current-time              bold
          org-agenda-date                      nano-face-salient
          org-agenda-date-today                (nano-face-salient bold)
          org-agenda-date-weekend              nano-face-faded
          org-agenda-diary                     nano-face-faded
          org-agenda-dimmed-todo-face          nano-face-faded
          org-agenda-done                      nano-face-faded
          org-agenda-filter-category           nano-face-faded
          org-agenda-filter-effort             nano-face-faded
          org-agenda-filter-regexp             nano-face-faded
          org-agenda-filter-tags               nano-face-faded
          org-agenda-restriction-lock          nano-face-faded
          org-agenda-structure                 bold

          ;; org
          org-archived                         nano-face-faded
          org-block                            faded-block
          org-block-begin-line                 faded-block
          org-block-end-line                   faded-block
          org-checkbox                         nano-face-faded
          org-checkbox-statistics-done         nano-face-faded
          org-checkbox-statistics-todo         nano-face-faded
          org-clock-overlay                    nano-face-faded
          org-code                             nano-face-faded
          org-column                           nano-face-faded
          org-column-title                     nano-face-faded
          org-date                             nano-face-faded
          org-date-selected                    nano-face-faded
          org-default                          nano-face-faded
          org-document-info                    nano-face-faded
          org-document-info-keyword            nano-face-faded
          org-document-title                   bold
          org-done                             nano-face-default
          org-drawer                           nano-face-faded
          org-ellipsis                         nano-face-faded
          org-footnote                         nano-face-faded
          org-formula                          nano-face-faded
          org-headline-done                    nano-face-faded
          org-latex-and-related                nano-face-faded
          ;; inherited from outline
          ;; (org-level-1 bold map)
          ;; (org-level-2 bold map)
          ;; (org-level-3 bold map)
          ;; (org-level-4 bold map)
          ;; (org-level-5 bold map)
          ;; (org-level-6 bold map)
          ;; (org-level-7 bold map)
          ;; (org-level-8 bold map)
          org-link                             underline
          org-list-dt                          nano-face-faded
          org-macro                            nano-face-faded
          org-meta-line                        nano-face-faded
          org-mode-line-clock                  nano-face-faded
          org-mode-line-clock-overrun          nano-face-faded
          org-priority                         nano-face-faded
          org-property-value                   nano-face-faded
          org-quote                            nano-face-faded
          org-scheduled                        nano-face-faded
          org-scheduled-previously             nano-face-faded
          org-scheduled-today                  nano-face-faded
          org-sexp-date                        nano-face-faded
          org-special-keyword                  nano-face-faded
          org-table                            nano-face-faded
          org-tag                              nano-face-popout
          org-tag-group                        nano-face-faded
          org-target                           nano-face-faded
          org-time-grid                        nano-face-faded
          org-todo                             nano-face-salient
          org-upcoming-deadline                nano-face-default
          org-verbatim                         nano-face-popout
          org-verse                            nano-face-faded
          org-warning                          nano-face-popout

          +org-todo-active                     nano-face-popout
          +org-todo-onhold                     nano-face-salient
          +org-todo-cancel                     nano-face-faded
          +org-todo-project                    nano-face-default

          ;; elfeed
          elfeed-log-date-face                 nano-face-faded
          elfeed-log-info-level-face           nano-face-default
          elfeed-log-debug-level-face          nano-face-default
          elfeed-log-warn-level-face           nano-face-popout
          elfeed-log-error-level-face          nano-face-popout
          elfeed-search-tag-face               nano-face-faded
          elfeed-search-date-face              nano-face-faded
          elfeed-search-feed-face              nano-face-salient
          elfeed-search-filter-face            nano-face-faded
          elfeed-search-last-update-face       nano-face-salient
          elfeed-search-title-face             nano-face-default
          elfeed-search-tag-face               nano-face-faded
          elfeed-search-unread-count-face      bold
          elfeed-search-unread-title-face      bold

          ;; deft
          deft-filter-string-error-face        nano-face-popout
          deft-filter-string-face              nano-face-default
          deft-header-face                     nano-face-salient
          deft-separator-face                  nano-face-faded
          deft-summary-face                    nano-face-faded
          deft-time-face                       nano-face-salient
          deft-title-face                      bold

          ;; rst
          rst-adornment                        nano-face-faded
          rst-block                            nano-face-default
          rst-comment                          nano-face-faded
          rst-definition                       nano-face-salient
          rst-directive                        nano-face-salient
          rst-emphasis1                        nano-face-faded
          rst-emphasis2                        bold
          rst-external                         nano-face-salient
          rst-level-1                          bold
          rst-level-2                          bold
          rst-level-3                          bold
          rst-level-4                          bold
          rst-level-5                          bold
          rst-level-6                          bold
          rst-literal                          nano-face-salient
          rst-reference                        nano-face-salient
          rst-transition                       nano-face-default

          ;; markdown
          markdown-blockquote-face             nano-face-default
          markdown-bold-face                   bold
          markdown-code-face                   nano-face-default
          markdown-comment-face                nano-face-faded
          markdown-footnote-marker-face        nano-face-default
          markdown-footnote-text-face          nano-face-default
          markdown-gfm-checkbox-face           nano-face-default
          markdown-header-delimiter-face       nano-face-faded
          markdown-header-face                 bold
          markdown-header-face-1               bold
          markdown-header-face-2               bold
          markdown-header-face-3               bold
          markdown-header-face-4               bold
          markdown-header-face-5               bold
          markdown-header-face-6               bold
          markdown-header-rule-face            nano-face-default
          markdown-highlight-face              nano-face-default
          markdown-hr-face                     nano-face-default
          markdown-html-attr-name-face         nano-face-default
          markdown-html-attr-value-face        nano-face-default
          markdown-html-entity-face            nano-face-default
          markdown-html-tag-delimiter-face     nano-face-default
          markdown-html-tag-name-face          nano-face-default
          markdown-inline-code-face            nano-face-popout
          markdown-italic-face                 nano-face-faded
          markdown-language-info-face          nano-face-default
          markdown-language-keyword-face       nano-face-default
          markdown-line-break-face             nano-face-default
          markdown-link-face                   nano-face-salient
          markdown-link-title-face             nano-face-default
          markdown-list-face                   nano-face-faded
          markdown-markup-face                 nano-face-faded
          markdown-math-face                   nano-face-default
          markdown-metadata-key-face           nano-face-faded
          markdown-metadata-value-face         nano-face-faded
          markdown-missing-link-face           nano-face-default
          markdown-plain-url-face              nano-face-default
          markdown-pre-face                    nano-face-default
          markdown-reference-face              nano-face-salient
          markdown-strike-through-face         nano-face-faded
          markdown-table-face                  nano-face-default
          markdown-url-face                    nano-face-salient

          ;; ivy
          ivy-action                           nano-face-faded
          ivy-completions-annotations          nano-face-faded
          ivy-confirm-face                     nano-face-faded
          ivy-current-match                    (bold faded-background)
          ivy-cursor                           bold
          ivy-grep-info                        bold
          ivy-grep-line-number                 nano-face-faded
          ivy-highlight-face                   bold
          ivy-match-required-face              nano-face-faded
          ivy-minibuffer-match-face-1          nano-face-faded
          ivy-minibuffer-match-face-2          nano-face-faded
          ivy-minibuffer-match-face-3          nano-face-faded
          ivy-minibuffer-match-face-4          nano-face-faded
          ivy-minibuffer-match-highlight       bold
          ivy-modified-buffer                  nano-face-popout
          ivy-modified-outside-buffer          bold
          ivy-org                              nano-face-faded
          ivy-prompt-match                     nano-face-faded
          ivy-remote                           nano-face-default
          ivy-separator                        nano-face-faded
          ivy-subdir                           nano-face-faded
          ivy-virtual                          nano-face-faded
          ivy-yanked-word                      nano-face-faded

          ;; helm
          helm-selection                       (bold faded-background)
          helm-match                           bold
          helm-source-header                   nano-face-salient
          helm-swoop-target-line-face          (bold faded-background)
          helm-visible-mark                    bold
          helm-moccur-buffer                   bold
          helm-ff-file                         nano-face-faded
          helm-ff-prefix                       bold
          helm-ff-dotted-directory             nano-face-faded
          helm-ff-directory                    bold
          helm-ff-executable                   nano-face-popout
          helm-grep-match                      bold
          helm-grep-file                       nano-face-faded
          helm-grep-lineno                     nano-face-faded
          helm-grep-finish                     nano-face-default

          ;; company
          company-tooltip-selection            (bold faded-background)
          company-tooltip                      nano-face-default
          company-scrollbar-fg                 nano-face-faded
          company-scrollbar-bg                 nano-face-default
          company-tooltip-common               nano-face-default
          company-tooltip-common-selection     (bold faded-background)
          company-tooltip-annotation           nano-face-default
          company-tooltip-annotation-selection (bold faded-background)

          ;; notmuch
          notmuch-search-matching-authors      nano-face-default
          notmuch-search-date                  nano-face-default
          notmuch-search-count                 nano-face-faded
          notmuch-tag-face                     nano-face-default
          notmuch-tag-unread                   nano-face-popout

          ;; clojure
          clojure-keyword-face                 (font-lock-constant-face italic)

          ;; vertico
          orderless-match-face-0               bold)))

;; (setq nano-facespec
;;       #s(hash-table
;;          data
;;          ( default                              (foreground background)
;;            bold                                 nano-face-strong
;;            italic                               nano-face-faded
;;            bold-italic                          nano-face-strong
;;            region                               nano-face-subtle
;;            highlight                            nano-face-subtle
;;            fixed-pitch-serif                    nano-face-default
;;            variable-pitch                       nano-face-default
;;            cursor                               nano-face-default

;;            ;;              cursor :background nano-color-foreground
;;            ;;              window-divider :foreground nano-color-background
;;            ;;              vertical-border :foreground nano-color-subtle

;;            ;; semantic
;;            shadow                               nano-face-faded
;;            success                              nano-face-salient
;;            warning                              nano-face-popout
;;            error                                nano-face-critical
;;            match                                nano-face-popout

;;            ;; general
;;            buffer-menu-buffer                   nano-face-strong
;;            minibuffer-prompt                    nano-face-strong
;;            link                                 nano-face-salient
;;            ;; (puthash     fringe                               nano-face-faded
;;            ;;          :foreground nano-color-subtle
;;            ;;          :background nano-color-background map)
;;            isearch                              nano-face-strong
;;            isearch-fail                         nano-face-faded
;;            lazy-highlight                       nano-face-subtle
;;            trailing-whitespace                  nano-face-subtle
;;            show-paren-match                     nano-face-salient
;;            show-paren-mismatch                  nano-face-default
;;            secondary-selection                  nano-face-subtle
;;            completions-common-part              nano-face-faded
;;            completions-first-difference         nano-face-default

;;            ;; font-lock
;;            font-lock-comment-face               nano-face-faded
;;            font-lock-doc-face                   nano-face-faded
;;            font-lock-string-face                nano-face-popout
;;            font-lock-constant-face              nano-face-salient
;;            font-lock-warning-face               nano-face-popout
;;            font-lock-function-name-face         nano-face-strong
;;            font-lock-variable-name-face         nano-face-strong
;;            font-lock-builtin-face               nano-face-salient
;;            font-lock-type-face                  nano-face-salient
;;            font-lock-keyword-face               nano-face-salient

;;            ;; mode-line
;;            ;; (puthash     mode-line :weight                    light
;;            ;;          :background nano-color-subtle
;;            ;; :box `(:line-width 1 :color ,nano-color-background :style nil) map)
;;            mode-line-inactive                   mode-line
;;            mode-line-emphasis                   nano-face-strong

;;            ;; hl-line
;;            ;;              hl-line :background nano-color-highlight

;;            ;; buttons
;;            ;; (puthash     custom-button :foreground nano-color-faded
;;            ;;          :background nano-color-background
;;            ;;          :box `(:line-width 1 :style nil) map)
;;            ;; (puthash     custom-button-mouse :foreground nano-color-faded
;;            ;;          :background nano-color-subtle
;;            ;;          :box `(:line-width 1 :style nil) map)
;;            ;; (puthash     custom-button-pressed :foreground nano-color-foreground
;;            ;;          :background nano-color-salient
;;            ;;              nano-face-salient
;;            ;;          :box `(:line-width 1
;;            ;;                 :color ,nano-color-salient
;;            ;;                 :style nil) map)

;;            ;; info
;;            info-menu-header                     nano-face-strong
;;            info-header-node                     nano-face-default
;;            info-index-match                     nano-face-salient
;;            Info-quoted                          nano-face-faded
;;            info-title-1                         nano-face-strong
;;            info-title-2                         nano-face-strong
;;            info-title-3                         nano-face-strong
;;            info-title-4                         nano-face-strong

;;            ;; speedbar
;;            speedbar-button-face                 nano-face-faded
;;            speedbar-directory-face              nano-face-strong
;;            speedbar-file-face                   nano-face-default
;;            speedbar-highlight-face              nano-face-highlight
;;            speedbar-selected-face               nano-face-subtle
;;            speedbar-separator-face              nano-face-faded
;;            speedbar-tag-face                    nano-face-faded

;;            ;; bookmark
;;            bookmark-menu-heading                nano-face-strong
;;            bookmark-menu-bookmark               nano-face-salient
;;            bookmark-face                        nano-face-subtle

;;            ;; message
;;            message-cited-text-1                 nano-face-faded
;;            message-cited-text-2                 nano-face-faded
;;            message-cited-text-3                 nano-face-faded
;;            message-cited-text-4                 nano-face-faded
;;            message-cited-text                   nano-face-faded
;;            message-header-cc                    nano-face-default
;;            message-header-name                  nano-face-strong
;;            message-header-newsgroups            nano-face-default
;;            message-header-other                 nano-face-default
;;            message-header-subject               nano-face-salient
;;            message-header-to                    nano-face-salient
;;            message-header-xheader               nano-face-default
;;            message-mml                          nano-face-popout
;;            message-separator                    nano-face-faded

;;            ;; outline
;;            outline-1                            nano-face-strong
;;            outline-2                            nano-face-strong
;;            outline-3                            nano-face-strong
;;            outline-4                            nano-face-strong
;;            outline-5                            nano-face-strong
;;            outline-6                            nano-face-strong
;;            outline-7                            nano-face-strong
;;            outline-8                            nano-face-strong

;;            ;; customize
;;            widget-field                         nano-face-subtle
;;            widget-button                        nano-face-strong
;;            widget-single-line-field             nano-face-subtle
;;            custom-group-subtitle                nano-face-strong
;;            custom-group-tag                     nano-face-strong
;;            custom-group-tag-1                   nano-face-strong
;;            custom-comment                       nano-face-faded
;;            custom-comment-tag                   nano-face-faded
;;            custom-changed                       nano-face-salient
;;            custom-modified                      nano-face-salient
;;            custom-face-tag                      nano-face-strong
;;            custom-variable-tag                  nano-face-default
;;            custom-invalid                       nano-face-popout
;;            custom-visibility                    nano-face-salient
;;            custom-state                         nano-face-salient
;;            custom-link                          nano-face-salient

;;            ;; package
;;            package-description                  nano-face-default
;;            package-help-section-name            nano-face-default
;;            package-name                         nano-face-salient
;;            package-status-avail-obso            nano-face-faded
;;            package-status-available             nano-face-default
;;            package-status-built-in              nano-face-salient
;;            package-status-dependency            nano-face-salient
;;            package-status-disabled              nano-face-faded
;;            package-status-external              nano-face-default
;;            package-status-held                  nano-face-default
;;            package-status-incompat              nano-face-faded
;;            package-status-installed             nano-face-salient
;;            package-status-new                   nano-face-default
;;            package-status-unsigned              nano-face-default

;;            ;; flyspell
;;            flyspell-duplicate                   nano-face-popout
;;            flyspell-incorrect                   nano-face-popout

;;            ;; ido
;;            ido-first-match                      nano-face-salient
;;            ido-only-match                       nano-face-faded
;;            ido-subdir                           nano-face-strong

;;            ;; diff
;;            diff-header                          nano-face-faded
;;            diff-file-header                     nano-face-strong
;;            diff-context                         nano-face-default
;;            diff-removed                         nano-face-faded
;;            diff-changed                         nano-face-popout
;;            diff-added                           nano-face-salient
;;            diff-refine-added                    (nano-face-salient nano-face-strong)
;;            diff-refine-changed                  nano-face-popout
;;            ;; (puthash     diff-refine-removed                  nano-face-faded
;;            ;;          :strike-through t map)

;;            ;; calendar
;;            calendar-today                       nano-face-strong

;;            ;; agenda
;;            org-agenda-calendar-event            nano-face-default
;;            org-agenda-calendar-sexp             nano-face-salient
;;            org-agenda-clocking                  nano-face-faded
;;            org-agenda-column-dateline           nano-face-faded
;;            org-agenda-current-time              nano-face-strong
;;            org-agenda-date                      nano-face-salient
;;            org-agenda-date-today                (nano-face-salient nano-face-strong)
;;            org-agenda-date-weekend              nano-face-faded
;;            org-agenda-diary                     nano-face-faded
;;            org-agenda-dimmed-todo-face          nano-face-faded
;;            org-agenda-done                      nano-face-faded
;;            org-agenda-filter-category           nano-face-faded
;;            org-agenda-filter-effort             nano-face-faded
;;            org-agenda-filter-regexp             nano-face-faded
;;            org-agenda-filter-tags               nano-face-faded
;;            org-agenda-restriction-lock          nano-face-faded
;;            org-agenda-structure                 nano-face-strong

;;            ;; org
;;            org-archived                         nano-face-faded
;;            ;;              org-block                            hl-line :extend t
;;            ;;              org-block-begin-line                 nano-face-faded :extend t
;;            ;;              org-block-end-line                   nano-face-faded :extend t
;;            org-checkbox                         nano-face-faded
;;            org-checkbox-statistics-done         nano-face-faded
;;            org-checkbox-statistics-todo         nano-face-faded
;;            org-clock-overlay                    nano-face-faded
;;            org-code                             nano-face-faded
;;            org-column                           nano-face-faded
;;            org-column-title                     nano-face-faded
;;            org-date                             nano-face-faded
;;            org-date-selected                    nano-face-faded
;;            org-default                          nano-face-faded
;;            org-document-info                    nano-face-faded
;;            org-document-info-keyword            nano-face-faded
;;            org-document-title                   nano-face-faded
;;            org-done                             nano-face-default
;;            org-drawer                           nano-face-faded
;;            org-ellipsis                         nano-face-faded
;;            org-footnote                         nano-face-faded
;;            org-formula                          nano-face-faded
;;            org-headline-done                    nano-face-faded
;;            org-latex-and-related                nano-face-faded
;;            ;; inherited from outline
;;            ;; (org-level-1 nano-face-strong map)
;;            ;; (org-level-2 nano-face-strong map)
;;            ;; (org-level-3 nano-face-strong map)
;;            ;; (org-level-4 nano-face-strong map)
;;            ;; (org-level-5 nano-face-strong map)
;;            ;; (org-level-6 nano-face-strong map)
;;            ;; (org-level-7 nano-face-strong map)
;;            ;; (org-level-8 nano-face-strong map)
;;            org-link                             nano-face-salient
;;            org-list-dt                          nano-face-faded
;;            org-macro                            nano-face-faded
;;            org-meta-line                        nano-face-faded
;;            org-mode-line-clock                  nano-face-faded
;;            org-mode-line-clock-overrun          nano-face-faded
;;            org-priority                         nano-face-faded
;;            org-property-value                   nano-face-faded
;;            org-quote                            nano-face-faded
;;            org-scheduled                        nano-face-faded
;;            org-scheduled-previously             nano-face-faded
;;            org-scheduled-today                  nano-face-faded
;;            org-sexp-date                        nano-face-faded
;;            org-special-keyword                  nano-face-faded
;;            org-table                            nano-face-faded
;;            org-tag                              nano-face-popout
;;            org-tag-group                        nano-face-faded
;;            org-target                           nano-face-faded
;;            org-time-grid                        nano-face-faded
;;            org-todo                             nano-face-salient
;;            org-upcoming-deadline                nano-face-default
;;            org-verbatim                         nano-face-popout
;;            org-verse                            nano-face-faded
;;            org-warning                          nano-face-popout

;;            +org-todo-active                     nano-face-popout
;;            +org-todo-onhold                     nano-face-salient
;;            +org-todo-cancel                     nano-face-faded
;;            +org-todo-project                    nano-face-default

;;            ;; elfeed
;;            elfeed-log-date-face                 nano-face-faded
;;            elfeed-log-info-level-face           nano-face-default
;;            elfeed-log-debug-level-face          nano-face-default
;;            elfeed-log-warn-level-face           nano-face-popout
;;            elfeed-log-error-level-face          nano-face-popout
;;            elfeed-search-tag-face               nano-face-faded
;;            elfeed-search-date-face              nano-face-faded
;;            elfeed-search-feed-face              nano-face-salient
;;            elfeed-search-filter-face            nano-face-faded
;;            elfeed-search-last-update-face       nano-face-salient
;;            elfeed-search-title-face             nano-face-default
;;            elfeed-search-tag-face               nano-face-faded
;;            elfeed-search-unread-count-face      nano-face-strong
;;            elfeed-search-unread-title-face      nano-face-strong

;;            ;; deft
;;            deft-filter-string-error-face        nano-face-popout
;;            deft-filter-string-face              nano-face-default
;;            deft-header-face                     nano-face-salient
;;            deft-separator-face                  nano-face-faded
;;            deft-summary-face                    nano-face-faded
;;            deft-time-face                       nano-face-salient
;;            deft-title-face                      nano-face-strong

;;            ;; rst
;;            rst-adornment                        nano-face-faded
;;            rst-block                            nano-face-default
;;            rst-comment                          nano-face-faded
;;            rst-definition                       nano-face-salient
;;            rst-directive                        nano-face-salient
;;            rst-emphasis1                        nano-face-faded
;;            rst-emphasis2                        nano-face-strong
;;            rst-external                         nano-face-salient
;;            rst-level-1                          nano-face-strong
;;            rst-level-2                          nano-face-strong
;;            rst-level-3                          nano-face-strong
;;            rst-level-4                          nano-face-strong
;;            rst-level-5                          nano-face-strong
;;            rst-level-6                          nano-face-strong
;;            rst-literal                          nano-face-salient
;;            rst-reference                        nano-face-salient
;;            rst-transition                       nano-face-default

;;            ;; markdown
;;            markdown-blockquote-face             nano-face-default
;;            markdown-bold-face                   nano-face-strong
;;            markdown-code-face                   nano-face-default
;;            markdown-comment-face                nano-face-faded
;;            markdown-footnote-marker-face        nano-face-default
;;            markdown-footnote-text-face          nano-face-default
;;            markdown-gfm-checkbox-face           nano-face-default
;;            markdown-header-delimiter-face       nano-face-faded
;;            markdown-header-face                 nano-face-strong
;;            markdown-header-face-1               nano-face-strong
;;            markdown-header-face-2               nano-face-strong
;;            markdown-header-face-3               nano-face-strong
;;            markdown-header-face-4               nano-face-strong
;;            markdown-header-face-5               nano-face-strong
;;            markdown-header-face-6               nano-face-strong
;;            markdown-header-rule-face            nano-face-default
;;            markdown-highlight-face              nano-face-default
;;            markdown-hr-face                     nano-face-default
;;            markdown-html-attr-name-face         nano-face-default
;;            markdown-html-attr-value-face        nano-face-default
;;            markdown-html-entity-face            nano-face-default
;;            markdown-html-tag-delimiter-face     nano-face-default
;;            markdown-html-tag-name-face          nano-face-default
;;            markdown-inline-code-face            nano-face-popout
;;            markdown-italic-face                 nano-face-faded
;;            markdown-language-info-face          nano-face-default
;;            markdown-language-keyword-face       nano-face-default
;;            markdown-line-break-face             nano-face-default
;;            markdown-link-face                   nano-face-salient
;;            markdown-link-title-face             nano-face-default
;;            markdown-list-face                   nano-face-faded
;;            markdown-markup-face                 nano-face-faded
;;            markdown-math-face                   nano-face-default
;;            markdown-metadata-key-face           nano-face-faded
;;            markdown-metadata-value-face         nano-face-faded
;;            markdown-missing-link-face           nano-face-default
;;            markdown-plain-url-face              nano-face-default
;;            markdown-pre-face                    nano-face-default
;;            markdown-reference-face              nano-face-salient
;;            markdown-strike-through-face         nano-face-faded
;;            markdown-table-face                  nano-face-default
;;            markdown-url-face                    nano-face-salient

;;            ;; ivy
;;            ivy-action                           nano-face-faded
;;            ivy-completions-annotations          nano-face-faded
;;            ivy-confirm-face                     nano-face-faded
;;            ivy-current-match                    (nano-face-strong nano-face-subtle)
;;            ivy-cursor                           nano-face-strong
;;            ivy-grep-info                        nano-face-strong
;;            ivy-grep-line-number                 nano-face-faded
;;            ivy-highlight-face                   nano-face-strong
;;            ivy-match-required-face              nano-face-faded
;;            ivy-minibuffer-match-face-1          nano-face-faded
;;            ivy-minibuffer-match-face-2          nano-face-faded
;;            ivy-minibuffer-match-face-3          nano-face-faded
;;            ivy-minibuffer-match-face-4          nano-face-faded
;;            ivy-minibuffer-match-highlight       nano-face-strong
;;            ivy-modified-buffer                  nano-face-popout
;;            ivy-modified-outside-buffer          nano-face-strong
;;            ivy-org                              nano-face-faded
;;            ivy-prompt-match                     nano-face-faded
;;            ivy-remote                           nano-face-default
;;            ivy-separator                        nano-face-faded
;;            ivy-subdir                           nano-face-faded
;;            ivy-virtual                          nano-face-faded
;;            ivy-yanked-word                      nano-face-faded

;;            ;; helm
;;            helm-selection                       (nano-face-strong nano-face-subtle)
;;            helm-match                           nano-face-strong
;;            helm-source-header                   nano-face-salient
;;            helm-swoop-target-line-face          (nano-face-strong nano-face-subtle)
;;            helm-visible-mark                    nano-face-strong
;;            helm-moccur-buffer                   nano-face-strong
;;            helm-ff-file                         nano-face-faded
;;            helm-ff-prefix                       nano-face-strong
;;            helm-ff-dotted-directory             nano-face-faded
;;            helm-ff-directory                    nano-face-strong
;;            helm-ff-executable                   nano-face-popout
;;            helm-grep-match                      nano-face-strong
;;            helm-grep-file                       nano-face-faded
;;            helm-grep-lineno                     nano-face-faded
;;            helm-grep-finish                     nano-face-default

;;            ;; company
;;            company-tooltip-selection            (nano-face-strong nano-face-subtle)
;;            company-tooltip                      nano-face-default
;;            company-scrollbar-fg                 nano-face-faded
;;            company-scrollbar-bg                 nano-face-default
;;            company-tooltip-common               nano-face-default
;;            company-tooltip-common-selection     (nano-face-strong nano-face-subtle)
;;            company-tooltip-annotation           nano-face-default
;;            company-tooltip-annotation-selection (nano-face-strong nano-face-subtle)

;;            ;; notmuch
;;            notmuch-search-matching-authors      nano-face-default
;;            notmuch-search-date                  nano-face-default
;;            notmuch-search-count                 nano-face-faded
;;            notmuch-tag-face                     nano-face-default
;;            notmuch-tag-unread                   nano-face-popout

;;            ;; clojure
;;            clojure-keyword-face                 (font-lock-constant-face italic)

;;            ;; vertico
;;            orderless-match-face-0               bold))))

;; FIXME not sure why these are needed
;; (car error) (car warning) fixes
;; (cider-error-highlight-face :inherit 'error)
;; (cider-warning-highlight-face :inherit 'nano-face-popout)
;; (spell-fu-incorrect-face :underline `(:color ,nano-color-popout))


(def-themer-theme 'mono-white
  "The simplest theme imaginable"
  mono-white-classes
  mono-facespec)
