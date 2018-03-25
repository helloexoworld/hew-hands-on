# Time to focus on the format output!

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

Did you understood all the instructions? 

You can write the same block of code to refactor the name of the sampled series.

# To be continued

Wow, you did an awesome job exo-planet hunter! You manage to discover some of the existing exo-planet and format nicely your output! Now it's time to relax a bit before continuing your quest.