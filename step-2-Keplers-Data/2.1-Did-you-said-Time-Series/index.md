---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
title: 'Step 2.1: Did you said Time series?'
category: step-2
---

You are not alone in your quest, exoplanet hunter! As your personal assistants, we will teach you some basics knowledge to help you achieve this awesome quest!

First, just to help you, and to lead you, let start at the beginning and introduce the NASA data modelised as Time series.

## Star's data

During this tutorial, you will study the NASA Kepler data-set. You will in charge to discover some exoplanet by analyzing photometry from differents stars collected by Kepler.

You will be working on the photometric series called *SAP_FLUX (Simple Aperture Photometry fluxes)*. It represents the flux in electrons per second contained in the optimal
aperture pixels collected by the spacecraft. This is the raw data acquired by Kepler. Here's an example:

![Alt Text]({{ site.baseurl }}/img/step-0/kepler-11.png)

As the lightcurve of a star evolve according to time, it can be considered as a time series.

## What are time series?


A time series is a **sequence** of evolving values over time. These values, named **datapoints** or **measurements**, are added as they come, with a stable frequency or not.


![introduction]({{ site.baseurl }}/img/step-2/intro_1.png)

To ease readability, let's visualise it with colors instead of degrees values. We can then use the Celcius degree as an Y-axis to graph the temperature evolution along the day.


![introduction]({{ site.baseurl }}/img/step-2/intro_2.png)

Like in this small example, a graph with a value in an axis, and a time in the second one is just a time series visualisation.


## Where can we find time series?

**Time series are everywhere**, here are just few examples:

- The evolution of the stock exchange
- The number of calls on a webserver
- The fuel consumption of a car
- The load of a CPU
- The time customers are taking to register on your website
- The time they spent on your website
- The heart rate of a person measured through a smartwatch


## Time series data model

We call the magnitude measured in the time series **classname**.  In the previous examples,
the classnames could be *dollars*, *calls*, *gallons*, *percentage*, *time spent* or *heart rate*


In the draw above, we have considered a simple series measuring temperature. There are situations where the measured magnitude (temperature in pur example) will not be enough to qualify your series. In a home you could measure temperature at different places like :

- outside
- room 1
- garage
- 1st floor room
- kitchen
- etc.

This why we need **labels** (or tags, dimensions,...) to enhance the data modeling. And now our data model looks like :


![labels]({{ site.baseurl }}/img/step-2/intro_labels.png)

Labels are key/value pairs used to qualify series. They are **immutable**, which means if you change something in the labels set, it won't affect the previous series but it will create a new one. This also means that your Time Series data model need to be designed carefully.

Given the many aspects they can have, the storage, retrieval and analysis of time series cannot be done through standard relational databases, like SQL. Instead it needs a custom built system, not only a Time Series Database, but a whole solution that will enable usability of the data.

We can find here and there many Time Series Databases that claim to solve the same storage system but most of them fail in their mission to provide you the right tools and protocol to let you enjoy your data.


## Time Series Values

Once you have define the good Time Series model for your own need (in the case of monitoring, most of the time your collecting software will choose it for you), you will push data points or measurements.

These data points can be of **multiple types** (*Long*, *Double*, *String*, *Boolean*)  given the protocol you use. You can refer to the matrix compatibility to know which one fits you best.


## Time Series Analysis

While a common use case for Time Series is to plot them as a graph, using line charts or sparklines, many customers will need to perform custom analysis on their Time Series for domains like :

- Statistics, TopN
- Signal Processing
- Pattern Detection
- Anomaly Detection
- Approximation (like regressions)
- Classification
- Prediction and Forecasting
- etc.

There have been a lot of research effort around time series analytics, as they are a powerful tool to modelize complex and critical processus. Today we have many algorythms specifics to the time series, as *AutoRegressive Moving Average* (ARMA),  *AutoRegressive Integrated Moving Average* (ARIMA) or *Dynamic Time Warping*. 

And, of course, you can combine thise specific techniques with generic statistical or signal processing analytics.  

## Time series applications

![Time series spplications](../../img/step-2/time-series-applications.jpg)

There are two main kinds of time series applications:

- Understanding the data: analysing the time series in order to explain why and how the data behavior
- Fit a model: creating a model fitting the data, and using that model to do things like monitoring (detecting if the data received fits to the expected) or forecasting (predicting the future data behavior). 


## But why would we use Warp 10?

Warp 10 is one of the multiple currently available time series databases. It also includes the WarpScript language (saw in the previous step), a language dedicated to time series manipulation.

## And What does a time series looks like in WarpScript?

If you type the following WarpScript code:

<warp10-embeddable-quantum warpscript="
// Create an empty GTS
NEWGTS
">
</warp10-embeddable-quantum>

You will push on top of the stack a Time series. A Time series follow this modelisation:

  - It requires a fix classname (the key "c") in quantum result, which is the main identifier of a Time series (string).
  - The labels "l" also identifies the existing series. This corresponds to a map object of string key/values.
  - The attributes "a", same as Labels but they are global parameters of a series and can evolve without creating a new series.
  - And finally the values "v" which includes a timestamp (time of the current point), a location and a value (can be Double, Long, Boolean or string)

To update any of those parameters, you can use one of the following functions that updates the initial Time series to define an example one: the number of time a spefic planet rotates!


<warp10-embeddable-quantum warpscript="
// Create an empty Time series
NEWGTS

// Rename this Time series
'planet.rotation.count' RENAME

// Relabel this Time series
{ 'name' 'earth' } RELABEL

// Gives an Attribute to this Time series
{ 'main-nickname' 'blue-planet' } SETATTRIBUTES  // This attribute could evolve in the future without re-creating a series once they are stored in Warp 10.

//
// Add today's value to this Time series
//

// Push Today's time
NOW 

// Push location
NaN NaN NaN 

// Push 121 as value 
121

// Add today's value in current Time series
ADDVALUE

//
// Now we will also add yesterday value to the earth rotation Time series
//

// Compute Yesterday time (Today minus one day)
NOW 1 d - 

// Push location
NaN NaN NaN 

// Push the value 120
120

// Add the value to current Time series
ADDVALUE
">
</warp10-embeddable-quantum>


This will leave the initial GTS created on top of the stack, updated with each different values.

## To be continued

Luckily for you all the needed Time series for you exoplanet are already available in our back-end! You can start to explore them in our [next step]({{ site.baseurl }}/step-2-Keplers-Data/2.2-Exploring-known-time-series/).

## [previous step]({{ site.baseurl }}/step-1-WarpScript/1.3-Manipulate-a-data-list/) ... [solutions]({{ site.baseurl }}/step-2-Keplers-Data/2.1-Did-you-said-Time-Series/solutions) ... [next step]({{ site.baseurl }}/step-2-Keplers-Data/2.2-Exploring-known-time-series/)