Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE9BAEE6CD
	for <lists+samba-technical@lfdr.de>; Mon, 30 Jun 2025 20:33:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=f3srtDiH3sXCMP1u1xYPQ/1kwBejqflWVnbGqG+XZec=; b=RK39b/lfOspZKNy4zFHmomMBhl
	fg0wbvKZtN9vZka/NChVsbUibfsZ2GqSEhohYmRn6w6/NImpnY47bl5pzg21w46PdJqgErYAD8U8y
	THmJGYKXG7Kxp1p29w11iFvYLK65mDrqkwIMLMFqLN92ORsrjJpOUsovPCy6U74oZVYdmtDiRqK4a
	zm5PYMxfpkTE/zCDrVyMBrKf6vR6kvBPvjyBafHzKvmw92dgOUa6k+zKOdmceC7QTNqF+EpXVqLYO
	rIm5xvwBDoziwdI4T8HxbmoLgUvLb3u1lsz6F+qk5Q1m2ZWGaBS7uirj35gVSj6IbpADGnhoN5iuI
	ljJI5L2Q==;
Received: from ip6-localhost ([::1]:34686 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uWJJL-008HhW-9i; Mon, 30 Jun 2025 18:32:59 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:47392) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uWJJF-008HhP-L4
 for samba-technical@lists.samba.org; Mon, 30 Jun 2025 18:32:56 +0000
Received: by mail-qv1-xf34.google.com with SMTP id
 6a1803df08f44-6fae04a3795so53050326d6.3
 for <samba-technical@lists.samba.org>; Mon, 30 Jun 2025 11:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751308371; x=1751913171; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=f3srtDiH3sXCMP1u1xYPQ/1kwBejqflWVnbGqG+XZec=;
 b=OD8nFw1zxzDJHo9F1Jz9z6AJUqIYwAH2YS1v2/vTLZIyO7wfiOVOtW48kwUVuMSddl
 NDcR5ZysYlEaHKf7HfMPiUFV1Y6ZpJx42GTT1tH9dkpCbSyUi+dSWgllZku6VeX8RSa3
 xIAgIIWhQW2ybQo34PWrb6SF+PeQ3MvCUy4xpVB4sABtjav8bnbVya8k+EZUm9vm4u7k
 K3rrBcueiK3jjAZRmgUv0gWPc2ocMoLSFYXqFkQVzHtusdER7su3UxFUpiROp6HgqARY
 XCTRvOWQEQA64zO5H5gxDQL8Uvall7xOZLJVSu4TIzjalvSzUwZ8+CcDfyjUpbOJKKbc
 lH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751308371; x=1751913171;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f3srtDiH3sXCMP1u1xYPQ/1kwBejqflWVnbGqG+XZec=;
 b=ly+y6WI61tf5O/G42SbiG30WV1vOUzJL1QrWdWFDQ/IpFd3RYBLY57p319qGxI56Fk
 7EaMTQHBLX3W/bCvyKXuemrxZj+XXkLbhCRXIPNP/LMb141eI8krvmS8jvgUYe/ohpGN
 OntbBM3X/zTuRfPkyuJT9HLizlC+7ShchSOQUjUTF1zd5jSKOcWDEPhaVMOOO2WX8WiU
 mdpGynvKBBfuBtv3yIjX6XeqDPPJqPkBhkiBbJINc/4GNJ5r8+0r0fW4/KmTFG7LfqRa
 Xhnu4jjINHIShRsQI//4eCMnb+mIxjW6bUhZMvG27AoGf9NGg4dvfibRW17pLycitaJ/
 EuHA==
X-Gm-Message-State: AOJu0Yx2kU4H2p1RgRtJxtzwHqzyOQG7x+iilJbsCHphqbaGcJurjbYX
 e4rf/8T5n824Lcj983MLthY3VRYTstdpRHUz95kgkAjLXHc20QuhytiY4Dw4c4jqVz8sMKGU5nb
 8sJHAYcXBj0mw4W/8QnIlZ5pGANixXJUV1NkD
