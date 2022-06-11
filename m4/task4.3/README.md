# Linux - Task4.3

## Part 1
***
___Exercise 1.___ _How many states could has a process in Linux?_

There are five Linux process states. In Unix/Linux operating systems, processes can be in one of the following states:
1. RUNNING & RUNNABLE
2. INTERRRUPTABLE_SLEEP
3. UNINTERRUPTABLE_SLEEP
4. STOPPED
5. ZOMBIE
***
___Exercise 2.___ _Examine the **pstree** command. Make output (highlight) the chain (ancestors) of the current process._

Disable compaction of identical subtrees:
```
$ pstree -c
systemd─┬─VBoxService─┬─{VBoxService}
        │             ├─{VBoxService}
        │             ├─{VBoxService}
        │             ├─{VBoxService}
        │             ├─{VBoxService}
        │             ├─{VBoxService}
        │             ├─{VBoxService}
        │             └─{VBoxService}
        ├─atop
        ├─atopacctd
        ├─cron
        ├─dbus-daemon
        ├─dhcpd─┬─{dhcpd}
        │       ├─{dhcpd}
        │       └─{dhcpd}
        ├─login───bash
        ├─multipathd─┬─{multipathd}
        │            ├─{multipathd}
        │            ├─{multipathd}
        │            ├─{multipathd}
        │            ├─{multipathd}
        │            └─{multipathd}
        ├─networkd-dispat
        ├─polkitd─┬─{polkitd}
        │         └─{polkitd}
        ├─rsyslogd─┬─{rsyslogd}
        │          ├─{rsyslogd}
        │          └─{rsyslogd}
        ├─snapd─┬─{snapd}
        │       ├─{snapd}
        │       ├─{snapd}
        │       ├─{snapd}
        │       ├─{snapd}
        │       ├─{snapd}
        │       ├─{snapd}
        │       └─{snapd}
        ├─sshd─┬─sshd───sshd─┬─bash───pstree
        │      │             └─bash
        │      └─sshd───sshd───sftp-server
        ├─systemd───(sd-pam)
        ├─systemd-journal
        ├─systemd-logind
        ├─systemd-network
        ├─systemd-resolve
        ├─systemd-udevd
        ├─udisksd─┬─{udisksd}
        │         ├─{udisksd}
        │         ├─{udisksd}
        │         └─{udisksd}
        └─unattended-upgr───{unattended-upgr}
```
Show full names for threads when available:
```
$ pstree -t
systemd─┬─VBoxService─┬─{RTThrdPP}
        │             ├─{automount}
        │             ├─{control}
        │             ├─{cpuhotplug}
        │             ├─{memballoon}
        │             ├─{timesync}
        │             ├─{vminfo}
        │             └─{vmstats}
        ├─atop
        ├─atopacctd
        ├─cron
        ├─dbus-daemon
        ├─dhcpd─┬─{isc-socket}
        │       ├─{isc-timer}
        │       └─{isc-worker0000}
        ├─login───bash
        ├─multipathd───6*[{multipathd}]
        ├─networkd-dispat
        ├─polkitd─┬─{gdbus}
        │         └─{gmain}
        ├─rsyslogd─┬─{in:imklog}
        │          ├─{in:imuxsock}
        │          └─{rs:main Q:Reg}
        ├─snapd───8*[{snapd}]
        ├─sshd─┬─sshd───sshd─┬─bash───pstree
        │      │             └─bash───sleep
        │      └─sshd───sshd───sftp-server
        ├─systemd───(sd-pam)
        ├─systemd-journal
        ├─systemd-logind
        ├─systemd-network
        ├─systemd-resolve
        ├─systemd-udevd
        ├─udisksd─┬─{cleanup}
        │         ├─{gdbus}
        │         ├─{gmain}
        │         └─{probing-thread}
        └─unattended-upgr───{gmain}
```
**$ pstree -h** - highlight the current process and its ancestors.  This is a no-op if the terminal doesn't support highlighting or if
neither the current process nor any of its ancestors are in the subtree being shown.
***
___Exercise 3.___ _What is a proc file system?_

Proc file system (procfs) is virtual file system created on fly when system boots and is dissolved at time of system shut down.

