---
author: Gurusabarish
date: "2022-12-09T19:53:33+05:30"
description: ""
draft: false
image: /images/mathjax.png
mathjax: true
tags:
- Markdown syntax
- Mathjax
- example
title: Render Math With Mathjax
toc: true
---

## Mathjax

Math equations can be rendered using [Mathjax](https://www.mathjax.org) syntax with AMS symbol support.

Optionally enable this on a per-page basis by adding `mathjax: true` to your frontmatter.

Then, use `$$ ... $$` on a line by itself to render a block equation:

$$ | Pr_{x \leftarrow P_{1}} [A(x) = 1] - Pr_{x \leftarrow P_{2}} [A(x) = 1] | < \text{negligible} $$

The raw version is:

```
$$ | Pr_{x \leftarrow P_{1}} [A(x) = 1] - Pr_{x \leftarrow P_{2}} [A(x) = 1] | < \text{negligible} $$
```


Write in-line equations with `\\( ... \\)` , like \\( x^n / y \\) . It's easy!

```
Write in-line equations with `\\( ... \\)` , like \\( x^n / y \\) . It's easy!
```

