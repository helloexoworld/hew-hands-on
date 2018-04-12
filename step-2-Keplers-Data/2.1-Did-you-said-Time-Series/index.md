---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
title: 'Step 2.1: Did you said Time series?'
category: step-2
---

You are now alone in your quest, exoplanet hunter! As your personal assistant, we will teach you some basics knowledge to help you achieve this awesome quest!
First just to help you, and to lead you, let start with the beginning and introduce the NASA data modelised as Time series.

## Star's data

During this tutorial, you will study the NASA Kepler data-set. You will in charge to discover some exoplanet. To discover stars, you will be analyzing photometry from differents stars collected by Kepler.

You will be working on the lightcurve called *SAP_FLUX (Simple Aperture Photometry fluxes)*. It represents the flux in units of electrons per second contained in the optimal
aperture pixels collected by the spacecraft. This is the raw data acquired by Kepler. Here's an example:

![Alt Text]({{ site.baseurl }}/img/step-0/kepler-11.png)

As the lightcurve of a star evolve according to time, it can be considered as a Time-series.

## What are Geo Time series?


We call a Time Series, a **sequence** of evolving values over time. These values, named **data points** or **measurements**, are added as they come, with a stable frequency or not.


![introduction]({{ site.baseurl }}/img/step-2/intro_1.png)

To ease readability, let's visualise with colors instead of degrees values. We can use the Celcius degree as an Y axis to graph the temperature evolution along the day.


![introduction]({{ site.baseurl }}/img/step-2/intro_2.png)

Like in this small example, a graph with a value as an axis, and a time as the second one is just a Time Series visualisation.


## Where can we find Time series?
**Time Series are everywhere**, here are just few examples:

- The evolution of the stock exchange
- The number of calls on a webserver
- The fuel consumption of a car
- The load of a CPU
- The time a customer is taking to register on your website
- The time he spent on your website
- The heart rate of a person measured through a smartwatch


## Time Series data model
In the draw above, we have considered a simple series named **temperature**, but we tend to qualify more our data. There are situations where temperature will not be enough to qualify your series. In a home you could measure temperature at different places like :

- outside
- room 1
- garage
- 1st floor room
- kitchen
- etc.

This why we need **labels** (or tags, dimensions,...) to enhance the data modeling. And now our data model looks like :


![labels]({{ site.baseurl }}/img/step-2/intro_labels.png)

All rooms with be a simple value associated with a key *room*.

Labels are key/value pairs used to qualify series. They are **immutable**, which means if you change something in the labels set, it won't affect the previous series but it will create a new one. This also means that your Time Series data model need to be designed carefully.

Given the many aspects they can have, the storage, retrieval and analysis of time series cannot be done through standard relational databases, like SQL. Instead it needs a custom built system, not only a Time Series Database, but a whole solution that will enable usability of the data.

We can find here and there many Time Series Databases that claim to solve the same storage system but most of them fail in their mission to provide you the right tools and protocol to let you enjoy your data.


## Time Series Values
Once you have define the good Time Series model for your own need (in the case of monitoring, most of the time your collecting software will choose it for you), you will push data points or measurements.

These data points can be of **multiple types** (Long, Double, String, Boolean)  given the protocol you use. You can refer to the matrix compatibility to know which one fits you best.


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

In order to acheive these goals, many **algorithms** can be used.

## Time Series Predicton or Forecasting
You can use Time Series to predict the future. By learning from an exsting signal, you can forecast this signal by predicting future points. Using different techniques, like AutoRegressive Integrated Moving Average (ARIMA) for linear models or others (or a combination) more adapted for multivariate Time Series.


## But why would we use Warp 10 ?

Warp 10 is one of the multiple Time series database that exists. It includes also the WarpScript language, saw in the previous step. This language is dedicated to Time-series manipulation.

## And What does a Time-series looks like in WarpScript ?

If you type the following WarpScript code:

```
// Create an empty GTS
NEWGTS
```

You will push on top of the stack a Time series. A Time series follow this modelisation:

  - It requires a fix classname (the key "c") in quantum result, which is the main identifier of a Time series (string).
  - The labels "l" also identifies the existing series. This corresponds to a map object of string key/values.
  - The attributes "a", same as Labels but they are global parameters of a series and can evolve without creating a new series.
  - And finally the values "v" which includes a timestamp (time of the current point), a location and a value (can be Double, Long, Boolean or string)

To update any of those parameters, you can use one of the following functions that updates the initial Time series to define an example one: the number of time a spefic planet rotates!

```
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
```

This will leave the initial GTS created on top of the stack, updated with each different values.

# To be continued

Luckily for you all the needed Time series for you exoplanet are already available in our back-end! You can start to explore them in our [next step]({{ site.baseurl }}/step-2-Keplers-Data/2.2-Exploring-known-time-series/).