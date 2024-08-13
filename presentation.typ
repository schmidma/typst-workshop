#import "@preview/touying:0.4.2": *

#let s = themes.metropolis.register(
  aspect-ratio: "16-9"
)
#let s = (s.methods.info)(
  self: s,
  title: [Typst],
  subtitle: [The Modern Alternative to LaTeX],
)
#let (init, slides, touying-outline, alert) = utils.methods(s)
#show: init

#set text(font: "Hanken Grotesk", size: 20pt)
// #show math.equation: set text(font: "Fira Math")
#set strong(delta: 100)
#set par(justify: true)
#show strong: alert

#set list(indent: 1em)

#let (slide, empty-slide, title-slide, new-section-slide, focus-slide) = utils.slides(s)
#show: slides

= What is Typst?

#slide[
  #set align(center+horizon)
  #align(center)[
    "Typst is a new markup-based typesetting system for the sciences."
  ]
  #v(2em)

  #grid(
    columns: 2,
    gutter: 2em,
    align(
      center+horizon,
      block(
        clip: true,
        radius: 10pt,
        width: 7em,
        image("./assets/typst_logo.png"),
      ),
    ),
    [
      #set align(left)
      - /taɪpst/ i.e. 'Ty' like in Typesetting
      - alternative to LaTex, Word, or Google Docs
      - build to be a pleasure to use
      - powerful and easy to learn
      - blazingly fast compile times
      - free and Open Source (Apache 2.0)
    ],
  )
]

== When to use Typst?

#grid(
  columns: (1.5fr, 2fr),
  [
    #set align(center)
    // #place(
    //   image("./assets/mdpi-large.png")
    // )
    // #place(
    //   dx: 5em,
    //   image("./assets/ieee-large.png")
    // )
    #image("./assets/ieee-large.png")
  ],
  align(center,box[
    #set align(left)
    - markup for typesetting documents
    - composing
      - papers
      - essays
      - reports
      - theses
      - articles
      - books
      - ...
    - takes text files and outputs PDFs
  ]),
)

== Why Typst?

Why should I use typst instead of

#block(inset: (left: 2em))[
Word:
- easy collaboration
- powerful templates that automatically format your work
- higher-quality typographical output

LaTeX:
- instant previews
- clear and understandable error messages
- familiar programming constructs
]


= How to use Typst?

== Using the Web App

#figure(
  image("./assets/web-app.png"),
  supplement: none,
  caption: [https://typst.app],
)

== Using Tinymist in VSCode

#image("./assets/vscode.png")

== Using the CLI

- Downloading the latest release from GitHub, and update with
```sh
      typst update
```

- Through package managers:
```sh
      brew install typst
```

- With Rust a toolchain:
```sh
      cargo install --locked typst-cli
```

#v(1em)
and then use
```sh
      typst watch document.typ
```

== How can it be free?

#v(2em)
- it is Open Source, and it will stay that way
- WebApp has subscription plans with additional features
- typst on-premises: self-hosted version for organizations
- commercial support contracts

#align(center+bottom,
  image("./assets/typst-pro-transparent.png", height: 8em)
)

#focus-slide[
  Questions?
]

#focus-slide[
  #set text(size: 50pt)
  Installation and Setup

  #set text(size: 20pt)
  #block[
    #set align(left)
    - WebApp: Sign up and log in
    - VSCode: Install the extension (Tinymist)
    - CLI: Install the latest release
  ]
]

= Typst Basics

#grid(
  columns: (1fr, 1fr),
  inset: 1em,
  align(center, ```typst
  When you begin typing words into a document, those words are automatically arranged into a visually coherent form known as typeset text.
  ```),
  rect(
    fill: gray.lighten(50%),
    radius: 5pt,
    inset: 0.4em,
    rect(
      fill: white,
      inset: 0.4em,
    )[
      When you begin typing words into a document, those words are automatically arranged into a visually coherent form known as typeset text.
    ]
  )
)

== Headers

#grid(
  columns: (1fr, 1fr),
  inset: 1em,
  align(center, ```typst
  = Introduction
  When you begin typing words into a document, those words are automatically arranged into a visually coherent form known as typeset text.
  ```),
  rect(
    fill: gray.lighten(50%),
    radius: 5pt,
    inset: 0.4em,
    rect(
      fill: white,
      inset: 0.4em,
    )[
    = Introduction
      When you begin typing words into a document, those words are automatically arranged into a visually coherent form known as typeset text.
    ]
  )
)

== Markup

#grid(
  columns: (1fr, 1fr),
  inset: 1em,
  align(center, ```typst
  Okay, let's move to _emphasis_ and *bold* text.
  Markup syntax is generally similar to `AsciiDoc` (this was `raw` for monospace text!)

  ... and even "smart quotes" :)
  ```),
  rect(
    fill: gray.lighten(50%),
    radius: 5pt,
    inset: 0.4em,
    rect(
      fill: white,
      inset: 0.4em,
    )[
      Okay, let's move to _emphasis_ and *bold* text.
      Markup syntax is generally similar to `AsciiDoc` (this was `raw` for monospace text!)

      ... and even "smart quotes" :)
    ]
  )
)

== Newlines

#grid(
  columns: (1fr, 1fr),
  inset: 1em,
  align(center, ```typst
  You can break \
  line anywhere you \
  want using the \\ symbol.
  ```),
  rect(
    fill: gray.lighten(50%),
    radius: 5pt,
    inset: 0.4em,
    rect(
      fill: white,
      inset: 0.4em,
    )[
      You can break \
      line anywhere you \
      want using the \\ symbol.
    ]
  )
)

== Lists

