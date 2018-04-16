---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
title: 'Step 2.3: Load time series raw data'
category: step-2
---

## Solutions

<warp10-embeddable-quantum warpscript="
// Storing the token into a variable
@HELLOEXOWORLD/GETREADTOKEN 'token' STORE 

// FETCH
[ 
    $token                              // Application authentication
    'sap.flux'                          // selector for classname
    { 'KEPLERID' '6541920' }            // Selector for labels
    '2009-05-02T00:56:10.000000Z'       // Start date
    '2013-05-11T12:02:06.000000Z'       // End date
] 
FETCH

// Get Singleton series
0 GET

//
// TIMESPLIT block:
//

// Quiesce period
6 h

// Minimal numbers of points per series 
100

// Labels for each splitted series
'record'

TIMESPLIT
">
</warp10-embeddable-quantum>

## [previous step]({{ site.baseurl }}/step-2-Keplers-Data/2.2-Exploring-known-time-series/) ... [back]({{ site.baseurl }}/step-2-Keplers-Data/2.3-Getting-Kepler-11-raw-data/) ... [next step]({{ site.baseurl }}/step-3-WarpScript-Frameworks/3.1-Filter-framework/)