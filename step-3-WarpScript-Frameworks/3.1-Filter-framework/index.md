---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
title: 'Step 3.1: Framework time: FILTER'
category: step-3
before: 'step-2-Keplers-Data/2.3-Getting-Kepler-11-raw-data'
next: 'step-3-WarpScript-Frameworks/3.2-Bucketize-framework'
solution: 'step-3-WarpScript-Frameworks/3.1-Filter-framework/solutions'
---

Using `TIMESPLIT` we compute our first time series operation but WarpScript offers other richer tools to manipulate them. Five frameworks are available and they all have their specific usage and important place in Time-Series analytics: [`FILTER`]({{ site.doc_url }}/reference/frameworks/framework-filter/), [`BUCKETIZE`]({{ site.doc_url }}/reference/frameworks/framework-bucketize/), [`MAP`]({{ site.doc_url }}/reference/frameworks/framework-map/), [`REDUCE`]({{ site.doc_url }}/reference/frameworks/framework-reduce/) and [`APPLY`]({{ site.doc_url }}/reference/frameworks/framework-apply/). Let's start with the FILTER framework.

## The framework

The first framework we are going to discover in this tutorial is [`FILTER`]({{ site.doc_url }}/reference/frameworks/framework-filter/). It provides the tooling to select specific sub-set of Time-series in a list thereof.

Let's resume what we have on the stack: first a kepler-11 time series are loaded using the [`FETCH`]({{ site.doc_url }}/reference/functions/function_FETCH/) function. Then the data are split according to a quiesce period using [`TIMESPLIT`]({{ site.doc_url }}/reference/functions/function_TIMESPLIT/). We are now going to select only a few records to work on using `FILTER`.
## Input parameters

The filter function takes a list containing 3 elements as input parameter: the time series as list or singleton to filter, then a list of labels to compute an equivalence class, and finally a filter function.

**Do not focus on the equivalence class: during this step, and keep an empty list. We will see later how it could be used.**

```
// Filter framwork
[
    $gts                                // Series list or Singleton
    []                                  // Labels to compute equivalence class
    filter.function                     // A selector function 
]
FILTER
```

To have a working filter, replace the function keyword by an existing filter function: filter.bylabels or filter.byclass for instance. Those specific filter function requires a parameter on top of the stack. A more concret example is detailed below, based on the NASA lightcurve data.

## Hello Exo World step

In our data-flow, the goal is now to select only 2 to 3 records of those series to see if it's possible to visualize specific drops corresponding to an exoplanet in those series. As a result we will then be able to build a generic method to detect exoplanet. You will have to use a variable as seen in the first step to place the time series list in first position of the element list of the `FILTER`.

The filter function we will use in our case corresponds to [`filter.bylabels`]({{ site.doc_url }}/reference/frameworks/filter_bylabels/). This function expects a selector map on top of the stack that have to be specify.
As an example you can try to use the selector labels map specifies in the follozing spec in your filter function.

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
">
</warp10-embeddable-quantum>

## Resume

To resume, to filter a data set, we have to use the `FILTER` framework. It expects on the stack a list of parameter: the time series as list or as singleton to filter, then a list of labels to compute an equivalence class, and finally a filter function. The filter function as we saw with the `filter.bylabels` can also need some parameter(s) on top of stack.

The result of this step corresponds to a reduced list. In our case only 4 records (2 to 5) were selected using a regular expression. A list containing 4 time series is now let on top of the WarpScript stack.

## To be continued

As an exoplanet hunter, you may be asking yourself why you should reduced the amount of data you will be working with. Be patient, and remember that taking your time during the first steps will making you win a lot of time in the longer run! Stay strong young hunter, more will come in the next step as a framework very useful for time series downsampling will be briefly introduced.
