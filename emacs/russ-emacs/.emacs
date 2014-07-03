;------window system switch------;
;window-system is true for anything that isn't a character-only terminal
(if (window-system)
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode 0)
      (set-fringe-mode 0)
      (set-face-attribute 'default nil :font "Anonymous Pro 14"))
     (progn
      (menu-bar-mode -1)))
;------end window system switch------;

;------package and repository management------;
(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

;temporarily changes the current directory to "~/.emacs.d/, then loads subdirs into loadpath
(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))
;------end package and repository management------;

;------hooks------;
(add-hook 'text-mode-hook 'turn-on-auto-fill)
;------end hooks------;

;------custom keybinds------;
(setq mac-command-modifier 'control) ;if on a Mac, changes Command to Control
				     ;Command is intended to be changes with
				     ;Caps Lock outside of Emacs.
(global-set-key(kbd "C-x C-x") 'set-mark-command)
;------end custom keybinds------;

;------other custom-set variables------;
(setq make-backup-files 'nil) ;keep emacs from generating backup files
(fset 'yes-or-no-p 'y-or-n-p) ;shorten yes-or-no prompts
(setq next-line-add-newlines t)
(setq js-indent-level 8)
(set-default 'truncate-lines t)
(setq ns-use-srgb-colorspace t)
;------end other custom-set variables------;

;------custom theme management------;
;creates list of directories where installed themes are stored
(setq theme-dir-list '("~/.emacs.d/git-packages/emacs-color-theme-solarized/"))
(setq custom-theme-load-path (append custom-theme-load-path theme-dir-list))

;loads for custom themes
(load-theme 'solarized-dark t)
;------end custom theme management------;

;------language binaries------;
(setq scheme-program-name
    "/Applications/mit-scheme.app/Contents/Resources/mit-scheme")

(require 'xscheme)
;------end language binaries------;

 ;------variables set by Customize------;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Org-startup-indented t)
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(org-log-done (quote note))
 '(org-src-fontify-natively t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(minibuffer-prompt ((t (:foreground "#2075c7" :inverse-video nil :underline nil :slant normal :weight bold))))
 '(org-date ((t (:foreground "#839496"))) t)
 '(org-level-1 ((t (:foreground "#b58900" :height 140))) t)
 '(org-level-2 ((t (:foreground "#cb4b16"))) t)
 '(org-level-3 ((t (:foreground "#dc322f"))) t)
 '(org-level-4 ((t (:foreground "#d33682"))) t)
 '(org-level-5 ((t (:foreground "#6c71c4"))) t)
 '(org-level-6 ((t (:foreground "#268bd2"))) t)
 '(org-level-7 ((t (:foreground "#2aa198"))) t)
 '(org-level-8 ((t (:foreground "#859900"))) t)
 '(org-special-keyword ((t (:foreground "#52676f"))) t)
 '(org-todo ((t (:background "#c60007" :foreground "#042028" :inverse-video t :underline nil :slant normal :weight bold))) t))
 ;------end variables set by Customize------;