It contains useful information about the processes that are currently running, it is regarded as control and information center for kernel.

The proc file system also provides communication medium between kernel space and user space.
***
___Exercise 4.___ _Print information about the processor (its type, supported technologies, etc.)._

```
$ grep "cpu" /proc/cpuinfo
cpu family      : 6
cpu MHz         : 1995.384
cpu cores       : 1
cpuid level     : 13
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx rdtscp lm constant_tsc rep_good nopl xtopology nonstop_tsc cpuid tsc_known_freq pni pclmulqdq monitor ssse3 cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt aes xsave avx rdrand hypervisor lahf_lm abm invpcid_single pti fsgsbase avx2 invpcid md_clear flush_l1d
bugs            : cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds swapgs itlb_multihit srbds
$ less /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 69
model name      : Intel(R) Core(TM) i7-4510U CPU @ 2.00GHz
stepping        : 1
cpu MHz         : 1995.384
cache size      : 4096 KB
physical id     : 0
siblings        : 1
core id         : 0
cpu cores       : 1
apicid          : 0
initial apicid  : 0
fpu             : yes
fpu_exception   : yes
cpuid level     : 13
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx rdtscp lm constant_tsc rep_good nopl xtopology nonstop_tsc cpuid tsc_known_freq pni pclmulqdq monitor ssse3 cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt aes xsave avx rdrand hypervisor lahf_lm abm invpcid_single pti fsgsbase avx2 invpcid md_clear flush_l1d
bugs            : cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds swapgs itlb_multihit srbds
bogomips        : 3990.76
clflush size    : 64
cache_alignment : 64
address sizes   : 39 bits physical, 48 bits virtual
power management:

/proc/cpuinfo (END)
```
***
___Exercise 5.___ _Use the ps command to get information about the process. The information should be as
follows: the owner of the process, the arguments with which the process was launched for
execution, the group owner of this process, etc._

The command below will show all processes including the owner of the process, the arguments with which
the process was launched for execution, the group owner of this process, etc.:
```
$ ps ax o user,pid,%cpu,%mem,vsz,rss,tty,stat,start,time,comm,group,gid,cmd
```
***
___Exercise 6.___ _How to define kernel processes and user processes?_

When managing processes, it is easy to recognize the kernel processes
because they have a name that is between square brackets.
***
___Exercise 7.___ _Print the list of processes to the terminal. Briefly describe the statuses of the processes.
What condition are they in, or can they be arriving in?_

The status of processes can be seen using the command:
```
$ ps aux
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.0  1.1 164656 11032 ?        Ss   12:05   0:03 /sbin/init
root           2  0.0  0.0      0     0 ?        S    12:05   0:00 [kthreadd]
root           3  0.0  0.0      0     0 ?        I<   12:05   0:00 [rcu_gp]
root           4  0.0  0.0      0     0 ?        I<   12:05   0:00 [rcu_par_gp]
root           6  0.0  0.0      0     0 ?        I<   12:05   0:00 [kworker/0:0H-events_highpri]
root           9  0.0  0.0      0     0 ?        I<   12:05   0:00 [mm_percpu_wq]
root          10  0.0  0.0      0     0 ?        S    12:05   0:00 [rcu_tasks_rude_]
root          11  0.0  0.0      0     0 ?        S    12:05   0:00 [rcu_tasks_trace]
root          12  0.0  0.0      0     0 ?        S    12:05   0:03 [ksoftirqd/0]
root          13  0.1  0.0      0     0 ?        I    12:05   0:16 [rcu_sched]
root          14  0.0  0.0      0     0 ?        S    12:05   0:00 [migration/0]
root          15  0.0  0.0      0     0 ?        S    12:05   0:00 [idle_inject/0]
root          16  0.0  0.0      0     0 ?        S    12:05   0:00 [cpuhp/0]
root          17  0.0  0.0      0     0 ?        S    12:05   0:00 [kdevtmpfs]
root          18  0.0  0.0      0     0 ?        I<   12:05   0:00 [netns]
root          19  0.0  0.0      0     0 ?        I<   12:05   0:00 [inet_frag_wq]
root          20  0.0  0.0      0     0 ?        S    12:05   0:00 [kauditd]
root          21  0.0  0.0      0     0 ?        S    12:05   0:00 [khungtaskd]
root          22  0.0  0.0      0     0 ?        S    12:05   0:00 [oom_reaper]
root          23  0.0  0.0      0     0 ?        I<   12:05   0:00 [writeback]
root          24  0.0  0.0      0     0 ?        S    12:05   0:01 [kcompactd0]
root          25  0.0  0.0      0     0 ?        SN   12:05   0:00 [ksmd]
root          26  0.0  0.0      0     0 ?        SN   12:05   0:00 [khugepaged]
```
PROCESS STATE CODES
Here are the different values that the s, stat and state output specifiers (header "STAT" or "S") will display to describe
the state of a process:
```
               D    uninterruptible sleep (usually IO)
               I    Idle kernel thread
               R    running or runnable (on run queue)
               S    interruptible sleep (waiting for an event to complete)
               T    stopped by job control signal
               t    stopped by debugger during the tracing
               W    paging (not valid since the 2.6.xx kernel)
               X    dead (should never be seen)
               Z    defunct ("zombie") process, terminated but not reaped by its parent

       For BSD formats and when the stat keyword is used, additional characters may be displayed:

               <    high-priority (not nice to other users)
               N    low-priority (nice to other users)
               L    has pages locked into memory (for real-time and custom IO)
               s    is a session leader
               l    is multi-threaded (using CLONE_THREAD, like NPTL pthreads do)
               +    is in the foreground process group
```
***
___Exercise 8.___ _Display only the processes of a specific user._

