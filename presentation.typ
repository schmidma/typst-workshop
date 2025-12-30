#import "@preview/polylux:0.4.0": *
#import "@preview/cetz:0.4.2"
#import "@preview/unify:0.7.1": num, numrange, qty, qtyrange
#import "@preview/ccicons:1.0.1": *
#import "@preview/metropolis-polylux:0.1.0" as metropolis

#show: metropolis.setup.with(
  text-font: "Hanken Grotesk",
  text-size: 20pt,
  code-font: "DejaVu Sans Mono",
  math-font: "New Computer Modern Math",
  footer: context {
    let current-page = here().page()
    set text(size: 12pt)
    query(<custom-footnote>)
      .filter(it => it.location().page() == current-page)
      .map(md => md.value)
      .join(linebreak())
  },
)

#let custom-footnote(it) = [
  #metadata(it) <custom-footnote>
]

#show link: underline

#let center-vertically(height: 1fr, it) = block(
  height: height,
  {
    v(1fr)
    it
    v(1fr)
  },
)

#let identity(x) = x
#let centered(it) = align(center, block(align(left, it)))
#let example(code, columns: (1fr, 1fr), show-output: identity) = {
  grid(
    columns: columns,
    gutter: 1em,
    centered(raw(lang: "typ", block: true, code.text)),
    centered(rect(
      fill: gray.lighten(50%),
      radius: 2.5mm,
      inset: 2.5mm,
      rect(
        fill: white,
        inset: 7.5mm,
        show-output(eval(code.text, mode: "markup")),
      ),
    )),
  )
}

#let title-slide(
  title: [],
  subtitle: none,
  author: none,
  date: none,
  extra: none,
) = {
  let content = {
    set text(fill: rgb("#23373b"))
    set align(horizon)
    block(width: 100%, inset: 2em, {
      text(size: 1.3em, strong(title))
      if subtitle != none {
        linebreak()
        text(size: 0.9em, subtitle)
      }
      line(length: 100%, stroke: .05em + rgb("#eb811b"))
      set text(size: .8em)
      if author != none {
        block(spacing: 1em, author)
      }
      if date != none {
        block(spacing: 1em, date)
      }
      set text(size: .8em)
      if extra != none {
        block(spacing: 1em, extra)
      }
    })
  }

  slide(content)
}

#title-slide(
  title: [Typst],
  subtitle: [The Modern Alternative to LaTeX #cc #cc-zero],
  author: [Maximilian Schmidt],
)

#slide[
  = Outline

  #h(2em)#box[#metropolis.outline]
]

#metropolis.new-section[What is Typst?]

#slide[
  = What is Typst?

  #align(center)[
    "Typst is a new markup-based typesetting system for the sciences."
    #v(2em)

    #grid(
      columns: 2,
      gutter: 2em,
      align(
        center + horizon,
        {
          block(
            clip: true,
            radius: 10pt,
            width: 7em,
            image("./assets/typst_logo.png"),
          )
          custom-footnote[Logo: https://avatars.githubusercontent.com/u/67595261?s=200&v=4]
        },
      ),
      [
        #set align(left)
        - /taɪpst/ i.e. 'Ty' like in Typesetting
        - alternative to LaTeX, Word, or Google Docs
        - built to be a pleasure to use
        - powerful and easy to learn
        - blazingly fast compile times
        - free and Open Source (Apache 2.0)
      ],
    )
  ]
]

#slide[
  = When to use Typst?

  #grid(
    columns: (1.5fr, 2fr),
    align(
      center,
      {
        place(
          center + horizon,
          image(
            "./assets/towards-swifter-interstellar-mail-delivery_drop-shadowed.png",
          ),
        )
        custom-footnote[Image: https://typst.app/assets/images/ieee.webp]
      },
    ),
    align(
      center,
      box[
        #set align(left)
        - markup for typesetting documents
        - composing
          - papers
          - reports
          - theses
          - articles
          - books
          - presentations
          - ...
        - takes text files and outputs PDFs
      ],
    ),
  )
]


#slide[
  = Why use Typst?

  Why should I use typst instead of
  #set list(indent: 1em)

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
]

#metropolis.new-section[How to use Typst?]

#slide[
  = Using the Web App

  #figure(
    {
      image("./assets/web-app.png")
      custom-footnote[Image: https://typst.app/assets/videos/mockup.webm]
    },
    supplement: none,
    caption: [https://typst.app],
  )
]

