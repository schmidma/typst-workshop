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
  show grid.cell: centered
  grid(
    columns: columns,
    gutter: 1em,
    raw(lang: "typ", block: true, code.text),
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
    set page(footer: none)
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
  author: [Swantje Plambeck, Til Hillebrecht, Maximilian Schmidt, Rasmus Mecklenburg],
)

#slide[
  = Outline

  #h(2em)#box[#metropolis.outline]

  #h(1cm)

  == #emoji.checkmark.box What we will do

  Exchange about Typst, its features, and how to use it, templates, and best practices.

  == #emoji.crossmark.box What we won't do

  Introduction on how to use Typst in detail (but you may discuss in the round tables).
]

#slide[
  = Motivation

  #align(center, grid(
    columns: (1fr, 1fr),
    inset: 0.5em,
    image("assets/overleaf.png"), image("assets/waiting.jpg", width: 90%),
  ))

  #custom-footnote[Image: https://www.kapwing.com/explore/mr-bean-waiting-meme-template]
]

#slide[
  = Motivation

  // #set align(center + horizon)
  #align(center + horizon, image("assets/ag3elf.jpg"))
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
  = Round Tables

  Discuss experiences with Typst, ask questions, and share tips and tricks with fellow users.

  == Suggested topics
  - Getting started with Typst (Maxi)
  - Coding in Typst: Macros, Functions, and Conditionals (Rasmus)
  - Designing Templates in Typst (Til)
  - Custom Corporate Designs & Continuous Integration (Swantje)
]
