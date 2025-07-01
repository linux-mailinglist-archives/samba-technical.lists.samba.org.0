Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E1AAEED1B
	for <lists+samba-technical@lfdr.de>; Tue,  1 Jul 2025 05:50:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=M5b/qEP7iRedXXvXNna+3L4Ilsahkj/o5Ll0OjKEZCs=; b=MhhZAutcjeR8m1RfDS4dxamdNr
	9ffTCh/luBIe8qx/JhfjZCxuVbQNu4QG8rYEEStLmJD0dMyC+XdDp8u9iK4OOp3Wh0UQdQQU4LQPb
	eLtejovSkBapdr50CO1+Wfhso3BjWCMd4WqaP4HLNKoG4u159ZNMh9JatT6HIPkMThbV7azwVIIlt
	dwBFnOvGn7ZFqUrJDAd4r7gSvO5EujgSyuJbzhDVrEU2KsXKQdczQ3j3x1f+4jIQJ1lBzUUvxvteU
	01oniO9X61ywG1NA5t+fGW7AHCDyEsGMmZNIqe0WVKLf7bbZX0cUXMcWzIpvkeokMp61RevagRwE9
	ccBMl6eA==;
Received: from ip6-localhost ([::1]:40474 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uWS08-00A9Sb-AS; Tue, 01 Jul 2025 03:49:44 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:44541) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uWS01-00A9SU-Qa
 for samba-technical@lists.samba.org; Tue, 01 Jul 2025 03:49:41 +0000
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-7d3f5796755so483806785a.1
 for <samba-technical@lists.samba.org>; Mon, 30 Jun 2025 20:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751341775; x=1751946575; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M5b/qEP7iRedXXvXNna+3L4Ilsahkj/o5Ll0OjKEZCs=;
 b=hTAdmROYPcDGijXiLrQNPnFGwXDM2VseRiiKYdGDheD13jUW3DmzrBCKC0mVAl2H25
 We81/kAvRWTS+F1tqqfv5XHrcaHPu3QuUKpWN1NunJKyo2jJTOqCvNJHvqCMs6n6ctxB
 J1UIZRt73woPQ7tr8iYnwdjyg1hWtu0mzsv52FWo+qsc73Tm+bp6UnsojRseM0RS6hqV
 wqL44aNa0ehLOogDGiOK7KmcR/12fePcKybf33FeDenBaLYyAzM1GEnI7tawxehGbBVF
 qSYar83YaQXJj0Rtdb6HWTwicTRUzqQ2DwuG44RsCqGfyNOyVJ8mgd1Uulx6W02jKCqr
 ONng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751341775; x=1751946575;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M5b/qEP7iRedXXvXNna+3L4Ilsahkj/o5Ll0OjKEZCs=;
 b=O/kNrkAXRxeo7iXJI/tNC2AFh7cinlL/1R+H1YVGiqQezXPCYQMrStRq96lnOKGDvo
 7MGXL6L+ZHgEczb3+6WgnsJqqXxokkX5HXvHET3clGmkjLngBddk1Cne3DUxKNygZlh4
 ntghN3Tq78PZrNJXQlu8ruBQk6uJOLLIPeaAAiF6oYVzxIIfJTYPxQcyR1TONqAIDQ52
 tDl2Uwqk7KG0lAm6PCQ4MV8A69iRlo4kWe84x9labG8OCdCYbq0f4yVNg41c2nXb+s2a
 YHtZt3b4uDditJVYVF2+48j3IcN6Rr3kuzYhqcRPDxRraoXSevEjEvyDzIv7DTLRhVOq
 zdBQ==
X-Gm-Message-State: AOJu0YwAqduv4ykqF393ai0PNm6PZvM6R0qDzVqkIuFK9q7DMf/JTwdz
 u6hkUu4nqvfnIL7ecJRQnLoEMBpLQwtq/z+6P+6IDlc1vDMligaEJFIrYtJWUDkLpKqGCpnTcoE
 UWufZvjXtJ5WV9I+aKo0OenBtKCDKFAw=
