---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
title: 'Step 0: What is an exoplanet?'
category: step-0
---

Let’s quote our good old friend [**Wikipedia**](https://en.wikipedia.org/wiki/Exoplanet):

> _An exoplanet or extrasolar planet is a planet outside of our solar system that orbits a star._

do you know how many exoplanets that have been discovered? [**3,711 confirmed planets** as of 04/05/2018](https://exoplanetarchive.ipac.caltech.edu/).

##  How to detect it?
There are different [**detection methods**](https://en.wikipedia.org/wiki/Methods_of_detecting_exoplanets). Turns out there is one method heavily used, called **the transit method**. It’s like a eclipse: when the exoplanet is passing in front of the star, the photometry is varying during the transit, as shown below:


![Alt Text]({{ site.baseurl }}/img/step-0/exo-nasa.gif)

> Animation illustrating how a dip in the observed brightness of a star may indicate the presence of an exoplanet.
> _Credits: NASA’s Goddard Space Flight Center_


To recap, exoplanet detection using the transit method are in reality a **time series analysis problem**.

* * *

## Kepler/K2 mission


![Alt Text]({{ site.baseurl }}/img/step-0/kepler.jpeg)

> _Image Credit: NASA Ames/W. Stenzel_

Kepler is a **space observatory** launched by NASA in March 2009 to **discover Earth-sized planets orbiting other stars**. [The loss of a second of the four reaction wheels during May 2013](https://www.nasa.gov/feature/ames/nasas-k2-mission-the-kepler-space-telescopes-second-chance-to-shine) put an end to the original mission. Fortunately, scientists decided to create an **entirely community-driven mission** called K2, to **reuse the Kepler spacecraft and its assets**. But furthermore, the community is also encouraged to exploit the mission’s unique **open** data archive. Every image taken by the satellite can be **downloaded and analyzed by anyone**.

More information about the telescope itself can be found [**here**](https://keplerscience.arc.nasa.gov/the-kepler-space-telescope.html).

## What have we done?

#### What we have done:

* Downloaded and parsed 40M of FITS files
* Pushed it to a Warp10 instance
* Select a cool subset for you

#### What you have to do:

* Learn WarpScript and find some exoplanets!

## What does it look like?

Here's an observation of a star called Kepler-11:

![Alt Text]({{ site.baseurl }}/img/step-0/kepler-11.png)

Do you see the dropouts? **Those are transiting exoplanets!** Now we’ll need to **write a WarpScript to automatically detect transits.** But first we need to learn how to WarpScript! Let's discover it!

## ... [next step]({{ site.baseurl }}/step-1-WarpScript/1.1-Getting-started-with-WarpScript/)