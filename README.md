## Beamer mtheme

The *mtheme* is a Beamer theme with minimal visual. The core design principles
of the theme were described in a [blog post](http://bloerg.net/2014/09/20/a-modern-beamer-theme.html).
Not convinced?  Have a look at the [demo slides](demo.pdf).


![Sample](http://i.imgur.com/wP4uGbS.png)


### Requirements

As of now, fonts, colors and the section indicator are hardcoded into the theme.
Thus to compile the demo with `make` you must

* use XeLaTeX,
* install the [Fira Sans](https://github.com/mozilla/Fira) font,
* have a usable TikZ installation, and
* install the Python package [Pygments](http://pygments.org/) (`pip install pygments`).

### Package options

* `titleprogressbar` adds a thin progress bar similar to the section progress
  bar underneath *each* slide.


### Commands

* `\plain{title=[]}{body}` sets a slide in plain dark colors.


### pgfplot styles

The beamer theme also contains pre-defined pgfplot styles. Use the `mlineplot`
key to plot line data and `mbarplot` or `horizontal mbarplot` to plot bar
charts.


### License

The theme itself is licensed under a [Creative Commons Attribution-ShareAlike
4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/). This
means that if you change the theme and re-distribute it, you *must* retain the
copyright notice header and license it under the same CC-BY-SA license. This
does not affect the presentation that you create with the theme.