#grid(
  columns: (1fr, 1fr),
  inset: 1em,
  align(center, ```typst
  + First
  + Second
  + Third

  - First
    - First indented
  - Second
  - Third
    - Third indented
      - even more
  ```),
  align(center,rect(
    fill: gray.lighten(50%),
    radius: 5pt,
    inset: 0.4em,
    rect(
      fill: white,
      inset: 0.4em,
    )[
      #set align(left)
      + First
      + Second
      + Third

      #set list(indent: 0pt)
      - First
        - First indented
      - Second
      - Third
        - Third indented
          - even more
    ]
  ))
)

== Maths

#grid(
  columns: (1fr, 1fr),
  inset: 1em,
  align(center,```typst
  $Q = rho A v + C / 2$
  ```),
  align(center, rect(
    fill: gray.lighten(50%),
    radius: 5pt,
    inset: 0.4em,
    rect(
      fill: white,
      inset: 1em,
    )[
      #set align(left)
      $Q = rho A v + C / 2$
    ]
  ))
)

== Maths

#grid(
  columns: (1fr, 1fr),
  inset: 1em,
  align(center,```typst
  $
  7.32 beta +
  sum_(i=0)^nabla
    (Q_i (a_i - epsilon)) / 2
  $
  ```),
  align(center, rect(
    fill: gray.lighten(50%),
    radius: 5pt,
    inset: 0.4em,
    rect(
      fill: white,
      inset: 1em,
    )[
      #set align(left)
      $ 7.32 beta +
        sum_(i=0)^nabla
          (Q_i (a_i - epsilon)) / 2 $
    ]
  ))
)

= Typst Advanced

== Functions

#grid(
  columns: (1fr, 1fr),
  inset: 1em,
  align(center, ```typst
  To go to scripting mode, type `#` and *some function name* after that. We will start with _something dull_:

  #lorem(5)
  ```),
  align(center, rect(
    fill: gray.lighten(50%),
    radius: 5pt,
    inset: 0.4em,
    rect(
      fill: white,
      inset: 0.4em,
    )[
      #set align(left)
      To go to scripting mode, type `#` and *some function name*
      after that. We will start with _something dull_:

      #lorem(5)
    ]
  ))
)

== Content

#grid(
  columns: (1fr, 1fr),
  inset: 1em,
  align(center, ```typst
  The most "universal" type in Typst language is *content*. Everything you write in the document becomes content.

  #[
    But you can explicitly create it
    with _scripting mode_.

    In square brackets, you can use
    any markup functions.
  ]
  ```),
  align(center, rect(
    fill: gray.lighten(50%),
    radius: 5pt,
    inset: 0.4em,
    rect(
      fill: white,
      inset: 0.4em,
    )[
      #set align(left)
  The most "universal" type in Typst language is *content*. Everything you write in the document becomes content.

  #[
    But you can explicitly create it
    with _scripting mode_.

    In square brackets, you can use
    any markup functions.
  ]
    ]
  ))
)

== Arguments

#grid(
  columns: (1fr, 1fr),
  inset: 1em,
  align(center, ```typst
  You find the documentation in the #link("https://typst.app/docs/reference/", [Official Reference]).

  #quote(
    block: true,
    attribution: "Typst Examples Book",
    [
    That's right, links, quotes and
    lots of other document elements are
    created with functions.
    ]
  )
  ```),
  align(center, rect(
    fill: gray.lighten(50%),
    radius: 5pt,
    inset: 0.4em,
    rect(
      fill: white,
      inset: 0.4em,
    )[
      #set align(left)
      You find the documentation in the #link("https://typst.app/docs/reference/")[Official Reference].

      #quote(
        block: true,
        attribution: "Typst Examples Book",
        [
        That's right, links, quotes and lots of
        other document elements are created with functions.
        ]
      )
    ]
  ))
)

== Figures, Captions, and References

#grid(
  columns: (1fr, 1fr),
  inset: 1em,
  align(center, ```typst
  Rivers as shown in @rivers are an important part of the earth's climate system.

  #figure(
   image(
     "./assets/rivers.jpg",
     width: 70%
   ),
   caption: [
    _River_ in a forest.
   ],
  ) <rivers>
  ```),
  align(center, rect(
    fill: gray.lighten(50%),
    radius: 5pt,
    inset: 0.4em,
    rect(
      fill: white,
      inset: 0.4em,
    )[
      #set align(left)
      Rivers as shown in @rivers are an important part of the earth's climate system.

      #figure(
        image("./assets/lorem_picsum.jpg", width: 70%),
        caption: [
          _River_ in a forest.
        ],
      ) <rivers>
    ]
  ))
)

== Bibliography

#grid(
  columns: (1fr, 1fr),
  inset: 1em,
  align(center, ```typst
  This is a citation to a paper by @johnson2022ai. Followed by a work of John Smith @smith2023modern.

  #bibliography("literature.bib")
  ```),
  rect(
    fill: gray.lighten(50%),
    radius: 5pt,
    inset: 0.4em,
    rect(
      fill: white,
      inset: 0.4em,
    )[
      #set text(size: 12pt)

      This is a citation to a paper by @johnson2022ai. Followed by a work of John Smith @smith2023modern.
      #bibliography("literature.bib")
    ]
  )
)

== ... and so much more

- Tables
- Code blocks
- Symbols
- Shapes
- Drawings
- ...

== Useful Links

https://typst.app

https://typst.app/docs

https://sitandr.github.io/typst-examples-book/book/

https://typst.app/universe/

https://collaborating.tuhh.de/es/ce/public/tuhh-typst

https://collaborating.tuhh.de/es/ce/public/templatesforreports

https://collaborating.tuhh.de/es/ce/public/ies-typst-phd-thesis-template
