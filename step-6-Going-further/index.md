---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
title: "Step 6: Where no man has gone before..."
category: step-6
---


It was not enough for you, you want more WarpScript? You came at the right place hunter. This page is all about extraction a few WarpScript function that can be an help in your quest of exoplanet or any other Time series analysis! You will discover the function to establish a correlation between a series and a set of series, how to use the STL function, the discord function, how to detect Outlier in a Time series and ending with some useful function to compute statistics on Time series. 

Those functions are listed here to give you an hint of the richness of WarpScript and about what can be quickly tried. At any time, feel free to skip this section to try to hack our code in the [next step]({{ site.baseurl }}/step-7-Strong-enough-to-break-our-code).

## CORRELATE

The [CORRELATE]({{ site.doc_url }}/reference/functions/function_CORRELATE/) function can be used to compute the crosscorrelation between a base Time and a list thereoff. An identical example as in the documtation is put below. The only parameter to add corresponds to a WarpScript list representing the offset to compute the correlation. All Time series must be correctly downsampled (aligned ticks and filled) before as the offset corresponds to a multiple value of the distance between two points. The value 0 as offset will compute the correlation between all ticks of each series.

<warp10-embeddable-quantum warpscript="
// Load a generated cosine GTS
'60V2Nqxn5k.L.0N.5k..4h.44V7Lo.Ja.0YZ2GyA1.........0K_rhF_4JNlg5sa2.Zy53d4mxslpgsic2ZYcsMb3WJAE5H4INH0L887cg919CtINj.HNRJQsXDuTXVaM8mIFFGFPseA1.V7idXYccLFixvMftrSzbfCvjAvjbDTSvbTRu13_jhJmjtdpWfqnfzHbzlypPZzreg4QQWHByjEb4dxZGuvE2heeuMHEK_OxxnnJFe5t2u9YkEHUxoPDPJQJXbOWsQble6h6S7ufXa8JY8qvNbiQyA4A3ykYS6YlIJsPDnHZ.PqqjFbBpDH7v6UcivB0I7q59N4HWRZUG65tU48mAxufVmjWfMNclquYCxFGUHp4ETbLRAZOlUIdgzdWzFZvcaduvnQm3SMlyMMfVF9HOjnyVK9t3aMnbO_O15O0JrUZnKKo1ExNzyzBFr6m_tcBR6cmDGdfc4Gkrj1UHccm5qnDw9Jcui8IFc1maepMCCPkqHpoGxoQ6dF9qKmvCDYgEMLYU64LJORNSP8qpNtAdt0h22lhXxuRyE7iqBSBfJ9JXPg82bmoi0LaezaDWuR0GHRbGawKkCof2JgkUR8k3xi4PKCH6r3_9shYsz.bUhVJptwy5EwCrazGZf3XQY6YIv6ldUjvcroEpHcxzqUPDG7_AH5Wni.YKpGXUt0iDjCToyCnyVfniHptRdVQfnF7pb3ZtU9dX7CBotxTERBo.ClKsqrmxTXfIssehpgxR1rLheHM4yVuiz4rLmP_JgvbYxXrtIIWW57BLzEz0CMGwZ9Hhfc2dvnmShyzw0ebJcYGZmxngVVxCNvya5Ie.Pdl_rRqplvugSlwGexVF1rQKzERXiUk6F6ThAVzSo6F5eTfr2T2wCSK2O_YYVOhZJc7f5f8Xh2jw1_KTu_KVKKF1KtQKdlYoB.XfCoGFbKpk2ibLc_w4bdkSFmPvp_ryqyk6cOji6ntfyk8MT9EHOK8H6eveyvwu8PP5jVU7YcklfkXN2tUbrry1kTWrFrrNDsKZWe96A8O4dDnAu.kaUwe2Vg.PV1zfExkNgr.9J3pltMdxc02dSzLEJpzB5.qJMMVhgmww.D_.QLh0TMFuoiwv0TojC9RMuNbPRMp25p_u9hO1j5T1QWUlRnSh.xAx_FEGx.J2mCt8.bN8yxm.FfPJ2XCNr67YL6.x3nk6f3zGggBx1EiwXDm2PVkp.h1w2V5XjSVAGzVo0cYqx1JIvE0y7xfsPH8u67tmtc2D1eG0oQdi.u1lE.C6t4VEGaRw07WrVCohhpBAw1h7Ae3uFWhe0H4RqH48fUO5Zzfm0H8EiH49by1td4zT.xEkO35Zw0obe6iOCo1lRF8AnsNZZOyNq3ByGsCZHC5wiH675RUJo_vt7R_PIZTIwVig8ba_0RyuEdBuy72wcGt7TVPgbrk2E3TF_gt5Zjll0JYp6Z.zCG8ATK7gZzHcQHMfNKH2mCSFKTKooZjFzR020bXY78xDGd6UXtwWEFt5Zlxc1ZTzXYdBMMoSHzKaFOuDPmBTIZ9HrsvDGrkx2ZWbk2dABWJFZCHg3tsTVI4a9dDPBsDkGb3T1BodFQe4m9BgwZCGw3tltVbEFv2LnntbyKwp0wxwkzPtdAM8xD_vn3gjbB2qQuMbK60HRVxpvdU2y8KfieLaUpGngEVwrEXBQEfT4_aTdta2raNTn2j8O5t5g_tugcInLpM6Lac6pCsBpLRouERIP2LFx6qLCiv2iQz3gYD2twDLOoU.RMT6OqgYndi3OjB4nuRmnDcfbhs8bicnbr7CbzmAvVGxvl2bqYJzOHxPkjnXntrXk2spZQw8neyj1jkvqgBUgPn6gSKQgUnVxt7bn46DU8Dx34m.zlHRbYwJoc0lwcPWTM9LczcnDHduCtoNyYf_.rjuIcjcxPd7m.E9CRX3J3ekv9s7KCIwVDRomWM754JjOVzeYE.dIp7mmKxIRk_DFLKP.RovtWVt1aFSv4Q2vmA.8m_8vCGgC5YJjPnGeWWNBs_npJfBqeIUbvnTRmTJLDJpfYiJwrwsO6w9tzsmvV7vvVGhrW_rR7oOmhwYbjY5MDsX0ToZvSlKzvXwdr5amiTTJRzR8sItJc6PZqWvRarIRdNkLzNeotgcxQ0GrBoziPmsL6Nvoj7mvMVvrEnziWAbR3nqsDpOkbvnC6SDQTuRnSx3XveSyr4ZrRczKRvUKRCzpskswVbjlARiifDOVSuTTlIrvg3MrOWzHRVteqPyov54azOuwAcfj.I12LjQ3vjj1AsduWsWLp6h4e9ATCJ24Lgt0wni8uOsXEMiVNb5UsIiDuSv2DPY_M21zBtbiJLcDPY_bnDxVdbiOuPtaifydLLOynuEBylzt3BJt3Fs..0QF0G3.' UNWRAP