```
$ ps -u slava o user,pid,%cpu,%mem,vsz,rss,tty,stat,start,time,comm,group,gid,cmd
USER         PID %CPU %MEM    VSZ   RSS TT       STAT  STARTED     TIME COMMAND         GROUP      GID CMD
slava       1047  0.0  0.8  15300  8900 ?        Ss   12:08:45 00:00:00 systemd         slava     1000 /lib/systemd/systemd --user
slava       1048  0.0  0.3 167812  3660 ?        S    12:08:45 00:00:00 (sd-pam)        slava     1000 (sd-pam)
slava       1165  0.1  0.6  15028  6520 ?        S    12:08:47 00:00:12 sshd            slava     1000 sshd: slava@pts/0
slava       1166  0.0  0.5   8928  5504 pts/0    Ss   12:08:47 00:00:00 bash            slava     1000 -bash
slava       1267  0.0  0.6  15028  6164 ?        S    12:08:51 00:00:00 sshd            slava     1000 sshd: slava@notty
slava       1268  0.0  0.3   5872  3796 ?        Ss   12:08:51 00:00:00 sftp-server     slava     1000 /usr/lib/openssh/sftp-server
slava      11041  0.0  0.5   8832  5488 tty1     S+   12:36:20 00:00:00 bash            slava     1000 -bash
slava      19667  0.2  0.6  15024  6500 ?        S    13:01:02 00:00:23 sshd            slava     1000 sshd: slava@pts/1
slava      19668  0.0  0.5   8824  5528 pts/1    Ss   13:01:02 00:00:00 bash            slava     1000 -bash
slava      19769  0.0  0.6  15032  6056 ?        S    13:01:06 00:00:00 sshd            slava     1000 sshd: slava@notty
slava      19770  0.0  0.3   5872  3788 ?        Ss   13:01:06 00:00:00 sftp-server     slava     1000 /usr/lib/openssh/sftp-server
slava      67610  0.0  0.3   7320  3900 pts/0    S+   15:18:19 00:00:00 man             slava     1000 man ps
slava      67620  0.0  0.2   6092  2648 pts/0    S+   15:18:19 00:00:00 pager           slava     1000 pager
slava      69843  0.4  0.3   7332  3532 ?        Ss   15:24:40 00:00:00 bash            slava     1000 bash -c while true; do sleep 1;
slava      70634  0.0  0.0   5752   980 ?        S    15:26:56 00:00:00 sleep           slava     1000 sleep 1
slava      70635  0.0  0.3   9896  3520 pts/1    R+   15:26:56 00:00:00 ps              slava     1000 ps -u slava o user,pid,%cpu,%me
```
***
___Exercise 9.___ _What utilities can be used to analyze existing running tasks (by analyzing the help for the ps
command)?_

