# Step-7: Strong enough to break our code?

In the related mc2 files, you will find the last stable version of our script to detect exoplanet. As you are now an experimented hunter, read it careful! If there is some part of this script that you don't understand, we will be happy to talk with you about it. Try any improvement you can imagine and feel free to contact us to discuss it, and merging it! 


# Bonus, wanna a quick resume of some of the main WarpScript function?

Once you completed this tutorial, to remember some details of the WarpScript, feel free to use this [Warp10 cheat sheet](https://groupe-sii.github.io/cheat-sheets/warp10/index.html).



```
'60VEPqKkQ5KmAbCWR1taQ6Ks5kX701tWR6.IPLwiSq4mR23kAa8jQrGnS68WR.WYNLpkNLSiOFGfR5lm1JgkBIFmCXskBV_2Iot5HK8CGJF8Hn.lC27qAY.n1JC0IZG8G34JGF8dO.ZkBI3lBY7sDIFGQq8nOM8qNMGdQqtDSLpXOM71CIJ5RrGWS6Kn1JCEIZO8JZp4G._AB23oBYNiB238FoxDGZ_HIJK34V.L.0g3X._AB23oBYNiB278FoxDGZ_HIJK31JgkBIFmCXskBk_2FJt3HJG0K3J5RrGWS6Kn1JCEIZO8JZp4G._AB23oBYNiB238FoxDGZ_HIJK3.0P.whbmVdni00P.YOuI2GPer.Va.0X4.WyA1..........fNL1t9GHaRSU0sRPfokoB2.kX2KBjIObCsb2YxRMvzzzz4qbcbITOpy65ask47BbzJu1H2Fz.PX5HflBHZ6WjjN.w8WYjlRw58AZrMRYuMVNm7EBLmHCOyDcHBixCM2kHvwLj0JYuEVVf7E4Tx1EAjJw0Pjg6SySGOATwnJIajOO3SgiQ5e.dY6.tljj7dVFYyy6SnkC79dyZ77U3IISZreK_m2uu_ia.ABT.QDPKIVNZBmwr7fjguWKZ_FzAZ6rvohJ0HSwQRyGsTBB1JI_fnn7dcCySJTAj_YmHzxtecUVj0IaJMZp5SgifYHWlukXm6F0cqV.dJF7..0OJ3F.' UNWRAP UNBUCKETIZE 'exoplanet.model' STORE

'60VMPqKkQ5KmAbCWR1taQ6KsDaCgOL4iOLFQ27V3Aa4kR0CdQmtrNM8kBI.iNaxjS6CoRa4k3LxXRqKmSa4oPLxiIbKhNaKm.I74Rr0gPMF0BV_AB2.lCIRiB238FoxDGZ_HIJK315CWQM0WOqt_05hkQ678Hn.kBIJrAY.o1JCEIZO8JZp4G._AB2.lCIRiB2J8FoxDGZ_HIJK31JgkB23pCmskBV_2Iot5HK8CGJF1PLF8B2.qCIFlDI7k1JgkB23pCmskBk_2Iot5HK8CGJF8Hn.kBIJrAY.q1JCEIZO8JZp4G.OnS54oSMB8FoxDGZ_HIJK34V.L.0g..0P.whbmVdni00P.YOuI2GPer.Va.0XL.GyA1..........fNL28iOMyup22.SK2lmLi1Y17CEIDawlvFAjETtEe0lYENAjoRag45BxsiO2j5FwNnslSzj.92WYEzEnKkqZnN2mAQvqQqy3wmr7jyzk1DBwbfTI50QY9eIS3nT.enLLw_Rv1KOfRpi6Drk2Y5FaxA6w9puSv9Jxh2KlDjRr5Zt50.F.yrKQ1pF...0NT3F.' UNWRAP UNBUCKETIZE 'exoplanet.model.smooth' STORE


1765000000 'bucketspan' STORE


NEWGTS { 'KEPLERID''' } RELABEL 
DEPTH ->LIST



// looping through the star
<%
    LABELS 'KEPLERID'GET 'KEPLERID'STORE
    [ $token 'sap.flux' { 'KEPLERID'$id } NOW NOW ] FETCH 0 GET
    DUP ATTRIBUTES RELABEL 
    'star' STORE
    
    // downsampling
    [ $star bucketizer.mean 0 $bucketspan 0 ] BUCKETIZE 
    //[ SWAP mapper.min 2 2 0 ] MAP 0 GET 
    
    // split the star into multiple observations if there's 2 h without datapoints
    2 h 10 'observationNumber' TIMESPLIT
    FLATTEN
    
    //[ 31 DUP  ] SUBLIST
    
    <%
        DROP
        
        // Store current GTS
        'myGTS' STORE
        
        // Pseudo radius of the kernel (the kernel really has a diameter of 2 * radius + 1 steps)
        10 'radius' STORE
        
        // Number of time units per radius unit
        $bucketspan 'step' STORE
        
        //
        // Apply the MAP on a window which extends $radius ticks on both sides of the current tick
        //
        [ $myGTS  $step $radius 2 * 1 + mapper.kernel.cosine $radius $radius 0 ] MAP 0 GET 
        'myGTS:cosine' STORE
        
        50 'radius' STORE
    
        
        [ $myGTS:cosine  $step $radius 2 * 1 + mapper.kernel.uniform $radius $radius 0 ] MAP 0 GET 
        '%2B:smoothed' RENAME  
        'smoothed' STORE
        
        // removing the trend to the initial serie
        [ $smoothed -1.0 mapper.mul 0 0 0 ] MAP 'inversed_smoothed' STORE
        [ $myGTS:cosine  1 ->LIST $inversed_smoothed + FLATTEN []  reducer.sum ]  REDUCE 'sap.flux:cleaned' RENAME 
        [ SWAP -1000.0 mapper.gt 0 0 0 ] MAP 0 GET
        'clean' STORE
        
        $clean true MUSIGMA
        'sigma' STORE
        'mean' STORE
        
        // Keep only point below a specific threshold: -1* (|mean| + sigma) 
        [ $clean  $mean ABS $sigma + -1 *   mapper.le 0 0 0 ] MAP 0 GET
        
        // Separate result series per quiesce periods of 4 h
        1 h
        3
        'split' 
        TIMESPLIT
        FLATTEN   
        
        // validate transit with DTW on smoothed version
        MARK SWAP <%
            'transit' STORE
            $transit VALUES SIZE <% 3 < %> <% CONTINUE %> IFT
            $transit UNBUCKETIZE FIRSTTICK
            $exoplanet.model.smooth  FIRSTTICK  -  $exoplanet.model.smooth SWAP TIMESHIFT NORMALIZE
            $transit NORMALIZE SWAP 0.0  DTW  'score' STORE
            <% $score 2.0 >  %> <% CONTINUE %> IFT 
            $transit { 'dtw_score' $score TOSTRING } RELABEL
        %> FOREACH COUNTTOMARK ->LIST SWAP DROP FLATTEN
        
        // Then create a list of tick to start and end
        <%
            DROP 
            UNBUCKETIZE
            'series' STORE
            [ $series FIRSTTICK 3 h - $series LASTTICK 3 h + ]
        %>
        LMAP
        
        'clips' STORE
        
        // Clip initial series with it
        $myGTS 
        $clips
        CLIP 
        'sap.flux.transit' RENAME
        
        $myGTS + NONEMPTY
        DUP SIZE <% 1 == %> <% DROP [] %> IFT 
    %>
    LMAP 
%> FOREACH

```