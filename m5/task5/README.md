# Linux Networking - Task5
***
### Network Topology is shown below

![Network Topology](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m5/task5/screenshots_for_task5/001_network_topology.jpg)

* _Int1, Int2 and Int3 Network interfaces Server_1 are configured as a Static;_
* _Server_1 is configured as a DHCP for Int1 and Int3 interfaces;_
* _Int1 Network interfaces for Client_1 and Client_2 are configured as a DHCP Client and obtain IP addresses from Server_1 configured as a DHCP server;_
* _Int2 Network interfaces for Client_1 and Client_2 are configured as a Static;_
***
### To configure IP addresses for Linux Ubuntu starting with 18.04 without installing additional tools need to make changes in ___/etc/netplan/*.yaml___ file as shown below:

![Configure IP](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m5/task5/screenshots_for_task5/002_configure_ip.jpg)
***
To apply changes use commands:

```
$ sudo netplan generate
$ sudo netplan apply
```

To restart network service use command:

```
$ sudo systemctl restart systemd-networkd
```

### To configure DHCP server need install dhcp server ___$ sudo apt install isc-dhcp-server___ and ___edit /etc/dhcp/dhcpd.conf___ as shown below:

![Configure DHCP](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m5/task5/screenshots_for_task5/003_configure_dhcp.jpg)
Also need to edit ___/etc/default/isc-dhcp-server___ file to specify the interfaces dhcpd should listen to.
After changing need restart the dhcpd service: ___$ sudo systemctl restart isc-dhcp-server.service___.
The DHCP service status can be viewed using the command ___$ sudo systemctl status isc-dhcp-server.service___.

To enable client interfaces to obtain an IPv4 address, you must specify dhcp: __true__ or __yes__.

***
### You can verify that clients have obtained IP addresses using the command: ___$ dhcp-lease-list___ as shown below:

![Leased IPs](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m5/task5/screenshots_for_task5/004_leased_ip.jpg)
***
### After proper configuration need to check the connection between clients using the ___ping___ and ___traceroute___ commands:

![Ping and Traceroute](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m5/task5/screenshots_for_task5/005_ping_traceroute.jpg)

To enable routing between interfaces on the Server_1, edit **/etc/sysctl.conf** file.
***
### Since client subnets have been added on the router we can ping Internet IP addresses and domain names 

![Ping Cisco](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m5/task5/screenshots_for_task5/006_ping_cisco.jpg)
***
Add 172.17.14.1 and 172.17.24.1 IP addresses on loopback interface for Client_1:
```
lo:
        match:
            name: lo
        addresses: [172.17.14.1/24, 172.17.24.1/24]
```
Add correct route via the interface Int2(enp0s8) to ping 172.17.24.1 via Net4 on Client_2:
```
enp0s8:
      dhcp4: false
      dhcp6: false
      addresses: [172.16.4.2/24]
      routes:
       - to: 172.17.24.0/24
         via: 172.16.4.1
```
To ping 172.17.14.1 via Net3 on Client_2 nothing needs to be done since the default route already points to this network.
***
### Checking routing with the **traceroute** route command

![Checking routes](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m5/task5/screenshots_for_task5/007_check_routes.jpg)

To summarizing the subnets 172.17.14.0/24 and 172.17.24.0/24 with the nearest mask we must use the subnetwork 172.17.0.0 with the mask /19 (255.255.224.0). For traffic to pass through Net2 we must remove the route to 172.17.24.0 from Client_2 and add a summary route to Server_1. There is no need to add routes on Client_2 because the default route points to Server_1.
***
To configure the iptable firewall on the Server_1, we first need to allow all initialized connections:

```
sudo iptables -A INPUT -p all -m state --state ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A OUTPUT -p all -m state --state ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A FORWARD -p all -m state --state ESTABLISHED,RELATED -j ACCEPT
```
To gain ssh access from Client_1 but block ssh from Client_2, we can use several methods. Add allow rule for Client_1 and block all others include ssh from Client_2:
```
sudo iptables -A INPUT -p tcp -s 10.75.4.10/255.255.255.255 --dport 22 -j ACCEPT
sudo iptables -A INPUT -j DROP
```
OR

Block all traffic for INPUT table by default, but only allow ssh from Client_1:
```
sudo iptables -P INPUT DROP
sudo iptables -A INPUT -p tcp -s 10.75.4.10/255.255.255.255 --dport 22 -j ACCEPT
```
To allow icmp packets from Client_2 to Client_1 to IP address 172.17.14.1 but block to IP address 172.17.24.1, we can block icmp echo requests on Client_1:
```
sudo iptables -A INPUT -p icmp --icmp-type echo-request -s 10.1.75.10/255.255.255.255 -d 172.17.24.1/255.255.255.255 -j DROP
```
***
To configure NAT for all LAN addresses we can use the following commands on the Server_1:
```
sudo iptables -t nat -A POSTROUTING -j MASQUERADE
```
OR

Only for network 10.0.0.0/8 via IP address 192.168.0.202
```
sudo iptables -t nat -A POSTROUTING -s 10.0.0.0/8 -j SNAT --to-source 192.168.0.202
```
To test the operation of NAT, you need to delete previously added routes on the router and ping from Client_1 and Client_2, for example, to the address 8.8.8.8. We can also run the traceroute 8.8.8.8 command to confirm that NAT is working on Server_1.
***