We can use next utilities:
```
$ top
$ htop
$ sudo lsof | less
```
***
___Exercise 10.___ _What information does **top** command display?_

The **top** program provides a dynamic real-time view of a running
system.  It can display system summary information as well as a
list of processes or threads currently being managed by the Linux
kernel.  The types of system summary information shown and the
types, order and size of information displayed for processes are
all user configurable and that configuration can be made
persistent across restarts.
***
___Exercise 11.___ _Display the processes of the specific user using the top command._

```
$ top -u slava
top - 18:44:09 up  6:38,  3 users,  load average: 0.06, 0.07, 0.01
Tasks: 126 total,   1 running, 125 sleeping,   0 stopped,   0 zombie
%Cpu(s): 11.1 us,  5.6 sy,  0.0 ni, 83.3 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
MiB Mem :    971.5 total,     88.4 free,    189.1 used,    694.0 buff/cache
MiB Swap:   1672.0 total,   1671.7 free,      0.3 used.    623.7 avail Mem

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
 138802 slava     20   0   10308   3936   3368 R  11.8   0.4   0:00.04 top
   1047 slava     20   0   15300   8900   7380 S   0.0   0.9   0:00.35 systemd
   1048 slava     20   0  167812   3660      0 S   0.0   0.4   0:00.00 (sd-pam)
   1165 slava     20   0   15028   6520   4824 S   0.0   0.7   0:12.88 sshd
   1166 slava     20   0    8928   5504   3604 S   0.0   0.6   0:00.22 bash
   1267 slava     20   0   15028   6164   4680 S   0.0   0.6   0:00.00 sshd
   1268 slava     20   0    5872   3796   3400 S   0.0   0.4   0:00.03 sftp-server
  11041 slava     20   0    8832   5488   3628 S   0.0   0.6   0:00.11 bash
  19667 slava     20   0   15024   6500   4808 S   0.0   0.7   0:58.68 sshd
  19668 slava     20   0    8932   5668   3720 S   0.0   0.6   0:00.46 bash
  19769 slava     20   0   15032   6056   4568 S   0.0   0.6   0:00.00 sshd
  19770 slava     20   0    5872   3788   3384 S   0.0   0.4   0:00.02 sftp-server
  67610 slava     20   0    7320   3900   2844 S   0.0   0.4   0:00.01 man
  67620 slava     20   0    6092   2648   2356 S   0.0   0.3   0:00.14 pager
  69843 slava     20   0    7332   3532   3268 S   0.0   0.4   1:07.08 bash
 138801 slava     20   0    5752    924    836 S   0.0   0.1   0:00.00 sleep
```
***
___Exercise 12.___ _What interactive commands can be used to control the top command? Give a couple of
examples._

* To sort all Linux running processes by Process ID, press M and T keys;
* To sort all Linux running processes by Memory usage, press M and P keys;
* Press ‘z‘ option will display the running process in color which may help you to identify the running process easily;
* Press ‘c‘ option in running top command will display the absolute path of the running process;
* By default screen refresh interval is set to 3.0 seconds, the same can be changed by pressing the ‘d‘ option in running the top command to set desired interval time;
* You can kill a process after finding the PID of the process by pressing the ‘k‘ option in running the top command without closing the top window;
* To sort all running processes by CPU utilization, simply press Shift+P key.
***
___Exercise 13.___ _Sort the contents of the processes window using various parameters (for example, the
amount of processor time taken up, etc.)._

Sort by user
```
$ ps aux --sort=user
```
Sort by CPU
```
$ ps aux --sort=-pcpu
```
Sort by Memory
```
$ ps aux --sort=-pmem
```
***
___Exercise 14.___ _Concept of priority, what commands are used to set priority?_


The kernel stores a great deal of information about processes including process priority
which is simply the scheduling priority attached to a process. Processes with a higher priority
will be executed before those with a lower priority, while processes with the same priority are
scheduled one after the next, repeatedly.

