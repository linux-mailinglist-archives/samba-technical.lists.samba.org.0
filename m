Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B7C62CAF
	for <lists+samba-technical@lfdr.de>; Tue,  9 Jul 2019 01:34:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=nqRuM0StNnmtFJpBrdeUoCiCUgLbNQ0zXk53ILsrFfk=; b=qI4nz5EhvkdJsDQIuzCm+OzM/B
	vbZLP+i6Ggkfe1u9qBP5mk7X5J+Z+c2iBjsTrfmc8/DjauPslI5MHNH79Hnu+KXnPHzKL2ZRKd9MC
	VUc/XQygu1BvxkHE+9ERj2EzCNvI7ihZMxI9XoSos3gAek5ZEAuKDOLvgPKx+hsQo6GD2y2AEWNBk
	H+8ZN/tWgOugGFft3VbGqe1mD3BbaUjP0piZX3LIAClUHu7rlAxs86WfmyalUosm6SaQ+lNmya40A
	1P4ZGrzmpo323kL3hCYVD9jk1Fkx9DcU5A4RfFyB/Zidd8r+4gE68efc3Jl9XcFtpa18zvk4Bsc5V
	F7Cb9U9g==;
Received: from localhost ([::1]:37208 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hkd94-005vsn-Ve; Mon, 08 Jul 2019 23:34:07 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz ([202.78.240.226]:50896) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hkd8x-005vsg-6p
 for samba-technical@lists.samba.org; Mon, 08 Jul 2019 23:34:04 +0000
Received: from [IPv6:2404:130:0:1000:ed06:1c1d:e56c:b595] (unknown
 [IPv6:2404:130:0:1000:ed06:1c1d:e56c:b595])
 (Authenticated sender: timbeale@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id C9A91810D0; 
 Tue,  9 Jul 2019 11:33:27 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1562628807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=4dkM4Rev+gdJgk8X9ZTbuPFBkOeh4alN0cvXywcYhBs=;
 b=qs48bJypQAFbza4GTphf4vNjnyVH9HxqxENE6gxCMRgK7JWdrOhOGFuPxf/VdlNiqnCXDH
 4SnXTNGHop75FFkeQMcqFvx7niqw61xPSaHYt8zaClJ/GoGHqsDK2AtqLTHkdQ9qOSa5Xy
 ROHJWM0woz7GCCioJitUd8fHsxqpUFOMNcd9JYzCiERxk53BgTm3tv5RQwlgX39bnMFDJi
 rfldtlTe3Iyat9xmuiFkTOXOmCbH3NSKFVo8WJBnxNGctd0bFIXnoMZn7nxQNW0Ab75oIi
 V7xq8tQapht1kQJ1oGHlGJmCRVggh4c/s7wb4EfCd8ZHi+7t/YBPHzusUCLQEw==
Subject: Re: Pipeline failing {Timed out (120 sec) waiting for
 dns_update_cache PID 22244 at
 /tmp/samba-testbase/b22/samba-ad-dc-backup/selftest/target/Samba4.pm line
 279}
To: Amit Kumar <amitkuma@redhat.com>, samba-technical@lists.samba.org
References: <9e8b94a3-b30b-f5b1-9f36-54af672b2b61@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <7ea375cc-7e24-71cf-e270-1277b0bca3c3@catalyst.net.nz>
Date: Tue, 9 Jul 2019 11:33:27 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <9e8b94a3-b30b-f5b1-9f36-54af672b2b61@redhat.com>
Content-Language: en-US
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1562628808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=4dkM4Rev+gdJgk8X9ZTbuPFBkOeh4alN0cvXywcYhBs=;
 b=kZxl6cvJQRxl+1pqXG3Sy6kbqOep7UXynQjp+q7OHSH7IP8/ITVBi8CRXCBw2ohkxFHTV7
 zOwG3ioJXdY/ir/fqfAlrJZT/wxjsmwj4edJAqj80skKGLcEKVLqm5GHdspjeWKEOilxt2
 JyT7Luk2jA4fTqLim0/HUzrAap4vny7JIR8S5Qg5+vo2FcpDg+3R10eWcmxs3bMK27jujZ
 LV7DLtocJOYIG+p756mTyWZmILisjRDed1T7t9igmvF9vYfZmNP1hjNnKU5WqHwkT1bp/C
 SA1xOdoxoAXKZ8ZdqF23QK+KRUkozH1n+UWfNkt/KeOkdti1d4DkTEyPb1E8Xg==
ARC-Seal: i=1; s=default; d=catalyst.net.nz; t=1562628808; a=rsa-sha256;
 cv=none;
 b=faZ3o+Ew7BtnQQpKjlF/KMcC3dowOJrCKX4KTdhCcTfkBofcgsq2dhVtY9U7MUkobWgubs
 SPfYflkX4eQ8gjI3/LMicfRWyVdnyy92rHfnVExUy3AABiS3Tdvpg522pWfEtOz89eF6CS
 yh66imo3He63KM6evI91NDtftceVSfPTumTnJLxYRm3WFZtXHAZTFgR0RSLlddDQ/bhbme
 8i1CI0gO95gNn+wUQOzG5ANTLybQIAljIfurW3XhbcpiAf++59F9/A3FIUjcsCF4is/84d
 gJTtGbJafmIFqBiAod9MF+Jbasftt9uP2rG8Mi/MM+3xEaZpc7MLRA2gQKxkKw==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=timbeale@catalyst.net.nz
 smtp.mailfrom=timbeale@catalyst.net.nz
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Tim Beale via samba-technical <samba-technical@lists.samba.org>
Reply-To: Tim Beale <timbeale@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Try rebasing. This should be fixed by
https://gitlab.com/samba-team/samba/commit/98e34c299ddd8b24f3daeeafe45ab136ad015a47

The downside to this change is the autobuild job now uses a private CI
runner, so it will no longer run at all (pass nor fail) on your private
fork of the samba repo.

To run the full set of CI tests, including the jobs that require a
private CI runner, you can either:
- Push your branch to https://gitlab.com/samba-team/devel/samba - see
https://wiki.samba.org/index.php/Samba_CI_on_gitlab#Other_Samba_developers
- Register your own gitlab runner
https://wiki.samba.org/index.php/CI_using_Your_own_gitlab_runner

On 8/07/19 11:44 PM, Amit Kumar via samba-technical wrote:
> Hello,
>
> https://gitlab.com/amitkuma/samba/pipelines/68302609
>
> xattr_tdb_fsetxattr() failed to get vfs_handle->data!
> xattr_tdb_fremovexattr() failed to get vfs_handle->data!
> xattr_tdb_fgetxattr() failed to get vfs_handle->data!
> xattr_tdb_fgetxattr() failed to get vfs_handle->data!
> xattr_tdb_fgetxattr() failed to get vfs_handle->data!
> xattr_tdb_fgetxattr() failed to get vfs_handle->data!
> xattr_tdb_fgetxattr() failed to get vfs_handle->data!
> xattr_tdb_getxattr() failed to get vfs_handle->data!
> xattr_tdb_fgetxattr() failed to get vfs_handle->data!
> xattr_tdb_fgetxattr() failed to get vfs_handle->data!
> xattr_tdb_fsetxattr() failed to get vfs_handle->data!
> samba version 4.11.0pre1-DEVELOPERBUILD started.
> Copyright Andrew Tridgell and the Samba Team 1992-2019
> binary_smbd_main: samba PID 22244 was called with maxruntime 18000 -
> current ts 1562585024
> binary_smbd_main: samba: using 'prefork' process model
> Attempting to autogenerate TLS self-signed keys for https for hostname
> 'LABDC.labdom.samba.example.com'
> /tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Failed to create
> /tmp/samba-testbase/b22/prefix/samba-ad-dc-backup/var/cores for user 0
> with mode 0700
> /tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Unable to setup
> corepath for smbd: No such file or directory
> /tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: smbd version
> 4.11.0pre1-DEVELOPERBUILD started.
> /tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Copyright Andrew
> Tridgell and the Samba Team 1992-2019
> /tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Failed to
> create /tmp/samba-testbase/b22/prefix/samba-ad-dc-backup/var/cores for
> user 0 with mode 0700
> /tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Unable to setup
> corepath for winbindd: No such file or directory
> /tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Failed to
> create /tmp/samba-testbase/b22/prefix/samba-ad-dc-backup/var/cores for
> user 0 with mode 0700
> /tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Unable to setup
> corepath for winbindd: No such file or directory
> /tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: winbindd
> version 4.11.0pre1-DEVELOPERBUILD started.
> /tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: Copyright
> Andrew Tridgell and the Samba Team 1992-2019
> /tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: INFO: Profiling
> turned OFF from pid 22256
> /tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd:
> initialize_winbindd_cache: clearing cache and re-creating with version
> number 2
> /tmp/samba-testbase/b22/samba-ad-dc-backup/bin/winbindd: daemon_ready:
> daemon 'winbindd' finished starting up and ready to serve connections
> TLS self-signed keys generated OK
> Doing a full scan on
> DC=ForestDnsZones,DC=labdom,DC=samba,DC=example,DC=com and looking for
> deleted objects
> Doing a full scan on
> DC=DomainDnsZones,DC=labdom,DC=samba,DC=example,DC=com and looking for
> deleted objects
> Doing a full scan on DC=labdom,DC=samba,DC=example,DC=com and looking
> for deleted objects
> Doing a full scan on
> CN=Configuration,DC=labdom,DC=samba,DC=example,DC=com and looking for
> deleted objects
> dnsupdate_nameupdate_done: Failed DNS update with exit code 110
> /tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Test dummy executed!
> /tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: daemon_ready:
> daemon 'smbd' finished starting up and ready to serve connections
> /tmp/samba-testbase/b22/samba-ad-dc-backup/bin/smbd: Failed to fetch record!
> dnsupdate_nameupdate_done: Failed DNS update with exit code 110
> ../../source4/dsdb/dns/dns_update.c:354: Failed SPN update - with error
> code 110
> samba_parent_shutdown: samba_shutdown of samba 22244: from 22341
> samba child process 22244 exited with value 0
> Timed out (120 sec) waiting for dns_update_cache PID 22244 at
> /tmp/samba-testbase/b22/samba-ad-dc-backup/selftest/target/Samba4.pm
> line 279.
> Samba 22244 failed to start up at
> /tmp/samba-testbase/b22/samba-ad-dc-backup/selftest/target/Samba4.pm
> line 161.
> failed to start up environment 'labdc' at
> /tmp/samba-testbase/b22/samba-ad-dc-backup/selftest/target/Samba.pm line 88.
> samba can't start up known environment 'labdc' at
> /tmp/samba-testbase/b22/samba-ad-dc-backup/selftest/selftest.pl line 883.
>
> ==> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <==
> [11(84)/49 at 19m50s] samba4.blackbox.ldapcmp_restore(labdc)
> ERROR: Testsuite[samba4.blackbox.ldapcmp_restore(labdc)]
> REASON: unable to set up environment labdc - exiting
>
>
>
> FAILED (0 failures, 0 errors and 0 unexpected successes in 1 testsuites)
>
> A summary with detailed information can be found in:
>   ./bin/ab/summary
>
> ==> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <==
> /tmp/samba-testbase/b22/samba-ad-dc-backup/selftest/selftest.pl:
> PID[19750]: Got SIGPIPE teardown environments.
> teardown_env(backupfromdc)
> samba_parent_shutdown: samba_shutdown of samba 19929: from 22342
> samba child process 19929 exited with value 0
> SAMBA LOG of: BACKUPFROMDC pid 19929
> Doing a full scan on
> DC=ForestDnsZones,DC=backupdom,DC=samba,DC=example,DC=com and looking
> for deleted objects
> Doing a full scan on
> DC=DomainDnsZones,DC=backupdom,DC=samba,DC=example,DC=com and looking
> for deleted objects
> Doing a full scan on
> CN=Configuration,DC=backupdom,DC=samba,DC=example,DC=com and looking for
> deleted objects
> Doing a full scan on DC=backupdom,DC=samba,DC=example,DC=com and looking
> for deleted objects
> python3: WARNING: The "server schannel" option is deprecated
> python3: WARNING: The "server schannel" option is deprecated
> python3: WARNING: The "server schannel" option is deprecated
> python3: WARNING: The "server schannel" option is deprecated
> samba_parent_shutdown: samba_shutdown of samba 19929: from 22342
> teardown_env(restoredc)
> samba_parent_shutdown: samba_shutdown of samba 20574: from 22343
> samba child process 20574 exited with value 0
> SAMBA LOG of: RESTOREDC pid 20574
> samba_parent_shutdown: samba_shutdown of samba 20574: from 22343
> teardown_env(ad_dc_backup)
> samba_parent_shutdown: samba_shutdown of samba 21024: from 22344
> samba child process 21024 exited with value 0
> SAMBA LOG of: ADDC pid 21024
> python3: WARNING: The "server schannel" option is deprecated
> python3: WARNING: The "server schannel" option is deprecated
> python3: WARNING: The "server schannel" option is deprecated
> python3: WARNING: The "server schannel" option is deprecated
> samba_parent_shutdown: samba_shutdown of samba 21024: from 22344
> teardown_env(renamedc)
> samba_parent_shutdown: samba_shutdown of samba 20317: from 22345
> samba child process 20317 exited with value 0
> SAMBA LOG of: RENAMEDC pid 20317
> samba_parent_shutdown: samba_shutdown of samba 20317: from 22345
> teardown_env(offlinebackupdc)
> samba_parent_shutdown: samba_shutdown of samba 20063: from 22346
> samba child process 20063 exited with value 0
> SAMBA LOG of: OFFLINEBACKUPDC pid 20063
> dnsupdate_nameupdate_done: Failed DNS update with exit code 110
> ../../source4/dsdb/dns/dns_update.c:354: Failed SPN update - with error
> code 110
> samba_parent_shutdown: samba_shutdown of samba 20063: from 22346
> perl(19750)-+-pstree(22347)
>             `-python3(19762)-+-sh(19764)---tee(19765)
>                              `-{python3}(19770)
> /tmp/samba-testbase/b22/samba-ad-dc-backup/selftest/selftest.pl:
> PID[19750]: Exiting...
> dns_hub: after poll()
> dns_hub: after serve_forever()
> dns_hub: before exit()
>
> ==> /builds/amitkuma/samba/samba-ad-dc-backup.stdout <==
> TOP 10 slowest tests
> samba4.blackbox.ldapcmp_restore(labdc) -> 1562584978
> samba.tests.domain_backup(ad_dc_backup:local) -> 535
> samba.tests.domain_backup(restoredc:local) -> 393
> samba.tests.samba_tool.gpo(offlinebackupdc:local) -> 30
> samba.tests.samba_tool.gpo(restoredc:local) -> 28
> samba.tests.samba_tool.gpo(renamedc:local) -> 26
> samba4.blackbox.ldapcmp_restore(offlinebackupdc) -> 7
> samba4.blackbox.ldapcmp_restore(renamedc) -> 4
> samba4.blackbox.ldapcmp_restore(restoredc) -> 4
> samba.tests.ntacls_backup(restoredc:local) -> 3
> ERROR: test failed with exit code 1
> Makefile:16: recipe for target 'test' failed
>
> ==> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <==
> make: *** [test] Error 1
> samba-ad-dc-backup: [test] failed 'make test FAIL_IMMEDIATELY=1
> TESTS='--include-env=backupfromdc --include-env=restoredc
> --include-env=renamedc --include-env=offlinebackupdc --include-env=labdc
> --include-env=ad_dc_backup'' with status 2
> waiting for tail to flush
> Running: 'uname -a' in '.'
> Running: 'lsb_release -a' in '.'
> No LSB modules are available.
> Running: 'free' in '.'
> Running: 'mount' in '.'
> Running: 'cat /proc/cpuinfo' in '.'
> Running: 'cc --version' in '.'
> Running: 'df -m .' in '.'
> Running: 'df -m /tmp/samba-testbase/b22' in '.'
>
>
> ####################################################################
>
> AUTOBUILD FAILURE
>
> Your autobuild[master] on runner-72989761-project-10891704-concurrent-0
> failed after 40.2 minutes
> when trying to test samba-ad-dc-backup with the following error:
>
>    samba-ad-dc-backup: [test] failed 'make test FAIL_IMMEDIATELY=1
> TESTS='--include-env=backupfromdc --include-env=restoredc
> --include-env=renamedc --include-env=offlinebackupdc --include-env=labdc
> --include-env=ad_dc_backup'' with status 2
>
> the autobuild has been abandoned. Please fix the error and resubmit.
>
> ####################################################################
>
>
> samba-ad-dc-backup: [test] failed 'make test FAIL_IMMEDIATELY=1
> TESTS='--include-env=backupfromdc --include-env=restoredc
> --include-env=renamedc --include-env=offlinebackupdc --include-env=labdc
> --include-env=ad_dc_backup'' with status 2
> Logs in logs.tar.gz
> Running after script...
> $ mount
> overlay on / type overlay
> (rw,relatime,lowerdir=/var/lib/docker/overlay2/l/U35P5WVEUM72UPBJDR3WCE3GY5:/var/lib/docker/overlay2/l/2FRVSJZNAJOAPKUM2FAZ524X37:/var/lib/docker/overlay2/l/5NXTSYZT4AVJR4JKASTCH6N3WA:/var/lib/docker/overlay2/l/ZA7TPER5DWRRQZ3HZGVYDDA3WY:/var/lib/docker/overlay2/l/FFNIQI5VO7TLYRV64CK77BJKSF:/var/lib/docker/overlay2/l/P72OZWKNPCKL5IH3762WP2XOIB:/var/lib/docker/overlay2/l/DPOLKGENUA5UOFBSTUXN6STXOK:/var/lib/docker/overlay2/l/BNNKFTW7362WZ23RQ32BEFIWYL:/var/lib/docker/overlay2/l/ANBYYSSAMHDZIV662RZLK2XNF5,upperdir=/var/lib/docker/overlay2/25018cae65d533db33b10bf9d4668ebca686cac375318674316718f9a4dedf95/diff,workdir=/var/lib/docker/overlay2/25018cae65d533db33b10bf9d4668ebca686cac375318674316718f9a4dedf95/work)
> proc on /proc type proc (rw,nosuid,nodev,noexec,relatime)
> tmpfs on /dev type tmpfs (rw,nosuid,seclabel,size=65536k,mode=755)
> devpts on /dev/pts type devpts
> (rw,nosuid,noexec,relatime,seclabel,gid=5,mode=620,ptmxmode=666)
> sysfs on /sys type sysfs (rw,nosuid,nodev,noexec,relatime,seclabel)
> tmpfs on /sys/fs/cgroup type tmpfs
> (rw,nosuid,nodev,noexec,relatime,seclabel,mode=755)
> cgroup on /sys/fs/cgroup/systemd type cgroup
> (rw,nosuid,nodev,noexec,relatime,xattr,release_agent=/usr/lib/systemd/systemd-cgroups-agent,name=systemd)
> cgroup on /sys/fs/cgroup/cpu,cpuacct type cgroup
> (rw,nosuid,nodev,noexec,relatime,cpu,cpuacct)
> cgroup on /sys/fs/cgroup/cpuset type cgroup
> (rw,nosuid,nodev,noexec,relatime,cpuset)
> cgroup on /sys/fs/cgroup/memory type cgroup
> (rw,nosuid,nodev,noexec,relatime,memory)
> cgroup on /sys/fs/cgroup/devices type cgroup
> (rw,nosuid,nodev,noexec,relatime,devices)
> cgroup on /sys/fs/cgroup/hugetlb type cgroup
> (rw,nosuid,nodev,noexec,relatime,hugetlb)
> cgroup on /sys/fs/cgroup/perf_event type cgroup
> (rw,nosuid,nodev,noexec,relatime,perf_event)
> cgroup on /sys/fs/cgroup/net_cls,net_prio type cgroup
> (rw,nosuid,nodev,noexec,relatime,net_cls,net_prio)
> cgroup on /sys/fs/cgroup/pids type cgroup
> (rw,nosuid,nodev,noexec,relatime,pids)
> cgroup on /sys/fs/cgroup/freezer type cgroup
> (rw,nosuid,nodev,noexec,relatime,freezer)
> cgroup on /sys/fs/cgroup/blkio type cgroup
> (rw,nosuid,nodev,noexec,relatime,blkio)
> mqueue on /dev/mqueue type mqueue (rw,nosuid,nodev,noexec,relatime,seclabel)
> /dev/sda9 on /builds type ext4 (rw,relatime,seclabel)
> /dev/sda9 on /etc/resolv.conf type ext4 (rw,relatime,seclabel)
> /dev/sda9 on /etc/hostname type ext4 (rw,relatime,seclabel)
> /dev/sda9 on /etc/hosts type ext4 (rw,relatime,seclabel)
> shm on /dev/shm type tmpfs
> (rw,nosuid,nodev,noexec,relatime,seclabel,size=65536k)
> /dev/sda9 on /sys/devices/virtual/dmi/id type ext4 (ro,relatime,seclabel)
> $ df -h
> Filesystem      Size  Used Avail Use% Mounted on
> overlay          22G  8.1G   13G  39% /
> tmpfs            64M     0   64M   0% /dev
> tmpfs           1.9G     0  1.9G   0% /sys/fs/cgroup
> /dev/sda9        22G  8.1G   13G  39% /builds
> shm              64M     0   64M   0% /dev/shm
> $ cat /proc/swaps
> Filename                Type        Size    Used    Priority
> /var/vm/swapfile1                       file        2097148    310784    -2
> $ free -h
>               total        used        free      shared  buff/cache  
> available
> Mem:           3.6G        303M        3.0G        122M       
> 282M        3.0G
> Swap:          2.0G        303M        1.7G
> ERROR: Job failed: exit code 1
>
> Thanks
> Amit
>
>
