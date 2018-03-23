# Step-2.2: Load time series raw data

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

# To be continued

During this step you have extracted all the raw data stored in Warp10, you can already observe some discontinuty on the raw that have to be cleaned. In the next step we are going to focus on a more complete script that will allow us to obtain a proper result. 