There are a total of 140 priorities and two distinct priority ranges implemented in Linux.
The first one is a nice value (niceness) which ranges from -20 (highest priority value)
to 19 (lowest priority value) and the default is 0. The other is the real-time priority,
which ranges from 1 to 99 by default, then 100 to 139 are meant for user-space.


One important characteristic of Linux is dynamic priority-based scheduling, which allows
the nice value of processes to be changed (increased or decreased) depending on your needs.

To set the priority, use the commands **nice** and **renice**.
```
$ sudo renice -5 -p 1234
```
***
___Exercise 15.___ _Can I change the priority of a process using the top command? If so, how?_

Once given **top** command, press **r**. Give PID value of the process you want to change the process value.
Give **renice** value (from -20 to +19).
***
___Exercise 16.___ _Examine the kill command. How to send with the kill command process control signal? Give
an example of commonly used signals._

```
slava@ubnvm1:~$ kill -l
 1) SIGHUP       2) SIGINT       3) SIGQUIT      4) SIGILL       5) SIGTRAP
 6) SIGABRT      7) SIGBUS       8) SIGFPE       9) SIGKILL     10) SIGUSR1
11) SIGSEGV     12) SIGUSR2     13) SIGPIPE     14) SIGALRM     15) SIGTERM
16) SIGSTKFLT   17) SIGCHLD     18) SIGCONT     19) SIGSTOP     20) SIGTSTP
21) SIGTTIN     22) SIGTTOU     23) SIGURG      24) SIGXCPU     25) SIGXFSZ
26) SIGVTALRM   27) SIGPROF     28) SIGWINCH    29) SIGIO       30) SIGPWR
31) SIGSYS      34) SIGRTMIN    35) SIGRTMIN+1  36) SIGRTMIN+2  37) SIGRTMIN+3
38) SIGRTMIN+4  39) SIGRTMIN+5  40) SIGRTMIN+6  41) SIGRTMIN+7  42) SIGRTMIN+8
43) SIGRTMIN+9  44) SIGRTMIN+10 45) SIGRTMIN+11 46) SIGRTMIN+12 47) SIGRTMIN+13
48) SIGRTMIN+14 49) SIGRTMIN+15 50) SIGRTMAX-14 51) SIGRTMAX-13 52) SIGRTMAX-12
53) SIGRTMAX-11 54) SIGRTMAX-10 55) SIGRTMAX-9  56) SIGRTMAX-8  57) SIGRTMAX-7
58) SIGRTMAX-6  59) SIGRTMAX-5  60) SIGRTMAX-4  61) SIGRTMAX-3  62) SIGRTMAX-2
63) SIGRTMAX-1  64) SIGRTMAX
slava@ubnvm1:~$ kill -9 89288
```
***
___Exercise 17.___ _Commands jobs, fg, bg, nohup. What are they for? Use the sleep, yes command to
demonstrate the process control mechanism with fg, bg._

**nohup** prevents the processes or jobs from receiving the SIGHUP (Signal Hang UP) signal.
This is a signal that is sent to a process upon closing or exiting the terminal.

On Unix-like operating systems, **bg** is a job control command.
It resumes suspended jobs in the background, returning the user to the shell prompt while the job runs.

The **fg** command, short for the foreground, is a command that moves a background process on your current Linux shell to the foreground.
This contrasts the **bg** command, short for background, that sends a process running in the foreground to the background in the current shell.

Command **jobs** lists the jobs running in the background, giving the job number.

***Examples:***
```
slava@Client1:~$ sleep 1000
^Z
[1]+  Stopped                 sleep 1000
slava@Client1:~$ jobs
[1]+  Stopped                 sleep 1000
slava@Client1:~$ fg
sleep 1000

^Z
[1]+  Stopped                 sleep 1000
slava@Client1:~$ bg
[1]+ sleep 1000 &
slava@Client1:~$
```

