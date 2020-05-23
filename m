Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5BB1DF6E0
	for <lists+samba-technical@lfdr.de>; Sat, 23 May 2020 13:33:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Date:Subject;
	bh=ntXeXe5aio2aHekAgZQZgSlTyiY38h5NJdfc23fU8WI=; b=wQFhigV0EcJW5BsCEtpjXLeNcS
	2ZuqhrINI1GqfEuNrrRZvXlSulFEap9tQ8kXvAnyIPqOL9DUfAt6wYcMlN/l9Uf4rB70r25KD1rF2
	DpjhP6/jFTxskUqx9zqb/TbdLtO3ypjpm1TTWHYnXSgL5vP9dgKCrt6kl32BO5/32ml0IBNcnFxi6
	9CnmZH3hh1tdHABy9C2peK1y4nfqe2B+LeEcKU+oEM1AylBPYfH3tuR8k9x6bOBoHkBeDK8da371x
	DHeZVxFkdCMkFjcOE0GipgsP8D3VcB3hvMH6tfF3XNeg9/RtFOP4HyRoXxOtZZomsBv9Lqi8zBLQG
	EgPBlgUA==;
Received: from localhost ([::1]:61448 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jcSOq-005Znk-UK; Sat, 23 May 2020 11:33:09 +0000
Received: from mout.gmx.net ([212.227.15.19]:53831) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jcSOl-005Znd-55
 for samba-technical@lists.samba.org; Sat, 23 May 2020 11:33:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1590233575;
 bh=GyTQ+GMjUNzRk+TDU4uuHBsPBfCsMn9Taif802aRq1I=;
 h=X-UI-Sender-Class:From:Subject:Date:Cc:To;
 b=TzpmV14iDcswyZSHQAYej5zI5FuVKi5Z9sB40IG/s2JtbOh2WN85FpTXyFxy+yzc9
 RPucAWeaj816dvDwchc/m85yo/uE4+X3q8kw/qRToXC2flGs+bTyO7SC9zO8/2TsTY
 mEjHZ3grh/0u8DHMv9aQ3P0+5rT44ekdyOIClfT0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.47.100] ([217.254.199.176]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTRR0-1jSejq3XCO-00TiW2; Sat, 23
 May 2020 13:32:54 +0200
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: BUG 14352: follow up on that bug. Still issues.
Message-Id: <0A3C18BE-42EE-4394-B2B4-CD183F0431A3@gmx.net>
Date: Sat, 23 May 2020 13:32:54 +0200
To: samba-technical <samba-technical@lists.samba.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Provags-ID: V03:K1:x+EwlndML01w6SlcvcTzs50rIs0ZqdC0FXr0BwLNS9YSnpUD6jf
 o+5h/MBX9RXUkBmLFYlhxapHefT4A+ADpTplI20/Cea9wXjMLgyiaXalZswdb86uJgo5drn
 qbNyhhoCx7dxPwizLmhe7anjdPcbP+i5h4epSDH0k1K2PlJcb2HQoo/UQsMBHqQtmCbWj1V
 /gzHs/dDuruisQ6RRujDQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lUeQ91GZtz0=:l0noOBVQ9A1dp2n2/y3aE1
 13pYxBzEiQEKCxmxSnXHnLZuqJtoN2jMlEtBwr6NqTm20G9T5rIZnl/guVIH1HT2r1s6H8mrq
 rKev3H/tk1Z0QCCzz0Yiy0lH+qZGyEjt4V3GvHZFWtcoJ2VrZg1MmTAgkwFVYnekdP2Df+0u4
 iZURUQt8IG/KU8H9Q2TQqztlirkIZsT81x19rS4mA0LbrVHK0MdiQsv/eX+y9mw5uBPfZ1uD0
 iF8U5TkzZt/PRBEZ//fe3/uh/EhjDnDyI8Zvf79B+F+5jCM0gELg5LHSgcaApxxGMTiRSHZDg
 5HtCmUhH9hOtyfEYYuiU+t5Hvve9LILUeEnod+wkRi3BsMQD+dEILbJB7KkLLUTRF0BvSjnfn
 G52PoF9cnF7Lh5SD0zQF+qfGvVFYs5HxLtdIbEISLVq8IH2mcdHqp4WEp9m/X5DHj6XgD/+WK
 g8erZW6+6YiyRJTn1ZJdckUhk0nBBfrGTWZhU7P5wOBP7OWvamxwXSUHJc/RMw7Vczv5GZNId
 FgFlQrdYmSRxRSXZKH/os+gDoHBsliEpXeAes95Pb1F5Lv/QLb/HC+mYJPSuUMKhZIYQoMXXB
 PVFLuI6HZItEfUwpcmmjO1SIotwMejG25m7gkkbfDCiFq0+2jzKHZcdWJrInfrhXt4QHSF8Hf
 e2Ew+VvL0Pi8zt4WLCEwE3MLhld+t+RYnVrtN3VjImDQMmOXRk1LWZU+uVSLuXgkl9rVfy+1c
 qUzbipZPnDW76OUBmxU0Zi8xKH39FsSsbL9BHYq932+1nIV/7I/3UDEjFe3Q0lrHlzm5KvtPo
 ImgMw2aOkP3lIMnwov9G8HYzkFMOO3MokrhqrPh9U1AgTSqVAxkeXA/jMGJMEuV5KVbOKQOKX
 Ba5x7f7d/yUGpia45+DDAAIXMlqxvAPgAx9I0LJF9kdYUzg72ub69n0pjWJe45yG/jjNNuyk7
 kzYipO2Vx5Tok4c5iKgtCRX0UJLF90p0ZEfwDWUsCnvPFd2u4G1EJy08HlPdlzmvX7Rd3AWwl
 MA/DszzrxxF2gHl2AC2n2OEEXOcQn0fq85tjN+vLeECNlFO3toBLCGYsYCRizE3T+VNtEfP3E
 F4tN8I9t4b/J9nzmQEDMvmEfm5cWopVvpXAwvBSYHFmdXL7mj1i/tTaYMWrhb9i6RYUyL8NB8
 HzzaoM+O0Ot56cAey/sarGzCrJyGCZSgJPhmltPKyY5TzwH2+wAcOnbX6uUQELggzvOt7qvxR
 bpimbNbHnqatPT6e5
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
Cc: Anoop C S <anoopcs@cryptolab.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi everyone,

there is still an issue with vfs_fruit and time machine backups.
Bug 14352 solved an issue with dbwrap but now I get another error =
message about a kernel panic.

The steps to reproduce are the same as explained in bug 14352:
0. Delete time machine backup in MacOS X app.
1. Stop smb server.
2. clean logs.
3. start smb server.
4. connect with the Time Machine app in MacOS 10.15.4.
4.1. choose share (FileVault) from list in Time Machine app.
4.2. type credentials.
4.3. receive segfault.
5. stop smb server.

The respective backtrace is:
[2020/05/23 13:25:31.099770, 10, pid=3D1782, effective(500, 500), =
real(0, 0), class=3Dlocking] =
../../source3/locking/share_mode_lock.c:658(get_share_mode_lock)
  get_share_mode_lock: get_static_share_mode_data failed: =
NT_STATUS_NOT_FOUND
[2020/05/23 13:25:31.099945,  0, pid=3D1782, effective(500, 500), =
real(0, 0)] ../../source3/lib/popt_common.c:68(popt_s3_talloc_log_fn)
  Bad talloc magic value - unknown value
[2020/05/23 13:25:31.100352,  0, pid=3D1782, effective(500, 500), =
real(0, 0)] ../../source3/lib/util.c:830(smb_panic_s3)
  PANIC (pid 1782): Bad talloc magic value - unknown value
[2020/05/23 13:25:31.102042,  0, pid=3D1782, effective(500, 500), =
real(0, 0)] ../../lib/util/fault.c:265(log_stack_trace)
  BACKTRACE: 37 stack frames:
   #0 /usr/lib/samba/amd64/libsamba-util.so.0.0.1'log_stack_trace+0x26 =
[0xfffffc7fee6b6626]
   #1 /usr/lib/samba/amd64/libsmbconf.so.0'smb_panic_s3+0x26 =
[0xfffffc7fee0f6a16]
   #2 /usr/lib/samba/amd64/libsamba-util.so.0.0.1'smb_panic+0x1f =
[0xfffffc7fee6b66ff]
   #3 /usr/lib/samba/private/amd64/libtalloc.so.2.3.1'_talloc_free+0x3b2 =
[0xfffffc7fed884482]
   #4 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'get_share_mode_lock+0x=
1a1 [0xfffffc7fee7f9bb1]
   #5 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'smbd_contend_level2_op=
locks_begin+0xa1 [0xfffffc7fee9009b1]
   #6 /usr/lib/samba/private/amd64/libsmbd-base-samba4.so'brl_lock+0x635 =
[0xfffffc7fee7f1495]
   #7 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'do_lock_fn+0xa4 =
[0xfffffc7fee7eda84]
   #8 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'share_mode_do_locked_f=
n+0x86 [0xfffffc7fee7f7a06]
   #9 =
/usr/lib/samba/amd64/libsmbconf.so.0'dbwrap_watched_do_locked_fn+0xfa =
[0xfffffc7fee0dc43a]
   #10 =
/usr/lib/samba/private/amd64/libdbwrap-samba4.so'db_tdb_do_locked+0x12f =
[0xfffffc7fed0f95cf]
   #11 =
/usr/lib/samba/private/amd64/libdbwrap-samba4.so'dbwrap_do_locked+0x48 =
[0xfffffc7fed0f69a8]
   #12 =
/usr/lib/samba/amd64/libsmbconf.so.0'dbwrap_watched_do_locked+0x6f =
[0xfffffc7fee0daeef]
   #13 =
/usr/lib/samba/private/amd64/libdbwrap-samba4.so'dbwrap_do_locked+0x48 =
[0xfffffc7fed0f69a8]
   #14 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'share_mode_do_locked+0=
xd2 [0xfffffc7fee7fa0e2]
   #15 /usr/lib/samba/private/amd64/libsmbd-base-samba4.so'do_lock+0xf0 =
[0xfffffc7fee7ee530]
   #16 /usr/lib/samba/amd64/vfs/fruit.so'fruit_create_file+0x7ba =
[0xfffffc7fe88d55aa]
   #17 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'smbd_smb2_request_proc=
ess_create+0xa07 [0xfffffc7fee8dc437]
   #18 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'smbd_smb2_request_disp=
atch+0xc8f [0xfffffc7fee8d2a5f]
   #19 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'smbd_smb2_connection_h=
andler+0x621 [0xfffffc7fee8d39e1]
   #20 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_invoke_fd_h=
andler+0x80 [0xfffffc7fed17a580]
   #21 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'epoll_event_loop_once+0x2=
2c [0xfffffc7fed18180c]
   #22 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_once+0x40 =
[0xfffffc7fed17f8f0]
   #23 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'_tevent_loop_once+0x95 =
[0xfffffc7fed179bd5]
   #24 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_loop_wait+0=
x23 [0xfffffc7fed179e43]
   #25 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_wait+0x40 =
[0xfffffc7fed17f870]
   #26 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'smbd_process+0x777 =
[0xfffffc7fee8c18f7]
   #27 /usr/lib/samba/sbin/amd64/smbd'smbd_accept_connection+0x189 =
[0x40dda9]
   #28 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_invoke_fd_h=
andler+0x80 [0xfffffc7fed17a580]
   #29 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'epoll_event_loop_once+0x2=
2c [0xfffffc7fed18180c]
   #30 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_once+0x40 =
[0xfffffc7fed17f8f0]
   #31 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'_tevent_loop_once+0x95 =
[0xfffffc7fed179bd5]
   #32 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_loop_wait+0=
x23 [0xfffffc7fed179e43]
   #33 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_wait+0x40 =
[0xfffffc7fed17f870]
   #34 /usr/lib/samba/sbin/amd64/smbd'main+0x1a0f [0x4101ef]
   #35 /usr/lib/samba/sbin/amd64/smbd'_start_crt+0x83 [0x408e73]
   #36 /usr/lib/samba/sbin/amd64/smbd'_start+0x18 [0x408dd8]
[2020/05/23 13:25:31.104063,  4, pid=3D1782, effective(500, 500), =
real(0, 0)] ../../source3/smbd/sec_ctx.c:216(push_sec_ctx)
  push_sec_ctx(500, 500) : sec_ctx_stack_ndx =3D 1

There are logs with log level 10 available as a tar.
Shall I open a bug in bugzilla and file them there or upload them to =
onedrive or so?

Thanks in advance

Best regards

Rouven


