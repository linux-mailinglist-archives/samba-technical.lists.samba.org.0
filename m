Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E52123ACA5
	for <lists+samba-technical@lfdr.de>; Mon,  3 Aug 2020 20:56:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=thezu9J040slWnJuhZgaEm/gfXRY6XAxLzoBzN3tgyA=; b=GnQDGSEuwtG2PkJ4esreuX1/xd
	xZMRMFR3CUYpXa7f6iinRVowpWrPFbxkjG7kYaQii5cyCGg+k4+JRoZwlf2VuhW0YVd8w6MCKWnNH
	uaOh+doSVUMfvOCZTX0tnJtvDY5XZbPw9zDlTkHGTOPQVqRxWkXXnrjBkZOrNTis/E4MFiuKtrTZZ
	W3u8FIhIxmH58pgFlU7r+3r9v9TlTU+ttFfd7HqCCE3wZ5Up79hq9Hbs8Cz0gtLtgL2dAU0ll+7b1
	7P9nAuWLR8Eql0a+uvyknTbAkOTQU3KvUKl9ZUJjas6Blgt2kPSACoLHCcNIUkrhZUObGfnzNeQrG
	fdwoLzdA==;
Received: from localhost ([::1]:22990 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k2fcW-00CNJg-NW; Mon, 03 Aug 2020 18:55:36 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:43193) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k2fcR-00CNJ3-4X
 for samba-technical@lists.samba.org; Mon, 03 Aug 2020 18:55:34 +0000
Received: by mail-ed1-x52d.google.com with SMTP id o18so13590165eds.10
 for <samba-technical@lists.samba.org>; Mon, 03 Aug 2020 11:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=b4hIPHFH5dUKqWEmlo6yeSOc9bkkvpDAtSlk/YY8Vko=;
 b=Eq53Cq0wEK7pDIb52JOWH4iWXzD1jzw6Qn5nNQ6YUXPxxyYNpFh3qj34wUTLPd6uCO
 wWhFBm2WzG1wpyzlSncwfcBJXGlmu7HLBr2Hxn0SB76YJBz5dSUZbfyWiu0wHQYzSed8
 vkt466hpUr3l606TJd59mfUwnq+BozFHxXO5v4ZZiTMrCgPRgwKiA7dreBc8WSDrIg7i
 jKQdJwo/W5sp0JHCyrzIXCUZSVrGgBRLVKDZMvEH5jxlitUlnY7j1kLZZQoJ0hoK++nf
 Nh248vvA1jHXVAohivcafyu0Bchpfi8PprLU7U3xzhgDZPLEQ6A+pczy/ApsKPk4wl8q
 Ugyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=b4hIPHFH5dUKqWEmlo6yeSOc9bkkvpDAtSlk/YY8Vko=;
 b=At5UjqnLJRKNhJsOza7I1GidVutK53iv/C7/4veqG6P8wO5DsWrhs2grMyas3ofUfc
 ITdhwcPhectRDdilneLoekkElZ8OLr9MTD7H4zyYcvcy5GXu0h8Di5EZQPDLmGy0EaRX
 dCU7gveS4Z8b6lUUu6alz51in3K5wjyjJBZ6tYSMN1+MztuqxZhnP1ndw6S2yB7OM9Hg
 XVvnHsaSzMKizVm0tq78CW3Hmzcz6L9lPOOn+j5UiMzeQUMiawgjkk1sYgNcpmOw4Yq5
 AU3eik5BAvBWum3Xq4UNofSOXQUw5Dkuo3WgYZInfGkPPxEaCS8L029Xiu7LraKPXUPk
 cALA==
X-Gm-Message-State: AOAM531HnCuU8H233Le9tyjHDIcTkFR2OBXCOkHoUf9AHXa9vtnXq+Yq
 4IuprUea+Q5GCJNPUwuXWe0PZXEtuPY1BjnlIFc3Sw==
X-Google-Smtp-Source: ABdhPJxPOk8mbdfvY/gSAJUd+z4vO+1mttjzBi2GrY44dQEn/GZgM+Qr6Ef520A3ZlkzJxfV7Iakdkja9+n1yrRyTiA=
X-Received: by 2002:a05:6402:12c4:: with SMTP id
 k4mr16804075edx.358.1596480930028; 
 Mon, 03 Aug 2020 11:55:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAMYxiYw4E5qX7KPMY2gsnd9+y2BkusL1Ef=gZ1i017TWGCmQwQ@mail.gmail.com>
