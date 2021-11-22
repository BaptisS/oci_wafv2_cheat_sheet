# oci_wafv2_cheat_sheet


# Enable all protection rules in Check Mode 

1.1.2- Copy and Paste (CTRL+SHIFT+’V’) the command below in your Cloud Shell session : 

(Replace ‘ocid1.webappfirewallpolicy.oc1.aabbccdd123’ by your WAF Policy OCID - copied in the previous step.)


```
export wafpolid=ocid1.webappfirewallpolicy.oc1.aabbccdd123

wget https://raw.githubusercontent.com/BaptisS/oci_wafv2_cheat_sheet/main/reqprot_in_v1.4.json

oci waf web-app-firewall-policy update --web-app-firewall-policy-id $wafpolid --request-protection file:///reqprot_in_v1.4.json
```

# Extract Matched Protection Rules ID from Logs  

1.1.2- Copy and Paste (CTRL+SHIFT+’V’) the command below in your Cloud Shell session : 

(Replace first three variables with your own values.)


```
export timestart='2021-11-22T11:00Z'
export timeend='2021-11-22T16:00Z'
export logpath='"ocid1.compartment.oc1..aabbccdd112233/ocid1.loggroup.oc1.aabbccdd112233/ocid1.log.oc1.aabbccdd112233"'

export query="search"
export filter=" | isNotNull(data.requestProtection.matchedIds) | sort by datetime desc" 

oci logging-search search-logs --search-query $query$logpath"$filter" --time-start $timestart --time-end $timeend --output json --query "data.results [*].{data:data.logContent}" > searchoutput1.0.json

jq -r '.[].data.data.requestProtection.matchedIds' searchoutput1.0.json > matchedIds_1.0.txt
sed -i 's/;/\n/g' matchedIds_1.0.txt
sed -i 's/_/ /g' matchedIds_1.0.txt
cat matchedIds_2.0.txt | sort -u > matchedIds_unique_1.0.txt
cat matchedIds_unique_2.0.txt

```
