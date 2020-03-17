;;; package --- Summary
;;; Code:
;;; Commentary:

(setq user-full-name "Jaron Swab")
(setq user-mail-address "jr@jrswab.com")

;; Define tab width. This only affects how Emacs looks.
;;(setq default-tab-width 2)
;;(setq tab-width 2)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Line highlighting Enabled:
(global-hl-line-mode 1)

;; Enable Line Numbers:
;;(setq display-line-numbers-type 'absolute)

;; Set GUI window size:
(add-to-list 'default-frame-alist '(height . 58))
(add-to-list 'default-frame-alist '(width . 130))
(set-default-font "Hack 10")

(require 'package)
 
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
 
(setq package-enable-at-startup nil)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (helm lsp-ui lsp-mode flycheck go-imports go-errcheck exec-path-from-shell orgit go-autocomplete auto-complete go-mode nord-theme markdown-mode magit))))

;; Vim keybindings
(require 'evil)
(evil-mode t)

(require 'go-mode)

;; Nord Color Theme
(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))
(load-theme 'nord t)

;; Packages
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; Package List:
(use-package go-mode
  :ensure t)
(use-package go-imports
  :ensure t)
(use-package go-errcheck
  :ensure t)
(use-package go-autocomplete
  :ensure t)
(use-package auto-complete
  :ensure t)
(use-package which-key
  :ensure t)
(use-package markdown-mode
  :ensure t)
(use-package orgit
  :ensure t)
(use-package magit
  :ensure t)
(use-package flycheck
  :ensure t)
(use-package exec-path-from-shell
  :ensure t)

(add-hook 'after-init-hook #'global-flycheck-mode)

;; Start Golang stuff

;; Define function to call when go-mode loads
(defun my-go-mode-hook ()
  (add-hook 'before-save-hook 'gofmt-before-save) ; gofmt before every save
  (setq gofmt-command "goimports")                ; gofmt uses invokes goimports
  (if (not (string-match "go" compile-command))   ; set compile command default
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))

  ;; guru settings
  (go-guru-hl-identifier-mode)                    ; highlight identifiers
  
  ;; Key bindings specific to go-mode
  ;;(local-set-key (kbd "M-.") 'godef-jump)         ; Go to definition
  ;;(local-set-key (kbd "M-*") 'pop-tag-mark)       ; Return from whence you came
  ;;(local-set-key (kbd "M-p") 'compile)            ; Invoke compiler
  ;;(local-set-key (kbd "M-P") 'recompile)          ; Redo most recent compile cmd
  ;;(local-set-key (kbd "M-]") 'next-error)         ; Go to next error (or msg)
  ;;(local-set-key (kbd "M-[") 'previous-error)     ; Go to previous error or msg

  ;; Misc go stuff
  (auto-complete-mode 1))                         ; Enable auto-complete mode

;; Connect go-mode-hook with the function we just defined
(add-hook 'go-mode-hook 'my-go-mode-hook)

;; Ensure the go specific autocomplete is active in go-mode.
(with-eval-after-load 'go-mode
   (require 'go-autocomplete))

;; If the go-guru.el file is in the load path, this will load it.
(require 'go-guru)

;; End Golang stuff

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
