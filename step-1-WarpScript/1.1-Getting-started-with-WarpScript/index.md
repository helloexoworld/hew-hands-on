---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
title: 'Step 1.1: Getting started with WarpScript'
category: step-1
before: 'step-0-Exoplanets-and-where-to-find-them'
next: 'step-1-WarpScript/1.2-Introducing-the-Variables'
solution: 'step-1-WarpScript/1.1-Getting-started-with-WarpScript/solutions'
---

## What is WarpScript?

WarpScript is a programming language specific to Geo time series® analysis. For security reason, WarpScript is an interpreted language, which means that a Warp 10 backend have to be reached to execute your script. Fortunately for you, we set-up everything you need in this tutorial.

> If you are at a conference and you want want to use Quantum directly, here's a direct [link](http://localhost:8083/#/warpscript//eyJ1cmwiOiJodHRwOi8vMTkyLjE2OC4xLjQ6ODA4MC9hcGkvdjAiLCJmZXRjaEVuZHBvaW50IjoiL2ZldGNoIiwiaGVhZGVyTmFtZSI6IlgtV2FycDEwIn0%3D). Be aware that you will need to copy/paste the scripts.

## WarpScript Stack

WarpScript is a stack related programming language. This means that to compute an operation, you first have to:

* put all the parameters on the stack
* then put the operator

If a result is produced, it will be pushed on top of the stack.

## Single operator

Let's start with a simple WarpScript function: [`NOW`]({{ site.doc_url }}/reference/functions/function_NOW/). This function will put on the stack the current time (in microseconds) since the Unix epoch. Let's play with it, as quantum was set to reach an available backend, just type `NOW` in the quantum editor, then click on execute.

<warp10-embeddable-quantum warpscript="">
</warp10-embeddable-quantum>

Congratulation, you wrote and exectute your first WarpScript! You should see the current time (in microsecond) in the answer session below.

> Warp10 is by default configured to use the micro-second as a time-unit.

## Basic operation in WarpScript

Let's compute an operation in WarpScript, but first, in WarpScript, you will find commentary and variable types.
The following WarpScript example list all the available basic types.

<warp10-embeddable-quantum warpscript="
// This is a commentary
'a'      // string value
true     // boolean value
42        // long value
3.14159    // double value
">
</warp10-embeddable-quantum>

To compute an operation (for example an addition), put the two elements before the operator [`+`]({{ site.doc_url }}/reference/functions/function_ADD/) on the stack.
You will get the result on top of the stack.

Let's try it, by implementing the follwing spec:

<warp10-embeddable-quantum warpscript="
// Compute 40 + 2


// Compute previous result + 0.42


// Compute 'Hello' + ' world!'
">
</warp10-embeddable-quantum>

> Pro tips: You can always use `STOP`. This function is useful when debugging WarpScript code as it allows you to interrupt your code at specific points of the execution.

## To be continued

WarpScript allow the user to save specific data inside variable, the follwing page will detail how to use them!