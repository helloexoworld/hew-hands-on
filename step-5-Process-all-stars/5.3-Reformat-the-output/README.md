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

Did you understood all the instructions? 

You can write the same block of code to refactor the name of the sampled series.

# To be continued

Wow, you did an awesome job exoplanet hunter! You manage to discover some of the existing exoplanet and format nicely your output! Now it's time to relax a bit before continuing your quest. It's time for you to have your own practice, to learn a little bit more about the existing WarpScript function, continue with the [next step](/step-6-Going-further/README.md). Otherwise, if you prefer to start hacking our code right now, jump directly at our [last step](/step-7-Strong-enough-to-break-our-code/README.md)! 