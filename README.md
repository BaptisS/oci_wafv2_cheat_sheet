# oci_wafv2_cheat_sheet

# Export Policy settings

1.1.2- Copy and Paste (CTRL+SHIFT+’V’) the command below in your Cloud Shell session : 

(Replace ‘ocid1.webappfirewallpolicy.oc1.aabbccdd123’ by your WAF Policy OCID - copied in the previous step.)


```
export wafpolid=ocid1.webappfirewallpolicy.oc1.aabbccdd123
export exportfilename='wafv2-policy-export.json'

oci waf web-app-firewall-policy get --web-app-firewall-policy-id $wafpolid | jq -r '.[]' > $exportfilename

sed -i '$d' $exportfilename
sed -i '$d' $exportfilename
sed -i '$d' $exportfilename
sed -i '$d' $exportfilename
sed -i '$ s/.$//' $exportfilename 
sed -i '/"id"/d' $exportfilename 
sed -i '/"id"/d' $exportfilename 
sed -i '/"lifecycle-details"/d' $exportfilename
sed -i '/"lifecycle-state"/d' $exportfilename
echo '}' >> $exportfilename
```

oci waf web-app-firewall-policy create --from-json file://wafv2-policy-export.json

# Create new policy from export file

1.1.2- Copy and Paste (CTRL+SHIFT+’V’) the command below in your Cloud Shell session : 

(Replace ‘ocid1.webappfirewallpolicy.oc1.aabbccdd123’ by your WAF Policy OCID - copied in the previous step.)


```
oci waf web-app-firewall-policy create --from-json file://wafv2-policy-export.json
```


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

wget https://raw.githubusercontent.com/BaptisS/oci_wafv2_cheat_sheet/main/matchedids.sh
chmod +x matchedids.sh

./matchedids.sh

```

# List Protection Rules 

1.1.2- Copy and Paste (CTRL+SHIFT+’V’) the command below in your Cloud Shell session : 

(Replace compartment-id ocid1.compartment.oc1..aabbccdd112233 with your own value.)


```

oci waf protection-capability list --compartment-id ocid1.compartment.oc1..aabbccdd112233 --all --output table --query "data.items [*].{ProtectionRuleID:key, Name:\"display-name\"}" 


```
