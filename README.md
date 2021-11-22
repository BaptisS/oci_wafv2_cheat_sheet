# oci_wafv2_cheat_sheet


# Enable all protection rules (Check Mode) 

1.1.2- Copy and Paste (CTRL+SHIFT+’V’) the command below in your Cloud Shell session : 

(Replace ‘ocid1.webappfirewallpolicy.oc1.aabbccdd123’ by your WAF Policy OCID - copied in the previous step.)


```
export wafpolid=ocid1.webappfirewallpolicy.oc1.aabbccdd123

wget https://raw.githubusercontent.com/BaptisS/oci_wafv2_cheat_sheet/main/reqprot_in_v1.4.json

oci waf web-app-firewall-policy update --web-app-firewall-policy-id $wafpolid --request-protection file:///reqprot_in_v1.4.json
```
