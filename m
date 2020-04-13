Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D381A65BB
	for <lists+samba-technical@lfdr.de>; Mon, 13 Apr 2020 13:48:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=YHs98vmL04FnLeK7IZ+8EppSMqW1Ls9pcEBw/B4nfw8=; b=tlJAZ1Srgsm4eSExw1JHLueQew
	9Npkq7YCbfnvvKQjavY5V/MRXKVyGVMEv4mNMWQML4nimEBGcK6wnEUz8O7+js+L2z4fXURHqnXDK
	HjkmDrIdl1eQiM70H7Ze8RPt9/pqg4v2eehcwjoYyz3+Tiq7zCVPQjNy/pAFsKhGXKralk5vu/xtE
	L256dm4ujvabQ5WG7R0hjk6vpvT+qye2jrWs5naktvR/DsB4L5YCv5pKGF+D9mUPlriwzXEeA+0gk
	tY77w8j6vnrKlt9oiFoEP0J1J19TUkNhr3qIMGEOkNh/TO++GBKGg1YLe5qPVc7OX2PcyNA5ZRK2m
	UURWw2aA==;
Received: from localhost ([::1]:45864 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jNxYc-000bdM-Aq; Mon, 13 Apr 2020 11:47:18 +0000
Received: from latitanza.investici.org ([2001:888:2000:56::19]:39123) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jNxYV-000bdF-Go
 for samba-technical@lists.samba.org; Mon, 13 Apr 2020 11:47:14 +0000
Received: from mx3.investici.org (unknown [127.0.0.1])
 by latitanza.investici.org (Postfix) with ESMTP id 4CD781201C2;
 Mon, 13 Apr 2020 11:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cryptolab.net;
 s=stigmate; t=1586777506;
 bh=YHs98vmL04FnLeK7IZ+8EppSMqW1Ls9pcEBw/B4nfw8=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=tzTCZxw2I5XNh7Gp7WI5tM2I7a7eAfD6Q2KAYhYU0Dm8BHKDO8KEPYw612qXhK1j4
 pjtb3rpzKO+GyTkzfLnQoY8v2UmG09buK1pFELcL7i545aPxNpmLD9moTO8w36kuCL
 Vjzc0tVtEZzH77XIV9/jGl14Ui9E8I/04g7D5bks=
Received: from [82.94.249.234] (mx3.investici.org [82.94.249.234])
 (Authenticated sender: anoopcs@autistici.org) by localhost (Postfix) with
 ESMTPSA id 6D67D1201BB; Mon, 13 Apr 2020 11:31:43 +0000 (UTC)
Message-ID: <2b8eec59f1cc1312f3740c0ca736517a9e6337fd.camel@cryptolab.net>
Subject: Re: PANIC: vfs_fruit for time machine backup causes PANIC
To: Rouven WEILER <Rouven_Weiler@gmx.net>
Date: Mon, 13 Apr 2020 17:01:37 +0530
In-Reply-To: <9644B646-2EDF-448E-BF4A-8770157AAC71@gmx.net>
References: <03B0942F-6362-4FCD-9DC0-F267968A64FC@gmx.net>
 <9644B646-2EDF-448E-BF4A-8770157AAC71@gmx.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
From: Anoop C S via samba-technical <samba-technical@lists.samba.org>
Reply-To: Anoop C S <anoopcs@cryptolab.net>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, 2020-04-12 at 11:24 +0200, Rouven WEILER via samba-technical
wrote:
> In a previous email I mentioned that I got issue with samba 4.12.1 on
> Illumos/OpenIndiana and MacOS 10.15.4.
> I digged a little bit more and found out that the PANIC is caused
> when trying to do a time machine backup.
> 
> Plain samba works a as always. There seems to be only issues with
> time machine backup.
> 
> Everything worked before samba-4.12.0 and MacOS 10.15.4. I cannot
> tell which change cause the issues...
> 
> Staring from a new time capsule share I got the following:
> Creating a new time machine backup shows, I get a
> „.com.apple.timemachine.supported“ file added in to the share.
> 
> MacOS tells in it’s logs: „Failed to read capabilities for
> 'file:///Volumes/FileVault/', error: Socket is not connected“.
> 
> The smbd.log with loglevel vfs:10 shows:

Is it possible for you to reproduce with log level 10 set in general
rather than just vfs? It might gives us more context around the
assertion failure leading to smbd panic.

> [2020/04/12 11:15:21.534742,  5, pid=1707, effective(500, 500),
> real(0, 0), class=vfs]
> ../../source3/smbd/vfs.c:1395(check_reduced_name)
>   check_reduced_name: .com.apple.timemachine.supported reduced to
> /export/home/timecapsule/.com.apple.timemachine.supported
> [2020/04/12 11:15:21.534789, 10, pid=1707, effective(500, 500),
> real(0, 0), class=vfs]
> ../../source3/modules/vfs_streams_xattr.c:379(streams_xattr_open)
>   streams_xattr_open called for .com.apple.timemachine.supported with
> flags 0x20080
> [2020/04/12 11:15:21.535160,  0]
> ../../lib/dbwrap/dbwrap.c:82(dbwrap_record_get_value)
>   PANIC: assert failed at ../../lib/dbwrap/dbwrap.c(82): rec-
> >value_valid

Similar assertion failures were fixed sometime back and I could see
those present in v4-12-stable branch. May be we missed some other
place..

> [2020/04/12 11:15:21.535322,  0]
> ../../source3/lib/util.c:830(smb_panic_s3)
>   PANIC (pid 1707): assert failed: rec->value_valid
> [2020/04/12 11:15:21.536138,  0]
> ../../lib/util/fault.c:265(log_stack_trace)
>   BACKTRACE: 37 stack frames:
>    #0 /usr/lib/samba/amd64/libsamba-
> util.so.0.0.1'log_stack_trace+0x26 [0xfffffd7fee51de66]
>    #1 /usr/lib/samba/amd64/libsmbconf.so.0'smb_panic_s3+0x26
> [0xfffffd7fedf5a596]
>    #2 /usr/lib/samba/amd64/libsamba-util.so.0.0.1'smb_panic+0x1f
> [0xfffffd7fee51df3f]
>    #3 /usr/lib/samba/private/amd64/libdbwrap-
> samba4.so'dbwrap_record_get_value+0x2a [0xfffffd7fece2627a]
>    #4 /usr/lib/samba/private/amd64/libsmbd-base-
> samba4.so'get_share_mode_lock+0x109 [0xfffffd7fee7195c9]
>    #5 /usr/lib/samba/private/amd64/libsmbd-base-
> samba4.so'smbd_contend_level2_oplocks_begin+0xa1 [0xfffffd7fee7f7761]
>    #6 /usr/lib/samba/private/amd64/libsmbd-base-
> samba4.so'brl_lock+0x635 [0xfffffd7fee710f45]
>    #7 /usr/lib/samba/private/amd64/libsmbd-base-
> samba4.so'do_lock_fn+0xa4 [0xfffffd7fee70d534]
>    #8 /usr/lib/samba/private/amd64/libsmbd-base-
> samba4.so'share_mode_do_locked_fn+0x86 [0xfffffd7fee7174b6]
>    #9
> /usr/lib/samba/amd64/libsmbconf.so.0'dbwrap_watched_do_locked_fn+0xfa
> [0xfffffd7fedf622ca]
>    #10 /usr/lib/samba/private/amd64/libdbwrap-
> samba4.so'db_tdb_do_locked+0x12f [0xfffffd7fece295cf]
>    #11 /usr/lib/samba/private/amd64/libdbwrap-
> samba4.so'dbwrap_do_locked+0x48 [0xfffffd7fece269a8]
>    #12
> /usr/lib/samba/amd64/libsmbconf.so.0'dbwrap_watched_do_locked+0x6f
> [0xfffffd7fedf60d7f]
>    #13 /usr/lib/samba/private/amd64/libdbwrap-
> samba4.so'dbwrap_do_locked+0x48 [0xfffffd7fece269a8]
>    #14 /usr/lib/samba/private/amd64/libsmbd-base-
> samba4.so'share_mode_do_locked+0xd2 [0xfffffd7fee719b82]
>    #15 /usr/lib/samba/private/amd64/libsmbd-base-
> samba4.so'do_lock+0xf0 [0xfffffd7fee70dfe0]
>    #16 /usr/lib/samba/amd64/vfs/fruit.so'fruit_create_file+0x7ba
> [0xfffffd7fe88a55aa]
>    #17 /usr/lib/samba/private/amd64/libsmbd-base-
> samba4.so'smbd_smb2_request_process_create+0xa07 [0xfffffd7fee7d3237]
>    #18 /usr/lib/samba/private/amd64/libsmbd-base-
> samba4.so'smbd_smb2_request_dispatch+0xc8f [0xfffffd7fee7c985f]
>    #19 /usr/lib/samba/private/amd64/libsmbd-base-
> samba4.so'smbd_smb2_connection_handler+0x621 [0xfffffd7fee7ca7e1]
>    #20
> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_invoke
> _fd_handler+0x80 [0xfffffd7fecfca580]
>    #21
> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'epoll_event_loop_onc
> e+0x22c [0xfffffd7fecfd180c]
>    #22
> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_once+
> 0x40 [0xfffffd7fecfcf8f0]
>    #23
> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'_tevent_loop_once+0x
> 95 [0xfffffd7fecfc9bd5]
>    #24
> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_loop_w
> ait+0x23 [0xfffffd7fecfc9e43]
>    #25
> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_wait+
> 0x40 [0xfffffd7fecfcf870]
>    #26 /usr/lib/samba/private/amd64/libsmbd-base-
> samba4.so'smbd_process+0x777 [0xfffffd7fee7b8677]
>    #27 /usr/lib/samba/sbin/amd64/smbd'smbd_accept_connection+0x189
> [0x40d5b9]
>    #28
> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_invoke
> _fd_handler+0x80 [0xfffffd7fecfca580]
>    #29
> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'epoll_event_loop_onc
> e+0x22c [0xfffffd7fecfd180c]
>    #30
> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_once+
> 0x40 [0xfffffd7fecfcf8f0]
>    #31
> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'_tevent_loop_once+0x
> 95 [0xfffffd7fecfc9bd5]
>    #32
> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_loop_w
> ait+0x23 [0xfffffd7fecfc9e43]
>    #33
> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_wait+
> 0x40 [0xfffffd7fecfcf870]
>    #34 /usr/lib/samba/sbin/amd64/smbd'main+0x1a0f [0x40f9ff]
>    #35 /usr/lib/samba/sbin/amd64/smbd'_start_crt+0x83 [0x408e73]
>    #36 /usr/lib/samba/sbin/amd64/smbd'_start+0x18 [0x408dd8]
> [2020/04/12 11:15:21.538230,  0]
> ../../source3/lib/dumpcore.c:315(dump_core)
>   dumping core in /var/samba/log/cores/smbd
> [2020/04/12 11:15:21.949051,  0]
> ../../lib/util/become_daemon.c:136(daemon_ready)
>   daemon_ready: daemon 'smbd' finished starting up and ready to serve
> connections
> 
> 
> My smb.conf is:
> #======================= Global Settings
> =====================================
> [global]
> 
>     workgroup = mano-de.dios
>     netbios name = wutz
>     mdns name = mdns
>     multicast dns register = yes
>     server string = Filet Server (%v)
>     server role = standalone server
>     log file = /var/log/samba/smbd.log
>     max log size = 50
>     wins support = yes
>     dns proxy = no
>     guest account = nobody
>     fruit:aapl = yes
>     fruit:model = RackMac
>     log level = vfs:10
> 
> #============================ Share Definitions
> ==============================
> [homes]
>     comment = Home Share 
>     browseable = no
>     writable = yes
>     guest ok = no
>     vfs objects = catia fruit zfsacl streams_xattr 
>     fruit:resource = xattr
>     fruit:metadata = netatalk
>     fruit:locking = netatalk
>     fruit:encoding = native
> 
> [FileVault]
>     comment = Apple Time Capsule
>     path = /export/home/timecapsule
>     browseable = no
>     writeable = no
>     valid users = @admin
>     write list = @admin
>     guest ok = no
>     vfs objects = catia fruit zfsacl streams_xattr 
>     fruit:resource = xattr
>     fruit:metadata = netatalk
>     fruit:locking = netatalk
>     fruit:encoding = native
>     fruit:time machine = yes


