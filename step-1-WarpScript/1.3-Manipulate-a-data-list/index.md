---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
title: 'Step 1.3: Manipulate a WarpScript List'
category: step-1
---


## Structure and function

In WarpScript hundreds of functions are available, you can access the documentation [here]({{ site.doc_url }}/reference/).
In WarpScript, it's possible to build structure as [List or Map]({{ site.doc_url }}/reference/#functions-lists-maps).
The structure to build a List in WarpScript is as followed. First put a marker to open a list, then the elements to add. 

<warp10-embeddable-quantum warpscript="
[ 'elem' 'elem2' ]
">
</warp10-embeddable-quantum>

Let's play with it, here's the squeleton:

<warp10-embeddable-quantum warpscript="
// Build a list containing values 1 and 3 


// Add the element 2


// Sort the list


// Reverse it
">
</warp10-embeddable-quantum>



 build a new list containing two elements: 1 and 3. Then add the elements 2 using the operator [+]({{ site.doc_url }}/reference/functions/function_ADD/) on this list. Now to sort this list, apply the function [LSORT]({{ site.doc_url }}/reference/functions/function_LSORT/) on it. This will sort the list, which is on top of stack, in a ascending order and let as a result this list on top of the stack. To sort the list in a descending order, apply the [REVERSE]({{ site.doc_url }}/reference/functions/function_REVERSE/) function on this list.

## To be continued

Great job! You now have all the basic WarpScript knowlegde to get started with the analyse of the recorded Nasa Time-series! To start, continue with our second step [here](/step-2-Keplers-Data/2.1-Did-you-said-Time-Series/).

## [previous step]({{ site.baseurl }}/step-1-WarpScript/1.2-Introducing-the-Variables/) ... [solutions]() ... [next step]({{ site.baseurl }}/step-2-Keplers-Data/2.1-Did-you-said-Time-Series/)