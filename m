Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFDD792F7A
	for <lists+samba-technical@lfdr.de>; Tue,  5 Sep 2023 22:07:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=A6ifJ4gNE52yO/l7ILg1w6Z72wyrrpppqh6u0Lw0eFw=; b=HJxZZvFl0ejCdzKR8akq/SCgwv
	97kN86/OCzIyVFZt7HMAHpL7+oedcQjkdrrDmGIsojm3DZ8NRDqr5IGLsHEMgh4Z7AkGKVBRynaCc
	vOL7lmXsuQhj+ORLH1mn2EaHS5VScXUNDbuZfEXlZNvZl3vEg+blEyZ1jmpAkT8gkVsELjUj39DmV
	XIbbMZ4CsDOwuLa0K+IVuL2IbPH/kquvqhiwIUTBdAU2j6Diy+T7Ecvq/7/p5rJC/22pleLls2qWn
	IWjQ7FZKvID8enlqs8fQ/x3zpvfCxvznu24H5iHqK8lghjBBaoJGzsw/q0KEVe/gKKIIRpxpuTpfz
	AR73TFMA==;
Received: from ip6-localhost ([::1]:30320 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qdcK3-0011SH-TH; Tue, 05 Sep 2023 20:06:51 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:61664) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qdcJw-0011S8-Cz
 for samba-technical@lists.samba.org; Tue, 05 Sep 2023 20:06:49 +0000
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-68c3b9f85b7so1655905b3a.2
 for <samba-technical@lists.samba.org>; Tue, 05 Sep 2023 13:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=opendrives.com; s=google; t=1693944401; x=1694549201; darn=lists.samba.org; 
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=eExIhXP4K6XgtFUDdS4NzYfy0lgYiTt/TXByfrHvJ04=;
 b=JS8NlE8sFPliOlv1oEc76/rS7kpYJrJIHk21o0CHtgntO8JQZmPfxgErvS9C5CmaQo
 /8CDHuHHnfuNl7wvcKitCot465AmwdBbCmqn4vScyR8zDJRWuuWa29H48ZEi7hEopk+/
 D1D2dA0aWtvVVPqCLMH1DsJUyXgFOWPfAZ7LTHKRty9CUp8w0IB77QUdxFFbtdxpO1WB
 QwuwpV4KFQuH2HuQz4UtP5hRJORsXpBstRqtvQmvDJQAMO3Ob5FfkWBVr5v4P24nLIMo
 52YQsmR68m/9FEMXSFIDi19KWErmch+TYDc2ALHVfP2aPsHxoE2k/f6BzlURQBj1P+c+
 KFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693944401; x=1694549201;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eExIhXP4K6XgtFUDdS4NzYfy0lgYiTt/TXByfrHvJ04=;
 b=L9nsF3oI5bopC7Iyb1zvP4s7yTeqfqPYYQ3Kw+clE1l/yTUqoBl73ithfz1iXKi0sE
 4vdpwsV2YOSSm6YyN32/6mQkUJHY0btsuyeCWbumDkDjLRYDOwTfsgEeZc2kmQM9/8TE
 imEZidDzDFkOfbV78V9lfo3Zz4wlVY6n0VYuY7ZMYLhsXtJen4Ii0HtMKbsNpC1vZFbC
 JFvkfrt78pRrW762kcnr+wMPlr9gPnqQecX3Q33S+CGfhqsVxTuR2HYzciRP9IRFSDN8
 GvHXMBXRCO1psFxyKya9sIs5KUlPxTphqWq4jualDpstcWF61vn2hpH8Iy2P9V8qY3LG
 twkg==
X-Gm-Message-State: AOJu0Yxpr3STWY3JILAh6CJM7SXT2qFXpl7cPCLYQ+Vc0f4QS3j+IISy
 dr7iZQXoWrklfEiao1igyWiBHRUjpFig3dm1x+diVxrychZwc+CG+c80RkqLQDLcBBAwExzuqEE
 Jm/IDYjSqQNeTteFyZXGjd5hWJuabGU6zRXaaJaytL/mdZVQp7nm3lA==