X-Gm-Gg: ASbGnctdz07lNMi70HvYp5/QQIs3Dd7OFHs3LC9PEBuV1ET5CYqg2cq1iEQjsUCMvj0
 MSObDoQOw160dnVV0Ylu+pIFEDIJ2BL8BjuHmgNTwn18o4BkIUvVZVha8Z2Gah6UYRthadOSCZ0
 ql1loYGr5xZxeDrOOAexHMteyF3K+KIZAG0Gfs+H6LXNDMjAVZS7r/aZzofuGY6flgHMqR74hyz
 PP6CA==
X-Google-Smtp-Source: AGHT+IEMVzbK+h/386WeDl7lw0lsp8quMAmBfDDKw4C2NSs//WK/BFDPlrISnvCm4MZ8NhodhINhc2WceSXoISkC63M=
X-Received: by 2002:a05:6214:2f86:b0:6f2:c88a:50b2 with SMTP id
 6a1803df08f44-70001c5372emr248298336d6.3.1751341775328; Mon, 30 Jun 2025
 20:49:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mt70hsY_i6xBNX27p5EEHnJEnfUi2Sk2mZmhvchxepcxg@mail.gmail.com>
 <c2493bdc-bd2b-4c17-afd0-4aaf87b1b85f@samba.org>
In-Reply-To: <c2493bdc-bd2b-4c17-afd0-4aaf87b1b85f@samba.org>
Date: Mon, 30 Jun 2025 22:49:24 -0500
X-Gm-Features: Ac12FXwLh7dh_bSZiu2kZPktLdsmoxxwAGhXyhLFXRkh7S_krmOUBhEiyLkVLvw
Message-ID: <CAH2r5mut=m6U72P8TiTNp=7uCxMEDqw3BbhLJc9NWsk-iPqhng@mail.gmail.com>
Subject: Re: Samba current master branch server crash
To: Ralph Boehme <slow@samba.org>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I was able to reproduce this (albeit ran out of disk space so some
additional errors logged) - when I tried this (with
configure.developer build) I only saw one smbd process running and
"bt" showed:

0  0x0000790f56b2a007 in epoll_wait (epfd=3D3, events=3D0x7ffed8c523bc,
maxevents=3D1, timeout=3D313264) at
../sysdeps/unix/sysv/linux/epoll_wait.c:30
        sc_ret =3D -4
        sc_ret =3D <optimized out>
#1  0x0000790f56ea11e5 in epoll_event_loop (epoll_ev=3D0x56f05bfc0c70,
tvalp=3D0x7ffed8c52400) at ../../lib/tevent/tevent_epoll.c:602
        ret =3D 1543283552
        i =3D -658168880
        events =3D {{events =3D 0, data =3D {ptr =3D 0x7ffed8c523d0, fd =3D
-658168880, u32 =3D 3636798416, u64 =3D 140732535219152}}}
        timeout =3D 313264
        wait_errno =3D 22256
#2  0x0000790f56ea1c2b in epoll_event_loop_once (ev=3D0x56f05bfc0a30,
location=3D0x56f03e4537f0 "../../source3/smbd/server.c:1415")
    at ../../lib/tevent/tevent_epoll.c:929
        epoll_ev =3D 0x56f05bfc0c70
        tval =3D {tv_sec =3D 313, tv_usec =3D 263389}
        panic_triggered =3D false
#3  0x0000790f56e9ced9 in std_event_loop_once (ev=3D0x56f05bfc0a30,
location=3D0x56f03e4537f0 "../../source3/smbd/server.c:1415")
    at ../../lib/tevent/tevent_standard.c:110
        glue_ptr =3D 0x56f05bfc0be0
        glue =3D 0x56f05bfc0be0
        ret =3D 30991
