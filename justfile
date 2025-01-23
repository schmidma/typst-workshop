compile:
  typst compile presentation.typ --font-path .fonts/ --ignore-system-fonts

watch:
  typst watch presentation.typ --font-path .fonts/ --ignore-system-fonts --open
