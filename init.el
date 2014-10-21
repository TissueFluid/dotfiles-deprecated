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

;; I'm a VIM guy.
(require 'evil)
(evil-mode 1)

;; auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(set-default 'ac-sources (append '(ac-source-filename) ac-sources))
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")

;; auto-complete-{clang, c-headers}
(require 'auto-complete-clang)
(require 'auto-complete-c-headers)
(setq ac-quick-help-delay 0.5)
(defun my-ac-cc-mode-setup ()
  "Setup my c-mode-common-hook."
  (setq ac-sources (append '(ac-source-clang ac-source-c-headers) ac-sources))
  (defvar achead:include-directories)
  (add-to-list 'achead:include-directories '"/usr/include")
  (add-to-list 'achead:include-directories '"/usr/include/c++/4.2.1"))
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)

;; Yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; Fly Check
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

(eval-after-load 'flycheck
  '(progn
     (require 'flycheck-google-cpplint)
     ;; Add Google C++ Style checker.
     ;; In default, syntax checked by Clang and Cppcheck.
     (flycheck-add-next-checker 'c/c++-cppcheck
                                'c/c++-googlelint)))

;; Google C/C++ Style
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; Nyan cat
(require 'nyan-mode)
(setq-default nyan-wavy-trail t)
(nyan-mode)
(nyan-start-animation)

;; Theme
(require 'color-theme)
(require 'color-theme-solarized)
(load-theme 'solarized-light t)

;;; init.el ends here
