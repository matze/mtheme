## Beamer mtheme

The *mtheme* is a Beamer theme with minimal visual. The core design principles
of the theme were described in a [blog post](http://bloerg.net/2014/09/20/a-modern-beamer-theme.html).
Not convinced?  Have a look at the [demo slides](demo.pdf).


![Sample](http://i.imgur.com/wP4uGbS.png)


### Installation

To install the theme either run `make install` or copy the style files ending
with `.sty` to the source files of your presentation. As of now, fonts, colors
and the section indicator are hardcoded into the theme. For the demo you need

* XeLaTeX,
* the [Fira Sans](https://github.com/mozilla/Fira) font,
* TikZ and
* the Python package [Pygments](http://pygments.org/) that you can get with `pip
  install pygments`.

Depending on the Linux distribution, the packaged name of Fira Sans might be
`Fira Sans OT` instead of `Fira Sans`. In that case, you may have to edit
`beamerfontthememetropolis.sty`.


### Usage

To build the demo slides just run `make` in the top-level directory. To use this
theme with [Pandoc](http://johnmacfarlane.net/pandoc/)-based presentations, you
can run the following command

    $ pandoc -t beamer --latex-engine=xelatex -V theme:m -o output.pdf input.md


### Customization

#### Package options

The `titleprogressbar` option adds a thin progress bar similar to the section
progress bar underneath *each* frame title

  ![Progressbar](http://i.imgur.com/4BXHU4K.png)

In order to use `\cite`, `\ref` and similar commands in a frame title you have
to protect the title. This can be done automatically with the
`protectframetitle` option.


#### Commands

The `\plain{title=[]}{body}` command sets a slide in plain dark colors which can
be useful to focus attentation on a single image.



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
