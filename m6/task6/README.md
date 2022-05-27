# Linux administration with Bash - Task6
***
___Exercise A.___ _Create a script that uses the following keys:_

1. When starting without parameters, it will display a list of possible keys and their description;
2. The **--all** key displays the IP addresses and symbolic names of all hosts in the current subnet;
3. The **--target** key displays a list of open system TCP ports.

_The code that performs the functionality of each of the subtasks must be placed in a separate function._

**Bash code:**
```
#!/bin/bash
function net {
nmap -sn -R 192.168.10.202
}
function port {
netstat -at -n
}
if [ "$1" == "--all" ]
then
net
elif [ "$1" == "--target" ]
then
port
else
echo "You must enter the key:
key --all displays the IP addresses and symbolic names of all hosts in the current subnet
key --target displays a list of open system TCP ports
Examples: ./lab6A.sh --all OR ./lab6A.sh --target"
fi
```
**Result:**
```
slava@ubnvm1:~$ ./lab6A.sh
You must enter the key:
key --all displays the IP addresses and symbolic names of all hosts in the current subnet
key --target displays a list of open system TCP ports
Examples: ./lab6A.sh --all OR ./lab6A.sh --target
slava@ubnvm1:~$
slava@ubnvm1:~$
slava@ubnvm1:~$
slava@ubnvm1:~$ ./lab6A.sh --all
Starting Nmap 7.80 ( https://nmap.org ) at 2022-05-25 12:07 EEST
Nmap scan report for ubnvm1 (192.168.10.202)
Host is up (0.00012s latency).
Nmap done: 1 IP address (1 host up) scanned in 0.06 seconds
slava@ubnvm1:~$
slava@ubnvm1:~$
slava@ubnvm1:~$
slava@ubnvm1:~$ ./lab6A.sh --target
Active Internet connections (servers and established)
Proto Recv-Q Send-Q Local Address           Foreign Address         State
tcp        0      0 127.0.0.53:53           0.0.0.0:*               LISTEN
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN
tcp        0      0 127.0.0.1:6010          0.0.0.0:*               LISTEN
tcp        0      0 127.0.0.1:33060         0.0.0.0:*               LISTEN
tcp        0      0 127.0.0.1:27017         0.0.0.0:*               LISTEN
tcp        0      0 127.0.0.1:3306          0.0.0.0:*               LISTEN
tcp        0      0 192.168.10.202:22       192.168.10.110:59279    ESTABLISHED
tcp        0     48 192.168.10.202:22       192.168.10.110:57378    ESTABLISHED
tcp6       0      0 :::22                   :::*                    LISTEN
tcp6       0      0 ::1:6010                :::*                    LISTEN
slava@ubnvm1:~$
```
***
___Exercise B.___ _Using Apache log example create a script to answer the following questions:_
1. From which ip were the most requests?
2. What is the most requested page?
3. How many requests were there from each ip?
4. What non-existent pages were clients referred to?
5. What time did site get the most requests?
6. What search bots have accessed the site? (UA + IP)

