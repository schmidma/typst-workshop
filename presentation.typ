#import "@preview/polylux:0.3.1": *
#import "@preview/cetz:0.3.1"
#import "@preview/unify:0.6.0": num, qty, numrange, qtyrange
#import "@preview/ccicons:1.0.0": *

#import themes.metropolis: *

#show: metropolis-theme.with(
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

#set text(font: "Hanken Grotesk", size: 20pt)

#let new-section-slide(name) = {
  let content = {
    utils.register-section(name)
    set align(horizon)
    show: pad.with(20%)
    set text(size: 1.5em)
    name
    v(0.5em)
    block(height: 2pt, width: 100%, spacing: 0pt, m-progress-bar)
  }
  logic.polylux-slide(content)
}

#let identity(x) = x
#let centered(it) = align(center, block(align(left, it)))
#let example(code, columns: (1fr, 1fr), show-output: identity) = {
  show grid.cell: centered
  grid(
    columns: columns,
    gutter: 1em,
    raw(lang: "typ", code.text),
    rect(
      fill: gray.lighten(50%),
      radius: 2.5mm,
      inset: 2.5mm,
      rect(
        fill: white,
        inset: 7.5mm,
        show-output(eval(code.text, mode: "markup")),
      ),
    ),
  )
}

#title-slide(
  title: [Typst],
  subtitle: [The Modern Alternative to LaTeX #cc #cc-zero],
  author: [Maximilian Schmidt],
)

#slide(title: [Outline])[
  #metropolis-outline
]

#new-section-slide[What is Typst?]

#slide(title: [What is Typst?])[
  #set align(center + horizon)
  #align(center)[
    "Typst is a new markup-based typesetting system for the sciences."
  ]
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

#slide(title: [When to use Typst?])[
  #grid(
    columns: (1.5fr, 2fr),
    align(
      center,
      {
        place(
          center + horizon,
          image(
            "./assets/towards-swifter-interstellar-mail-delivery_drop-shadowed.png",
            height: 110%,
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


#slide(title: [Why Typst?])[
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
]

#new-section-slide[How to use Typst?]

#slide(title: [Using the Web App])[
  #figure(
    {
      image("./assets/web-app.png")
      custom-footnote[Image: https://typst.app/assets/videos/mockup.webm]
    },
    supplement: none,
    caption: [https://typst.app],
  )
]

#slide(title: [Using Tinymist in VSCode])[
  #set align(center)
  #image("./assets/vscode.png", height: 120%)
  #custom-footnote[Image: screenshot]
]

#slide(title: [Using the Command Line Interface])[
  - Download the latest release from GitHub, and update with
  ```sh
        typst update
  ```

  - Through package managers:
  ```sh
        brew install typst
  ```

  - With a Rust toolchain:
  ```sh
        cargo install --locked typst-cli
  ```

  #v(1em)
  and then use
  ```sh
        typst watch document.typ
  ```
]

#slide(title: [How can it be free?])[
  #v(0.5em)

  - it is Open Source, and it will stay that way
  - WebApp has subscription plans with additional features
  - typst on-premises: self-hosted version for organizations
  - commercial support contracts

  #v(0.5em)

  #align(
    center + bottom,
    image("./assets/typst-pro-transparent.png", height: 8em),
  )
  #custom-footnote[Image: screenshot of https://typst.app/pricing/]
]

#focus-slide[
  #set text(size: 50pt)
  Installation and Setup

  #set text(size: 20pt)
  #set align(top)
  #show heading: set block(below: 1em)
  #table(
    columns: (2fr, 3fr),
    inset: (x: 1.4em, y: 1em),
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

#new-section-slide[Typst Basics]

#slide(title: [Typst Basics])[
  #example(```typ
  When you begin typing words into a document, those words are automatically arranged into a visually coherent form known as typeset text.
  ```)
]

#slide(title: [Headers])[
  #example(```typ
  = Introduction
  When you begin typing words into a document, those words are automatically arranged into a visually coherent form known as typeset text.
  ```)
]

#slide(title: [Markup])[
  #example(```typ
  Okay, let's move to _emphasis_ and *bold* text.
  Markup syntax is generally similar to `AsciiDoc` (this was `raw` for monospace text!)

  ... and even "smart quotes" :)
  ```)
]

#slide(title: [Newlines])[
  #example(```typ
  You can break \
  lines anywhere you \
  want using the \\ symbol.
  ```)
]

#slide(title: [Lists])[
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

#slide(title: [Mathematical Expressions])[
  #example(```typ
  $Q = rho A v + C / 2$
  ```)
]

#slide(title: [Mathematical Expressions])[
  #example(```typ
  $
    7.32 beta +
    sum_(i=0)^nabla
      (Q_i (a_i - epsilon)) / 2
  $
  ```)
]

#new-section-slide[Typst Advanced]

#slide(title: [Functions])[
  #example(```typ
  To go to scripting mode, type `#` and *some function name* after that. We will start with _something dull_:

  #lorem(5)
  ```)
]

#slide(title: [Content])[
  #example(```typ
  The most "universal" type in Typst language is *content*. Everything you write in the document becomes content.

  #[
    But you can explicitly create it
    with _scripting mode_.

    In square brackets, you can use
    any markup functions.
  ]
  ```)
]

#slide(title: [Arguments])[
  #example(```typ
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
  ```)
]

#slide(title: [Figures, Captions, and References])[
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

#slide(title: [Bibliography])[
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

#slide(title: [... and so much more])[
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
            table.header(
              [],
              [*Area*],
              [*Parameters*],
            ),

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
        #block(inset: (left: 1em))[
          🖂 #sym.arrow.r #sym.gt.eq #emoji.face.halo
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

              grid((-1.5, -1.5), (1.4, 1.4), step: 0.5, stroke: gray + 0.2pt)

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

            grid((0, -2), (8, 2), stroke: gray + .5pt)

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

#slide(title: [Useful Links])[
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

#focus-slide[
  Feedback, Questions, and Ideas for Improvement?
]
