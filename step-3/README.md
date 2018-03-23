# Step-3: Framework time!

The function used allow some small GTS manipulation but WarpScript offers other rich tools for manipulating the GTS. Five frameworks are available and they all have their specific usage and important place in Time-Series analytics: [FILTER](http://www.warp10.io/reference/frameworks/framework-filter/), [BUCKETIZE](http://www.warp10.io/reference/frameworks/framework-bucketize/), [MAP](http://www.warp10.io/reference/frameworks/framework-map/), [REDUCE](http://www.warp10.io/reference/frameworks/framework-reduce/) and [APPLY](http://www.warp10.io/reference/frameworks/framework-apply/). Let's start with the FILTER framework.

## FILTER 

### The framework

The first framework we discover in this tutorial is [FILTER](http://www.warp10.io/reference/frameworks/framework-filter/). It provides the tooling to select specific sub-set of Time-series in a list thereof. 

Let's resume what we have on the stack: first the kepler-11 GTS are loaded using the [FETCH](http://www.warp10.io/reference/functions/function_FETCH/) function. Then the data are split according to a quiesce period using [TIMESPLIT](http://www.warp10.io/reference/functions/function_TIMESPLIT/). 

### Input parameters

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

### HEW step 

The script should now start with something similar to the following example:

```
// FETCH
[ 
	$token 								// Application authentication
	'kepler.sap.flux' 					// selector for classname
    { 'id' '006541920' }            	// Selector for labels
	'2009-05-02T00:56:10.000000Z' 		// Start date
	'2013-05-11T12:02:06.000000Z' 		// End date
] FETCH

// Get Singleton series
0 GET

// TIMESPLIT
// Quiesce period
6 h 

// Minimal numbers of points per series 
100 

// GTS split label
'record' 

TIMESPLIT

```

In our data-flow, the goal is now to select only 2 to 3 records of those series to see if it's possible to visualize some drops in those series and if we can start to build a working method to detect exo-planet. You can use a Variable as seen in the first step to place the Time-series list in first position of the element list, or use the following stack manipulation function: [SWAP](http://www.warp10.io/reference/functions/function_SWAP/). The SWAP function is used to invert the position of the top two elements on the stack. 

The filter function we will use in our case corresponds to [filter.bylabels](http://www.warp10.io/reference/frameworks/filter_bylabels/). This function expects a selector map on top of the stack that have to be specify. 
As an example you can try to use the selector labels map specifies in the follozing spec in your filter function.

```
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

## BUCKETIZE

### The framework

In this tutorial we will also discover the [BUCKETIZE framework](http://www.warp10.io/reference/frameworks/framework-bucketize/). It provides the tooling for putting the data of a geo time serie into regularly spaced buckets. A bucket corresponds to a time interval.  
We will use this bucket to downsample our data, let's give it a try! 


### Input parameters

The BUCKETIZE framework takes a list of elements as parameter. This list contains one or several GTS list, a [bucketizer function](http://www.warp10.io/reference/reference/#framework-bucketizers), a lastbucket that specify when start the last bucket (0 mean this will be computed automatically), a bucketcount which is the duration of the bucket (if 0 WarpScript will compute it), and finally a bucketcount which is the number of buckets (if 0 WarpScript will compute it). 

**Pro tips: In order to get a correct number of buckets either Bucketspan or Bucketcount have to be specified!**

```
// BUCKETIZE Framework
[
    SWAP                                // Series list or Singleton
    bucketizer.                         // Bucketize function operator
    0                                   // Lastbucket               
    1 d                                 // Bucketspan
    0                                   // Bucketcount
]
BUCKETIZE
```


### HEW step

Let's do it! Try the bucketizer.min with a bucketize window of 2 h.

```
// BUCKETIZE Framework
[
                                        // Series list or Singleton
                                        // Bucketize function operator
                                        // Lastbucket 				
                                        // Bucketspan
                                        // Bucketcount
]
BUCKETIZE

```

Did you get why the SWAP is needed here?


## MAP 

Now it is time to update the values of a set of GTS using the [MAP framework](http://www.warp10.io/reference/frameworks/framework-map/). The MAP framework allows you to apply a function on values of a Geo Time SeriesTM that fall into a sliding window. In this tutorial, you will use the mapper to convert all prices in dollars, to compute the derivation of those GTS and finally to kept only the value of GTS superior to 1.08 euros of the 20 stations nearest the Brest airport.

### MAP parameters

Map takes as input a list of parameters. The first element of this list can be one or several lists of GTS. Then there is a [mapper function](www.warp10.io/reference/reference/#framework-mappers). The third and the fourth elements are related to the sliding window, with first an element corresponding to "pre", the width of the sliding window before the value, and in second an element corresponding to "post", the width of the sliding window after the value. The last element corresponds to "occurences" which is the limit of computation of a number. For all elements except the set of GTS and the mapper function a default value 0 can be used, when those elements aren't required.