#slide[
  = Using Tinymist in VSCode

  #set align(center)
  #image("./assets/vscode.png")
  #custom-footnote[Image: screenshot]
]

#slide[
  = Using the Command Line Interface

  #set block(above: 1em, below: 1em)
  #v(-1em)
  - Download the latest release from GitHub, and update with
  ```sh
        typst update
  ```

  - Through package managers:
  ```sh
        brew install typst
  ```
  ```sh
        winget install --id Typst.Typst
  ```

  - With a Rust toolchain:
  ```sh
        cargo install --locked typst-cli
  ```

  #v(1.5em)
  and then use
  ```sh
        typst watch document.typ
  ```
]

#slide[
  = How can it be free?

  #v(1em)

  - it is Open Source, and it will stay that way
  - WebApp has subscription plans with additional features
  - typst on-premises: self-hosted version for organizations
  - commercial support contracts

  #v(0.5em)

  #align(
    center,
    image("./assets/typst-pro-transparent.png", height: 8em),
  )
  #custom-footnote[Image: screenshot of https://typst.app/pricing/]
]

#slide[
  #show: metropolis.focus

  #v(-0.5em)
  #set text(size: 50pt)
  Installation and Setup

  #set text(size: 20pt)
  #set align(top)
  #show heading: set block(below: 1em)
  #v(-1em)
  #table(
    columns: (2fr, 3fr),
    inset: (x: 1.4em, y: 1.3em),
    stroke: (x, y) => (
      left: if x > 0 { 0.8pt + white },
      top: if y > 0 { 0.8pt + white },
    ),
    [
      == WebApp

      + Sign up and Log in
      + Create document

      https://typst.app
    ],
    table.cell(
      rowspan: 2,
      [
        == Local Installation

        #set align(left)
        Install the latest release:

        - download binary from GitHub
        - `brew install typst`
        - `cargo install --locked typst-cli`
        - `winget install --id Typst.Typst`
      ],
    ),
    [
      == VSCode

      Install Extension: Tinymist
    ],
  )
]

#metropolis.new-section[Typst Basics]

