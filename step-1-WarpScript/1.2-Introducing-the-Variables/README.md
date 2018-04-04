# Step-1.2: Introducing WarpScript Variables!

## Variables

As any other programming language, WarpScript implements the Variables concept. In WarpScript you can save a specific stack element in a variable (java pointer). This is done using the function [STORE](http://www.warp10.io/reference/functions/function_STORE/). 

This function expects two elements on the stack : 
- A stack element to save
- A variable name

Then to push back the element on the stack, write the variable name **precede of a $**.

[//]: # (CODEBEGIN|store.mc2)
```
// counter exemple
10 20 40 80 + + +
'totalcounter' STORE
"The totalcounter: " 
$totalcounter
TOSTRING
+
```
[//]: # (CODEEND|store.mc2)

[//]: # (LINKBEGIN|store.mc2|Test store)
[Test store](https://quantum.metrics.ovh.net/#/warpscript/Ly8gY291bnRlciBleGVtcGxlCjEwIDIwIDQwIDgwICsgKyArCid0b3RhbGNvdW50ZXInIFNUT1JFCiJUaGUgdG90YWxjb3VudGVyOiAiIAokdG90YWxjb3VudGVyClRPU1RSSU5HCis=/eyJ1cmwiOiJodHRwczovL3dhcnAucGllcnJlemVtYi5vcmcvYXBpL3YwIiwiZmV0Y2hFbmRwb2ludCI6Ii9mZXRjaCIsImhlYWRlck5hbWUiOiJYLVdhcnAxMCJ9Cg==)

[//]: # (LINKEND|store.mc2)

Let's try it, save the following string in a variable and then push it back several time on the stack!

[//]: # (CODEBEGIN|exercise.mc2)
```
// A WarpScript string
'Hello World!'

// Save this string in variable


// Play with the saved variable
```
[//]: # (CODEEND|exercise.mc2)

[//]: # (LINKBEGIN|exercise.mc2|Exercise)
[Exercise](https://quantum.metrics.ovh.net/#/warpscript/Ly8gQSBXYXJwU2NyaXB0IHN0cmluZwonSGVsbG8gV29ybGQhJwoKLy8gU2F2ZSB0aGlzIHN0cmluZyBpbiB2YXJpYWJsZQoKCi8vIFBsYXkgd2l0aCB0aGUgc2F2ZWQgdmFyaWFibGU=/eyJ1cmwiOiJodHRwczovL3dhcnAucGllcnJlemVtYi5vcmcvYXBpL3YwIiwiZmV0Y2hFbmRwb2ludCI6Ii9mZXRjaCIsImhlYWRlck5hbWUiOiJYLVdhcnAxMCJ9Cg==)

[//]: # (LINKEND|exercise.mc2)

## Get a read token

Security in Warp10 instance are handled with crypto tokens. They can be pretty long, so to ease your workflow, we stored it in the platform! You can push the token into the stack using this:

[//]: # (CODEBEGIN|token.mc2)
```
@HELLOEXOWORLD/GETREADTOKEN
```
[//]: # (CODEEND|token.mc2)

[//]: # (LINKBEGIN|token.mc2|Token)
[Token](https://quantum.metrics.ovh.net/#/warpscript/QEhFTExPRVhPV09STEQvR0VUUkVBRFRPS0VO/eyJ1cmwiOiJodHRwczovL3dhcnAucGllcnJlemVtYi5vcmcvYXBpL3YwIiwiZmV0Y2hFbmRwb2ludCI6Ii9mZXRjaCIsImhlYWRlck5hbWUiOiJYLVdhcnAxMCJ9Cg==)

[//]: # (LINKEND|token.mc2)


You can store it in a variable if you want.

# Lesson summary

[//]: # (SUMMARYBEGIN|store.mc2|Store value)
- [Store value](https://quantum.metrics.ovh.net/#/warpscript/Ly8gY291bnRlciBleGVtcGxlCjEwIDIwIDQwIDgwICsgKyArCid0b3RhbGNvdW50ZXInIFNUT1JFCiJUaGUgdG90YWxjb3VudGVyOiAiIAokdG90YWxjb3VudGVyClRPU1RSSU5HCis=/eyJ1cmwiOiJodHRwczovL3dhcnAucGllcnJlemVtYi5vcmcvYXBpL3YwIiwiZmV0Y2hFbmRwb2ludCI6Ii9mZXRjaCIsImhlYWRlck5hbWUiOiJYLVdhcnAxMCJ9Cg==)

[//]: # (SUMMARYEND|store.mc2)

[//]: # (SUMMARYBEGIN|token.mc2|Get token)
- [Get token](https://quantum.metrics.ovh.net/#/warpscript/QEhFTExPRVhPV09STEQvR0VUUkVBRFRPS0VO/eyJ1cmwiOiJodHRwczovL3dhcnAucGllcnJlemVtYi5vcmcvYXBpL3YwIiwiZmV0Y2hFbmRwb2ludCI6Ii9mZXRjaCIsImhlYWRlck5hbWUiOiJYLVdhcnAxMCJ9Cg==)

[//]: # (SUMMARYEND|token.mc2)

[//]: # (SUMMARYBEGIN|solutions.mc2|Solutions)
- [Solutions](https://quantum.metrics.ovh.net/#/warpscript/Ly8gQSBXYXJwU2NyaXB0IHN0cmluZwonSGVsbG8gV29ybGQhJwoKLy8gU2F2ZSB0aGlzIHN0cmluZyBpbiB2YXJpYWJsZQonbXlWYXJpYWJsZScgU1RPUkUKCi8vIFBsYXkgd2l0aCB0aGUgc2F2ZWQgdmFyaWFibGUKJG15VmFyaWFibGUKJG15VmFyaWFibGUKCi8vIEdldCB0aGUgcmVhZCB0b2tlbgpASEVMTE9FWE9XT1JMRC9HRVRSRUFEVE9LRU4KCi8vIEFuZCBzdG9yZSBpdCBpZiB5b3Ugd2FudAondG9rZW4nIFNUT1JF/eyJ1cmwiOiJodHRwczovL3dhcnAucGllcnJlemVtYi5vcmcvYXBpL3YwIiwiZmV0Y2hFbmRwb2ludCI6Ii9mZXRjaCIsImhlYWRlck5hbWUiOiJYLVdhcnAxMCJ9Cg==)

[//]: # (SUMMARYEND|solutions.mc2)


# To be continued

Great job! Let's continue with some WarpScript list manipulation in the [next step](/step-1-WarpScript/1.3-Manipulate-a-data-list/README.md).
