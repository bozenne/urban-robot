;;; export to pdf
(defun brice-org-export-to-pdf (&optional arg)
  "Export to pdf using beamer or latex depending on the mode of the org document"
  (interactive "p")
  (if org-beamer-mode
      (org-beamer-export-to-pdf)
    (org-latex-export-to-pdf))
  )

;;; export to latex
(defun brice-org-export-to-latex (&optional arg)
  "Export to latex using beamer or latex depending on the mode of the org document"
  (interactive "p")
  (if org-beamer-mode
      (org-beamer-export-to-latex)
    (org-latex-export-to-latex))
)


;;; open tex file
;;;; tex
;; modified from superman
(defun brice-org-open-corresponding-tex (&optional arg)
  "Open the latex file generated by the org file"
  (interactive "p")
   (let ((target (concat (file-name-sans-extension (buffer-file-name)) ".tex")))
     (if (file-exists-p target)
	 (org-open-file target)
       (message (concat "No such file: " target)))
     )
)

(defun brice-org-export-and-open-corresponding-tex (&optional arg)
  "Open the latex file generated by the org file"
  (interactive "p")
  (brice-org-export-to-pdf)
  (brice-org-open-corresponding-tex)
)

;;;; orgmode
;; modified from superman
(defun brice-org-open-corresponding-pdf (&optional arg)
  "Open the pdf file generated by the org file"
  (interactive "p")
   (let ((target (concat (file-name-sans-extension (buffer-file-name)) ".pdf")))
     (if (file-exists-p target)
	 (org-open-file target)
       (message (concat "No such file: " target)))
     ))

(defun brice-org-export-and-open-corresponding-pdf (&optional arg)
  "Open pdf file"
  (interactive "p")
  (brice-org-export-to-pdf)
  (brice-org-open-corresponding-pdf)
)
