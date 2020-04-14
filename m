Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 783EE1A7610
	for <lists+samba-technical@lfdr.de>; Tue, 14 Apr 2020 10:29:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Date:Subject;
	bh=jKxglxmFTpKdKrlIl/eSP6vZmEDfZ0RnV5WBPXFtXY0=; b=ILrk147uS5bb1VgD3UmzHbLfLk
	sol3HzXSmYnjIrUzn4r/0hEaF9BZgYanyOJABPj+Ovg66vcoG/3M0NPj8fVngcFd/B/p8/YiYMrC/
	0v2xZKiLHGoX+y6F6lDnhn463ttHhnuGfD8EPty69YsZkGkl0k0ngYjGrvPXu/tsFrKbcH9vdV5W6
	35qe/6/jXonKj3plUm6rKfNIhNzZ8QHwyykR94oTBal/dyPuiQtZg+mG4SQQVxZf5S/fIudhSHrv4
	CY7y0u4eUBl+5sbQCtHqH+ypXNBHCwVytxVOKT6Fam6/rvg6yVhXjjVPknRU1YpNt5SMQFr+pVf1h
	ruR7HfpA==;
Received: from localhost ([::1]:58854 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jOGvn-000fVd-Vz; Tue, 14 Apr 2020 08:28:32 +0000
Received: from mout.gmx.net ([212.227.15.15]:52147) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jOGvh-000fVW-5X
 for samba-technical@lists.samba.org; Tue, 14 Apr 2020 08:28:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1586852904;
 bh=2JtCn8AKpSL6BhjcFyt3aKig2PK3l/LGh6gA9RDZRQg=;
 h=X-UI-Sender-Class:From:Subject:Date:References:Cc:In-Reply-To:To;
 b=ERPrg2CCZfPttcpumEfj8i6hmLd+2kQ6BVwvXcMhPe2Pe/BSE+btJuUgO248AD17U
 QrVCXtV9bCU/VNyECzusCg1vaR8RUZAwMrE70KlK/OKW1bMSqhUoHpUomXge6A40Xm
 DNmP6nbHYl18Gum5AVbHEuyRki2uNiAm7tj/7wIQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.47.88] ([217.250.86.248]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MeU0k-1io6lP2iKC-00aXZc; Tue, 14
 Apr 2020 10:28:23 +0200
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (1.0)
Subject: Re: PANIC: vfs_fruit for time machine backup causes PANIC
Date: Tue, 14 Apr 2020 10:28:21 +0200
Message-Id: <C849CA29-4E6B-4A9F-977B-125B9987BAEB@gmx.net>
References: <25844cbcb0a607d665f789849460210af0fc2241.camel@cryptolab.net>
In-Reply-To: <25844cbcb0a607d665f789849460210af0fc2241.camel@cryptolab.net>
To: Anoop C S <anoopcs@cryptolab.net>
X-Mailer: iPhone Mail (17E262)
X-Provags-ID: V03:K1:4StbgkAqsTRRFbZtbbZ0o7p7Jn7DdjdyfBkgai5rSQ1SwJsP2sw
 bQ64iFkx/qJV8x8bod4kwV4hq12cu4vupQdvb5x8Q4Oj2dtWkrt09MdjzUcDWGW3OWTdCvL
 l7FsvO7gzvlb6FWhF7lxh1Z3lhFMELSFbNx4Y4n2NW4bzyqb3NdyZRPLtjTfN10vZZ2fRtS
 Uri1l83QCA5e3N0yn12Gg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:azxUcKg0IQg=:8Sq6g5/CMTQ4lOI2s2AZYx
 WSVzgfOwT4GmB6k1fpSgTi6Qojk66k2jSS0vk8c6bfmCxdtXvNqvm8FvnRaFMztgUp+2zp0fN
 GgGpMDsWg7hAIi1oMjMWmqlCJmt2ocanTISlSpBQW3MdNL6BT5gjHZ7xyAULU68rK+Q8SGFtI
 g3Rw1iYcjLOZPp+vo1EdV1RWWXc6+MaO7uwnk9KbuPmn1Oatgv557vK0rC9wPsSyT9VkIXb+l
 9AAezop8q8cOtRpcsVSGChHeoCkJkG+noyZ1fYqbYTK/vfJSgKntemuhnEoLFgBoYijlOW43u
 nMGEhqVmkmq2rQMMZ6850ySKsoP6eDG1n731d6cSO367bzDLggVxnzIVQEie0cfygEENQ/vAX
 5N3Rsz7ER0pL0YRCdynmscs1lICWnQUMKRxlgKJNa29XZyH+dt3B6S+t3rVKNOIwAXgHStcnj
 IMLejwVxmNaMrfgXYGxaDgSaWGyp6wIZJSWjA7sI1Scc4vMTYa/xFuWfHtBP8sIAtTWrF7AJ9
 J8bGI7gxlcYmrXpofDovP8mghdQZFOXbTbYTRZgsQPW+y4VHDQRt80KbnMydffmAeDz85VG0M
 /lMh7U8Rtm/s7phJFVtUT6pWTDKvd/lWpllZwGRvPf7E8ecv/jaHQJSn+hhFBSpGE8cC5LKNf
 yqk0F88Oms3gu674W3qc/LxNFwH3O8MfuS2ch7d2Ji+8dvmZo7tZiqXwXjRtgInxRc/I0uW5C
 dM2PErzv8uPOXOB6F3Omex+rgCbCf6eKmbgUGNmjuYvWJA5YORB15GhUYytQwJ+9iMy6Wv3Je
 ZR9MR1CwfM2hpAnk4SJTlNeU0TYtUtqwjlwbH+SX7h0fkaDVqwRqikMoRFVcsSkLpjeHidM/o
 ycMwTKEIc0umBCqGSij/BP8h9BFr2iiXuG2EOMWrtsbG5zz7Ercbe9+k+vbKQBtlsEkcSneeO
 nnywFxBfWxLPrLKTZIftAqNdZXC3mUlSShdWzVFOCtbKlTzs42mnAE+h49KURZUu+MM5xIuDy
 09iYlliQU464LZvCYsImm9wUsp3LxADbVJYlwOlgcu3QgvRbYVchiaDbJhvg2kX3YvP6njO0C
 fhHhf3/A5hXYvp6NXe8zfiMIxO9fG0X92ZxptS3/f7LS9NKDWREyX5s+iQJTDhkWNPOr9yswE
 pEMl4I6Yp3iW3bv8IbK+7nNiJUg83Q/3+8hrd9I29JGuPjJ8RcF7DQiCkpwKetLtBkL5cQCTR
 ZM+NKO+tw2FiVYW3t
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
From: Rouven WEILER via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rouven WEILER <Rouven_Weiler@gmx.net>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

You got these logs. It's the server that is panicing. There is just one clie=
nt up in that context.

I startup the server, cause the crash and stop dverything.

If I do not understand correctly, please tell me how I can help.


> Am 14.04.2020 um 10:03 schrieb Anoop C S <anoopcs@cryptolab.net>:
>=20
> =EF=BB=BFOn Mon, 2020-04-13 at 14:04 +0200, Rouven WEILER via samba-techni=
cal
> wrote:
>> Okay here we go with =E2=80=9Elog level =3D 10=E2=80=9C.=20
>> log level 10 output is included in the attached file.
>=20
> We would be interested in log entries from the log file specific to the
> client which reports smbd panic.
>=20
>> As a proof, there the globals section:
>> #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Gl=
obal Settings
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> [global]
>>=20
>>    workgroup =3D mano-de.dios
>>    netbios name =3D wutz
>>    mdns name =3D mdns
>>    multicast dns register =3D yes
>>    server string =3D Filet Server (%v)
>>    server role =3D standalone server
>>    log file =3D /var/log/samba/smbd.log
>>    max log size =3D 50
>>    wins support =3D yes
>>    dns proxy =3D no
>>    guest account =3D nobody
>>    fruit:aapl =3D yes
>>    fruit:model =3D RackMac
>>    log level =3D 10
>>=20
>> #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D Share Definitions
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>>=20
>> dmesg error:
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]   PANIC:
>> assert failed at ../../lib/dbwrap/dbwrap.c(82): rec->value_valid
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error] [2020/04/13
>> 13:55:57.164502,  0, pid=3D1517, effective(500, 500), real(0, 0)]
>> ../../source3/lib/util.c:830(smb_panic_s3)
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]   PANIC
>> (pid 1517): assert failed: rec->value_valid
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error] [2020/04/13
>> 13:55:57.165311,  0, pid=3D1517, effective(500, 500), real(0, 0)]
>> ../../lib/util/fault.c:265(log_stack_trace)
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911
>> daemon.error]   BACKTRACE: 37 stack frames:
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #0
>> /usr/lib/samba/amd64/libsamba-util.so.0.0.1'log_stack_trace+0x26
>> [0xfffffd7fee51de66]
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #1
>> /usr/lib/samba/amd64/libsmbconf.so.0'smb_panic_s3+0x26
>> [0xfffffd7fedf5a596]
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #2
>> /usr/lib/samba/amd64/libsamba-util.so.0.0.1'smb_panic+0x1f
>> [0xfffffd7fee51df3f]
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #3
>> /usr/lib/samba/private/amd64/libdbwrap-
>> samba4.so'dbwrap_record_get_value+0x2a [0xfffffd7fecf4627a]
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #4
>> /usr/lib/samba/private/amd64/libsmbd-base-
>> samba4.so'get_share_mode_lock+0x109 [0xfffffd7fee7195c9]
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #5
>> /usr/lib/samba/private/amd64/libsmbd-base-
>> samba4.so'smbd_contend_level2_oplocks_begin+0xa1 [0xfffffd7fee7f7761]
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #6
>> /usr/lib/samba/private/amd64/libsmbd-base-samba4.so'brl_lock+0x635
>> [0xfffffd7fee710f45]
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #7
>> /usr/lib/samba/private/amd64/libsmbd-base-samba4.so'do_lock_fn+0xa4
>> [0xfffffd7fee70d534]
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #8
>> /usr/lib/samba/private/amd64/libsmbd-base-
>> samba4.so'share_mode_do_locked_fn+0x86 [0xfffffd7fee7174b6]
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #9
>> /usr/lib/samba/amd64/libsmbconf.so.0'dbwrap_watched_do_locked_fn+0xfa
>> [0xfffffd7fedf622ca]
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #10
>> /usr/lib/samba/private/amd64/libdbwrap-
>> samba4.so'db_tdb_do_locked+0x12f [0xfffffd7fecf495cf]
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #11
>> /usr/lib/samba/private/amd64/libdbwrap-
>> samba4.so'dbwrap_do_locked+0x48 [0xfffffd7fecf469a8]
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #12
>> /usr/lib/samba/amd64/libsmbconf.so.0'dbwrap_watched_do_locked+0x6f
>> [0xfffffd7fedf60d7f]
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #13
>> /usr/lib/samba/private/amd64/libdbwrap-
>> samba4.so'dbwrap_do_locked+0x48 [0xfffffd7fecf469a8]
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #14
>> /usr/lib/samba/private/amd64/libsmbd-base-
>> samba4.so'share_mode_do_locked+0xd2 [0xfffffd7fee719b82]
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #15
>> /usr/lib/samba/private/amd64/libsmbd-base-samba4.so'do_lock+0xf0
>> [0xfffffd7fee70dfe0]
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #16
>> /usr/lib/samba/amd64/vfs/fruit.so'fruit_create_file+0x7ba
>> [0xfffffd7fe88c55aa]
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #17
>> /usr/lib/samba/private/amd64/libsmbd-base-
>> samba4.so'smbd_smb2_request_process_create+0xa07 [0xfffffd7fee7d3237]
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #18
>> /usr/lib/samba/private/amd64/libsmbd-base-
>> samba4.so'smbd_smb2_request_dispatch+0xc8f [0xfffffd7fee7c985f]
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #19
>> /usr/lib/samba/private/amd64/libsmbd-base-
>> samba4.so'smbd_smb2_connection_handler+0x621 [0xfffffd7fee7ca7e1]
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #20
>> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_invoke
>> _fd_handler+0x80 [0xfffffd7fecfca580]
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #21
>> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'epoll_event_loop_onc
>> e+0x22c [0xfffffd7fecfd180c]
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #22
>> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_once+
>> 0x40 [0xfffffd7fecfcf8f0]
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #23
>> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'_tevent_loop_once+0x
>> 95 [0xfffffd7fecfc9bd5]
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #24
>> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_loop_w
>> ait+0x23 [0xfffffd7fecfc9e43]
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #25
>> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_wait+
>> 0x40 [0xfffffd7fecfcf870]
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #26
>> /usr/lib/samba/private/amd64/libsmbd-base-
>> samba4.so'smbd_process+0x777 [0xfffffd7fee7b8677]
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #27
>> /usr/lib/samba/sbin/amd64/smbd'smbd_accept_connection+0x189
>> [0x40d5b9]
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #28
>> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_invoke
>> _fd_handler+0x80 [0xfffffd7fecfca580]
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #29
>> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'epoll_event_loop_onc
>> e+0x22c [0xfffffd7fecfd180c]
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #30
>> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_once+
>> 0x40 [0xfffffd7fecfcf8f0]
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #31
>> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'_tevent_loop_once+0x
>> 95 [0xfffffd7fecfc9bd5]
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #32
>> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_loop_w
>> ait+0x23 [0xfffffd7fecfc9e43]
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #33
>> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_wait+
>> 0x40 [0xfffffd7fecfcf870]
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #34
>> /usr/lib/samba/sbin/amd64/smbd'main+0x1a0f [0x40f9ff]
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #35
>> /usr/lib/samba/sbin/amd64/smbd'_start_crt+0x83 [0x408e73]
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]    #36
>> /usr/lib/samba/sbin/amd64/smbd'_start+0x18 [0x408dd8]
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error] [2020/04/13
>> 13:55:57.167481,  0, pid=3D1517, effective(0, 0), real(0, 0)]
>> ../../source3/lib/dumpcore.c:315(dump_core)
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]   dumping
>> core in /var/samba/log/cores/smbd
>> Apr 13 13:55:57 wutz smbd[1517]: [ID 702911 daemon.error]=20
>> Apr 13 13:55:57 wutz smbd[1530]: [ID 702911 daemon.error] [2020/04/13
>> 13:55:57.650723,  0, pid=3D1530, effective(0, 0), real(0, 0)]
>> ../../lib/util/become_daemon.c:136(daemon_ready)
>>=20
>>=20
>>=20
>>> Am 13.04.2020 um 13:31 schrieb Anoop C S via samba-technical <
>>> samba-technical@lists.samba.org>:
>>>=20
>>> On Sun, 2020-04-12 at 11:24 +0200, Rouven WEILER via samba-
>>> technical
>>> wrote:
>>>> In a previous email I mentioned that I got issue with samba
>>>> 4.12.1 on
>>>> Illumos/OpenIndiana and MacOS 10.15.4.
>>>> I digged a little bit more and found out that the PANIC is caused
>>>> when trying to do a time machine backup.
>>>>=20
>>>> Plain samba works a as always. There seems to be only issues with
>>>> time machine backup.
>>>>=20
>>>> Everything worked before samba-4.12.0 and MacOS 10.15.4. I cannot
>>>> tell which change cause the issues...
>>>>=20
>>>> Staring from a new time capsule share I got the following:
>>>> Creating a new time machine backup shows, I get a
>>>> =E2=80=9E.com.apple.timemachine.supported=E2=80=9C file added in to the=
 share.
