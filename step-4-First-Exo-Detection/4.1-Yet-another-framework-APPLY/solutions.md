---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
title: 'Step 4.1: Yet another framework: APPLY'
category: step-4
---

## Solutions

<warp10-embeddable-quantum warpscript="
[
    NEWGTS 'planet.rotation.count' RENAME 
    { 'name' 'earth' } RELABEL
    10 NaN NaN NaN 120 ADDVALUE
    20 NaN NaN NaN 123  ADDVALUE
    NEWGTS 'planet.rotation.count' RENAME 
    { 'name' 'mars' } RELABEL
    10 NaN NaN NaN 124 ADDVALUE
    20 NaN NaN NaN 125 ADDVALUE
    30 NaN NaN NaN 126  ADDVALUE
]
'firstResult' STORE

[
  NEWGTS 'planet.rotation.count.to.correct' RENAME 
  { 'name' 'earth' } RELABEL
  10 NaN NaN NaN  1 ADDVALUE
  20 NaN NaN NaN  2 ADDVALUE
  NEWGTS 'planet.rotation.count.to.correct' RENAME 
  { 'name' 'mars' } RELABEL
  10 NaN NaN NaN  1 ADDVALUE
  15 NaN NaN NaN  1 ADDVALUE
  20 NaN NaN NaN  1 ADDVALUE
]
'secondResult' STORE

[
    $firstResult                        // Series list or Singleton minuend
    $secondResult                       // Series list or Singleton subtrahend
    [ 'name' ]                          // Labels to compute equivalence class
    op.sub                              // Apply function operator
]
APPLY
">
</warp10-embeddable-quantum>

## [previous step]({{ site.baseurl }}/step-3-WarpScript-Frameworks/3.3-Map-framework/) ... [back]({{ site.baseurl }}/step-4-First-Exo-Detection/4.1-Yet-another-framework-APPLY/) ... [next step]({{ site.baseurl }}/step-4-First-Exo-Detection/4.2-Compute-the-difference-between-the-lightcurve-and-the-trend/)