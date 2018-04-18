---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
title: 'Step 4.1: Yet another framework: APPLY'
category: step-4
before: 'step-3-WarpScript-Frameworks/3.3-Map-framework'
next: 'step-4-First-Exo-Detection/4.2-Compute-the-difference-between-the-lightcurve-and-the-trend'
solution: 'step-4-First-Exo-Detection/4.1-Yet-another-framework-APPLY/solutions'
---

Yet an other WarpScript framework: [`APPLY`]({{ site.doc_url }}/reference/frameworks/framework-apply/)! It's a framework used to compute operation (like add, sub or mask) on multiple set of series. In this tutorial we will no enter in the details of this framework, but notice it exists and can but used to substract two set of series! 

***At the bottom of this page, you will find a practice example showing how to substract two set of time series.***

## The framework

The signature of the [`APPLY` with a sub operator]({{ site.doc_url }}/reference/frameworks/op_sub/) is described below. It takes 4 parameters: a set of time series that compose the `minuend`, an other set that compose the `subtrahend` of the `sub operation`. A list of labels and the `op.sub` operation are the last two required parameter.

<warp10-embeddable-quantum warpscript="
[
    $gtsSetMinuend
    $gtsSetSubtrahend
    []
    op.sub
]
APPLY
">
</warp10-embeddable-quantum>

This will compute the sub operation between the first and the second set (based on the equivalences classes).

## Apply in pictures

To get a better understanding of the `APPLY` framework, let's decompose the `APPLY` operation on several steps.

First several set of time series are needed as input. In our case, for the sub operation, a `minuend` is first needed:

![Alt Text]({{ site.baseurl }}/img/frameworks/Time-series-input.png)

Still in our case, a second set of time series is needed, the `subtrahend`:

![Alt Text]({{ site.baseurl }}/img/frameworks/Time-series-input.png)

After this operation an equivalence class have to be computed to split the series (in the example below) based on the record labels. This mean that we compute the `APPLY` operation only between the series of both set that belongs to the **same equivalence class**.

![Alt Text]({{ site.baseurl }}/img/frameworks/equivalence-class.png)

And finally, we select the apply operation to compute on each equivalence class:

![Alt Text]({{ site.baseurl }}/img/frameworks/apply-operator.png)

In our case it would be the sub operation! Let's practice it before applying this operation on the NASA lightcurve data.

## Practice

The following example show you a quick demonstration on how to use it with the sub operator. In this example 4 time series are first created and put in two diffrent set. 
Then it's up to you, hunter, to compute the difference of the earth or mars series of the first set with the one related contained in the second one! The base code is available in the `APPLY` skeleton below.

**Pro-tips: Use the equivalence class on the label "name" to compute a name based difference**

<warp10-embeddable-quantum warpscript="
[
    NEWGTS 'planet.rotation.count' RENAME 
    { 'name' 'earth' } RELABEL
    10 NaN NaN NaN 120 ADDVALUE
    20 NaN NaN NaN 123  ADDVALUE
    NEWGTS 'planet.rotation.count' RENAME 
    { 'name' 'mars' } RELABEL
    10 NaN NaN NaN 124 ADDVALUE
    20 NaN NaN NaN 125 ADDVALUE
    30 NaN NaN NaN 126  ADDVALUE
]
'firstResult' STORE

[
  NEWGTS 'planet.rotation.count.to.correct' RENAME 
  { 'name' 'earth' } RELABEL
  10 NaN NaN NaN  1 ADDVALUE
  20 NaN NaN NaN  2 ADDVALUE
  NEWGTS 'planet.rotation.count.to.correct' RENAME 
  { 'name' 'mars' } RELABEL
  10 NaN NaN NaN  1 ADDVALUE
  15 NaN NaN NaN  1 ADDVALUE
  20 NaN NaN NaN  1 ADDVALUE
]
'secondResult' STORE

[
                                        // Series list or Singleton minuend
                                        // Series list or Singleton subtrahend
                                        // Labels to compute equivalence class
    op.sub                              // Apply function operator
]
APPLY
">
</warp10-embeddable-quantum>

## Resume

To compute a difference between two series, the framework `APPLY` need to be used. It's also better to synchronize the ticks of each series using `BUCKETIZE` before computing this operation. The `APPLY` framework for the sub operation expects two set of list and an equivalence class. Where you careful when you set this parameter to be sure to compute a substraction on only the earth or mars series ?

As a result you get a list of two series: one containing all the value of the earth (resp. mars) rotation time series substracted of the value to correct of the second earth (resp. mars) time series.

## To be continued

Once you are familiar with this specific operation of the `APPLY` framework, please continue with the next step, as you initiation as an exoplanet hunter is about to end. As a matter of fact, you now have the knowledge of all the needed tools to start exploring the kepler-11 start to detect it's exoplanet.
