;;; init.el --- My Emacs Configuration

;;; Commentary:
;;
;; Plugins I installed:
;;   - evil
;;   - auto-complete
;;   - auto-complete-clang
;;   - auto-complete-c-headers
;;   - Yasnippet
;;   - flycheck
;;   - flycheck-google-cpplint
;;   - google-c-style

;;; Code:
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

; I'm a VIM guy.
;; (require 'evil)
(declare-function evil-mode "evil.el")
(evil-mode 1)

;; evil surround
(declare-function global-evil-surround-mode "evil-surround.el")
(global-evil-surround-mode 1)
;; evil jumper mode
(declare-function global-evil-jumper-mode "evil-jumper.el")
(global-evil-jumper-mode 1)

;; evil commentary
(declare-function evil-commentary-mode "evil-commentary.el")
(evil-commentary-mode)

;; rainbow
(declare-function rainbow-delimiters-mode "rainbow-delimiters.el")
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; auto-complete
; (require 'auto-complete)
; (require 'auto-complete-config)
(defvar ac-sources)
(defvar ac-dictionary-directories)
(declare-function ac-config-default "auto-complete-config.el")
(ac-config-default)
(set-default 'ac-sources (append '(ac-source-filename) ac-sources))
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")

;; auto-complete-{clang, c-headers}
; (require 'auto-complete-clang)
; (require 'auto-complete-c-headers)
(defvar ac-quick-help-delay)
(setq ac-quick-help-delay 0.5)
(defun my-ac-cc-mode-setup ()
  "Setup my c-mode-common-hook."
  (setq ac-sources (append '(ac-source-clang ac-source-c-headers) ac-sources))
  (defvar achead:include-directories)
  (add-to-list 'achead:include-directories '"/usr/include")
  (add-to-list 'achead:include-directories '"/usr/include/c++/4.2.1"))
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)

;; Yasnippet
; (require 'yasnippet)
(declare-function yas-global-mode "yasnippet.el")
(yas-global-mode 1)

;; Fly Check
; (require 'flycheck)
(declare-function global-flycheck-mode "flycheck.el")
(add-hook 'after-init-hook #'global-flycheck-mode)

(declare-function flycheck-add-next-checker "flycheck.el")
(eval-after-load 'flycheck
  '(progn
     (require 'flycheck-google-cpplint)
     ;; Add Google C++ Style checker.
     ;; In default, syntax checked by Clang and Cppcheck.
     (flycheck-add-next-checker 'c/c++-cppcheck
                                'c/c++-googlelint)))

;; Google C/C++ Style
; (require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; Nyan cat
;; (require 'nyan-mode)
;; (setq-default nyan-wavy-trail t)
;; (nyan-mode)
;; (nyan-start-animation)

;; Theme
; (require 'color-theme)
;; (require 'color-theme-solarized)
;; (load-theme 'solarized-light t)

;; Display time
;; (display-time-mode 1)
;; (setq display-time-day-and-date t)

;; Powerline
;; (powerline-default-theme)
(declare-function powerline-evil-vim-color-theme "powerline-evil-themes.el")
(powerline-evil-vim-color-theme)

;; Show line number
(global-linum-mode t)
(defvar linum-format)
(setq linum-format "%d ")
;; (setq linum-format "%4d \u2502 ")

;; save place
(require 'saveplace)
(setq-default save-place t)

;; LaTeX
(defvar TeX-auto-save)
(defvar TeX-parse-self)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master t)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(defvar reftex-plug-into-AUCTeX)
(setq reftex-plug-into-AUCTeX t)

;; smart parens
;; (require 'smartparens-config)
;; (declare-function smartparens-global-mode "smartparens.el")
;; (smartparens-global-mode t)

;; markdown mode
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))

;; NO tabs
; (setq-default indent-tabs-mode nil)

;; org-ac
(org-ac/config-default)

;;; init.el ends here
