Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8275F6997
	for <lists+samba-technical@lfdr.de>; Thu,  6 Oct 2022 16:28:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=4fZ+8pLWWMuJ0lknqrolwTc48e+ehB/PNtee7iY3Oio=; b=562KwyQ1nSPc/rtGvBMl+OtdAi
	B+3FEHXTe+6whdozqn5J0OYjG9Zvz9TLwMA7oGT1PuVArqL/BrEdEZ7g2pfGqjV68guZGT1Ux0Ph6
	tHj6jm/1QTYTtSOkXBKb1iXJ03J1qWJO2r2B+Z/FoYrzAl58527ryoTJeaRCr5Iru64SANBjZg9OT
	ODaAl3LZXTRYgspDbIEKkBH1Z8wlRcQu+OtB29Xn3zRXnhLVIJzItF3FU32+947rM/4TG2q19kuYL
	vVRRWbqZEDYQNsAeNiHNkSb0Dh4QQlLs7+0/xPWV0VTzOTysYcwNpPnu72jbWeu7Kan+fPO5V2quE
	3HmG4JPQ==;
Received: from ip6-localhost ([::1]:24792 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ogRqP-000DZA-4y; Thu, 06 Oct 2022 14:27:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29072) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ogRqJ-000DZ0-EJ
 for samba-technical@lists.samba.org; Thu, 06 Oct 2022 14:27:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=Lq03AUeiAZb2bA3wD2dCBlGFtei532Cja1F2hu+Fgrs=; b=uUEWycaCa+PMULsQMW9aauY8BH
 Dd7U/r4bo7cFKNOvLPnPFocVKDlZt6gEiPJwmqo+cQxykoip6+c8WRPMwR230VBikX/2Af/hz/kvP
 UBELiz1i0HEnxEajIQolBOFjq8F38+AuSbGcPp+iiRfedhHJGR7bwyaZKXHZ0ramompl7euPg1dcK
 CWCF4yVnfcH9DnV/aWmiEJEetBzUre7tsyVp3eKF2D7NW5sL9lWDi0hUsKp8eSVjdhZ3X1LMubiqJ
 txS/h3UrkWEfPBGLsHIM9lUWHcvpgt502rZCQgPcaqa3hrdvbDIc8BeLOklQOHiO1/6GQxoJrbwXQ
 CvhZZHhQ4Lnda00FqPi/qyVeETCQxaj3FoEa6U4wPbUnATvOVln8FIZhJh+PD7WyQm8rVFzL8qTxp
 CUsgQYL3Z4/xGPHqDDjHUmif84UE0lUsqiyQigjpo7WVnKmtAQRneZsaASZ39YFYBuY7dQsM+T5l8
 rFxpEBFhEkTj3PqmUrh8Ef30;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ogRqI-003FdV-It
 for samba-technical@lists.samba.org; Thu, 06 Oct 2022 14:27:18 +0000
Message-ID: <8fbdc4c2-09db-3032-38c4-1608aae5e7f9@samba.org>
Date: Thu, 6 Oct 2022 16:27:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: samba-technical@lists.samba.org
Subject: vfs_crossrename not working in samba-4.15.*
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
From: =?utf-8?q?Pavel_Filipensk=C3=BD_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Pavel_Filipensk=c3=bd?= <pfilipensky@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

I am working on a fix for RH bugzillahttps://bugzilla.redhat.com/show_bug.cgi?id=2125339

If the share is using vfs_recycle and vfs_crossrename modules and the recycle repo is on a different filesystem, like here:

vfs objects = recycle crossrename
recycle:repository = /different_filesystem/

The deleted file should be moved to /different_filesystem/recycle, but it fails. Since this is a different fs, we cannot use

rename("File", "/different_filesystem/recycle/File")

but instead samba code uses two syscalls:

unlink("/different_filesystem/recycle/File")
openat(AT_FDCWD, "/different_filesystem/recycle/File", O_CREAT, 0600)

