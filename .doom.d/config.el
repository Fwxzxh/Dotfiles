;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "J.D Castro"
      user-mail-address "jdemeca01@gmail.com")

;; waifus everywere
(setq fancy-splash-image "~/Pictures/Image-1-25.png")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))


;;Default doom-unicode-font symbola
(setq doom-font (font-spec :family "Iosevka" :size 18)
      doom-variable-pitch-font (font-spec :family "Iosevka")
      doom-big-font (font-spec :family "Fira Code" :size 25))


(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
(setq org-roam-directory "~/org/Files/Roam/")

;; cleaner dashboard
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)
;;(add-hook! '+doom-dashboard-mode-hook (hide-mode-line-mode 1) (hl-line-mode -1))
(setq-hook! '+doom-dashboard-mode-hook evil-normal-state-cursor (list nil))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative
      display-line-numbers-current-absolute t
      display-line-numbers-width 3
      display-line-numbers-widen t)


;; fix scroll lag
(setq scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

;; modeline config
(setq doom-modeline-modal-icon nil)
(setq company-minimum-prefix-length 1
      company-idle-delay 0.0) ;; default is 0.2
(setq all-the-icons-scale-factor 1.2) ;;smalller icons default 1.2
(setq doom-modeline-icon (display-graphic-p)) ;; display icons

;; add pading on the right side of modeline
(after! doom-modeline
  (doom-modeline-def-modeline 'main
    '(bar matches buffer-info remote-host buffer-position parrot selection-info);; TODO search the name of the evil-icon module
    '(misc-info minor-modes checker input-method buffer-encoding major-mode process vcs "  "))) ; <-- added padding here

;; Truncate lines spc-t-t
(map! :leader
      :desc "Toggle truncate lines"
      "t t" #'toggle-truncate-lines)

;; neotree toggle
(map! :leader
      :desc "Toggle neotree"
      "t e" #'neotree-toggle)

;; make him prettier
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; Nicer bullets in org-mode
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;;(require 'sublimity-scroll)

(set-docsets! 'Haskell-mode "Haskell")

;;Ranger config
(ranger-override-dired-mode t)
(setq ranger-cleanup-eagerly t)
(setq ranger-cleanup-on-disable t)
(setq ranger-max-preview-size 10)
(setq ranger-dont-show-binary t)
(setq ranger-show-literal t)

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")


(setq org-publish-project-alist
      '(("org-notes"
         :base-directory "~/org/Files/"
         :publishing-directory "~/org/Publ/"
         :recursive t
         :publishing-function org-twbs-publish-to-html
         ;;:with-sub-superscript nil
         )
        ("org-static"
         :base-directory "~/org/Files/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/org/Publ/"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("org" :components ("org-notes" "org-static"))
        ))

(use-package! org-pandoc-import :after org)

;;bc i suck at my native languaje
(setq ispell-dictionary "espanol")

(setq org-twbs-head-extra "<style>pre { font-size: 16px; background-color: #2E3440; color: #bbb; }</style>")

;; vterm side window
(set-popup-rule! "*SQL: Oracle*" :size 0.3 :vslot -4 :select t :quit nil :ttl 0)


;; tree sitter config
(use-package! tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

;; R A I N B O W S everywere!
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; languaje definitons in eww
(setq +lookup-open-url-fn #'eww)

;; For python-mode, anaconda-mode offers a backend for all three lookup
;; functions. We can register them like so:
(set-lookup-handlers! 'python-mode
  :definition #'anaconda-mode-find-definitions
  :references #'anaconda-mode-find-references
  :documentation #'anaconda-mode-show-doc)

;; pretty indent guides
(setq highlight-indent-guides-method 'character)
(setq highlight-indent-guides-auto-odd-face-perc 23)
(setq highlight-indent-guides-auto-even-face-perc 23)
(setq highlight-indent-guides-auto-character-face-perc 23)
(setq highlight-indent-guides-responsive 'top)
(setq highlight-indent-guides-delay 0)

;; line numbers gotta go fast
(format-mode-line "%l")

;; YOU SHALL NOT PASS COLUMN 100!!
;(setq-default fill-column 100)

;; Iterate through camelCase words
(global-subword-mode 1)

;; Mixed font display in org mode
(add-hook! 'org-mode-hook #'+org-pretty-mode #'mixed-pitch-mode)

;; (custom-set-faces!
;;   '(outline-1 :weight extra-bold)
;;   '(outline-2 :weight bold)
;;   '(outline-3 :weight bold)
;;   '(outline-4 :weight semi-bold)
;;   '(outline-5 :weight semi-bold)
;;   '(outline-6 :weight semi-bold)
;;   '(outline-8 :weight semi-bold)
;;   '(outline-9 :weight semi-bold))

(custom-set-faces!
  '(org-document-title :height 1.2))


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