#4  0x0000790f56e92c9b in _tevent_loop_once (ev=3D0x56f05bfc0a30,
location=3D0x56f03e4537f0 "../../source3/smbd/server.c:1415")
    at ../../lib/tevent/tevent.c:860
        ret =3D 0
        nesting_stack_ptr =3D 0x0
        __func__ =3D "_tevent_loop_once"
#5  0x0000790f56e93023 in tevent_common_loop_wait (ev=3D0x56f05bfc0a30,
location=3D0x56f03e4537f0 "../../source3/smbd/server.c:1415")
    at ../../lib/tevent/tevent.c:989
        ret =3D 0
#6  0x0000790f56e9cf82 in std_event_loop_wait (ev=3D0x56f05bfc0a30,
location=3D0x56f03e4537f0 "../../source3/smbd/server.c:1415")
    at ../../lib/tevent/tevent_standard.c:141
        glue_ptr =3D 0x56f05bfc0be0
        glue =3D 0x56f05bfc0be0
        ret =3D 22256
#7  0x0000790f56e930ca in _tevent_loop_wait (ev=3D0x56f05bfc0a30,
location=3D0x56f03e4537f0 "../../source3/smbd/server.c:1415")
    at ../../lib/tevent/tevent.c:1008
No locals.
#8  0x000056f03e44d3c3 in smbd_parent_loop (ev_ctx=3D0x56f05bfc0a30,
parent=3D0x56f05bfaf4f0) at ../../source3/smbd/server.c:1415
        trace_state =3D {frame =3D 0x56f05bfd3ec0}
        ret =3D 0
        __FUNCTION__ =3D "smbd_parent_loop"

log.smbd showed:
[2025/07/01 03:42:41.599603,  0] ../../source3/lib/util.c:700(call_panic_ac=
tion)
  call_panic_action: Calling panic action [/bin/sleep 999999999]

[2025/07/01 03:42:39.663550,  0]
../../source3/smbd/smb2_ioctl_filesys.c:221(fsctl_dup_extents_send)
  fsctl_dup_extents_send: skipping zero length dup extents
[2025/07/01 03:42:41.257552,  0]
../../source3/modules/vfs_default.c:2578(vfswrap_offload_write_write_done)
  vfswrap_offload_write_write_done: write failed: No space left on device
[2025/07/01 03:42:41.257968,  0]
../../source3/smbd/smb2_ioctl_network_fs.c:229(fsctl_srv_copychunk_vfs_done=
)
  fsctl_srv_copychunk_vfs_done: copy chunk failed
[NT_STATUS_DISK_FULL] chunk [0] of [1]
[2025/07/01 03:42:41.406346,  0]
../../source3/modules/vfs_default.c:2578(vfswrap_offload_write_write_done)
  vfswrap_offload_write_write_done: write failed: No space left on device
[2025/07/01 03:42:41.406512,  0]
../../source3/smbd/smb2_ioctl_network_fs.c:229(fsctl_srv_copychunk_vfs_done=
)
  fsctl_srv_copychunk_vfs_done: copy chunk failed
[NT_STATUS_DISK_FULL] chunk [0] of [1]
[2025/07/01 03:42:41.454952,  0]
../../source3/modules/vfs_default.c:2578(vfswrap_offload_write_write_done)
  vfswrap_offload_write_write_done: write failed: No space left on device
[2025/07/01 03:42:41.455385,  0]
../../source3/smbd/smb2_ioctl_network_fs.c:229(fsctl_srv_copychunk_vfs_done=
)
  fsctl_srv_copychunk_vfs_done: copy chunk failed
[NT_STATUS_DISK_FULL] chunk [0] of [1]
[2025/07/01 03:42:41.504836,  0] ../../lib/util/fault.c:178(smb_panic_log)
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[2025/07/01 03:42:41.512904,  0] ../../lib/util/fault.c:186(smb_panic_log)
  If you are running a recent Samba version, and if you think this