Normally, the destination file "/different_filesystem/recycle/File" does not exist and unlink() fails with ENOENT. This is correctly handled in samba-4.12:


  51 static int copy_reg(const char *source, const char *dest)
  52 {
...
  76 »···if (unlink (dest) && errno != ENOENT) {
  77 »···»···close(ifd);
  78 »···»···return -1;
  79 »···}

But newer versions of samba miss the check for ENOENT and the operation fails, doing map_nt_error_from_unix(errno). I have tried to the same fix, and added to copy_reg() this:

-       if (ret == -1) {
+       if (ret == -1 && errno != ENOENT) {
                 status = map_nt_error_from_unix(errno);
                 goto out;
         }

Unfortunately, it does not work. It causes this panic:



Program received signal SIGABRT, Aborted.
__pthread_kill_implementation (threadid=<optimized out>, signo=signo@entry=6, no_tid=no_tid@entry=0) at pthread_kill.c:44
44»·      return INTERNAL_SYSCALL_ERROR_P (ret) ? INTERNAL_SYSCALL_ERRNO (ret) : 0;
#0  __pthread_kill_implementation (threadid=<optimized out>, signo=signo@entry=6, no_tid=no_tid@entry=0) at pthread_kill.c:44
#1  0x00007fc04abb7cb3 in __pthread_kill_internal (signo=6, threadid=<optimized out>) at pthread_kill.c:78
#2  0x00007fc04ab679c6 in __GI_raise (sig=sig@entry=6) at ../sysdeps/posix/raise.c:26
#3  0x00007fc04ab517f4 in __GI_abort () at abort.c:79
#4  0x00007fc04b076bfa in dump_core () at ../../source3/lib/dumpcore.c:338
#5  0x00007fc04b088661 in smb_panic_s3 (why=0x7fc04b311928 "assert failed: share_mode_lock_key_refcount == 0") at ../../source3/lib/util.c:713
#6  0x00007fc04ad7c9a1 in smb_panic (why=0x7fc04b311928 "assert failed: share_mode_lock_key_refcount == 0") at ../../lib/util/fault.c:198
#7  0x00007fc04b1bfd7a in _share_mode_entry_prepare_lock (prepare_state=0x7fffa9900f60, id=..., servicepath=0x565379144e10 "/home/pfilipen/workspace/projects/samba/2571/st/ad_member/share",
     smb_fname=0x565379162da0, old_write_time=0x7fffa9900eb0, fn=0x7fc04b2145d9 <open_ntcreate_lock_add_entry>, private_data=0x7fffa9900f60, location=0x7fc04b32c0f0 "../../source3/smbd/open.c:4342")
     at ../../source3/locking/share_mode_lock.c:3010
#8  0x00007fc04b215b14 in open_file_ntcreate (conn=0x5653790d46b0, req=0x0, access_mask=137, share_access=7, create_disposition=1, create_options=0, new_dos_attributes=0, oplock_request=8, lease=0x0,
     private_flags=0, parent_dir_fname=0x5653790019b0, smb_fname_atname=0x565379156ec0, pinfo=0x7fffa990111c, fsp=0x565379162bc0) at ../../source3/smbd/open.c:4342
#9  0x00007fc04b21a8c8 in create_file_unixpath (conn=0x5653790d46b0, req=0x0, dirfsp=0x56537905a9d0, smb_fname=0x5653791497d0, access_mask=137, share_access=7, create_disposition=1, create_options=0,
     file_attributes=128, oplock_request=8, lease=0x0, allocation_size=0, private_flags=0, sd=0x0, ea_list=0x0, result=0x7fffa99012e0, pinfo=0x7fffa99012ec) at ../../source3/smbd/open.c:6337
#10 0x00007fc04b21b4ae in create_file_default (conn=0x5653790d46b0, req=0x0, dirfsp=0x56537905a9d0, smb_fname=0x5653791497d0, access_mask=137, share_access=7, create_disposition=1, create_options=0,
     file_attributes=128, oplock_request=0, lease=0x0, allocation_size=0, private_flags=0, sd=0x0, ea_list=0x0, result=0x7fffa9901548, pinfo=0x7fffa990153c, in_context_blobs=0x0, out_context_blobs=0x0)
     at ../../source3/smbd/open.c:6656