In-Reply-To: <CAMYxiYw4E5qX7KPMY2gsnd9+y2BkusL1Ef=gZ1i017TWGCmQwQ@mail.gmail.com>
Date: Mon, 3 Aug 2020 11:55:18 -0700
Message-ID: <CAMYxiYx9QWJKafzy02n34KA2LuGxjKT3i16rR9U1TvyMaA79Aw@mail.gmail.com>
Subject: Re: PANIC internal error: samba 4.12.5 CTDB cluster
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset="UTF-8"
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
From: David Rivera via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Rivera <rivera.david87@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I've just received another panic while trying to access a directory. The
directory is not accessible on any of the cluster members.

Aug  3 11:13:49 samba1 smbd[3054477]: [2020/08/03 11:13:49.764380,  0]
../../source3/locking/share_mode_lock.c:448(share_mode_data_store)
Aug  3 11:13:49 samba1 smbd[3054477]:  PANIC: assert failed at
../../source3/locking/share_mode_lock.c(448): !share_entries_exist
Aug  3 11:13:49 samba1 smbd[3054477]: [2020/08/03 11:13:49.764458,  0]
../../source3/lib/util.c:830(smb_panic_s3)
Aug  3 11:13:49 samba1 smbd[3054477]:  PANIC (pid 3054477): assert failed:
!share_entries_exist
Aug  3 11:13:49 samba1 smbd[3054477]: [2020/08/03 11:13:49.765098,  0]
../../lib/util/fault.c:265(log_stack_trace)
Aug  3 11:13:49 samba1 smbd[3054477]:  BACKTRACE: 40 stack frames:
Aug  3 11:13:49 samba1 smbd[3054477]:   #0
/usr/local/samba/lib/libsamba-util.so.0(log_stack_trace+0x1f)
[0x7f802f1b2f48]
Aug  3 11:13:49 samba1 smbd[3054477]:   #1
/usr/local/samba/lib/libsmbconf.so.0(smb_panic_s3+0x74) [0x7f802d713571]
Aug  3 11:13:49 samba1 smbd[3054477]:   #2
/usr/local/samba/lib/libsamba-util.so.0(smb_panic+0x28) [0x7f802f1b2f13]
Aug  3 11:13:49 samba1 smbd[3054477]:   #3
/usr/local/samba/lib/private/libsmbd-base-samba4.so(+0x92041)
[0x7f802ec2e041]
Aug  3 11:13:49 samba1 smbd[3054477]:   #4
/usr/local/samba/lib/private/libsmbd-base-samba4.so(+0x92afe)
[0x7f802ec2eafe]
Aug  3 11:13:49 samba1 smbd[3054477]:   #5
/usr/local/samba/lib/private/libtalloc.so.2(+0x383c) [0x7f802dd6883c]
Aug  3 11:13:49 samba1 smbd[3054477]:   #6
/usr/local/samba/lib/private/libtalloc.so.2(+0x3bb8) [0x7f802dd68bb8]
Aug  3 11:13:49 samba1 smbd[3054477]:   #7
/usr/local/samba/lib/private/libtalloc.so.2(_talloc_free+0x105)
[0x7f802dd69e80]
Aug  3 11:13:49 samba1 smbd[3054477]:   #8
/usr/local/samba/lib/private/libsmbd-base-samba4.so(+0x2162fa)
[0x7f802edb22fa]
Aug  3 11:13:49 samba1 smbd[3054477]:   #9
/usr/local/samba/lib/private/libsmbd-base-samba4.so(+0x2188a6)
[0x7f802edb48a6]
Aug  3 11:13:49 samba1 smbd[3054477]:   #10
/usr/local/samba/lib/private/libsmbd-base-samba4.so(create_file_default+0x303)
[0x7f802edb5530]
Aug  3 11:13:49 samba1 smbd[3054477]:   #11
/usr/local/samba/lib/private/libsmbd-base-samba4.so(+0x192904)
[0x7f802ed2e904]
Aug  3 11:13:49 samba1 smbd[3054477]:   #12
/usr/local/samba/lib/private/libsmbd-base-samba4.so(smb_vfs_call_create_file+0xa9)
[0x7f802edbfe57]
Aug  3 11:13:49 samba1 smbd[3054477]:   #13
/usr/local/samba/lib/private/libsmbd-base-samba4.so(+0x2679c6)
[0x7f802ee039c6]
Aug  3 11:13:49 samba1 smbd[3054477]:   #14
/usr/local/samba/lib/private/libsmbd-base-samba4.so(smbd_smb2_request_process_create+0x702)
[0x7f802ee01791]
Aug  3 11:13:49 samba1 smbd[3054477]:   #15
/usr/local/samba/lib/private/libsmbd-base-samba4.so(smbd_smb2_request_dispatch+0x11a1)
[0x7f802edf50c2]
Aug  3 11:13:49 samba1 smbd[3054477]:   #16
/usr/local/samba/lib/private/libsmbd-base-samba4.so(+0x25d22c)
[0x7f802edf922c]
Aug  3 11:13:49 samba1 smbd[3054477]:   #17
/usr/local/samba/lib/private/libsmbd-base-samba4.so(+0x25d332)
[0x7f802edf9332]
Aug  3 11:13:49 samba1 smbd[3054477]:   #18
/usr/local/samba/lib/private/libtevent.so.0(tevent_common_invoke_fd_handler+0x101)
[0x7f802e382faf]
Aug  3 11:13:49 samba1 smbd[3054477]:   #19
/usr/local/samba/lib/private/libtevent.so.0(+0x1160e) [0x7f802e38d60e]
Aug  3 11:13:49 samba1 smbd[3054477]:   #20
/usr/local/samba/lib/private/libtevent.so.0(+0x11c55) [0x7f802e38dc55]
Aug  3 11:13:49 samba1 smbd[3054477]:   #21
/usr/local/samba/lib/private/libtevent.so.0(+0xe5c0) [0x7f802e38a5c0]
Aug  3 11:13:49 samba1 smbd[3054477]:   #22
/usr/local/samba/lib/private/libtevent.so.0(_tevent_loop_once+0x10f)
[0x7f802e382274]
Aug  3 11:13:49 samba1 smbd[3054477]:   #23
/usr/local/samba/lib/private/libtevent.so.0(tevent_common_loop_wait+0x25)
[0x7f802e38258f]
Aug  3 11:13:49 samba1 smbd[3054477]:   #24
/usr/local/samba/lib/private/libtevent.so.0(+0xe662) [0x7f802e38a662]
Aug  3 11:13:49 samba1 smbd[3054477]:   #25
/usr/local/samba/lib/private/libtevent.so.0(_tevent_loop_wait+0x2b)
[0x7f802e382632]
Aug  3 11:13:49 samba1 smbd[3054477]:   #26
/usr/local/samba/lib/private/libsmbd-base-samba4.so(smbd_process+0xbd1)
[0x7f802eddd5ca]
Aug  3 11:13:49 samba1 smbd[3054477]:   #27
/usr/local/samba/sbin/smbd(+0xd381) [0x55b264979381]
Aug  3 11:13:49 samba1 smbd[3054477]:   #28
/usr/local/samba/lib/private/libtevent.so.0(tevent_common_invoke_fd_handler+0x101)
[0x7f802e382faf]
Aug  3 11:13:49 samba1 smbd[3054477]:   #29
/usr/local/samba/lib/private/libtevent.so.0(+0x1160e) [0x7f802e38d60e]
Aug  3 11:13:49 samba1 smbd[3054477]:   #30
/usr/local/samba/lib/private/libtevent.so.0(+0x11c55) [0x7f802e38dc55]
Aug  3 11:13:49 samba1 smbd[3054477]:   #31
/usr/local/samba/lib/private/libtevent.so.0(+0xe5c0) [0x7f802e38a5c0]
Aug  3 11:13:49 samba1 smbd[3054477]:   #32
/usr/local/samba/lib/private/libtevent.so.0(_tevent_loop_once+0x10f)
[0x7f802e382274]
Aug  3 11:13:49 samba1 smbd[3054477]:   #33
/usr/local/samba/lib/private/libtevent.so.0(tevent_common_loop_wait+0x25)
[0x7f802e38258f]
Aug  3 11:13:49 samba1 smbd[3054477]:   #34
/usr/local/samba/lib/private/libtevent.so.0(+0xe662) [0x7f802e38a662]
Aug  3 11:13:49 samba1 smbd[3054477]:   #35
/usr/local/samba/lib/private/libtevent.so.0(_tevent_loop_wait+0x2b)
[0x7f802e382632]
Aug  3 11:13:49 samba1 smbd[3054477]:   #36
/usr/local/samba/sbin/smbd(+0xdf84) [0x55b264979f84]
Aug  3 11:13:49 samba1 smbd[3054477]:   #37
/usr/local/samba/sbin/smbd(main+0x182a) [0x55b26497c0ce]
Aug  3 11:13:49 samba1 smbd[3054477]:   #38
/lib64/libc.so.6(__libc_start_main+0xf3) [0x7f802acc06a3]
Aug  3 11:13:49 samba1 smbd[3054477]:   #39
/usr/local/samba/sbin/smbd(_start+0x2e) [0x55b26497252e]
Aug  3 11:13:49 samba1 smbd[3054477]: [2020/08/03 11:13:49.765444,  0]
../../source3/lib/dumpcore.c:318(dump_core)
Aug  3 11:13:49 samba1 smbd[3054477]:  coredump is handled by helper binary
specified at /proc/sys/kernel/core_pattern

