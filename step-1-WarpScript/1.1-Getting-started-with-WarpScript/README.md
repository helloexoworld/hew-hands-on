# Step-1.1: Getting started with WarpScript!

## What is WarpScript?

WarpScript is a programming language specific to Geo Time Series® analysis. For security reason, WarpScript is an interpreted language, which means that a Warp 10 backend have to be reached to execute your script. Fortunately for you, we set-up a platform on a Raspberry Pi that should be nearby. You should be able to connect to this elements like this:

* [Quantum](https://quantum.metrics.ovh.net/)
* [Warp10 official documentation](http://www.warp10.io/reference/)

> Please note that you'll have better performance using chromium. Firefox support is on his way.

As WarpScript is a stack language, you will learn some basic information about the stack manipulation before starting some data-mining.

## WarpScript Stack

WarpScript is a stack related programming language. This means that to compute an operation you first have to put all the parameters on the stack, then put the operator. Then if a result is produced, it will be pushed on top of the stack.

## Single operator

Let's start with a simple WarpScript function: [NOW](http://www.warp10.io/reference/functions/function_NOW/). This function will put on the stack the current time (in microseconds) since the Unix epoch.

Open [Quantum](https://quantum.metrics.ovh.net/). You need to configure it to hit one of our Warp10 instance. Click on "Choose another backend", then the pencil and add:

* https://warp.pierrezemb.org/api/v0 if you are doing the online version
* http://127.0.0.1:8080/api/v0 if you are using the docker version 
* http://warp-1:8080 if you are in a conference

Then OK. Congrats, you can now type your first WarpScript! Type "NOW" in it. Then click execute. Congratulation, you wrote your first WarpScript! You should see the current time (in microsecond) in the answer session.

## Basic operation in WarpScript

Let's compute an operation in WarpScript, but first, in WarpScript, you will find commentary and variable types.
The following WarpScript example list all the available basic types.

[//]: # (CODEBEGIN|sample.mc2)
```
// This is a commentary
'This a string value: bellow result'        // string value (push in LIFO stack)
true                                        // boolean value (push in LIFO stack)
50                                          // long value (push in LIFO stack)
40                                          // long value (push in LIFO stack)
3.14159                                     // double value (push in LIFO stack)
6.85841                                     // Another double value (push in LIFO stack)
+                                           // Compute last stack Value (3.14159 + 6.85841) = 10
+                                           // Compute last stack Value 10 + 42
==                                          // Check same result 50 == 50 = true
```
[//]: # (CODEEND|sample.mc2)

[//]: # (LINKBEGIN|sample.mc2|Sample)
[Sample](https://quantum.metrics.ovh.net/#/warpscript/Ly8gVGhpcyBpcyBhIGNvbW1lbnRhcnkKJ1RoaXMgYSBzdHJpbmcgdmFsdWU6IGJlbGxvdyByZXN1bHQnICAgICAgICAvLyBzdHJpbmcgdmFsdWUgKHB1c2ggaW4gTElGTyBzdGFjaykKdHJ1ZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvLyBib29sZWFuIHZhbHVlIChwdXNoIGluIExJRk8gc3RhY2spCjUwICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLy8gbG9uZyB2YWx1ZSAocHVzaCBpbiBMSUZPIHN0YWNrKQo0MCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8vIGxvbmcgdmFsdWUgKHB1c2ggaW4gTElGTyBzdGFjaykKMy4xNDE1OSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvLyBkb3VibGUgdmFsdWUgKHB1c2ggaW4gTElGTyBzdGFjaykKNi44NTg0MSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvLyBBbm90aGVyIGRvdWJsZSB2YWx1ZSAocHVzaCBpbiBMSUZPIHN0YWNrKQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8vIENvbXB1dGUgbGFzdCBzdGFjayBWYWx1ZSAoMy4xNDE1OSArIDYuODU4NDEpID0gMTAKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvLyBDb21wdXRlIGxhc3Qgc3RhY2sgVmFsdWUgMTAgKyA0Mgo9PSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8vIENoZWNrIHNhbWUgcmVzdWx0IDUwID09IDUwID0gdHJ1ZQ==/eyJ1cmwiOiJodHRwczovL3dhcnAucGllcnJlemVtYi5vcmcvYXBpL3YwIiwiZmV0Y2hFbmRwb2ludCI6Ii9mZXRjaCIsImhlYWRlck5hbWUiOiJYLVdhcnAxMCJ9Cg==)

[//]: # (LINKEND|sample.mc2)


To compute an operation (for example an addition), put the two elements before the operator [+](http://www.warp10.io/reference/functions/function_ADD/) on the stack.
You will get the result on top of the stack.


Let's try it, copy that empty WarpScript in Quantum and implement the simple spec:

[//]: # (CODEBEGIN|exercise.mc2)
```
// Compute 40 + 2


// Compute previous result + 0.42


// Compute 'Hello' + ' world!'
```
[//]: # (CODEEND|exercise.mc2)

[//]: # (LINKBEGIN|exercise.mc2|Exercise)
[Exercise](https://quantum.metrics.ovh.net/#/warpscript/Ly8gQ29tcHV0ZSA0MCArIDIKCgovLyBDb21wdXRlIHByZXZpb3VzIHJlc3VsdCArIDAuNDIKCgovLyBDb21wdXRlICdIZWxsbycgKyAnIHdvcmxkISc=/eyJ1cmwiOiJodHRwczovL3dhcnAucGllcnJlemVtYi5vcmcvYXBpL3YwIiwiZmV0Y2hFbmRwb2ludCI6Ii9mZXRjaCIsImhlYWRlck5hbWUiOiJYLVdhcnAxMCJ9Cg==)

[//]: # (LINKEND|exercise.mc2)


# Lesson summary

[//]: # (SUMMARYBEGIN|sample.mc2|First basic operations)
- [First basic operations](https://quantum.metrics.ovh.net/#/warpscript/Ly8gVGhpcyBpcyBhIGNvbW1lbnRhcnkKJ1RoaXMgYSBzdHJpbmcgdmFsdWU6IGJlbGxvdyByZXN1bHQnICAgICAgICAvLyBzdHJpbmcgdmFsdWUgKHB1c2ggaW4gTElGTyBzdGFjaykKdHJ1ZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvLyBib29sZWFuIHZhbHVlIChwdXNoIGluIExJRk8gc3RhY2spCjUwICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLy8gbG9uZyB2YWx1ZSAocHVzaCBpbiBMSUZPIHN0YWNrKQo0MCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8vIGxvbmcgdmFsdWUgKHB1c2ggaW4gTElGTyBzdGFjaykKMy4xNDE1OSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvLyBkb3VibGUgdmFsdWUgKHB1c2ggaW4gTElGTyBzdGFjaykKNi44NTg0MSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvLyBBbm90aGVyIGRvdWJsZSB2YWx1ZSAocHVzaCBpbiBMSUZPIHN0YWNrKQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8vIENvbXB1dGUgbGFzdCBzdGFjayBWYWx1ZSAoMy4xNDE1OSArIDYuODU4NDEpID0gMTAKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvLyBDb21wdXRlIGxhc3Qgc3RhY2sgVmFsdWUgMTAgKyA0Mgo9PSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8vIENoZWNrIHNhbWUgcmVzdWx0IDUwID09IDUwID0gdHJ1ZQ==/eyJ1cmwiOiJodHRwczovL3dhcnAucGllcnJlemVtYi5vcmcvYXBpL3YwIiwiZmV0Y2hFbmRwb2ludCI6Ii9mZXRjaCIsImhlYWRlck5hbWUiOiJYLVdhcnAxMCJ9Cg==)

[//]: # (SUMMARYEND|sample.mc2)

[//]: # (SUMMARYBEGIN|solutions.mc2|Solutions)
- [Solutions](https://quantum.metrics.ovh.net/#/warpscript/Ly8gQ29tcHV0ZSA0MCArIDIKNDAgMiArCgovLyBDb21wdXRlIHByZXZpb3VzIHJlc3VsdCArIDAuNDIKMC40MiArIAoKLy8gQ29tcHV0ZSAnSGVsbG8nICsgJyB3b3JsZCEnCidIZWxsbycgJyB3b3JsZCEnICs=/eyJ1cmwiOiJodHRwczovL3dhcnAucGllcnJlemVtYi5vcmcvYXBpL3YwIiwiZmV0Y2hFbmRwb2ludCI6Ii9mZXRjaCIsImhlYWRlck5hbWUiOiJYLVdhcnAxMCJ9Cg==)

[//]: # (SUMMARYEND|solutions.mc2)


# To be continued

WarpScript allow the user to save specific data inside Variable, let's discover how to process in the [next step](/step-1-WarpScript/1.2-Introducing-the-Variables/README.md).
