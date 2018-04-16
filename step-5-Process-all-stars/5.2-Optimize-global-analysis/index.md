---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
title: 'Step 5.2: Optimize all stars analysis'
category: step-5
---

You learn how to use some of the WarpScript framework and how to write your first script to detect exoplanet! Let's now try to apply this analysis on all the lightcurve of each stars we have at our disposal.

## Practice

In the first script you write only one function: [TIMESPLIT]({{ site.doc_url }}/reference/functions/function_TIMESPLIT/) request single GTS. Encapsuled this instruction inside a LOOP. When using LMAP, you can replace a time-series by a list thereof. Then to flat the list the [FLATTEN]({{ site.doc_url }}/reference/functions/function_FLATTEN/) warpscript function can be used.

Then all the WarpScript framework functions can be applied on Time-series list. Just be careful on the equivalence class!

# Next Step

Once you manage to compute the analysis on all the start, you should get two elements on top of the stack: the sampled list and the annotations. In the [next step]({{ site.baseurl }}/step-5-Process-all-stars/5.3-Reformat-the-output/), the output format will be a bit updated.
