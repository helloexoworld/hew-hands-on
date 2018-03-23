# Step-2: Manipulate a Geo Time Serie®

Now that you are used to play with the stack, let's manipulate some data!

## FIND

We preloaded our platform with some stars (around 30). Let's observe the series structures and find the one that we want! We are going to use a function called [FIND](http://www.warp10.io/reference/functions/function_FIND/).

The FIND function finds Geo Time SeriesTM matching some criteria.

The top of the stack must contain a LIST with 3 parameters: a Warp10 token, a classname selector and a MAP of label selectors.

The classname selector is a string which represents an exact match if it starts with an ‘=’, or a regular expression if it starts with ‘~’.

The label selectors are packed in a MAP whose keys are the label names and the values the associated selector. Those selectors can also be exact matches if they start with ‘=’ or a regular expression if they start with ‘~’.

Here a preloaded WarpScript that you can use, find all the GTS available!

```
'abcd' 'token' STORE // storing the token into a variable
// you can push back the variable into the stack using $token for example

[ $token  ] FIND 
```

The one that we are looking for has a label called '', can you see it? Change the FIND to have only one result: Kepler-11!

## FETCH 

Now that we found the right star, let's get some data using [FETCH](http://www.warp10.io/reference/functions/function_FETCH/)! It is a function similar to find, with more arguments that gives the boundaries of a window to get raw datapoints.

```
// FETCH
[ 
	$token 								// Application authentication
	'kepler.sap.flux' 					// selector for classname
    { 'id' '006541920' }            	// Selector for labels
	'2009-05-02T00:56:10.000000Z' 		// Start date
	'2013-05-11T12:02:06.000000Z' 		// End date
] FETCH
```

You can click on Execute then Plot. You will see a list of GTS, click on one to view it.

## Handling a list 

What is the type of the result? You can use TYPEOF to see it. because it is a single list holding only one element, you can push back the first element by calling 0 GET after the FETCH instruction.

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
	$token 								// Application authentication
	'kepler.sap.flux' 					// selector for classname
    { 'id' '006541920' }            	// Selector for labels
	'2009-05-02T00:56:10.000000Z' 		// Start date
	'2013-05-11T12:02:06.000000Z' 		// End date
] FETCH

// TIMESPLIT
// Quiesce period


// Minimal numbers of points per series 

TIMESPLIT
```

## To be continued

During this step you manipulated a sub-set of series extracted of the FIT data of the NASA. You discovered how to extract raw data from Warp 10 and how to use one of the Time manipulation function WarpScript offers! This is only the beginning, there is more to come in the [next step](https://github.com/helloexoworld/hands-on/tree/master/step-3) with all the basic Times Series framework to start an analysis!