// Create a list
[

	// Containing a loaded sine GTS
	'60V2Rq_i5k.L.0N.5k..4h.44V7Lo.Ja.0YF2GyA1.........0K_bhFK6JJlw6WZHtGmBJMAxyDc59NgDAYdmNy9MmGP4P5YNF2cXD8s.B85wOrIVWD5XddVdfdl8.jL4pptT31.c711kHcV.XDcT1ZoYbrRBziv_yUqQpvvzqSwnrUvp_PQ1qP3XAIXWQuHdPXPLGHtVZM6u.bSmfH8yGZ7sL9ihmkvJWLONxEUNezEYuTiXOiRV5HrwblSGgz06dJoYOdvx3lH53vZyhK_J1CvmAYpN3_H.UzMYm_bnEHg5xrncrC.Lfs9ytXSdsUoZm6d91Rmo2pGRDgj_wGVfIXLhULTOi0za_gqibkpW3dsbn4yiX0F6Jj0osvOlX1hDLYkLxfKJ1prUYt4wbLvKbvwMeV5_K8pE145s.BxiBwOlbT._MQypUaLCw0ef7Q5ypvT.tFdTrf7IP2Rc3TLaNEESlx1eYXxQuqGw_lFDMhDxkAHuR1rLx7YxehTVpJKitRQ93j.mfKhUhuCHw.9gbmAJesfkDuSv9EkMgzKeEsdqorUfO80XfgME1XwQ7MoCo1QlyxvV0Fzh56tqN5SkA_WZRNCcLcVMGyVvPfCgN1rQ8GWPNj1F1uJGmTjDzMAX1CSp_.N3Veo0MheXCI_jZ2OFLLMxAiP.5uL6JVNioXKu.n0MUahiRT.YdG3tnMLNMSD_XfwhlKUJmmj6Qlxt3Id8LqZeK5zgs.QueGfuji1oIzfF9Xyoo6ZdwGznsFEIRSH6uMpOO.wji_YVPXSkPxPDVRTs2cQED0tEBivkp3CNV6cfcB0P8PFKooKAwGF4II7X1ewl7VebopZCkEipt.p1DcWcQu_VW3jUk2XEdQ23Fx2kFX6T1SOLrJL.5GMa9.H3CFRJqS0MvkKx8PEmGOUtt.d3ZM84abzN47ipiGO2qj.X9COm68icSDPqVLfXA8wy5D8BzBUH1P7kDHE4iV6.rCamDHE7D4F2HMT2yPKPkdnTxp78ddz8Mar.ydtdi8IfxWnthxFtOofBPbCTwEhoyAlQBpCoFUHTb7.5flqQvR9M3DJa9BEfrh84AtujInMYK.IsSCpDcnOXC4hAWhPd5zmsdh1VssVzHaEfdooaqVpWbDVG5YgDTh1NCSdstOWuGxTjKnSIvFBsiNwLBfpX8CjbayDms49JdrTBmPxJWbhwLZ4.FYpIQPSpym0adnT2KnwKWbd0ZMECx_rZL9h6TR4LH0x7jSiXpKLBZqvTa5fvOVCSeP26EaPj0gvMNOlq9iY3FPpqU7OsZU7.LwwNupX3B9qlPanfe8_A0bQvnA.9FYktDw5_RXMOXSBIsd4ZbvU3IPC4GqTu_vJ_Tc2eaiC6D.JldHeqf2yitDd7vQnzcySZEufxSaYMJcofjf9Hzzr.roMCPKWS_r8hROzmjUvtMtBsnECQuAz6slzBtUw2buwxaotiTKPq2ESGb0hMAXyirVafcdSKvPnQJjs6sBsWtORSyLRHzMRMyIiTUUgFtmLGjWf8UrL3DrL4ROfAKepdwzPv9PSOf5qjKbEOxaYJigyp9T0FyT2nMEnBSaRoHnxFEEakzEs4qTHkTTKFyTrkSaBopnvg9nUsrxN18vG1QvldUg8OjNMlnNRpnOWoPnCnamMpamWvpVMxicT8qWZzoE4J5Ti40HU0AbZfkIeoOyXbC36XiZ6hxKSJX94uCAZIw6HNdbNpU8lr3PmShrHNfUcw7c.u9Zb_k7QdLJf72BuwaEzO9H9TV6_2CNEwf08t9HGuVkmZ3wAyLLYPGZ5Kt6yNOKclm3ZowtcTFVOPDWht9MpSDK2BqQnvaeKf7qrcfnCssnyN5Hou_DbColbDRdbE40bEgjTGUNmji09ywBWrXEwD2SFgzvlXATFHdtAybXMTJIr_xyt8raADwtWQnvADKxH9zgH2LxT5y9t_qebUTfQhutb6VEwy2SnCpgMmEhGjCTxvMOfaURzqVLgb_ESDESgNnrmM9n6OEafHzjcbfTIxLwgmQk6biASpjw_TOw3d7wyn.xVjk.CpMm16lvwVrNRkGtmIkZqKxkDqIE3Om2VbCFZ4xWlRb2RCjZ60IZSG47gjz_.Q3b1jO8FSsOXPIZcD.R4DHvAZX94kjDFJ5TEGW8wM60rXvNvkMbc90RkDgs9kIbWy0B3Om2Vf8bAt9RGrW9nXY0iHJcmp2Ob5y1Boxk2ddwOr9SwQz5ylaUcTHVs0koUIw_iorENImQwQn55b0SYAJmeOymLkYDkOvPtrBzbBpul2_cqZitjsTstu5gVrnLGYYflONpd5CSbL5h5RnoGtegBhTdggDOu8_ng3UrxrVLGjoE6J0iEl3D...Lo.JG..' UNWRAP

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

The second function of this section is the well known [STL]({{ site.doc_url }}/reference/functions/function_STL/), standing for: Seasonal and Trend decomposition using Loess. This function expects A LIST of two GTS (or a LIST of LIST of two GTS) onto the stack. These GTS are the seasonal part and the trend part of the input GTS. Seasonal and trend are added as suffix. On the [STL]({{ site.doc_url }}/reference/functions/function_STL/) documentation page, you will find a concrete example about its usage in WarpScript. [This page](https://www.otexts.org/fpp/6/5) introduces how the STL decomposition works for Time series.

## DISCORDS

The third section is about the [DISCORDS]({{ site.doc_url }}/reference/functions/function_DISCORDS/) functions that is based on [pattern recognition](https://en.wikipedia.org/wiki/Pattern_recognition) to detect discontinuities in a time series of a list thereof. This functions expects some parameters to define how to recognize a pattern. The [DISCORDS]({{ site.doc_url }}/reference/functions/function_DISCORDS/) documentation explains more in details all the different parameters and present a working example. 

A pattern is defined with first it's window size, then the size of the pattern and finish with it's quantization scale (values ladder dividing the window width). To compute the discord you need to add maximum number of discords to identify, a boolean flag indicating whether or not the DISCORDS function should report overlapping discords and a distance ratio (it is safe to leave it to 0.0). A working discords example would be:

```
32 8 16 5 false 0.0 DISCORDS
```

## Outlier detection

In WarpScript, there is mutliple outlier function detection. You can retrieve for example the basic [THRESHOLDTEST]({{ site.doc_url }}/reference/functions/function_THRESHOLDTEST/) which just need a threshold value. This function will detect values greater than this threshold. There is also the [HYBRIDTEST]({{ site.doc_url }}/reference/functions/function_HYBRIDTEST/) which mix STL and another detection method [ESDTEST]({{ site.doc_url }}/reference/functions/function_ESDTEST/). You will find all the other available outlier method detection [here]({{ site.doc_url }}/reference/#outlier-detection).

## Some statisticals functions

WarpScript also have some basic statistics functions that can be apply on Time series. As [MUSIGMA]({{ site.doc_url }}/reference/functions/function_MUSIGMA/) to compute both the mean and the standard deviation of a series. You will also retrieve all the following functions: [NORMALIZE]({{ site.doc_url }}/reference/functions/function_NORMALIZE/#sidebar), [ISONORMALIZE]({{ site.doc_url }}/reference/functions/function_ISONORMALIZE/), [STANDARDIZE]({{ site.doc_url }}/reference/functions/function_STANDARDIZE/), [SINGLEEXPONENTIALSMOOTHING]({{ site.doc_url }}/reference/functions/function_SINGLEEXPONENTIALSMOOTHING/) to smooth and compare different series. To extract more details information on a Time series, you will also retrieve some functions as [MODE]({{ site.doc_url }}/reference/functions/function_MODE/) or [VALUEHISTOGRAM]({{ site.doc_url }}/reference/functions/function_VALUEHISTOGRAM/). The main other available statisticals functions are [CPROB]({{ site.doc_url }}/reference/functions/function_CPROB/), [LOWESS]({{ site.doc_url }}/reference/functions/function_LOWESS/), [LTTB]({{ site.doc_url }}/reference/functions/function_LTTB), [MONOTONIC]({{ site.doc_url }}/reference/functions/function_MONOTONIC/), [NSUMSUMSQ]({{ site.doc_url }}/reference/functions/function_NSUMSUMSQ/), [PROB]({{ site.doc_url }}/reference/functions/function_PROB/), [RLOWESS]({{ site.doc_url }}/reference/functions/function_RLOWESS/) and [TLTTB]({{ site.doc_url }}/reference/functions/function_TLTTB/), if needed one day.

# Bonus, wanna a quick resume of some of the main WarpScript function?

Once you completed this tutorial, to remember some details of the WarpScript, feel free to use this [Warp10 cheat sheet](https://groupe-sii.github.io/cheat-sheets/warp10/index.html).

# This is the end

Thanks for completed this tutorial! We were happy to introduce you to the analytics of Time series worlds and to present a short initiation to our search of exoplanet! 

## [previous step]({{ site.baseurl }}/step-5-Process-all-stars/5.3-Reformat-the-output/)