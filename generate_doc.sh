#/bin/bash

URL="https://quantum.metrics.ovh.net/#/warpscript/"
BACKEND='{"url":"https://warp.pierrezemb.org/api/v0","fetchEndpoint":"/fetch","headerName":"X-Warp10"}'

function replaceCodeBlock() {
    MDFULLNAME="$1"
    MC2FULLNAME="$2"

    MC2FILENAME=$(basename $MC2FULLNAME)
    MDFILENAME=$(basename $MDFULLNAME)
    MDTMP="/tmp/$MDFILENAME" 

    HEAD="CODEBEGIN|$MC2FILENAME"
    TAIL="CODEEND|$MC2FILENAME"

    LHEAD=$(cat "$MDFULLNAME" | grep -B 10000 "$HEAD")
    LTAIL=$(cat "$MDFULLNAME" | grep -A 10000 "$TAIL")
    if [ "$LHEAD" != "" -a "$LTAIL" != "" ]; then
        cat "$MDFULLNAME" | grep -B 10000 "$HEAD" > $MDTMP
        echo '```' >> $MDTMP
        cat $MC2FULLNAME >> $MDTMP
        echo "" >> $MDTMP
        echo '```' >> $MDTMP
        cat "$MDFULLNAME" | grep -A 10000 "$TAIL" >> $MDTMP

        cp "$MDTMP" "$MDFULLNAME"
    fi
}

function replaceLinkBlock() {
    MDFULLNAME="$1"
    MC2FULLNAME="$2"

    MC2FILENAME=$(basename $MC2FULLNAME)
    MDFILENAME=$(basename $MDFULLNAME)
    MDTMP="/tmp/$MDFILENAME" 

    HEAD="LINKBEGIN|$MC2FILENAME"
    TAIL="LINKEND|$MC2FILENAME"
    
    LHEAD=$(cat "$MDFULLNAME" | grep "$HEAD")
    LTAIL=$(cat "$MDFULLNAME" | grep "$TAIL")
    TITLE=$(echo "$LHEAD" | cut -d"|" -f3 | cut -d")" -f1)

    if [ "$LHEAD" != "" -a "$LTAIL" != "" ]; then
        LINK=$(base64 -w0 "$MC2FULLNAME")
        LBACKEND=$(echo "$BACKEND" | base64 -w0)
        
        cat "$MDFULLNAME" | grep -B 10000 "$HEAD" > $MDTMP
        echo "[$TITLE](${URL}${LINK}/${LBACKEND})" >> $MDTMP
        echo "" >> $MDTMP
        cat "$MDFULLNAME" | grep -A 10000 "$TAIL" >> $MDTMP

        cp "$MDTMP" "$MDFULLNAME"
    fi
}

function replaceSummaryBlock() {
    MDFULLNAME="$1"
    MC2FULLNAME="$2"

    MC2FILENAME=$(basename $MC2FULLNAME)
    MDFILENAME=$(basename $MDFULLNAME)
    MDTMP="/tmp/$MDFILENAME" 

    HEAD="SUMMARYBEGIN|$MC2FILENAME"
    TAIL="SUMMARYEND|$MC2FILENAME"
    
    LHEAD=$(cat "$MDFULLNAME" | grep "$HEAD")
    LTAIL=$(cat "$MDFULLNAME" | grep "$TAIL")
    TITLE=$(echo "$LHEAD" | cut -d"|" -f3 | cut -d")" -f1)

    if [ "$LHEAD" != "" -a "$LTAIL" != "" ]; then
        LINK=$(base64 -w0 "$MC2FULLNAME")
        LBACKEND=$(echo "$BACKEND" | base64 -w0)
        
        cat "$MDFULLNAME" | grep -B 10000 "$HEAD" > $MDTMP
        echo "- [$TITLE](${URL}${LINK}/${LBACKEND})" >> $MDTMP
        echo "" >> $MDTMP
        cat "$MDFULLNAME" | grep -A 10000 "$TAIL" >> $MDTMP

        cp "$MDTMP" "$MDFULLNAME"
    fi
}


# Get steps folders
FOLDERS=$(find step* -mindepth 1 -maxdepth 1 -type d)
for FOLDER in $FOLDERS; do
    
    MC2S=$(find "$FOLDER" -name "*.mc2")
    MDS=$(find "$FOLDER" -name "*.md")
    for MC2FULLNAME in $MC2S; do
        for MDFULLNAME in $MDS; do
            replaceCodeBlock "$MDFULLNAME" "$MC2FULLNAME"
            replaceLinkBlock "$MDFULLNAME" "$MC2FULLNAME"
            replaceSummaryBlock "$MDFULLNAME" "$MC2FULLNAME"
        done
    done
done