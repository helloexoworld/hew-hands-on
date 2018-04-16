---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
title: 'Step 2.1: Did you said Time series?'
category: step-2
---

## Solutions

<warp10-embeddable-quantum warpscript="
// Create an empty Time series
NEWGTS

// Rename this Time series
'planet.rotation.count' RENAME

// Relabel this Time series
{ 'name' 'earth' } RELABEL

// Gives an Attribute to this Time series
{ 'main-nickname' 'blue-planet' } SETATTRIBUTES  // This attribute could evolve in the future without re-creating a series once they are stored in Warp 10.

//
// Add today's value to this Time series
//

// Push Today's time
NOW 

// Push location
NaN NaN NaN 

// Push 121 as value 
121

// Add today's value in current Time series
ADDVALUE

//
// Now we will also add yesterday value to the earth rotation Time series
//

// Compute Yesterday time (Today minus one day)
NOW 1 d - 

// Push location
NaN NaN NaN 

// Push the value 120
120

// Add the value to current Time series
ADDVALUE
">
</warp10-embeddable-quantum>

## [previous step]({{ site.baseurl }}/step-1-WarpScript/1.3-Manipulate-a-data-list/) ... [back]({{ site.baseurl }}/step-2-Keplers-Data/2.1-Did-you-said-Time-Series/) ... [next step]({{ site.baseurl }}/step-2-Keplers-Data/2.2-Exploring-known-time-series/)