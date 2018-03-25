# Step-2.3: Manipulate a Geo Time Series®!

Now that you are used to play with the stack, let's manipulate some data!

## FETCH resume

TODO

## Handling a list 

What is the type of the result? You can use TYPEOF to see it. because it is a single list holding only one element, you can push back the first element by calling 0 GET after the FETCH instruction.

## Handling time 

As you may have seen, the data-window is pretty long, and they are drops. Drops are period where they are no data. Let's clean that. There is a function called [TIMESPLIT](http://10.3.141.1:8082/reference/functions/function_TIMESPLIT/) that will be able to help us! As stated by the documentation:

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
    'kepler.sap.flux'                   // selector for classname
    { 'id' '006541920' }                // Selector for labels
    '2009-05-02T00:56:10.000000Z'       // Start date
    '2013-05-11T12:02:06.000000Z'       // End date
] FETCH

//
// TIMESPLIT block:
//

// Quiesce period


// Minimal numbers of points per series 


// Labels for each splitted series
'record'

 
```

# To be continued

During this step you manipulated a sub-set of series extracted of the FIT data of the NASA. You discovered how to extract raw data from Warp 10 and how to use one of the Time manipulation function WarpScript offers! This is only the beginning of the hunt, there will be more to come in the [next step](/step-3-WarpScript-Frameworks/3.1-Filter-framework/README.md) with all the basic Times Series framework to start an analysis!