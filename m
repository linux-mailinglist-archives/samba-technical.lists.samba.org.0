Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3131A5DBE
	for <lists+samba-technical@lfdr.de>; Sun, 12 Apr 2020 11:25:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=hW2pYTh8+4yHL5H21H62Mt9cmsugYGKpOZT9R76tU1s=; b=lOUvU5g3L1wiw1NkY8rHaBiEvn
	zNx6o3kcyXqMva6teRq63aCjyfD65s3L+ruEVaTWkPH2DPh9qEccUCCDB9z/P5h/jjYEdMG6C1xMg
	kzmpRb2EYpz0Y7C4l+FWpqe6Jb+mJ9asIZMpSKjrOZh5it8xxJMzB2TKDc2v1qfwpQ3LDRIhOhcTb
	Q+sSBLXPEC9ibCHHcricj5dE9PUlAM7jYfegEnki3y/C6CEVBtNyV63l3VPHRryo1KGKolhLTnrzZ
	iv+0i93h4PX8GL1kZXKm0xR81Tjm4dW1k2zEsS4kq/JgDylnRh3RjwTT6I4tSyXPoqohNeDtGFR4J
	d9x4YXQw==;
Received: from localhost ([::1]:35352 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jNYr2-000Xuq-Gf; Sun, 12 Apr 2020 09:24:40 +0000
Received: from mout.gmx.net ([212.227.15.18]:45467) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jNYqx-000Xuj-T9
 for samba-technical@lists.samba.org; Sun, 12 Apr 2020 09:24:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1586683472;
 bh=d1OVYchU0okY0vneXpJW80HrYiDs8aGwABehfrE5rXA=;
 h=X-UI-Sender-Class:From:Subject:References:To:Date;
 b=MnLA9sZ3gh7q4IatJKv4j3Ii6o5LJRudqKgo9B3WIzRLnIwsZp49vrWvM6uiP5RxO
 rE4XIVNHCj9ol+qNJT1o0nElRJ5l2nji2Xlp3XDHeWLJRfFQca0uu/4Ao+u2Wnlp+e
 NCwkAitU/bToGJwRQgz3cgX4b8dH45H6ZIUzmdSo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.47.100] ([217.250.86.248]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M2f5Z-1jQZWp2GOF-004FQq for
 <samba-technical@lists.samba.org>; Sun, 12 Apr 2020 11:24:32 +0200
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: PANIC: vfs_fruit for time machine backup causes PANIC
Message-Id: <9644B646-2EDF-448E-BF4A-8770157AAC71@gmx.net>
References: <03B0942F-6362-4FCD-9DC0-F267968A64FC@gmx.net>
To: samba-technical <samba-technical@lists.samba.org>
Date: Sun, 12 Apr 2020 11:24:31 +0200
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Provags-ID: V03:K1:AGsWOho97ZsLPTs5nFV3MfN7c9XbWzSgVYvKeIYpjZwKcB49Bza
 3/TSpNO+9sK7C1ZvRat/pBd+p8023Bs+wJnmZzWBI8wIgP9MqNuQwMcqoYomodGZYNCT6dH
 fAgKeGWsz58euwOqcvI4BBRY32AeCgBbwt/m8xgVfdUtRq2D3GeKgbQ8Fu+q/4oJAzGH23n
 bVMHzes9nH1YgZlCSTVeQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wo+SFlpzHgM=:v/AyFMy16+WqHeVegC86zk
 UjgfeJqhVIFBTtmOW9ZvrIx/8Z28W4hYo47mBYcm5Qd7MwGWUkMrNsalQnEfS3Biilbq/JEDL
 ad44OHY9xKZKIyJ4lI4C81XuUnh7y++oen9uEGWkxNQYsHjCNuEf/Hm1wcNoQnTJFFssPvor3
 oVUeGqmvNdc9fPsEyNqRbgigKO1BxstHbPt/zc3LOm5IUIc58Oa2ThOaQJlUb+N1gXet6Rxcr
 TxjrxG/FKCnbd99Jy/sVSQLjYODStOuFW+aJfz7Q1gtepS4C2klpz52znu4Sl9qgKY0Zq646+
 WP/FltqOSNdVf2Px0nRitaaKB0Sts2oTbufk3WXGjHo4pY0pFN+1oMGyPDXPS69oRbI5cfdkf
 ClXRTfsr3UzdDKiqdbb0YXXKYLOI0GGwyJrPTYu3YGcybozTGAWUa0NM7lpVYHTDETpPIeuAG
 x6xs7tgAE2SnK+kI7GE6p7APU04+yiBAuXp4jyEGgepjk8luEv09MRG6kqUfdHKuraXYyheuU
 LDj6sPuk7JEFKKxDXRoyjfvM5pKuvBb3RaejRSkFI8VSXiuRXr9SNa9gokIMgGoHEZdA8P44J
 4L6JHcpF5QtG6ybxNSOuyjv+QFxdZetupfMDqAxWaLQPgweZOid0ty3BfxnBrLJV8oCSHT/kh
 +OGAs2n2nvMwqAouLl22TW+TB5NVtNjZ8t22aBIewdxFv2iqZwiuy/bC9gIhzTULQjo48c1K5
 JBb0ctrRfnWKuciCyrolW14sIET+bKf0wckxJQv1iEEhLOjo4crexSJIhvNlL7WVbqgMe39y1
 HvOgkiL49wTeoJ65lv29sIvCHMK4PjjuuwHfYkzD2b30qC5zLwk5AgyxDKCbgw72KCUTtDWx+
 Ax/lqp/UVoK7O1smp5Xx0bti1korpjFFQ/XABBn8eQYi/8/ZpbfNWZHJDaoZiV41AefWMm5jM
 GvVGdijVDhzDOVxvpekBBqA5urhXFVmoUHrQ61btw6muoEuQW9kZxVgc3J3JG+/dEjPCrCbvS
 i+JnsJDuTmRtXTuYPsCXwUOwPLD8644XK6tej6fUOtQqrcFPb12VpAyIrTNIXzt2t7EmZ3OIy
 dAtOdxQeR3fuSLNuAXDKWt+srWN7TlTFcbPFWH8L0r84WCPxnhFGGAi4BhGg65A1h3GuiVW07
 eu+rAefzWZcV9TexfGBRJ0deLoBsc0LclHs4QPPwHRJewzVXmT6PyCx2vl1Ehy9AHQKrLk3CR
 ZXo6tUXY5/C96Augo
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

In a previous email I mentioned that I got issue with samba 4.12.1 on =
Illumos/OpenIndiana and MacOS 10.15.4.
I digged a little bit more and found out that the PANIC is caused when =
trying to do a time machine backup.

Plain samba works a as always. There seems to be only issues with time =
machine backup.

Everything worked before samba-4.12.0 and MacOS 10.15.4. I cannot tell =
which change cause the issues...

Staring from a new time capsule share I got the following:
Creating a new time machine backup shows, I get a =
=E2=80=9E.com.apple.timemachine.supported=E2=80=9C file added in to the =
share.

MacOS tells in it=E2=80=99s logs: =E2=80=9EFailed to read capabilities =
for 'file:///Volumes/FileVault/', error: Socket is not connected=E2=80=9C.=


The smbd.log with loglevel vfs:10 shows:

[2020/04/12 11:15:21.534742,  5, pid=3D1707, effective(500, 500), =
real(0, 0), class=3Dvfs] =
../../source3/smbd/vfs.c:1395(check_reduced_name)
  check_reduced_name: .com.apple.timemachine.supported reduced to =
/export/home/timecapsule/.com.apple.timemachine.supported
[2020/04/12 11:15:21.534789, 10, pid=3D1707, effective(500, 500), =
real(0, 0), class=3Dvfs] =
../../source3/modules/vfs_streams_xattr.c:379(streams_xattr_open)
  streams_xattr_open called for .com.apple.timemachine.supported with =
flags 0x20080
[2020/04/12 11:15:21.535160,  0] =
../../lib/dbwrap/dbwrap.c:82(dbwrap_record_get_value)
  PANIC: assert failed at ../../lib/dbwrap/dbwrap.c(82): =
rec->value_valid
[2020/04/12 11:15:21.535322,  0] =
../../source3/lib/util.c:830(smb_panic_s3)
  PANIC (pid 1707): assert failed: rec->value_valid
[2020/04/12 11:15:21.536138,  0] =
../../lib/util/fault.c:265(log_stack_trace)
  BACKTRACE: 37 stack frames:
   #0 /usr/lib/samba/amd64/libsamba-util.so.0.0.1'log_stack_trace+0x26 =
[0xfffffd7fee51de66]
   #1 /usr/lib/samba/amd64/libsmbconf.so.0'smb_panic_s3+0x26 =
[0xfffffd7fedf5a596]
   #2 /usr/lib/samba/amd64/libsamba-util.so.0.0.1'smb_panic+0x1f =
[0xfffffd7fee51df3f]
   #3 =
/usr/lib/samba/private/amd64/libdbwrap-samba4.so'dbwrap_record_get_value+0=
x2a [0xfffffd7fece2627a]
   #4 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'get_share_mode_lock+0x=
109 [0xfffffd7fee7195c9]
   #5 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'smbd_contend_level2_op=
locks_begin+0xa1 [0xfffffd7fee7f7761]
   #6 /usr/lib/samba/private/amd64/libsmbd-base-samba4.so'brl_lock+0x635 =
[0xfffffd7fee710f45]
   #7 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'do_lock_fn+0xa4 =
[0xfffffd7fee70d534]
   #8 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'share_mode_do_locked_f=
n+0x86 [0xfffffd7fee7174b6]
   #9 =
/usr/lib/samba/amd64/libsmbconf.so.0'dbwrap_watched_do_locked_fn+0xfa =
[0xfffffd7fedf622ca]
   #10 =
/usr/lib/samba/private/amd64/libdbwrap-samba4.so'db_tdb_do_locked+0x12f =
[0xfffffd7fece295cf]
   #11 =
/usr/lib/samba/private/amd64/libdbwrap-samba4.so'dbwrap_do_locked+0x48 =
[0xfffffd7fece269a8]
   #12 =
/usr/lib/samba/amd64/libsmbconf.so.0'dbwrap_watched_do_locked+0x6f =
[0xfffffd7fedf60d7f]
   #13 =
/usr/lib/samba/private/amd64/libdbwrap-samba4.so'dbwrap_do_locked+0x48 =
[0xfffffd7fece269a8]
   #14 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'share_mode_do_locked+0=
xd2 [0xfffffd7fee719b82]
   #15 /usr/lib/samba/private/amd64/libsmbd-base-samba4.so'do_lock+0xf0 =
[0xfffffd7fee70dfe0]
   #16 /usr/lib/samba/amd64/vfs/fruit.so'fruit_create_file+0x7ba =
[0xfffffd7fe88a55aa]
   #17 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'smbd_smb2_request_proc=
ess_create+0xa07 [0xfffffd7fee7d3237]
   #18 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'smbd_smb2_request_disp=
atch+0xc8f [0xfffffd7fee7c985f]
   #19 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'smbd_smb2_connection_h=
andler+0x621 [0xfffffd7fee7ca7e1]
   #20 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_invoke_fd_h=
andler+0x80 [0xfffffd7fecfca580]
   #21 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'epoll_event_loop_once+0x2=
2c [0xfffffd7fecfd180c]
   #22 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_once+0x40 =
[0xfffffd7fecfcf8f0]
   #23 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'_tevent_loop_once+0x95 =
[0xfffffd7fecfc9bd5]
   #24 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_loop_wait+0=
x23 [0xfffffd7fecfc9e43]
   #25 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_wait+0x40 =
[0xfffffd7fecfcf870]
   #26 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'smbd_process+0x777 =
[0xfffffd7fee7b8677]
   #27 /usr/lib/samba/sbin/amd64/smbd'smbd_accept_connection+0x189 =
[0x40d5b9]
   #28 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_invoke_fd_h=
andler+0x80 [0xfffffd7fecfca580]
   #29 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'epoll_event_loop_once+0x2=
2c [0xfffffd7fecfd180c]
   #30 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_once+0x40 =
[0xfffffd7fecfcf8f0]
   #31 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'_tevent_loop_once+0x95 =
[0xfffffd7fecfc9bd5]
   #32 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_loop_wait+0=
x23 [0xfffffd7fecfc9e43]
   #33 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_wait+0x40 =
[0xfffffd7fecfcf870]
   #34 /usr/lib/samba/sbin/amd64/smbd'main+0x1a0f [0x40f9ff]
   #35 /usr/lib/samba/sbin/amd64/smbd'_start_crt+0x83 [0x408e73]
   #36 /usr/lib/samba/sbin/amd64/smbd'_start+0x18 [0x408dd8]
[2020/04/12 11:15:21.538230,  0] =
../../source3/lib/dumpcore.c:315(dump_core)
  dumping core in /var/samba/log/cores/smbd
[2020/04/12 11:15:21.949051,  0] =
../../lib/util/become_daemon.c:136(daemon_ready)
  daemon_ready: daemon 'smbd' finished starting up and ready to serve =
connections


My smb.conf is:
#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
Global Settings =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[global]

    workgroup =3D mano-de.dios
    netbios name =3D wutz
    mdns name =3D mdns
    multicast dns register =3D yes
    server string =3D Filet Server (%v)
    server role =3D standalone server
    log file =3D /var/log/samba/smbd.log
    max log size =3D 50
    wins support =3D yes
    dns proxy =3D no
    guest account =3D nobody
    fruit:aapl =3D yes
    fruit:model =3D RackMac
    log level =3D vfs:10

#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D Share Definitions =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[homes]
    comment =3D Home Share=20
    browseable =3D no
    writable =3D yes
    guest ok =3D no
    vfs objects =3D catia fruit zfsacl streams_xattr=20
    fruit:resource =3D xattr
    fruit:metadata =3D netatalk
    fruit:locking =3D netatalk
    fruit:encoding =3D native

[FileVault]
    comment =3D Apple Time Capsule
    path =3D /export/home/timecapsule
    browseable =3D no
    writeable =3D no
    valid users =3D @admin
    write list =3D @admin
    guest ok =3D no
    vfs objects =3D catia fruit zfsacl streams_xattr=20
    fruit:resource =3D xattr
    fruit:metadata =3D netatalk
    fruit:locking =3D netatalk
    fruit:encoding =3D native
    fruit:time machine =3D yes





> Anfang der weitergeleiteten Nachricht:
>=20
> Von: Rouven WEILER <Rouven_Weiler@gmx.net>
> Betreff: PANIC: assert failed at ../../lib/dbwrap/dbwrap.c(82): =
rec->value_valid when connecting to samba
> Datum: 10. April 2020 um 08:07:18 MESZ
> An: samba-technical <samba-technical@lists.samba.org>
>=20
> With samba-4.12.1 on OpenIndiana/Illumos (latest pkg set) I get the =
following log error when trying to connect with MacOS 10.15.4. Is there =
anything I can provide/do to help to fix that issue?
>=20
> [2020/04/10 08:00:38.107917,  0] =
../../lib/dbwrap/dbwrap.c:82(dbwrap_record_get_value)
>  PANIC: assert failed at ../../lib/dbwrap/dbwrap.c(82): =
rec->value_valid
> [2020/04/10 08:00:38.108499,  0] =
../../source3/lib/util.c:830(smb_panic_s3)
>  PANIC (pid 3427): assert failed: rec->value_valid
> [2020/04/10 08:00:38.109541,  0] =
../../lib/util/fault.c:265(log_stack_trace)
>  BACKTRACE: 37 stack frames:
>   #0 /usr/lib/samba/amd64/libsamba-util.so.0.0.1'log_stack_trace+0x26 =
[0xfffffd7fee51de66]
>   #1 /usr/lib/samba/amd64/libsmbconf.so.0'smb_panic_s3+0x26 =
[0xfffffd7fedf5a596]
>   #2 /usr/lib/samba/amd64/libsamba-util.so.0.0.1'smb_panic+0x1f =
[0xfffffd7fee51df3f]
>   #3 =
/usr/lib/samba/private/amd64/libdbwrap-samba4.so'dbwrap_record_get_value+0=
x2a [0xfffffd7feccb627a]
>   #4 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'get_share_mode_lock+0x=
109 [0xfffffd7fee7195c9]
>   #5 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'smbd_contend_level2_op=
locks_begin+0xa1 [0xfffffd7fee7f7761]
>   #6 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'brl_lock+0x635 =
[0xfffffd7fee710f45]
>   #7 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'do_lock_fn+0xa4 =
[0xfffffd7fee70d534]
>   #8 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'share_mode_do_locked_f=
n+0x86 [0xfffffd7fee7174b6]
>   #9 =
/usr/lib/samba/amd64/libsmbconf.so.0'dbwrap_watched_do_locked_fn+0xfa =
[0xfffffd7fedf622ca]
>   #10 =
/usr/lib/samba/private/amd64/libdbwrap-samba4.so'db_tdb_do_locked+0x12f =
[0xfffffd7feccb95cf]
>   #11 =
/usr/lib/samba/private/amd64/libdbwrap-samba4.so'dbwrap_do_locked+0x48 =
[0xfffffd7feccb69a8]
>   #12 =
/usr/lib/samba/amd64/libsmbconf.so.0'dbwrap_watched_do_locked+0x6f =
[0xfffffd7fedf60d7f]
>   #13 =
/usr/lib/samba/private/amd64/libdbwrap-samba4.so'dbwrap_do_locked+0x48 =
[0xfffffd7feccb69a8]
>   #14 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'share_mode_do_locked+0=
xd2 [0xfffffd7fee719b82]
>   #15 /usr/lib/samba/private/amd64/libsmbd-base-samba4.so'do_lock+0xf0 =
[0xfffffd7fee70dfe0]
>   #16 /usr/lib/samba/amd64/vfs/fruit.so'fruit_create_file+0x7ba =
[0xfffffd7fe88855aa]
>   #17 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'smbd_smb2_request_proc=
ess_create+0xa07 [0xfffffd7fee7d3237]
>   #18 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'smbd_smb2_request_disp=
atch+0xc8f [0xfffffd7fee7c985f]
>   #19 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'smbd_smb2_connection_h=
andler+0x621 [0xfffffd7fee7ca7e1]
>   #20 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_invoke_fd_h=
andler+0x80 [0xfffffd7fecd3a580]
>   #21 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'epoll_event_loop_once+0x2=
2c [0xfffffd7fecd4180c]
>   #22 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_once+0x40 =
[0xfffffd7fecd3f8f0]
>   #23 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'_tevent_loop_once+0x95 =
[0xfffffd7fecd39bd5]
>   #24 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_loop_wait+0=
x23 [0xfffffd7fecd39e43]
>   #25 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_wait+0x40 =
[0xfffffd7fecd3f870]
>   #26 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'smbd_process+0x777 =
[0xfffffd7fee7b8677]
>   #27 /usr/lib/samba/sbin/amd64/smbd'smbd_accept_connection+0x189 =
[0x40d5b9]
>   #28 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_invoke_fd_h=
andler+0x80 [0xfffffd7fecd3a580]
>   #29 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'epoll_event_loop_once+0x2=
2c [0xfffffd7fecd4180c]
>   #30 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_once+0x40 =
[0xfffffd7fecd3f8f0]
>   #31 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'_tevent_loop_once+0x95 =
[0xfffffd7fecd39bd5]
>   #32 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_loop_wait+0=
x23 [0xfffffd7fecd39e43]
>   #33 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_wait+0x40 =
[0xfffffd7fecd3f870]
>   #34 /usr/lib/samba/sbin/amd64/smbd'main+0x1a0f [0x40f9ff]
>   #35 /usr/lib/samba/sbin/amd64/smbd'_start_crt+0x83 [0x408e73]
>   #36 /usr/lib/samba/sbin/amd64/smbd'_start+0x18 [0x408dd8]
> [2020/04/10 08:00:38.111622,  0] =
../../source3/lib/dumpcore.c:315(dump_core)
>  dumping core in /var/samba/log/cores/smbd
> [2020/04/10 08:00:38.514100,  0] =
../../lib/util/become_daemon.c:136(daemon_ready)
>  daemon_ready: daemon 'smbd' finished starting up and ready to serve =
connections
>=20


