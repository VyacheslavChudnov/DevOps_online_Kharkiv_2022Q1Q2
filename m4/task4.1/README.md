# Linux - Task4.1

# Part 1
***
## Login to the Linux

![Login](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m4/task4.1/screenshots_for_task4.1/task4.1/001_Login.jpg)
***
## Change password with passwd command

![Change password](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m4/task4.1/screenshots_for_task4.1/002_Change_password.jpg)

### Command passwd has many options:
```
  -a, --all                     report password status on all accounts
  -d, --delete                  delete the password for the named account
  -e, --expire                  force expire the password for the named account
  -h, --help                    display this help message and exit
  -k, --keep-tokens             change password only if expired
  -i, --inactive INACTIVE       set password inactive after expiration to INACTIVE
  -l, --lock                    lock the password of the named account
  -n, --mindays MIN_DAYS        set minimum number of days before password change to MIN_DAYS
  -q, --quiet                   quiet mode
  -r, --repository REPOSITORY   change password in REPOSITORY repository
  -R, --root CHROOT_DIR         directory to chroot into
  -S, --status                  report password status on the named account
  -u, --unlock                  unlock the password of the named account
  -w, --warndays WARN_DAYS      set expiration warning days to WARN_DAYS
  -x, --maxdays MAX_DAYS        set maximum number of days before password change to MAX_DAYS
```
Changing the password changes the **/etc/shadow** system file which contains the passwords hash
***
Command **who** determines users registered in the system and command **w** shows what command they execute
Also these commands show login and idle time and IP address if user connect from network
***
Command **chfn** allows change personal information about user (name, phone, office and etc.)
***
### Commands **help** **man** and **info** are Linux help system commands
Command **help** is a bash command. It uses internal bash structures to store and retrieve information about bash commands.
Command **man** is typically a single page that contains all information.
Command **info** is more structured and is composed of multiple pages that you can browse through using links.
***
### Examples Linux help system commands

##### Command **$ man --help**
![$ man help](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m4/task4.1/screenshots_for_task4.1/003_man_help.jpg)

##### Command **$ info man**
![$ info man](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m4/task4.1/screenshots_for_task4.1/004_info_man.jpg)

##### Command **$ man info**
![$ man info](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m4/task4.1/screenshots_for_task4.1/005_man_info.jpg)
***
##### For searching by keyword you'd use parameter -k:
**$ man -k passwd**
![$ man -k passwd](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m4/task4.1/screenshots_for_task4.1/006_man_passwd.jpg)

#### To read man about file /etc/passwd (not about command passwd), you’d use section number:
**$ man 5 passwd**
![$ man 5 passwd](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m4/task4.1/screenshots_for_task4.1/007_man_5_passwd.jpg)

#### Usind command **less**
![command less](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m4/task4.1/screenshots_for_task4.1/008_less.jpg)

#### Usind command **more**
![command more](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m4/task4.1/screenshots_for_task4.1/009_more.jpg)

#### Usind command **finger**
![$ finger -lmsp](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m4/task4.1/010_finger.jpg)

#### Usind command **ls**
![comman ls](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m4/task4.1/011_ls.jpg)
***
# Part 2
***
#### Examine the **tree** command

![command tree](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m4/task4.1/012_tree.jpg)
***
For determine the type of file use command **file**:

**$ file text.txt**
**text.txt: ASCII text**

**$ file /home/slava**
**/home/slava: directory**
***
We can use **cd /home/user** command for absolute path or **cd user** command using relative path if we are in the folder **/home**
For return in the home directory from from anywhere in the filesystem we can use command **cd** or **cd~**
***
#### Usind command **ls**
![comman ls](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m4/task4.1/011_ls.jpg)
***
### Perform the following sequence of operations:

Creating a subdirectory in the home directory:
**slava@ubnvm1:~$ mkdir test**

Creating a file containing information about directories located in the root directory (using I/O redirection operations):
**slava@ubnvm1:~/test$ tree / -d -L 1 -o roottree.txt**
**slava@ubnvm1:~/test$ nano roottree.txt**

Copyng the created file to your home directory using relative and absolute addressing:
**slava@ubnvm1:~/test$ cp roottree.txt /home/slava/roottree.txt**
**slava@ubnvm1:~$ cp test/roottree.txt roottree.txt**

Deleting the previously created subdirectory with the file requesting removal:
**slava@ubnvm1:~$ rm -r -i test**

Deleting the file copied to the home directory:
**slava@ubnvm1:~$ rm roottree.txt**
***
## Perform the following sequence of operations:

Creating a subdirectory test in the home directory:
**slava@ubnvm1:~$ mkdir test**

Copying the .bash_history file to this directory while changing its name to labwork2:
**slava@ubnvm1:~$ cp .bash_history /home/slava/test/labwork2**

#### Creating a hard and soft link to the labwork2 file in the test subdirectory

![command ln](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m4/task4.1/013_ln.jpg)

Hard link is just another name for the original file. If you delete one of these files (more precisely one of these names), then the file is 
still saved on disk (as long as it has at least one link name).

Soft link is just a link to the original file. If the original file is deleted, the symbolic link is not removed, but is useless.
Unlike hard links, symbolic links can point to files located in a different file system, such as a mountable medium, or even on another computer.

Changing the data by opening a symbolic link will change original file because Hard link and Soft link connect with original file.

Renaming the hard link file to **hard_lnk_labwork2**:
**slava@ubnvm1:~/test$ mv link_on_labwork2 hard_lnk_labwork2**

Renaming the soft link file to **symb_lnk_labwork2** file:
**slava@ubnvm1:~/test$ mv softlink_on_labwork2 symb_lnk_labwork2**

Deleting the labwork2:
**slava@ubnvm1:~/test$ rm labwork2**

Command **ls** shows **symb_lnk_labwork2** now light red because useless.
***
#### Using  the  locate  utility,  find  all  files  that  contain  the  squid  and  traceroute sequence

![locate](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m4/task4.1/014_locate.jpg)
***
#### Determine which partitions are mounted in the system, as well as the types of these partitions

![partitions](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m4/task4.1/015_partitions.jpg)
***
Countig the number of lines containing a sequence of **2** in a **test222.txt** file:
**slava@ubnvm1:~$ grep 2 test222.txt | wc -l**
***
Using the **find** command, find all files in the **/etc** directory containing the **host** character sequence
**slava@ubnvm1:/$ find /etc -maxdepth 1 -name *host* **
***
Listing all objects in /etc that contain the **ss** character sequence:
**slava@ubnvm1:/etc$ ls -d *ss**
***
Listing all objects in /etc that contain the **ss** character sequence using **grep**:
**slava@ubnvm1:/etc$ ls | grep ss**
***
Organizing a screen-by-screen print of the contents of the **/etc** directory:
**slava@ubnvm1:/etc$ ls -l > /home/slava/test/out.txt**
***
Determining the type of device:
**slava@ubnvm1:~$ ls -l /dev**
***
Determining the type of file in the system:
**slava@ubnvm1:~$ file filename**
***
Listing the first 5 directory files that were recently accessed in the **/etc** directory:
**slava@ubnvm1:/etc$ sudo find /etc/ -atime +1 | head -n 5**
***