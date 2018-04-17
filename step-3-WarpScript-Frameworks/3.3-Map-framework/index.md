---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
title: 'Step 3.3: Framework time: MAP'
category: step-3
before: 'step-3-WarpScript-Frameworks/3.2-Bucketize-framework'
next: 'step-4-First-Exo-Detection/4.1-Yet-another-framework-APPLY'
solution: 'step-3-WarpScript-Frameworks/3.3-Map-framework/solutions'
---

Five frameworks are available and they all have their specific usage and important place in Time-Series analytics: [FILTER]({{ site.doc_url }}/reference/frameworks/framework-filter/), [BUCKETIZE]({{ site.doc_url }}/reference/frameworks/framework-bucketize/), [MAP]({{ site.doc_url }}/reference/frameworks/framework-map/), [REDUCE]({{ site.doc_url }}/reference/frameworks/framework-reduce/) and [APPLY]({{ site.doc_url }}/reference/frameworks/framework-apply/). Let's end with the MAP framework.

***At the bottom of this page, you will find the instructions on how to process to apply a mapper on the NASA lightcurve data.***

## The framework

Now it is time to update the values of a set of GTS using the [MAP framework]({{ site.doc_url }}/reference/frameworks/framework-map/). The MAP framework allows you to apply a function on values of a Geo time seriesTM that fall into a sliding window.

![Alt Text]({{ site.baseurl }}/img/frameworks/mapper.png)

In other words, the MAP framework allows the user to compute the same operation on all the points of a series. For specific kind of operations (means, min, max...), some points directly before and after the current point can be added to the computation. This resume the concept of sliding window around each points.

## Input parameters

Map takes as input a list of parameters. The first element of this list can be one or several lists of GTS. Then there is a [mapper function]({{ site.doc_url }}/reference/#framework-mappers). The third and the fourth elements are related to the sliding window, with first an element corresponding to "pre", the width of the sliding window before the value, and in second an element corresponding to "post", the width of the sliding window after the value. The last element corresponds to "occurences" which is the limit of computation of a number. For all elements except the set of GTS and the mapper function a default value 0 can be used, when those elements aren't required.

<warp10-embeddable-quantum warpscript="
// MAP Framework
[
    SWAP                                // Series list or Singleton
    mapper.function                     // Mapper function operator
    0                                   // Pre
    0                                   // Post
    0                                   // Occurence
]
MAP
">
</warp10-embeddable-quantum>

**Pro tips: A mmapper with the pre, post and occurence parameters at zero is called a single value mapper, meaning that the mapper function will be applied to all points of a series!**

To get a working mapper, replace the function keyword by an exisiting function as replace, mean, min, max, sd, abs, mul, add, round...

## Mapper in pictures

Let's resume step by step each mapper element. First [MAP framework]({{ site.doc_url }}/reference/frameworks/framework-map/) requires a set of time series (Singleton or list):

![Alt Text]({{ site.baseurl }}/img/frameworks/Time-series-input.png)

The second step consists to choose the function to apply on each points (resp window): replace, mean, min, max, sd, abs, mul, add, round and [lot of others]({{ site.doc_url }}/reference/reference/#mappers):

![Alt Text]({{ site.baseurl }}/img/frameworks/mapper-op.png)

A mapper can be tuned according to three parameters: pre which corresponds to the number of points to integrate to the sliding window **before** the current point:

![Alt Text]({{ site.baseurl }}/img/frameworks/mapper-pre.png)

The second parameter to tun a mapper consists of post: which corresponds to the number of points to integrate to the sliding window **after** the current point:

![Alt Text]({{ site.baseurl }}/img/frameworks/mapper-post.png)

And finally the last parameter used to tun a mapper is occurences which specify the maximal number of computation of each points!

![Alt Text]({{ site.baseurl }}/img/frameworks/mapper-occurences.png)

Now we would like to apply this specific framework to compute the same operation on all the time series points of the NASA lightcurve data. Let's see how to process!

## Hello Exo World step

In previous step we saw how to downsample the data, but what if to get the main aspect of the lightcurve we would like now to compute its approximate trend? In statistics, we could compute a moving average as example. In WarpScript, the map framework can be used to approximate such a computation. For a example we can define a window containing 5 elements before and as many after the current point and compute its mean value.

Let's try it! Try the mapper.mean with a moving window!

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
// MAP block:
//

// MAP Framework
">
</warp10-embeddable-quantum>

## Resume

The main goal of this step is to compute a moving average of some time series. To do so, you used the MAP framework, it expects on top of the stack a list of parameters containing: the time series as list or as singleton to bucketize, a mapper function, and three long parameter: pre, post and occurences.

The result of this step corresponds to a computed time series list. In our case the 4 selected time series are now on top of stack containing averaged value of all the values inside a moving window (for each point).

## To be continued

Congrats, you reached the end of the framework step! Understanding the help providing by those framework is really important to help a young hunter to complete its quest to retrieve Kepler-11 exoplanet. In the next step we will focus, now that we have all the needed tools, on writing a working exploratory script to discover existing exoplanet for kepler-11!