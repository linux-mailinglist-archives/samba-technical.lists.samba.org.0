Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3EE5F69D8
	for <lists+samba-technical@lfdr.de>; Thu,  6 Oct 2022 16:41:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=++FTNoqwFkNnJR9vzfMvjuReU/fFwpR8MvGQqAQavQg=; b=3dKvY1ka/xp+XUUtaXd0jzWX+W
	VNTJAoYftbi1YXbdx+k8SrtkOG0RXOdOO2Jjbpu6uC3tNuTYrQ99j5M+2lZIAmRgCJAuHaj89BvJB
	VS3h9LQiSP+8Qk+lDlqisV6uvxps5620s/RanpqEaC2w3d/qCjLJLqfnSUx9fpuxZ0Hq9WnLyNkAU
	oTgKJxxdftPdwCJ0zQSNtWScCX56PNodksAKfA3F/tORsykf9HH35PGsiVLjx3oQttX9zeh3yWKM8
	KhxNornnEtlBvzvmu73HizD11O04dJZ2DDZaxiL4z/ewSWROyqP9BdQB/KGwSpjnUREAToCSlHmTU
	cm8vevyw==;
Received: from ip6-localhost ([::1]:19104 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ogS3r-000EiM-7i; Thu, 06 Oct 2022 14:41:19 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:39602) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ogS3j-000EiD-HH
 for samba-technical@lists.samba.org; Thu, 06 Oct 2022 14:41:17 +0000
Received: by mail-pg1-x52e.google.com with SMTP id b5so2054725pgb.6
 for <samba-technical@lists.samba.org>; Thu, 06 Oct 2022 07:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=6nY8fI1DUQNGmpHypIAtcogUqhRfjriz/p/oWmtyK4Y=;
 b=UUOnLE/0kWk1SPDMj0qaEsChfaqz54yuakD5XlgQtGTGo82Ez5X7xhauTo+dt8Im0t
 Wnu0dGyD/NGmFuUy+ahO4JXJfTt8c83t8Z+2Yi/DBrlIHeJy8eE6O5EM1bdhIORu0nch
 TblRjhm8V/OWqa4jIQx22llbEYWf4kQ2UmVDi2p3enGNMzElmJfs+ab2iEF52gjsWNzB
 b4qxOmK1JR+IvQdZwIVOasGJEHjLcR+pfxR+1SmEG08l8x+xxkPMkTni1+QF3bwOZdpl
 33j+D8e6Trn2ZsLf2SWpBNIHXbXiqIAAaroMUDotOSQUwZkDfcvoAc4ylvsepPiml891
 XlDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=6nY8fI1DUQNGmpHypIAtcogUqhRfjriz/p/oWmtyK4Y=;
 b=tbHjMAy8I5ZoC8G1vHv0ewNOL8zaQ7Dh+3jp/3leVfWQa7tuhVveavdVl8mJdYvoER
 GP3f3iTJ/xLCMuzmgqM4SkXQ4p3RdfQxSr+8SUS4/HhNcH0dysXp4FwN5cd8bXLxgbbP
 KTwfqWkh8wZcPL/ztPbBaDfarSIWm6y/CDz5gHHyzHXe/yX0Lz0KBnZxfo4saQ8Udhil
 KNh2W4rofjuIkYS/wzb7qsF5cZ6FTq45E2BX3ve9krFApfCRaysaNfevGRUPTxKfY0MX
 CY1Tlq3R1VSLH3hvh+L5a3cmDUovF8tMGZ/eJVt80a+4iAgqfXhRlA1ShuyOmUH7GOmO
 AykQ==
X-Gm-Message-State: ACrzQf3yk8fAkdb7i0HPQ9tGB25cKZzZTVlyjiduNyibX+2VyV56PFMs
 KblLRsmD9ypd3hu9shz4GBJVRAkjXi6Jd6ae4hpatg==
X-Google-Smtp-Source: AMsMyM5d8o1YddnT+G+lUwo8Q/Xtmm6d+OCZGkUQxX5vlQFWw6N0QuGXgnd1M/ag92byPIX5U7WO7vYnlMqsb9YEm5Y=
X-Received: by 2002:a05:6a00:234b:b0:561:f0c3:cdee with SMTP id
 j11-20020a056a00234b00b00561f0c3cdeemr82023pfj.32.1665067268643; Thu, 06 Oct
 2022 07:41:08 -0700 (PDT)
