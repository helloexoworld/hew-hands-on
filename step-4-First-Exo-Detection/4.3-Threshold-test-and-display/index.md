---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
title: 'Step 4.3: Threshold and display'
category: step-4
---

You did a great jobs to compute the difference between the light curve and the trend hunter! But how do you see how you can quickly automate the drop detection?

## Threshold test

Let's compute at first a threshold test! In WarpScript you can re-use the MAP framework to do it! The [MAP framework]({{ site.doc_url }}/reference/frameworks/framework-map/) have the following operator: [gt]({{ site.doc_url }}/reference/frameworks/mapper_gt/) (greater than), [ge]({{ site.doc_url }}/reference/frameworks/mapper_ge/) (greater or equals), [eq]({{ site.doc_url }}/reference/frameworks/mapper_eq/) (equals), [lt]({{ site.doc_url }}/reference/frameworks/mapper_lt) (lower than), [le]({{ site.doc_url }}/reference/frameworks/mapper_le/) (lower or equals)... Find out the correct operator and working threshold!

How does we proceed ? The threshold test corresponds finally in the re-using the MAP framework. If you would like to have a reminder see below or to review the lesson on MAP: [go here]((/step-3-WarpScript-Frameworks/3.3-Map-framework/README.md)).

The map framework works as follow:

```
// MAP Framework
[
    SWAP                                // Series list or Singleton
    mapper.function                     // Mapper function operator
    0                                   // Pre
    0                                   // Post
    0                                   // Occurence
]
MAP
```

This time we are going to use the map framework to compute a single value operation! Does the current value below a specified threshold. We can use one of the mapper function indicated upper. Those function would expect a number parameter on top of the stack (2, 5, 10, 15, 20, 25, 30 and so on could be working value here).

The result will be the same series containing only the points that match the criteria specified with the function. For example with a mapper.le and a threshold of 30, only the points that are equals to 30 or lower are kept in the result series. 

## Display things nicely

Great now you can successfully detect some exoplanet! You have well earn your badge as an exoplanet hunter! Just one more thing, how to be sure that the periods you have extracted corresponds to exoplanet ? Let's print more nicely the result! To do so, we can convert our result into annotations in WarpScript. This can be done using boolean instead of values! And there is also a mapper to do it: [mapper.toboolean]({{ site.doc_url }}/reference/frameworks/mapper_toboolean/).

** Pro tip: mapper.toboolean is a single value mapper and would not work correctly on bucketized series. To correct it and get the better result we recommand to use the [UNBUCKETIZE]({{ site.doc_url }}/reference/functions/function_UNBUCKETIZE/) function right after the BUCKETIZE operation**

Then you can push back on the stack the original series using a variable!

To help you achieve this step, you can complete the following skeleton. The step to complete start with TODO.

```
// Storing the token into a variable
@HELLOEXOWORLD/GETREADTOKEN 'token' STORE 

// FETCH
[ 
    $token                              // Application authentication
    'sap.flux'                          // selector for classname
    { 'KEPLERID' '6541920' }            // Selector for labels
    '2009-05-02T00:56:10.000000Z'       // Start date
    '2013-05-11T12:02:06.000000Z'       // End date
] 
FETCH

... 

//
// BUCKETIZE block:
//

// BUCKETIZE Framework
[
    $filteredSeries                     // Series list or Singleton
    bucketizer.min                      // Bucketize function operator
    0                                   // Lastbucket 				
    2 h                                 // Bucketspan
    0                                   // Bucketcount
]
BUCKETIZE

//
// TODO: Add an UNBUCKETIZE once the series are sampled (to be able to use mapper.toboolean to print annotations)
//


'bucketizedSeries' STORE

//
// APPLY block:
//

[
    $bucketizedSeries                    // Series list or singleton minuend

    //
    // MAP block: Compute moving mean 
    //

    [
        $bucketizedSeries               // Series list or Singleton
        mapper.mean                     // Mapper function operator
        5                               // Pre
        5                               // Post
        0                               // Occurences
    ]
    MAP                                 // Series list or singleton subtrahend

    [ 'record' ]                        // Labels to compute equivalence class
    op.sub                              // Apply function operator
]
APPLY

'applyResult' STORE

// 
// TODO: Threshold test
//


// 
// TODO: Print annotations series using a mapper.toboolean
//


// Push the original series to compare with
$bucketizedSeries

```

## Resume

At the end of this step, two sets of series are now availble on the stack. One containing all the time a specify series were below a threshold converted to boolean annotations. And the second set series contains the original series. We can the compare (when ploting both result) if our method to detect an exoplanet on Kepler-11 is efficient or not. 

# Next Step

Great, you're now an experimented exoplanet hunter! I am sure you're ready now ready to test you're analysis on lot more of the Kepler's start. That's exactly what we will accomplish in our [next step]({{ site.baseurl }}/step-5-Process-all-stars/5.1-WarpScript-loops/).