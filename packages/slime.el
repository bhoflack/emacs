(setq inferior-lisp-program "/usr/local/bin/sbcl")

(add-to-list 'load-path "~/.emacs.d/vendor/slime")
(require 'slime)
(slime-setup '(slime-fancy))

