## Task

### Turn this one-liner into a nice script:
```
sudo netstat -tunapl | awk '/firefox/ {print $5}' | cut -d: -f1 | sort | uniq -c | sort | tail -n5 | grep -oP '(\d+\.){3}\d+' | while read IP ; do whois $IP | awk -F':' '/^Organization/ {print $2}' ; done
```

## Solution 

The script read IP from netstat and displays information about Organization, Address, City, Country of input process

```
Example

Input process name or PID:

Input "firef" or "firefox" or PID and get this information

-----------------------------------------------
Organization:   Google LLC (GOOGL-2)
Address:        1600 Amphitheatre Parkway
City:           Mountain View
Country:        US
Organization:   Amazon Technologies Inc. (AT-88-Z)
Address:        410 Terry Ave N.
City:           Seattle
Country:        US
Organization:   Amazon.com, Inc. (AMAZON-4)
Address:        1918 8th Ave
City:           SEATTLE
Country:        US
Organization:   Amazon Technologies Inc. (AT-88-Z)
Address:        410 Terry Ave N.
City:           Seattle
Country:        US
Organization:   Amazon.com, Inc. (AMAZON-4)
Address:        1918 8th Ave
City:           SEATTLE
Country:        US
-----------------------------------------------
Connections: 2    Amazon.com, Inc. (AMAZON-4)
Connections: 2    Amazon Technologies Inc. (AT-88-Z)
Connections: 1    Google LLC (GOOGL-2)
-----------------------------------------------
```
### P.S.

If you will not input params you get error message "Error. Input text...".
