# Linux - Task4.2
***
___Exercise 1.___ _Analyze the structure of the /etc/passwd and /etc/group file, what fields are present in it, what users exist on the system? Specify several pseudo-users, how to define them?_

The **/etc/passwd** file contains the following fields:
```
Username: It is used when user logs in. It should be between 1 and 32 characters in length;
Password: An x character indicates that encrypted password is stored in /etc/shadow file;
User ID (UID): Each user must be assigned a user ID (UID). UID 0 (zero) is reserved for root and UIDs 1-99 are reserved for other predefined accounts. Further UID 100-999 are reserved by system for administrative and system accounts/groups;
Group ID (GID): The primary group ID (stored in /etc/group file)
User ID Info (): The comment field. It allow you to add extra information about the users such as user’s full name, phone number etc. This field use by finger command;
Home directory: The absolute path to the directory the user will be in when they log in. If this directory does not exists then users directory becomes /;
Command/shell: The absolute path of a command or shell (/bin/bash).
```
We can see several pseudo users:
```
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
irc:x:39:39:ircd:/run/ircd:/usr/sbin/nologin
gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin
```
Pseudo users are related to system and program services. Typically, accounts with UIDs less than 10 belong to the system, and UIDs 10 to 100 are reserved for pseudo-users associated with special programs. The passwords of these pseudo-users in the **/etc/shadow** file are usually replaced with an asterisk, so that you cannot log in with a service name.
***
___Exercise 2.___ _What are the uid ranges? What is UID? How to define it?_

UID - is a User ID. A UID is a unique identification number assigned to every user present in a Linux system. UID 0 (zero) is reserved for root and UIDs 1-99 are reserved for other predefined accounts. Further UID 100-999 are reserved by system for administrative and system accounts/groups. UID stored in the **/etc/passwd** file.
***
___Exercise 3.___ _What is GID? How to define it?_

GID - is a Group ID. The first 100 GIDs are usually reserved for system use. The GID of 0 corresponds to the root group and the GID of 100 usually represents the users group. GIDs are stored in the **/etc/groups** file.
***
___Exercise 4.___ _How to determine belonging of user to the specific group?_

The primary user’s group is stored in the **/etc/passwd** file and the supplementary groups, if any, are listed in the **/etc/group** file. The list field contains a comma separated list of users belonging to this group.
***
___Exercise 5.___ _What are the commands for adding a user to the system? What are the basic parameters required to create a user?_

Commands for working with user accounts:
```
useradd [-c uid comment] [-d dir] [-e expire] [-f inactive] [-g gid] [-m [-k skel_dir]] [-s shell] [-u uid [-o]] username
userdel [-r] username
usermod [-c uid comment] [-d dir [-m]] [-e expire] [-f inactive] [-g gid] [-G gid [, gid]] [-l new username] [-s shell] [-u uid [-o]] username
```
***
___Exercise 6.___ _How do I change the name (account name) of an existing user?_

To rename user account use command:
```
sudo usermod -l newUsername oldUsername
```
***
___Exercise 7.___ _What is skell_dir? What is its structure?_

Directory **/etc/skel/** is used to initiate home directory when a user is first created. “skeleton” directory is defined in **/etc/default/useradd** file:
```
# Default values for useradd(8)
SHELL=/bin/sh
GROUP=100
HOME=/home
INACTIVE=-1
EXPIRE=
SKEL=/etc/skel
CREATE_MAIL_SPOOL=yes
```
***
___Exercise 8.___ _How to remove a user from the system (including his mailbox)?_

To remove a user from the system (including his mailbox) use option -r:
```
sudo userdel -r username
```
***
___Exercise 9.___ _What commands and keys should be used to lock and unlock a user account?_

To lock user use **usermod** command with option **-L**:
```
sudo usermod -L username
```
To unlock user use **usermod** command with option **-U**:
```
sudo usermod -U username
```
***
___Exercise 10.___ _How to remove a user's password and provide him with a password-free login for subsequent password change?_

Need to allow password-free login by changing the file **/etc/ssh/sshd_config**:
```
PermitEmptyPasswords yes
```
Then use the command:
```
sudo passwd -d -e username
```
***
___Exercise 11.___ _Display the extended format of information about the directory, tell about the information columns displayed on the terminal._

To display extended format use ** $ ls -la** command:
```
$ ls -la
-rw-rw-r-- 1 slava slava   13 Feb 23 22:40 slava.txt
drwxrwxr-x 2 slava slava 4096 Apr  4 18:03 test
-rw-rw-r-- 1 slava slava   76 Apr  4 15:55 test222.txt
-rw-rw-r-- 1 slava slava   30 Mar 24 15:38 test2.txt
-rw-rw-r-- 1 slava slava   30 Mar 24 15:39 test3.txt
-rw-rw-r-- 1 slava slava   21 Mar 29 14:55 test.txt
```
The first character indicates the file type (d - directory, b - block device, c - character device, l - symbolic link, p - pipe (pipe, fifo), s - socket):
Next nine characters representation as "rwxrwxrwx", where some "r", "w" and "x" can be replaced with "-".
Symbols reflect the three types of access accepted in Linux - read, write and use - however they are present in triplicate in the shortcut!
Then the file's owner, group, file size, creation date, and name.
***
___Exercise 12.___ _What access rights exist and for whom (i. e., describe the main roles)? Briefly describe the acronym for access rights._

