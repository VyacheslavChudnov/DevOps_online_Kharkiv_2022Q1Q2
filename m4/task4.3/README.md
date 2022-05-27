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

___Exercise 13.___ _Sort the contents of the processes window using various parameters (for example, the
amount of processor time taken up, etc.)._

```
```

___Exercise 14.___ _Concept of priority, what commands are used to set priority?_

```
```

___Exercise 15.___ _Can I change the priority of a process using the top command? If so, how?_

```
```

___Exercise 16.___ _Examine the kill command. How to send with the kill command process control signal? Give
an example of commonly used signals._

```
```

___Exercise 17.___ _Commands jobs, fg, bg, nohup. What are they for? Use the sleep, yes command to
demonstrate the process control mechanism with fg, bg._

```
```

## Part 2
***
___Exercise 1.___ _Check the implementability of the most frequently used OPENSSH commands in the MS
Windows operating system. (Description of the expected result of the commands +screenshots:
command – result should be presented._

```
```
***
___Exercise 2.___ _Implement basic SSH settings to increase the security of the client-server connection (at least)._

```
```
***
___Exercise 3.___ _List the options for choosing keys for encryption in SSH. Implement 3 of them._

```
```
***
___Exercise 4.___ _Implement port forwarding for the SSH client from the host machine to the guest Linux
virtual machine behind NAT._

```
```
***
___Exercise 5.___ _Intercept (capture) traffic (tcpdump, wireshark) while authorizing the remote client on the
server using ssh, telnet, rlogin. Analyze the result._

```
```
***