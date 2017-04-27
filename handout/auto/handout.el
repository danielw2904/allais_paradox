(TeX-add-style-hook
 "handout"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "11pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("fontenc" "T1") ("inputenc" "utf8") ("geometry" "left=2cm" "right=2cm" "top=2cm" "bottom=2cm") ("setspace" "doublespacing") ("babel" "ngerman") ("appendix" "toc" "page") ("biblatex" "style=authoryear" "backend=bibtex")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "url")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art11"
    "fontenc"
    "inputenc"
    "geometry"
    "setspace"
    "multicol"
    "csquotes"
    "babel"
    "amsmath"
    "graphicx"
    "cancel"
    "xcolor"
    "array"
    "longtable"
    "booktabs"
    "dcolumn"
    "rotating"
    "appendix"
    "fancyhdr"
    "biblatex")
   (TeX-add-symbols
    '("Ccancel" ["argument"] 1)
    "lagr")
   (LaTeX-add-labels
    "sec:einfuhrung"
    "sec:die-axiome"
    "eq:4"
    "eq:1"
    "eq:2"
    "eq:3"
    "eq:5"
    "sec:allais-paradoxon"
    "eq:6"
    "eq:7"
    "sec:allais-paradoxon-im")
   (LaTeX-add-bibliographies
    "bibliography"))
 :latex)

