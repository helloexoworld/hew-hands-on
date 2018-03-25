# Step-4.1: Yet another framework: APPLY!

## The framework 

Yet an other WarpScript framework: APPLY! It's a framework used to compute operation  (like add, sub or mask) on multiple set of series. In this tutorial we will no enter in the details of this framework, but notice it exists and can but used to substract two set of series! 

The signature of the Apply with the sub operation is described below:

```
[
    $gtsSetMinuend
    $gtsSetSubtrahend
    []
    op.sub
]
APPLY

```

## Practice

The following example show you a quick demonstration on how to use it with the sub operator. In this example 4 series are first created and put in two diffrent set. 
Then it's up to you, hunter, to compute the difference of the first set series with the ones contained in the second one, according to the sensor label. Please complete the APPLY skeleton below to correctly doing it.


```
[
    NEWGTS "series-1" RENAME 
    { 'sensor' '42' } RELABEL
    10 NaN NaN NaN 46.5 ADDVALUE
    20 NaN NaN NaN  23  ADDVALUE
    NEWGTS "series-2" RENAME 
    { 'sensor' '53' } RELABEL
    10 NaN NaN NaN 46.5 ADDVALUE
    20 NaN NaN NaN  23  ADDVALUE
    30 NaN NaN NaN  42  ADDVALUE
]
'firstResult' STORE

[
  NEWGTS "series-3" RENAME 
  { 'sensor' '42' } RELABEL
  10 NaN NaN NaN  4.5 ADDVALUE
  20 NaN NaN NaN  -19 ADDVALUE
  NEWGTS "series-4" RENAME 
  { 'sensor' '53' } RELABEL
  10 NaN NaN NaN  4.5 ADDVALUE
  15 NaN NaN NaN  0.4 ADDVALUE
  20 NaN NaN NaN  -19 ADDVALUE
]
'secondResult' STORE

[
                                        // Series list or Singleton minuend
                                        // Series list or Singleton subtrahend
                                        // Labels to compute equivalence class
    op.sub                              // Apply function operator
]
APPLY

```

# To be continued

Once you are familiar with this specific operation of the APPLY framework, please continue with the next step, as you initiation as an exo-planet hunter is about to end. As a matter of fact, you now have the knowledge of all the needed tools to start exploring the kepler-11 start to detect it's exo-planet. Let's find together how to process in the [next step](https://github.com/helloexoworld/hands-on/tree/master/step-4%20-%20First%20Exo%20Detection/4.2%20-%20Compute%20the%20difference%20between%20the%20lightcurve%20and%20the%20trend).