MIME-Version: 1.0
References: <8fbdc4c2-09db-3032-38c4-1608aae5e7f9@samba.org>
In-Reply-To: <8fbdc4c2-09db-3032-38c4-1608aae5e7f9@samba.org>
Date: Thu, 6 Oct 2022 10:40:57 -0400
Message-ID: <CAB5c7xrru41LZs76Qy9wdT6gXbWkWsEi9oyzKMY_Ux_eqw+LgQ@mail.gmail.com>
Subject: Re: vfs_crossrename not working in samba-4.15.*
To: =?UTF-8?Q?Pavel_Filipensk=C3=BD?= <pfilipensky@samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Oct 6, 2022 at 10:28 AM Pavel Filipensk=C3=BD via samba-technical <
samba-technical@lists.samba.org> wrote:

> Hi,
>
> I am working on a fix for RH bugzillahttps://
> bugzilla.redhat.com/show_bug.cgi?id=3D2125339
>
> If the share is using vfs_recycle and vfs_crossrename modules and the
> recycle repo is on a different filesystem, like here:
>
> vfs objects =3D recycle crossrename
> recycle:repository =3D /different_filesystem/
>
> The deleted file should be moved to /different_filesystem/recycle, but it
> fails. Since this is a different fs, we cannot use
>
> rename("File", "/different_filesystem/recycle/File")
>
> but instead samba code uses two syscalls:
>
> unlink("/different_filesystem/recycle/File")
> openat(AT_FDCWD, "/different_filesystem/recycle/File", O_CREAT, 0600)
>
> Normally, the destination file "/different_filesystem/recycle/File" does
> not exist and unlink() fails with ENOENT. This is correctly handled in
> samba-4.12:
>
>
>   51 static int copy_reg(const char *source, const char *dest)
>   52 {
> ...
>   76 =C2=BB=C2=B7=C2=B7=C2=B7if (unlink (dest) && errno !=3D ENOENT) {
>   77 =C2=BB=C2=B7=C2=B7=C2=B7=C2=BB=C2=B7=C2=B7=C2=B7close(ifd);
>   78 =C2=BB=C2=B7=C2=B7=C2=B7=C2=BB=C2=B7=C2=B7=C2=B7return -1;
>   79 =C2=BB=C2=B7=C2=B7=C2=B7}
>
> But newer versions of samba miss the check for ENOENT and the operation
> fails, doing map_nt_error_from_unix(errno). I have tried to the same fix,
> and added to copy_reg() this:
>
> -       if (ret =3D=3D -1) {
> +       if (ret =3D=3D -1 && errno !=3D ENOENT) {
>                  status =3D map_nt_error_from_unix(errno);
>                  goto out;
>          }
>
> Unfortunately, it does not work. It causes this panic:
>
>
>
> Program received signal SIGABRT, Aborted.
> __pthread_kill_implementation (threadid=3D<optimized out>, signo=3Dsigno@=
entry=3D6,
> no_tid=3Dno_tid@entry=3D0) at pthread_kill.c:44
> 44=C2=BB=C2=B7      return INTERNAL_SYSCALL_ERROR_P (ret) ? INTERNAL_SYSC=
ALL_ERRNO
> (ret) : 0;
> #0  __pthread_kill_implementation (threadid=3D<optimized out>,
> signo=3Dsigno@entry=3D6, no_tid=3Dno_tid@entry=3D0) at pthread_kill.c:44
> #1  0x00007fc04abb7cb3 in __pthread_kill_internal (signo=3D6,
> threadid=3D<optimized out>) at pthread_kill.c:78
> #2  0x00007fc04ab679c6 in __GI_raise (sig=3Dsig@entry=3D6) at
> ../sysdeps/posix/raise.c:26
> #3  0x00007fc04ab517f4 in __GI_abort () at abort.c:79
> #4  0x00007fc04b076bfa in dump_core () at ../../source3/lib/dumpcore.c:33=
8
> #5  0x00007fc04b088661 in smb_panic_s3 (why=3D0x7fc04b311928 "assert fail=
ed:
> share_mode_lock_key_refcount =3D=3D 0") at ../../source3/lib/util.c:713
> #6  0x00007fc04ad7c9a1 in smb_panic (why=3D0x7fc04b311928 "assert failed:
> share_mode_lock_key_refcount =3D=3D 0") at ../../lib/util/fault.c:198
> #7  0x00007fc04b1bfd7a in _share_mode_entry_prepare_lock
> (prepare_state=3D0x7fffa9900f60, id=3D..., servicepath=3D0x565379144e10
> "/home/pfilipen/workspace/projects/samba/2571/st/ad_member/share",
>      smb_fname=3D0x565379162da0, old_write_time=3D0x7fffa9900eb0,
> fn=3D0x7fc04b2145d9 <open_ntcreate_lock_add_entry>,
> private_data=3D0x7fffa9900f60, location=3D0x7fc04b32c0f0
> "../../source3/smbd/open.c:4342")
>      at ../../source3/locking/share_mode_lock.c:3010
> #8  0x00007fc04b215b14 in open_file_ntcreate (conn=3D0x5653790d46b0,
> req=3D0x0, access_mask=3D137, share_access=3D7, create_disposition=3D1,
> create_options=3D0, new_dos_attributes=3D0, oplock_request=3D8, lease=3D0=
x0,
>      private_flags=3D0, parent_dir_fname=3D0x5653790019b0,
> smb_fname_atname=3D0x565379156ec0, pinfo=3D0x7fffa990111c, fsp=3D0x565379=
162bc0)
> at ../../source3/smbd/open.c:4342
> #9  0x00007fc04b21a8c8 in create_file_unixpath (conn=3D0x5653790d46b0,
> req=3D0x0, dirfsp=3D0x56537905a9d0, smb_fname=3D0x5653791497d0, access_ma=
sk=3D137,
> share_access=3D7, create_disposition=3D1, create_options=3D0,
>      file_attributes=3D128, oplock_request=3D8, lease=3D0x0, allocation_s=
ize=3D0,
> private_flags=3D0, sd=3D0x0, ea_list=3D0x0, result=3D0x7fffa99012e0,
> pinfo=3D0x7fffa99012ec) at ../../source3/smbd/open.c:6337
> #10 0x00007fc04b21b4ae in create_file_default (conn=3D0x5653790d46b0,
> req=3D0x0, dirfsp=3D0x56537905a9d0, smb_fname=3D0x5653791497d0, access_ma=
sk=3D137,
> share_access=3D7, create_disposition=3D1, create_options=3D0,
>      file_attributes=3D128, oplock_request=3D0, lease=3D0x0, allocation_s=
ize=3D0,
> private_flags=3D0, sd=3D0x0, ea_list=3D0x0, result=3D0x7fffa9901548,
> pinfo=3D0x7fffa990153c, in_context_blobs=3D0x0, out_context_blobs=3D0x0)
>      at ../../source3/smbd/open.c:6656
> #11 0x00007fc04b1cb932 in vfswrap_create_file (handle=3D0x565379152be0,
> req=3D0x0, dirfsp=3D0x56537905a9d0, smb_fname=3D0x5653791497d0, access_ma=
sk=3D137,
> share_access=3D7, create_disposition=3D1, create_options=3D0,
>      file_attributes=3D128, oplock_request=3D0, lease=3D0x0, allocation_s=
ize=3D0,
> private_flags=3D0, sd=3D0x0, ea_list=3D0x0, result=3D0x7fffa9901548,
> pinfo=3D0x7fffa990153c, in_context_blobs=3D0x0, out_context_blobs=3D0x0)
>      at ../../source3/modules/vfs_default.c:827
> #12 0x00007fc04b227e43 in smb_vfs_call_create_file (handle=3D0x565379152b=
e0,
> req=3D0x0, dirfsp=3D0x56537905a9d0, smb_fname=3D0x5653791497d0, access_ma=
sk=3D137,
> share_access=3D7, create_disposition=3D1, create_options=3D0,
>      file_attributes=3D128, oplock_request=3D0, lease=3D0x0, allocation_s=
ize=3D0,
> private_flags=3D0, sd=3D0x0, ea_list=3D0x0, result=3D0x7fffa9901548,
> pinfo=3D0x7fffa990153c, in_context_blobs=3D0x0, out_context_blobs=3D0x0)
>      at ../../source3/smbd/vfs.c:1576
> #13 0x00007fc04b1e4b77 in copy_internals (ctx=3D0x5653790e1330,
> conn=3D0x5653790d46b0, req=3D0x0, src_dirfsp=3D0x56537905a9d0,
> smb_fname_src=3D0x5653791497d0, dst_dirfsp=3D0x5653790d4aa0,
> smb_fname_dst=3D0x565379162700,
>      attrs=3D6) at ../../source3/smbd/smb2_nttrans.c:248
> #14 0x00007fc0365e4060 in copy_reg (handle=3D0x565379148050,
> srcfsp=3D0x56537905a9d0, source=3D0x565379155650, dstfsp=3D0x5653790d4aa0=
,
> dest=3D0x5653790e28e0) at ../../source3/modules/vfs_crossrename.c:115
> #15 0x00007fc0365e41aa in crossrename_renameat (handle=3D0x565379148050,
> srcfsp=3D0x56537905a9d0, smb_fname_src=3D0x565379155650, dstfsp=3D0x56537=
90d4aa0,
> smb_fname_dst=3D0x5653790e28e0)
>      at ../../source3/modules/vfs_crossrename.c:166
> #16 0x00007fc04b228c91 in smb_vfs_call_renameat (handle=3D0x565379148050,
> srcfsp=3D0x56537905a9d0, smb_fname_src=3D0x565379155650, dstfsp=3D0x56537=
90d4aa0,
> smb_fname_dst=3D0x5653790e28e0) at ../../source3/smbd/vfs.c:1775
> #17 0x00007fc0365ded2f in recycle_unlink_internal (handle=3D0x56537914868=
0,
> dirfsp=3D0x56537905a9d0, smb_fname=3D0x565379155650, flags=3D0) at
> ../../source3/modules/vfs_recycle.c:690
> #18 0x00007fc0365defaa in recycle_unlinkat (handle=3D0x565379148680,
> dirfsp=3D0x56537905a9d0, smb_fname=3D0x565379155650, flags=3D0) at
> ../../source3/modules/vfs_recycle.c:735
> #19 0x00007fc04b2296fe in smb_vfs_call_unlinkat (handle=3D0x565379148680,
> dirfsp=3D0x56537905a9d0, smb_fname=3D0x565379155650, flags=3D0) at
> ../../source3/smbd/vfs.c:1932
> #20 0x00007fc04b21d106 in close_remove_share_mode (fsp=3D0x565379152c80,
> close_type=3DNORMAL_CLOSE) at ../../source3/smbd/close.c:581
> #21 0x00007fc04b21dcf2 in close_normal_file (req=3D0x5653790ce430,
> fsp=3D0x565379152c80, close_type=3DNORMAL_CLOSE) at
> ../../source3/smbd/close.c:910
> #22 0x00007fc04b22061c in close_file_smb (req=3D0x5653790ce430,
> fsp=3D0x565379152c80, close_type=3DNORMAL_CLOSE) at
> ../../source3/smbd/close.c:1663
>
>
> The cause of the panic is  "assert failed: share_mode_lock_key_refcount =
=3D=3D
> 0" in source3/locking/share_mode_lock.c:3010
> The share_mode_lock_key_refcount is already 1, the first reference is
> taken here:
>
> Hardware watchpoint 2: share_mode_lock_key_refcount
> Old value =3D 0
> New value =3D 1
> get_share_mode_lock_internal (id=3D..., servicepath=3D0x0, smb_fname=3D0x=
0,
> old_write_time=3D0x0, lck=3D0x7fffa9901980) at
> ../../source3/locking/share_mode_lock.c:972
> 972=C2=BB=C2=BB=C2=B7=C2=B7=C2=B7if (static_share_mode_data !=3D NULL) {
> #0  get_share_mode_lock_internal (id=3D..., servicepath=3D0x0, smb_fname=
=3D0x0,
> old_write_time=3D0x0, lck=3D0x7fffa9901980) at
> ../../source3/locking/share_mode_lock.c:972
> #1  0x00007fc04b1bfa24 in share_mode_entry_prepare_lock_fn
> (glck=3D0x7fffa9901190, cb_private=3D0x7fffa9901760) at
> ../../source3/locking/share_mode_lock.c:2952
> #2  0x00007fc04b05c7d2 in g_lock_lock_cb_run_and_store
> (cb_state=3D0x7fffa9901190) at ../../source3/lib/g_lock.c:597
> #3  0x00007fc04b05e8c1 in g_lock_lock_simple_fn (rec=3D0x7fffa99014a0,
> value=3D..., private_data=3D0x7fffa9901630) at ../../source3/lib/g_lock.c=
:1212
> #4  0x00007fc04b05833d in dbwrap_watched_do_locked_fn
> (backend_rec=3D0x7fffa9901350, backend_value=3D...,
> private_data=3D0x7fffa9901470) at ../../source3/lib/dbwrap/dbwrap_watch.c=
:458
> #5  0x00007fc04aa33e44 in db_tdb_do_locked (db=3D0x5653790ca050, key=3D..=
.,
> fn=3D0x7fc04b0582ab <dbwrap_watched_do_locked_fn>,
> private_data=3D0x7fffa9901470) at ../../lib/dbwrap/dbwrap_tdb.c:208
> #6  0x00007fc04aa304db in dbwrap_do_locked (db=3D0x5653790ca050, key=3D..=
.,
> fn=3D0x7fc04b0582ab <dbwrap_watched_do_locked_fn>,
> private_data=3D0x7fffa9901470) at ../../lib/dbwrap/dbwrap.c:553
> #7  0x00007fc04b058435 in dbwrap_watched_do_locked (db=3D0x5653790cf910,
> key=3D..., fn=3D0x7fc04b05e4fa <g_lock_lock_simple_fn>,
> private_data=3D0x7fffa9901630) at ../../source3/lib/dbwrap/dbwrap_watch.c=
:480
> #8  0x00007fc04aa304db in dbwrap_do_locked (db=3D0x5653790cf910, key=3D..=
.,
> fn=3D0x7fc04b05e4fa <g_lock_lock_simple_fn>, private_data=3D0x7fffa990163=
0) at
> ../../lib/dbwrap/dbwrap.c:553
> #9  0x00007fc04b05eb28 in g_lock_lock (ctx=3D0x565379020280, key=3D...,
> type=3DG_LOCK_WRITE, timeout=3D..., cb_fn=3D0x7fc04b1bf90d
> <share_mode_entry_prepare_lock_fn>, cb_private=3D0x7fffa9901760) at
> ../../source3/lib/g_loc=E2=80=A6
> #10 0x00007fc04b1bfe1c in _share_mode_entry_prepare_lock
> (prepare_state=3D0x7fffa9901960, id=3D..., servicepath=3D0x0, smb_fname=
=3D0x0,
> old_write_time=3D0x0, fn=3D0x7fc04b21c0b5 <close_share_mode_lock_prepare>=
,
> private_dat=E2=80=A6
> #11 0x00007fc04b21c99b in close_remove_share_mode (fsp=3D0x565379152c80,
> close_type=3DNORMAL_CLOSE) at ../../source3/smbd/close.c:451
> #12 0x00007fc04b21dcf2 in close_normal_file (req=3D0x5653790ce430,
> fsp=3D0x565379152c80, close_type=3DNORMAL_CLOSE) at
> ../../source3/smbd/close.c:910
> #13 0x00007fc04b22061c in close_file_smb (req=3D0x5653790ce430,
> fsp=3D0x565379152c80, close_type=3DNORMAL_CLOSE) at
> ../../source3/smbd/close.c:1663
>
>
> So the issue comes from the logic in close_remove_share_mode()
>
> static NTSTATUS close_remove_share_mode(files_struct *fsp, enum
> file_close_type close_type)
> {
>         status =3D
> share_mode_entry_prepare_lock_del(&lck_state.prepare_state,
>
>         ret =3D SMB_VFS_UNLINKAT(conn,
>
>         ulstatus =3D
> share_mode_entry_prepare_unlock(&lck_state.prepare_state,
> }
>
> Each process can hold just one share_mode_lock_key_refcount, but here we
> have two nested calls, both grabbing share_mode_lock_key_refcount:
> 1. share_mode_entry_prepare_lock_del()
> 2. SMB_VFS_UNLINKAT() -> recycle_unlink_internal() ->
> crossrename_renameat() -> open_file_ntcreate() ->
> _share_mode_entry_prepare_lock()
>
>
>
> How this should be fixed? Can we remove the assert and allow to grab the
> share_mode_lock_key_refcount
>   again give the owner is the process itself?
>
>
> Thanks,
> Pavel
>

Perhaps instead of layering the recyclebin over vfs_crossrename, we should
generate separate recyclebins at filesystem mountpoints when the SMB
share contains nested ones?

This would preserve atomicity of the rename operation and would avoid
exposing users to limits of vfs_crossrename (e.g. purging of files that
exceed the cross-rename limit -- which is a pretty significant POLA
violation).

If we want to go this route, I can make a merge request to add it (since I
already have POC code to do this).

Andrew