#11 0x00007fc04b1cb932 in vfswrap_create_file (handle=0x565379152be0, req=0x0, dirfsp=0x56537905a9d0, smb_fname=0x5653791497d0, access_mask=137, share_access=7, create_disposition=1, create_options=0,
     file_attributes=128, oplock_request=0, lease=0x0, allocation_size=0, private_flags=0, sd=0x0, ea_list=0x0, result=0x7fffa9901548, pinfo=0x7fffa990153c, in_context_blobs=0x0, out_context_blobs=0x0)
     at ../../source3/modules/vfs_default.c:827
#12 0x00007fc04b227e43 in smb_vfs_call_create_file (handle=0x565379152be0, req=0x0, dirfsp=0x56537905a9d0, smb_fname=0x5653791497d0, access_mask=137, share_access=7, create_disposition=1, create_options=0,
     file_attributes=128, oplock_request=0, lease=0x0, allocation_size=0, private_flags=0, sd=0x0, ea_list=0x0, result=0x7fffa9901548, pinfo=0x7fffa990153c, in_context_blobs=0x0, out_context_blobs=0x0)
     at ../../source3/smbd/vfs.c:1576
#13 0x00007fc04b1e4b77 in copy_internals (ctx=0x5653790e1330, conn=0x5653790d46b0, req=0x0, src_dirfsp=0x56537905a9d0, smb_fname_src=0x5653791497d0, dst_dirfsp=0x5653790d4aa0, smb_fname_dst=0x565379162700,
     attrs=6) at ../../source3/smbd/smb2_nttrans.c:248
#14 0x00007fc0365e4060 in copy_reg (handle=0x565379148050, srcfsp=0x56537905a9d0, source=0x565379155650, dstfsp=0x5653790d4aa0, dest=0x5653790e28e0) at ../../source3/modules/vfs_crossrename.c:115
#15 0x00007fc0365e41aa in crossrename_renameat (handle=0x565379148050, srcfsp=0x56537905a9d0, smb_fname_src=0x565379155650, dstfsp=0x5653790d4aa0, smb_fname_dst=0x5653790e28e0)
     at ../../source3/modules/vfs_crossrename.c:166
#16 0x00007fc04b228c91 in smb_vfs_call_renameat (handle=0x565379148050, srcfsp=0x56537905a9d0, smb_fname_src=0x565379155650, dstfsp=0x5653790d4aa0, smb_fname_dst=0x5653790e28e0) at ../../source3/smbd/vfs.c:1775
#17 0x00007fc0365ded2f in recycle_unlink_internal (handle=0x565379148680, dirfsp=0x56537905a9d0, smb_fname=0x565379155650, flags=0) at ../../source3/modules/vfs_recycle.c:690
#18 0x00007fc0365defaa in recycle_unlinkat (handle=0x565379148680, dirfsp=0x56537905a9d0, smb_fname=0x565379155650, flags=0) at ../../source3/modules/vfs_recycle.c:735
#19 0x00007fc04b2296fe in smb_vfs_call_unlinkat (handle=0x565379148680, dirfsp=0x56537905a9d0, smb_fname=0x565379155650, flags=0) at ../../source3/smbd/vfs.c:1932
#20 0x00007fc04b21d106 in close_remove_share_mode (fsp=0x565379152c80, close_type=NORMAL_CLOSE) at ../../source3/smbd/close.c:581
#21 0x00007fc04b21dcf2 in close_normal_file (req=0x5653790ce430, fsp=0x565379152c80, close_type=NORMAL_CLOSE) at ../../source3/smbd/close.c:910
#22 0x00007fc04b22061c in close_file_smb (req=0x5653790ce430, fsp=0x565379152c80, close_type=NORMAL_CLOSE) at ../../source3/smbd/close.c:1663


The cause of the panic is  "assert failed: share_mode_lock_key_refcount == 0" in source3/locking/share_mode_lock.c:3010
The share_mode_lock_key_refcount is already 1, the first reference is taken here:

