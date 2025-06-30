Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB65AEE6CE
	for <lists+samba-technical@lfdr.de>; Mon, 30 Jun 2025 20:34:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=z88DYaDwyp51uRzsszK/RhxYnM3kgMg3L/J44pR6IVc=; b=Z/rszc7zyoCtrk45xfc5q/Clr7
	LiceyQ9Ri0ryhcVPTcDgRBOhJH9y8HYJ6v4UiFvpqpEU/w8+sENgZEgqPyRYzZ6D7o0oKSidL0Xq9
	HunoB3MqgbdfitjxARJJ9uJRtHT11dRYnmiJwaJO9F0yB5KZhevXlNVQG+qrMk+SswjN2giG5gn7t
	HVgZn17bN5IlYQ6lCrtfdLqzNm7J011ujZ8zWRtrz768Dvi52ysugXVqK/hIUrNjaEpLGOjfKYyaS
	2YT/g/5wJVvY9ay4evn/zbPH+Sn5GBSrUlGFk4iTyU6Zr41CxQWhQNgqiYcDuUnUXTGjij3++NUlY
	+pWDE7vA==;
Received: from ip6-localhost ([::1]:20594 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uWJKL-008HmO-N9; Mon, 30 Jun 2025 18:34:01 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:54472) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uWJKG-008HmG-EQ
 for samba-technical@lists.samba.org; Mon, 30 Jun 2025 18:33:59 +0000
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-7d20f79a00dso328135085a.0
 for <samba-technical@lists.samba.org>; Mon, 30 Jun 2025 11:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751308434; x=1751913234; darn=lists.samba.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z88DYaDwyp51uRzsszK/RhxYnM3kgMg3L/J44pR6IVc=;
 b=PzThwPjONfQyjD2/e+07iMV2/2Y8GYtI8KMFHXnOfyUsXuq6KbSM4Xxtb6msg5ibSI
 9d2yl8GS4O3sJAgOGcmn3AkfcjCVMIszePMs734ibbJSIU/oUMr3BodGLpyWPbcnlKwU
 z72fZl3BPrM9oRtc4n/EDnLi0w/iyjexAheYqtANE909uGGVxx0iF4lwxPvwIovvqQpU
 f43ihUh50OoAdAvxGE/UASIDmWfyPG1yWgZzk9/5J3m6QWuaa+ZPg0pZ+dSZbsj8xYFM
 3/ScTadhyBF9yJhGf7OslM3D/r6rIqCi5ddYQF3Uhwcdfgp2rjBqDvLCOeqMgfzKkpZ+
 g+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751308434; x=1751913234;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z88DYaDwyp51uRzsszK/RhxYnM3kgMg3L/J44pR6IVc=;
 b=av38moBV0YiUzRCHoBkEowW5deX3/4ZZjxfTyMMb8WRMJkaVbNGHtnQkH99C1eL5pt
 wXc7MEUtEfUkR87hsUM4AgNqiMSCbvjZeVYtpjds3S8YsV/q0dlzfQNjQWVX/2rhTR9f
 Ks7d7z7POpQGTT6sQRragiQQhwZUQU6Y2EdKIlKPzqmGb7iOIpRP8e1g8gfM3nSLd2pr
 2zjjgyaM/ay9mw7hh+zOzNHmSpLMFNSNQnDdCNarROh5oD1g0ggZrpAmsfEdpThi9QjS
 2Z4lk0yJOdNfPlWp+QhO5jtU0X4SHhc0VBqoYlvsBkNCQ08OfXmLCGzMwTQuSwJk+zLS
 WDCQ==
X-Gm-Message-State: AOJu0YyBdFEucE0admv1oQT5XhTQpCXTrfLePgMPX5rrIp5D/nXZ3iUv
 3qLWGXxg7TPzqbELhuXdJtlFPqfLwGUurgl/IzwzkGBOHs6Tat7xOuIxRdvEf3RrUW0dPSRZI9O
 GrZF+kO/8itqAmf5rGlteHV62qfzapqytEOwO
X-Gm-Gg: ASbGnctnX1fmbt92kw2sSjyRJOz9W6SUx5CfdhFLKjTNK5Vmdaq+oEKFHulfc1SMoyZ
 xhhpuIIpw28zBwpMTtN5NniiTme6Lc5t+QCmqBkMoVdkHygY8W2YjSi3hWI93aafO0U6bxfc8sw
 TGR78BPxSlT65ki9/A57qLejytOZlwg9XYWJd9O4NONfQ7aI8szWC8msoqrWBw4lRX5zUNczRj1
 VWLow==