problem is not yet fixed in the latest versions, please consider
reporting this bug, see https://wiki.samba.org/index.php/Bug_Reporting
[2025/07/01 03:42:41.520519,  0] ../../lib/util/fault.c:192(smb_panic_log)
  PANIC (pid 1243): Signal 7: Bus error in 4.23.0pre1-GIT-a9fc256afa3
   #8 /usr/local/samba/lib/private/libtdb-private-samba.so(+0xcf71)
[0x790f569c8f71]
   #9 /usr/local/samba/lib/private/libtdb-private-samba.so(+0x5f17)
[0x790f569c1f17]
   #10 /usr/local/samba/lib/private/libtdb-private-samba.so(tdb_storev+0xcd=
)
[0x790f569c22d5]
   #11 /usr/local/samba/lib/private/libdbwrap-private-samba.so(+0x9816)
[0x790f56c33816]
   #12 /usr/local/samba/lib/private/libdbwrap-private-samba.so(dbwrap_recor=
d_storev+0x3e)
[0x790f56c2df0c]
   #13 /usr/local/samba/lib/libsmbconf.so.0(+0x39b6e) [0x790f57337b6e]
   #14 /usr/local/samba/lib/libsmbconf.so.0(+0x39bd4) [0x790f57337bd4]
 #15 /usr/local/samba/lib/private/libdbwrap-private-samba.so(dbwrap_record_=
storev+0x3e)
[0x790f56c2df0c]
   #16 /usr/local/samba/lib/libsmbconf.so.0(+0x3c4e8) [0x790f5733a4e8]
   #17 /usr/local/samba/lib/libsmbconf.so.0(+0x3da7a) [0x790f5733ba7a]
   #18 /usr/local/samba/lib/libsmbconf.so.0(+0x3fb61) [0x790f5733db61]
   #19 /usr/local/samba/lib/libsmbconf.so.0(+0x38ec1) [0x790f57336ec1]
   #20 /usr/local/samba/lib/private/libdbwrap-private-samba.so(+0x94ec)
[0x790f56c334ec]
   #21 /usr/local/samba/lib/private/libdbwrap-private-samba.so(dbwrap_do_lo=
cked+0x8c)
[0x790f56c2f391]
   #22 /usr/local/samba/lib/libsmbconf.so.0(+0x38fd5) [0x790f57336fd5]
   #23 /usr/local/samba/lib/private/libdbwrap-private-samba.so(dbwrap_do_lo=
cked+0x8c)
[0x790f56c2f391]
   #24 /usr/local/samba/lib/libsmbconf.so.0(g_lock_lock+0x1c2) [0x790f5733d=
e1a]
   #25 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(_share_mo=
de_entry_prepare_lock+0x213)
[0x790f571bb350]
   #26 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(+0xa03cb)
[0x790f570a03cb]
   #27 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(+0xa39bf)
[0x790f570a39bf]
   #28 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(create_fi=
le_default+0x322)
[0x790f570a4589]
   #29 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(+0x48670)
[0x790f57048670]
   #30 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(smb_vfs_c=
all_create_file+0x14c)
[0x790f570b0536]
   #31 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(+0xf9403)
[0x790f570f9403]
   #32 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(smbd_smb2=
_request_process_create+0x985)
[0x790f570f6098]
   #33 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(smbd_smb2=
_request_dispatch+0x179a)
[0x790f570e64db]
   #34 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(+0xeb63b)
[0x790f570eb63b]
   #35 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(+0xeba27)
[0x790f570eba27]
   #36 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(+0xebaf7)
[0x790f570ebaf7]
   #37 /usr/local/samba/lib/private/libtevent-private-samba.so(tevent_commo=
n_invoke_fd_handler+0x125)
[0x790f56e9447c]
   #38 /usr/local/samba/lib/private/libtevent-private-samba.so(+0x1648e)
[0x790f56ea148e]
   #39 /usr/local/samba/lib/private/libtevent-private-samba.so(+0x16c2b)
