---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
title: 'Step 1.1: Getting started with WarpScript'
category: step-1
---



## What is WarpScript?

WarpScript is a programming language specific to Geo Time Series® analysis. For security reason, WarpScript is an interpreted language, which means that a Warp 10 backend have to be reached to execute your script. Fortunately for you, we set-up a platform on a Raspberry Pi that should be nearby. You should be able to connect to this elements like this:

* [Quantum](https://quantum.metrics.ovh.net/)
* [Warp10 official documentation]({{ site.doc_url }}/reference/)

> Please note that you'll have better performance using chromium. Firefox support is on his way.

As WarpScript is a stack language, you will learn some basic information about the stack manipulation before starting some data-mining.

## WarpScript Stack

WarpScript is a stack related programming language. This means that to compute an operation you first have to put all the parameters on the stack, then put the operator. Then if a result is produced, it will be pushed on top of the stack.

## Single operator

Let's start with a simple WarpScript function: [NOW]({{ site.doc_url }}/reference/functions/function_NOW/). This function will put on the stack the current time (in microseconds) since the Unix epoch.

Open [Quantum](https://quantum.metrics.ovh.net/). You need to configure it to hit one of our Warp10 instance. Click on "Choose another backend", then the pencil and add:

* https://warp.pierrezemb.org/api/v0 if you are doing the online version
* http://127.0.0.1:8080/api/v0 if you are using the docker version 
* http://warp-1:8080 if you are in a conference

Then OK. Congrats, you can now type your first WarpScript! Type "NOW" in it. Then click execute. Congratulation, you wrote your first WarpScript! You should see the current time (in microsecond) in the answer session.

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


To compute an operation (for example an addition), put the two elements before the operator [+]({{ site.doc_url }}/reference/functions/function_ADD/) on the stack.
You will get the result on top of the stack.


Let's try it, copy that empty WarpScript in Quantum and implement the simple spec:

<warp10-embeddable-quantum warpscript="
// Compute 40 + 2


// Compute previous result + 0.42


// Compute 'Hello' + ' world!'
">
</warp10-embeddable-quantum>

## To be continued

WarpScript allow the user to save specific data inside Variable, let's discover them now!

## [previous step]({{ site.baseurl }}/step-0-Exoplanets-and-where-to-find-them) ... [solutions]() ... [next step]({{ site.baseurl }}/step-1-WarpScript/1.2-Introducing-the-Variables/)