X-Google-Smtp-Source: AGHT+IFF+nRNczezF720fK2K7tgSGZaNYmJwcYjLjve3gAEouTGzkXV+G/0EvtJ8WVf6hdfudMJYjJ4vO7rUlocSpgw=
X-Received: by 2002:a05:620a:198b:b0:7d3:9113:7902 with SMTP id
 af79cd13be357-7d44397f5e8mr1848786885a.38.1751308433888; Mon, 30 Jun 2025
 11:33:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mt70hsY_i6xBNX27p5EEHnJEnfUi2Sk2mZmhvchxepcxg@mail.gmail.com>
In-Reply-To: <CAH2r5mt70hsY_i6xBNX27p5EEHnJEnfUi2Sk2mZmhvchxepcxg@mail.gmail.com>
Date: Mon, 30 Jun 2025 13:33:42 -0500
X-Gm-Features: Ac12FXxCQdi4sbVaXN8P2yEMQUF_sSP3qEBmWJo0XFR4DSI-MDS1-ZSLOYaLXQo
Message-ID: <CAH2r5msEfRf4QPwWwRph4La2Q2ORP71Wsb0eSgPenW3+wsc95Q@mail.gmail.com>
Subject: Re: Samba current master branch server crash
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

And most recent commit was:
commit 5b9492ada40352213448a5050a187948c9d72ebc (HEAD -> master,
origin/master, origin/HEAD)
Author: Daniel Widrick <dnaiel@widrick.net>
Date:   Mon Jun 23 22:07:44 2025 -0400

    s3:winbind: Correct spelling in debug messages related to ADS

