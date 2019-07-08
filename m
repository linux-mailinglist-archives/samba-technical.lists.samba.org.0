Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 756C961DDE
	for <lists+samba-technical@lfdr.de>; Mon,  8 Jul 2019 13:44:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=/tVq3TjmPmu+zkzOHBLevtk2aQP+aELfaSx3D8JE7y4=; b=VojBZOb+Q413qPdDjNTIy4aDv4
	IzoZVYCe7+XXrkO+hzpoOS2g+d9Omx/ODS1+yyrwGB+z3IZusx+SlyNMiWIsid+HkxnNt7OO4wepi
	VsqG0UH2HYVO+N8ADmn9qXyUm3xhpBXu6TMs7TJlx217Stea+6gF+6mSaAZSZhFZmeSEf7TU0jD0u
	k9mIiqzVmmnZG6i0aE0dEGkk5R+azkUTGCHnJVOT+32IwXzNFz3uRJ7B93MANT4L/SBKpGyeeX5ZC
	0YUhytYA91+Pwt5gNNkay3cHq4GcpABg9TN8Vusn8QOkEilh3ukP0ScKWkXrUf/javEi6Li4wBMFu
	BDPwrTKw==;
Received: from localhost ([::1]:55870 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hkS47-005qkX-Cx; Mon, 08 Jul 2019 11:44:15 +0000
Received: from mail-pl1-f179.google.com ([209.85.214.179]:40552) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hkS41-005qkQ-IS
 for samba-technical@lists.samba.org; Mon, 08 Jul 2019 11:44:12 +0000
Received: by mail-pl1-f179.google.com with SMTP id a93so8146970pla.7
 for <samba-technical@lists.samba.org>; Mon, 08 Jul 2019 04:44:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=/tVq3TjmPmu+zkzOHBLevtk2aQP+aELfaSx3D8JE7y4=;
 b=DBtdHQ/Jbxme/k0JkIJ2gfoLls9/T/3+xu6LRNdDPBLlZsrhO0fPEcIyGpH9VJh4Qv
 rmN+ERDTczwvbIdjmG1ARnlOuHQdazE2MpMXe28tpXYlu9gNzaF3R0zNFdUSeVWErqU1
 8Adpi/05xz3sicZERA9BrtJdTKsTg/JwajFyKeILSYwcrUm0/IRPGYRFCsEZfGM2vkO1
 cUVKBOZ9Jp2220ZdXHXOzjiVAocqxKrvGsdUJZgETq0wxuJV/IPQDjVL6tNA4CNvY/KK
 lUN9rfH6jo8xtAeCbohBZVBopzsBXkpDXpxIxdAwMOF1fSo18qsjwPVGqYcIILQErmQ7
 6oig==
X-Gm-Message-State: APjAAAXGIMNmSPm/3qganQ/726xYWYAk2uDUX3iH5n9CPGyFxN536sbG
 o3XhdNIUd/EaJjbPe4T3jkyfgPlbOCc=
X-Google-Smtp-Source: APXvYqzgvqlKQ8yIDsKVJfzCHYvCxuz/tuDUkVD6JKcBBCLm+4bHA5IZ35lsZj9p4qauGeZfI3oa2A==
X-Received: by 2002:a17:902:b093:: with SMTP id
 p19mr23329672plr.141.1562586246842; 
 Mon, 08 Jul 2019 04:44:06 -0700 (PDT)
Received: from amitkuma.pnq.csb ([125.16.200.50])
 by smtp.gmail.com with ESMTPSA id x12sm1378901pgj.79.2019.07.08.04.44.04
 for <samba-technical@lists.samba.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jul 2019 04:44:06 -0700 (PDT)
To: samba-technical@lists.samba.org
Subject: Pipeline failing {Timed out (120 sec) waiting for dns_update_cache
 PID 22244 at
 /tmp/samba-testbase/b22/samba-ad-dc-backup/selftest/target/Samba4.pm line
 279}
Message-ID: <9e8b94a3-b30b-f5b1-9f36-54af672b2b61@redhat.com>
Date: Mon, 8 Jul 2019 17:14:03 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Amit Kumar via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amit Kumar <amitkuma@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

https://gitlab.com/amitkuma/samba/pipelines/68302609

xattr_tdb_fsetxattr() failed to get vfs_handle->data!
xattr_tdb_fremovexattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_getxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fgetxattr() failed to get vfs_handle->data!
xattr_tdb_fsetxattr() failed to get vfs_handle->data!
samba version 4.11.0pre1-DEVELOPERBUILD started.
Copyright Andrew Tridgell and the Samba Team 1992-2019
binary_smbd_main: samba PID 22244 was called with maxruntime 18000 -
current ts 1562585024
binary_smbd_main: samba: using 'prefork' process model
Attempting to autogenerate TLS self-signed keys for https for hostname
'LABDC.labdom.samba.example.com'
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Failed to create
/tmp/samba-testbase/b22/prefix/samba-ad-dc-backup/var/cores for user 0
with mode 0700
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Unable to setup
corepath for smbd: No such file or directory
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: smbd version
4.11.0pre1-DEVELOPERBUILD started.
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Copyright Andrew
Tridgell and the Samba Team 1992-2019
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Failed to
create /tmp/samba-testbase/b22/prefix/samba-ad-dc-backup/var/cores for
user 0 with mode 0700
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Unable to setup
corepath for winbindd: No such file or directory
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Failed to
create /tmp/samba-testbase/b22/prefix/samba-ad-dc-backup/var/cores for
user 0 with mode 0700
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Unable to setup
corepath for winbindd: No such file or directory
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: winbindd
version 4.11.0pre1-DEVELOPERBUILD started.
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Copyright
Andrew Tridgell and the Samba Team 1992-2019
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: INFO: Profiling
turned OFF from pid 22256
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd:
initialize_winbindd_cache: clearing cache and re-creating with version
number 2
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: daemon_ready:
daemon 'winbindd' finished starting up and ready to serve connections
TLS self-signed keys generated OK
Doing a full scan on
DC=ForestDnsZones,DC=labdom,DC=samba,DC=example,DC=com and looking for
deleted objects
Doing a full scan on
DC=DomainDnsZones,DC=labdom,DC=samba,DC=example,DC=com and looking for
deleted objects
Doing a full scan on DC=labdom,DC=samba,DC=example,DC=com and looking
for deleted objects
Doing a full scan on
CN=Configuration,DC=labdom,DC=samba,DC=example,DC=com and looking for
deleted objects
dnsupdate_nameupdate_done: Failed DNS update with exit code 110
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Test dummy executed!
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: daemon_ready:
daemon 'smbd' finished starting up and ready to serve connections
/tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Failed to fetch record!
dnsupdate_nameupdate_done: Failed DNS update with exit code 110
../../source4/dsdb/dns/dns_update.c:354: Failed SPN update - with error
code 110
samba_parent_shutdown: samba_shutdown of samba 22244: from 22341
samba child process 22244 exited with value 0
Timed out (120 sec) waiting for dns_update_cache PID 22244 at
/tmp/samba-testbase/b22/samba-ad-dc-backup/selftest/target/Samba4.pm
line 279.
Samba 22244 failed to start up at
/tmp/samba-testbase/b22/samba-ad-dc-backup/selftest/target/Samba4.pm
line 161.
failed to start up environment 'labdc' at
/tmp/samba-testbase/b22/samba-ad-dc-backup/selftest/target/Samba.pm line 88.
samba can't start up known environment 'labdc' at
/tmp/samba-testbase/b22/samba-ad-dc-backup/selftest/selftest.pl line 883.

==> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <==
[11(84)/49 at 19m50s] samba4.blackbox.ldapcmp_restore(labdc)
ERROR: Testsuite[samba4.blackbox.ldapcmp_restore(labdc)]
REASON: unable to set up environment labdc - exiting



FAILED (0 failures, 0 errors and 0 unexpected successes in 1 testsuites)

A summary with detailed information can be found in:
  ./bin/ab/summary

==> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <==
/tmp/samba-testbase/b22/samba-ad-dc-backup/selftest/selftest.pl:
PID[19750]: Got SIGPIPE teardown environments.
teardown_env(backupfromdc)
samba_parent_shutdown: samba_shutdown of samba 19929: from 22342
samba child process 19929 exited with value 0
SAMBA LOG of: BACKUPFROMDC pid 19929
Doing a full scan on
DC=ForestDnsZones,DC=backupdom,DC=samba,DC=example,DC=com and looking
for deleted objects
Doing a full scan on
DC=DomainDnsZones,DC=backupdom,DC=samba,DC=example,DC=com and looking
for deleted objects
Doing a full scan on
CN=Configuration,DC=backupdom,DC=samba,DC=example,DC=com and looking for
deleted objects
Doing a full scan on DC=backupdom,DC=samba,DC=example,DC=com and looking
for deleted objects
python3: WARNING: The "server schannel" option is deprecated
python3: WARNING: The "server schannel" option is deprecated
python3: WARNING: The "server schannel" option is deprecated
python3: WARNING: The "server schannel" option is deprecated
samba_parent_shutdown: samba_shutdown of samba 19929: from 22342
teardown_env(restoredc)
samba_parent_shutdown: samba_shutdown of samba 20574: from 22343
samba child process 20574 exited with value 0
SAMBA LOG of: RESTOREDC pid 20574
samba_parent_shutdown: samba_shutdown of samba 20574: from 22343
teardown_env(ad_dc_backup)
samba_parent_shutdown: samba_shutdown of samba 21024: from 22344
samba child process 21024 exited with value 0
SAMBA LOG of: ADDC pid 21024
python3: WARNING: The "server schannel" option is deprecated
python3: WARNING: The "server schannel" option is deprecated
python3: WARNING: The "server schannel" option is deprecated
python3: WARNING: The "server schannel" option is deprecated
samba_parent_shutdown: samba_shutdown of samba 21024: from 22344
teardown_env(renamedc)
samba_parent_shutdown: samba_shutdown of samba 20317: from 22345
samba child process 20317 exited with value 0
SAMBA LOG of: RENAMEDC pid 20317
samba_parent_shutdown: samba_shutdown of samba 20317: from 22345
teardown_env(offlinebackupdc)
samba_parent_shutdown: samba_shutdown of samba 20063: from 22346
samba child process 20063 exited with value 0
SAMBA LOG of: OFFLINEBACKUPDC pid 20063
dnsupdate_nameupdate_done: Failed DNS update with exit code 110
../../source4/dsdb/dns/dns_update.c:354: Failed SPN update - with error
code 110
samba_parent_shutdown: samba_shutdown of samba 20063: from 22346
perl(19750)-+-pstree(22347)
            `-python3(19762)-+-sh(19764)---tee(19765)
                             `-{python3}(19770)
/tmp/samba-testbase/b22/samba-ad-dc-backup/selftest/selftest.pl:
PID[19750]: Exiting...
dns_hub: after poll()
dns_hub: after serve_forever()
dns_hub: before exit()

==> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <==
TOP 10 slowest tests
samba4.blackbox.ldapcmp_restore(labdc) -> 1562584978
samba.tests.domain_backup(ad_dc_backup:local) -> 535
samba.tests.domain_backup(restoredc:local) -> 393
samba.tests.samba_tool.gpo(offlinebackupdc:local) -> 30
samba.tests.samba_tool.gpo(restoredc:local) -> 28
samba.tests.samba_tool.gpo(renamedc:local) -> 26
samba4.blackbox.ldapcmp_restore(offlinebackupdc) -> 7
samba4.blackbox.ldapcmp_restore(renamedc) -> 4
samba4.blackbox.ldapcmp_restore(restoredc) -> 4
samba.tests.ntacls_backup(restoredc:local) -> 3
ERROR: test failed with exit code 1
Makefile:16: recipe for target 'test' failed

==> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <==
make: *** [test] Error 1
samba-ad-dc-backup: [test] failed 'make test FAIL_IMMEDIATELY=1
TESTS='--include-env=backupfromdc --include-env=restoredc
--include-env=renamedc --include-env=offlinebackupdc --include-env=labdc
--include-env=ad_dc_backup'' with status 2
waiting for tail to flush
Running: 'uname -a' in '.'
Running: 'lsb_release -a' in '.'
No LSB modules are available.
Running: 'free' in '.'
Running: 'mount' in '.'
Running: 'cat /proc/cpuinfo' in '.'
Running: 'cc --version' in '.'
Running: 'df -m .' in '.'
Running: 'df -m /tmp/samba-testbase/b22' in '.'


####################################################################

AUTOBUILD FAILURE

Your autobuild[master] on runner-72989761-project-10891704-concurrent-0
failed after 40.2 minutes
when trying to test samba-ad-dc-backup with the following error:

   samba-ad-dc-backup: [test] failed 'make test FAIL_IMMEDIATELY=1
TESTS='--include-env=backupfromdc --include-env=restoredc
--include-env=renamedc --include-env=offlinebackupdc --include-env=labdc
--include-env=ad_dc_backup'' with status 2

the autobuild has been abandoned. Please fix the error and resubmit.

####################################################################


samba-ad-dc-backup: [test] failed 'make test FAIL_IMMEDIATELY=1
TESTS='--include-env=backupfromdc --include-env=restoredc
--include-env=renamedc --include-env=offlinebackupdc --include-env=labdc
--include-env=ad_dc_backup'' with status 2
Logs in logs.tar.gz
Running after script...
$ mount
overlay on / type overlay
(rw,relatime,lowerdir=/var/lib/docker/overlay2/l/U35P5WVEUM72UPBJDR3WCE3GY5:/var/lib/docker/overlay2/l/2FRVSJZNAJOAPKUM2FAZ524X37:/var/lib/docker/overlay2/l/5NXTSYZT4AVJR4JKASTCH6N3WA:/var/lib/docker/overlay2/l/ZA7TPER5DWRRQZ3HZGVYDDA3WY:/var/lib/docker/overlay2/l/FFNIQI5VO7TLYRV64CK77BJKSF:/var/lib/docker/overlay2/l/P72OZWKNPCKL5IH3762WP2XOIB:/var/lib/docker/overlay2/l/DPOLKGENUA5UOFBSTUXN6STXOK:/var/lib/docker/overlay2/l/BNNKFTW7362WZ23RQ32BEFIWYL:/var/lib/docker/overlay2/l/ANBYYSSAMHDZIV662RZLK2XNF5,upperdir=/var/lib/docker/overlay2/25018cae65d533db33b10bf9d4668ebca686cac375318674316718f9a4dedf95/diff,workdir=/var/lib/docker/overlay2/25018cae65d533db33b10bf9d4668ebca686cac375318674316718f9a4dedf95/work)
proc on /proc type proc (rw,nosuid,nodev,noexec,relatime)
tmpfs on /dev type tmpfs (rw,nosuid,seclabel,size=65536k,mode=755)
devpts on /dev/pts type devpts
(rw,nosuid,noexec,relatime,seclabel,gid=5,mode=620,ptmxmode=666)
sysfs on /sys type sysfs (rw,nosuid,nodev,noexec,relatime,seclabel)
tmpfs on /sys/fs/cgroup type tmpfs
(rw,nosuid,nodev,noexec,relatime,seclabel,mode=755)
cgroup on /sys/fs/cgroup/systemd type cgroup
(rw,nosuid,nodev,noexec,relatime,xattr,release_agent=/usr/lib/systemd/systemd-cgroups-agent,name=systemd)
cgroup on /sys/fs/cgroup/cpu,cpuacct type cgroup
(rw,nosuid,nodev,noexec,relatime,cpu,cpuacct)
cgroup on /sys/fs/cgroup/cpuset type cgroup
(rw,nosuid,nodev,noexec,relatime,cpuset)
cgroup on /sys/fs/cgroup/memory type cgroup
(rw,nosuid,nodev,noexec,relatime,memory)
cgroup on /sys/fs/cgroup/devices type cgroup
(rw,nosuid,nodev,noexec,relatime,devices)
cgroup on /sys/fs/cgroup/hugetlb type cgroup
(rw,nosuid,nodev,noexec,relatime,hugetlb)
cgroup on /sys/fs/cgroup/perf_event type cgroup
(rw,nosuid,nodev,noexec,relatime,perf_event)
cgroup on /sys/fs/cgroup/net_cls,net_prio type cgroup
(rw,nosuid,nodev,noexec,relatime,net_cls,net_prio)
cgroup on /sys/fs/cgroup/pids type cgroup
(rw,nosuid,nodev,noexec,relatime,pids)
cgroup on /sys/fs/cgroup/freezer type cgroup
(rw,nosuid,nodev,noexec,relatime,freezer)
cgroup on /sys/fs/cgroup/blkio type cgroup
(rw,nosuid,nodev,noexec,relatime,blkio)
mqueue on /dev/mqueue type mqueue (rw,nosuid,nodev,noexec,relatime,seclabel)
/dev/sda9 on /builds type ext4 (rw,relatime,seclabel)
/dev/sda9 on /etc/resolv.conf type ext4 (rw,relatime,seclabel)
/dev/sda9 on /etc/hostname type ext4 (rw,relatime,seclabel)
/dev/sda9 on /etc/hosts type ext4 (rw,relatime,seclabel)
shm on /dev/shm type tmpfs
(rw,nosuid,nodev,noexec,relatime,seclabel,size=65536k)
/dev/sda9 on /sys/devices/virtual/dmi/id type ext4 (ro,relatime,seclabel)
$ df -h
Filesystem      Size  Used Avail Use% Mounted on
overlay          22G  8.1G   13G  39% /
tmpfs            64M     0   64M   0% /dev
tmpfs           1.9G     0  1.9G   0% /sys/fs/cgroup
/dev/sda9        22G  8.1G   13G  39% /builds
shm              64M     0   64M   0% /dev/shm
$ cat /proc/swaps
Filename                Type        Size    Used    Priority
/var/vm/swapfile1                       file        2097148    310784    -2
$ free -h
              total        used        free      shared  buff/cache  
available
Mem:           3.6G        303M        3.0G        122M       
282M        3.0G
Swap:          2.0G        303M        1.7G
ERROR: Job failed: exit code 1

Thanks
Amit


