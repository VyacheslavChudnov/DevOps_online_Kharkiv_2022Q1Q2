# Python Intro - Task8

***
___Exercise 1.___ _Write easy program, which will display current date and time._

*Python code:*
```
import datetime
e = datetime.datetime.now()
print ("Current date and time = %s" % e)
```
*Result:*
```
Current date and time = 2022-05-24 18:49:57.060852
[Finished in 142ms]
```
***
___Exercise 2.___ _Write python program, which will accept comma-separated numbers, and then it 
should write tuple and list of them:_

*Python code:*
```
arr = list(input("Enter numbers: ").split(','))
arr2 = []
for i in arr:
	a = i.strip()
	arr2.append(a)
print(f"Output: \nList: {arr2}")
tuple1 = tuple(arr2)
print(f"Tuple: {tuple1}")
```
*Result:*
```
Enter numbers: 1,2,7,43,9
Output: 
List: [‘1’, ‘2’, ‘7’, ‘43’, ‘9’] 
Tuple: (‘1’, ‘2’, ‘7’, ‘43’, ‘9’)
```
***
___Exercise 3.___ _Write python program, which will ask file name. File should be read, and only even
lines should be shown._

*Python code:*
```
filename = 'numbers.txt'
with open(filename) as file_object:
	for number, text in enumerate(file_object):
		if number % 2 != 0:
			print(text.rstrip())
```
File **numbers.txt** consists of numbers from 1 to 20 in a column.

*Result:*
```
2
4
6
8
10
12
14
16
18
20
[Finished in 122ms]
```
***
___Exercise 4.___ _Write python program, which should read html document, parse it, and show it’s
title._

*Python code:*
```
pip install beautifulsoup4

from bs4 import BeautifulSoup

with open("doc.html") as fp:
    soup = BeautifulSoup(fp, "html.parser")
    print (soup.title.get_text())
```
**doc.html** file contains:
```
<html>
<head>
  <title>Head's title</title>
</head>

<body>
  <p class="title"><b>Body's title</b></p>
  <p class="story">line begins
    <a href="http://example.com/element1" class="element" id="link1">1</a>
    <a href="http://example.com/element2" class="element" id="link2">2</a>
    <a href="http://example.com/avatar1" class="avatar" id="link3">3</a>
  <p> line ends</p>
</body>
</html>
```
*Result:*
```
Head's title
[Finished in 342ms]
```
***
___Exercise 5.___ _Write python program, which will parse user’s text, and replace some emotions with
emoji’s (Look: pip install emoji)._

*Python code:*
```
import emoji

with open('emotions.txt') as file:
	content = file.read()
replace = emoji.emojize(content)
print(emoji.emojize(content, language='alias'))
```
**emotions.txt** file contains:
```
Привет! :) :grinning_face_with_big_eyes:
Как твои дела?
:thumbs_up:
```
*Result:*
```
Привет! :) 😃
Как твои дела?
👍
[Finished in 203ms]
```
***
___Exercise 6.___ _Write program, that will show basic PC information (OS, RAM amount, HDD’s, and
etc.)_

*Python code:*
```
import platform, psutil

#Computer network name
print(f"Computer network name: {platform.node()}")
#Machine type
print(f"Machine type: {platform.machine()}")
#Processor type
print(f"Processor type: {platform.processor()}")
#Platform type
print(f"Platform type: {platform.platform()}")
#Operating system
print(f"Operating system: {platform.system()}")
#Operating system release
print(f"Operating system release: {platform.release()}")
#Operating system version
print(f"Operating system version: {platform.version()}")
#Physical cores
print(f"Number of physical cores: {psutil.cpu_count(logical=False)}")
#Logical cores
print(f"Number of logical cores: {psutil.cpu_count(logical=True)}")
#Current frequency
print(f"Current CPU frequency: {psutil.cpu_freq().current}")
#Min frequency
print(f"Min CPU frequency: {psutil.cpu_freq().min}")
#Max frequency
print(f"Max CPU frequency: {psutil.cpu_freq().max}")
#System-wide CPU utilization
print(f"Current CPU utilization: {psutil.cpu_percent(interval=1)}")
#System-wide per-CPU utilization
print(f"Current per-CPU utilization: {psutil.cpu_percent(interval=1, percpu=True)}")
#Total RAM
print(f"Total RAM installed: {round(psutil.virtual_memory().total/1000000000, 2)} GB")
#Available RAM
print(f"Available RAM: {round(psutil.virtual_memory().available/1000000000, 2)} GB")
#Used RAM
print(f"Used RAM: {round(psutil.virtual_memory().used/1000000000, 2)} GB")
#RAM usage
print(f"RAM usage: {psutil.virtual_memory().percent}%")
import shutil

total, used, free = shutil.disk_usage("/")

print("Total: %d GiB" % (total // (2**30)))
print("Used: %d GiB" % (used // (2**30)))
print("Free: %d GiB" % (free // (2**30)))
obj_Disk = psutil.disk_usage('/')

print (obj_Disk.total / (1024.0 ** 3))
print (obj_Disk.used / (1024.0 ** 3))
print (obj_Disk.free / (1024.0 ** 3))
print (obj_Disk.percent)
print(psutil.disk_partitions())
```
*Result:*
```
Computer network name: DESKTOP-BMBBR6O
Machine type: AMD64
Processor type: Intel64 Family 6 Model 69 Stepping 1, GenuineIntel
Platform type: Windows-10-10.0.17763-SP0
Operating system: Windows
Operating system release: 10
Operating system version: 10.0.17763
Number of physical cores: 2
Number of logical cores: 4
Current CPU frequency: 2000.0
Min CPU frequency: 0.0
Max CPU frequency: 2001.0
Current CPU utilization: 10.9
Current per-CPU utilization: [18.5, 14.1, 12.5, 15.6]
Total RAM installed: 8.48 GB
Available RAM: 1.7 GB
Used RAM: 6.78 GB
RAM usage: 80.0%
Total: 345 GiB
Used: 106 GiB
Free: 238 GiB
345.57226181030273
106.93290328979492
238.6393585205078
30.9
[sdiskpart(device='C:\\', mountpoint='C:\\', fstype='NTFS', opts='rw,fixed', maxfile=255, maxpath=260), sdiskpart(device='D:\\', mountpoint='D:\\', fstype='NTFS', opts='rw,fixed', maxfile=255, maxpath=260), sdiskpart(device='E:\\', mountpoint='E:\\', fstype='NTFS', opts='rw,fixed', maxfile=255, maxpath=260)]
[Finished in 2.3s]
```