X-Google-Smtp-Source: AGHT+IFGbz0+ughY6UcnkwRI65Id1Xl+dbv39nddsi3/KtfuWKStqnSxaEqcb7VQ2r2yVbewigYagyKLiHXAb2RFZ6c=
X-Received: by 2002:a05:6a00:1a93:b0:68a:69ba:6789 with SMTP id
 e19-20020a056a001a9300b0068a69ba6789mr13306577pfv.16.1693944400744; Tue, 05
 Sep 2023 13:06:40 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 5 Sep 2023 16:06:29 -0400
Message-ID: <CAKWrda4QOV5T0bxWjTsYSPpzUhbSzgBpzcAAcJir2HK3sTC0kg@mail.gmail.com>
Subject: Issues with smbd hanging; smbstatus
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Elliot Wasem via samba-technical <samba-technical@lists.samba.org>
Reply-To: Elliot Wasem <e.wasem@opendrives.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,


I am having trouble debugging some uniquely strange behavior that occurred
on Samba 4.13.13 Debian Buster. We=E2=80=99re currently scratching out head=
 about
it, so hopefully it=E2=80=99s familiar to someone on the lists!

We were experiencing the following symptoms:

When we ran the command "smbstatus", we observed that the command hung and
did not return. This was resolved by restarting the machine, though we=E2=
=80=99ve
been able to reproduce it a few times by invoking =E2=80=9Csmbstatus=E2=80=
=9D again. While
smbstatus was hung, users could no longer use their active Samba mounts, or
mount new clients. This happened around the time that a smbd panic was
logged in syslog, and so we are curious if the panic is related. We also
noticed that smbd is reporting not being able to connect to winbind,
despite winbind seeming otherwise healthy according to systemd logs.

We were unable to successfully read the core dump via gdb, even after
installing debug symbols.

I have listed below some excerpts from syslog, and the GDB session I ran in
attempting to debug this issue.

As background, we had a few issues recently that may be related;

   -

   We were seeing many (over 2k occurrences) entries like the following
   over the past few days, prior to the problems we encountered. To remedy
   this, we increased the ulimit on open files to (2^16)-1. We did not see
   this occur around the specific area of interest, but thought it was wort=
h
   mentioning here. The most recent occurrence of this prior to the primary
   area of concern is 2 days before.
   -

      DATET11:56:00.017245,host1,smbd[2596270]: [DATE 11:56:00.016924,  0]
      ../../source3/smbd/open.c:827(fd_open)
      -

      DATET11:56:00.017394,host1,smbd[2596270]:   Too many open files,
      unable to open more!  smbd's max open files =3D 16424
      -

   We also had an issue wherein winbind couldn=E2=80=99t always reliably re=
ach its
   DCs, and would sometimes be unable to connect for authentication. We
   restricted winbind to use a subset of available DCs via the smb.conf
   =E2=80=9Cpassword servers=E2=80=9D setting and fixed the list of DCs tha=
t winbind would try
   to connect to to a short list of known-good servers. This was resolved
   after observing the =E2=80=9Csmbstatus=E2=80=9D behavior and we have not=
 performed further
   testing on this issue since the setting was applied.



I am under the impression that "smbstatus" is merely revealing symptoms,
and is not the root cause of the issue. I believe this because we haven't
seen this issue elsewhere other than these systems, and "smbstatus" is used
regularly when we formulate SMB status reports, which generally works
without issue



I have a few main questions:

    1. Does this give any insight at all into what may have happened, or
sound familiar to anyone?

    2. The stack in the core file, as analyzed by GDB, is only a few items
long when analyzed with the "bt" command. I imagine the core dump facility
of SMBD probably isn=E2=80=99t configured correctly on my machine, or GDB i=
sn=E2=80=99t
picking up the data correctly. Can anyone point me to documentation around
gathering and reading samba cores?

3. Any recommendations for further debug or diagnostic measures to take to
diagnose this issue? It=E2=80=99s a bit of an odd one, and the systems seem=
 largely
correctly configured.


Further details listed below. Thank you for your time and consideration!

Thank you,

Elliot

SYSLOG ENTRIES:

