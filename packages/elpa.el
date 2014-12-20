(require 'package)
(require 'cl)

(setq inhibit-startup-messages t)

(add-to-list 'package-archives '("marmalade" .
      "http://marmalade-repo.org/packages/"))

(setq inferior-lisp-program "/usr/local/bin/sbcl")

(package-initialize)

(defvar prelude-packages
  '(gist haskell-mode inf-ruby magit markdown-mode paredit cider)
  "A list of packages to ensure are installed at launch.")

(defun prelude-packages-installed-p ()
  (loop for p in prelude-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (prelude-packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs Prelude is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p prelude-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(provide 'prelude-packages)
;;; prelude-packages.el ends here
