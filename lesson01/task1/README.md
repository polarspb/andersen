## Task

### Turn this one-liner into a nice script:
```
sudo netstat -tunapl | awk '/firefox/ {print $5}' | cut -d: -f1 | sort | uniq -c | sort | tail -n5 | grep -oP '(\d+\.){3}\d+' | while read IP ; do whois $IP | awk -F':' '/^Organization/ {print $2}' ; done
```

## Solution 

The script displays active TCP connections, ports on which the computer is listening, Ethernet statistics, IP address routing table, IPv4 statistics (for IP, ICMP, TCP, and UDP protocols), and IPv6 statistics (for IPv6, ICMPv6, TCP over IPv6, and UDP over IPv6).

1. If you want to see all information. You need input "ALL"
2. If you want to see information about name, status, IP, PID, you need input it.
3. If you will not input params you get error message "Error. Input text...".

```
Example

If You input "firef" or "firefox" or "fire"
You take all information about Firefox.

If you input "zabb" or "zab" or "zabbix"
You take all information about zabbix

If you know IP or PID, I input it "192.168." or "543"(PID) and get all information.
```
