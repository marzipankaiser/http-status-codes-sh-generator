#!/bin/sh
cat ./http-status-codes.csv \
    | tail +2 \
    | while read l
      do case "$(echo $l | cut -d',' -f1)"
         in
             [0-9]*-[0-9]*)
                 for i in $(seq $(echo $l | cut -d',' -f1 | cut -d'-' -f1) $(echo $l | cut -d',' -f1 | cut -d'-' -f2))
                 do echo $i,$(echo $l | cut -d',' -f2-)
                 done;;
             [0-9]*) echo $l;;
         esac
      done \
    > ./http-status-codes-preprocessed.csv
