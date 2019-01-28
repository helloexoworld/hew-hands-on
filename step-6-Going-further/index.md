---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
title: "Step 6: Where no man has gone before..."
category: step-6
before: 'step-5-Process-all-stars/5.3-Reformat-the-output'
---

It was not enough for you, you want more WarpScript? You came at the right place, exoplanet hunter. This page is all about extracting a few WarpScript function that can be an help in your quest of exoplanets (or any other time series analysis)! You will discover functiond to establish a correlation between a series and a set of series, how to use the `STL` or the `DISCORDS` function, how to detect outliers in time series and some useful function to compute statistics on time series.

Those functions are listed here to give you a hint of the richness of WarpScript. At any time, feel free to skip this section to try to hack our code in the [next step]({{ site.baseurl }}/step-7-Strong-enough-to-break-our-code).

## CORRELATE

The [`CORRELATE`]({{ site.doc_url }}/doc/CORRELATE) function can be used to compute the cross-correlation between a base time series and a list thereoff.

Here you have the example used in the documentation. An identical example as in the documtation is put below. You need a base time series, a list of the time series to compute the cross-correlation with and a third parameter corresponding to an offset list to compute the correlation. All time series must be correctly *bucketized* (aligned ticks) and filled (with no empty buckets) before, as the offset corresponds to a multiple of the distance between two points. The value 0 as offset will compute the correlation between all ticks of each series.

<warp10-embeddable-quantum warpscript="
// Create a COSINE time series
NEWGTS 'cos' RENAME

// Generate 360 random values
1 360
<% 'i' STORE $i NaN NaN NaN $i TORADIANS COS ADDVALUE %>
FOR
'cos' STORE $cos

// Bucketize series as it's needed for the corelation operation
[ SWAP bucketizer.last 0 1 0 ] BUCKETIZE 0 GET

// Create a list
[

    // Create a SINE time series
    NEWGTS 'sin' RENAME

    // Generate 360 random values
    1 360
    <% 'i' STORE $i NaN NaN NaN $i  50 + TORADIANS SIN ADDVALUE %>
    FOR
    'sin' STORE $sin

    // Bucketize series as it's needed for the corelation operation
    [ SWAP bucketizer.last 0 1 0 ] BUCKETIZE 0 GET

	// Add a second sine series
	DUP
]

// Create a list with Zero as offset value
[ 0 ]

// Apply CORRELATE
CORRELATE
">
</warp10-embeddable-quantum>

## STL