**Bash code:**
```
#!/bin/bash
#
echo 1\) Most requests from IP:
#grep -E -o "(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)" apache_logs.txt | sort | uniq -c | sort -n | tail -n1
awk '{print $1}' apache_logs.txt | sort | uniq -c | sort -n | tail -n1
echo
echo 2\) Most requested page:
#grep -Eo 'https?://.*' apache_logs.txt | sort | uniq -c | sort -n | tail -n1
awk '{print $7}' apache_logs.txt | sort | uniq -c | sort -n | tail -n1
echo
echo 3\) Number of requests from each IP:
#grep -E -o "(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)" apache_logs.txt | sort | uniq -c | sort -n
awk '{print $1}' apache_logs.txt | sort | uniq -c | sort -n
echo
echo 4\) Clients referred to non-existent pages:
grep -E 'HTTP/1.[01]" 404' example_log.log | awk '{print $7}' | sort | uniq -c | sort -n
echo
echo 5\) Site get more requests at:
awk '{print $4, $5}' apache_logs.txt | sort | uniq -c | sort | tail -n15
echo
echo 6\) Search bots have accessed the site:
awk '$7 ~ /robots.txt/' example_log.log | cut -d ' ' -f1,12-
```
**Result:**
```
slava@ubnvm1:~$ ./lab6B.sh
1) Most requests from IP:
     62 157.55.39.250

2) Most requested page:
      8 /sitemap1.xml.gz

3) Number of requests from each IP:
      1 185.53.44.186
      1 213.87.151.38
      1 217.69.134.11
      1 217.69.134.12
      1 217.69.134.13
      1 217.69.134.15
      1 217.69.134.39
      1 5.255.253.45
      1 5.255.253.74
      1 66.249.69.39
      1 66.249.78.65
      1 66.249.78.72
      1 93.158.178.129
      1 95.108.158.190
      2 157.55.39.182
      2 217.69.134.29
      2 66.249.78.58
      3 37.140.141.30
      4 157.55.39.174
      7 176.59.119.104
     10 178.76.227.154
     34 207.46.13.48
     61 46.29.2.62
     62 157.55.39.250

4) Clients referred to non-existent pages:
      1 /apple-touch-icon.png
      1 /apple-touch-icon-precomposed.png
      1 /backup/info.php
      1 /ehsteticheskaya-medicina/injekcii/biorevitalizaciya/preparaty-dlya-biorevitalizacii.html/register.aspx
      1 /ehsteticheskaya-medicina/injekcii/biorevitalizaciya/register.aspx
      1 /ehsteticheskaya-medicina/injekcii/register.aspx
      1 /ehsteticheskaya-medicina/register.aspx
      1 /google89150ef520da50eb.html
      1 /otzivi-obzori/yuviderm-otzivi-obzori/yuviderm-ne-ochen-dovolna-22-goda.html
      1 /register.aspx
      1 /rtc_wizard_index.htm
      1 /sxd/info.php
      1 /ukhod-z
      1 /ukhod-za-soboj/pokhudenie/dieti/dieta-grechnevaya-s-kefirom.html%D1%87%D0%B8%D1%82%D0%B0%D0%B9
      1 /ukhod-za-soboj/pokhudenie/dieti/map.css
      1 /wp-content/plugins/stats-counter/img/icon.png
      1 /wp-content/themes/cassia/css/fonts/flexslider-icon.svg
      1 /wp-content/themes/cassia/css/fonts/flexslider-icon.ttf
      1 /wp-content/themes/cassia/css/fonts/flexslider-icon.woff
      2 /
      2 /.bash_history
      2 /.bzr/branch-format
      2 /.git/config
      2 /.hg/hgrc
      2 /LISU.ttf
      2 /LISU.woff
      2 /.svn/format
      2 /.svn/wc.db
     10 /wp-content/themes/cassia/css/fonts/flexslider-icon.eot?

5) Site get more requests at:
      4 [30/Sep/2015:02:26:26 +0300]
      4 [30/Sep/2015:02:26:50 +0300]
      4 [30/Sep/2015:02:26:54 +0300]
      5 [30/Sep/2015:00:42:46 +0300]
      5 [30/Sep/2015:02:10:46 +0300]
      5 [30/Sep/2015:02:25:50 +0300]
      5 [30/Sep/2015:02:25:52 +0300]
      5 [30/Sep/2015:02:25:53 +0300]
      5 [30/Sep/2015:02:25:54 +0300]
      5 [30/Sep/2015:02:26:23 +0300]
      5 [30/Sep/2015:02:26:24 +0300]
      5 [30/Sep/2015:02:26:51 +0300]
      5 [30/Sep/2015:02:26:52 +0300]
      5 [30/Sep/2015:02:26:53 +0300]
      5 [30/Sep/2015:02:26:55 +0300]

6) Search bots have accessed the site:
5.255.251.28 "Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)"
89.145.95.69 "Mozilla/5.0 (compatible; GrapeshotCrawler/2.0; +http://www.grapeshot.co.uk/crawler.php)"
217.69.133.70 "Mozilla/5.0 (compatible; Linux x86_64; Mail.RU_Bot/2.0; +http://go.mail.ru/help/robots)"
199.16.157.182 "Twitterbot/1.0"
217.69.133.234 "Mozilla/5.0 (compatible; Linux x86_64; Mail.RU_Bot/2.0; +http://go.mail.ru/help/robots)"
144.76.76.115 "Mozilla/5.0 (compatible; MJ12bot/v1.4.7; http://mj12bot.com/)"
144.76.76.115 "Mozilla/5.0 (compatible; MJ12bot/v1.4.7; http://mj12bot.com/)"
217.69.133.234 "Mozilla/5.0 (compatible; Linux x86_64; Mail.RU_Bot/2.0; +http://go.mail.ru/help/robots)"
slava@ubnvm1:~$
```
***
___Exercise C.___ _Create a data backup script that takes the following data as parameters:_

1. Path to the syncing  directory;
2. The path to the directory where the copies of the files will be stored.

_In case of adding new or deleting old files, the script must add a corresponding entry to the log file
indicating the time, type of operation and file name. [The command to run the script must be added to
crontab with a run frequency of one minute]_

