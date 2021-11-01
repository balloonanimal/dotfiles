;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; [[file:../../.dotfiles/.config/doom/config.org::*Personal Information][Personal Information:1]]
(setq user-full-name "Zach Rothenberg"
      user-mail-address "zrothenberg1@gmail.com")
;; Personal Information:1 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Basic Settings][Basic Settings:1]]
(setq-default
 x-stretch-cursor t)            ; Stretch the cursor over any large glyphs (like tabs)

(setq
 truncate-string-ellipsis "…") ; Use a unicode ellipsis instead of ... to save
                                        ; space / look better

(global-subword-mode 1)         ; Treat parts of CamelCase words as separate words
                                        ; for the purpose of evil motions (e, b, w) and
                                        ; objects (w)

(setq global-hl-line-modes
      '(prog-mode conf-mode org-agenda-mode)) ; remove hl-line mode from text-mode and special-mode

(setq bookmark-fontify nil) ; disable fontification of bookmark lines
(setq-default truncate-lines nil) ; don't soft wrap lines unless we're in visual-line-mode
(setq-default major-mode 'text-mode) ; most of the time I want text-mode in scratch buffers and unknown filetypes
;; Basic Settings:1 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Windows][Windows:1]]
(setq evil-vsplit-window-right t
      evil-split-window-below t)
;; Windows:1 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Windows][Windows:2]]
(defadvice! zach/prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (consult-buffer))
;; Windows:2 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Source Code Location][Source Code Location:1]]
(setq source-directory "/home/zach/code/other_peoples_repos/emacs/")
;; Source Code Location:1 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Fonts][Fonts:1]]
(setq
 z/font-monospace "monospace"
 z/font-variable-sans "Roboto"
 z/font-unicode "Symbola"
 z/font-serif "Noto Serif")
;; Fonts:1 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Fonts][Fonts:2]]
(setq
 doom-font (font-spec :family z/font-monospace :size 14 :weight 'regular)
 doom-big-font (font-spec :family z/font-monospace :size 32 :weight 'regular)
 doom-variable-pitch-font (font-spec :family z/font-variable-sans :size 16)
 doom-unicode-font (font-spec :family z/font-unicode)
 doom-serif-font (font-spec :family z/font-serif))
;; Fonts:2 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Theme][Theme:2]]
(use-package modus-themes
  :config
  (setq doom-theme 'modus-operandi))
;; Theme:2 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Theme][Theme:3]]
(setq window-divider-default-right-width 16
      window-divider-default-places t
      ;; window-divider-default-places 'right-only
      )
