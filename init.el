;;===========================general settings==========================
;; general settings
(setq ring-bell-function 'ignore)
(add-to-list 'default-frame-alist '(fullscreen . fullboth))
;; adding a clock in the bar
(display-time-mode)
;; unbind the arrow keys to force myself to learn movement
(global-unset-key (kbd "<left>"))
(global-unset-key (kbd "<right>"))
(global-unset-key (kbd "<up>"))
(global-unset-key (kbd "<down>"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(evil-collection zone-nyan dimmer evil nova-theme nov))
 '(shift-select-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;===========================================================================


;;=====================changing behaviors to focus new windows===============
;; changing behaviors to focus new windows
(defun split-window-right-and-focus ()
  (interactive)
  (split-window-right)
  (other-window 1))
(global-set-key (kbd "C-x 3") #'split-window-right-and-focus)

(defun split-window-below-and-focus ()
  (interactive)
  (split-window-below)
  (other-window 1))
(global-set-key (kbd "C-x 2") #'split-window-below-and-focus)

(defun list-buffers-and-focus ()
  (interactive)
  (list-buffers)
  (other-window 1))
(global-set-key (kbd "C-x C-b") #'list-buffers-and-focus)
;;===================================================================



;;==========================Org Mode Settings============================
;; adding the recommended org mode key bindings
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)
(setq org-directory "/mnt/c/Users/Marito/Documents/life-os/org/")
(setq org-capture-templates
      `(("t" "Todo" entry
         (file+headline
	  ,(expand-file-name "inbox.org" org-directory)
	  "Inbox")
         "* TODO %?\n%U\n")))
;; change all the directory paths on every machine emacs is installed on
(setq org-agenda-files
      `(,(expand-file-name "inbox.org" org-directory)
	,(expand-file-name "tasks.org" org-directory)
	,(expand-file-name "notes.org" org-directory)
	,(expand-file-name "calendar.org" org-directory)
	,(expand-file-name "writing.org" org-directory)
	,(expand-file-name "dreams.org" org-directory)))
(setq org-refile-targets '((org-agenda-files :maxlevel . 3)))
(setq org-refile-use-outline-path t)
;; place me into insert mode when I enter capture state
(add-hook 'org-capture-mode-hook 'evil-insert-state)
;; adding the recommended org mode key bindings
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)
;;===================================================================


;;===================    PACKAGE MAINTENANCE    ====================
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; adding support for epubs - did this to read "Mastering Emacs"
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

;; requiring evil mode
(unless (package-installed-p 'evil)
  (package-refresh-contents)
  (package-install 'evil))
(setq evil-want-keybinding nil)
(require 'evil)
(evil-mode 1)
(unless (package-installed-p 'evil-collection)
  (package-refresh-contents)
  (package-install 'evil-collection))
(require 'evil-collection)
(evil-collection-init)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; adding support for epubs - did this to read "Mastering Emacs"
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

;; requiring evil mode
(unless (package-installed-p 'evil)
  (package-refresh-contents)
  (package-install 'evil))
(setq evil-want-keybinding nil)
(require 'evil)
(evil-mode 1)
(unless (package-installed-p 'evil-collection)
  (package-refresh-contents)
  (package-install 'evil-collection))
(require 'evil-collection)
(evil-collection-init)