[0x790f56ea1c2b]
   #40 /usr/local/samba/lib/private/libtevent-private-samba.so(+0x11ed9)
[0x790f56e9ced9]
   #41 /usr/local/samba/lib/private/libtevent-private-samba.so(_tevent_loop=
_once+0x126)
[0x790f56e92c9b]
   #42 /usr/local/samba/lib/private/libtevent-private-samba.so(tevent_commo=
n_loop_wait+0x29)
[0x790f56e93023]
   #43 /usr/local/samba/lib/private/libtevent-private-samba.so(+0x11f82)
[0x790f56e9cf82]
   #44 /usr/local/samba/lib/private/libtevent-private-samba.so(_tevent_loop=
_wait+0x2f)
[0x790f56e930ca]
   #45 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(smbd_proc=
ess+0xfaa)
[0x790f570cbb97]
   #46 smbd: client [192.168.122.12](+0xb62c) [0x56f03e44c62c]
   #47 /usr/local/samba/lib/private/libtevent-private-samba.so(tevent_commo=
n_invoke_fd_handler+0x125)
[0x790f56e9447c]
   #48 /usr/local/samba/lib/private/libtevent-private-samba.so(+0x1648e)
[0x790f56ea148e]
   #49 /usr/local/samba/lib/private/libtevent-private-samba.so(+0x16c2b)
[0x790f56ea1c2b]
   #50 /usr/local/samba/lib/private/libtevent-private-samba.so(+0x11ed9)
[0x790f56e9ced9]
   #51 /usr/local/samba/lib/private/libtevent-private-samba.so(_tevent_loop=
_once+0x126)
[0x790f56e92c9b]
  #52 /usr/local/samba/lib/private/libtevent-private-samba.so(tevent_common=
_loop_wait+0x29)
[0x790f56e93023]
   #53 /usr/local/samba/lib/private/libtevent-private-samba.so(+0x11f82)
[0x790f56e9cf82]
   #54 /usr/local/samba/lib/private/libtevent-private-samba.so(_tevent_loop=
_wait+0x2f)
[0x790f56e930ca]
   #55 smbd: client [192.168.122.12](+0xc3c3) [0x56f03e44d3c3]
   #56 smbd: client [192.168.122.12](main+0x1ba6) [0x56f03e45071a]
   #57 /lib/x86_64-linux-gnu/libc.so.6(+0x2a1ca) [0x790f56a2a1ca]
   #58 /lib/x86_64-linux-gnu/libc.so.6(__libc_start_main+0x8b) [0x790f56a2a=
28b]
   #59 smbd: client [192.168.122.12](_start+0x25) [0x56f03e448d85]
[2025/07/01 03:42:41.599603,  0] ../../source3/lib/util.c:700(call_panic_ac=
tion)
  call_panic_action: Calling panic action [/bin/sleep 999999999]

