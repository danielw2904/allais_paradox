(TeX-add-style-hook
 "presentation"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("babel" "german") ("biblatex" "style=authoryear" "backend=bibtex")))
   (TeX-run-style-hooks
    "latex2e"
    "beamer"
    "beamer10"
    "babel"
    "biblatex"
    "eurosym")
   (LaTeX-add-labels
    "sec:experiment"
    "sec:einfuhrung"
    "eq:4"
    "eq:1"
    "eq:2"
    "eq:3")
   (LaTeX-add-bibliographies
    "bibliography"))
 :latex)

