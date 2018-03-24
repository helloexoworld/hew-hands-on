# Step-2.1: Exploring the available time-series! 

Now that you survive all the WarpScript needed knowlded, we would like to welcome you in our special quest, as an exo-planet hunter!

## FIND

We preloaded our platform with some stars (around 30). Let's observe the series structures and find the one that we want! We are going to use a function called [FIND](http://www.warp10.io/reference/functions/function_FIND/).

The FIND function finds Geo Time SeriesTM matching some criteria.

The top of the stack must contain a LIST with 3 parameters: a Warp10 token, a classname selector and a MAP of label selectors.

The classname selector is a string which represents an exact match if it starts with an ‘=’, or a regular expression if it starts with ‘~’.

The label selectors are packed in a MAP whose keys are the label names and the values the associated selector. Those selectors can also be exact matches if they start with ‘=’ or a regular expression if they start with ‘~’.

Here a preloaded WarpScript that you can use, find all the GTS available!

```
// Storing the token into a variable
'abcd' 'token' STORE

// Start the find with the token as first parameter
[ $token  ] FIND

```

The one that we are looking for has a label called '', can you see it? Change the FIND to have only one result: Kepler-11!

# To be continued

During this step you manipulated a sub-set of series extracted of the FIT data of the NASA. Now to really explore this set of data, let's obeserve what the lightcurve for the kepler-11 time series looks like. In the next, you will learn how to extract raw data using Warp 10.