On Mon, Jun 30, 2025 at 2:39=E2=80=AFPM Ralph Boehme <slow@samba.org> wrote=
:
>
> Can you get us a stack backtrace with debug symbols please?
>
> Iirc the following should get you there:
>
> $ ./configure.developer
>
> $ make
>
> $ ...
>
> Then reproduce the crash. The crash process should still be around:
>
> $ gdb -p PID
>
> gdb> bt full
>
> Thanks!
> -slow
>
> On 6/30/25 8:32 PM, Steve French via samba-technical wrote:
> > Running generic/013 with the SMB3.1.1 POSIX Extensions enabled to
> > current Samba server, I see Samba server crash with (and it is
> > reproducible every time I have tried it):
> >
> >
> > [2025/06/30 16:42:00.127238,  0]
> > ../../source3/smbd/smb2_ioctl_filesys.c:221(fsctl_dup_extents_send)
> >    fsctl_dup_extents_send: skipping zero length dup extents
> > [2025/06/30 16:42:00.492253,  0] ../../lib/util/fault.c:178(smb_panic_l=
og)
> >    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [2025/06/30 16:42:00.505777,  0] ../../lib/util/fault.c:186(smb_panic_l=
og)
> >    If you are running a recent Samba version, and if you think this
> > problem is not yet fixed in the latest versions, please consider
> > reporting this bug, see https://wiki.samba.org/index.php/Bug_Reporting
> > [2025/06/30 16:42:00.513839,  0] ../../lib/util/fault.c:192(smb_panic_l=
og)
> >    PANIC (pid 1066): Signal 7: Bus error in 4.23.0pre1-GIT-5b9492ada40
> >     #0 /usr/local/samba/lib/private/libgenrand-private-samba.so(log_sta=
ck_trace+0x32)
> > [0x77a32f504c16]
> >     #2 /usr/local/samba/lib/private/libgenrand-private-samba.so(smb_pan=
ic+0x1c)
> > [0x77a32f504bb2]
> >     #4 /usr/local/samba/lib/private/libgenrand-private-samba.so(+0x264f=
)
> > [0x77a32f50464f]
> >     #6 /lib/x86_64-linux-gnu/libc.so.6(+0x9f98c) [0x77a32f29f98c]
> >     #8 /usr/local/samba/lib/private/libtdb-private-samba.so(+0x14581)
> > [0x77a32f1c6581]
> >     #10 /usr/local/samba/lib/private/libtdb-private-samba.so(+0x84ff)
> > [0x77a32f1ba4ff]
> >     #11 /usr/local/samba/lib/private/libtdb-private-samba.so(+0x8af0)
> > [0x77a32f1baaf0]
> >     #13 /usr/local/samba/lib/private/libtdb-private-samba.so(+0x8def)
> > [0x77a32f1badef]
> >     #15 /usr/local/samba/lib/private/libdbwrap-private-samba.so(+0x9280=
)
> > [0x77a32f41f280]
> >     #16 /usr/local/samba/lib/private/libdbwrap-private-samba.so(dbwrap_=
do_locked+0x8c)
> > [0x77a32f41b391]
> >     #18 /usr/local/samba/lib/private/libdbwrap-private-samba.so(dbwrap_=
do_locked+0x8c)
> > [0x77a32f41b391]
> >     #20 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(_sha=
re_mode_entry_prepare_lock+0x213)
> > [0x77a32f9bae28]
> >     #22 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(+0xa=
6bc8)
> > [0x77a32f8a6bc8]
> >     #24 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(+0xf=
d436)
> > [0x77a32f8fd436]
> >    #26 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(smbd_=
smb2_request_process_close+0x259)
> > [0x77a32f8fcb84]
> >     #28 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(smbd=
_smb2_request_dispatch_immediate+0xfc)
> > [0x77a32f8e758f]
> >     #30 /usr/local/samba/lib/private/libtevent-private-samba.so(tevent_=
common_loop_immediate+0x3b)
> > [0x77a32f67915b]
> >     #32 /usr/local/samba/lib/private/libtevent-private-samba.so(+0x11ed=
9)
> > [0x77a32f680ed9]
> >     #34 /usr/local/samba/lib/private/libtevent-private-samba.so(tevent_=
common_loop_wait+0x29)
> > [0x77a32f677023]
> >     #36 /usr/local/samba/lib/private/libtevent-private-samba.so(_tevent=
_loop_wait+0x2f)
> > [0x77a32f6770ca]
> >     #38 smbd: client [192.168.122.12](+0xa145) [0x5897f941a145]
> >
> >         #40 /usr/local/samba/lib/private/libtevent-private-samba.so(+0x=
1648e)
> > [0x77a32f68548e]
> >     #42 /usr/local/samba/lib/private/libtevent-private-samba.so(+0x11ed=
9)
> > [0x77a32f680ed9]
> >     #44 /usr/local/samba/lib/private/libtevent-private-samba.so(tevent_=
common_loop_wait+0x29)
> > [0x77a32f677023]
> >     #45 /usr/local/samba/lib/private/libtevent-private-samba.so(+0x11f8=
2)
> > [0x77a32f680f82]
> >       #46 /usr/local/samba/lib/private/libtevent-private-samba.so(_teve=
nt_loop_wait+0x2f)
> > [0x77a32f6770ca]
> >     #48 smbd: client [192.168.122.12](main+0x1ba6) [0x5897f941e1ed]
> >
> >         #50 /lib/x86_64-linux-gnu/libc.so.6(__libc_start_main+0x8b)
> > [0x77a32f22a28b]
> >              [2025/06/30 16:42:00.712449,  0]
> > ../../source3/lib/dumpcore.c:318(dump_core)
> >                                              coredump is handled by
> > helper binary specified at /proc/sys/kernel/core_pattern
> > [2025/06/30 16:42:01.967738,  0]
> > ../../source3/locking/share_mode_lock.c:523(locking_tdb_data_store)
> >    locking_tdb_data_store: share_mode_g_lock_writev(NULL) failed:
> > NT_STATUS_NOT_LOCKED
> > [2025/06/30 16:42:01.967868,  0]
> > ../../source3/locking/share_mode_lock.c:660(share_mode_data_ltdb_store)
> >    share_mode_data_ltdb_store: locking_tdb_data_store failed:
> > NT_STATUS_NOT_LOCKED
> > [2025/06/30 16:42:01.967886,  0]
> > ../../source3/locking/share_mode_lock.c:2356(share_mode_forall_entries)
> >    share_mode_forall_entries: share_mode_data_ltdb_store failed:
> > NT_STATUS_NOT_LOCKED
> > [2025/06/30 16:42:01.967900,  0]
> > ../../source3/locking/share_mode_lock.c:1908(share_entry_rw_traverse_fn=
)
> >    share_entry_rw_traverse_fn: share_mode_forall_entries failed
> > [2025/06/30 16:42:02.683465,  0]
> > ../../source3/smbd/smb2_ioctl_network_fs.c:229(fsctl_srv_copychunk_vfs_=
done)
> >    fsctl_srv_copychunk_vfs_done: copy chunk failed
> > [NT_STATUS_DISK_FULL] chunk [0] of [1]
> > [2025/06/30 16:42:02.706145,  0] ../../lib/util/fault.c:178(smb_panic_l=
og)
> >    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [2025/06/30 16:42:02.712428,  0] ../../lib/util/fault.c:179(smb_panic_l=
og)
> >    INTERNAL ERROR: Signal 7: Bus error in smbd (smbd[192.168.12)
> > (client [192.168.122.12]) pid 1133 (4.23.0pre1-GIT-5b9492ada40)
> > [2025/06/30 16:42:02.728066,  0] ../../lib/util/fault.c:191(smb_panic_l=
og)
> >    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [2025/06/30 16:42:02.728107,  0] ../../lib/util/fault.c:192(smb_panic_l=
og)
> >    PANIC (pid 1133): Signal 7: Bus error in 4.23.0pre1-GIT-5b9492ada40
> > [2025/06/30 16:42:02.737474,  0] ../../lib/util/fault.c:303(log_stack_t=
race)
> >    BACKTRACE: 44 stack frames:
> >     #1 /usr/local/samba/lib/private/libgenrand-private-samba.so(smb_pan=
ic_log+0x213)
> > [0x77a32f504b93]
> >     #2 /usr/local/samba/lib/private/libgenrand-private-samba.so(smb_pan=
ic+0x1c)
> > [0x77a32f504bb2]
> >     #3 /usr/local/samba/lib/private/libgenrand-private-samba.so(+0x2636=
)
> > [0x77a32f504636]
> >     #4 /usr/local/samba/lib/private/libgenrand-private-samba.so(+0x264f=
)
> > [0x77a32f50464f]
> >     #5 /lib/x86_64-linux-gnu/libc.so.6(+0x45330) [0x77a32f245330]
> >     #6 /lib/x86_64-linux-gnu/libc.so.6(+0xa160b) [0x77a32f2a160b]
> >     #7 /usr/local/samba/lib/private/libtdb-private-samba.so(+0x14835)
> > [0x77a32f1c6835]
> >     #8 /usr/local/samba/lib/private/libtdb-private-samba.so(+0x83e7)
> > [0x77a32f1ba3e7]
> >     #9 /usr/local/samba/lib/private/libtdb-private-samba.so(+0x860a)
> > [0x77a32f1ba60a]
> >     #10 /usr/local/samba/lib/private/libtdb-private-samba.so(+0x8fa1)
> > [0x77a32f1bafa1]
> >     #11 /usr/local/samba/lib/private/libtdb-private-samba.so(tdb_unlock=
+0x54)
> > [0x77a32f1bb06c]
> >     #12 /usr/local/samba/lib/private/libtdb-private-samba.so(tdb_chainu=
nlock+0x5f)
> > [0x77a32f1bb9eb]
> >     #13 /usr/local/samba/lib/private/libdbwrap-private-samba.so(+0x950f=
)
> > [0x77a32f41f50f]
> >     #14 /usr/local/samba/lib/private/libdbwrap-private-samba.so(dbwrap_=
do_locked+0x8c)
> > [0x77a32f41b391]
> >     #15 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(smbX=
srv_open_update+0x8d)
> > [0x77a32f929a7f]
> >     #16 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(+0xe=
484c)
> > [0x77a32f8e484c]
> >     #18 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(+0xe=
b14e)
> > [0x77a32f8eb14e]
> >     #19 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(+0xe=
b53a)
> > [0x77a32f8eb53a]
> >     #21 /usr/local/samba/lib/private/libtevent-private-samba.so(tevent_=
common_invoke_fd_handler+0x125)
> > [0x77a32f67847c]
> >     #22 /usr/local/samba/lib/private/libtevent-private-samba.so(+0x1648=
e)
> > [0x77a32f68548e]
> >     #24 /usr/local/samba/lib/private/libtevent-private-samba.so(+0x11ed=
9)
> > [0x77a32f680ed9]
> >     #25 /usr/local/samba/lib/private/libtevent-private-samba.so(_tevent=
_loop_once+0x126)
> > [0x77a32f676c9b]
> >     #26 /usr/local/samba/lib/private/libtevent-private-samba.so(tevent_=
common_loop_wait+0x29)
> > [0x77a32f677023]
> >     #28 /usr/local/samba/lib/private/libtevent-private-samba.so(_tevent=
_loop_wait+0x2f)
> > [0x77a32f6770ca]
> >     #29 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(smbd=
_process+0xfaa)
> > [0x77a32f8cb716]
> >     #30 smbd: client [192.168.122.12](+0xa145) [0x5897f941a145]
> >     #33 /usr/local/samba/lib/private/libtevent-private-samba.so(+0x16c2=
b)
> > [0x77a32f685c2b]
> >     #36 /usr/local/samba/lib/private/libtevent-private-samba.so(tevent_=
common_loop_wait+0x29)
> > [0x77a32f677023]
> >     #37 /usr/local/samba/lib/private/libtevent-private-samba.so(+0x11f8=
2)
> > [0x77a32f680f82]
> >     #38 /usr/local/samba/lib/private/libtevent-private-samba.so(_tevent=
_loop_wait+0x2f)
> > [0x77a32f6770ca]
> >     #39 smbd: client [192.168.122.12](+0xae96) [0x5897f941ae96]
> >     #40 smbd: client [192.168.122.12](main+0x1ba6) [0x5897f941e1ed]
> > [2025/06/30 16:42:03.359226,  0] ../../lib/util/fault.c:178(smb_panic_l=
og)
> >    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >     #3 /usr/local/samba/lib/private/libgenrand-private-samba.so(+0x2636=
)
> > [0x77a32f504636]
> >
>


--=20
Thanks,

Steve

