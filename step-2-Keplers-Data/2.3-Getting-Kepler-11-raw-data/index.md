---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
title: 'Step 2.3: Load time series raw data'
category: step-2
before: 'step-2-Keplers-Data/2.2-Exploring-known-time-series'
next: 'step-2-Keplers-Data/2.4-Split-Kepler-11-data'
solution: 'step-2-Keplers-Data/2.3-Getting-Kepler-11-raw-data/solutions'
---

Now that you are used to play with the stack and know the available series, let's manipulate some data!

## FETCH

Now that we have identified the right star, let's get some data using [`FETCH`]({{ site.doc_url }}/doc/FETCH)! It is a function similar to find, with more arguments that gives the boundaries of a window to get raw datapoints. The UTC start date is `2009-05-02T00:56:10.000000Z` and the end date is `2013-05-11T12:02:06.000000Z`. Remember that the regular expression `~.*` allow you to request all the series available in the platform. Limit it to only the `sap.flux` ones. In order to keep a restreint amount of data, update the labels sector to load only the data from Kepler-11, i.e. data with the label `KEPLERID=6541920`:

<warp10-embeddable-quantum warpscript="
// Storing the token into a variable
@HELLOEXOWORLD/GETREADTOKEN 'token' STORE

// Let's do a FETCH now
[
    // Here you must put the parameters used by FETCH:  
    // - Token for application authentication
    // - Classname selector
    // - Labels selector
    {
        // Here you put the label selector for Kepler-11
    }
    // - Start date
    // - End date
]
FETCH
">
</warp10-embeddable-quantum>

You will see a list containing a single time series, **click on it to view it**. As an exercise, you can re-use the find and create a regular expresssion to load a small amount of the stars data. Loading the complete set of data **will** probably crash your navigator.

# To be continued

The full subset of data of Kepler-11 is now on top of a WarpScript stack. It includes around 65000 points. In the next steps, we will start to write a WarpScript data-flow to detect Kepler-11 exoplanet.
