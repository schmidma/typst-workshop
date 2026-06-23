# Typst: The Modern Alternative to LaTeX

This repository contains a presentation on Typst, a modern, markup-based typesetting system designed to be a powerful and user-friendly alternative to LaTeX, Word, or Google Docs.
This presentation covers the basics of Typst, including how to use it, why it is advantageous, and advanced features like mathematical typesetting and code mode.

## Overview

The presentation is designed for a workshop and includes the following sections:

- What is Typst?
- When to Use Typst
- Why Typst?
- How to Use Typst
- Typst Basics
- Typst Advanced Features

## Contents

- `presentation.typ`: The full presentation in Typst format.
- `assets/`: Images and resources
- `examples/`: Sample Typst files used in the presentation.
- `.fonts/`: Bundled fonts used for reproducible local and CI builds.

## Getting Started

Install a recent Typst release. This workshop was last checked with Typst 0.15.0.

From the repository root, build the presentation with:

```sh
typst compile presentation.typ --font-path .fonts/ --ignore-system-fonts
```

If you have `just` installed, you can use the shortcuts:

```sh
just compile
just watch
```

The first build may need internet access to download Typst Universe packages.
Examples that refer to shared repository files should be compiled from the repository root with `--root .`, for example:

```sh
typst compile --root . examples/11-figures.typ
```

## Feedback

Contributions, feedback, and suggestions for improvement are welcome.
Feel free to open an issue or submit a pull request.

## License

This presentation is marked with [CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/?ref=chooser-v1).

Additionally, I'd like to extend my thanks to the awesome Typst documentation, which served as inspiration for many of the explanations provided in this workshop.
