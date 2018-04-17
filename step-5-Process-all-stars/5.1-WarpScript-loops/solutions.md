---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
title: 'Step 5.1: Back to WarpScript bascis: the loop'
category: step-5
before: 'step-4-First-Exo-Detection/4.3-Threshold-test-and-display'
next: 'step-5-Process-all-stars/5.2-Optimize-global-analysis'
back: 'step-5-Process-all-stars/5.1-WarpScript-loops'
---

## Solutions

<warp10-embeddable-quantum warpscript="
//
// FOREACH
//


// The initial sum count
0

// The list on which the count will be applied
[ 1 2 3 4 ]

// Write the MACRO
<%
    +
%>

// Call FOREACH function
FOREACH
">
</warp10-embeddable-quantum>

<warp10-embeddable-quantum warpscript="
//
// LMAP
//

// The list on which one will be added to each elements
[ 1 2 3 4 ]

// Write the MACRO
<%
    DROP
    1 +
%>

// Call LMAP function
LMAP
">
</warp10-embeddable-quantum>
