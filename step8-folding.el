;;; start files with folding 
(setq org-startup-folded "content")

(use-package folding :ensure t) 
(folding-mode-add-find-file-hook)
(add-hook 'LaTeX-mode-hook 'folding-mode) 
(add-hook 'ess-mode-hook 'folding-mode) 
(folding-add-to-marks-list 'ess-mode "## {{{ " "## }}}" nil t)

;; http://orgmode.org/worg/org-tutorials/org-outside-org.html
(defvar outline-minor-mode-prefix "\M-#")
(require 'outorg) ;; necessary for outshine
(require 'outshine)
(add-hook 'outline-minor-mode-hook 'outshine-hook-function)
(add-hook 'emacs-lisp-mode-hook 'outline-minor-mode)
(add-hook 'LaTeX-mode-hook 'outline-minor-mode)
(add-hook 'picolisp-mode-hook 'outline-minor-mode)
(add-hook 'clojure-mode-hook 'outline-minor-mode)
(add-hook 'ess-mode-hook 'outline-minor-mode)
(add-hook 'ledger-mode-hook 'outline-minor-mode)
(add-hook 'message-mode-hook 'outline-minor-mode)

(use-package outline-magic :ensure t) 
;; https://stat.ethz.ch/pipermail/ess-help/2007-June/004140.html
;; (add-hook 'ess-mode-hook
;; 	  '(lambda ()
;; 	     (outline-minor-mode)
;; 	     (setq outline-regexp "### [*]\\{1,8\\} ")
;; 	     (defun outline-level
;; 		 (lambda () (interactive) (cond ((looking-at "^### ") 1)((looking-at "^### ") 2)((looking-at "^###") 3) (t 1000)))

;; 	       )
;; 	     ))
