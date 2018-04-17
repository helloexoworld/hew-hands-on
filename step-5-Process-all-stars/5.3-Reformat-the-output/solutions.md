---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
title: 'Step 5.3: Time to focus on the format output'
category: step-5
before: 'step-5-Process-all-stars/5.2-Optimize-global-analysis'
next: 'step-6-Going-further'
back: 'step-5-Process-all-stars/5.3-Reformat-the-output'
---

## Solutions

<warp10-embeddable-quantum warpscript="
// Storing the token into a variable
@HELLOEXOWORLD/GETREADTOKEN 'token' STORE 

// FETCH
[ 
    $token                              // Application authentication
    'sap.flux'                          // selector for classname
    {}                                  // Selector for labels
    '2009-05-02T00:56:10.000000Z'       // Start date
    '2013-05-11T12:02:06.000000Z'       // End date
] 
FETCH

// Apply Timeclip on each stars series
<%
    // Delete index
    DROP
    
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
%>
LMAP

// Flatten list of list of TIMESPLIT
FLATTEN

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

    [ 'KEPLERID' 'record' ]             // Labels to compute equivalence class
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

//
// Reformat annotations series
//

<%
    // Delete index
    DROP

    // Duplicate series on top of the stack
    DUP

    // Get series name
    NAME

    // Add annotations suffix
    '-annotations' +

    // RENAME the series on top of the stack
    RENAME
%>
LMAP

// Push the original series to compare with
$bucketizedSeries

//
// Split the end record in several stack elements. One elements for each record of each stars containing a list of the record series with its corresponding annotations series 
//

// Merge both series on top of the stack
APPEND
[ 'KEPLERID' 'record' ]

// Generaten equivalence map containing base on KEPLERID and record labels
PARTITION

// Delete each map keys to keep only the list values 
<%
    SWAP DROP
%>
FOREACH
">
</warp10-embeddable-quantum>