X-Gm-Gg: ASbGncuXYHNuuM1NjKe/890mOJYjA+vea2kOZMXYcdU4r1g899qBJsWgH/OozEZzR++
 4DXoF49RRd3a1qHOq6siEbP0S6HR73qgP/alDlLcpko6OnrxDfgWYcK3EQCkdQvug3PUDlwpVQT
 Sh73SAN51EZs00Uq42Z5ez3GSPsf2/0TQAHPnnxrt4Au/gTT/ZEC5DDmJhHaWmX74C+/sAklQXe
 rJNzQ==
X-Google-Smtp-Source: AGHT+IEsSUKNkE8ZgmlQJ8xR7k1ys4Ez0abiH+KSHy1OKxjTSNJJPCjsk0oy5ivtLELpnNn8XFUrCrTJpRaq73AnekI=
X-Received: by 2002:a05:6214:262f:b0:6fa:c55e:869 with SMTP id
 6a1803df08f44-70002ee7d42mr281068426d6.23.1751308370868; Mon, 30 Jun 2025
 11:32:50 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 30 Jun 2025 13:32:39 -0500
X-Gm-Features: Ac12FXyCj-jUOXzmBRhofigyUINQdMyCyY9q9IcDm7plkIW54b3Jt7t_Dg2TQTE
Message-ID: <CAH2r5mt70hsY_i6xBNX27p5EEHnJEnfUi2Sk2mZmhvchxepcxg@mail.gmail.com>
Subject: Samba current master branch server crash
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
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

Running generic/013 with the SMB3.1.1 POSIX Extensions enabled to
current Samba server, I see Samba server crash with (and it is
reproducible every time I have tried it):


[2025/06/30 16:42:00.127238,  0]
../../source3/smbd/smb2_ioctl_filesys.c:221(fsctl_dup_extents_send)
  fsctl_dup_extents_send: skipping zero length dup extents
[2025/06/30 16:42:00.492253,  0] ../../lib/util/fault.c:178(smb_panic_log)
  ===============================================================
[2025/06/30 16:42:00.505777,  0] ../../lib/util/fault.c:186(smb_panic_log)
  If you are running a recent Samba version, and if you think this
problem is not yet fixed in the latest versions, please consider
reporting this bug, see https://wiki.samba.org/index.php/Bug_Reporting
[2025/06/30 16:42:00.513839,  0] ../../lib/util/fault.c:192(smb_panic_log)
  PANIC (pid 1066): Signal 7: Bus error in 4.23.0pre1-GIT-5b9492ada40
   #0 /usr/local/samba/lib/private/libgenrand-private-samba.so(log_stack_trace+0x32)
[0x77a32f504c16]
   #2 /usr/local/samba/lib/private/libgenrand-private-samba.so(smb_panic+0x1c)
[0x77a32f504bb2]
   #4 /usr/local/samba/lib/private/libgenrand-private-samba.so(+0x264f)
[0x77a32f50464f]
   #6 /lib/x86_64-linux-gnu/libc.so.6(+0x9f98c) [0x77a32f29f98c]
   #8 /usr/local/samba/lib/private/libtdb-private-samba.so(+0x14581)
[0x77a32f1c6581]
   #10 /usr/local/samba/lib/private/libtdb-private-samba.so(+0x84ff)
[0x77a32f1ba4ff]
   #11 /usr/local/samba/lib/private/libtdb-private-samba.so(+0x8af0)
[0x77a32f1baaf0]
   #13 /usr/local/samba/lib/private/libtdb-private-samba.so(+0x8def)
[0x77a32f1badef]
   #15 /usr/local/samba/lib/private/libdbwrap-private-samba.so(+0x9280)
[0x77a32f41f280]
   #16 /usr/local/samba/lib/private/libdbwrap-private-samba.so(dbwrap_do_locked+0x8c)
[0x77a32f41b391]
   #18 /usr/local/samba/lib/private/libdbwrap-private-samba.so(dbwrap_do_locked+0x8c)
[0x77a32f41b391]
   #20 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(_share_mode_entry_prepare_lock+0x213)
[0x77a32f9bae28]
   #22 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(+0xa6bc8)
[0x77a32f8a6bc8]
   #24 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(+0xfd436)
[0x77a32f8fd436]
  #26 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(smbd_smb2_request_process_close+0x259)
[0x77a32f8fcb84]
   #28 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(smbd_smb2_request_dispatch_immediate+0xfc)
