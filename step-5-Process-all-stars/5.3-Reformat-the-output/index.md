---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
category: step-5
---
# Step-5.3: Time to focus on the format output!

## Rename a time series

The following block can be add at the end of the script to reformat all names of Time series list.

```
//
// Reformat annotations series
//

<%
    // Delete index
    DROP

    // Duplicate series on top of the stack
    DUP

    // Get series name
    NAME

    // Add annotations suffix
    '-annotations' +

    // RENAME the series on top of the stack
    RENAME
%>
LMAP
```

Did you understood all the instructions? Otherwise have a look at the [warp10.io documentation page](http://www.warp10.io/reference/)!

You can write the same block of code to refactor the name of the sampled series.

## Simplify the user navigation

To generate an element on the stack containing both the original record and the annotation series just add the following lines of code at the end of your script

```
//
// Split the end record in several stack elements. One elements for each record of each stars containing a list of the record series with its corresponding annotations series 
//

// Merge both series on top of the stack
APPEND
[ 'KEPLERID' 'record' ]

// Generaten equivalence map containing base on KEPLERID and record labels
PARTITION

// Delete each map keys to keep only the list values 
<%
    SWAP DROP
%>
FOREACH

```

# To be continued

Wow, you did an awesome job exoplanet hunter! You manage to discover some of the existing exoplanet and format nicely your output! Now it's time to relax a bit before continuing your quest. It's time to let you have your own practice, to learn a little bit more about the existing WarpScript function, continue with the [next step](/step-6-Going-further/) or continue to develop your script using all the skills your already learned.