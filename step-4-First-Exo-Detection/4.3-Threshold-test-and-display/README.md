# Step-4.3: Threshold and display!

You did a great jobs to compute the difference between the light curve and the trend hunter! But how do you see how you can quickly automate the drop detection?

## Threshod test

Let's compute at first a threshold test! In WarpScript you can re-use the MAP framework to do it! The [MAP framework](/docs/reference/frameworks/framework-map/) have the following operator: [gt](/docs/reference/frameworks/mapper_gt/) (greater than), [ge](/docs/reference/frameworks/mapper_ge/) (greater or equals), [eq](/docs/reference/frameworks/mapper_eq/) (equals), [lt](/docs/reference/frameworks/mapper_lt) (lower than), [le](/docs/reference/frameworks/mapper_le/) (lower or equals)... Find out the correct operator and working threshold!

## Display things nicely

Great now you can successfully detect some exoplanet! You have well earn your badge as an exoplanet hunter! Just one more thing, how to be sure that the periods you have extracted corresponds to exoplanet ? Let's print more nicely the result! To do so, we can convert our result into annotations in WarpScript. This can be done using boolean instead of values! And there is also a mapper to do it: [mapper.toboolean](/docs/reference/frameworks/mapper_toboolean/).

** Pro tip: mapper.toboolean is a single value mapper and would not work correctly on bucketized series. To correct it and get the better result we recommand to use the [UNBUCKETIZE](/docs/reference/functions/function_UNBUCKETIZE/) function right after the BUCKETIZE operation**

Then you can push back on the stack the original series using a variable!

# To be continued

Great, you're now an experimented exoplanet hunter! I am sure you're ready now ready to test you're analysis on lot more of the Kepler's start. That's exactly what we will accomplish in our [next step](/step-5-Process-all-stars/5.1-WarpScript-loops/README.md).