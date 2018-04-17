---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
title: 'Step 1.2: Introducing WarpScript Variables'
category: step-1
before: 'step-1-WarpScript/1.1-Getting-started-with-WarpScript'
next: 'step-1-WarpScript/1.3-Manipulate-a-data-list'
solution: 'step-1-WarpScript/1.2-Introducing-the-Variables/solutions'
---

## Variables

As any other programming language, WarpScript allow the developer to store it's own variables. In WarpScript you can save a specific stack element in a variable (java pointer). This is done using the function [STORE]({{ site.doc_url }}/reference/functions/function_STORE/). 

This function expects two elements on the stack : 
- A stack element to save
- A variable name

Then to push back the element on the stack, write the variable name **precede of a $**.

Let's try it, save the following string in a variable and then push it back several time on the stack!


<warp10-embeddable-quantum warpscript="
// A WarpScript string
'Hello World!'

// Save this string in variable


// Play with the saved variable
">
</warp10-embeddable-quantum>


## Get a read token

Security in Warp10 instance are handled with crypto tokens. They can be pretty long, so to ease your workflow, we stored it in the platform! You can push the token into the stack using this:

<warp10-embeddable-quantum warpscript="
@HELLOEXOWORLD/GETREADTOKEN
">
</warp10-embeddable-quantum>

This token can then be stored in a variable for example.

## To be continued

Great job! Let's continue with some WarpScript list manipulation in the next step!
