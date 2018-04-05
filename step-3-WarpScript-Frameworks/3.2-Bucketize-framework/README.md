# Step-3.2: Framework time: BUCKETIZE!

The function used allow some small GTS manipulation but WarpScript offers other rich tools for manipulating the GTS. Five frameworks are available and they all have their specific usage and important place in Time-Series analytics: [FILTER](http://www.warp10.io/reference/frameworks/framework-filter/), [BUCKETIZE](http://www.warp10.io/reference/frameworks/framework-bucketize/), [MAP](http://www.warp10.io/reference/frameworks/framework-map/), [REDUCE](http://www.warp10.io/reference/frameworks/framework-reduce/) and [APPLY](http://www.warp10.io/reference/frameworks/framework-apply/). Let's continue with the BUCKETIZE framework.

***At the bottom of this page, you will find the instructions on how to process to apply the bucketize on the NASA lightcurve data.***

## The framework

In this tutorial we will also discover the [BUCKETIZE framework](http://www.warp10.io/reference/frameworks/framework-bucketize/). It provides the tooling for putting the data of a geo time serie into regularly spaced buckets. A bucket corresponds to a time interval.

We will use this bucket to downsample our data, let's give it a try! In other words, downsampling some Time series consists to reduce locally the number of points and to synchronize different series. There is several ways to process, one of the common one is to create small regular bucket into each series and to compute a value that resume this bucket. The following graphs shows the downsampling process:

![Alt Text](/assets/img/frameworks/downsampling.png) 

What happen in each bucket? All the points inside the selected bucket are loaded and given to a function. This function will then be executed and one value will be selected (first, last, min, max) or computed (mean, median, count, join). Only one point is kept per bucket!

![Alt Text](/assets/img/frameworks/bucketize.png)

## Input parameters

The BUCKETIZE framework takes a list of elements as parameter. This list contains one or several GTS list, a [bucketizer function](http://www.warp10.io/reference/#framework-bucketizers), a lastbucket that specify when start the last bucket (0 mean this will be computed automatically), a bucketcount which is the duration of the bucket (if 0 WarpScript will compute it), and finally a bucketcount which is the number of buckets to compute (if 0 WarpScript will compute it).

**Pro tips: In order to get a correct number of buckets either Bucketspan or Bucketcount have to be specified!**

**Pro tips 2: Bucketcount indicate the number of bucket to keep starting from the last bucket computed when a Bucketspan is also set!**


```
// BUCKETIZE Framework
[
    SWAP                                // Series list or Singleton
    bucketizer.function                 // Bucketize function operator
    0                                   // Lastbucket
    1 d                                 // Bucketspan
    0                                   // Bucketcount
]
BUCKETIZE

```

To get a working bucketizer, replace the function keyword by an exisiting function as first, last, mean, min, max, median, join...

## Bucketize in pictures

Let's resume step by step each bucketize element. First BUCKETIZE requires a set of Time series (Singleton or list):

![Alt Text](/assets/img/frameworks/Time-series-input.png)

The second step consists to choose the function to apply on each bucket: first, last, mean, min, max, median, join, and [others](http://www.warp10.io/reference/reference/#bucketizers):

![Alt Text](/assets/img/frameworks/bucketizer.png)

A bucketizer can be tuned according to three parameters: lastbucket which specifies the last tick (for all the series) to start computing each bucket. This parameter is very usefull to synchronize different Time series.

![Alt Text](/assets/img/frameworks/lastbucket.png)

The second parameter to tun a bucketizer consists of the bucketspan. Bucketspan is the width of each bucket:

![Alt Text](/assets/img/frameworks/bucketspan.png)

And finally the last parameter used to tun a bucketizer is the bucketcount to specify the maximal number of bucket to compute!

![Alt Text](/assets/img/frameworks/bucketcount.png)

Now we would like to apply this specific framework to compute a downsampling operation on the NASA lightcurve data. Let's see how to process!

## Hello Exo World step

Only a single amount of series were kept in our previous step, it's already possible to observe some drops in the data. Now we would like to write a script automasing the detection of those drops. But first, to gain some data readibilty, a downsampling step is included. In our case we are intersted in a downsampling conserving the minimal point of each generated bucket for each series.
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

## Resume

The main goal of this step is to downsample some raw data. To do so, you have to use the BUCKETIZE framework, it expects on top of the stack a list of parameters containing: the Time series as list or as singleton to bucketize, a bucketizer function, and three long parameter: lastbucket, bucketspan and bucketcount.

The result of this step corresponds to a downsampled list. In our case the 4 selected Time series are now on top of stack containing regular bucket and one value per bucket.

# To be continued

It look's simple as first look, but truts us it isn't. When you will be working on complex time-series analytics, keep in mind this framework and try to be familiar with it! You will quickly see how it will improves your exoplanet discovery quest! In the [next step](/step-3-WarpScript-Frameworks/3.3-Map-framework/README.md), we are guiding you in the usage of an other usefull framework: MAP or how to apply the same function on all data-point of a set of time-series.
