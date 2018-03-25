# Step-1: Manipulate a WarpScript List!

## Structure and function

In WarpScript hundreds of functions are available, you can access the documentation [here](http://www.warp10.io/reference/reference/).
In WarpScript, it's possible to build structure as [List or Map](http://www.warp10.io/reference/reference/#functions-lists-maps).
The structure to build a List in WarpScript is as followed. First put a marker to open a list, then the elements to add. 

```
[ 'elem' 'elem2' ]
```

Let's play with it, here's the squeleton:

```
// Build a list containing values 1 and 3 


// Add the element 2


// Sort the list


// Reverse it
```

 build a new list containing two elements: 1 and 3. Then add the elements 2 using the operator [+](http://www.warp10.io/reference/functions/function_ADD/) on this list. Now to sort this list, apply the function [LSORT](http://www.warp10.io/reference/functions/function_LSORT/) on it. This will sort the list, which is on top of stack, in a ascending order and let as a result this list on top of the stack. To sort the list in a descending order, apply the [REVERSE](http://www.warp10.io/reference/functions/function_REVERSE/) function on this list.

# To be continued

Great job! You now have all the basic WarpScript knowlegde to get started with the analyse of the recorded Nasa Time-series! To start, continue with our second step [here](https://github.com/helloexoworld/hands-on/tree/master/step-2%20-%20Kepler's%20Data/2.1%20-%20Exploring%20known%20time%20series).