#slide[
  = Typst Basics

  #example(```typ
  When you begin typing words into a document, those words are automatically arranged into a visually coherent form known as typeset text.
  ```)
]

#slide[
  = Headers

  #example(```typ
  = Introduction
  When you begin typing words into a document, those words are automatically arranged into a visually coherent form known as typeset text.
  ```)
]

#slide[
  = Markup

  #example(```typ
  Okay, let's move to _emphasis_ and *bold* text.
  Markup syntax is generally similar to `AsciiDoc` (this was `raw` for monospace text!)

  ... and even "smart quotes" :)
  ```)
]

#slide[
  = Newlines

  #example(```typ
  You can break \
  lines anywhere you \
  want using the \\ symbol.
  ```)
]

#slide[
  = Lists

  #example(```typ
  + First
  + Second
  + Third

  - First
    - First indented
  - Second
  - Third
    - Third indented
      - even more
  ```)
]

#slide[
  = Mathematical Expressions

  #example(```typ
  $Q = rho A v + C / 2$
  ```)
]

#slide[
  = Mathematical Expressions

  #example(```typ
  $
    7.32 beta +
    sum_(i=0)^nabla
      (Q_i (a_i - epsilon)) / 2
  $
  ```)
]

#slide[
  #show: metropolis.focus

  #text(size: 48pt, weight: "bold")[
    Test it yourself!
  ]

  #set text(size: 24pt)
  #grid(
    columns: 2,
    gutter: 4em,
    [
      #set align(left)
      - Headers
      - Italic/Bold
      - Code (`raw`)
      - Smart Quotes
    ],
    [
      #set align(left)
      - Newlines
      - Lists
      - Enumerations
      - Math
    ],
  )
]

#metropolis.new-section[Typst Advanced]

#slide[
  = Scripting Mode

  *Typst is a programming language!*

  You can assign variables, define functions, work with lists or dictionaries, use loops ...

  To differentiate code and content, Typst has a separate _scripting mode_.

  #center-vertically(
    example(```typ
    // This is regular content
    Hello World!

    // This is math
    $a^2 + b^2 = c^2$

    // This is a function call
    #lorem(5)
    ```),
  )
]

#slide[
  = Code and Content Blocks

  #example(```typ
  #{
    let radius = 2

    let circumference(radius) = {
      2 * calc.pi * radius
    }

    let result = circumference(radius)

    [Result: #result]
  }
  ```)
]

#slide[
  = Arguments

  #example(```typ
  Find the documentation here: #link(
    "https://typst.app/docs/reference/",
    [Official Reference]
  ).

  #quote(
    block: true,
    attribution: "GitHub Copilot",
    [
      The documentation is a great
      resource for learning Typst.
    ]
  )
  ```)
]

#slide[
  #show: metropolis.focus

  #text(size: 48pt, weight: "bold")[
    Script it yourself!
  ]

  #set text(size: 24pt)
  #grid(
    columns: 2,
    gutter: 4em,
    [
      #set align(left)
      - Content Mode
      - Math Mode
      - Script Mode
    ],
    [
      #set align(left)
      - Code Blocks
      - Functions
      - Arguments
    ],
  )
]

#metropolis.new-section[Build your own Paper]

#slide[
  = Set Rules

  #example(```typ
    Hello!

    #set text(font: "DejaVu Sans Mono")
    Hello!

    #[
      #set text(fill: red)
      Hello!
    ]

    #set text(size: 10pt)
    Hello!
  ```)
]

#slide[
  = Show Rules

  #example(```typ
    https://typst.app

    #show link: strong
    https://typst.app

    #show link: set text(fill: red)
    https://typst.app

    #show "km2": $"km"^2$
    200km2
  ```)
]

#slide[
  = Typst Universe

  #align(
    center + horizon,
    image("./assets/universe_drop-shadowed.png"),
  )
  #custom-footnote[Image: screenshot of https://typst.app/universe/search/?kind=templates]
]

#slide[
  = Templates

  #set align(center)
  #grid(
    columns: 2,
    gutter: 3em,
    [
      #set align(left)

      == WebApp

      #v(0.5em)

      #block(inset: (left: 1em))[
        Click "Create Project in app"
      ]

      #v(0.5em)

      == Local

      #v(0.5em)

      #block(inset: (left: 1em))[
        ```bash
        typst init @preview/charged-ieee:0.1.3
        ```
      ]
    ],
    [
      #image("./assets/poster_drop-shadowed.png")
      #custom-footnote[Image: https://collaborating.tuhh.de/es/ce/public/tuhh-typst]
    ],
  )
]

#slide[
  = Figures, Captions, and References

  #example(```typ
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
  ```)
]

#slide[
  = Bibliography

  #example(
    show-output: it => {
      set text(size: 12pt)
      it
    },
    ```typ
    This is a citation to a paper by @johnson2022ai. Followed by a work of John Smith @smith2023modern.

    #bibliography("literature.yaml")
    ```,
  )
]

#slide[
  = ... and so much more

  #block(
    breakable: false,
    grid(
      columns: (1fr, 1fr),
      [
        === Tables
        #block(inset: (left: 1em))[
          #set text(size: 14pt)
          #table(
            columns: (auto, auto, auto),
            inset: 10pt,
            align: horizon,
            table.header([], [*Area*], [*Parameters*]),

            [🚗],
            $ pi h (D^2 - d^2) / 4 $,
            [
              #set align(center)
              $h$, $D$, $d$
            ],
          )]
        === Code blocks
        #block(inset: (left: 1em))[
          ```python
          def f(x):
            return x**2
          ```
        ]
        === Units
        #block(inset: (left: 1em))[
          $qty("1.3+1.2-0.3e3", "erg/cm^2/s", space: "#h(2mm)")$
        ]
        === Symbols
        #v(1.5em)
        #block(inset: (left: 1em))[
          #sym.arrow.r #sym.gt.eq #emoji.face.halo
        ]
      ],
      [
        === Drawings

        #block(inset: (left: 1em))[
          #set text(size: 10pt)
          #cetz.canvas(
            length: 3cm,
            {
              import cetz.draw: *
              scale(x: 0.5, y: 0.5)

              set-style(
                mark: (fill: black, scale: 2),
                stroke: (thickness: 0.4pt, cap: "round"),
                angle: (
                  radius: 0.3,
                  label-radius: .22,
                  fill: green.lighten(80%),
                  stroke: (paint: green.darken(50%)),
                ),
                content: (padding: 1pt),
              )

              grid(
                (-1.5, -1.5),
                (1.4, 1.4),
                step: 0.5,
                stroke: gray + 0.2pt,
              )

              circle((0, 0), radius: 1)

              line((-1.5, 0), (1.5, 0), mark: (end: "stealth"))
              content((), $ x $, anchor: "west")
              line((0, -1.5), (0, 1.5), mark: (end: "stealth"))
              content((), $ y $, anchor: "south")

              for (x, ct) in ((-1, $ -1 $), (-0.5, $ -1 / 2 $), (1, $ 1 $)) {
                line((x, 3pt), (x, -3pt))
                content((), anchor: "north", ct)
              }

              for (y, ct) in (
                (-1, $ -1 $),
                (-0.5, $ -1 / 2 $),
                (0.5, $ 1 / 2 $),
                (1, $ 1 $),
              ) {
                line((3pt, y), (-3pt, y))
                content((), anchor: "east", ct)
              }

              // Draw the green angle
              cetz.angle.angle(
                (0, 0),
                (1, 0),
                (1, calc.tan(30deg)),
                label: text(green, [#sym.alpha]),
              )

              line((0, 0), (1, calc.tan(30deg)))

              set-style(stroke: (thickness: 1.2pt))

              line(
                (30deg, 1),
                ((), "|-", (0, 0)),
                stroke: (paint: red),
                name: "sin",
              )
              content(("sin.start", 50%, "sin.end"), text(red)[$ sin alpha $])
              line("sin.end", (0, 0), stroke: (paint: blue), name: "cos")
              content(
                ("cos.start", 50%, "cos.end"),
                text(blue)[$ cos alpha $],
                anchor: "north",
              )
              line(
                (1, 0),
                (1, calc.tan(30deg)),
                name: "tan",
                stroke: (paint: orange),
              )
              content(
                "tan.end",
                $
                  text(#orange, tan alpha) = text(#red, sin alpha) / text(#blue, cos alpha)
                $,
                anchor: "west",
              )
            },
          )
        ]

        === Plots
        #block(inset: (left: 1em))[
          #cetz.canvas({
            import cetz.draw: *

            // Set up the transformation matrix
            set-transform(
              cetz.matrix.transform-rotate-dir((1, 1, -1.3), (0, 1, .3)),
            )
            scale(x: 1, z: -0.666)

            grid(
              (0, -2),
              (8, 2),
              stroke: gray + .5pt,
            )

            // Draw a sine wave on the xy plane
            let wave(
              amplitude: 1,
              fill: none,
              phases: 2,
              scale: 8,
              samples: 100,
            ) = {
              line(
                ..(
                  for x in range(0, samples + 1) {
                    let x = x / samples
                    let p = (2 * phases * calc.pi) * x
                    ((x * scale, calc.sin(p) * amplitude),)
                  }
                ),
                fill: fill,
              )

              let subdivs = 8
              for phase in range(0, phases) {
                let x = phase / phases
                for div in range(1, subdivs + 1) {
                  let p = 2 * calc.pi * (div / subdivs)
                  let y = calc.sin(p) * amplitude
                  let x = x * scale + div / subdivs * scale / phases
                  line((x, 0), (x, y), stroke: rgb(0, 0, 0, 150) + .5pt)
                }
              }
            }

            group({
              rotate(x: 90deg)
              wave(amplitude: 1.6, fill: rgb(0, 0, 255, 50))
            })
            wave(amplitude: 1, fill: rgb(255, 0, 0, 50))
          })]

        === ...and much more
      ],
    ),
  )
]

#slide[
  = Useful Links

  #block(breakable: false)[
    https://typst.app

    https://typst.app/docs

    https://sitandr.github.io/typst-examples-book/book/

    https://typst.app/universe/

    https://discord.gg/2uDybryKPe

    https://github.com/qjcg/awesome-typst

    https://collaborating.tuhh.de/es/ce/public/tuhh-typst

    https://collaborating.tuhh.de/es/ce/public/templatesforreports

    https://collaborating.tuhh.de/es/ce/public/ies-typst-phd-thesis-template
  ]
]

#slide[
  #show: metropolis.focus

  #set text(weight: "bold")
  Feedback, Questions, and Ideas for Improvement?
]
