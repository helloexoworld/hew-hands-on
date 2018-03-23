# Step-4: let's compute the trend!

# The MAP framework

In previous tutorial, you learn how to create time buckets from a set of GTS. In this tutorial, you will learn to update the values of a set of GTS using the [MAP framework](http://www.warp10.io/reference/frameworks/framework-map/). The MAP framework allows you to apply a function on values of a Geo Time SeriesTM that fall into a sliding window. In this tutorial, you will use the mapper to convert all prices in dollars, to compute the derivation of those GTS and finally to kept only the value of GTS superior to 1.08 euros of the 20 stations nearest the Brest airport.

## MAP parameters

Map takes as input a list of parameters. The first element of this list can be one or several lists of GTS. Then there is a [mapper function](www.warp10.io/reference/reference/#framework-mappers). The third and the fourth elements are related to the sliding window, with first an element corresponding to "pre", the width of the sliding window before the value, and in second an element corresponding to "post", the width of the sliding window after the value. The last element corresponds to "occurences" which is the limit of computation of a number. For all elements except the set of GTS and the mapper function a default value 0 can be used, when those elements aren't required.

```
// MAP Framework
[
    $bucketizedSeries
    mapper.mean
    5
    5
    0
]
MAP
'trend' STORE
```

## APPLY 

```
[ $bucketizedSeries $trend  [ 'record' ] op.sub ] APPLY 
```

## Display things nicely

```
[ SWAP [] -20.0 mapper.lt 0 0 0 ] MAP NONEMPTY UNBUCKETIZE
[ SWAP mapper.toboolean 0 0 0 ] MAP
$bucketizedSeries
APPEND
```
