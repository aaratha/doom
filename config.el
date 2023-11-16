;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))

(setq doom-font (font-spec :family "Consolas" :size 16)
      doom-variable-pitch-font (font-spec :family "Consolas" :size 15)
      doom-big-font (font-spec :family "Consolas" :size 24))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-nord)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!

(setq org-directory "/OneDrive/org")

(setq org-agenda-files '("./OneDrive/org"))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;

(setq org-agenda-block-separator 8411)

(setq org-agenda-custom-commands
      '(("v" "A better agenda view"
         ((tags "phy"
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "Physics Tasks:")))
          (tags "soc"
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "Sociology Tasks:")))
          (tags "cin"
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "Cinema Tasks:")))
          (tags "personal"
                ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                 (org-agenda-overriding-header "Personal Tasks:")))
          (agenda "")
          (alltodo "")))))


(doom-require 'doom-keybinds)
(doom-require 'doom-ui)
(doom-require 'doom-projects)
(doom-require 'doom-editor)

(setq initial-buffer-choice "./OneDrive/org/start.org")

;; Add MELPA repository to package archives
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(load-theme 'doom-nord t)

(require 'org-yt)

;; (defun org-image-link (protocol link _description)
;;   "Interpret LINK as base64-encoded image data."
;;   (cl-assert (string-match "\\`img" protocol) nil
;;              "Expected protocol type starting with img")
;;   (let ((buf (url-retrieve-synchronously (concat (substring protocol 3) ":" link))))
;;     (cl-assert buf nil
;;                "Download of image \"%s\" failed." link)
;;     (with-current-buffer buf
;;       (goto-char (point-min))
;;       (re-search-forward "\r?\n\r?\n")
;;       (buffer-substring-no-properties (point) (point-max)))))

;; (org-link-set-parameters
;;  "imghttp"
;;  :image-data-fun #'org-image-link)

;; ;; Option 2: Globally
;; (with-eval-after-load 'org (global-org-modern-mode))

;; (org-link-set-parameters
;;  "imghttps"
;;  :image-data-fun #'org-image-link)


(setq org-default-notes-file (concat org-directory "/notes.org"))

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(global-set-key (kbd "C-M-j") #'counsel-switch-buffer)

(use-package all-the-icons)

(use-package olivetti)

(use-package magit)

(setq olivetti-mode :true)

;;use org-bullets
;;(use-package org-bullets
;;  :config

;; org-modern customizations
(use-package org-modern
   :hook
   (org-mode . global-org-modern-mode)
   :custom
   (org-modern-checkbox nil)
   (org-modern-table nil))


(add-hook 'org-mode-hook (lambda ()
        (org-modern-mode 1)))

(setq org-hide-emphasis-markers t)

;; Show hidden emphasis markers
(use-package org-appear
  :hook (org-mode . org-appear-mode))

; varying size headers
;;(add-hook 'org-mode-hook 'variable-pitch-mode)

(package-install 'treemacs)

(package-install 'treemacs-evil)

(use-package treemacs)

(defun transparent(alpha-level no-focus-alpha-level)
 "Let's you make the window transparent"
 (interactive "nAlpha level (0-100): \nnNo focus alpha level (0-100): ")
 (set-frame-parameter (selected-frame) 'alpha (list alpha-level no-focus-alpha-level))
 (add-to-list 'default-frame-alist `(alpha ,alpha-level))

(set-frame-parameter nil 'alpha-background 50)

(add-to-list 'default-frame-alist '(alpha-background . 50))

;;(setq ispell-program-name "/opt/homebrew/bin/aspell")

;;(dolist (hook '(text-mode-hook))
;;  (add-hook hook (lambda () (flyspell-mode 1))))

(use-package nerd-icons)

(setq org-cycle-emulate-tab 'whitestart)



;; Some options for customizing
;; (custom-theme-set-faces
;;    'user
;;    '(org-block ((t (:inherit fixed-pitch))))
;;    '(org-code ((t (:inherit (shadow fixed-pitch)))))
;;    '(org-document-info ((t (:foreground "dark orange"))))
;;    '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
;;    '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
;;    '(org-link ((t (:foreground "royal blue" :underline t))))
;;    '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
;;    '(org-property-value ((t (:inherit fixed-pitch))) t)
;;    '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
;;    '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
;;    '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
;;    '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))

;; smooth scrolling
(good-scroll-mode 1)

(setq python-shell-interpreter
      "C:/Users/aseem/AppData/Local/Programs/Python/Python312/python")
(org-babel-do-load-languages 'org-babel-load-languages '((python . t)))

(defadvice! prompt-for-buffer (&rest _)
  :after 'window-split (switch-to-buffer))

(use-package crux)

;; open current file in BLANK
(global-set-key (kbd "C-c o") #'crux-open-with)

;; line spacing
(setq-default line-spacing 2)

