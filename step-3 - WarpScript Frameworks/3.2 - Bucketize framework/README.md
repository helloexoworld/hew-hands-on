# Step-3: Framework time: BUCKETIZE!

The function used allow some small GTS manipulation but WarpScript offers other rich tools for manipulating the GTS. Five frameworks are available and they all have their specific usage and important place in Time-Series analytics: [FILTER](http://www.warp10.io/reference/frameworks/framework-filter/), [BUCKETIZE](http://www.warp10.io/reference/frameworks/framework-bucketize/), [MAP](http://www.warp10.io/reference/frameworks/framework-map/), [REDUCE](http://www.warp10.io/reference/frameworks/framework-reduce/) and [APPLY](http://www.warp10.io/reference/frameworks/framework-apply/). Let's continue with the BUCKETIZE framework.

## The framework

In this tutorial we will also discover the [BUCKETIZE framework](http://www.warp10.io/reference/frameworks/framework-bucketize/). It provides the tooling for putting the data of a geo time serie into regularly spaced buckets. A bucket corresponds to a time interval.  
We will use this bucket to downsample our data, let's give it a try! 

## Input parameters

The BUCKETIZE framework takes a list of elements as parameter. This list contains one or several GTS list, a [bucketizer function](http://www.warp10.io/reference/reference/#framework-bucketizers), a lastbucket that specify when start the last bucket (0 mean this will be computed automatically), a bucketcount which is the duration of the bucket (if 0 WarpScript will compute it), and finally a bucketcount which is the number of buckets to compute (if 0 WarpScript will compute it). 

**Pro tips: In order to get a correct number of buckets either Bucketspan or Bucketcount have to be specified!**
**Pro tips 2: Bucketcount indicate the number of bucket to keep starting from the last bucket computed when Bucketspan is also set!**

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

## HEW step

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

# To be continued

It look's simple as first look, but truts us it isn't. When you will be working on complex time-series analytics, keep in mind this framework and try to be familiar with it! You will quickly see how it will improves your exo-planet discovery quest! In the next step, we are guiding you in the usage of an other usefull framework: MAP or how to apply the same function on all data-point of a set of time-series.