On Mon, Jun 30, 2025 at 1:32=E2=80=AFPM Steve French <smfrench@gmail.com> w=
rote:
>
> Running generic/013 with the SMB3.1.1 POSIX Extensions enabled to
> current Samba server, I see Samba server crash with (and it is
> reproducible every time I have tried it):
>
>
> [2025/06/30 16:42:00.127238,  0]
> ../../source3/smbd/smb2_ioctl_filesys.c:221(fsctl_dup_extents_send)
>   fsctl_dup_extents_send: skipping zero length dup extents
> [2025/06/30 16:42:00.492253,  0] ../../lib/util/fault.c:178(smb_panic_log=
)
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [2025/06/30 16:42:00.505777,  0] ../../lib/util/fault.c:186(smb_panic_log=
)
>   If you are running a recent Samba version, and if you think this
> problem is not yet fixed in the latest versions, please consider
> reporting this bug, see https://wiki.samba.org/index.php/Bug_Reporting
> [2025/06/30 16:42:00.513839,  0] ../../lib/util/fault.c:192(smb_panic_log=
)
>   PANIC (pid 1066): Signal 7: Bus error in 4.23.0pre1-GIT-5b9492ada40
>    #0 /usr/local/samba/lib/private/libgenrand-private-samba.so(log_stack_=
trace+0x32)
> [0x77a32f504c16]
>    #2 /usr/local/samba/lib/private/libgenrand-private-samba.so(smb_panic+=
0x1c)
> [0x77a32f504bb2]
>    #4 /usr/local/samba/lib/private/libgenrand-private-samba.so(+0x264f)
> [0x77a32f50464f]
>    #6 /lib/x86_64-linux-gnu/libc.so.6(+0x9f98c) [0x77a32f29f98c]
>    #8 /usr/local/samba/lib/private/libtdb-private-samba.so(+0x14581)
> [0x77a32f1c6581]
>    #10 /usr/local/samba/lib/private/libtdb-private-samba.so(+0x84ff)
> [0x77a32f1ba4ff]
>    #11 /usr/local/samba/lib/private/libtdb-private-samba.so(+0x8af0)
> [0x77a32f1baaf0]
>    #13 /usr/local/samba/lib/private/libtdb-private-samba.so(+0x8def)
> [0x77a32f1badef]
>    #15 /usr/local/samba/lib/private/libdbwrap-private-samba.so(+0x9280)
> [0x77a32f41f280]
>    #16 /usr/local/samba/lib/private/libdbwrap-private-samba.so(dbwrap_do_=
locked+0x8c)
> [0x77a32f41b391]
>    #18 /usr/local/samba/lib/private/libdbwrap-private-samba.so(dbwrap_do_=
locked+0x8c)
> [0x77a32f41b391]
>    #20 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(_share_=
mode_entry_prepare_lock+0x213)
> [0x77a32f9bae28]
>    #22 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(+0xa6bc=
8)
> [0x77a32f8a6bc8]
>    #24 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(+0xfd43=
6)
> [0x77a32f8fd436]
>   #26 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(smbd_smb=
2_request_process_close+0x259)
> [0x77a32f8fcb84]
>    #28 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(smbd_sm=
b2_request_dispatch_immediate+0xfc)
> [0x77a32f8e758f]
>    #30 /usr/local/samba/lib/private/libtevent-private-samba.so(tevent_com=
mon_loop_immediate+0x3b)
> [0x77a32f67915b]
>    #32 /usr/local/samba/lib/private/libtevent-private-samba.so(+0x11ed9)
> [0x77a32f680ed9]
>    #34 /usr/local/samba/lib/private/libtevent-private-samba.so(tevent_com=
mon_loop_wait+0x29)
> [0x77a32f677023]
>    #36 /usr/local/samba/lib/private/libtevent-private-samba.so(_tevent_lo=
op_wait+0x2f)
> [0x77a32f6770ca]
>    #38 smbd: client [192.168.122.12](+0xa145) [0x5897f941a145]
>
>        #40 /usr/local/samba/lib/private/libtevent-private-samba.so(+0x164=
8e)
> [0x77a32f68548e]
>    #42 /usr/local/samba/lib/private/libtevent-private-samba.so(+0x11ed9)
> [0x77a32f680ed9]
>    #44 /usr/local/samba/lib/private/libtevent-private-samba.so(tevent_com=
mon_loop_wait+0x29)
> [0x77a32f677023]
>    #45 /usr/local/samba/lib/private/libtevent-private-samba.so(+0x11f82)
> [0x77a32f680f82]
>      #46 /usr/local/samba/lib/private/libtevent-private-samba.so(_tevent_=
loop_wait+0x2f)
> [0x77a32f6770ca]
>    #48 smbd: client [192.168.122.12](main+0x1ba6) [0x5897f941e1ed]
>
>        #50 /lib/x86_64-linux-gnu/libc.so.6(__libc_start_main+0x8b)
> [0x77a32f22a28b]
>             [2025/06/30 16:42:00.712449,  0]
> ../../source3/lib/dumpcore.c:318(dump_core)
>                                             coredump is handled by
> helper binary specified at /proc/sys/kernel/core_pattern
> [2025/06/30 16:42:01.967738,  0]
> ../../source3/locking/share_mode_lock.c:523(locking_tdb_data_store)
>   locking_tdb_data_store: share_mode_g_lock_writev(NULL) failed:
> NT_STATUS_NOT_LOCKED
> [2025/06/30 16:42:01.967868,  0]
> ../../source3/locking/share_mode_lock.c:660(share_mode_data_ltdb_store)
>   share_mode_data_ltdb_store: locking_tdb_data_store failed:
> NT_STATUS_NOT_LOCKED
> [2025/06/30 16:42:01.967886,  0]
> ../../source3/locking/share_mode_lock.c:2356(share_mode_forall_entries)
>   share_mode_forall_entries: share_mode_data_ltdb_store failed:
> NT_STATUS_NOT_LOCKED
> [2025/06/30 16:42:01.967900,  0]
> ../../source3/locking/share_mode_lock.c:1908(share_entry_rw_traverse_fn)
>   share_entry_rw_traverse_fn: share_mode_forall_entries failed
> [2025/06/30 16:42:02.683465,  0]
> ../../source3/smbd/smb2_ioctl_network_fs.c:229(fsctl_srv_copychunk_vfs_do=
ne)
>   fsctl_srv_copychunk_vfs_done: copy chunk failed
> [NT_STATUS_DISK_FULL] chunk [0] of [1]
> [2025/06/30 16:42:02.706145,  0] ../../lib/util/fault.c:178(smb_panic_log=
)
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [2025/06/30 16:42:02.712428,  0] ../../lib/util/fault.c:179(smb_panic_log=
)
>   INTERNAL ERROR: Signal 7: Bus error in smbd (smbd[192.168.12)
> (client [192.168.122.12]) pid 1133 (4.23.0pre1-GIT-5b9492ada40)
> [2025/06/30 16:42:02.728066,  0] ../../lib/util/fault.c:191(smb_panic_log=
)
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [2025/06/30 16:42:02.728107,  0] ../../lib/util/fault.c:192(smb_panic_log=
)
>   PANIC (pid 1133): Signal 7: Bus error in 4.23.0pre1-GIT-5b9492ada40
> [2025/06/30 16:42:02.737474,  0] ../../lib/util/fault.c:303(log_stack_tra=
ce)
>   BACKTRACE: 44 stack frames:
>    #1 /usr/local/samba/lib/private/libgenrand-private-samba.so(smb_panic_=
log+0x213)
> [0x77a32f504b93]
>    #2 /usr/local/samba/lib/private/libgenrand-private-samba.so(smb_panic+=
0x1c)
> [0x77a32f504bb2]
>    #3 /usr/local/samba/lib/private/libgenrand-private-samba.so(+0x2636)
> [0x77a32f504636]
>    #4 /usr/local/samba/lib/private/libgenrand-private-samba.so(+0x264f)
> [0x77a32f50464f]
>    #5 /lib/x86_64-linux-gnu/libc.so.6(+0x45330) [0x77a32f245330]
>    #6 /lib/x86_64-linux-gnu/libc.so.6(+0xa160b) [0x77a32f2a160b]
>    #7 /usr/local/samba/lib/private/libtdb-private-samba.so(+0x14835)
> [0x77a32f1c6835]
>    #8 /usr/local/samba/lib/private/libtdb-private-samba.so(+0x83e7)
> [0x77a32f1ba3e7]
>    #9 /usr/local/samba/lib/private/libtdb-private-samba.so(+0x860a)
> [0x77a32f1ba60a]
>    #10 /usr/local/samba/lib/private/libtdb-private-samba.so(+0x8fa1)
> [0x77a32f1bafa1]
>    #11 /usr/local/samba/lib/private/libtdb-private-samba.so(tdb_unlock+0x=
54)
> [0x77a32f1bb06c]
>    #12 /usr/local/samba/lib/private/libtdb-private-samba.so(tdb_chainunlo=
ck+0x5f)
> [0x77a32f1bb9eb]
>    #13 /usr/local/samba/lib/private/libdbwrap-private-samba.so(+0x950f)
> [0x77a32f41f50f]
>    #14 /usr/local/samba/lib/private/libdbwrap-private-samba.so(dbwrap_do_=
locked+0x8c)
> [0x77a32f41b391]
>    #15 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(smbXsrv=
_open_update+0x8d)
> [0x77a32f929a7f]
>    #16 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(+0xe484=
c)
> [0x77a32f8e484c]
>    #18 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(+0xeb14=
e)
> [0x77a32f8eb14e]
>    #19 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(+0xeb53=
a)
> [0x77a32f8eb53a]
>    #21 /usr/local/samba/lib/private/libtevent-private-samba.so(tevent_com=
mon_invoke_fd_handler+0x125)
> [0x77a32f67847c]
>    #22 /usr/local/samba/lib/private/libtevent-private-samba.so(+0x1648e)
> [0x77a32f68548e]
>    #24 /usr/local/samba/lib/private/libtevent-private-samba.so(+0x11ed9)
> [0x77a32f680ed9]
>    #25 /usr/local/samba/lib/private/libtevent-private-samba.so(_tevent_lo=
op_once+0x126)
> [0x77a32f676c9b]
>    #26 /usr/local/samba/lib/private/libtevent-private-samba.so(tevent_com=
mon_loop_wait+0x29)
> [0x77a32f677023]
>    #28 /usr/local/samba/lib/private/libtevent-private-samba.so(_tevent_lo=
op_wait+0x2f)
> [0x77a32f6770ca]
>    #29 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(smbd_pr=
ocess+0xfaa)
> [0x77a32f8cb716]
>    #30 smbd: client [192.168.122.12](+0xa145) [0x5897f941a145]
>    #33 /usr/local/samba/lib/private/libtevent-private-samba.so(+0x16c2b)
> [0x77a32f685c2b]
>    #36 /usr/local/samba/lib/private/libtevent-private-samba.so(tevent_com=
mon_loop_wait+0x29)
> [0x77a32f677023]
>    #37 /usr/local/samba/lib/private/libtevent-private-samba.so(+0x11f82)
> [0x77a32f680f82]
>    #38 /usr/local/samba/lib/private/libtevent-private-samba.so(_tevent_lo=
op_wait+0x2f)
> [0x77a32f6770ca]
>    #39 smbd: client [192.168.122.12](+0xae96) [0x5897f941ae96]
>    #40 smbd: client [192.168.122.12](main+0x1ba6) [0x5897f941e1ed]
> [2025/06/30 16:42:03.359226,  0] ../../lib/util/fault.c:178(smb_panic_log=
)
>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    #3 /usr/local/samba/lib/private/libgenrand-private-samba.so(+0x2636)
> [0x77a32f504636]
>
> --
> Thanks,
>
> Steve



--=20
Thanks,

Steve

