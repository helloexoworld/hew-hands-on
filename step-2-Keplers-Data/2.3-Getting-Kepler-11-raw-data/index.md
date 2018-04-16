---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
title: 'Step 2.3: Load time series raw data'
category: step-2
---

Now that you are used to play with the stack and know the available series, let's manipulate some data!

## FETCH 

Now that we found the right star, let's get some data using [`FETCH`]({{ site.doc_url }}/reference/functions/function_FETCH/)! It is a function similar to find, with more arguments that gives the boundaries of a window to get raw datapoints. The UTC start date is `2009-05-02T00:56:10.000000Z` and the end date is `2013-05-11T12:02:06.000000Z`.


<warp10-embeddable-quantum warpscript="
// Storing the token into a variable
@HELLOEXOWORLD/GETREADTOKEN 'token' STORE 

// Let's do a FETCH now
[
    // Here you must put the parameters used by FETCH:  
    // - Token for application authentication
    // - Classname selector
    // - Labels selector
    // - Start date
    // - End date
]
FETCH
">
</warp10-embeddable-quantum>


You will see a list of GTS, click on one to view it.

## Getting the first GTS in the fetched list

The `FETCH` results provides a list of series. To simplify all the following steps, we would like to work only on the first series of this list. In order to do it, we use the [`GET`]({{ site.doc_url }}/reference/functions/function_GET/): 


<warp10-embeddable-quantum warpscript="
// Storing the token into a variable
@HELLOEXOWORLD/GETREADTOKEN 'token' STORE 

// Let's do a FETCH now
[
    $token                          // Token for application authentication
    'sap.flux'                      // Classname selector
    {}                              // Labels selector
    '2009-05-02T00:56:10.000000Z'   // Start date
    '2013-05-11T12:02:06.000000Z'   // End date
]
FETCH 
0 GET
">
</warp10-embeddable-quantum>

You should now have only one series on top of stack now.

## Selecting only the data from Kepler-11

Let's modify the precedent code to fetch only the data from Kepler-11, i.e. data with the label `KEPLERID=6541920`:

<warp10-embeddable-quantum warpscript="
// Storing the token into a variable
@HELLOEXOWORLD/GETREADTOKEN 'token' STORE 

// Let's do a FETCH now
[
    $token                          // Token for application authentication
    'sap.flux'                      // Classname selector
    { 
        // Here you put the label selector for Kepler-11
    }                              // Labels selector
    '2009-05-02T00:56:10.000000Z'   // Start date
    '2013-05-11T12:02:06.000000Z'   // End date
]
FETCH 
0 GET
">
</warp10-embeddable-quantum>


## Handling time

As you may have seen, the data-window is pretty long, and they are drops. Drops are period where they are no data. Let's clean that. There is a function called [TIMESPLIT]({{ site.doc_url }}/reference/functions/function_TIMESPLIT/) that will be able to help us! As stated by the documentation:

> The TIMESPLIT function takes a GTS or a list of GTS and splits each Geo Time Series<sup>TM</sup> into a list multiple GTS instances, cutting the original GTS when it encounters quiet periods when there are no measurements.

That is perfect! Let´s use it!

The needed parameter are :

* the length of the quiet period (in microseconds)
* the minimum number of values each resulting GTS should have
* the name of the label which will hold the sequence of the resulting GTS (1 being the oldest).

Go ahead and TIMESPLIT the GTS!

> Pro tips: You can use a function called [`h`]({{ site.doc_url }}/reference/functions/function_h/) to easily compute duration in hours. For example, putting `1 h` into the stack will push the number of microsecond in a hour in the stack!

<warp10-embeddable-quantum warpscript="
// Storing the token into a variable
@HELLOEXOWORLD/GETREADTOKEN 'token' STORE 

// Let's do a FETCH now
[
    $token                          // Token for application authentication
    'sap.flux'                      // Classname selector
    { 'KEPLERID' '6541920' }        // Labels selector
    '2009-05-02T00:56:10.000000Z'   // Start date
    '2013-05-11T12:02:06.000000Z'   // End date
]
FETCH 
0 GET

// Let's do the TIMESPLIT now

// Set TIMESPLIT parameters:
    // - Quiesce period
    // - Minimal numbers of points per series
    // - Labels for each splitted series
TIMESPLIT
">
</warp10-embeddable-quantum>


Once you managed to set all the needed parameters, you should get as a result a list of splitted series! In fact Timesplit will work as follow: 
- it takes a GTS on top of stack and process it to detect quiet periods
- it create one series per each period, generating several Time series (if they have at least the minimal required number of points to be considered)
- it adds a label to each series, with an incremental values (1 for the first, 2 for the second,...) 
- all the new formed series are added inside a result list and pushed on top of stack.

Great, each series resulting of TIMESPLIT corresponds to a single [Kepler record](https://www.nasa.gov/mission_pages/kepler/overview/index.html). We can now start to work on each of them and how to reduce the number of series to be able to explore a specific amount of data.

## To be continued

During this step you manipulated a sub-set of series extracted of the FITS data of the NASA. You discovered how to extract raw data from Warp 10 and how to use one of the Time manipulation function WarpScript offers! This is only the beginning of the hunt, there will be more to come in the [next step]({{ site.baseurl }}/step-3-WarpScript-Frameworks/3.1-Filter-framework/) with all the basic Times Series framework to start an analysis!

## [previous step]({{ site.baseurl }}/step-2-Keplers-Data/2.2-Exploring-known-time-series/) ... [solutions]({{ site.baseurl }}/step-2-Keplers-Data/2.3-Getting-Kepler-11-raw-data/solutions) ... [next step]({{ site.baseurl }}/step-3-WarpScript-Frameworks/3.1-Filter-framework/)