Aug  3 11:15:14 samba1 smbd[3053253]:  close_directory: Could not get share
mode lock for Directory

Any help to fix this problem would be appreciated.

Thank you,
David

On Fri, Jul 24, 2020 at 1:13 PM David Rivera <rivera.david87@gmail.com>
wrote:

> Hi,
>
> We've recently moved to using samba as our file server (about 2 weeks
> ago). Today we experienced a panic on all 3 CTDB cluster members that made
> all shares unavailable (samba-ctdb-node0-panic-backtrace-internal-error.log
> attached). I've included two additional panics I've found in the smbd log.
>
> We are using samba 12.4.5 built from source and have a 3 node CTDB cluster
> with ceph as the storage backend mounted using the ceph kernel client
> (Linux kernel 5.7.7). Our SMB clients are Windows XP, Windows 7 & Windows
> 10 connecting through Microsoft DFS (Windows DCs) and storing a number of
> file types including Microsoft Office documents and shared Microsoft Access
> databases. We have been running into issues with Windows XP client sessions
> hanging and making the locked files inaccessible but we've been able to get
> around this issue for the meantime by killing the associated smbd process.
>
> We've compiled samba on CentOS 8 [CentOS Linux release 8.2.2004 (Core)]
> using the following commands on all 3 nodes:
>
> # PKG_CONFIG_PATH="/usr/lib/pkgconfig/:${PKG_CONFIG_PATH}" ./configure
> --with-cluster-support --enable-ceph-reclock
> --with-shared-modules=idmap_rid,idmap_tdb2,idmap_ad --without-ad-dc
> # make -j 4
> # make install
>
> Our configuration is as follows.
>
> [global]
>         client min protocol = NT1
>         clustering = Yes
>         dedicated keytab file = /etc/krb5.keytab
>         kerberos method = secrets and keytab
>         netbios name = CTDB
>         realm = DOMAIN1.COM <http://domain1.com/>
>         reset on zero vc = Yes
>         security = ADS
>         server min protocol = NT1
>         template shell = /bin/bash
>         username map = /usr/local/samba/etc/user.map
>         winbind nss info = rfc2307
>         winbind refresh tickets = Yes
>         workgroup = DOMAIN1
>         idmap config domain5:unix_primary_group = yes
>         idmap config domain5:unix_nss_info = no
>         idmap config domain5:range = 50000-59999
>         idmap config domain5:schema_mode = rfc2307
>         idmap config domain5:backend = ad
>         idmap config domain4:unix_primary_group = yes
>         idmap config domain4:unix_nss_info = no
>         idmap config domain4:range = 40000-49999
>         idmap config domain4:schema_mode = rfc2307
>         idmap config domain4:backend = ad
>         idmap config domain3:unix_primary_group = yes
>         idmap config domain3:unix_nss_info = no
>         idmap config domain3:range = 30000-39999
>         idmap config domain3:schema_mode = rfc2307
>         idmap config domain3:backend = ad
>         idmap config domain2:unix_primary_group = yes
>         idmap config domain2:unix_nss_info = no
>         idmap config domain2:range = 20000-29999
>         idmap config domain2:schema_mode = rfc2307
>         idmap config domain2:backend = ad
>         idmap config domain1:unix_primary_group = yes
>         idmap config domain1:unix_nss_info = no
>         idmap config domain1:range = 10000-99999
>         idmap config domain1:schema_mode = rfc2307
>         idmap config domain1:backend = ad
>         idmap config * : range = 3000-7999
>         idmap config * : backend = tdb
>         kernel share modes = No
>         map acl inherit = Yes
>         posix locking = No
>         vfs objects = acl_xattr
>         ## Used during testing, turned off for production
>         #server multi channel support = yes
>         #interfaces = "10.20.10.224;capability=RSS"
> "10.20.10.225;capability=RSS" "10.20.10.226;capability=RSS"
>
> # Multiple shares defined this way
> [share1]
>         allocation roundup size = 4096
>         comment = Share1
>         # CephFS mount on /srv/samba
>         path = /srv/samba/shares/share1
>         read only = No
>         vfs objects = acl_xattr ceph_snapshots io_uring
>
> # Test share
> [test]
>         allocation roundup size = 4096
>         comment = Test Share
>         path = /srv/samba/shares/test
>         smb encrypt = desired
>         vfs objects = acl_xattr recycle ceph_snapshots io_uring
>         recycle:exclude = thumbs.db,*.ldb,~$*
>         recycle:touch = Yes
>         recycle:versions = Yes
>         recycle:keeptree = Yes
>         recycle:repository = ../recycle/test
>
> Here is our CTDB configuration file:
>
> [logging]
>         location = syslog
>         log level = NOTICE
>
> [cluster]
>         recovery lock =
> !/usr/local/samba/libexec/ctdb/ctdb_mutex_ceph_rados_helper ceph
> client.samba rados.samba.conf ctdb.lock
>
> Please let me know how I could help figure out the cause of this panic(s).
>
> Thank you,
> David
>