[0x77a32f8e758f]
   #30 /usr/local/samba/lib/private/libtevent-private-samba.so(tevent_common_loop_immediate+0x3b)
[0x77a32f67915b]
   #32 /usr/local/samba/lib/private/libtevent-private-samba.so(+0x11ed9)
[0x77a32f680ed9]
   #34 /usr/local/samba/lib/private/libtevent-private-samba.so(tevent_common_loop_wait+0x29)
[0x77a32f677023]
   #36 /usr/local/samba/lib/private/libtevent-private-samba.so(_tevent_loop_wait+0x2f)
[0x77a32f6770ca]
   #38 smbd: client [192.168.122.12](+0xa145) [0x5897f941a145]

       #40 /usr/local/samba/lib/private/libtevent-private-samba.so(+0x1648e)
[0x77a32f68548e]
   #42 /usr/local/samba/lib/private/libtevent-private-samba.so(+0x11ed9)
[0x77a32f680ed9]
   #44 /usr/local/samba/lib/private/libtevent-private-samba.so(tevent_common_loop_wait+0x29)
[0x77a32f677023]
   #45 /usr/local/samba/lib/private/libtevent-private-samba.so(+0x11f82)
[0x77a32f680f82]
     #46 /usr/local/samba/lib/private/libtevent-private-samba.so(_tevent_loop_wait+0x2f)
[0x77a32f6770ca]
   #48 smbd: client [192.168.122.12](main+0x1ba6) [0x5897f941e1ed]

       #50 /lib/x86_64-linux-gnu/libc.so.6(__libc_start_main+0x8b)
[0x77a32f22a28b]
            [2025/06/30 16:42:00.712449,  0]
../../source3/lib/dumpcore.c:318(dump_core)
                                            coredump is handled by
helper binary specified at /proc/sys/kernel/core_pattern
[2025/06/30 16:42:01.967738,  0]
../../source3/locking/share_mode_lock.c:523(locking_tdb_data_store)
  locking_tdb_data_store: share_mode_g_lock_writev(NULL) failed:
NT_STATUS_NOT_LOCKED
[2025/06/30 16:42:01.967868,  0]
../../source3/locking/share_mode_lock.c:660(share_mode_data_ltdb_store)
  share_mode_data_ltdb_store: locking_tdb_data_store failed:
NT_STATUS_NOT_LOCKED
[2025/06/30 16:42:01.967886,  0]
../../source3/locking/share_mode_lock.c:2356(share_mode_forall_entries)
  share_mode_forall_entries: share_mode_data_ltdb_store failed:
NT_STATUS_NOT_LOCKED
[2025/06/30 16:42:01.967900,  0]
../../source3/locking/share_mode_lock.c:1908(share_entry_rw_traverse_fn)
  share_entry_rw_traverse_fn: share_mode_forall_entries failed
[2025/06/30 16:42:02.683465,  0]
../../source3/smbd/smb2_ioctl_network_fs.c:229(fsctl_srv_copychunk_vfs_done)
  fsctl_srv_copychunk_vfs_done: copy chunk failed
[NT_STATUS_DISK_FULL] chunk [0] of [1]
[2025/06/30 16:42:02.706145,  0] ../../lib/util/fault.c:178(smb_panic_log)
  ===============================================================
