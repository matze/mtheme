## Metropolis

This fork adds a Libreoffice Impress template and color palette based on
metropolis, for anybody who likes the theme but rather would prefer to use
Impress.

**IMPORTANT NOTICES FOR VERSION 1.0**

* The package and theme name changed from *m* to *metropolis*!
* The `title format` values have been restructured. Please refer to the
  [manual][].

---

Metropolis is a simple, modern Beamer theme suitable for anyone to use. It tries
to minimize noise and maximize space for content; the only visual flourish it
offers is an (optional) progress bar added to each slide. The core design
principles of the theme were described in a blog post
[here](http://bloerg.net/2014/09/20/a-modern-beamer-theme.html).

Not convinced? Have a look at the [demo slides][].

![Sample](http://i.imgur.com/Bxu52fz.png)

## Installation (Impress)

- Move file `impress/metropolis.soc` to (this works for an Ubuntu system)
  `~/.config/libreoffice/4/user/config/metropolis.soc`
- Move file `impress/metropolis-for-impress.otp` to any location of your choice
  where it can stay permanently.
- Install the [FiraSans][] and [FiraMono][] fonts on your system.
- When you now open the metropolis-for-impress.otp file, Impress creates a new
  document based on the template, including some example slides.

## Installation (LaTeX)

To install a stable version of this theme, please refer to update instructions
of your TeX distribution. Metropolis is on [CTAN][] since December
2014 thus it is part of MikTeX and will be part of TeX Live 2016.

Installing Metropolis from source, like any Beamer theme, involves four easy
steps:

1. **Download the source** with a `git clone` of the [Metropolis repository](https://github.com/matze/mtheme)
   or as a [zip archive](https://github.com/matze/mtheme/archive/master.zip) of
   the latest development version.
2. **Compile the style files** by running `make sty` inside the downloaded
    directory. (Or run LaTeX directly on `source/metropolistheme.ins`.)
3. **Move the resulting `*.sty` files** to the folder containing your
   presentation. To use Metropolis with many presentations, run `make install`
   or move the `*.sty` files to a folder in your TeX path instead (might require
   `sudo` rights).
4. **Use the theme for your presentation** by declaring `\usetheme{metropolis}` in
    the preamble of your Beamer document.
5. **For best results** install Mozilla's [Fira Sans](https://github.com/bBoxType/FiraSans).


## Usage

The following code shows a minimal example of a Beamer presentation using
Metropolis.

```latex
\documentclass{beamer}
\usetheme{metropolis}           % Use metropolis theme
\title{A minimal example}
\date{\today}
\author{Matthias Vogelgesang}
\institute{Centre for Modern Beamer Themes}
\begin{document}
  \maketitle
  \section{First Section}
  \begin{frame}{First Frame}
    Hello, world!
  \end{frame}
\end{document}
```

Detailed information on using Metropolis can be found in the [manual][].

For an alternative dark color theme, please have a look at Ross Churchley's
excellent [owl](https://github.com/rchurchley/beamercolortheme-owl) theme.


## License

The theme itself is licensed under a [Creative Commons Attribution-ShareAlike
4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/). This
means that if you change the theme and re-distribute it, you *must* retain the
copyright notice header and license it under the same CC-BY-SA license. This
does not affect the presentation that you create with the theme.


[demo slides]: http://mirrors.ctan.org/macros/latex/contrib/beamer-contrib/themes/metropolis/demo/demo.pdf
[manual]: http://mirrors.ctan.org/macros/latex/contrib/beamer-contrib/themes/metropolis/doc/metropolistheme.pdf
[CTAN]: http://ctan.org/pkg/beamertheme-metropolisa
[FiraSans]: https://fonts.google.com/specimen/Fira+Sans
[FiraMono]: https://fonts.google.com/specimen/Fira+Mono
