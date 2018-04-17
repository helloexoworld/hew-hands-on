---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
title: "Step 4.2: Let's compute the difference"
category: step-4
before: 'step-4-First-Exo-Detection/4.1-Yet-another-framework-APPLY'
next: 'step-4-First-Exo-Detection/4.3-Threshold-test-and-display'
solution: 'step-4-First-Exo-Detection/4.2-Compute-the-difference-between-the-lightcurve-and-the-trend/solutions'
---

Congrats young hunter in reaching this step! Here you will learn how to use all the knowledge gain in previous step to build your first script to search for exoplanet!
The process is similar to the previous step. Start with the script resuming the data loading, the record split (according to time), the filtering and the downsampling.

<warp10-embeddable-quantum warpscript="
// Storing the token into a variable
'abcd' 'token' STORE 

// FETCH
[ 
    $token                              // Application authentication
    'sap.flux'                   // selector for classname
    { 'KEPLERID' '6541920' }                // Selector for labels
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

//
// FILTER block:
//

// Store a labels map selector
{ 'record' '~[2-5]' } 'labelsSelector' STORE

// FILTER Framework
[
    SWAP                            // Series list or Singleton
    []                              // Labels to compute equivalence class
    $labelsSelector                 // Labels map for selector
    filter.bylabels                 // Filter function operator 
]
FILTER

//
// BUCKETIZE block:
//

// BUCKETIZE Framework
[
    SWAP                                // Series list or Singleton
    bucketizer.min                      // Bucketize function operator
    0                                   // Lastbucket
    2 h                                 // Bucketspan
    0                                   // Bucketcount
]
BUCKETIZE

'bucketizedSeries' STORE

//
// APPLY block:
//

">
</warp10-embeddable-quantum>

Starting from here, use the [APPLY]({{ site.doc_url }}/reference/frameworks/framework-apply/) framework to compute the [difference](({{ site.doc_url }}/reference/frameworks/op_sub/)) between the originial series and the series trend (computing using an average mean for example). Feel free to search for a script optimizing the drop detection! Be careful of the equivalence class to choose for this specific step!

To resume, the expected result will contains a list of time series: with one time series per record containing the result of the substraction of the initial series with its trend.

## To be continued

Well done young hunter, let's continue together this exo-planet quest! In the next stage, you will learn how to isolate a minus threshold and build a nice output!