The second function of this section is the well known [`STL`]({{ site.doc_url }}/doc/STL) (Seasonal and Trend decomposition using Losses). This function expects a list of two time series (or a list of list of two time series) onto the stack. These time series are the seasonal part and the trend part of the input time series. Seasonal and trend are added as suffix. You can look [here](https://www.otexts.org/fpp/6/5) for an introduction on how the STL decomposition works for time series. You will find the Warp10.io example below:

<warp10-embeddable-quantum warpscript="
// generate a periodic time series of mean 0
[ NEWGTS 1 20 <% NaN NaN NaN 4 PICK 10 % 4.5 - ADDVALUE %> FOR

// generate a trend time series (linear raise y=x)
NEWGTS 1 20 <% NaN NaN NaN 4 PICK ADDVALUE %> FOR ]

// sum up
[ SWAP [] reducer.sum ] REDUCE 'sum' RENAME

// bucketize
[ SWAP bucketizer.first 0 1 20 ] BUCKETIZE 0 GET

// call STL
{ 'PERIOD' 10 } STL
">
</warp10-embeddable-quantum>

## DISCORDS

The third section is about the [`DISCORDS`]({{ site.doc_url }}/doc/DISCORDS) functions that is based on [pattern recognition](https://en.wikipedia.org/wiki/Pattern_recognition) to detect discontinuities in a time series of a list thereof. This functions expects some parameters to define how to recognize a pattern. The [`DISCORDS`]({{ site.doc_url }}/doc/DISCORDS) documentation explains more in details all the different parameters and present a working example.

A pattern is defined with first it's window size, then the size of the pattern and finish with it's quantization scale (values ladder dividing the window width). To compute the discord you need to add maximum number of discords to identify, a boolean flag indicating whether or not the `DISCORDS` function should report overlapping discords and a distance ratio (it is safe to leave it to 0.0). You will find the Warp10.io example below.

<warp10-embeddable-quantum warpscript="
// Create a new time series to generate discords
NEWGTS

// Add 7200 datapoints, with 0.1% of anomalies
1 7200
<%
	DUP 2 * PI * 360 / SIN <% RAND 0.01 < %> <% 0.001 + %> IFT NaN DUP DUP 4 ROLL ADDVALUE
%>
FOR

// Apply a bucketize to get regular points (according to time)
[ SWAP bucketizer.last 720 1 0 ] BUCKETIZE

// Keep the initial series on stack result to compare with discords
DUP

// Working window for discords
32 8 16 5 false 0.0 DISCORDS
">
</warp10-embeddable-quantum>

## Outlier detection

In WarpScript, there is mutliple outlier function detection. You can retrieve for example the basic [`THRESHOLDTEST`]({{ site.doc_url }}/doc/THRESHOLDTEST) which just need a threshold value. This function will detect values greater than this threshold. There is also the [`HYBRIDTEST`]({{ site.doc_url }}/doc/HYBRIDTEST) which mix STL and another detection method [`ESDTEST`]({{ site.doc_url }}/doc/ESDTEST). You will find all the other available outlier method detection [here]({{ site.doc_url }}/tags/outlier). You will find below the Warp10.io example of the `ESDTEST`.

<warp10-embeddable-quantum warpscript="
/// Macro used to generate an approximately normal distribution using central limit theorem
<% RAND RAND RAND RAND RAND RAND + + + + + 3.0 - %> 'normal' STORE

// we create a time series with an approximately normal distribution
NEWGTS 1 1000 <% NaN NaN NaN @normal ADDVALUE %> FOR

// we add outliers (> 3.0 in absolute value)
368 NaN NaN NaN -3.1 ADDVALUE
422 NaN NaN NaN 3.0001 ADDVALUE
456 NaN NaN NaN 9.8 ADDVALUE
643 NaN NaN NaN -200.9 ADDVALUE
DEDUP

// we call ESDTEST
4 F ESDTEST
">
</warp10-embeddable-quantum>

## Some statisticals functions

WarpScript also have some basic statistics functions that can be apply on time series:

- [`MUSIGMA`]({{ site.doc_url }}/doc/MUSIGMA) to compute both the mean and the standard deviation of a series
- [`NORMALIZE`]({{ site.doc_url }}/doc/NORMALIZE), [`ISONORMALIZE`]({{ site.doc_url }}/doc/ISONORMALIZE), [`STANDARDIZE`]({{ site.doc_url }}/doc/STANDARDIZE)
- [`SINGLEEXPONENTIALSMOOTHING`]({{ site.doc_url }}/doc/SINGLEEXPONENTIALSMOOTHING) to smooth and compare different series
- To extract more details information on a time series, you will also retrieve some functions as [MODE]({{ site.doc_url }}/doc/MODE) or [`VALUEHISTOGRAM`]({{ site.doc_url }}/doc/VALUEHISTOGRAM)
- Many other statisticals functions are [`CPROB`]({{ site.doc_url }}/doc/CPROB), [`LOWESS`]({{ site.doc_url }}/doc/LOWESS), [`LTTB`]({{ site.doc_url }}/doc/LTTB), [`MONOTONIC`]({{ site.doc_url }}/doc/MONOTONIC), [`NSUMSUMSQ`]({{ site.doc_url }}/doc/NSUMSUMSQ), [`PROB`]({{ site.doc_url }}/doc/PROB), [`RLOWESS`]({{ site.doc_url }}/doc/RLOWESS) and [`TLTTB`]({{ site.doc_url }}/doc/TLTTB), if needed one day.

# Bonus, wanna a quick resume of some of the main WarpScript function?

Once you completed this tutorial, to remember some details of the WarpScript, feel free to use this [Warp10 cheat sheet](https://groupe-sii.github.io/cheat-sheets/warp10/index.html).

# This is the end

Thanks for completed this tutorial! We were happy to introduce you to the analytics of time series worlds and to present a short initiation to our search of exoplanet!
