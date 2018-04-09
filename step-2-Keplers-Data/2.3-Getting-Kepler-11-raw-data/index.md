---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
category: step-2
---
# Step-2.3: Load time series raw data!

Now that you are used to play with the stack and know the available series, let's manipulate some data!

## FETCH 

Now that we found the right star, let's get some data using [FETCH](http://www.warp10.io/reference/functions/function_FETCH/)! It is a function similar to find, with more arguments that gives the boundaries of a window to get raw datapoints. The UTC start date is *2009-05-02T00:56:10.000000Z* and the end date is *2013-05-11T12:02:06.000000Z*.

```
// FETCH
[
                                        // Application authentication
                                        // selector for classname
                                        // Selector for labels
                                        // Start date
                                        // End date
]
FETCH
```

You can click on Execute then Plot. You will see a list of GTS, click on one to view it.

## Select only Kepler 11

The fetch results provides a list of series. To simplify all the following steps, we would like to work only on the first series of this list. Let's select it using the following warpScript:

```
0 GET
```

You should now have only one series on top of stack now.

## Handling time

As you may have seen, the data-window is pretty long, and they are drops. Drops are period where they are no data. Let's clean that. There is a function called [TIMESPLIT](http://www.warp10.io/reference/functions/function_TIMESPLIT/) that will be able to help us! As stated by the documentation:

> The TIMESPLIT function takes a GTS or a list of GTS and splits each Geo Time SeriesTM into a list multiple GTS instances, cutting the original GTS when it encounters quiet periods when there are no measurements.

That is perfect! Let´s use it!

The needed parameter are :

* the length of the quiet period (in microseconds)
* the minimum number of values each resulting GTS should have
* the name of the label which will hold the sequence of the resulting GTS (1 being the oldest).

Go ahead and TIMESPLIT the GTS!

**Pro tips: You can use a function called h to easily compute time. For example, putting 1 h into the stack will result with the number of microsecond in a hour in the stack!**

```
[
    $token                              // Application authentication
    'sap.flux'                   // selector for classname
    { 'KEPLERID' '6541920' }                // Selector for labels
    '2009-05-02T00:56:10.000000Z'       // Start date
    '2013-05-11T12:02:06.000000Z'       // End date
] FETCH

// Singleton series
0 GET

//
// TIMESPLIT block:
//

// Quiesce period


// Minimal numbers of points per series


// Labels for each splitted series
'record'


```

Once you managed to set all the needed parameters, you should get as a result a list of splitted series! In fact Timesplit will work as follow: it takes a GTS on top of stack and process it to detect quiet periods. Then it create one series per each period, generating several Time series (if they have at least the minimal required number of points to be considered). A label is also to each series, with an incremental values (1 for the first, 2 for the second,...). And finally, all the new formed series are added inside a result list and pushed on top of stack.

Great, each series resulting of TIMESPLIT corresponds to a single [Kepler record](https://www.nasa.gov/mission_pages/kepler/overview/index.html). We can now start to work on each of them and how to reduce the number of series to be able to explore a specific amount of data.

# To be continued

During this step you manipulated a sub-set of series extracted of the FITS data of the NASA. You discovered how to extract raw data from Warp 10 and how to use one of the Time manipulation function WarpScript offers! This is only the beginning of the hunt, there will be more to come in the [next step](/step-3-WarpScript-Frameworks/3.1-Filter-framework/) with all the basic Times Series framework to start an analysis!