## Part 2
***
___Exercise 1.___ _Check the implementability of the most frequently used OPENSSH commands in the MS
Windows operating system. (Description of the expected result of the commands +screenshots:
command – result should be presented._

Check that the SSH client is installed:
```
Windows PowerShell
(C) Корпорация Майкрософт (Microsoft Corporation). Все права защищены.

PS C:\Windows\system32> Get-WindowsCapability -Online | ? Name -like 'OpenSSH.Client*'


Name  : OpenSSH.Client~~~~0.0.1.0
State : Installed



PS C:\Windows\system32>
```
Connection to host **ssh username@host** or **ssh username@host -p port**:
```
PS C:\Windows\system32> ssh slava@192.168.10.202
```
![OpenSSH](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m4/task4.3/screenshots_for_task4.3/001_OpenSSH.jpg)

***
___Exercise 2.___ _Implement basic SSH settings to increase the security of the client-server connection (at least)._

Change the port:
```
nano /etc/ssh/sshd_config
port 2223
```
- Disable Server SSH Root Login: find the line that says “PermitRootLogin_yes“ and change to PermitRootLogin_no;
- Add the user account you will use to log in. Just add another line with the username in question: AllowUsers your_username_here;
- Use SSH keys to log into the server as root or with sudo privileges;
- With iptables, you can define rules that limit or permit traffic for different kinds of services by IP address, port or network protocol and thus substantially improve the security of your
  server. In our case, we will set firewall rules to restrict the incoming SSH traffic for everyone
  but one IP address or subnet.

***
___Exercise 3.___ _List the options for choosing keys for encryption in SSH. Implement 3 of them._

To generate a key-pair for the current user, execute:
```
$ ssh-keygen
```
We can also generate a key pair in the current directory with a specific file name using the -f flag:
```
$ ssh-keygen -f example
```
Unless otherwise specified, ssh-keygen uses the Rivest–Shamir–Adleman (RSA) algorithm when generating the key pair. We can specify another algorithm using the -t flag. For example:
```
$ ssh-keygen -t dsa

usage: ssh-keygen ... [-t dsa | ecdsa | ed25519 | rsa]
```

***
___Exercise 4.___ _Implement port forwarding for the SSH client from the host machine to the guest Linux
virtual machine behind NAT._

To configure port forwarding we can use the graphical Port Forwarding editor which can be found in the
Network Settings dialog for network adaptors configured to use NAT. Here, we can map host ports to guest ports to allow network traffic to be routed to a specific port in the guest.

### Port forward configuring:
![Port_Forward](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m4/task4.3/screenshots_for_task4.3/002_Port_Forward.jpg)

***
___Exercise 5.___ _Intercept (capture) traffic (tcpdump, wireshark) while authorizing the remote client on the
server using ssh, telnet, rlogin. Analyze the result._

Example SSH session:
```
slava@ubnvm1:/etc/iptables$ sudo tcpdump -i enp0s3 -v tcp port 22
tcpdump: listening on enp0s3, link-type EN10MB (Ethernet), snapshot length 262144 bytes
12:17:04.636637 IP (tos 0x10, ttl 64, id 4464, offset 0, flags [DF], proto TCP (6), length 104)
    ubnvm1.ssh > 192.168.10.103.61278: Flags [P.], cksum 0x96dc (incorrect -> 0x101e), seq 4227853179:4227853243, ack 2773556171, win 521, length 64
12:17:04.636868 IP (tos 0x0, ttl 128, id 61048, offset 0, flags [DF], proto TCP (6), length 40)
    192.168.10.103.61278 > ubnvm1.ssh: Flags [.], cksum 0x7103 (correct), ack 64, win 4098, length 0
12:17:04.636956 IP (tos 0x10, ttl 64, id 4465, offset 0, flags [DF], proto TCP (6), length 104)
    ubnvm1.ssh > 192.168.10.103.61278: Flags [P.], cksum 0x96dc (incorrect -> 0x403b), seq 64:128, ack 1, win 521, length 64
12:17:04.637146 IP (tos 0x10, ttl 64, id 4466, offset 0, flags [DF], proto TCP (6), length 120)
    ubnvm1.ssh > 192.168.10.103.61278: Flags [P.], cksum 0x96ec (incorrect -> 0xb6a9), seq 128:208, ack 1, win 521, length 80
12:17:04.637297 IP (tos 0x0, ttl 128, id 61049, offset 0, flags [DF], proto TCP (6), length 40)
    192.168.10.103.61278 > ubnvm1.ssh: Flags [.], cksum 0x7073 (correct), ack 208, win 4098, length 0
12:17:04.637362 IP (tos 0x10, ttl 64, id 4467, offset 0, flags [DF], proto TCP (6), length 120)
    ubnvm1.ssh > 192.168.10.103.61278: Flags [P.], cksum 0x96ec (incorrect -> 0x7a94), seq 208:288, ack 1, win 521, length 80
12:17:04.637542 IP (tos 0x10, ttl 64, id 4468, offset 0, flags [DF], proto TCP (6), length 88)
    ubnvm1.ssh > 192.168.10.103.61278: Flags [P.], cksum 0x96cc (incorrect -> 0x8c8d), seq 288:336, ack 1, win 521, length 48
12:17:04.637739 IP (tos 0x0, ttl 128, id 61050, offset 0, flags [DF], proto TCP (6), length 40)
    192.168.10.103.61278 > ubnvm1.ssh: Flags [.], cksum 0x6ff4 (correct), ack 336, win 4097, length 0
12:17:04.735984 IP (tos 0x10, ttl 64, id 4469, offset 0, flags [DF], proto TCP (6), length 184)
    ubnvm1.ssh > 192.168.10.103.61278: Flags [P.], cksum 0x972c (incorrect -> 0xab36), seq 336:480, ack 1, win 521, length 144
12:17:04.736266 IP (tos 0x10, ttl 64, id 4470, offset 0, flags [DF], proto TCP (6), length 88)
    ubnvm1.ssh > 192.168.10.103.61278: Flags [P.], cksum 0x96cc (incorrect -> 0x2db0), seq 480:528, ack 1, win 521, length 48
12:17:04.736543 IP (tos 0x0, ttl 128, id 61051, offset 0, flags [DF], proto TCP (6), length 40)
    192.168.10.103.61278 > ubnvm1.ssh: Flags [.], cksum 0x6f35 (correct), ack 528, win 4096, length 0
12:17:04.848166 IP (tos 0x10, ttl 64, id 4471, offset 0, flags [DF], proto TCP (6), length 376)
    ubnvm1.ssh > 192.168.10.103.61278: Flags [P.], cksum 0x97ec (incorrect -> 0x99d0), seq 528:864, ack 1, win 521, length 336
12:17:04.848920 IP (tos 0x10, ttl 64, id 4472, offset 0, flags [DF], proto TCP (6), length 120)
    ubnvm1.ssh > 192.168.10.103.61278: Flags [P.], cksum 0x96ec (incorrect -> 0xa567), seq 864:944, ack 1, win 521, length 80
12:17:04.849363 IP (tos 0x0, ttl 128, id 61052, offset 0, flags [DF], proto TCP (6), length 40)
    192.168.10.103.61278 > ubnvm1.ssh: Flags [.], cksum 0x6d96 (correct), ack 944, win 4095, length 0
12:17:04.849505 IP (tos 0x10, ttl 64, id 4473, offset 0, flags [DF], proto TCP (6), length 88)
    ubnvm1.ssh > 192.168.10.103.61278: Flags [P.], cksum 0x96cc (incorrect -> 0x96d2), seq 944:992, ack 1, win 521, length 48
12:17:04.850238 IP (tos 0x10, ttl 64, id 4474, offset 0, flags [DF], proto TCP (6), length 104)
    ubnvm1.ssh > 192.168.10.103.61278: Flags [P.], cksum 0x96dc (incorrect -> 0x09bd), seq 992:1056, ack 1, win 521, length 64
12:17:04.850750 IP (tos 0x0, ttl 128, id 61053, offset 0, flags [DF], proto TCP (6), length 40)
```
Example Telnet session without access:
```
slava@ubnvm1:/etc/iptables$ sudo tcpdump -i enp0s3 -v tcp port 23
tcpdump: listening on enp0s3, link-type EN10MB (Ethernet), snapshot length 262144 bytes
12:19:32.693115 IP (tos 0x0, ttl 128, id 61717, offset 0, flags [DF], proto TCP (6), length 52)
    192.168.10.103.59274 > ubnvm1.telnet: Flags [S], cksum 0x192c (correct), seq 2261341702, win 64240, options [mss 1460,nop,wscale 8,nop,nop,sackOK], length 0
12:19:32.693158 IP (tos 0x0, ttl 64, id 0, offset 0, flags [DF], proto TCP (6), length 40)
    ubnvm1.telnet > 192.168.10.103.59274: Flags [R.], cksum 0x54dc (correct), seq 0, ack 2261341703, win 0, length 0
12:19:33.194143 IP (tos 0x0, ttl 128, id 61722, offset 0, flags [DF], proto TCP (6), length 52)
    192.168.10.103.59274 > ubnvm1.telnet: Flags [S], cksum 0x192c (correct), seq 2261341702, win 64240, options [mss 1460,nop,wscale 8,nop,nop,sackOK], length 0
12:19:33.194220 IP (tos 0x0, ttl 64, id 0, offset 0, flags [DF], proto TCP (6), length 40)
    ubnvm1.telnet > 192.168.10.103.59274: Flags [R.], cksum 0x54dc (correct), seq 0, ack 1, win 0, length 0
12:19:33.695157 IP (tos 0x0, ttl 128, id 61728, offset 0, flags [DF], proto TCP (6), length 52)
    192.168.10.103.59274 > ubnvm1.telnet: Flags [S], cksum 0x192c (correct), seq 2261341702, win 64240, options [mss 1460,nop,wscale 8,nop,nop,sackOK], length 0
12:19:33.695232 IP (tos 0x0, ttl 64, id 0, offset 0, flags [DF], proto TCP (6), length 40)
    ubnvm1.telnet > 192.168.10.103.59274: Flags [R.], cksum 0x54dc (correct), seq 0, ack 1, win 0, length 0
```
Example Rlogin session without access:
```
slava@ubnvm1:/etc/iptables$ sudo tcpdump -i enp0s3 -v tcp port 513
tcpdump: listening on enp0s3, link-type EN10MB (Ethernet), snapshot length 262144 bytes
12:20:55.400520 IP (tos 0x0, ttl 128, id 62096, offset 0, flags [DF], proto TCP (6), length 52)
    192.168.10.103.1023 > ubnvm1.login: Flags [S], cksum 0x3b7c (correct), seq 2140544139, win 64240, options [mss 1460,nop,wscale 8,nop,nop,sackOK], length 0
12:20:55.400588 IP (tos 0x0, ttl 64, id 0, offset 0, flags [DF], proto TCP (6), length 40)
    ubnvm1.login > 192.168.10.103.1023: Flags [R.], cksum 0x772c (correct), seq 0, ack 2140544140, win 0, length 0
12:20:55.901685 IP (tos 0x0, ttl 128, id 62103, offset 0, flags [DF], proto TCP (6), length 52)
    192.168.10.103.1023 > ubnvm1.login: Flags [S], cksum 0x3b7c (correct), seq 2140544139, win 64240, options [mss 1460,nop,wscale 8,nop,nop,sackOK], length 0
12:20:55.901796 IP (tos 0x0, ttl 64, id 0, offset 0, flags [DF], proto TCP (6), length 40)
    ubnvm1.login > 192.168.10.103.1023: Flags [R.], cksum 0x772c (correct), seq 0, ack 1, win 0, length 0
12:20:56.402972 IP (tos 0x0, ttl 128, id 62105, offset 0, flags [DF], proto TCP (6), length 52)
    192.168.10.103.1023 > ubnvm1.login: Flags [S], cksum 0x3b7c (correct), seq 2140544139, win 64240, options [mss 1460,nop,wscale 8,nop,nop,sackOK], length 0
12:20:56.403062 IP (tos 0x0, ttl 64, id 0, offset 0, flags [DF], proto TCP (6), length 40)
    ubnvm1.login > 192.168.10.103.1023: Flags [R.], cksum 0x772c (correct), seq 0, ack 1, win 0, length 0
```

### Wireshark Interception
![Wireshark](https://github.com/VyacheslavChudnov/DevOps_online_Kharkiv_2022Q1Q2/blob/main/m4/task4.3/screenshots_for_task4.3/003_Wireshark.jpg)
***