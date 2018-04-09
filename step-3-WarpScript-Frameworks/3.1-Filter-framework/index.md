---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
category: step-3
---

# Step-3.1: Framework time: FILTER!

The function used allow some small GTS manipulation but WarpScript offers other rich tools for manipulating the GTS. Five frameworks are available and they all have their specific usage and important place in Time-Series analytics: [FILTER](http://www.warp10.io/reference/frameworks/framework-filter/), [BUCKETIZE](http://www.warp10.io/reference/frameworks/framework-bucketize/), [MAP](http://www.warp10.io/reference/frameworks/framework-map/), [REDUCE](http://www.warp10.io/reference/frameworks/framework-reduce/) and [APPLY](http://www.warp10.io/reference/frameworks/framework-apply/). Let's start with the FILTER framework.

## The framework

The first framework we discover in this tutorial is [FILTER](http://www.warp10.io/reference/frameworks/framework-filter/). It provides the tooling to select specific sub-set of Time-series in a list thereof.

Let's resume what we have on the stack: first the kepler-11 GTS are loaded using the [FETCH](http://www.warp10.io/reference/functions/function_FETCH/) function. Then the data are split according to a quiesce period using [TIMESPLIT](http://www.warp10.io/reference/functions/function_TIMESPLIT/).

## Input parameters

The filter function takes a list containing 3 elements as input parameter: the GTS as list or singleton to filter, then a list of labels to compute an equivalence class, and finally a filter function.

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

In our data-flow, the goal is now to select only 2 to 3 records of those series to see if it's possible to visualize some drops in those series and if we can start to build a working method to detect exoplanet. You will have to use a Variable as seen in the first step to place the Time-series list in first position of the element list.

The filter function we will use in our case corresponds to [filter.bylabels](http://www.warp10.io/reference/frameworks/filter_bylabels/). This function expects a selector map on top of the stack that have to be specify.
As an example you can try to use the selector labels map specifies in the follozing spec in your filter function.

```
// Store a labels map selector
{ 'record' '~[2-5]' } 'labelsSelector' STORE

// FILTER Framework
[
                                    // Series list or Singleton
                                    // Labels to compute equivalence class
                                    // Labels map for selector
                                    // Filter function operator
]
FILTER

```

## Resume

To resume, to filter a data set, we have to use the FILTER framework. It expects on the stack a list of parameter: the Time series as list or as singleton to filter, then a list of labels to compute an equivalence class, and finally a filter function. The filter function as we see the filter.bylabels can also need some parameter on top of stack.

The result of this step corresponds to a reduced list. In our case only 4 records (2 to 5) were selected using a regular expression. A list containing 4 Time series is now let on top of the WarpScript stack.

# To be continued

As an exoplanet hunter, you may be asking yourself why you should reduced the amount of data you will be working with. Be patient, and remember that taking your time during the first steps will making you win time in the longer run! Stay strong young hunter, more will come in the [next step](/step-3-WarpScript-Frameworks/3.2-Bucketize-framework/) as a framework very usefull for time-series downsampling will be briefly introduced.
