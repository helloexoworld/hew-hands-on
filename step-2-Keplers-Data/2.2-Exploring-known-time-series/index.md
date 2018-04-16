---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
title: 'Step 2.2: Exploring the available time-series'
category: step-2
---
 

Now that you survive all the WarpScript needed knowledge, we would like to welcome you in our special quest, as an exoplanet hunter!

## FIND

We preloaded our platform with some stars (around 30). Let's observe the series structures and find the one that we want! We are going to use a function called [FIND]({{ site.doc_url }}/reference/functions/function_FIND/).

How does the function FIND works? This function allows the user to retrieve specific meta-data of Time series store inside a Warp 10 backend. You will need to push on top of the stack a list of specific parameters. The function to work correcty will need a specific cryptographic token, remember, you saw it earlier. Let's resume how to load it. 

Before retrieving any data, you need to access data store in a specific application. To simplify the process, an existing token was stored in the platform. You can access it using the following code. HEW stands for HelloExoWorld. 

```
// Load handson-hew token
@HELLOEXOWORLD/GETREADTOKEN
```

Then store it in a variable, for example token. And starting from now, keep this stored token in all the script as you will need it to load data.

```
// Storing the token into a variable
@HELLOEXOWORLD/GETREADTOKEN 'token' STORE 
```

The FIND function finds Geo Time SeriesTM matching some criteria. To work correctly, it expects on top of stack a LIST with 3 parameters: the previous stored Warp10 token, a classname selector and a MAP of label selectors.

The classname selector is a string which represents an exact match if it starts with an ‘=’, or a regular expression if it starts with ‘~’.

The label selectors are packed in a MAP whose keys are the label names and the values the associated selector. Those selectors can also be exact matches if they start with ‘=’ or a regular expression if they start with ‘~’.

Here a preloaded WarpScript that you can use, find all the GTS available!

```
// Start the find with the token as first parameter
[ $token ...  ] FIND

```

Wow, a lot of data appeared in my quantum console. They represents all the existing series that are availble to test you exoplanet quest! Each Time series have several meta-data. During this tutorial we are going to focus on the one called "sap.flux" as they represents the raw data of the lightcurve of each stars.

The one that we are looking for has a label KEPLERID=6541920, can you see it? Change the FIND to have only one result: sap.flux for Kepler-11!

## To be continued

During this step you manipulated a sub-set of series extracted of the FITS data of the NASA. Now to really explore this set of data, let's obeserve what the lightcurve for the kepler-11 time series looks like. In the [next step]({{ site.baseurl }}/step-2-Keplers-Data/2.3-Getting-Kepler-11-raw-data/), you will learn how to extract raw data using Warp 10.

## [previous step]({{ site.baseurl }}/step-2-Keplers-Data/2.1-Did-you-said-Time-Series/) ... [solutions]({{ site.baseurl }}/step-2-Keplers-Data/2.2-Exploring-known-time-series/solutions) ... [next step]({{ site.baseurl }}/step-2-Keplers-Data/2.3-Getting-Kepler-11-raw-data/)
