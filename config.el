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
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-pine)

(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 16.0)
      doom-variable-pitch-font (font-spec :family "Averia Serif Libre" :size 25.0))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "/Users/aaratha/Library/CloudStorage/OneDrive-Personal/org/")


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
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
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

(set-frame-parameter nil 'alpha-background 40)

(add-to-list 'default-frame-alist '(alpha-background . 40))

;; (pixel-scroll-precision-mode 1)

(map! :leader
      :desc "Treemacs"
      "e" #'treemacs)

;; (package! lsp-tailwindcss :recipe (:host github :repo "merrickluo/lsp-tailwindcss"))

;; Adjust your lsp-mode configurations in config.el
(use-package! lsp-mode
  :init
  ;; Exclude Vue language server for tsx and ts files
  (setq lsp-disabled-clients '(vue-semantic-server))
  :hook
  ((typescript-mode . lsp-deferred)
   (web-mode . lsp-deferred))
  :config
  ;; Configure TypeScript language server
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection
                                     (lambda () '("typescript-language-server" "--stdio")))
                    :major-modes '(typescript-mode web-mode)
                    :priority 1
                    :server-id 'typescript-ls))
  ;; Configure TailwindCSS language server
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection
                                     (lambda () '("tailwindcss-language-server" "--stdio")))
                    :major-modes '(typescript-mode web-mode)
                    :priority 2
                    :server-id 'tailwind-ls))
  )

;; Ensure .tsx and .ts open in appropriate modes
(after! web-mode
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode)))

(setq window-divider-default-right-width 3)

;; (setq shell-file-name "/bin/fish")

;; (setq select-enable-clipboard t)
;; (setq x-select-enable-clipboard-manager nil)

(setq org-appear-mode 1)

;; (setq wl-copy-process nil)

;; (defun my/copy-to-clipboard (text &optional push)
;;   (setq wl-copy-process (make-process :name "wl-copy"
;;                                       :buffer nil
;;                                       :command '("wl-copy" "-f" "-n")))
;;   (process-send-string wl-copy-process text)
;;   (process-send-eof wl-copy-process))

;; (defun my/paste-from-clipboard ()
;;   (if (and wl-copy-process (process-live-p wl-copy-process))
;;       nil
;;     (shell-command-to-string "wl-paste -n")))

;; (setq interprogram-cut-function 'my/copy-to-clipboard)
;; (setq interprogram-paste-function 'my/paste-from-clipboard)




;; ((bg         '("#000f0b" "#0f0f0f" nil          ))
;; (bg-alt     '("#001a11" "#1a1a1a" nil          ))
;; (base5      '("#476b60" "#5f8787" "brightblack"))

(setq treemacs-width 20)

(setq exec-path (append exec-path '("/Applications/SuperCollider.app/Contents/MacOS/")))

(add-to-list 'load-path "/Users/aaratha/Library/Application Support/SuperCollider/downloaded-quarks/scel/el")
(require 'sclang)


(setenv "PATH" (concat (getenv "PATH") ":/Users/aaratha/.ghcup/bin"))
(setq exec-path (append exec-path '("/Users/aaratha/.ghcup/bin")))

(setq haskell-process-type 'ghci)
(setq haskell-process-path-ghci "/Users/aaratha/.ghcup/bin/ghci")

(use-package! odin-mode
  :mode ("\\.odin\\'" . odin-mode)
  :config
  ;; Add any additional configuration here
  )

(setenv "PATH" (concat (getenv "PATH") ":/Users/aaratha/ols"))
(setq exec-path (append exec-path '("/Users/aaratha/ols")))

(use-package! lsp-mode
  :commands (lsp lsp-deferred)
  :hook (odin-mode . lsp) ;; Start lsp when odin-mode is active
  :config
  (add-to-list 'lsp-language-id-configuration '(odin-mode . "odin"))
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-stdio-connection "/Users/aaratha/ols/ols")
    :major-modes '(odin-mode)
    :server-id 'odin-ls)))

(setq magit-define-global-key-bindings nil)

(require 'mouse)
(xterm-mouse-mode t)
(global-set-key [mouse-4] (lambda ()
                        (interactive)
                        (scroll-down 1)))
(global-set-key [mouse-5] (lambda ()
                        (interactive)
                        (scroll-up 1)))
(defun track-mouse (e))
(setq mouse-sel-mode t)

(setq olivetti-body-width 84)


(setenv "PATH" (concat (getenv "PATH") ":/usr/local/texlive/2024/bin/universal-darwin"))
(setq exec-path (append exec-path '("/usr/local/texlive/2024/bin/universal-darwin")))

;; (setq debug-on-error t)

(setq org-hide-emphasis-markers t)

(setq python-python-command "/Users/aaratha/.pyenv/shims/python")

(setq-default c-basic-offset 2)

(c-add-style "microsoft"
          '("stroustrup"
            (c-offsets-alist
             (innamespace . -)
             (inline-open . 0)
             (inher-cont . c-lineup-multi-inher)
             (arglist-cont-nonempty . +)
             (template-args-cont . +))))
(setq c-default-style "microsoft")

;; accept completion from copilot and fallback to company
(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word)))
