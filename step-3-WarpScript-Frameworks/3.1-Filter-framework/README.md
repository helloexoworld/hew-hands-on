# Step-3.1: Framework time: FILTER!

The function used allow some small GTS manipulation but WarpScript offers other rich tools for manipulating the GTS. Five frameworks are available and they all have their specific usage and important place in Time-Series analytics: [FILTER](/docs/reference/frameworks/framework-filter/), [BUCKETIZE](/docs/reference/frameworks/framework-bucketize/), [MAP](/docs/reference/frameworks/framework-map/), [REDUCE](/docs/reference/frameworks/framework-reduce/) and [APPLY](/docs/reference/frameworks/framework-apply/). Let's start with the FILTER framework.

## The framework

The first framework we discover in this tutorial is [FILTER](/docs/reference/frameworks/framework-filter/). It provides the tooling to select specific sub-set of Time-series in a list thereof.

Let's resume what we have on the stack: first the kepler-11 GTS are loaded using the [FETCH](/docs/reference/functions/function_FETCH/) function. Then the data are split according to a quiesce period using [TIMESPLIT](/docs/reference/functions/function_TIMESPLIT/).

## Input parameters

The filter function takes a list containing 3 elements as input parameter
```
// Filter framwork
[
    $gts                                // Series list or Singleton
    []                                  // Labels to compute equivalence class
    filter.                             // A selector function 
]
FILTER

```

## HEW step

In our data-flow, the goal is now to select only 2 to 3 records of those series to see if it's possible to visualize some drops in those series and if we can start to build a working method to detect exoplanet. You can use a Variable as seen in the first step to place the Time-series list in first position of the element list, or use the following stack manipulation function: [SWAP](/docs/reference/functions/function_SWAP/). The SWAP function is used to invert the position of the top two elements on the stack. 

The filter function we will use in our case corresponds to [filter.bylabels](/docs/reference/frameworks/filter_bylabels/). This function expects a selector map on top of the stack that have to be specify.
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

# To be continued

As an exoplanet hunter, you may be asking yourself why you should reduced the amount of data you will be working with. Be patient, and remember that taking your time during the first steps will making you win time in the longer run! Stay strong young hunter, more will come in the [next step](/step-3-WarpScript-Frameworks/3.2-Bucketize-framework/README.md) as a framework very usefull for time-series downsampling will be briefly introduced.