Hardware watchpoint 2: share_mode_lock_key_refcount
Old value = 0
New value = 1
get_share_mode_lock_internal (id=..., servicepath=0x0, smb_fname=0x0, old_write_time=0x0, lck=0x7fffa9901980) at ../../source3/locking/share_mode_lock.c:972
972»»···if (static_share_mode_data != NULL) {
#0  get_share_mode_lock_internal (id=..., servicepath=0x0, smb_fname=0x0, old_write_time=0x0, lck=0x7fffa9901980) at ../../source3/locking/share_mode_lock.c:972
#1  0x00007fc04b1bfa24 in share_mode_entry_prepare_lock_fn (glck=0x7fffa9901190, cb_private=0x7fffa9901760) at ../../source3/locking/share_mode_lock.c:2952
#2  0x00007fc04b05c7d2 in g_lock_lock_cb_run_and_store (cb_state=0x7fffa9901190) at ../../source3/lib/g_lock.c:597
#3  0x00007fc04b05e8c1 in g_lock_lock_simple_fn (rec=0x7fffa99014a0, value=..., private_data=0x7fffa9901630) at ../../source3/lib/g_lock.c:1212
#4  0x00007fc04b05833d in dbwrap_watched_do_locked_fn (backend_rec=0x7fffa9901350, backend_value=..., private_data=0x7fffa9901470) at ../../source3/lib/dbwrap/dbwrap_watch.c:458
#5  0x00007fc04aa33e44 in db_tdb_do_locked (db=0x5653790ca050, key=..., fn=0x7fc04b0582ab <dbwrap_watched_do_locked_fn>, private_data=0x7fffa9901470) at ../../lib/dbwrap/dbwrap_tdb.c:208
#6  0x00007fc04aa304db in dbwrap_do_locked (db=0x5653790ca050, key=..., fn=0x7fc04b0582ab <dbwrap_watched_do_locked_fn>, private_data=0x7fffa9901470) at ../../lib/dbwrap/dbwrap.c:553
#7  0x00007fc04b058435 in dbwrap_watched_do_locked (db=0x5653790cf910, key=..., fn=0x7fc04b05e4fa <g_lock_lock_simple_fn>, private_data=0x7fffa9901630) at ../../source3/lib/dbwrap/dbwrap_watch.c:480
#8  0x00007fc04aa304db in dbwrap_do_locked (db=0x5653790cf910, key=..., fn=0x7fc04b05e4fa <g_lock_lock_simple_fn>, private_data=0x7fffa9901630) at ../../lib/dbwrap/dbwrap.c:553
#9  0x00007fc04b05eb28 in g_lock_lock (ctx=0x565379020280, key=..., type=G_LOCK_WRITE, timeout=..., cb_fn=0x7fc04b1bf90d <share_mode_entry_prepare_lock_fn>, cb_private=0x7fffa9901760) at ../../source3/lib/g_loc…
#10 0x00007fc04b1bfe1c in _share_mode_entry_prepare_lock (prepare_state=0x7fffa9901960, id=..., servicepath=0x0, smb_fname=0x0, old_write_time=0x0, fn=0x7fc04b21c0b5 <close_share_mode_lock_prepare>, private_dat…
#11 0x00007fc04b21c99b in close_remove_share_mode (fsp=0x565379152c80, close_type=NORMAL_CLOSE) at ../../source3/smbd/close.c:451
#12 0x00007fc04b21dcf2 in close_normal_file (req=0x5653790ce430, fsp=0x565379152c80, close_type=NORMAL_CLOSE) at ../../source3/smbd/close.c:910
#13 0x00007fc04b22061c in close_file_smb (req=0x5653790ce430, fsp=0x565379152c80, close_type=NORMAL_CLOSE) at ../../source3/smbd/close.c:1663


So the issue comes from the logic in close_remove_share_mode()

static NTSTATUS close_remove_share_mode(files_struct *fsp, enum file_close_type close_type)
{
	status = share_mode_entry_prepare_lock_del(&lck_state.prepare_state,
                                                                               
	ret = SMB_VFS_UNLINKAT(conn,
                                                                           
	ulstatus = share_mode_entry_prepare_unlock(&lck_state.prepare_state,
}

Each process can hold just one share_mode_lock_key_refcount, but here we have two nested calls, both grabbing share_mode_lock_key_refcount:
1. share_mode_entry_prepare_lock_del()
2. SMB_VFS_UNLINKAT() -> recycle_unlink_internal() -> crossrename_renameat() -> open_file_ntcreate() -> _share_mode_entry_prepare_lock()



How this should be fixed? Can we remove the assert and allow to grab the share_mode_lock_key_refcount
  again give the owner is the process itself?


Thanks,
Pavel
