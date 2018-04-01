# Step-4.2: Let's compute the difference!

Congrats young hunter in reaching this step! Here you will learn how to use all the knowledge gain in previous step to build your first script to search for exoplanet!
The process is similar to the previous step. Start with the script resuming the data loading, the record split (according to time), the filtering and the downsampling.

```
// Storing the token into a variable
'abcd' 'token' STORE 

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

//
// FILTER block:
//

// Store a labels map selector
{ 'record' '~[2-5]' } 'labelsSelector' STORE

// FILTER Framework
[
    SWAP                            // Series list or Singleton
    []                              // Labels to compute equivalence class
    $labelsSelector                 // Labels map for selector
    filter.bylabels                 // Filter function operator 
]
FILTER

//
// BUCKETIZE block:
//

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

Starting from here, use the [APPLY](http://www.warp10.io/reference/frameworks/framework-apply/) framework to compute the [difference]((http://www.warp10.io/reference/frameworks/op_sub/)) between the originial series and the series trend (computing using an average mean for example). Feel free to search for a script optimizing the drop detection!

# To be continued

Well done young hunter, let's continue together on the [last step](/step-4-First-Exo-Detection/4.3-Threshold-test-and-display/README.md) of this stage to learn how to isolate a minus threshold and build a nice output!