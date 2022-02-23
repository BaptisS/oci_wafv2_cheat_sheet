#!/bin/bash
export query="search"
export filter=" | isNotNull(data.requestProtection.matchedIds) | sort by datetime desc" 
oci logging-search search-logs --search-query $query$logpath"$filter" --time-start $timestart --time-end $timeend --output json --query "data.results [*].{data:data.logContent}" > searchoutput1.0.json
jq -r '.[].data.data.requestProtection.matchedIds' searchoutput1.0.json > matchedIds_1.0.txt
sed -i 's/;/\n/g' matchedIds_1.0.txt
sed -i 's/_/ /g' matchedIds_1.0.txt
cat matchedIds_1.0.txt | sort -u > matchedIds_unique_1.0.txt
cat matchedIds_unique_1.0.txt
