---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
title: 'Step 5.2: Optimize all stars analysis'
category: step-5
before: 'step-5-Process-all-stars/5.1-WarpScript-loops'
next: 'step-5-Process-all-stars/5.3-Reformat-the-output'
solution: 'step-5-Process-all-stars/5.2-Optimize-global-analysis/solutions'
---

You learn how to use some of the WarpScript framework and how to write your first script to detect exoplanet! Let's now try to apply this analysis on all the lightcurve of each stars we have at our disposal.

## Practice

In the first script you write only one function: [TIMESPLIT]({{ site.doc_url }}/reference/functions/function_TIMESPLIT/) request single GTS. Encapsuled this instruction inside a LOOP. When using LMAP, you can replace a time-series by a list thereof. Then to flat the list the [FLATTEN]({{ site.doc_url }}/reference/functions/function_FLATTEN/) warpscript function can be used.

Then all the WarpScript framework functions can be applied on Time-series list. Just be careful on the equivalence class!

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

'splitSeries' STORE

//
// FILTER block:
//

// Store a labels map selector
{ 'record' '~[2-5]' } 'labelsSelector' STORE

// FILTER Framework
[
    $splitSeries                    // Series list or Singleton
    []                              // Labels to compute equivalence class
    $labelsSelector                 // Labels map for selector
    filter.bylabels                 // Filter function operator 
]
FILTER

'filteredSeries' STORE

//
// BUCKETIZE block:
//

// BUCKETIZE Framework
[
    $filteredSeries                     // Series list or Singleton
    bucketizer.min                      // Bucketize function operator
    0                                   // Lastbucket 				
    2 h                                 // Bucketspan
    0                                   // Bucketcount
]
BUCKETIZE

// Add an UNBUCKETIZE once the series are sampled (to be able to use mapper.toboolean to print annotations)
UNBUCKETIZE

'bucketizedSeries' STORE

//
// APPLY block:
//

[
    $bucketizedSeries                    // Series list or singleton minuend

    //
    // MAP block: Compute moving mean 
    //

    [
        $bucketizedSeries               // Series list or Singleton
        mapper.mean                     // Mapper function operator
        5                               // Pre
        5                               // Post
        0                               // Occurences
    ]
    MAP                                 // Series list or singleton subtrahend

    [ 'record' ]                        // Labels to compute equivalence class
    op.sub                              // Apply function operator
]
APPLY

'applyResult' STORE

// 
// Threshold
//

[ $applyResult [] -15.0 mapper.lt 0 0 0 ] MAP 
'belowValueSeries' STORE

// 
// Print initial series and annotations
//

[ $belowValueSeries mapper.toboolean 0 0 0 ] MAP

// Push the original series to compare with
$bucketizedSeries
">
</warp10-embeddable-quantum>

## To be continued

Once you manage to compute the analysis on all the start, you should get two elements on top of the stack: the sampled list and the annotations. Let's now learn how to quickly reformat and add information to each time series.