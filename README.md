## Beamer mtheme

The *mtheme* is a Beamer theme with minimal visual. The core design principles
of the theme were described in a [blog post](http://bloerg.net/2014/09/20/a-modern-beamer-theme.html).
Not convinced? Have a look at the [demo slides](demo.pdf).

![Sample](http://i.imgur.com/Bxu52fz.png)


### Installation

To install the theme either run `make install` or copy the style files ending
with `.sty` to the source files of your presentation. As of now, fonts, colors
and the section indicator are hardcoded into the theme. For the demo you need

* XeLaTeX,
* the [Fira Sans](https://github.com/mozilla/Fira) and Mono font and
* TikZ.

Depending on the Linux distribution, the packaged name of Fira Sans might be
`Fira Sans OT` instead of `Fira Sans`. In that case, you may have to edit
`beamerfontthememetropolis.sty`. You may also need to install Fira Sans; see
the `contrib/` directory for more. Users of Debian or Ubuntu can also install
[this .deb package](https://launchpad.net/~edd/+archive/ubuntu/misc/+files/latex-mtheme_0.1.0vidid1_all.deb)
containing the theme files as well as the Fira Sans font files.

To build the demo slides run

    $ make

in the top-level directory.

To use this theme with [Pandoc](http://johnmacfarlane.net/pandoc/)-based
presentations, you can run the following command

    $ pandoc -t beamer --latex-engine=xelatex -V theme:m -o output.pdf input.md


### Customization

#### Package options

To use any of options below, call them when invoking *mtheme* in the preabmle of
the slides, i.e.

```latex
  \usetheme[<options>]{m}
```

* The `usetitleprogressbar` option adds a thin progress bar similar to the
  section progress bar underneath *each* frame title

  ![Progressbar](http://i.imgur.com/4BXHU4K.png)
* In order to use `\cite`, `\ref` and similar commands in a frame title you have
  to protect the title. This can be done automatically with the
  `protectframetitle` option.
* The `blockbg` option defines extra colors used in defining the blocks.  The
  blocks then have a gray background similar to other beamer themes.
* By default, this package adds `\vspace{2em}` after the frametitle to center
  content vertically on the frame. If using more content per slide, this can be
  turned off at the package-level by passing the `nooffset` option.
* With option `nosectionslide`, no dedicated slide is produced when a new
  section starts. By default when using the `\section` command, a slide is
  created with just the title on it.
* Option `usetotalslideindicator` creates slide numbering in lower right corner
  in following format: #current/#total. By default, just current page number is
  printed.
* Option `noslidenumbers` omits slide numbers entirely.


#### Title formatting

The main title, section titles, and frame titles are all formatted according
to the custom command `\mthemetitleformat`. By default, this is equivalent to
`scshape` and sets the titles in small capitals, but you can change it in your
preamble. For example:

```latex
\renewcommand{\mthemetitleformat}{}                       % no small capitals
\renewcommand{\mthemetitleformat}{\scshape\MakeLowercase} % all small capitals
\renewcommand{\mthemetitleformat}{\MakeUppercase}         % all capitals
```

Note that `\MakeLowercase` and `\MakeUppercase` can have unexpected behaviour
in math mode, are disabled when `protectframetitle` is used, and cause crashes
when an unprotected frametitle appears on a slide with `allowframebreaks`.


#### Commands

The `\plain{title=[]}{body}` command sets a slide in plain dark colors
which can be useful to focus attentation on a single image.


#### pgfplot styles

The beamer theme also contains pre-defined pgfplot styles. Use the `mlineplot`
key to plot line data and `mbarplot` or `horizontal mbarplot` to plot bar
charts.

![Charts](http://i.imgur.com/yuEqU3j.png)


### License

The theme itself is licensed under a [Creative Commons Attribution-ShareAlike
4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/). This
means that if you change the theme and re-distribute it, you *must* retain the
copyright notice header and license it under the same CC-BY-SA license. This
does not affect the presentation that you create with the theme.