[2025/06/30 16:42:02.712428,  0] ../../lib/util/fault.c:179(smb_panic_log)
  INTERNAL ERROR: Signal 7: Bus error in smbd (smbd[192.168.12)
(client [192.168.122.12]) pid 1133 (4.23.0pre1-GIT-5b9492ada40)
[2025/06/30 16:42:02.728066,  0] ../../lib/util/fault.c:191(smb_panic_log)
  ===============================================================
[2025/06/30 16:42:02.728107,  0] ../../lib/util/fault.c:192(smb_panic_log)
  PANIC (pid 1133): Signal 7: Bus error in 4.23.0pre1-GIT-5b9492ada40
[2025/06/30 16:42:02.737474,  0] ../../lib/util/fault.c:303(log_stack_trace)
  BACKTRACE: 44 stack frames:
   #1 /usr/local/samba/lib/private/libgenrand-private-samba.so(smb_panic_log+0x213)
[0x77a32f504b93]
   #2 /usr/local/samba/lib/private/libgenrand-private-samba.so(smb_panic+0x1c)
[0x77a32f504bb2]
   #3 /usr/local/samba/lib/private/libgenrand-private-samba.so(+0x2636)
[0x77a32f504636]
   #4 /usr/local/samba/lib/private/libgenrand-private-samba.so(+0x264f)
[0x77a32f50464f]
   #5 /lib/x86_64-linux-gnu/libc.so.6(+0x45330) [0x77a32f245330]
   #6 /lib/x86_64-linux-gnu/libc.so.6(+0xa160b) [0x77a32f2a160b]
   #7 /usr/local/samba/lib/private/libtdb-private-samba.so(+0x14835)
[0x77a32f1c6835]
   #8 /usr/local/samba/lib/private/libtdb-private-samba.so(+0x83e7)
[0x77a32f1ba3e7]
   #9 /usr/local/samba/lib/private/libtdb-private-samba.so(+0x860a)
[0x77a32f1ba60a]
   #10 /usr/local/samba/lib/private/libtdb-private-samba.so(+0x8fa1)
[0x77a32f1bafa1]
   #11 /usr/local/samba/lib/private/libtdb-private-samba.so(tdb_unlock+0x54)
[0x77a32f1bb06c]
   #12 /usr/local/samba/lib/private/libtdb-private-samba.so(tdb_chainunlock+0x5f)
[0x77a32f1bb9eb]
   #13 /usr/local/samba/lib/private/libdbwrap-private-samba.so(+0x950f)
[0x77a32f41f50f]
   #14 /usr/local/samba/lib/private/libdbwrap-private-samba.so(dbwrap_do_locked+0x8c)
[0x77a32f41b391]
   #15 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(smbXsrv_open_update+0x8d)
[0x77a32f929a7f]
   #16 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(+0xe484c)
[0x77a32f8e484c]
   #18 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(+0xeb14e)
[0x77a32f8eb14e]
   #19 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(+0xeb53a)
[0x77a32f8eb53a]
   #21 /usr/local/samba/lib/private/libtevent-private-samba.so(tevent_common_invoke_fd_handler+0x125)
[0x77a32f67847c]
   #22 /usr/local/samba/lib/private/libtevent-private-samba.so(+0x1648e)
[0x77a32f68548e]
   #24 /usr/local/samba/lib/private/libtevent-private-samba.so(+0x11ed9)
[0x77a32f680ed9]
   #25 /usr/local/samba/lib/private/libtevent-private-samba.so(_tevent_loop_once+0x126)
[0x77a32f676c9b]
   #26 /usr/local/samba/lib/private/libtevent-private-samba.so(tevent_common_loop_wait+0x29)
[0x77a32f677023]
   #28 /usr/local/samba/lib/private/libtevent-private-samba.so(_tevent_loop_wait+0x2f)
[0x77a32f6770ca]
   #29 /usr/local/samba/lib/private/libsmbd-base-private-samba.so(smbd_process+0xfaa)
[0x77a32f8cb716]
   #30 smbd: client [192.168.122.12](+0xa145) [0x5897f941a145]
   #33 /usr/local/samba/lib/private/libtevent-private-samba.so(+0x16c2b)
[0x77a32f685c2b]
   #36 /usr/local/samba/lib/private/libtevent-private-samba.so(tevent_common_loop_wait+0x29)
[0x77a32f677023]
   #37 /usr/local/samba/lib/private/libtevent-private-samba.so(+0x11f82)
[0x77a32f680f82]
   #38 /usr/local/samba/lib/private/libtevent-private-samba.so(_tevent_loop_wait+0x2f)
[0x77a32f6770ca]
   #39 smbd: client [192.168.122.12](+0xae96) [0x5897f941ae96]
   #40 smbd: client [192.168.122.12](main+0x1ba6) [0x5897f941e1ed]
[2025/06/30 16:42:03.359226,  0] ../../lib/util/fault.c:178(smb_panic_log)
  ===============================================================
   #3 /usr/local/samba/lib/private/libgenrand-private-samba.so(+0x2636)
[0x77a32f504636]

-- 
Thanks,

Steve