>>>>=20
>>>> MacOS tells in it=E2=80=99s logs: =E2=80=9EFailed to read capabilities f=
or
>>>> 'file:///Volumes/FileVault/', error: Socket is not connected=E2=80=9C.
>>>>=20
>>>> The smbd.log with loglevel vfs:10 shows:
>>>=20
>>> Is it possible for you to reproduce with log level 10 set in
>>> general
>>> rather than just vfs? It might gives us more context around the
>>> assertion failure leading to smbd panic.
>>>=20
>>>> [2020/04/12 11:15:21.534742,  5, pid=3D1707, effective(500, 500),
>>>> real(0, 0), class=3Dvfs]
>>>> ../../source3/smbd/vfs.c:1395(check_reduced_name)
>>>> check_reduced_name: .com.apple.timemachine.supported reduced to
>>>> /export/home/timecapsule/.com.apple.timemachine.supported
>>>> [2020/04/12 11:15:21.534789, 10, pid=3D1707, effective(500, 500),
>>>> real(0, 0), class=3Dvfs]
>>>> ../../source3/modules/vfs_streams_xattr.c:379(streams_xattr_open)
>>>> streams_xattr_open called for .com.apple.timemachine.supported
>>>> with
>>>> flags 0x20080
>>>> [2020/04/12 11:15:21.535160,  0]
>>>> ../../lib/dbwrap/dbwrap.c:82(dbwrap_record_get_value)
>>>> PANIC: assert failed at ../../lib/dbwrap/dbwrap.c(82): rec-
>>>>> value_valid
>>>=20
>>> Similar assertion failures were fixed sometime back and I could see
>>> those present in v4-12-stable branch. May be we missed some other
>>> place..
>>>=20
>>>> [2020/04/12 11:15:21.535322,  0]
>>>> ../../source3/lib/util.c:830(smb_panic_s3)
>>>> PANIC (pid 1707): assert failed: rec->value_valid
>>>> [2020/04/12 11:15:21.536138,  0]
>>>> ../../lib/util/fault.c:265(log_stack_trace)
>>>> BACKTRACE: 37 stack frames:
>>>>  #0 /usr/lib/samba/amd64/libsamba-
>>>> util.so.0.0.1'log_stack_trace+0x26 [0xfffffd7fee51de66]
>>>>  #1 /usr/lib/samba/amd64/libsmbconf.so.0'smb_panic_s3+0x26
>>>> [0xfffffd7fedf5a596]
>>>>  #2 /usr/lib/samba/amd64/libsamba-util.so.0.0.1'smb_panic+0x1f
>>>> [0xfffffd7fee51df3f]
>>>>  #3 /usr/lib/samba/private/amd64/libdbwrap-
>>>> samba4.so'dbwrap_record_get_value+0x2a [0xfffffd7fece2627a]
>>>>  #4 /usr/lib/samba/private/amd64/libsmbd-base-
>>>> samba4.so'get_share_mode_lock+0x109 [0xfffffd7fee7195c9]
>>>>  #5 /usr/lib/samba/private/amd64/libsmbd-base-
>>>> samba4.so'smbd_contend_level2_oplocks_begin+0xa1
>>>> [0xfffffd7fee7f7761]
>>>>  #6 /usr/lib/samba/private/amd64/libsmbd-base-
>>>> samba4.so'brl_lock+0x635 [0xfffffd7fee710f45]
>>>>  #7 /usr/lib/samba/private/amd64/libsmbd-base-
>>>> samba4.so'do_lock_fn+0xa4 [0xfffffd7fee70d534]
>>>>  #8 /usr/lib/samba/private/amd64/libsmbd-base-
>>>> samba4.so'share_mode_do_locked_fn+0x86 [0xfffffd7fee7174b6]
>>>>  #9
>>>> /usr/lib/samba/amd64/libsmbconf.so.0'dbwrap_watched_do_locked_fn+
>>>> 0xfa
>>>> [0xfffffd7fedf622ca]
>>>>  #10 /usr/lib/samba/private/amd64/libdbwrap-
>>>> samba4.so'db_tdb_do_locked+0x12f [0xfffffd7fece295cf]
>>>>  #11 /usr/lib/samba/private/amd64/libdbwrap-
>>>> samba4.so'dbwrap_do_locked+0x48 [0xfffffd7fece269a8]
>>>>  #12
>>>> /usr/lib/samba/amd64/libsmbconf.so.0'dbwrap_watched_do_locked+0x6
>>>> f
>>>> [0xfffffd7fedf60d7f]
>>>>  #13 /usr/lib/samba/private/amd64/libdbwrap-
>>>> samba4.so'dbwrap_do_locked+0x48 [0xfffffd7fece269a8]
>>>>  #14 /usr/lib/samba/private/amd64/libsmbd-base-
>>>> samba4.so'share_mode_do_locked+0xd2 [0xfffffd7fee719b82]
>>>>  #15 /usr/lib/samba/private/amd64/libsmbd-base-
>>>> samba4.so'do_lock+0xf0 [0xfffffd7fee70dfe0]
>>>>  #16 /usr/lib/samba/amd64/vfs/fruit.so'fruit_create_file+0x7ba
>>>> [0xfffffd7fe88a55aa]
>>>>  #17 /usr/lib/samba/private/amd64/libsmbd-base-
>>>> samba4.so'smbd_smb2_request_process_create+0xa07
>>>> [0xfffffd7fee7d3237]
>>>>  #18 /usr/lib/samba/private/amd64/libsmbd-base-
>>>> samba4.so'smbd_smb2_request_dispatch+0xc8f [0xfffffd7fee7c985f]
>>>>  #19 /usr/lib/samba/private/amd64/libsmbd-base-
>>>> samba4.so'smbd_smb2_connection_handler+0x621 [0xfffffd7fee7ca7e1]
>>>>  #20
>>>> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_in
>>>> voke
>>>> _fd_handler+0x80 [0xfffffd7fecfca580]
>>>>  #21
>>>> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'epoll_event_loop
>>>> _onc
>>>> e+0x22c [0xfffffd7fecfd180c]
>>>>  #22
>>>> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_o
>>>> nce+
>>>> 0x40 [0xfffffd7fecfcf8f0]
>>>>  #23
>>>> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'_tevent_loop_onc
>>>> e+0x
>>>> 95 [0xfffffd7fecfc9bd5]
>>>>  #24
>>>> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_lo
>>>> op_w
>>>> ait+0x23 [0xfffffd7fecfc9e43]
>>>>  #25
>>>> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_w
>>>> ait+
>>>> 0x40 [0xfffffd7fecfcf870]
>>>>  #26 /usr/lib/samba/private/amd64/libsmbd-base-
>>>> samba4.so'smbd_process+0x777 [0xfffffd7fee7b8677]
>>>>  #27 /usr/lib/samba/sbin/amd64/smbd'smbd_accept_connection+0x189
>>>> [0x40d5b9]
>>>>  #28
>>>> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_in
>>>> voke
>>>> _fd_handler+0x80 [0xfffffd7fecfca580]
>>>>  #29
>>>> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'epoll_event_loop
>>>> _onc
>>>> e+0x22c [0xfffffd7fecfd180c]
>>>>  #30
>>>> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_o
>>>> nce+
>>>> 0x40 [0xfffffd7fecfcf8f0]
>>>>  #31
>>>> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'_tevent_loop_onc
>>>> e+0x
>>>> 95 [0xfffffd7fecfc9bd5]
>>>>  #32
>>>> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_lo
>>>> op_w
>>>> ait+0x23 [0xfffffd7fecfc9e43]
>>>>  #33
>>>> /usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_w
>>>> ait+
>>>> 0x40 [0xfffffd7fecfcf870]
>>>>  #34 /usr/lib/samba/sbin/amd64/smbd'main+0x1a0f [0x40f9ff]
>>>>  #35 /usr/lib/samba/sbin/amd64/smbd'_start_crt+0x83 [0x408e73]
>>>>  #36 /usr/lib/samba/sbin/amd64/smbd'_start+0x18 [0x408dd8]
>>>> [2020/04/12 11:15:21.538230,  0]
>>>> ../../source3/lib/dumpcore.c:315(dump_core)
>>>> dumping core in /var/samba/log/cores/smbd
>>>> [2020/04/12 11:15:21.949051,  0]
>>>> ../../lib/util/become_daemon.c:136(daemon_ready)
>>>> daemon_ready: daemon 'smbd' finished starting up and ready to
>>>> serve
>>>> connections
>>>>=20
>>>>=20
>>>> My smb.conf is:
>>>> #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D G=
lobal Settings
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> [global]
>>>>=20
>>>>   workgroup =3D mano-de.dios
>>>>   netbios name =3D wutz
>>>>   mdns name =3D mdns
>>>>   multicast dns register =3D yes
>>>>   server string =3D Filet Server (%v)
>>>>   server role =3D standalone server
>>>>   log file =3D /var/log/samba/smbd.log
>>>>   max log size =3D 50
>>>>   wins support =3D yes
>>>>   dns proxy =3D no
>>>>   guest account =3D nobody
>>>>   fruit:aapl =3D yes
>>>>   fruit:model =3D RackMac
>>>>   log level =3D vfs:10
>>>>=20
>>>> #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D Share Definitions
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>>>> [homes]
>>>>   comment =3D Home Share=20
>>>>   browseable =3D no
>>>>   writable =3D yes
>>>>   guest ok =3D no
>>>>   vfs objects =3D catia fruit zfsacl streams_xattr=20
>>>>   fruit:resource =3D xattr
>>>>   fruit:metadata =3D netatalk
>>>>   fruit:locking =3D netatalk
>>>>   fruit:encoding =3D native
>>>>=20
>>>> [FileVault]
>>>>   comment =3D Apple Time Capsule
>>>>   path =3D /export/home/timecapsule
>>>>   browseable =3D no
>>>>   writeable =3D no
>>>>   valid users =3D @admin
>>>>   write list =3D @admin
>>>>   guest ok =3D no
>>>>   vfs objects =3D catia fruit zfsacl streams_xattr=20
>>>>   fruit:resource =3D xattr
>>>>   fruit:metadata =3D netatalk
>>>>   fruit:locking =3D netatalk
>>>>   fruit:encoding =3D native
>>>>   fruit:time machine =3D yes
>=20


