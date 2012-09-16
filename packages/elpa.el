(require 'package)
(require 'cl)

(setq inhibit-startup-messages t)

(add-to-list 'package-archives '("marmalade" .
      "http://marmalade-repo.org/packages/"))

(setq inferior-lisp-program "/usr/local/bin/sbcl")

(package-initialize)

(defvar prelude-packages
  '(ack-and-a-half auctex caml clojure-mode coffee-mode crosshairs deft expand-region feature-mode
                   gist groovy-mode haml-mode haskell-mode inf-ruby
                   magit magithub markdown-mode paredit projectile python
                   sass-mode rainbow-mode scss-mode solarized-theme
                   volatile-highlights yaml-mode yari scala-mode
		   go-mode rust-mode)
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
