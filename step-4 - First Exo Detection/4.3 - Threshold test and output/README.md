# Step-4: let's compute the trend!

You did a great jobs to compute the difference between the trend and the light curve hunter! But how do you see how you can quickly automate the drop detection?

## Threshod test

Let's compute at first a threshold test! In WarpScript you can re-use the MAP framework to do it! The MAP framework have the following operator: gt (greater than), ge (greater or equals), eq (equals), lt (lower than), le (lower or equals)... Find out the correct operator and working threshold!

## Display things nicely

Great now you can successfully detect some exo-planet! You have well earn your badge as an exo-planet hunter! Just one more thing, how to be sure that the periods you have extracted corresponds to exo-planet ? Let's print more nicely the result! To do so, we can convert our result into annotations in WarpaScript. This can be done using boolean instead of values! And there is also a mapper to do it: mapper.toboolean.

** Pro tip: mapper.toboolean is a single value mapper and would not work correctly on bucketized series. To correct it and get the better result we recommand to use the UNBUCKETIZE function right after the BUCKETIZE operation**

Then to see both the initial series and the annotation series, you can merge both list in a single list using APPEND, or let them both on the stack.

# To be continued

Next step: free practice and discovery of a others WarpScript functions