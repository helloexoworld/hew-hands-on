---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
title: 'Step 1.2: Introducing WarpScript Variables'
category: step-1
before: 'step-1-WarpScript/1.1-Getting-started-with-WarpScript'
next: 'step-1-WarpScript/1.3-Manipulate-a-data-list'
back: 'step-1-WarpScript/1.2-Introducing-the-Variables'
---

## Solutions

<warp10-embeddable-quantum warpscript="
// A WarpScript string
'Hello World!'

// Save this string in variable
'myVariable' STORE

// Play with the saved variable
$myVariable
$myVariable

// Get the read token
@HELLOEXOWORLD/GETREADTOKEN

// And store it if you want
'token' STORE
">
</warp10-embeddable-quantum>