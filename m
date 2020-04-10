Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B0E1A427D
	for <lists+samba-technical@lfdr.de>; Fri, 10 Apr 2020 08:21:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Date:Subject:cc;
	bh=xGp5iQu8IW5W/JMBG1JGOAEaROK+eZjqN574gJxUxao=; b=vOoO/IQlrLwrOF9LK/ZHHZWHi8
	/xDb6dLzMj5X84UZJK41q5OIh6EuMV+XWQHHxfNEQtdveG20wVo2d9qUyr4pL2b+D0s7kk/iQ2zc9
	PQ00Y07/p+OMbSTOC0c3wLaetCSpFPfOnFvgUG7PYe2oxZp1+LNmaR4xYJIVzyRNhaL5KBUqduST9
	vMgKitClXrA+uKyXWtr0ABlrEBhSuHsb1NBbTwo+l2iYE/UyE3RgGGAuSUY1p+aFYRGNq0FXGF9t6
	bhwsFE53Omt2cd0ncv0EQuIvVHlXHKt7yxjVkKySaGRSmnNBnZ78+r7FjZ72L9iyNKX41bG19yf7X
	TfbSsUnA==;
Received: from localhost ([::1]:19962 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jMn1h-000LnV-Tt; Fri, 10 Apr 2020 06:20:29 +0000
Received: from mout.gmx.net ([212.227.17.21]:60763) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jMn1c-000LnO-K7
 for samba-technical@lists.samba.org; Fri, 10 Apr 2020 06:20:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1586499621;
 bh=A1fBkUm/10dBEPLFApGY21ZoJ46IFKjojC52M7bXwsA=;
 h=X-UI-Sender-Class:From:Subject:Date:To;
 b=WvrGE2koQNIb1QlwVFMogo3KaLYgwcIvVu6OBfOuyp4B9K1wY/2+g7w4M38KfMtsu
 0HilMTGmYRfjmM+9yBKNEXmiFhK1NFXyCT73YDMQSrvwhKJc0Z8rzoEdyzlsgAfGeb
 RBlN31InezF8hgniCe4Y9IUn/wDi9rVj/ZvXRo1Y=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.47.100] ([217.250.86.248]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MGQnF-1jUnZj451B-00GoJO for
 <samba-technical@lists.samba.org>; Fri, 10 Apr 2020 08:07:19 +0200
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: PANIC: assert failed at ../../lib/dbwrap/dbwrap.c(82):
 rec->value_valid when connecting to samba
Message-Id: <03B0942F-6362-4FCD-9DC0-F267968A64FC@gmx.net>
Date: Fri, 10 Apr 2020 08:07:18 +0200
To: samba-technical <samba-technical@lists.samba.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Provags-ID: V03:K1:Safgvc4qMmcaFqagNBqplioU17nhaOpHbQ5TsbvgpmOhrlYwo8+
 aH6jwKMvMIs1mCENuVaEoY8bQXgYySGoWrtyebhKW0s5tziXU777LKjS8AMdLVvzOqXuO/8
 lMkRqERGyYtEGTpnKZr9yboet213p/GVx1+wVvJw6wjOhzSgcT+wcetuUi1yxy7UsVctHCP
 0ft4NjTANg6UaMoI2N1Kg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mDcndfOhrMY=:gjlDlQGHmbHmMTaNxG9yls
 xjcL2itreXWBGAmvntbqx3oW6gwXsmfd8uQK8dzvoxCFttqsJ6HzjBYWynoejdyncM6YmuQ/K
 uD2h65Ha0XCqhY0M9GqZqcWhr0Khmjmf9NXz4EElH+rgs4B21mQ3GabGxZ+RenGPQWByCjwL1
 FA00b9aON3xsT7m2r/EaEHvgxVAhSAtU5jOuyn0ETJrQqkxoCscdIx4gFeuwEuFg9u8Yfoj2i
 DE813/ITcfg+V5nrifPp5DFQV1SigEKjzEq6B5v7hApE68adil/CBBp/UlFanASq9U8BNqXFI
 eNXO2jZjXS8SU9EtWXoqlu5z1219bO17qS65eu/StdAzYBMaaCJdcA6TsQohlcL+doeHRQKRx
 iid9IdOS+fzNzWmWhJX6z/MVqeOu+Xu+M4yMoSsAlFYZNkkEvGypcwVz9r5uDdOksWA+cZwbT
 pSoYdaNXMH8Zxs+oCZvTCB/zc8cNqbCa12FXh24/CKpn8FxWVQpTpyIZ0GyLVRP0u3nSUvHde
 VkalPkq7aFUVOLgLBUiPsCJWGIn0mMGQI31W8DVWwhuDTJBlVn5jiLFYm9CGjKMfsJAq8DUVa
 4ic4rF2uDwomDKKXANkQmfl+tWMs87r/iprXzmbffY9UzxFJb/YZ87GDTMm3yqd29YvzSgNLm
 /ynA7az/q7IH0b/asMugS3ngF6rO4OnRz6mRRFjY3E9+JoWmlI230sN7pZ2R40NcH6Yc9c+H5
 YOSNfkfRWcoAhCeGEz7bd0BK3S+OtBg6DoxYf8kg7YjKTMAiIAITKmF1CCljIW/fw3P+40yw8
 tz6IoIpnyrAr1jCFEj0S9RU8qNjh4S0+6Fly8F6C+w7aBWahNFf78l1swHxhk0LeI+pbTn47m
 0U4IS00ccwfhrbLWUVeaZeYc0MvbL+gZ/Abs3cv4C6JMEjblK9d15takLvKtQrqk8eHplOKEp
 xjVmeiUX0S7Le8x+BPhcL7/ZWzWanEJmn2L+x9LVCo4EW4k78/ik/REmjumTGGG4hu1LFQdPN
 7SLBLeC+oxsx7bioguHZhy5RhfLrXH4XmvaLqwXNIwkcDl1TEOACddhsMka2fZpLZr/UJ45KT
 at2Dd155wr7DzIZdl7sPQGyONKKuJDqFqBd9OOgzq6Ip63kQ3rPk5Ybj2ldClTPdAv3w3FjFn
 4dnzJI57p5eUj90I/P8WXSDf8iQU6OIKF9RMnoINoj2SP0Qg25MyZtYqa+5qsr4jXROIuBEpI
 /R/BBN982ROA0DapC
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

With samba-4.12.1 on OpenIndiana/Illumos (latest pkg set) I get the =
following log error when trying to connect with MacOS 10.15.4. Is there =
anything I can provide/do to help to fix that issue?

[2020/04/10 08:00:38.107917,  0] =
../../lib/dbwrap/dbwrap.c:82(dbwrap_record_get_value)
  PANIC: assert failed at ../../lib/dbwrap/dbwrap.c(82): =
rec->value_valid
[2020/04/10 08:00:38.108499,  0] =
../../source3/lib/util.c:830(smb_panic_s3)
  PANIC (pid 3427): assert failed: rec->value_valid
[2020/04/10 08:00:38.109541,  0] =
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
x2a [0xfffffd7feccb627a]
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
[0xfffffd7feccb95cf]
   #11 =
/usr/lib/samba/private/amd64/libdbwrap-samba4.so'dbwrap_do_locked+0x48 =
[0xfffffd7feccb69a8]
   #12 =
/usr/lib/samba/amd64/libsmbconf.so.0'dbwrap_watched_do_locked+0x6f =
[0xfffffd7fedf60d7f]
   #13 =
/usr/lib/samba/private/amd64/libdbwrap-samba4.so'dbwrap_do_locked+0x48 =
[0xfffffd7feccb69a8]
   #14 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'share_mode_do_locked+0=
xd2 [0xfffffd7fee719b82]
   #15 /usr/lib/samba/private/amd64/libsmbd-base-samba4.so'do_lock+0xf0 =
[0xfffffd7fee70dfe0]
   #16 /usr/lib/samba/amd64/vfs/fruit.so'fruit_create_file+0x7ba =
[0xfffffd7fe88855aa]
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
andler+0x80 [0xfffffd7fecd3a580]
   #21 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'epoll_event_loop_once+0x2=
2c [0xfffffd7fecd4180c]
   #22 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_once+0x40 =
[0xfffffd7fecd3f8f0]
   #23 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'_tevent_loop_once+0x95 =
[0xfffffd7fecd39bd5]
   #24 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_loop_wait+0=
x23 [0xfffffd7fecd39e43]
   #25 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_wait+0x40 =
[0xfffffd7fecd3f870]
   #26 =
/usr/lib/samba/private/amd64/libsmbd-base-samba4.so'smbd_process+0x777 =
[0xfffffd7fee7b8677]
   #27 /usr/lib/samba/sbin/amd64/smbd'smbd_accept_connection+0x189 =
[0x40d5b9]
   #28 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_invoke_fd_h=
andler+0x80 [0xfffffd7fecd3a580]
   #29 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'epoll_event_loop_once+0x2=
2c [0xfffffd7fecd4180c]
   #30 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_once+0x40 =
[0xfffffd7fecd3f8f0]
   #31 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'_tevent_loop_once+0x95 =
[0xfffffd7fecd39bd5]
   #32 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'tevent_common_loop_wait+0=
x23 [0xfffffd7fecd39e43]
   #33 =
/usr/lib/samba/private/amd64/libtevent.so.0.10.2'std_event_loop_wait+0x40 =
[0xfffffd7fecd3f870]
   #34 /usr/lib/samba/sbin/amd64/smbd'main+0x1a0f [0x40f9ff]
   #35 /usr/lib/samba/sbin/amd64/smbd'_start_crt+0x83 [0x408e73]
   #36 /usr/lib/samba/sbin/amd64/smbd'_start+0x18 [0x408dd8]
[2020/04/10 08:00:38.111622,  0] =
../../source3/lib/dumpcore.c:315(dump_core)
  dumping core in /var/samba/log/cores/smbd
[2020/04/10 08:00:38.514100,  0] =
../../lib/util/become_daemon.c:136(daemon_ready)
  daemon_ready: daemon 'smbd' finished starting up and ready to serve =
connections


