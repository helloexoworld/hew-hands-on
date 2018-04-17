---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
title: 'Step 2.4: Split Kepler-11 data'
category: step-2
before: 'step-2-Keplers-Data/2.3-Getting-Kepler-11-raw-data'
next: 'step-3-WarpScript-Frameworks/3.1-Filter-framework'
solution: 'step-2-Keplers-Data/2.4-Split-Kepler-11-data/solutions'
---

Using the `FETCH` function all the available Kepler-11 have been loaded from a Warp10 backend and are pushed on the WarpScript stack. Observing more in details the stack result, even when only a single series is fetched, `FETCH` creates a WarpScript list. Let's see how to extract its first element before seeing a method to split a single series according to your exoplanet quest need.

## Getting the first time series in the fetched list

The `FETCH` results provides a list of series. To simplify all the following steps, we would like to work only on the first series of this list. In order to do it, we use the [`GET`]({{ site.doc_url }}/reference/functions/function_GET/): 


<warp10-embeddable-quantum warpscript="
// Storing the token into a variable
@HELLOEXOWORLD/GETREADTOKEN 'token' STORE 

// Let's do a FETCH now
[
    $token                          // Token for application authentication
    'sap.flux'                      // Classname selector                         
    { 
        'KEPLERID' '6541920'        // Labels selector
    }                              
    '2009-05-02T00:56:10.000000Z'   // Start date
    '2013-05-11T12:02:06.000000Z'   // End date
]
FETCH 

// Get Singleton series

">
</warp10-embeddable-quantum>

You should now have only the Kepler-11 series on top of stack as singleton. You can verify it using the WarpScript function `TYPEOF`. This function will push replace the element on top of the stack by it's type. The result should be `GTS`.  

## Handling time

As you may have seen, the data-window is pretty long, and they are drops. Drops are period where they are no data. Let's clean that. There is a function called [`TIMESPLIT`]({{ site.doc_url }}/reference/functions/function_TIMESPLIT/) that will be able to help us! As stated by the documentation:

> The `TIMESPLIT` function takes a time series or a list thereof and splits each Geo time series<sup>TM</sup> into a list multiple time series instances, cutting the original time series when it encounters quiet periods when there are no measurements.

That is perfect! Let´s use it!

The needed parameter are :

* the length of the quiet period (in microseconds)
* the minimum number of values each resulting time series should have
* the name of the label which will hold the sequence of the resulting time series (1 being the oldest).

Go ahead and `TIMESPLIT` the time series!

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

// Get Singleton series
0 GET

// Let's do the TIMESPLIT now

// Set TIMESPLIT parameters:
    // - Quiesce period
    // - Minimal numbers of points per series
    // - Labels for each splitted series
TIMESPLIT
">
</warp10-embeddable-quantum>


Once you managed to set all the needed parameters, you should get as a result a list of splitted series! In fact `TIMESPLIT` will work as follow: 
- it takes a time series on top of stack and process it to detect quiet periods
- it create one series per each period, generating several time series (if they have at least the minimal required number of points to be considered)
- it adds a label to each series, with an incremental values (1 for the first, 2 for the second,...) 
- all the new formed series are added inside a result list and pushed on top of stack.

Great, each series resulting of `TIMESPLIT` corresponds to a single [Kepler record](https://www.nasa.gov/mission_pages/kepler/overview/index.html). We can now start to work on each of them and how to reduce the number of series to be able to explore a specific amount of data.

## To be continued

During this step you manipulated a sub-set of series extracted of the FITS data of the NASA. You discovered how to extract raw data from Warp 10 and how to use one of the Time manipulation function WarpScript offers! This is only the beginning of the hunt, there will be more to come with all the basic times series framework to start an analysis!