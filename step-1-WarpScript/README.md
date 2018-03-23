# Step-1: getting started with WarpScript!

## What is WarpScript?

WarpScript is a programming language specific to Geo Time Series® analysis. For security reason, WarpScript is an interpreted language, which means that a Warp 10 backend have to be reached to execute your script. Fortunately for you, we set-up a platform on a Raspberry Pi that should be nearby. You should be able to connect to this elements like this:

* [Quantum](http://192.168.1.1:8090)
* [Warp10](http://192.168.1.1:8080)

As WarpScript is a stack language, you will learn some basic information about the stack manipulation before starting some data-mining.

### WarpScript Stack

WarpScript is a stack related programming language. This means that to compute an operation you first have to put all the parameters on the stack, then put the operator. Then if a result is produced, it will be pushed on top of the stack.

### Single operator

Let's start with a simple WarpScript function: [NOW](http://www.warp10.io/reference/functions/function_NOW/). This function will put on the stack the current time (in microseconds) since the Unix epoch.

Open Quantum with the URL above and type "NOW" in it. Then click execute. Congratulation, you wrote your first WarpScript! You should see the current time (in microsecond) in the answer session.

### Basic operation in WarpScript

Let's compute an operation in WarpScript, but first, in WarpScript, you will find commentary and variable types. 
The following WarpScript example list all the available basic types.

```
// This is a commentary
'a'      // string value
true     // boolean value
42        // long value
3.14159    // double value
```

To compute an operation (for example an addition), put the two elements before the operator [+](http://www.warp10.io/reference/functions/function_ADD/) on the stack.
You will get the result on top of the stack. 


Let's try it, copy that empty WarpScript in Quantum and implement the simple spec:

```
// Compute 40 + 2


// Compute previous result + 0.42


// Compute 'Hello' + ' world'
```

### Variables

As any other programming language, WarpScript implements the Variables concept. In WarpScript you can save a specific stack element in a variable (java pointer). This is done using the function [STORE](http://www.warp10.io/reference/functions/function_STORE/). 

This function expects two elements on the stack : 
- A stack element to save
- A variable name

Then to push back the element on the stack, write the variable name **precede of a $**.

Let's try it, save the following string in a variable and then push it back several time on the stack!

```

// A WarpScript string
'Hello World!'

// Save this string in Variable

// Play with the Varaible saved
```

### Structure and function

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

Great job! You now have all the basic WarpScript knowlegde to get started with the analyse of the recorded Nasa Time-series! To start, continue with our second step [here](https://github.com/helloexoworld/hands-on/tree/master/step-2).