# Linux Networking - Task5
***
### Network Topology is shown below

![Network Topology](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m5/task5/screenshots_for_task5/001_network_topology.jpg)

* _Int1, Int2 and Int3 Network interfaces Server_1 are configured as a Static;_
* _Server_1 is configured as a DHCP for Int1 and Int2 interfaces;_
* _Int1 Network interfaces Client_1 and Client_2 are configured as a DHCP Client and obtain IP addresses from Server1 configured as a DHCP server;_
* _Int2 Network interfaces Client_1 and Client_2 are configured as a Static;_
***
### To configure IP addresses for Linux Ubuntu starting with 18.04 without installing additional tools, need to make changes in ___/etc/netplan/*.yaml___ file as shown below:

![Configure IP](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m5/task5/screenshots_for_task5/002_configure_ip.jpg)
***
### To configure DHCP server need install dhcp server ___$ sudo apt install isc-dhcp-server___ and ___edit /etc/dhcp/dhcpd.conf___ as show below:

![Configure DHCP](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m5/task5/screenshots_for_task5/003_configure_dhcp.jpg)
Also need to edit ___/etc/default/isc-dhcp-server___ file to specify the interfaces dhcpd should listen to.
After changing need restart the dhcpd service: ___$ sudo systemctl restart isc-dhcp-server.service___.
The DHCP service status can be viewed using the command ___$ sudo systemctl status isc-dhcp-server.service___.

To enable client interfaces as DHCP to obtain an IPv4 address, you must specify dchp: __true__ or __yes__.

***
### You can verify that clients have obtained IP addresses using the command: **$ dhcp-lease-list as shown below**:

![Leased IPs](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m5/task5/screenshots_for_task5/004_leased_ip.jpg)
***
### After proper configuration, need to check the connection between clients using the **ping** and **traceroute** commands:

![Ping and Traceroute](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m5/task5/screenshots_for_task5/005_ping_traceroute.jpg)

To enable routing between interfaces on the Server_1, edit the **/etc/sysctl.conf** file.
***
### Since client subnets have been added on the router, we can ping domain IP addresses and domain names on the Internet

![Ping Cisco](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m5/task5/screenshots_for_task5/006_ping_cisco.jpg)

For the loopback interface Client_1 add two IP addresses 172.17.14.1 and 172.17.24.1:
```
lo:
        match:
            name: lo
        addresses: [172.17.14.1/24, 172.17.24.1/24]
```
_To ping to 172.17.24.1 via Net4 on Client_2, you need to add a route via the interface Int2(enp0s8):_
```
enp0s8:
      dhcp4: false
      dhcp6: false
      addresses: [172.16.4.2/24]
      routes:
       - to: 172.17.24.0/24
         via: 172.16.4.1
```
To ping to 172.17.14.1 via Net3 on Client_2, nothing needs to be done, since the default route already points to this network.
***
### Checking routing with the **traceroute** route command

![Checking routes](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m5/task5/screenshots_for_task5/007_check_routes.jpg)

To summarizing the subnets 172.17.14.0/24 and 172.17.24.0/24 with the nearest mask, you must use the subnetwork 172.17.0.0 with the mask /19 (255.255.224.0). For traffic to pass through Net2, you must remove the route to 172.17.24.0 from Client_2 and add a summation route to Server_1. There is no need to add routes on Client_2 because the default route points to Server_1.
***