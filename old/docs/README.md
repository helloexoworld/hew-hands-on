# Warp10's site

The static, markdown based, Jekyll powered Warp10's site

## So what is Jekyll, exactly?

Jekyll is a simple, blog-aware, static site generator. It takes a template directory containing raw text files in various formats, runs it through [Markdown](http://daringfireball.net/projects/markdown/) and [Liquid](https://github.com/Shopify/liquid/wiki) converters, and spits out a complete, ready-to-publish static website suitable for serving with your favorite web server. Jekyll also happens to be the engine behind [GitHub Pages](http://pages.github.com/).


## How to use

The full doc on Jekyll is available on [Jekyll's doc site](http://jekyllrb.com/docs/home/).


### Install Jekyll engine.

Using ruby gems:

```text
gem install jekyll
```

*Note: the version of Jekyll on Ubuntu repositories **isn't up to date** and shouldn't be used*


### Development mode

To serve the site in preview mode, use:

```text
jekyll serve
```

The preview mode automatically updates after any modification.

To build the static version of the site, use:

```text
jekyll build
```

If you want it to rebuild the static site after each modification, add the `--watch`flag:

```text
jekyll build --watch
```

In *watch* mode, Jekyll will scan the source file and re-generate the blog when files changes.    


### Write a new page

To write a new page, you add a markdown file to corresponding folder.

Filename must respect the naming convention:

```text
title-with-dashes.markdown
```

The markdown files must include a normalized header:

```text
---
layout:     "function"
title:      "A nice title"
subtitle:   "And the explanation thats follows it"
---    
```

The content of the page is written in markdown.

Images should be placed on  a directory inside `img`, following this structure:


```text
──img
   └──page-filename-without-.md
       └──img01.jpg
       └── img02.jpg
```

### Publish your pages

As usual, you should fork the [repository](https://bitbucket.org/cityzendata/doc-jekyll),
push to your fork and do a pull request.
