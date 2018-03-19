# Step-3: Framework time!

## FILTER 

TODO: 

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

// FILTER Framework
[
    SWAP                                // Series list or Singleton
    []                                  // Labels to compute equivalence class
    { 'record' '~[2-5]' }               // Labels map for selector
    filter.bylabels                     // Filter function operator 
]
FILTER
```

## BUCKETIZE

# The BUCKETIZE framework

The function used allow some small GTS manipulation but WarpScript offers other rich tools for manipulating the GTS. Five frameworks are available, in this tutorial we will discover the [BUCKETIZE framework](http://www.warp10.io/reference/frameworks/framework-bucketize/). It provides the tooling for putting the data of a geo time serie into regularly spaced buckets. A bucket corresponds to a time interval.  
We will use this bucket to downsample our data, try it! 

```



## BUCKETIZE parameters

The BUCKETIZE framework takes a list of elements as parameter. This list contains one or several GTS list, a [bucketizer function](http://www.warp10.io/reference/reference/#framework-bucketizers), a lastbucket that specify when start the last bucket (0 mean this will be computed automatically), a bucketcount which is the duration of the bucket (if 0 WarpScript will compute it), and finally a bucketcount which is the number of buckets (if 0 WarpScript will compute it). 

Let's do it! Try the bucketizer.min with a bucketize window of 2 h

```

// BUCKETIZE Framework
[
    SWAP                                // Series list or Singleton
    bucketizer.min                      // Bucketize function operator
    0                                   // Lastbucket 				
    2 h                                 // Bucketspan
    0                                   // Bucketcount
]
BUCKETIZE
```

Did you get why the SWAP is needed here?


## MAP 

Now it is time to update the values of a set of GTS using the [MAP framework](http://www.warp10.io/reference/frameworks/framework-map/). The MAP framework allows you to apply a function on values of a Geo Time SeriesTM that fall into a sliding window. In this tutorial, you will use the mapper to convert all prices in dollars, to compute the derivation of those GTS and finally to kept only the value of GTS superior to 1.08 euros of the 20 stations nearest the Brest airport.

### MAP parameters

Map takes as input a list of parameters. The first element of this list can be one or several lists of GTS. Then there is a [mapper function](www.warp10.io/reference/reference/#framework-mappers). The third and the fourth elements are related to the sliding window, with first an element corresponding to "pre", the width of the sliding window before the value, and in second an element corresponding to "post", the width of the sliding window after the value. The last element corresponds to "occurences" which is the limit of computation of a number. For all elements except the set of GTS and the mapper function a default value 0 can be used, when those elements aren't required.