DATET00:18:11.752254,host1,smbd[2254747]: [DATE 00:18:11.751973,  0]
../../source3/auth/auth_winbind.c:120(check_winbind_security)

DATET00:18:11.752729,host1,smbd[2254747]:   check_winbind_security:
winbindd not running - but required as domain member:
NT_STATUS_NO_LOGON_SERVERS

DATET00:18:12.489698,host1,Mount(Mount_Management)[2259973]: INFO:
Mount_Management monitor : 0:159(smb_panic_log)

DATET00:18:13.341266,host1,smbd[69758]: [DATE 00:18:13.340801,  0]
../../source3/lib/popt_common.c:68(popt_s3_talloc_log_fn)

DATET00:18:13.341445,host1,smbd[69758]:   Bad talloc magic value - unknown
value

DATET00:18:13.341484,host1,smbd[69758]: [DATE 00:18:13.341090,  0]
../../lib/util/fault.c:159(smb_panic_log)

DATET00:18:13.341526,host1,smbd[69758]:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

DATET00:18:13.341556,host1,smbd[69758]: [DATE 00:18:13.341106,  0]
../../lib/util/fault.c:160(smb_panic_log)

DATET00:18:13.341699,host1,smbd[69758]:   INTERNAL ERROR: Bad talloc magic
value - unknown value in pid 69758 (4.13.13-Debian)

DATET00:18:13.341737,host1,smbd[69758]: [DATE 00:18:13.341128,  0]
../../lib/util/fault.c:164(smb_panic_log)

DATET00:18:13.341771,host1,smbd[69758]:   If you are running a recent Samba
version, and if you think this problem is not yet fixed in the latest
versions, please consider reporting this bug, see
https://wiki.samba.org/index.php/Bug_Reporting

DATET00:18:13.341799,host1,smbd[69758]: [DATE 00:18:13.341142,  0]
../../lib/util/fault.c:169(smb_panic_log)

DATET00:18:13.341841,host1,smbd[69758]:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

DATET00:18:13.341865,host1,smbd[69758]: [DATE 00:18:13.341157,  0]
../../lib/util/fault.c:170(smb_panic_log)

DATET00:18:13.341893,host1,smbd[69758]:   PANIC (pid 69758): Bad talloc
magic value - unknown value in 4.13.13-Debian

DATET00:18:13.341921,host1,smbd[69758]: [DATE 00:18:13.341396,  0]
../../lib/util/fault.c:232(log_stack_trace)

DATET00:18:13.341949,host1,smbd[69758]:   BACKTRACE:

DATET00:18:13.342215,host1,smbd[69758]:    #0 log_stack_trace + 0x39
[ip=3D0x7f460eb27bd9] [sp=3D0x7ffff2fbe150]

DATET00:18:13.342928,host1,smbd[69758]:    #1 smb_panic + 0x26
[ip=3D0x7f460eb27f56] [sp=3D0x7ffff2fbea90]

DATET00:18:13.343334,host1,smbd[69758]:    #2 <unknown symbol>
[ip=3D0x7f460e442e58] [sp=3D0x7ffff2fbeba0]

DATET00:18:13.343334,host1,smbd[69758]:    #3 smbd_request_guid + 0x242
[ip=3D0x7f460e915562] [sp=3D0x7ffff2fbebd0]

DATET00:18:13.345131,host1,smbd[69758]:    #4
tevent_common_invoke_immediate_handler + 0x14a [ip=3D0x7f460e431b4a]
[sp=3D0x7ffff2fbebf0]

DATET00:18:13.345669,host1,smbd[69758]:    #5 tevent_common_loop_immediate
+ 0x1a [ip=3D0x7f460e431b6a] [sp=3D0x7ffff2fbec50]

DATET00:18:13.346065,host1,smbd[69758]:    #6 tevent_wakeup_recv + 0xe6c
[ip=3D0x7f460e43784c] [sp=3D0x7ffff2fbec70]

DATET00:18:13.346455,host1,smbd[69758]:    #7
tevent_cleanup_pending_signal_handlers + 0xb7 [ip=3D0x7f460e435c07]
[sp=3D0x7ffff2fbecd0]