(custom-set-faces!
  `(window-divider             :foreground ,(face-attribute 'default :background))
  `(window-divider-first-pixel :foreground ,(face-attribute 'default :background))
  `(window-divider-last-pixel  :foreground ,(face-attribute 'default :background)))
;; Theme:3 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Minibuffer frame][Minibuffer frame:2]]
(use-package mini-frame
  :after minibuffer
  :config
  (custom-set-faces!
    `(child-frame-border :background ,(face-attribute 'default :foreground)))
  (setq resize-mini-windows         nil
        mini-frame-detach-on-hide   nil
        mini-frame-color-shift-step 0
        mini-frame-advice-functions '(read-from-minibuffer
                                      read-string
                                      yes-or-no-p)
        mini-frame-ignore-commands  '(+default/search-buffer)
        mini-frame-show-parameters
          '((top                      . 0.2)
            (left                     . 0.5)
            (width                    . 0.8)
            (child-frame-border-width . 1)))
  (mini-frame-mode))
;; Minibuffer frame:2 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Modeline][Modeline:1]]
(map! :leader
      :prefix "t"
      :desc "Hide modeline" "m" #'hide-mode-line-mode)
;; Modeline:1 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Splash Screen][Splash Screen:1]]
;; (remove-hook! '+doom-dashboard-functions #'(doom-dashboard-widget-banner
;;                                             doom-dashboard-widget-shortmenu
;;                                             doom-dashboard-widget-loaded
;;                                             doom-dashboard-widget-footer))
(setq +doom-dashboard--width 40)
(defun z/nano-splash ()
  (insert
   (+doom-dashboard--center
    +doom-dashboard--width
    (propertize "GNU Emacs / Doom" 'face '(:weight bold)))
   "\n")
  (insert
   (+doom-dashboard--center
    +doom-dashboard--width
    (propertize "Type SPC h d h for help" 'face `(:foreground "#677691")))
   "\n"))

;; (add-hook! '+doom-dashboard-functions #'z/nano-splash)
(setq +doom-dashboard-functions (list #'z/nano-splash))
;; Splash Screen:1 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Splash Screen][Splash Screen:2]]
(add-hook 'text-scale-mode-hook  #'+doom-dashboard-resize-h)
;; Splash Screen:2 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Splash Screen][Splash Screen:3]]
(setq-hook! '+doom-dashboard-mode-hook evil-normal-state-cursor (list nil))
;; Splash Screen:3 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Frame][Frame:1]]
(push '(internal-border-width . 20) default-frame-alist)
;; Frame:1 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Hl-todo Mode][Hl-todo Mode:1]]
(after! hl-todo
  (setq hl-todo-keyword-faces
        `(;; Use TODO to note missing features or functionality that should be
          ;; added at a later date.
          ("TODO" nano-face-salient)
          ;; Use FIXME to note broken code that needs to be fixed.
          ("FIXME" nano-face-critical)
          ;; Use OPTIMIZE to note slow or inefficient code that may cause
          ;; performance problems.
          ("OPTIMIZE" nano-face-salient)
          ;; Use HACK to note "code smells" where questionable coding practices
          ;; were used and should be refactored away.
          ("HACK" nano-face-salient)
          ;; Use REVIEW to note anything that should be looked at to confirm it is
          ;; working as intended. For example: REVIEW: Are we sure this is how the
          ;; client does X currently?
          ("REVIEW" nano-face-salient)

          ;; Here are keywords I don't use but are added for compatibility with
          ;; other's codebases
          ("NOTE" nano-face-salient)
          ("DEPRECATED" nano-face-salient)
          ("BUG" nano-face-critical)
          ("XXX" nano-face-salient))))
;; Hl-todo Mode:1 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Centering][Centering:1]]
(define-minor-mode centered-mode
  "center text in buffer"
  :init-value nil :lighter nil :global nil
  (if centered-mode
      (progn
        (setq-local visual-fill-column-center-text t)
        (visual-fill-column-mode 1))
    (setq-local visual-fill-column-center-text nil)
    (visual-fill-column-mode 0)))
(map! :leader
      :prefix "t"
      :desc "Center Buffer" "C" #'centered-mode)
;; Centering:1 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Misc][Misc:1]]
(setq display-line-numbers-type nil)
;; Misc:1 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Misc][Misc:3]]
(defadvice! z/replace-rainbow-delimiters (&optional arg)
  :override #'rainbow-delimiters-mode
  nil
  ;; (highlight-parentheses-mode arg)
  )
;; Misc:3 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Company][Company:1]]
(after! company
  (setq company-format-margin-function #'company-text-icons-margin))
;; Company:1 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Evil Mode][Evil Mode:1]]
(setq evil-ex-substitute-global t)
;; Evil Mode:1 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Evil Mode][Evil Mode:2]]
(evil-escape-mode nil)
;; Evil Mode:2 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Evil Mode][Evil Mode:3]]
(defadvice! z/center-after-jump-a (&rest _)
  :after 'evil-ex-search
  (evil-scroll-line-to-center nil))

(after! evil
  (add-hook 'evil-jumps-post-jump-hook #'z/center-after-jump-a))
(after! better-jumper
  (add-hook 'better-jumper-post-jump-hook #'z/center-after-jump-a))
;; Evil Mode:3 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Evil Mode][Evil Mode:4]]
(setq evil-kill-on-visual-paste nil)
;; Evil Mode:4 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Paren Balancing][Paren Balancing:2]]
(use-package! smartparens
  :init (add-hook 'smartparens-strict-mode-hook #'evil-cleverparens-mode)
  :hook ((lisp-mode . smartparens-strict-mode)
         (emacs-lisp-mode . smartparens-strict-mode)
         (clojure-mode . smartparens-strict-mode)))

(after! smartparens
  (show-smartparens-global-mode 1))
;; Paren Balancing:2 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Tweaking Smartparens][Tweaking Smartparens:1]]
(after! smartparens
  (sp-pair "(" ")" :unless '(:rem sp-point-before-word-p)))
;; Tweaking Smartparens:1 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Evil Goggles][Evil Goggles:1]]
(use-package! evil-goggles
  :hook (doom-first-input . evil-goggles-mode)
  :config
  (setq evil-goggles-enable-delete t
        evil-goggles-enable-change t)

  (pushnew! evil-goggles--commands
            '(evil-cp-delete
              :face evil-goggles-delete-face
              :switch evil-goggles-enable-delete
              :advice evil-goggles--generic-blocking-advice)
            '(evil-cp-delete-line
              :face evil-goggles-delete-face
              :switch evil-goggles-enable-delete
              :advice evil-goggles--delete-line-advice)
            '(evil-cp-delete-sexp
              :face evil-goggles-delete-face
              :switch evil-goggles-enable-delete
              :advice evil-goggles--generic-blocking-advice)
            '(evil-cp-delete-enclosing
              :face evil-goggles-delete-face
              :switch evil-goggles-enable-delete
              :advice evil-goggles--generic-blocking-advice)
            '(evil-cp-yank
              :face evil-goggles-yank-face
              :switch evil-goggles-enable-yank
              :advice evil-goggles--generic-async-advice)
            '(evil-cp-yank-line
              :face evil-goggles-yank-face
              :switch evil-goggles-enable-yank
              :advice evil-goggles--generic-async-advice)
            '(evil-cp-yank-sexp
              :face evil-goggles-yank-face
              :switch evil-goggles-enable-yank
              :advice evil-goggles--generic-async-advice)
            '(evil-cp-yank-enclosing
              :face evil-goggles-yank-face
              :switch evil-goggles-enable-yank
              :advice evil-goggles--generic-async-advice)
            '(evil-cp-change
              :face evil-goggles-change-face
              :switch evil-goggles-enable-change
              :advice evil-goggles--generic-blocking-advice)
            '(evil-cp-change-line
              :face evil-goggles-change-face
              :switch evil-goggles-enable-change
              :advice evil-goggles--generic-blocking-advice)
            '(evil-cp-change-sexp
              :face evil-goggles-change-face
              :switch evil-goggles-enable-change
              :advice evil-goggles--generic-blocking-advice)
            '(evil-cp-change-enclosing
              :face evil-goggles-change-face
              :switch evil-goggles-enable-change
              :advice evil-goggles--generic-blocking-advice)
            '(evil-paste-after
              :face evil-goggles-paste-face
              :switch evil-goggles-enable-paste
              :advice evil-goggles--paste-advice
              :after t)
            '(evil-cp-copy-paste-form
              :face evil-goggles-paste-face
              :switch evil-goggles-enable-paste
              :advice evil-goggles--paste-advice
              :after t)))
;; Evil Goggles:1 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*File Templates][File Templates:1]]
(set-file-template! "\\.clj$" :trigger "__" :mode 'clojure-mode)
;; File Templates:1 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Eval][Eval:1]]
(defvar-local +eval/last-result nil)

;; (defadvice! +eval--store-last-result (f &rest args)
;;   :around #'+eval-display-results
;;   (let ((output (nth 0 args))
;;         (buffer (nth 1 args)))
;;     (with-current-buffer buffer
;;       (message "CAPTURED %s" output)
;;       (setq +eval/last-result output)))
;;   (apply f args))

(defun +eval/insert-last-result-at-point ()
  (interactive)
  (insert (format ";; => %s" +eval/last-result)))

(defun +eval/insert-last-result ()
  (interactive)
  (save-excursion
    (evil-cp-end-of-defun)
    (evil-insert-newline-below)
    (+eval/insert-last-result-at-point)))
;; Eval:1 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Lsp][Lsp:1]]
(setq lsp-ui-sideline-enable nil
      lsp-ui-doc-enable nil
      lsp-enable-symbol-highlighting nil
      +lsp-prompt-to-install-server 'quiet)
;; Lsp:1 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Visual Changes][Visual Changes:1]]
(add-hook! pdf-view-mode
           #'pdf-view-midnight-minor-mode
           #'pdf-view-fit-width-to-window
           ;; #'hide-mode-line-mode
           )
;; Visual Changes:1 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Org Mode][Org Mode:1]]
(after! org
  (setq org-directory "~/org/")
  
  (setq org-ellipsis " […]\n "
        org-startup-folded 'fold
        org-hide-emphasis-markers t)
  
  (add-to-list 'org-modules 'org-habit)
  ;; (defadvice! shut-up-org-fancy-priorities-mode-a (orig-fn &rest args)
  ;;   :around #'org-fancy-priorities-mode
  ;;   (ignore-errors (apply orig-fn args)))
  (after! (org-src evil-org)
    (map! :map org-src-mode-map
          [remap evil-save-and-close]          #'org-edit-src-exit
          [remap evil-save-modified-and-close] #'org-edit-src-exit))
  (defvar z/org-gtd-dir (expand-file-name "gtd/" org-directory)
    "Location of my getting things done (gtd) org files. This is where org-capture
    writes to and org-agenda reads from.")
  ;; (setq org-todo-keywords
  ;;       '((sequence
  ;;          "TODO(t)"         ; A task that needs doing and can be started
  ;;          "NEXT(n)"         ; A TODO that is the entry point for work on a project
  ;;          "|"
  ;;          "DONE(d)"         ; A task that has been successfully completed
  ;;          )
  ;;         (sequence
  ;;          "WAITING(w@/!)"   ; A task paused because of something external
  ;;          "HOLD(h@/!)"      ; A task paused because of me
  ;;          "|"
  ;;          "CANCELLED(c@/!)" ; A task that has been cancelled for some reason
  ;;          )))
  
  ;; (setq org-todo-keyword-faces `(("NEXT" . +org-todo-active)
  ;;                                ("WAITING" . +org-todo-onhold)
  ;;                                ("HOLD" . +org-todo-onhold)
  ;;                                ("CANCELLED" . +org-todo-done)))
  (use-package! doct
    :commands (doct))
  (setq +org-capture-todo-file (expand-file-name "todo.org" z/org-gtd-dir)
        +org-capture-notes-file (expand-file-name "notes.org" z/org-gtd-dir)
        +org-capture-projects-file (expand-file-name "projects.org" z/org-gtd-dir))
  (setq org-capture-templates
        (doct `(("Today Todo" :keys "t"
                 :file +org-capture-todo-file
                 :headline "Today"
                 :template ("* [ ] %?"
                            ":PROPERTIES:"
                            ":entered_on: %u"
                            ":END:"
                            "")
                 :prepend t)
                ("Todo" :keys "T"
                 :file +org-capture-todo-file
                 :headline "Inbox"
                 :template ("* TODO %?"
                            ":PROPERTIES:"
                            ":entered_on: %u"
                            ":END:"
                            "")
                 :prepend t)
                ("Note" :keys "n"
                 :file +org-capture-notes-file
                 :headline "Inbox"
                 :template ("* %?"
                            ":PROPERTIES:"
                            ":entered_on: %u"
                            ":END:"
                            ""))
                ("Link" :keys "l"
                 :file +org-capture-notes-file
                 :headline "Inbox"
                 :template ("* %(org-cliplink-capture)"
                            ":PROPERTIES:"
                            ":entered_on: %u"
                            ":END:"
                            "")
                 :prepend t
                 :immediate-finish t)
                ("Email" :keys "e"
                 :file +org-capture-todo-file
                 :headline "Inbox"
                 :template ("* TODO [#A] Reply: %a"
                            ":PROPERTIES:"
                            ":entered_on: %u"
                            ":END:"
                            "")
                 :prepend t
                 :immediate-finish t))))
  (setq org-agenda-files (list z/org-gtd-dir))
  (use-package! org-super-agenda
    :after org-agenda
    :init
    (setq zach/org-agenda-todo-view
          '((agenda "" ((org-agenda-span 'day)
                        (org-agenda-start-day "+0")
                        (org-agenda-skip-function '(org-agenda-skip-entry-if 'deadline))
                        (org-agenda-show-all-dates t)
                        (org-agenda-use-time-grid t)
                        (org-agenda-overriding-header "")
                        (org-super-agenda-groups
                         `((:name "Agenda"
                            :time-grid t
                            ;; :and (:date today
                            ;;       :todo nil)
                            ;; :scheduled today
                            )))))
            (alltodo "" ((org-agenda-overriding-header "")
                         (org-super-agenda-groups
                          `((:name "In Progress"
                             :todo "STRT"
                             :order 1)
  
                            (:name "Deadlines"
                             :deadline today
                             :order 2)
  
                            (:name "Overdue"
                             :deadline past
                             :face nano-face-popout
                             :order 3)
  
                            (:name "Today"
                             :tag "today"
                             ;; :and (:file-path ,+org-capture-todo-file
                             ;;       :heading-regexp ("Today"))
                             :order 4)
  
                            ;; (:name "Habits"
                            ;;  :habit t
                            ;;  :order 5)
  
                            (:name "Due Soon"
                             :deadline future
                             :order 6)
  
                            (:discard (:anything))
  
                            ;; (:name "Habits"
                            ;;  :habit t
                            ;;  :order 4)
                            ;; (:name "Refile"
                            ;;  :file-path "inbox.org"
                            ;;  :order 20)
                            ))))
            ;; (todo "TODO" ((org-agenda-overriding-header "\nEMAILS\n")
            ;;               (org-agenda-files '(,(concat zach/org-gtd-directory "emails.org")))))
            ;; (todo "NEXT" ((org-agenda-overriding-header "\nENTRY POINTS\n")
            ;;               (org-agenda-files '(,(concat zach/org-gtd-directory "projects.org")
            ;;                                   ,(concat zach/org-gtd-directory "contextless.org")))))
            ;; (todo "TODO" ((org-agenda-overriding-header "\nTODOS\n")
            ;;               (org-agenda-files '(,(concat zach/org-gtd-directory "projects.org")
            ;;                                   ,(concat zach/org-gtd-directory "contextless.org")))))
            ;; (todo "TODO" ((org-agenda-overriding-header "\nTO REFILE\n")
            ;;               (org-agenda-files '(,(concat zach/org-gtd-directory "inbox.org")))))
            ))
  
    (add-to-list 'org-agenda-custom-commands `(" " "Zach's Custom Agenda" ,zach/org-agenda-todo-view))
    :config
    (setq org-super-agenda-header-map nil)
    (org-super-agenda-mode)
  
    ;; (defun z/org-habit-heading-insert-consistency-graphs (&optional line)
    ;;   "Insert consistency graph for any tasks under the heading Habit."
    ;;   (let ((inhibit-read-only t)
    ;;         (buffer-invisibility-spec '(org-link))
    ;;         (moment (org-time-subtract nil
    ;;                                    (* 3600 org-extend-today-until))))
    ;;     (save-excursion
    ;;       (goto-char (point-min))
    ;;       (while (not (eobp))
    ;;         (let ((habit (get-text-property (point) 'org-habit-p)))
    ;;           (when habit
    ;;             (move-to-column org-habit-graph-column t)
    ;;             (delete-char (min (+ 1 org-habit-preceding-days
    ;;                                  org-habit-following-days)
    ;;                               (- (line-end-position) (point))))
    ;;             (insert-before-markers
    ;;              (org-habit-build-graph
    ;;               habit
    ;;               (time-subtract moment (days-to-time org-habit-preceding-days))
    ;;               moment
    ;;               (time-add moment (days-to-time org-habit-following-days))))))
    ;;         (forward-line)))))
    )
  (defun z/switch-to-agenda ()
    "Switch to the default agenda view"
    (interactive)
    (org-agenda nil " "))
  (map! "<f12>" #'z/switch-to-agenda)
  (map! :leader
        :prefix "o"
        :desc "Today's Agenda" "t" #'z/switch-to-agenda)
  
  (defun z/find-file-in-org-gtd-dir ()
    "Search for a file in `z/org-gtd-dir'."
    (interactive)
    (doom-project-find-file z/org-gtd-dir))
  (map! :leader
        :prefix "f"
        :desc "Find file in org agenda dir" "a" #'z/find-file-in-org-gtd-dir)
  ;; (use-package! org-agenda
  ;;   :init
  ;;   (setq org-agenda-block-separator nil
  ;;         org-agenda-start-with-log-mode 't)
  
  ;;   :config
  ;;   (setq zach/org-agenda-todo-view
  ;;         `((agenda "" ((org-agenda-span 'day)
  ;;                       (org-agenda-overriding-header "\nTODAY\n")
  ;;                       (org-agenda-start-day "+0")
  ;;                       (org-deadline-warning-days 30)))
  ;;           (todo "TODO" ((org-agenda-overriding-header "\nEMAILS\n")
  ;;                         (org-agenda-files '(,(concat zach/org-gtd-directory "emails.org")))))
  ;;           (todo "NEXT" ((org-agenda-overriding-header "\nENTRY POINTS\n")
  ;;                         (org-agenda-files '(,(concat zach/org-gtd-directory "projects.org")
  ;;                                             ,(concat zach/org-gtd-directory "contextless.org")))))
  ;;           (todo "TODO" ((org-agenda-overriding-header "\nTODOS\n")
  ;;                         (org-agenda-files '(,(concat zach/org-gtd-directory "projects.org")
  ;;                                             ,(concat zach/org-gtd-directory "contextless.org")))))
  ;;           (todo "TODO" ((org-agenda-overriding-header "\nTO REFILE\n")
  ;;                         (org-agenda-files '(,(concat zach/org-gtd-directory "inbox.org")))))))
  
  ;;   (add-to-list 'org-agenda-custom-commands `(" " "Zach's Custom Agenda" ,zach/org-agenda-todo-view))
  
  ;;   (setq org-agenda-time-grid '((daily today require-timed)
  ;;                                (800 1000 1200 1400 1600 1800 2000)
  ;;                                "......" "----------------")))
  ;; (add-hook! org-agenda-mode (setq line-spacing 1))
  ;; (defun z/org-agenda-custom-theming ()
  ;;   (custom-set-faces!
  ;;     `(org-agenda-date-today :weight medium :foreground ,(doom-color 'fg))
  ;;     '(org-agenda-structure :family "Roboto Slab" :weight medium :height 1.6)))
  ;; (after! org (z/org-agenda-custom-theming))
  (setq org-agenda-block-separator ?—
        org-agenda-current-time-string "- - - - - - - - - - now - - - - - - - - - - -")
  (after! org-agenda
    (custom-set-faces!
      `(org-agenda-date-today :inherit 'nano-face-strong :height 1.5)))
  (setq org-agenda-time-grid '((daily today require-timed remove-match)
                               (700 800 900 1000 1100 1200 1300 1400 1500 1600 1700 1800)
                               "······"
                               "╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌"))
  (setq org-log-done 'time
        org-log-into-drawer t)
  ;; (use-package! org-gcal
  ;;   :after org
  ;;   :commands (org-gcal-sync
  ;;              org-gcal-fetch
  ;;              org-gcal-post-at-point
  ;;              org-gcal-delete-at-point)
  ;;   :init
  ;;   (defvar org-gcal-dir (concat doom-cache-dir "org-gcal/"))
  ;;   (defvar org-gcal-token-file (concat org-gcal-dir "token.gpg"))
  ;;   :config
  ;;   (setq org-gcal-client-id (password-store-get "gmail/org-gcal-client-id")
  ;;         org-gcal-client-secret (password-store-get "gmail/org-gcal-client-secret")
  ;;         org-gcal-file-alist `(("zrothenberg1@gmail.com" . ,(concat zach/org-gtd-directory "calendars/personal.org"))))
  ;;   (add-hook! '(org-agenda-finalize-hook org-capture-after-finalize-hook) #'org-gcal-fetch))
  (setq z/org-headline-font z/font-variable-sans)
  (setq z/org-title-font "Roboto Slab")
  
  ;; (setq org-hidden-keywords '(title))
  
  (add-hook! text-mode (setq line-spacing 0.2))
  
  ;; (defun z/org-extra-theming ()
  ;;   (custom-theme-set-faces! 'doom-nano-dark
  ;;     ;; `(outline-1 :family ,z/org-headline-font :height 1.20)
  ;;     ;; `(outline-2 :family ,z/org-headline-font)
  ;;     ;; `(outline-3 :family ,z/org-headline-font)
  ;;     ;; `(outline-4 :family ,z/org-headline-font)
  ;;     ;; `(outline-5 :family ,z/org-headline-font)
  ;;     ;; `(outline-6 :family ,z/org-headline-font)
  ;;     ;; `(outline-7 :family ,z/org-headline-font)
  ;;     ;; `(outline-8 :family ,z/org-headline-font)
  ;;     ;; `(outline-9 :family ,z/org-headline-font)
  ;;     ;; `(org-hide :family ,z/font-monospace)
  ;;     ;; `(org-document-info :height 0.9)
  ;;     ;; `(org-document-info-keyword  :height 0.9)
  ;;     ;; `(org-meta-line  :height 0.9)
  ;;     ;; `(org-meta-line-keyword  :height 0.9)
  ;;     `(org-document-title :foreground ,(doom-color 'fg)
  ;;                          :family ,z/org-title-font :height 250 :weight medium)
  ;;     `(org-ellipsis :foreground ,(doom-color 'comments) :weight medium)
  ;;     `(org-block-begin-line :overline ,(doom-color 'highlight) :background nil)
  ;;     `(org-block-end-line :overline nil :underline ,(doom-color 'highlight) :background nil)
  ;;     `(org-block :background ,(doom-color 'bg))
  ;;     ;; `(org-todo :foreground ,(doom-color 'strings))
  ;;     ;; `(org-headline-done :foreground ,(doom-color 'comments))
  ;;     ))
  ;; (after! org (z/org-extra-theming))
  (defun z/org-num-format (numbering)
    (let* ((numseq (mapconcat #'number-to-string numbering "."))
           (numstr (concat numseq (if (= (length numbering) 1) " | " " — "))))
      (propertize numstr 'face
                  `(;; :family ,z/org-title-font
                    ;; :foreground ,(doom-color 'comments)
                    ;; :background ,(doom-color 'bg)
                    ))))
  
  (setq org-startup-numerated t)
  (setq org-num-max-level 3)
  (setq org-num-format-function 'z/org-num-format)
  (remove-hook! org-mode #'org-superstar-mode)
  (remove-hook! org-mode #'org-fancy-priorities-mode)
  (remove-hook! org-agenda-mode #'org-fancy-priorities-mode)
  
  (setq org-hide-leading-stars nil
        org-indent-mode-turns-on-hiding-stars nil)
  
  ;; (font-lock-add-keywords 'org-mode
  ;;                         '(("^*+ " 0 `(:foreground ,(doom-color 'comments)
  ;;                                       :family ,z/font-monospace
  ;;                                       ;; :height 150
  ;;                                       ) prepend))
  ;;                         'append)
  
  (defvar z/org-stars-min-indent 0)
  
  (defun z/org-stars-compute-prefixes ()
    "Compute prefix strings for regular text and headlines."
  
    (setq org-indent--heading-line-prefixes
          (make-vector org-indent--deepest-level nil))
    (setq org-indent--inlinetask-line-prefixes
          (make-vector org-indent--deepest-level nil))
    (setq org-indent--text-line-prefixes
          (make-vector org-indent--deepest-level nil))
  
    (let* ((headline-levels (org-element-map
                                (org-element-parse-buffer) 'headline
                              #'(lambda (item)
                                  (org-element-property :level item))))
           (indent (if headline-levels (+ 1 (seq-max headline-levels)) 1))
           (indent (max indent z/org-stars-min-indent)))
  
      (dotimes (n org-indent--deepest-level)
        (aset org-indent--heading-line-prefixes n
              (make-string
               (min indent (max 0 (- indent 1 n))) ?\s))
        (aset org-indent--inlinetask-line-prefixes n
              (make-string indent ?\s))
        (aset org-indent--text-line-prefixes n
              (make-string indent ?\s)))))
  
  (advice-add 'org-indent--compute-prefixes :override
              #'z/org-stars-compute-prefixes)
  (add-hook! org-mode #'org-fragtog-mode)
  (plist-put org-format-latex-options :scale 1.8)
  (setq org-format-latex-header (concat org-format-latex-header "\\usepackage{sfmath}"))
  (defun z/org-format-headline--pre-blank ()
    (let* ((elmt (org-element-at-point))
           (begin (org-element-property :begin elmt))
           (headline-end (save-excursion (goto-char begin)
                                         (end-of-line)
                                         (point)))
           (content-begin (org-element-property :contents-begin elmt)))
      (when (eq 'headline (car elmt))
        (if content-begin
            ;; has contents
            (replace-region-contents headline-end content-begin (lambda () "\n"))
          ;; no contents
          (replace-region-contents headline-end
                                   (org-element-property :end elmt)
                                   (lambda () "\n\n"))))))
  
  (defun z/org-format-headline--post-blank ()
    (let* ((elmt (org-element-at-point))
           (end (org-element-property :end elmt))
           (content-end (org-element-property :contents-end elmt)))
      (when (and (eq 'headline (car elmt)) content-end)
        (replace-region-contents content-end end
                                 (lambda () "\n")))))
  
  (defun z/org-format-headline ()
    (z/org-format-headline--pre-blank)
    (z/org-format-headline--post-blank))
  
  (defun z/org-format ()
    (interactive)
    (org-map-entries
     #'z/org-format-headline
     nil   ;; match all headings
     nil)) ;; in the whole buffer
  (setq org-roam-directory (expand-file-name "notes/" org-directory))
  (after! org-roam
    (map! :leader
          :prefix "n"
          :desc "org-roam" "l" #'org-roam
          :desc   "org-roam-insert" "i" #'org-roam-insert
          :desc "org-roam-switch-to-buffer" "b" #'org-roam-switch-to-buffer
          :desc "org-roam-find-file" "f" #'org-roam-find-file
          :desc "org-roam-show-graph" "g" #'org-roam-show-graph
          :desc "org-roam-capture" "c" #'org-roam-capture)))
;; Org Mode:1 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Clojure][Clojure:1]]
(after! cider
  (setq cider-print-options '(("length" 500) ("level" 50))
        cider-repl-pop-to-buffer-on-connect nil)
  (setq cljr-add-ns-to-blank-clj-files nil))
;; Clojure:1 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Compilation][Compilation:1]]
(setq TeX-save-query nil
      TeX-show-compilation t
      TeX-command-extra-options "-shell-escape"
      TeX-engine 'xetex)
;; Compilation:1 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Compilation][Compilation:2]]
(map! :map TeX-mode-map
      :localleader
      :desc "View exported file" "v" #'TeX-view
      :desc "Run a TeX command on master file" "c" #'TeX-command-master)
;; Compilation:2 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Compilation][Compilation:3]]
(setq +latex-viewers '(pdf-tools evince zathura okular skim sumatrapdf))
;; Compilation:3 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Rss][Rss:1]]
(map! :leader
      :prefix "o"
      :desc "Elfeed" "e" #'=rss)

(map! :map elfeed-search-mode-map
      :n "e" #'elfeed-update)

(map! :map elfeed-show-mode-map
      :n "o" #'link-hint-open-link)

(after! elfeed
  (setq
   elfeed-search-filter "@1-week-ago +unread"
   elfeed-search-date-format '("%b %d" 6 :left)
   elfeed-search-print-entry-function #'z/elfeed-search-print-entry
   elfeed-search-title-min-width 80
   elfeed-show-refresh-function #'z/elfeed-show-refresh--better)

  (add-hook! 'elfeed-show-mode-hook (hide-mode-line-mode 1))
  (add-hook! 'elfeed-search-update-hook #'hide-mode-line-mode)

  (defface elfeed-show-title-face '((t (:weight ultrabold :slant italic :height 1.5)))
    "title face in elfeed show buffer"
    :group 'elfeed)

  (defface elfeed-show-author-face `((t (:weight light)))
    "title face in elfeed show buffer"
    :group 'elfeed)

  (defadvice! +rss-elfeed-wrap-h-nicer ()
    "Enhances an elfeed entry's readability by wrapping it to a width of
`fill-column' and centering it with `visual-fill-column-mode'."
    :override #'+rss-elfeed-wrap-h
    (setq-local truncate-lines nil
                shr-width 120
                visual-fill-column-center-text t
                default-text-properties '(line-height 1.1))
    (let ((inhibit-read-only t)
          (inhibit-modification-hooks t))
      (visual-fill-column-mode)
      ;; (setq-local shr-current-font '(:family "Merriweather" :height 1.2))
      (set-buffer-modified-p nil)))

  (defun z/elfeed-search-print-entry (entry)
    "Print ENTRY to the buffer."
    (let* ((ef/date-column-width 8)
           (ef/tag-column-width 20)
           (ef/feed-column-width 20)
           (ef/column-pad 2)
           (ef/padding-width 5)
           ;; (elfeed-goodies/title-column-width 60)
           (ef/ellipsis "[…]")
           (ef/ellipsis-size 4)
           (ef/format-column
            (lambda (string width align)
              (cond
               ((<= width 0) "")
               ((> (length string) width)
                (concat (substring string 0 (- width ef/ellipsis-size)) ef/ellipsis)
                ;; (if (eq align :left)
                ;;     (concat (substring string 0 (- width ef/ellipsis-size)) ef/ellipsis)
                ;;   (concat ef/ellipsis (substring string (+ (- (length string) width) ef/ellipsis-size))))
                )
               (t (format
                   (format "%%%s%d.%ds" (if (eq align :left) "-" "") width width)
                   string)))))

           (date (elfeed-search-format-date (elfeed-entry-date entry)))
           (date-str (concat "[" date "]"))
           (date-column
            (funcall ef/format-column date-str ef/date-column-width :left))

           (feed (elfeed-entry-feed entry))
           (feed-str (if feed
                         (or (elfeed-meta feed :title) (elfeed-feed-title feed))
                       ""))
           (feed-column
            (funcall ef/format-column feed-str ef/feed-column-width :left))

           (title-str
            (or (elfeed-meta entry :title) (elfeed-entry-title entry) ""))
           (title-width (- (window-width)
                           (* 3 ef/column-pad)
                           ;; ef/padding-width
                           ef/date-column-width
                           ef/feed-column-width
                           ef/tag-column-width))
           (title-column
            (funcall ef/format-column title-str title-width :left))

           (tags (mapcar #'symbol-name (elfeed-entry-tags entry)))
           (tags-str (concat (mapconcat 'identity tags ",")))
           (tags-column
            (funcall ef/format-column tags-str ef/tag-column-width :right))

           (title-faces (elfeed-search--faces (elfeed-entry-tags entry))))

      (insert (propertize date-column 'face 'elfeed-search-date-face))
      (insert (make-string ef/column-pad ?\ ))
      (insert (propertize feed-column 'face 'elfeed-search-feed-face))
      (insert (make-string ef/column-pad ?\ ))
      (insert (propertize title-column 'face title-faces 'kbd-help title-str))
      (insert (make-string ef/column-pad ?\ ))
      (insert (propertize tags-column 'face 'elfeed-search-tag-face))
      (setq-local line-spacing 0.2)))

  (defun z/elfeed-show-refresh--better ()
    "Update the buffer to match the selected entry, using a mail-style."
    (interactive)
    (let* ((inhibit-read-only t)
           (title (elfeed-entry-title elfeed-show-entry))
           (date (seconds-to-time (elfeed-entry-date elfeed-show-entry)))
           (author (elfeed-meta elfeed-show-entry :author))
           (link (elfeed-entry-link elfeed-show-entry))
           (tags (elfeed-entry-tags elfeed-show-entry))
           (tagsstr (mapconcat #'symbol-name tags ", "))
           (nicedate (format-time-string "%a, %e %b %Y %T %Z" date))
           (content (elfeed-deref (elfeed-entry-content elfeed-show-entry)))
           (type (elfeed-entry-content-type elfeed-show-entry))
           (feed (elfeed-entry-feed elfeed-show-entry))
           (feed-title (elfeed-feed-title feed))
           (base (and feed (elfeed-compute-base (elfeed-feed-url feed)))))
      (erase-buffer)
      (insert "\n")
      (insert (format "%s\n\n" (propertize title 'face 'elfeed-show-title-face)))
      (insert (format "%s\t" (propertize feed-title 'face 'elfeed-search-feed-face)))
      (when (and author elfeed-show-entry-author)
        (insert (format "%s\n" (propertize author 'face 'elfeed-show-author-face))))
      (insert (format "%s\n\n" (propertize nicedate 'face 'elfeed-log-date-face)))
      (when tags
        (insert (format "%s\n"
                        (propertize tagsstr 'face 'elfeed-search-tag-face))))
      (insert (propertize "Link: " 'face 'message-header-name))
      (elfeed-insert-link link link)
      (insert "\n")
      (cl-loop for enclosure in (elfeed-entry-enclosures elfeed-show-entry)
               do (insert (propertize "Enclosure: " 'face 'message-header-name))
               do (elfeed-insert-link (car enclosure))
               do (insert "\n"))
      (insert "\n")
      (if content
          (if (eq type 'html)
              (elfeed-insert-html content base)
            (insert content))
        (insert (propertize "(empty)\n" 'face 'italic)))
      (goto-char (point-min))))
  )
;; Rss:1 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Mail][Mail:1]]
(map! :leader
      :prefix "o"
      :desc "Mail dashboard" "m" #'notmuch
      :desc "Mail inbox" "M" #'+notmuch-inbox)

(after! notmuch
  (custom-set-faces!
    '(message-header-subject :foreground nil :inherit nano-face-default)
    '(message-header-to :foreground nil :inherit nano-face-salient)))
;; Mail:1 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Mail][Mail:2]]
;; (use-package! notmuch
;;   :config
;;   (defun zach/switch-to-inbox ()
;;     "Open the notmuch inbox"
;;     (interactive)
;;     (notmuch)
;;     (print (current-buffer))
;;     (notmuch-tree "tag:inbox not tag:trash")
;;     (+notmuch/update))
;;   (setq +notmuch-mail-folder "~/.mail/main.gmail")
;;   (map! :desc "notmuch" "<f11>" #'zach/switch-to-inbox))
;; Mail:2 ends here

;; [[file:../../.dotfiles/.config/doom/config.org::*Emacs Everywhere!][Emacs Everywhere!:1]]
(setq emacs-everywhere-frame-name-format "emacs-everywhere")
;; Emacs Everywhere!:1 ends here
