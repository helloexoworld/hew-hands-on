# Step-1.3: Manipulate a WarpScript List!

## Structure and function

In WarpScript hundreds of functions are available, you can access the documentation [here](http://www.warp10.io/reference/).
In WarpScript, it's possible to build structure as [List or Map](http://www.warp10.io/reference/#functions-lists-maps).
The structure to build a List in WarpScript is as followed. First put a marker to open a list, then the elements to add. 

[//]: # (CODEBEGIN|list.mc2)
```
// Warp10 List operations => http://www.warp10.io/reference/reference/#functions-lists-maps

[ 'Monday' 'Tuesday' 'Wednesday' 'Thursday' 'Friday' ]
[ 'Saturday' 'Sunday' ]
APPEND
LSORT
```
[//]: # (CODEEND|list.mc2)

[//]: # (LINKBEGIN|list.mc2|List manipulation)
[List manipulation](https://quantum.metrics.ovh.net/#/warpscript/Ly8gV2FycDEwIExpc3Qgb3BlcmF0aW9ucyA9PiBodHRwOi8vd3d3LndhcnAxMC5pby9yZWZlcmVuY2UvcmVmZXJlbmNlLyNmdW5jdGlvbnMtbGlzdHMtbWFwcwoKWyAnTW9uZGF5JyAnVHVlc2RheScgJ1dlZG5lc2RheScgJ1RodXJzZGF5JyAnRnJpZGF5JyBdClsgJ1NhdHVyZGF5JyAnU3VuZGF5JyBdCkFQUEVORApMU09SVA==/eyJ1cmwiOiJodHRwczovL3dhcnAucGllcnJlemVtYi5vcmcvYXBpL3YwIiwiZmV0Y2hFbmRwb2ludCI6Ii9mZXRjaCIsImhlYWRlck5hbWUiOiJYLVdhcnAxMCJ9Cg==)

[//]: # (LINKEND|list.mc2)

Let's play with it, here's the squeleton:

[//]: # (CODEBEGIN|exercise.mc2)
```

```
[//]: # (CODEEND|exercise.mc2)

[//]: # (LINKBEGIN|exercise.mc2|Exercise)
[Exercise](https://quantum.metrics.ovh.net/#/warpscript//eyJ1cmwiOiJodHRwczovL3dhcnAucGllcnJlemVtYi5vcmcvYXBpL3YwIiwiZmV0Y2hFbmRwb2ludCI6Ii9mZXRjaCIsImhlYWRlck5hbWUiOiJYLVdhcnAxMCJ9Cg==)

[//]: # (LINKEND|exercise.mc2)


 build a new list containing two elements: 1 and 3. Then add the elements 2 using the operator [+](http://www.warp10.io/reference/functions/function_ADD/) on this list. Now to sort this list, apply the function [LSORT](http://www.warp10.io/reference/functions/function_LSORT/) on it. This will sort the list, which is on top of stack, in a ascending order and let as a result this list on top of the stack. To sort the list in a descending order, apply the [REVERSE](http://www.warp10.io/reference/functions/function_REVERSE/) function on this list.

# Lesson summary

[//]: # (SUMMARYBEGIN|list.mc2|List manipulation)
- [List manipulation](https://quantum.metrics.ovh.net/#/warpscript/Ly8gV2FycDEwIExpc3Qgb3BlcmF0aW9ucyA9PiBodHRwOi8vd3d3LndhcnAxMC5pby9yZWZlcmVuY2UvcmVmZXJlbmNlLyNmdW5jdGlvbnMtbGlzdHMtbWFwcwoKWyAnTW9uZGF5JyAnVHVlc2RheScgJ1dlZG5lc2RheScgJ1RodXJzZGF5JyAnRnJpZGF5JyBdClsgJ1NhdHVyZGF5JyAnU3VuZGF5JyBdCkFQUEVORApMU09SVA==/eyJ1cmwiOiJodHRwczovL3dhcnAucGllcnJlemVtYi5vcmcvYXBpL3YwIiwiZmV0Y2hFbmRwb2ludCI6Ii9mZXRjaCIsImhlYWRlck5hbWUiOiJYLVdhcnAxMCJ9Cg==)

[//]: # (SUMMARYEND|list.mc2)

[//]: # (SUMMARYBEGIN|solutions.mc2|Solutions)
- [Solutions](https://quantum.metrics.ovh.net/#/warpscript/Ly8gQnVpbGQgYSBsaXN0IGNvbnRhaW5pbmcgdmFsdWVzIDEgYW5kIDMgClsgMSAzIF0KCi8vIEFkZCB0aGUgZWxlbWVudCAyCjIgKwoKLy8gU29ydCB0aGUgbGlzdApMU09SVAoKLy8gUmV2ZXJzZSBpdApSRVZFUlNF/eyJ1cmwiOiJodHRwczovL3dhcnAucGllcnJlemVtYi5vcmcvYXBpL3YwIiwiZmV0Y2hFbmRwb2ludCI6Ii9mZXRjaCIsImhlYWRlck5hbWUiOiJYLVdhcnAxMCJ9Cg==)

[//]: # (SUMMARYEND|solutions.mc2)

# To be continued

Great job! You now have all the basic WarpScript knowlegde to get started with the analyse of the recorded Nasa Time-series! To start, continue with our second step [here](/step-2-Keplers-Data/2.1-Exploring-known-time-series/README.md).