DATET00:18:13.346849,host1,smbd[69758]:    #8 _tevent_loop_once + 0x94
[ip=3D0x7f460e430df4] [sp=3D0x7ffff2fbecf0]

DATET00:18:13.347250,host1,smbd[69758]:    #9 tevent_common_loop_wait +
0x1b [ip=3D0x7f460e43109b] [sp=3D0x7ffff2fbed20]

DATET00:18:13.347639,host1,smbd[69758]:    #10
tevent_cleanup_pending_signal_handlers + 0x57 [ip=3D0x7f460e435ba7]
[sp=3D0x7ffff2fbed40]

DATET00:18:13.348114,host1,smbd[69758]:    #11 smbd_process + 0x828
[ip=3D0x7f460e909398] [sp=3D0x7ffff2fbed60]

DATET00:18:13.348195,host1,smbd[69758]:    #12 _start + 0x2365
[ip=3D0x55dabd16e315] [sp=3D0x7ffff2fbedf0]

DATET00:18:13.348726,host1,smbd[69758]:    #13
tevent_common_invoke_fd_handler + 0x7d [ip=3D0x7f460e43170d]
[sp=3D0x7ffff2fbeed0]

DATET00:18:13.349124,host1,smbd[69758]:    #14 tevent_wakeup_recv + 0x1097
[ip=3D0x7f460e437a77] [sp=3D0x7ffff2fbef00]

DATET00:18:13.349528,host1,smbd[69758]:    #15
tevent_cleanup_pending_signal_handlers + 0xb7 [ip=3D0x7f460e435c07]
[sp=3D0x7ffff2fbef60]

DATET00:18:13.349914,host1,smbd[69758]:    #16 _tevent_loop_once + 0x94
[ip=3D0x7f460e430df4] [sp=3D0x7ffff2fbef80]

DATET00:18:13.350297,host1,smbd[69758]:    #17 tevent_common_loop_wait +
0x1b [ip=3D0x7f460e43109b] [sp=3D0x7ffff2fbefb0]

DATET00:18:13.350676,host1,smbd[69758]:    #18
tevent_cleanup_pending_signal_handlers + 0x57 [ip=3D0x7f460e435ba7]
[sp=3D0x7ffff2fbefd0]

DATET00:18:13.350719,host1,smbd[69758]:    #19 main + 0x1ddf
[ip=3D0x55dabd16be3f] [sp=3D0x7ffff2fbeff0]

DATET00:18:13.351315,host1,smbd[69758]:    #20 __libc_start_main + 0xea
[ip=3D0x7f460e116d0a] [sp=3D0x7ffff2fbf3d0]

DATET00:18:13.351378,host1,smbd[69758]:    #21 _start + 0x2a
[ip=3D0x55dabd16bfda] [sp=3D0x7ffff2fbf4a0]

DATET00:18:13.351569,host1,smbd[69758]: [DATE 00:18:13.351383,  0]
../../source3/lib/dumpcore.c:315(dump_core)

DATET00:18:13.351607,host1,smbd[69758]:   dumping core in
/var/log/samba/cores/smbd

DATET00:18:13.351631,host1,smbd[69758]:

GDB BACKTRACE:

$ gdb --exec=3D$(which smbd) --core=3Dnfl-smbd-core --readnow

GNU gdb (Debian 10.1-1.7) 10.1.90.20210103-git

Copyright (C) 2021 Free Software Foundation, Inc.

License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.htm=
l
>

This is free software: you are free to change and redistribute it.

There is NO WARRANTY, to the extent permitted by law.

Type "show copying" and "show warranty" for details.

This GDB was configured as "x86_64-linux-gnu".

Type "show configuration" for configuration details.

For bug reporting instructions, please see:

<https://www.gnu.org/software/gdb/bugs/>.

Find the GDB manual and other documentation resources online at:

    <http://www.gnu.org/software/gdb/documentation/>.

For help, type "help".

Type "apropos word" to search for commands related to "word".

warning: Can't open file /var/lib/samba/private/passdb.tdb during
file-backed mapping note processing

