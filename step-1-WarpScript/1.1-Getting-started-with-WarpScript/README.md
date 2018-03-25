# Step-1.1: Getting started with WarpScript!

## What is WarpScript?

WarpScript is a programming language specific to Geo Time Series® analysis. For security reason, WarpScript is an interpreted language, which means that a Warp 10 backend have to be reached to execute your script. Fortunately for you, we set-up a platform on a Raspberry Pi that should be nearby. You should be able to connect to this elements like this:

* [Quantum](http://192.168.1.1:8090)
* [Warp10](http://192.168.1.1:8080)

As WarpScript is a stack language, you will learn some basic information about the stack manipulation before starting some data-mining.

## WarpScript Stack

WarpScript is a stack related programming language. This means that to compute an operation you first have to put all the parameters on the stack, then put the operator. Then if a result is produced, it will be pushed on top of the stack.

## Single operator

Let's start with a simple WarpScript function: [NOW](http://www.warp10.io/reference/functions/function_NOW/). This function will put on the stack the current time (in microseconds) since the Unix epoch.

Open Quantum with the URL above and type "NOW" in it. Then click execute. Congratulation, you wrote your first WarpScript! You should see the current time (in microsecond) in the answer session.

## Basic operation in WarpScript

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


// Compute 'Hello' + ' world!'
```

# To be continued

WarpScript allow the user to save specific data inside Variable, let's discover how to process in the [next step](/step-1-WarpScript/1.2-Introducing-the-Variables/README.md).