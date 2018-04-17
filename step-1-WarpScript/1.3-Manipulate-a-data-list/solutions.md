---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
title: 'Step 1.3: Manipulate a WarpScript List'
category: step-1
before: 'step-1-WarpScript/1.2-Introducing-the-Variables'
next: 'step-2-Keplers-Data/2.1-Did-you-said-Time-Series'
back: 'step-1-WarpScript/1.3-Manipulate-a-data-list'
---

## Solutions

<warp10-embeddable-quantum warpscript="
// Build a list containing values 1 and 3 
[ 1 3 ]

// Add the element 2
2 +

// Sort the list
LSORT

// Reverse it
REVERSE
">
</warp10-embeddable-quantum>