There are several file permissions: "r" - read, "w" - write, and "x" - use.
Linux user in relation to any file can act in three roles: as the owner (user), as a member of the group that owns the file (group),
and as an outsider (other), has no ownership relations of this file The attribute string is 3 three rwx that describe
the file permissions of the owner of this file (the first triplet, "u"),
the group that owns the file (the second triplet, "g") and outsiders (the third triplet, "o") If a letter is missing in any triplet,
and instead of it there is a "-", then the user in the corresponding role will be denied the corresponding type of access.
***
___Exercise 13.___ _What is the sequence of defining the relationship between the file and the user?_

1. Any Linux user (process) in relation to any file can act in three roles: as the owner (user), as
a member of the group that owns the file (group), and as an outsider (other), has no ownership relations
of this file.
2. The attribute string is 3 three rwx that describe the file permissions of the owner of this file
(the first triplet, "u"), the group that owns the file (the second triplet, "g") and outsiders (the third triplet,
"o") If a letter is missing in any triplet, and instead of it there is a "-", then the user in the corresponding
role will be denied the corresponding type of access. s - bit for changing user or group identifier; t - sticky
bit flag.
3. When the relationship between the file and the user who started the process, the role is determined as
follows:
   1. If the UID of the file is the same as the UID of the process, the user is the owner of the file;
   2. If the GID of the file matches the GID of any group the user belongs to, he is a member of the group to
   which the file belongs;
   3. If neither the UID no the GID of a file overlaps with the UID of the process and the list of groups that the
   user running it belongs to, that user is an outsider
***
___Exercise 14.___ _What commands are used to change the owner of a file (directory), as well as the mode of access to the file? Give examples, demonstrate on the terminal._

To change the owner of a file (directory) can be changed using three commands: **chown** (change owner), **chgrp** (change
group), and **chmod** with extended parameter format: before the access part (before the "+"
or "-" sign), can list the roles "u", "g", "o" and "a" (all, which corresponds to "ugo") for which access is being changed.

Changing the owner of the permissions.txt file to owner test:
```
$ sudo chown test permissions.txt
```
Changing the group of the permissions.txt file to group test:
```
$ sudo chgrp test permissions.txt
```
Changing the permissions of the permissions.txt file to write/read/use for owner/group/other:
```
$ chmod 777 permissions.txt
```
***
___Exercise 15.___ _What is an example of octal representation of access rights? Describe the umask command._
```
Octal file permissions:

0 --- No permissions
1 --x Execute permission only
2 -w- Write permission only
3 -wx Write and execute permissions
4 r-- Read permission only
5 r-x Read and execute permissions
6 rw- Read and write permissions
7 rwx Read, write, and execute permissions
```
By default, on Linux systems, the default creation permissions are 666 for files, which gives read and write permission to user,
group, and others, and to 777 for directories, which means read, write and execute permission to user, group, and others.
Linux does not allow a file to be created with execute permissions. The default creation permissions can be modified using the umask utility.
To calculate the permission bits of the new files, subtract the umask value from the default value.

Default umask value we can see using command:
```
$ umask -p
umask 0002
```

To change umask use command:
```
$ umask 222
$ umask -p
umask 0222
```
Changing **umask** affects only the current shell environment.
***
___Exercise 16.___ _Give definitions of sticky bits and mechanism of identifier substitution. Give an example of files and directories with these attributes._

Sticky Bit is mainly used on folders in order to avoid deletion of a folder and it’s
content by other users though they having write permissions on the folder contents. If
Sticky bit is enabled on a folder, the folder contents are deleted by only owner who
created them and the root user. No one else can delete other users data in this folder
(Where sticky bit is set). This is a security measure to avoid deletion of critical folders
and their content (sub-folders and files), though other users have full permissions.

Sticky Bit can be set in two ways:

1. Symbolic way:
```
chmod o+t sticky/ or chmod +t sticky/
```
2. Numerical way:
```
chmod 1757 sticky/
```
```
$ ls -la
drwxr-xrwt  2 root    root    4096 Apr 21 14:09 sticky
drwxr-x---  2 test    test    4096 Apr 18 14:39 test
drwxr-x---  3 vagrant vagrant 4096 Feb 22 16:17 vagrant
```
t - represents sticky bit
***
___Exercise 17.___ _What file attributes should be present in the command script?_

The sha-bang ( #!) at the head of a script tells your system that this file is a set of commands to be fed to the command interpreter indicated.
The #! is actually a two-byte magic number, a special marker that designates a file type, or in this case an executable shell script (type man magic for more details on this fascinating topic).
Immediately following the sha-bang is a path name. This is the path to the program that interprets the commands in the script, whether it be a shell, a programming language, or a utility.
This command interpreter then executes the commands in the script, starting at the top (the line following the sha-bang line), and ignoring comments.
```
#!/bin/sh
#!/bin/bash
#!/usr/bin/perl
#!/usr/bin/tcl
#!/bin/sed -f
#!/bin/awk -f
```
Each of the above script header lines calls a different command interpreter, be it /bin/sh, the default shell (bash in
a Linux system) or otherwise.
***