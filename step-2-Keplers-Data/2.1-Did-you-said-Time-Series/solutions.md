---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
title: 'Step 2.1: Did you said time series?'
category: step-2
before: 'step-1-WarpScript/1.2-Introducing-the-Variables'
next: 'step-2-Keplers-Data/2.2-Exploring-known-time-series'
back: 'step-2-Keplers-Data/2.1-Did-you-said-Time-Series'
---

## Solutions

<warp10-embeddable-quantum warpscript="
// Create an empty time series
NEWGTS

// Rename this time series
'planet.rotation.count' RENAME

// Relabel this time series
{ 'name' 'earth' } RELABEL

// Gives an Attribute to this time series
{ 'main-nickname' 'blue-planet' } SETATTRIBUTES  // This attribute could evolve in the future without re-creating a series once they are stored in Warp 10.

//
// Add today's value to this time series
//

// Push Today's time
NOW 

// Push location
NaN NaN NaN 

// Push 121 as value 
121

// Add today's value in current time series
ADDVALUE

//
// Now we will also add yesterday value to the earth rotation time series
//

// Compute Yesterday time (Today minus one day)
NOW 1 d - 

// Push location
NaN NaN NaN 

// Push the value 120
120

// Add the value to current time series
ADDVALUE
">
</warp10-embeddable-quantum>