(tool-bar-mode -1)

(add-to-list 'load-path "~/.emacs.d/packages")
(add-to-list 'exec-path "/usr/local/bin/")

(load "mac.el")
(load "elpa.el")
(load "setup-paredit.el")

(load-theme 'leuven t)

(setq c-basic-indent 2)
(setq tab-width 4)
(setq indent-tabs-mode nil)


