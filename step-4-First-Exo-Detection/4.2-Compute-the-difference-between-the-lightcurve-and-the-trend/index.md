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

Congrats young hunter in reaching this step! Here you will learn how to use all the knowledge gain in previous step to build your first script to search for exoplanet! For this we are going to use [`APPLY`]({{ site.doc_url }}/reference/frameworks/framework-apply/) framework to compute the [difference](({{ site.doc_url }}/reference/frameworks/op_sub/)). We are going to take record-5 to illustrate the APPLY. Here's record-5:

![Alt Text]({{ site.baseurl }}/img/step-4/actual.png)

We are first going to compute a trend like this one:

![Alt Text]({{ site.baseurl }}/img/step-4/mean.png)

Now what is happening if we are doing a simple substraction between the two time-series? Here's the result:

![Alt Text]({{ site.baseurl }}/img/step-4/sum.png).

Well the dropouts are pretty clear now! Let's do it!

<warp10-embeddable-quantum warpscript="
// Storing the token into a variable
@HELLOEXOWORLD/GETREADTOKEN 'token' STORE 

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

">
</warp10-embeddable-quantum>

Starting from here, you now have to:

* compute the trend using [`mapper.mean`]({{ site.doc_url }}/reference/frameworks/mapper_mean/). We recommend 5 datapoints before and after.
* Store the result into a variable
* use the [`APPLY`]({{ site.doc_url }}/reference/frameworks/framework-apply/) framework to compute the difference using [`op.sub`]({{ site.doc_url }}/reference/frameworks/op_sub/)  between the originial series and the series trend (computing using an average mean for example).


To resume, the expected result will contains a list of time series: with one time series per record containing the result of the substraction of the initial series with its trend.

## To be continued

Well done young hunter, let's continue together this exo-planet quest! In the next stage, you will learn how to isolate a minus threshold and build a nice output!
