Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 404C31A7553
	for <lists+samba-technical@lfdr.de>; Tue, 14 Apr 2020 10:03:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=+CkkRf4RVLaJ92kgioVPzeq0ST5QbXL7Jyz+ooZdk8g=; b=eSTnpUDnRR4gt13VdPTeNlHaeY
	O60F/Kwq0iKKdLpIzwLfD/N8+u5gcY1M1CAfAMbZe+FiLDM0+gXqIJKU7feADxB/M3JOLjudZ4msu
	VJ3GqGiNMWm9lWxFOd65ubKc12BrQx7hsXTzf5WTtnZVs2DHCqq5pLsXpoSdq4CPwOmgU/hqV7Ht8
	QR35WIy4dPHI+jui/NruXvf3lm/01ZjCJR8EuGjT8g00evzDyVlIqFA+uduBVaTYDG5HxoFj1Iign
	vWMyjTfqKCUYMrHbSUUuB85wMO5UWG+SO1Hnp87sLg5kf3N6cv6tJQ8wS1kPgQt6df+eDSpKIWs9F
	R8S0oo9w==;
Received: from localhost ([::1]:58096 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jOGXY-000fM8-G8; Tue, 14 Apr 2020 08:03:28 +0000
Received: from latitanza.investici.org ([2001:888:2000:56::19]:50533) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jOGXR-000fM0-Mx
 for samba-technical@lists.samba.org; Tue, 14 Apr 2020 08:03:24 +0000
Received: from mx3.investici.org (unknown [127.0.0.1])
 by latitanza.investici.org (Postfix) with ESMTP id BAD9D1201AE;
 Tue, 14 Apr 2020 08:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cryptolab.net;
 s=stigmate; t=1586851391;
 bh=+CkkRf4RVLaJ92kgioVPzeq0ST5QbXL7Jyz+ooZdk8g=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=MdJJPk4I9/tQWgmQyZcBbni45Vqgm18x9k4YW4yVmJMq156LOJG8AnFAj1GQG73wW
 Ru8+A0nDDxzR+IgfWmleVV+mo5Nq+LiNSlIANEKB0/EmaThX739D/wF86nIEfyp5+h
 zP0CUZxViZBZhh6wQBNAtJzYKIDnCl9FI3Qytojc=
Received: from [82.94.249.234] (mx3.investici.org [82.94.249.234])
 (Authenticated sender: anoopcs@autistici.org) by localhost (Postfix) with
 ESMTPSA id E0860120165; Tue, 14 Apr 2020 08:03:08 +0000 (UTC)
Message-ID: <25844cbcb0a607d665f789849460210af0fc2241.camel@cryptolab.net>
Subject: Re: PANIC: vfs_fruit for time machine backup causes PANIC
To: Rouven WEILER <Rouven_Weiler@gmx.net>
Date: Tue, 14 Apr 2020 13:33:00 +0530
In-Reply-To: <7C427784-A9EC-4AAC-8063-3BABF53E1973@gmx.net>
References: <03B0942F-6362-4FCD-9DC0-F267968A64FC@gmx.net>
 <9644B646-2EDF-448E-BF4A-8770157AAC71@gmx.net>
 <2b8eec59f1cc1312f3740c0ca736517a9e6337fd.camel@cryptolab.net>
 <7C427784-A9EC-4AAC-8063-3BABF53E1973@gmx.net>
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

On Mon, 2020-04-13 at 14:04 +0200, Rouven WEILER via samba-technical
wrote:
> Okay here we go with „log level = 10“. 
> log level 10 output is included in the attached file.

We would be interested in log entries from the log file specific to the
client which reports smbd panic.

> As a proof, there the globals section:
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
>     log level = 10
> 
> #============================ Share Definitions
> ==============================
> 
> dmesg error:
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]   PANIC:
> assert failed at ../../lib/dbwrap/dbwrap.c(82): rec->value_valid
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error] [2020/04/13
> 13:55:57.164502,  0, pid=1517, effective(500, 500), real(0, 0)]
> ../../source3/lib/util.c:830(smb_panic_s3)
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]   PANIC
> (pid 1517): assert failed: rec->value_valid
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error] [2020/04/13
> 13:55:57.165311,  0, pid=1517, effective(500, 500), real(0, 0)]
> ../../lib/util/fault.c:265(log_stack_trace)
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911
> daemon.error]   BACKTRACE: 37 stack frames:
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #0
> /usr/lib/samba/amd64/libsamba-util.so.0.0.1'log_stack_trace+0x26
> [0xfffffd7fee51de66]
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #1
> /usr/lib/samba/amd64/libsmbconf.so.0'smb_panic_s3+0x26
> [0xfffffd7fedf5a596]
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #2
> /usr/lib/samba/amd64/libsamba-util.so.0.0.1'smb_panic+0x1f
> [0xfffffd7fee51df3f]
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #3
> /usr/lib/samba/private/amd64/libdbwrap-
> samba4.so'dbwrap_record_get_value+0x2a [0xfffffd7fecf4627a]
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #4
> /usr/lib/samba/private/amd64/libsmbd-base-
> samba4.so'get_share_mode_lock+0x109 [0xfffffd7fee7195c9]
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #5
> /usr/lib/samba/private/amd64/libsmbd-base-
> samba4.so'smbd_contend_level2_oplocks_begin+0xa1 [0xfffffd7fee7f7761]
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #6
> /usr/lib/samba/private/amd64/libsmbd-base-samba4.so'brl_lock+0x635
> [0xfffffd7fee710f45]
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #7
> /usr/lib/samba/private/amd64/libsmbd-base-samba4.so'do_lock_fn+0xa4
> [0xfffffd7fee70d534]
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #8
> /usr/lib/samba/private/amd64/libsmbd-base-
> samba4.so'share_mode_do_locked_fn+0x86 [0xfffffd7fee7174b6]
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #9
> /usr/lib/samba/amd64/libsmbconf.so.0'dbwrap_watched_do_locked_fn+0xfa
> [0xfffffd7fedf622ca]
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #10
> /usr/lib/samba/private/amd64/libdbwrap-
> samba4.so'db_tdb_do_locked+0x12f [0xfffffd7fecf495cf]
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #11
> /usr/lib/samba/private/amd64/libdbwrap-
> samba4.so'dbwrap_do_locked+0x48 [0xfffffd7fecf469a8]
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #12
> /usr/lib/samba/amd64/libsmbconf.so.0'dbwrap_watched_do_locked+0x6f
> [0xfffffd7fedf60d7f]
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #13
> /usr/lib/samba/private/amd64/libdbwrap-
> samba4.so'dbwrap_do_locked+0x48 [0xfffffd7fecf469a8]
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #14
> /usr/lib/samba/private/amd64/libsmbd-base-
> samba4.so'share_mode_do_locked+0xd2 [0xfffffd7fee719b82]
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #15
> /usr/lib/samba/private/amd64/libsmbd-base-samba4.so'do_lock+0xf0
> [0xfffffd7fee70dfe0]
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #16
> /usr/lib/samba/amd64/vfs/fruit.so'fruit_create_file+0x7ba
> [0xfffffd7fe88c55aa]
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #17
> /usr/lib/samba/private/amd64/libsmbd-base-
> samba4.so'smbd_smb2_request_process_create+0xa07 [0xfffffd7fee7d3237]
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #18
> /usr/lib/samba/private/amd64/libsmbd-base-
> samba4.so'smbd_smb2_request_dispatch+0xc8f [0xfffffd7fee7c985f]
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #19
> /usr/lib/samba/private/amd64/libsmbd-base-
> samba4.so'smbd_smb2_connection_handler+0x621 [0xfffffd7fee7ca7e1]
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #20
> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_invoke
> _fd_handler+0x80 [0xfffffd7fecfca580]
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #21
> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'epoll_event_loop_onc
> e+0x22c [0xfffffd7fecfd180c]
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #22
> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_once+
> 0x40 [0xfffffd7fecfcf8f0]
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #23
> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'_tevent_loop_once+0x
> 95 [0xfffffd7fecfc9bd5]
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #24
> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_loop_w
> ait+0x23 [0xfffffd7fecfc9e43]
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #25
> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_wait+
> 0x40 [0xfffffd7fecfcf870]
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #26
> /usr/lib/samba/private/amd64/libsmbd-base-
> samba4.so'smbd_process+0x777 [0xfffffd7fee7b8677]
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #27
> /usr/lib/samba/sbin/amd64/smbd'smbd_accept_connection+0x189
> [0x40d5b9]
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #28
> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_invoke
> _fd_handler+0x80 [0xfffffd7fecfca580]
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #29
> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'epoll_event_loop_onc
> e+0x22c [0xfffffd7fecfd180c]
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #30
> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_once+
> 0x40 [0xfffffd7fecfcf8f0]
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #31
> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'_tevent_loop_once+0x
> 95 [0xfffffd7fecfc9bd5]
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #32
> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_loop_w
> ait+0x23 [0xfffffd7fecfc9e43]
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #33
> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_wait+
> 0x40 [0xfffffd7fecfcf870]
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #34
> /usr/lib/samba/sbin/amd64/smbd'main+0x1a0f [0x40f9ff]
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #35
> /usr/lib/samba/sbin/amd64/smbd'_start_crt+0x83 [0x408e73]
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #36
> /usr/lib/samba/sbin/amd64/smbd'_start+0x18 [0x408dd8]
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error] [2020/04/13
> 13:55:57.167481,  0, pid=1517, effective(0, 0), real(0, 0)]
> ../../source3/lib/dumpcore.c:315(dump_core)
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]   dumping
> core in /var/samba/log/cores/smbd
> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error] 
> Apr 13 13:55:57 wutz smbd[1530]: [ID 702911 daemon.error] [2020/04/13
> 13:55:57.650723,  0, pid=1530, effective(0, 0), real(0, 0)]
> ../../lib/util/become_daemon.c:136(daemon_ready)
> 
> 
> 
> > Am 13.04.2020 um 13:31 schrieb Anoop C S via samba-technical <
> > samba-technical@lists.samba.org>:
> > 
> > On Sun, 2020-04-12 at 11:24 +0200, Rouven WEILER via samba-
> > technical
> > wrote:
> > > In a previous email I mentioned that I got issue with samba
> > > 4.12.1 on
> > > Illumos/OpenIndiana and MacOS 10.15.4.
> > > I digged a little bit more and found out that the PANIC is caused
> > > when trying to do a time machine backup.
> > > 
> > > Plain samba works a as always. There seems to be only issues with
> > > time machine backup.
> > > 
> > > Everything worked before samba-4.12.0 and MacOS 10.15.4. I cannot
> > > tell which change cause the issues...
> > > 
> > > Staring from a new time capsule share I got the following:
> > > Creating a new time machine backup shows, I get a
> > > „.com.apple.timemachine.supported“ file added in to the share.
> > > 
> > > MacOS tells in it’s logs: „Failed to read capabilities for
> > > 'file:///Volumes/FileVault/', error: Socket is not connected“.
> > > 
> > > The smbd.log with loglevel vfs:10 shows:
> > 
> > Is it possible for you to reproduce with log level 10 set in
> > general
> > rather than just vfs? It might gives us more context around the
> > assertion failure leading to smbd panic.
> > 
> > > [2020/04/12 11:15:21.534742,  5, pid=1707, effective(500, 500),
> > > real(0, 0), class=vfs]
> > > ../../source3/smbd/vfs.c:1395(check_reduced_name)
> > >  check_reduced_name: .com.apple.timemachine.supported reduced to
> > > /export/home/timecapsule/.com.apple.timemachine.supported
> > > [2020/04/12 11:15:21.534789, 10, pid=1707, effective(500, 500),
> > > real(0, 0), class=vfs]
> > > ../../source3/modules/vfs_streams_xattr.c:379(streams_xattr_open)
> > >  streams_xattr_open called for .com.apple.timemachine.supported
> > > with
> > > flags 0x20080
> > > [2020/04/12 11:15:21.535160,  0]
> > > ../../lib/dbwrap/dbwrap.c:82(dbwrap_record_get_value)
> > >  PANIC: assert failed at ../../lib/dbwrap/dbwrap.c(82): rec-
> > > > value_valid
> > 
> > Similar assertion failures were fixed sometime back and I could see
> > those present in v4-12-stable branch. May be we missed some other
> > place..
> > 
> > > [2020/04/12 11:15:21.535322,  0]
> > > ../../source3/lib/util.c:830(smb_panic_s3)
> > >  PANIC (pid 1707): assert failed: rec->value_valid
> > > [2020/04/12 11:15:21.536138,  0]
> > > ../../lib/util/fault.c:265(log_stack_trace)
> > >  BACKTRACE: 37 stack frames:
> > >   #0 /usr/lib/samba/amd64/libsamba-
> > > util.so.0.0.1'log_stack_trace+0x26 [0xfffffd7fee51de66]
> > >   #1 /usr/lib/samba/amd64/libsmbconf.so.0'smb_panic_s3+0x26
> > > [0xfffffd7fedf5a596]
> > >   #2 /usr/lib/samba/amd64/libsamba-util.so.0.0.1'smb_panic+0x1f
> > > [0xfffffd7fee51df3f]
> > >   #3 /usr/lib/samba/private/amd64/libdbwrap-
> > > samba4.so'dbwrap_record_get_value+0x2a [0xfffffd7fece2627a]
> > >   #4 /usr/lib/samba/private/amd64/libsmbd-base-
> > > samba4.so'get_share_mode_lock+0x109 [0xfffffd7fee7195c9]
> > >   #5 /usr/lib/samba/private/amd64/libsmbd-base-
> > > samba4.so'smbd_contend_level2_oplocks_begin+0xa1
> > > [0xfffffd7fee7f7761]
> > >   #6 /usr/lib/samba/private/amd64/libsmbd-base-
> > > samba4.so'brl_lock+0x635 [0xfffffd7fee710f45]
> > >   #7 /usr/lib/samba/private/amd64/libsmbd-base-
> > > samba4.so'do_lock_fn+0xa4 [0xfffffd7fee70d534]
> > >   #8 /usr/lib/samba/private/amd64/libsmbd-base-
> > > samba4.so'share_mode_do_locked_fn+0x86 [0xfffffd7fee7174b6]
> > >   #9
> > > /usr/lib/samba/amd64/libsmbconf.so.0'dbwrap_watched_do_locked_fn+
> > > 0xfa
> > > [0xfffffd7fedf622ca]
> > >   #10 /usr/lib/samba/private/amd64/libdbwrap-
> > > samba4.so'db_tdb_do_locked+0x12f [0xfffffd7fece295cf]
> > >   #11 /usr/lib/samba/private/amd64/libdbwrap-
> > > samba4.so'dbwrap_do_locked+0x48 [0xfffffd7fece269a8]
> > >   #12
> > > /usr/lib/samba/amd64/libsmbconf.so.0'dbwrap_watched_do_locked+0x6
> > > f
> > > [0xfffffd7fedf60d7f]
> > >   #13 /usr/lib/samba/private/amd64/libdbwrap-
> > > samba4.so'dbwrap_do_locked+0x48 [0xfffffd7fece269a8]
> > >   #14 /usr/lib/samba/private/amd64/libsmbd-base-
> > > samba4.so'share_mode_do_locked+0xd2 [0xfffffd7fee719b82]
> > >   #15 /usr/lib/samba/private/amd64/libsmbd-base-
> > > samba4.so'do_lock+0xf0 [0xfffffd7fee70dfe0]
> > >   #16 /usr/lib/samba/amd64/vfs/fruit.so'fruit_create_file+0x7ba
> > > [0xfffffd7fe88a55aa]
> > >   #17 /usr/lib/samba/private/amd64/libsmbd-base-
> > > samba4.so'smbd_smb2_request_process_create+0xa07
> > > [0xfffffd7fee7d3237]
> > >   #18 /usr/lib/samba/private/amd64/libsmbd-base-
> > > samba4.so'smbd_smb2_request_dispatch+0xc8f [0xfffffd7fee7c985f]
> > >   #19 /usr/lib/samba/private/amd64/libsmbd-base-
> > > samba4.so'smbd_smb2_connection_handler+0x621 [0xfffffd7fee7ca7e1]
> > >   #20
> > > /usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_in
> > > voke
> > > _fd_handler+0x80 [0xfffffd7fecfca580]
> > >   #21
> > > /usr/lib/samba/private/amd64/libtevent.so.0.10.2'epoll_event_loop
> > > _onc
> > > e+0x22c [0xfffffd7fecfd180c]
> > >   #22
> > > /usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_o
> > > nce+
> > > 0x40 [0xfffffd7fecfcf8f0]
> > >   #23
> > > /usr/lib/samba/private/amd64/libtevent.so.0.10.2'_tevent_loop_onc
> > > e+0x
> > > 95 [0xfffffd7fecfc9bd5]
> > >   #24
> > > /usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_lo
> > > op_w
> > > ait+0x23 [0xfffffd7fecfc9e43]
> > >   #25
> > > /usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_w
> > > ait+
> > > 0x40 [0xfffffd7fecfcf870]
> > >   #26 /usr/lib/samba/private/amd64/libsmbd-base-
> > > samba4.so'smbd_process+0x777 [0xfffffd7fee7b8677]
> > >   #27 /usr/lib/samba/sbin/amd64/smbd'smbd_accept_connection+0x189
> > > [0x40d5b9]
> > >   #28
> > > /usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_in
> > > voke
> > > _fd_handler+0x80 [0xfffffd7fecfca580]
> > >   #29
> > > /usr/lib/samba/private/amd64/libtevent.so.0.10.2'epoll_event_loop
> > > _onc
> > > e+0x22c [0xfffffd7fecfd180c]
> > >   #30
> > > /usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_o
> > > nce+
> > > 0x40 [0xfffffd7fecfcf8f0]
> > >   #31
> > > /usr/lib/samba/private/amd64/libtevent.so.0.10.2'_tevent_loop_onc
> > > e+0x
> > > 95 [0xfffffd7fecfc9bd5]
> > >   #32
> > > /usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_lo
> > > op_w
> > > ait+0x23 [0xfffffd7fecfc9e43]
> > >   #33
> > > /usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_w
> > > ait+
> > > 0x40 [0xfffffd7fecfcf870]
> > >   #34 /usr/lib/samba/sbin/amd64/smbd'main+0x1a0f [0x40f9ff]
> > >   #35 /usr/lib/samba/sbin/amd64/smbd'_start_crt+0x83 [0x408e73]
> > >   #36 /usr/lib/samba/sbin/amd64/smbd'_start+0x18 [0x408dd8]
> > > [2020/04/12 11:15:21.538230,  0]
> > > ../../source3/lib/dumpcore.c:315(dump_core)
> > >  dumping core in /var/samba/log/cores/smbd
> > > [2020/04/12 11:15:21.949051,  0]
> > > ../../lib/util/become_daemon.c:136(daemon_ready)
> > >  daemon_ready: daemon 'smbd' finished starting up and ready to
> > > serve
> > > connections
> > > 
> > > 
> > > My smb.conf is:
> > > #======================= Global Settings
> > > =====================================
> > > [global]
> > > 
> > >    workgroup = mano-de.dios
> > >    netbios name = wutz
> > >    mdns name = mdns
> > >    multicast dns register = yes
> > >    server string = Filet Server (%v)
> > >    server role = standalone server
> > >    log file = /var/log/samba/smbd.log
> > >    max log size = 50
> > >    wins support = yes
> > >    dns proxy = no
> > >    guest account = nobody
> > >    fruit:aapl = yes
> > >    fruit:model = RackMac
> > >    log level = vfs:10
> > > 
> > > #============================ Share Definitions
> > > ==============================
> > > [homes]
> > >    comment = Home Share 
> > >    browseable = no
> > >    writable = yes
> > >    guest ok = no
> > >    vfs objects = catia fruit zfsacl streams_xattr 
> > >    fruit:resource = xattr
> > >    fruit:metadata = netatalk
> > >    fruit:locking = netatalk
> > >    fruit:encoding = native
> > > 
> > > [FileVault]
> > >    comment = Apple Time Capsule
> > >    path = /export/home/timecapsule
> > >    browseable = no
> > >    writeable = no
> > >    valid users = @admin
> > >    write list = @admin
> > >    guest ok = no
> > >    vfs objects = catia fruit zfsacl streams_xattr 
> > >    fruit:resource = xattr
> > >    fruit:metadata = netatalk
> > >    fruit:locking = netatalk
> > >    fruit:encoding = native
> > >    fruit:time machine = yes


