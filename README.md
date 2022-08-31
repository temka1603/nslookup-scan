# Nslookup scan of subnet
Scan subnet type equal **/24 mask** (ip address example range 0.0.0.1-254)
Using tool nslookup getting all names, output in file
Data format:
```
10.10.10.1, domain.com
10.10.10.5, up.domain.com secondup.domain.com
```

Usage example:
--------------
Example of scan of subnet **10.10.10.0/24**
```
chmod +x FGDS.sh
./nslookup_scan.sh 10.10.10
```

**If you want scan more hosts:**
Example of range 10.10.65-95.1-254 (10.10.64.0/19)
```
for octet in {64..95}; do ./nslookup_scan.sh 10.10.$octet; done
```
