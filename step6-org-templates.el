;; NOTE: ? is the  where the cursor should wind up at the end

;;; Document class

;;;; Latex default
(add-to-list
 'org-structure-template-alist
 `("Ld" ,(concat
"#+TITLE:
#+Author: " user-full-name
"\n\n

# bibliographystyle:apalike
# [[bibliography:bibliography.bib]]

# @@latex:any arbitrary LaTeX code@@
\n\n

* CONFIG :noexport:
# #+LaTeX_HEADER:\\affil{Department of Biostatistics, University of Copenhagen, Copenhagen, Denmark}
#+LANGUAGE:  en
#+LaTeX_CLASS: org-article
#+OPTIONS:   title:t author:t toc:t todo:nil
#+OPTIONS:   H:3 num:t 
#+OPTIONS:   TeX:t LaTeX:t

** Code
#+PROPERTY: header-args :session *R*
#+PROPERTY: header-args :tange yes % extract source code: http://orgmode.org/manual/Extracting-source-code.html
#+PROPERTY: header-args :eval yes :cache no
#+LATEX_HEADER: \\RequirePackage{fancyvrb}
#+LATEX_HEADER: \\DefineVerbatimEnvironment{verbatim}{Verbatim}{fontsize=\\small,formatcom = {\\color[rgb]{0.5,0,0}}}

** Display 
#+LATEX_HEADER: \\RequirePackage{colortbl} % arrayrulecolor to mix colors
#+LATEX_HEADER: \\RequirePackage{setspace} % to modify the space between lines - incompatible with footnote in beamer
#+LaTeX_HEADER:\\usepackage{authblk} % enable several affiliations (clash with beamer)

** Image
#+LATEX_HEADER: \\RequirePackage{epstopdf} % to be able to convert .eps to .pdf image files

** Latex command
#+LaTeX_HEADER: %
#+LaTeX_HEADER: %%%% additional latex commands %%%%
#+LaTeX_HEADER: %
"
	  )))
;;;; Latex trackchange
(add-to-list
 'org-structure-template-alist
 `("Lchange" ,(concat
"
** TRACK CHANGE
#+LaTeX_HEADER:\definechangesauthor[name={Brice}, color=orange]{Brice}
#+LaTeX_HEADER:\setremarkmarkup{(#2)}
#+LaTeX_HEADER:\colorlet{Changes@Color}{orange} % change default color

## Example
## This is \added[id=Brice]{new} text.
## This is \deleted[id=Brice]{unnecessary}text.
## This is \replaced[id=Brice]{nice}{bad} text.

\n")))


;;;; Latex math
(add-to-list
 'org-structure-template-alist
 `("Lm" ,(concat
"
** Algorithm
#+LATEX_HEADER: \\RequirePackage{amsmath}
#+LATEX_HEADER: \\RequirePackage{algorithm}
#+LATEX_HEADER: \\RequirePackage[noend]{algpseudocode}

** Math
#+LATEX_HEADER: \\RequirePackage{ifthen}
#+LATEX_HEADER: \\RequirePackage{xspace} % space for newcommand macro
#+LATEX_HEADER: \\RequirePackage{xifthen}
#+LATEX_HEADER: \\RequirePackage{xargs}
#+LATEX_HEADER: \\RequirePackage{dsfont}
#+LATEX_HEADER: \\RequirePackage{amsmath,stmaryrd,graphicx}
#+LATEX_HEADER: \\RequirePackage{prodint} % product integral symbol (\\PRODI)

# ## lemma
#+LaTeX_HEADER: \\RequirePackage{amsthm}
#+LaTeX_HEADER: \\newtheorem{theorem}{Theorem}
#+LaTeX_HEADER: \\newtheorem{lemma}[theorem]{Lemma}

*** Template for shortcut
#+LATEX_HEADER: \\newcommand\\defOperator[7]{%
#+LATEX_HEADER:	\\ifthenelse{\\isempty{#2}}{
#+LATEX_HEADER:		\\ifthenelse{\\isempty{#1}}{#7{#3}#4}{#7{#3}#4 \\left#5 #1 \\right#6}
#+LATEX_HEADER:	}{
#+LATEX_HEADER:	\\ifthenelse{\\isempty{#1}}{#7{#3}#4_{#2}}{#7{#3}#4_{#1}\\left#5 #2 \\right#6}
#+LATEX_HEADER: }
#+LATEX_HEADER: }

#+LATEX_HEADER: \\newcommand\\defUOperator[5]{%
#+LATEX_HEADER: \\ifthenelse{\\isempty{#1}}{
#+LATEX_HEADER:		#5\\left#3 #2 \\right#4
#+LATEX_HEADER: }{
#+LATEX_HEADER:	\\ifthenelse{\\isempty{#2}}{\\underset{#1}{\\operatornamewithlimits{#5}}}{
#+LATEX_HEADER:		\\underset{#1}{\\operatornamewithlimits{#5}}\\left#3 #2 \\right#4}
#+LATEX_HEADER: }
#+LATEX_HEADER: }

#+LATEX_HEADER: \\newcommand{\\defBoldVar}[2]{	
#+LATEX_HEADER:	\\ifthenelse{\\equal{#2}{T}}{\\boldsymbol{#1}}{\\mathbf{#1}}
#+LATEX_HEADER: }

*** Shortcuts

**** Probability
#+LATEX_HEADER: \\newcommandx\\Cov[2][1=,2=]{\\defOperator{#1}{#2}{C}{ov}{\\lbrack}{\\rbrack}{\\mathbb}}
#+LATEX_HEADER: \\newcommandx\\Esp[2][1=,2=]{\\defOperator{#1}{#2}{E}{}{\\lbrack}{\\rbrack}{\\mathbb}}
#+LATEX_HEADER: \\newcommandx\\Prob[2][1=,2=]{\\defOperator{#1}{#2}{P}{}{\\lbrack}{\\rbrack}{\\mathbb}}
#+LATEX_HEADER: \\newcommandx\\Qrob[2][1=,2=]{\\defOperator{#1}{#2}{Q}{}{\\lbrack}{\\rbrack}{\\mathbb}}
#+LATEX_HEADER: \\newcommandx\\Var[2][1=,2=]{\\defOperator{#1}{#2}{V}{ar}{\\lbrack}{\\rbrack}{\\mathbb}}

#+LATEX_HEADER: \\newcommandx\\Binom[2][1=,2=]{\\defOperator{#1}{#2}{B}{}{(}{)}{\\mathcal}}
#+LATEX_HEADER: \\newcommandx\\Gaus[2][1=,2=]{\\defOperator{#1}{#2}{N}{}{(}{)}{\\mathcal}}
#+LATEX_HEADER: \\newcommandx\\Wishart[2][1=,2=]{\\defOperator{#1}{#2}{W}{ishart}{(}{)}{\\mathcal}}

#+LATEX_HEADER: \\newcommandx\\Likelihood[2][1=,2=]{\\defOperator{#1}{#2}{L}{}{(}{)}{\\mathcal}}
#+LATEX_HEADER: \\newcommandx\\Information[2][1=,2=]{\\defOperator{#1}{#2}{I}{}{(}{)}{\\mathcal}}
#+LATEX_HEADER: \\newcommandx\\Score[2][1=,2=]{\\defOperator{#1}{#2}{S}{}{(}{)}{\\mathcal}}

**** Operators
#+LATEX_HEADER: \\newcommandx\\Vois[2][1=,2=]{\\defOperator{#1}{#2}{V}{}{(}{)}{\\mathcal}}
#+LATEX_HEADER: \\newcommandx\\IF[2][1=,2=]{\\defOperator{#1}{#2}{IF}{}{(}{)}{\\mathcal}}
#+LATEX_HEADER: \\newcommandx\\Ind[1][1=]{\\defOperator{}{#1}{1}{}{(}{)}{\\mathds}}

#+LATEX_HEADER: \\newcommandx\\Max[2][1=,2=]{\\defUOperator{#1}{#2}{(}{)}{min}}
#+LATEX_HEADER: \\newcommandx\\Min[2][1=,2=]{\\defUOperator{#1}{#2}{(}{)}{max}}
#+LATEX_HEADER: \\newcommandx\\argMax[2][1=,2=]{\\defUOperator{#1}{#2}{(}{)}{argmax}}
#+LATEX_HEADER: \\newcommandx\\argMin[2][1=,2=]{\\defUOperator{#1}{#2}{(}{)}{argmin}}
#+LATEX_HEADER: \\newcommandx\\cvD[2][1=D,2=n \\rightarrow \\infty]{\\xrightarrow[#2]{#1}}

#+LATEX_HEADER: \\newcommandx\\Hypothesis[2][1=,2=]{
#+LATEX_HEADER:         \\ifthenelse{\\isempty{#1}}{
#+LATEX_HEADER:         \\mathcal{H}
#+LATEX_HEADER:         }{
#+LATEX_HEADER: 	\\ifthenelse{\\isempty{#2}}{
#+LATEX_HEADER: 		\\mathcal{H}_{#1}
#+LATEX_HEADER: 	}{
#+LATEX_HEADER: 	\\mathcal{H}^{(#2)}_{#1}
#+LATEX_HEADER:         }
#+LATEX_HEADER:         }
#+LATEX_HEADER: }

#+LATEX_HEADER: \\newcommandx\\dpartial[4][1=,2=,3=,4=\\partial]{
#+LATEX_HEADER: 	\\ifthenelse{\\isempty{#3}}{
#+LATEX_HEADER: 		\\frac{#4 #1}{#4 #2}
#+LATEX_HEADER: 	}{
#+LATEX_HEADER: 	\\left.\\frac{#4 #1}{#4 #2}\\right\\rvert_{#3}
#+LATEX_HEADER: }
#+LATEX_HEADER: }

#+LATEX_HEADER: \\newcommandx\\dTpartial[3][1=,2=,3=]{\\dpartial[#1][#2][#3][d]}

#+LATEX_HEADER: \\newcommandx\\ddpartial[3][1=,2=,3=]{
#+LATEX_HEADER: 	\\ifthenelse{\\isempty{#3}}{
#+LATEX_HEADER: 		\\frac{\\partial^{2} #1}{\\left( \\partial #2\\right)^2}
#+LATEX_HEADER: 	}{
#+LATEX_HEADER: 	\\frac{\\partial^2 #1}{\\partial #2\\partial #3}
#+LATEX_HEADER: }
#+LATEX_HEADER: } 

**** General math
#+LATEX_HEADER: \\newcommand\\Real{\\mathbb{R}}
#+LATEX_HEADER: \\newcommand\\Rational{\\mathbb{Q}}
#+LATEX_HEADER: \\newcommand\\Natural{\\mathbb{N}}
#+LATEX_HEADER: \\newcommand\\trans[1]{{#1}^\\intercal}%\\newcommand\\trans[1]{{\\vphantom{#1}}^\\top{#1}}
#+LATEX_HEADER: \\newcommand{\\independent}{\\mathrel{\\text{\\scalebox{1.5}{$\\perp\\mkern-10mu\\perp$}}}}
#+LaTeX_HEADER: \\newcommand\\half{\\frac{1}{2}}
#+LaTeX_HEADER: \\newcommand\\normMax[1]{\\left|\\left|#1\\right|\\right|_{max}}
#+LaTeX_HEADER: \\newcommand\\normTwo[1]{\\left|\\left|#1\\right|\\right|_{2}}
"
)))

;;;; Latex letter
(add-to-list
 'org-structure-template-alist
 `("Ll" ,(concat
"
#+LaTeX: \\onehalfspacing
#+LaTeX: \\pagestyle{empty}

# ### destinataire
#+BEGIN_EXPORT latex
\\begin{raggedright}
% adresse du destinataire
\\end{raggedright}
#+END_EXPORT

# ### expediteur
#+BEGIN_EXPORT latex
\\begin{raggedleft}
OZENNE Brice \\\\
138L \\O{}resundsvej  \\\\
2300 Copenhague \\\\
\\url{brice.ozenne@orange.fr} \\\\
\\end{raggedleft}
#+END_EXPORT


*Objet:*

\\bigskip
\\bigskip
\\bigskip

Madame, monsieur,

\\bigskip

Je vous prie d'agréer, Madame, Monsieur, mes salutations distinguées. 


# #+ATTR_LATEX: :height 3cm
# [[./Esignature.png]]


* CONFIG :noexport:
#+LANGUAGE:  en
#+LaTeX_CLASS: org-article
#+OPTIONS:   title:nil author:nil toc:nil todo:nil
#+OPTIONS:   H:3 num:t 
#+OPTIONS:   TeX:t LaTeX:t

** code
#+PROPERTY: header-args :session *R*
#+PROPERTY: header-args :tange yes % extract source code: http://orgmode.org/manual/Extracting-source-code.html
#+PROPERTY: header-args :cache no

** latex packages
#+LaTeX_HEADER: %
#+LaTeX_HEADER: %%%% additional packages %%%%
#+LaTeX_HEADER: %
#+LaTeX_HEADER:\\usepackage{authblk}

** latex command
#+LaTeX_HEADER: %
#+LaTeX_HEADER: %%%% additional latex commands %%%%
#+LaTeX_HEADER: %
"
	  )))

;;;; Latex recette
(add-to-list
 'org-structure-template-alist
 `("recette" ,(concat
"
#+BEGIN_EXPORT latex
\\recette{% temps de préparation

}{% cuisson-conservation

}{ % ingrédients
\\begin{itemize}
  \\item eau
\\end{itemize}
}{ % instructions

}{ % extensions

}
#+END_EXPORT"
)))


;;;; Latex graph
(add-to-list
 'org-structure-template-alist
 `("Lg" ,(concat
"
#+ATTR_LaTeX: :width 1\\textwidth :placement [!h]
[[./figures/]]
\n")))


;;;; Beamer
(add-to-list
 'org-structure-template-alist
 `("Lb" ,(concat
"#+TITLE:
#+Author: " user-full-name
"\n#+Latex_header:\\institute{}
#+DATE: 
#+EMAIL:" user-mail-address
"\n\n
* Introduction\n
** Part I\n
*** First slide\n
\n\n

## ** References
## :PROPERTIES:
## :BEAMER_OPT: fragile,allowframebreaks
## :END:  
## bibliographystyle:apalike
## [[bibliography:bibliography.bib]]

\n\n

* CONFIG :noexport:
# #+LaTeX_HEADER:\\affil{Department of Biostatistics, University of Copenhagen, Copenhagen, Denmark}
#+LANGUAGE:  en
#+startup: beamer
#+LaTeX_CLASS: beamer
#+LaTeX_class_options: [table] 
#+LaTeX_HEADER: \\subtitle{}
#+LaTeX_HEADER: \\setbeamertemplate{footline}[frame number]
#+LaTeX_HEADER: \\setbeamertemplate{navigation symbols}{}
#+OPTIONS:   title:t author:t toc:nil todo:nil
#+OPTIONS:   H:3 num:t 
#+OPTIONS:   TeX:t LaTeX:t

** Code
#+PROPERTY: header-args :session *R*
#+PROPERTY: header-args :tange yes % extract source code: http://orgmode.org/manual/Extracting-source-code.html
#+PROPERTY: header-args :cache no
#+LATEX_HEADER: \\RequirePackage{fancyvrb}
#+LATEX_HEADER: \\DefineVerbatimEnvironment{verbatim}{Verbatim}{fontsize=\\small,formatcom = {\\color[rgb]{0.5,0,0}}}

** Display 
#+LATEX_HEADER: \\RequirePackage{colortbl} % arrayrulecolor to mix colors

** Image
#+LATEX_HEADER: \\RequirePackage{epstopdf} % to be able to convert .eps to .pdf image files

** Latex command
#+LaTeX_HEADER: %
#+LaTeX_HEADER: %%%% additional latex commands %%%%
#+LaTeX_HEADER: %
*** Backup slides
#+LATEX_HEADER: \\newcommand{\\backupbegin}{
#+LATEX_HEADER:   \\newcounter{finalframe}
#+LATEX_HEADER:   \\setcounter{finalframe}{\\value{framenumber}}
#+LATEX_HEADER: }
#+LATEX_HEADER: \\newcommand{\\backupend}{
#+LATEX_HEADER:   \\setcounter{framenumber}{\\value{finalframe}}
#+LATEX_HEADER:}
*** Footnotes
#+LaTeX_HEADER: \\RequirePackage{hanging}
#+LaTeX_HEADER: \\setbeamertemplate{footnote}{%
#+LaTeX_HEADER:   \\hangpara{2em}{1}%
#+LaTeX_HEADER:   \\makebox[2em][l]{\\insertfootnotemark}\\footnotesize\\insertfootnotetext\\par%
#+LaTeX_HEADER: } 

** Theme
#+BEAMER_THEME: Singapore [height=20pt]
"
)))

;; "\n#+OPTIONS: H:3 num:t toc:nil \\n:nil @:t ::t |:t ^:t -:t f:t *:t <:t
;; #+OPTIONS: TeX:t LaTeX:t skip:nil d:t todo:t pri:nil tags:not-in-toc
;; #+INFOJS_OPT: view:nil toc:nil ltoc:t mouse:underline buttons:0 path:http://orgmode.org/org-info.js



;;; org shortcut
;;;; latex header
(add-to-list
 'org-structure-template-alist
 '("Lh" "#+LaTeX_HEADER:?"))

(add-to-list
 'org-structure-template-alist
 '("Lf"
"#+name: fig:1
#+ATTR_LATEX: :width 0.7\\textwidth
#+CAPTION:\n"
))


;;;; Two column slides
(add-to-list
 'org-structure-template-alist
 '("Bc" "
**** Untitled column
    :PROPERTIES:
    :BEAMER_col: 0.5
    :END:

**** Titled column 
    :PROPERTIES:
    :BEAMER_col: 0.5
    :BEAMER_env: block
    :END:

**** Back to no columns 
    :PROPERTIES:
    :BEAMER_env: ignoreheading
    :END:
    "))

;;;; latex align
(add-to-list
 'org-structure-template-alist
 '("leq" 
"#+BEGIN_EXPORT latex
\\begin{align*}
?
\\end{align*}
#+END_EXPORT"))
;;;; latex one line formula
(add-to-list
 'org-structure-template-alist
 '("leqO" 
"#+BEGIN_EXPORT latex
\\[ ? \\]
#+END_EXPORT"))
;;;; latex columns
(add-to-list
 'org-structure-template-alist
 '("lcol" 
"#+LaTeX: \\begin{columns}
#+LaTeX: \\begin{column}{0.45\\columnwidth}
?
#+LaTeX: \\end{column}
#+LaTeX: \\begin{column}{0.45\\columnwidth}

#+LaTeX: \\end{column}
#+LaTeX: \\end{columns}"))
;;;; contact
(add-to-list
 'org-structure-template-alist
 '("contact" 
"** ? :TAG: 
:PROPERTIES:
:EMAIL1: 
:TELEPHONE1: 
:ADRESS1: 
:WORK: 
:LEISURE: 
:WITH: 
:KIDS: 
:DATE-OF-BIRTH:
:END:          "))

;;; R code
;;;; R hide code and result
(add-to-list
 'org-structure-template-alist
 '("Rh" 
"#+BEGIN_SRC R :results output raw drawer  :exports none :session *R* :cache no 

#+END_SRC"))

;;;; R export code and result (output)
(add-to-list
 'org-structure-template-alist
 '("Re"
"#+BEGIN_SRC R :exports both :results output :session *R* :cache no

#+END_SRC"	
))

;;;; R export code and result (latex)
(add-to-list
 'org-structure-template-alist
 '("Rl"
"#+BEGIN_SRC R :exports both :results latex :session *R* :cache no

#+END_SRC"	
))

;;;; R export graphic
(add-to-list
 'org-structure-template-alist
 '("Rg"
"   
# see https://orgmode.org/worg/org-contrib/babel/languages/ob-doc-R.html for more arguments
# #+header: :width 4 :height 4 :R-dev-args bg=\"lightgrey\" 
#+BEGIN_SRC R :results graphics :file %file :exports results :session *R* :cache no

#+END_SRC

#+name: fig:1
#+ATTR_LATEX: :width 0.7\\textwidth
#+CAPTION:\n"
))

;;; Lips code
(add-to-list
 'org-structure-template-alist
 '("lisp" 
"#+BEGIN_SRC emacs-lisp

#+END_SRC"))

;;; Agenda template

(add-to-list
 'org-structure-template-alist
 '("event" 
   "* Event
   :PROPERTIES:
   :on:
   :with:
   :END:"
   ))

(add-to-list
 'org-structure-template-alist
 '("meeting" 
   "* Meeting
   :PROPERTIES:
   :on:
   :with:
   :END:"
   ))

 (add-to-list
 'org-structure-template-alist
 '("task" 
   "* Task
   :PROPERTIES:
   :on:
   :with:
   :END:"
   ))