warning: Can't open file /run/samba/smbXsrv_open_global.tdb during
file-backed mapping note processing

warning: Can't open file /run/samba/smbXsrv_tcon_global.tdb during
file-backed mapping note processing

warning: Can't open file /run/samba/smbXsrv_session_global.tdb during
file-backed mapping note processing

warning: Can't open file /var/lib/samba/account_policy.tdb during
file-backed mapping note processing

warning: Can't open file /var/lib/samba/group_mapping.tdb during
file-backed mapping note processing

warning: Can't open file /run/samba/smbXsrv_client_global.tdb during
file-backed mapping note processing

warning: Can't open file /var/lib/samba/share_info.tdb during file-backed
mapping note processing

warning: Can't open file /var/lib/samba/private/secrets.tdb during
file-backed mapping note processing

warning: Can't open file /run/samba/smbXsrv_version_global.tdb during
file-backed mapping note processing

warning: Can't open file /run/samba/names.tdb during file-backed mapping
note processing

[New LWP 69758]

[New LWP 2260102]

[Thread debugging using libthread_db enabled]

Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".

Core was generated by `/usr/sbin/smbd --foreground --no-process-group'.

Program terminated with signal SIGABRT, Aborted.

#0  0x00007f460e12bce1 in __modf (x=3D1.5810100666919889e-322, iptr=3D0x2) =
at
../sysdeps/ieee754/dbl-64/wordsize-64/s_modf.c:40

40  ../sysdeps/ieee754/dbl-64/wordsize-64/s_modf.c: No such file or
directory.

[Current thread is 1 (Thread 0x7f460a01fa80 (LWP 69758))]

(gdb) bt

#0  0x00007f460e12bce1 in __modf (x=3D1.5810100666919889e-322, iptr=3D0x2) =
at
../sysdeps/ieee754/dbl-64/wordsize-64/s_modf.c:40

#1  0x0000000000001880 in ?? ()

#2  0x0000000000000000 in ?? ()

(gdb) thread 2

[Switching to thread 2 (Thread 0x7f460713c700 (LWP 2260102))]

#0  futex_abstimed_wait_cancelable (private=3D0, abstime=3D0x7f460713bb60,
clockid=3D118733536, expected=3D0, futex_word=3D0x55dabeb4f104) at
../sysdeps/nptl/futex-internal.h:323

323 ../sysdeps/nptl/futex-internal.h: No such file or directory.

(gdb) bt

#0  futex_abstimed_wait_cancelable (private=3D0, abstime=3D0x7f460713bb60,
clockid=3D118733536, expected=3D0, futex_word=3D0x55dabeb4f104) at
../sysdeps/nptl/futex-internal.h:323

#1  __pthread_cond_wait_common (abstime=3D0x7f460713bb60, clockid=3D1187335=
36,
mutex=3D0x55dabeb4f0b0, cond=3D0x55dabeb4f0d8) at pthread_cond_wait.c:520

#2  __pthread_cond_timedwait (cond=3Dcond@entry=3D0x55dabeb4f0d8,
mutex=3Dmutex@entry=3D0x55dabeb4f0b0, abstime=3Dabstime@entry=3D0x7f460713b=
b60) at
pthread_cond_wait.c:656

#3  0x00007f460dadb1e2 in pthreadpool_server (arg=3D0x55dabeb4f0a0) at
../../lib/pthreadpool/pthreadpool.c:595

#4  0x00007f460e40fea7 in start_thread (arg=3D<optimized out>) at
pthread_create.c:477

#5  0x00007f460e1efaef in ?? () from /lib/x86_64-linux-gnu/libc.so.6

#6  0x0000000000000000 in ?? ()

TESTPARM:
Load smb config files from /etc/samba/smb.conf

Loaded services file OK.

Weak crypto is allowed

WARNING: The 'netbios name' is too long (max. 15 chars).

Server role: ROLE_DOMAIN_MEMBER

Press enter to see a dump of your service definitions

# Global parameters

[global]

disable spoolss =3D Yes

dns proxy =3D No

load printers =3D No

local master =3D No

log file =3D /var/log/samba/clients/%m.log

logging =3D syslog@0 file

max log size =3D 100

max stat cache size =3D 65536

max xmit =3D 1048676

name resolve order =3D host wins bcast

ntlm auth =3D ntlmv1-permitted

printcap name =3D /dev/null

realm =3D REALM

security =3D ADS

server multi channel support =3D Yes

socket options =3D IPTOS_LOWDELAY TCP_NODELAY

template homedir =3D /home/%U

usershare path =3D

winbind use default domain =3D Yes

workgroup =3D US

idmap config us : range =3D 10000-1999999

idmap config us : backend =3D rid

idmap config * : range =3D 3000-7999

idmap config * : backend =3D tdb

include =3D /etc/samba/smb-shares.conf.local

printing =3D bsd


[share1]

access based share enum =3D Yes

case sensitive =3D Yes

create mask =3D 0666

delete veto files =3D Yes

directory mask =3D 0777

mangled names =3D no

path =3D /P01/share1

read only =3D No

strict sync =3D No

use sendfile =3D Yes

vfs objects =3D catia fruit streams_xattr acl_xattr aio_pthread

readdir_attr:aapl_rsize =3D no

readdir_attr:aapl_max_access =3D yes

readdir_attr:aapl_finder_info =3D yes

fruit:zero_file_id =3D yes

fruit:wipe_intentionally_left_blank_rfork =3D yes

fruit:veto_appledouble =3D no

fruit:resource =3D file

fruit:posix_rename =3D yes

fruit:nfs_aces =3D yes

fruit:model =3D MacSamba

fruit:metadata =3D netatalk

fruit:locking =3D none

fruit:encoding =3D private

fruit:delete_empty_adfiles =3D yes

fruit:copyfile =3D yes

fruit:aapl =3D yes


[share2]

access based share enum =3D Yes

case sensitive =3D Yes

create mask =3D 0666

delete veto files =3D Yes

directory mask =3D 0777

mangled names =3D no

path =3D /P01/share2

read only =3D No

strict sync =3D No

use sendfile =3D Yes

vfs objects =3D catia fruit streams_xattr acl_xattr aio_pthread

readdir_attr:aapl_rsize =3D no

readdir_attr:aapl_max_access =3D yes

readdir_attr:aapl_finder_info =3D yes

fruit:zero_file_id =3D yes

fruit:wipe_intentionally_left_blank_rfork =3D yes

fruit:veto_appledouble =3D no

fruit:resource =3D file

fruit:posix_rename =3D yes

fruit:nfs_aces =3D yes

fruit:model =3D MacSamba

fruit:metadata =3D netatalk

fruit:locking =3D none

fruit:encoding =3D private

fruit:delete_empty_adfiles =3D yes

fruit:copyfile =3D yes

fruit:aapl =3D yes


[share3]

access based share enum =3D Yes

case sensitive =3D Yes

create mask =3D 0666

delete veto files =3D Yes

directory mask =3D 0777

mangled names =3D no

path =3D /P01/share3

read only =3D No

strict sync =3D No

use sendfile =3D Yes

vfs objects =3D fileid catia streams_xattr fruit acl_xattr aio_pthread

fileid:algorithm =3D fsname

readdir_attr:aapl_rsize =3D no

readdir_attr:aapl_max_access =3D yes

readdir_attr:aapl_finder_info =3D yes

fruit:zero_file_id =3D yes

fruit:wipe_intentionally_left_blank_rfork =3D yes

fruit:veto_appledouble =3D no

fruit:resource =3D file

fruit:posix_rename =3D yes

fruit:nfs_aces =3D yes

fruit:model =3D MacSamba

fruit:metadata =3D netatalk

fruit:locking =3D none

fruit:encoding =3D private

fruit:delete_empty_adfiles =3D yes

fruit:copyfile =3D yes

fruit:aapl =3D yes

--=20
=20
<https://opendrives.ac-page.com/ibc2023?test=3Dtrue&utm_source=3DAC&utm_med=
ium=3Demailsig&utm_campaign=3DIBC2023>


Need a free guest pass? Use code: *IBC8340*.


