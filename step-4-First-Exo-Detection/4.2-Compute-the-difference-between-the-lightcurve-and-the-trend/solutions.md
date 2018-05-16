---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
title: "Step 4.2: Let's compute the difference"
category: step-4
before: 'step-4-First-Exo-Detection/4.1-Yet-another-framework-APPLY'
next: 'step-4-First-Exo-Detection/4.3-Threshold-test-and-display'
back: 'step-4-First-Exo-Detection/4.2-Compute-the-difference-between-the-lightcurve-and-the-trend'
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

'bucketizedSeries' STORE

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
MAP      

'mappedSeries' STORE

//
// APPLY block:
//

[
    $bucketizedSeries                   // Series list or singleton minuend
    $mappedSeries                       // Trend result
    [ 'record' ]                        // Labels to compute equivalence class
    op.sub                              // Apply function operator
]
APPLY
">
</warp10-embeddable-quantum>