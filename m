Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E465F78F9
	for <lists+samba-technical@lfdr.de>; Fri,  7 Oct 2022 15:29:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=qvAhoeRD4H6Dd42wd1jKyi0U2Y7IOxXkL9ckn1SNCLk=; b=DNXbDrrrlYdQjhjBqdUTs+U9kL
	k1uH+srkF4q1m3UnCX05Gce7TPswU2dXTOLlWqQeIcrt1uXVPHXVHIzlLJkOAY6b8fI5BoZkg5CBE
	LtaoyGfrmmto/Mn9gb/P/W7aSYmlI9yzBb9QcsOVM1ZBV03pbmYoHKu3HE0J2zkNPmqF+qWj/t8qf
	ddjS6NJN1RjxhZ/mgigbSAzM6hrd+m3PYmfs6ZhT/z8crQ9fNAVlR3/vgU71XhCcdWNmPJT4ITd3W
	5ecUpQNGkw7BKCD8lFPzWgPhudA8yQyl+6Z7YESOZMNZf4UQsUVLGpt8deMetEMxn4DrfDlUmQcQM
	B+D+8A8Q==;
Received: from ip6-localhost ([::1]:63966 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ognP2-000Wmg-KH; Fri, 07 Oct 2022 13:28:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17760) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ognOv-000WmM-7d
 for samba-technical@lists.samba.org; Fri, 07 Oct 2022 13:28:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=qvAhoeRD4H6Dd42wd1jKyi0U2Y7IOxXkL9ckn1SNCLk=; b=Z5/P3II+go0Wms1JLYN/XCrt0n
 W9Bn/G7cbR2AT3LT8wIunkr1PxsSYZM733FZrwAiJxUsNty25MPxtX78gz1GkNA+R2uhQcsGJ0oo8
 6fkWheNknP9E90n2pKqGz5LCfFMzHNQUtJhzF2QspbBkMacITb0CD4HfJXnPDP+y3d58dJYf4jluK
 w7cCwfodZGPJeRfop7pb6u48GBt32LhOdUv0Pmh0KUadV4uXP/YNKCy6Rn1i6mby49oEdwvolYsI1
 5GI4Esz68GtCeJJ2fhlcn2Ich6UtyQBPxQ8WtG4vhX4yP3jDJic11nUlQKUo/ofnQnb4EKE+ZqQRS
 WjgJ4odccFw7ZH+V03telnOS8DS0tuwMgavC5sEGQAUmuGgSDGKbfkpYgDDHt0etCqjKbfCEESqVW
 L6dKWKC5ISpmVdyG7bAG9RQgHy4rnuzeI/597mEsDCfj9muYH2KuIZDdCZUj7OG1Er3zCUlJ8t5kL
 c1K7YYO3JQa5+eyCDW9n91nt;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ognOu-003OBT-Fp; Fri, 07 Oct 2022 13:28:28 +0000
Message-ID: <a27d14e4-ba5d-901a-60b9-2e2b7c7350ca@samba.org>
Date: Fri, 7 Oct 2022 15:28:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: vfs_crossrename not working in samba-4.15.*
Content-Language: en-US
To: Jeremy Allison <jra@samba.org>, Andrew Walker <awalker@ixsystems.com>
References: <8fbdc4c2-09db-3032-38c4-1608aae5e7f9@samba.org>
 <CAB5c7xrru41LZs76Qy9wdT6gXbWkWsEi9oyzKMY_Ux_eqw+LgQ@mail.gmail.com>
 <Yz8WfqhSldLLC7RX@jeremy-acer>
In-Reply-To: <Yz8WfqhSldLLC7RX@jeremy-acer>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: =?utf-8?q?Pavel_Filipensk=C3=BD_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Pavel_Filipensk=c3=bd?= <pfilipensky@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Actually, the issue is present even without vfs_recycle - i.e. the 
vfs_crossrename does not work if the rename is across filesystems.
And the root cause is almost the same:
1) source3/modules/vfs_crossrename.c:  copy_reg() is missing ENOENT  check

2) Adding if (ret == -1 && errno != ENOENT)

to copy_reg() causes the exact panic - "assert failed: 
share_mode_lock_key_refcount == 0"


The only difference is that with recycle module, the initial grab of 
share_mode_lock_key_refcount was done here:


Old value = 0
New value = 1
get_share_mode_lock_internal (id=..., servicepath=0x0, smb_fname=0x0, 
old_write_time=0x0, lck=0x7fffa9901980) at 
../../source3/locking/share_mode_lock.c:972
972        if (static_share_mode_data != NULL) {
#0  get_share_mode_lock_internal (id=..., servicepath=0x0, 
smb_fname=0x0, old_write_time=0x0, lck=0x7fffa9901980) at 
../../source3/locking/share_mode_lock.c:972
#1  0x00007fc04b1bfa24 in share_mode_entry_prepare_lock_fn 
(glck=0x7fffa9901190, cb_private=0x7fffa9901760) at 
../../source3/locking/share_mode_lock.c:2952
#2  0x00007fc04b05c7d2 in g_lock_lock_cb_run_and_store 
(cb_state=0x7fffa9901190) at ../../source3/lib/g_lock.c:597
#3  0x00007fc04b05e8c1 in g_lock_lock_simple_fn (rec=0x7fffa99014a0, 
value=..., private_data=0x7fffa9901630) at ../../source3/lib/g_lock.c:1212
#4  0x00007fc04b05833d in dbwrap_watched_do_locked_fn 
(backend_rec=0x7fffa9901350, backend_value=..., 
private_data=0x7fffa9901470) at ../../source3/lib/dbwrap/dbwrap_watch.c:458
#5  0x00007fc04aa33e44 in db_tdb_do_locked (db=0x5653790ca050, key=..., 
fn=0x7fc04b0582ab <dbwrap_watched_do_locked_fn>, 
private_data=0x7fffa9901470) at ../../lib/dbwrap/dbwrap_tdb.c:208
#6  0x00007fc04aa304db in dbwrap_do_locked (db=0x5653790ca050, key=..., 
fn=0x7fc04b0582ab <dbwrap_watched_do_locked_fn>, 
private_data=0x7fffa9901470) at ../../lib/dbwrap/dbwrap.c:553
#7  0x00007fc04b058435 in dbwrap_watched_do_locked (db=0x5653790cf910, 
key=..., fn=0x7fc04b05e4fa <g_lock_lock_simple_fn>, 
private_data=0x7fffa9901630) at ../../source3/lib/dbwrap/dbwrap_watch.c:480
#8  0x00007fc04aa304db in dbwrap_do_locked (db=0x5653790cf910, key=..., 
fn=0x7fc04b05e4fa <g_lock_lock_simple_fn>, private_data=0x7fffa9901630) 
at ../../lib/dbwrap/dbwrap.c:553
#9  0x00007fc04b05eb28 in g_lock_lock (ctx=0x565379020280, key=..., 
type=G_LOCK_WRITE, timeout=..., cb_fn=0x7fc04b1bf90d 
<share_mode_entry_prepare_lock_fn>, cb_private=0x7fffa9901760) at 
../../source3/lib/g_lock.c:1267
#10 0x00007fc04b1bfe1c in _share_mode_entry_prepare_lock 
(prepare_state=0x7fffa9901960, id=..., servicepath=0x0, smb_fname=0x0, 
old_write_time=0x0, fn=0x7fc04b21c0b5 <close_share_mode_lock_prepare>, 
private_data=0x7fffa9901960, location=0x7fc04b32e5a8 
"../../source3/smbd/close.c:451") at 
../../source3/locking/share_mode_lock.c:3022
#11 0x00007fc04b21c99b in close_remove_share_mode (fsp=0x565379152c80, 
close_type=NORMAL_CLOSE) at ../../source3/smbd/close.c:451
#12 0x00007fc04b21dcf2 in close_normal_file (req=0x5653790ce430, 
fsp=0x565379152c80, close_type=NORMAL_CLOSE) at 
../../source3/smbd/close.c:910
#13 0x00007fc04b22061c in close_file_smb (req=0x5653790ce430, 
fsp=0x565379152c80, close_type=NORMAL_CLOSE) at 
../../source3/smbd/close.c:1663
#14 0x00007fc04b270e67 in smbd_smb2_close (req=0x5653790964c0, 
_fsp=0x5653790bbd08, in_flags=0, out_flags=0x5653790bbd12, 
out_creation_ts=0x5653790bbd18, out_last_access_ts=0x5653790bbd28, 
out_last_write_ts=0x5653790bbd38, out_change_ts=0x5653790bbd48, 
out_allocation_size=0x5653790bbd58, out_end_of_file=0x5653790bbd60, 
out_file_attributes=0x5653790bbd68) at ../../source3/smbd/smb2_close.c:224
#15 0x00007fc04b271214 in smbd_smb2_close_send (mem_ctx=0x5653790964c0, 
ev=0x565379019a60, smb2req=0x5653790964c0, in_fsp=0x565379152c80, 
in_flags=0) at ../../source3/smbd/smb2_close.c:335
#16 0x00007fc04b2705fb in smbd_smb2_request_process_close 
(req=0x5653790964c0) at ../../source3/smbd/smb2_close.c:72
#17 0x00007fc04b25c567 in smbd_smb2_request_dispatch 
(req=0x5653790964c0) at ../../source3/smbd/smb2_server.c:3405

while without vfs_recycle() it is like this:


Hardware watchpoint 2: share_mode_lock_key_refcount

Old value = 0
New value = 1
get_share_mode_lock_internal (id=..., servicepath=0x0, smb_fname=0x0, 
old_write_time=0x0, lck=0x561513496800) at 
../../source3/locking/share_mode_lock.c:972
972        if (static_share_mode_data != NULL) {
(gdb) bt
#0  get_share_mode_lock_internal (id=..., servicepath=0x0, 
smb_fname=0x0, old_write_time=0x0, lck=0x561513496800) at 
../../source3/locking/share_mode_lock.c:972
#1  0x00007f294011e921 in get_existing_share_mode_lock 
(mem_ctx=0x561513499000, id=...) at 
../../source3/locking/share_mode_lock.c:1084
#2  0x00007f29401ea153 in smbd_smb2_setinfo_send 
(mem_ctx=0x561513499000, ev=0x56151335da60, smb2req=0x561513499000, 
fsp=0x56151348bac0, in_info_type=1 '\001', in_file_info_class=10 '\n', 
in_input_buffer=...,
     in_additional_information=0) at ../../source3/smbd/smb2_setinfo.c:482
#3  0x00007f29401e9202 in smbd_smb2_request_process_setinfo 
(req=0x561513499000) at ../../source3/smbd/smb2_setinfo.c:112
#4  0x00007f29401c1b96 in smbd_smb2_request_dispatch 
(req=0x561513499000) at ../../source3/smbd/smb2_server.c:3482


Hardware watchpoint 2: share_mode_lock_key_refcount

Old value = 1
New value = 2
get_share_mode_lock_internal (id=..., servicepath=0x0, smb_fname=0x0, 
old_write_time=0x0, lck=0x7ffe5b82bc10) at 
../../source3/locking/share_mode_lock.c:972
972        if (static_share_mode_data != NULL) {
(gdb) bt
#0  get_share_mode_lock_internal (id=..., servicepath=0x0, 
smb_fname=0x0, old_write_time=0x0, lck=0x7ffe5b82bc10) at 
../../source3/locking/share_mode_lock.c:972
#1  0x00007f294012435b in share_mode_do_locked_vfs_denied_fn (glck=0x0, 
cb_private=0x7ffe5b82bcb0) at ../../source3/locking/share_mode_lock.c:2793
#2  0x00007f294012470f in _share_mode_do_locked_vfs_denied (id=..., 
fn=0x7f2940113b7b <file_has_open_streams_locked>, 
private_data=0x7ffe5b82bd3e, location=0x7f2940270798 
"../../source3/locking/locking.c:1259")
     at ../../source3/locking/share_mode_lock.c:2875
#3  0x00007f2940113c0f in file_has_open_streams (fsp=0x56151348bac0) at 
../../source3/locking/locking.c:1259
#4  0x00007f294014ed2f in rename_internals_fsp (conn=0x5615134184d0, 
fsp=0x56151348bac0, dst_dirfsp=0x0, smb_fname_dst_in=0x5615134262d0, 
dst_original_lcomp=0x561513426470 "QQQ08b", attrs=6,
     replace_if_exists=false) at ../../source3/smbd/smb2_reply.c:1437
#5  0x00007f2940163be8 in smb2_file_rename_information 
(conn=0x5615134184d0, req=0x56151341cbe0, pdata=0x5615134a8530 "", 
total_data=40, fsp=0x56151348bac0, smb_fname_src=0x561513496a10)
     at ../../source3/smbd/smb2_trans2.c:5042
#6  0x00007f2940167fe5 in smbd_do_setfilepathinfo (conn=0x5615134184d0, 
req=0x56151341cbe0, mem_ctx=0x56151348e100, info_level=65290, 
fsp=0x56151348bac0, smb_fname=0x561513496a10, ppdata=0x7ffe5b82c0c8,
     total_data=40, ret_data_size=0x7ffe5b82c0c4) at 
../../source3/smbd/smb2_trans2.c:6990
#7  0x00007f29401ea2dc in smbd_smb2_setinfo_send 
(mem_ctx=0x561513499000, ev=0x56151335da60, smb2req=0x561513499000, 
fsp=0x56151348bac0, in_info_type=1 '\001', in_file_info_class=10 '\n', 
in_input_buffer=...,
     in_additional_information=0) at ../../source3/smbd/smb2_setinfo.c:513
#8  0x00007f29401e9202 in smbd_smb2_request_process_setinfo 
(req=0x561513499000) at ../../source3/smbd/smb2_setinfo.c:112
#9  0x00007f29401c1b96 in smbd_smb2_request_dispatch 
(req=0x561513499000) at ../../source3/smbd/smb2_server.c:3482


Hardware watchpoint 2: share_mode_lock_key_refcount

Old value = 2
New value = 1
put_share_mode_lock_internal (lck=0x7ffe5b82bc10) at 
../../source3/locking/share_mode_lock.c:1020
1020        if (share_mode_lock_key_refcount > 0) {
(gdb) bt
#0  put_share_mode_lock_internal (lck=0x7ffe5b82bc10) at 
../../source3/locking/share_mode_lock.c:1020
#1  0x00007f29401244b9 in share_mode_do_locked_vfs_denied_fn (glck=0x0, 
cb_private=0x7ffe5b82bcb0) at ../../source3/locking/share_mode_lock.c:2813
#2  0x00007f294012470f in _share_mode_do_locked_vfs_denied (id=..., 
fn=0x7f2940113b7b <file_has_open_streams_locked>, 
private_data=0x7ffe5b82bd3e, location=0x7f2940270798 
"../../source3/locking/locking.c:1259")
     at ../../source3/locking/share_mode_lock.c:2875
#3  0x00007f2940113c0f in file_has_open_streams (fsp=0x56151348bac0) at 
../../source3/locking/locking.c:1259
#4  0x00007f294014ed2f in rename_internals_fsp (conn=0x5615134184d0, 
fsp=0x56151348bac0, dst_dirfsp=0x0, smb_fname_dst_in=0x5615134262d0, 
dst_original_lcomp=0x561513426470 "QQQ08b", attrs=6,
     replace_if_exists=false) at ../../source3/smbd/smb2_reply.c:1437
#5  0x00007f2940163be8 in smb2_file_rename_information 
(conn=0x5615134184d0, req=0x56151341cbe0, pdata=0x5615134a8530 "", 
total_data=40, fsp=0x56151348bac0, smb_fname_src=0x561513496a10)
     at ../../source3/smbd/smb2_trans2.c:5042
#6  0x00007f2940167fe5 in smbd_do_setfilepathinfo (conn=0x5615134184d0, 
req=0x56151341cbe0, mem_ctx=0x56151348e100, info_level=65290, 
fsp=0x56151348bac0, smb_fname=0x561513496a10, ppdata=0x7ffe5b82c0c8,
     total_data=40, ret_data_size=0x7ffe5b82c0c4) at 
../../source3/smbd/smb2_trans2.c:6990
#7  0x00007f29401ea2dc in smbd_smb2_setinfo_send 
(mem_ctx=0x561513499000, ev=0x56151335da60, smb2req=0x561513499000, 
fsp=0x56151348bac0, in_info_type=1 '\001', in_file_info_class=10 '\n', 
in_input_buffer=...,
     in_additional_information=0) at ../../source3/smbd/smb2_setinfo.c:513
#8  0x00007f29401e9202 in smbd_smb2_request_process_setinfo 
(req=0x561513499000) at ../../source3/smbd/smb2_setinfo.c:112
#9  0x00007f29401c1b96 in smbd_smb2_request_dispatch 
(req=0x561513499000) at ../../source3/smbd/smb2_server.c:3482


Hardware watchpoint 2: share_mode_lock_key_refcount

Old value = 1
New value = 2
get_share_mode_lock_internal (id=..., servicepath=0x0, smb_fname=0x0, 
old_write_time=0x0, lck=0x5615134a9010) at 
../../source3/locking/share_mode_lock.c:972
972        if (static_share_mode_data != NULL) {
(gdb) bt
#0  get_share_mode_lock_internal (id=..., servicepath=0x0, 
smb_fname=0x0, old_write_time=0x0, lck=0x5615134a9010) at 
../../source3/locking/share_mode_lock.c:972
#1  0x00007f294011e921 in get_existing_share_mode_lock 
(mem_ctx=0x561513425150, id=...) at 
../../source3/locking/share_mode_lock.c:1084
#2  0x00007f294014fd35 in rename_internals_fsp (conn=0x5615134184d0, 
fsp=0x56151348bac0, dst_dirfsp=0x0, smb_fname_dst_in=0x5615134262d0, 
dst_original_lcomp=0x561513426470 "QQQ08b", attrs=6,
     replace_if_exists=false) at ../../source3/smbd/smb2_reply.c:1740
#3  0x00007f2940163be8 in smb2_file_rename_information 
(conn=0x5615134184d0, req=0x56151341cbe0, pdata=0x5615134a8530 "", 
total_data=40, fsp=0x56151348bac0, smb_fname_src=0x561513496a10)
     at ../../source3/smbd/smb2_trans2.c:5042
#4  0x00007f2940167fe5 in smbd_do_setfilepathinfo (conn=0x5615134184d0, 
req=0x56151341cbe0, mem_ctx=0x56151348e100, info_level=65290, 
fsp=0x56151348bac0, smb_fname=0x561513496a10, ppdata=0x7ffe5b82c0c8,
     total_data=40, ret_data_size=0x7ffe5b82c0c4) at 
../../source3/smbd/smb2_trans2.c:6990
#5  0x00007f29401ea2dc in smbd_smb2_setinfo_send 
(mem_ctx=0x561513499000, ev=0x56151335da60, smb2req=0x561513499000, 
fsp=0x56151348bac0, in_info_type=1 '\001', in_file_info_class=10 '\n', 
in_input_buffer=...,
     in_additional_information=0) at ../../source3/smbd/smb2_setinfo.c:513
#6  0x00007f29401e9202 in smbd_smb2_request_process_setinfo 
(req=0x561513499000) at ../../source3/smbd/smb2_setinfo.c:112
#7  0x00007f29401c1b96 in smbd_smb2_request_dispatch 
(req=0x561513499000) at ../../source3/smbd/smb2_server.c:3482

and the panic:


#0  __pthread_kill_implementation (threadid=<optimized out>, 
signo=signo@entry=6, no_tid=no_tid@entry=0) at pthread_kill.c:44
#1  0x00007f293fb1ccb3 in __pthread_kill_internal (signo=6, 
threadid=<optimized out>) at pthread_kill.c:78
#2  0x00007f293facc9c6 in __GI_raise (sig=sig@entry=6) at 
../sysdeps/posix/raise.c:26
#3  0x00007f293fab67f4 in __GI_abort () at abort.c:79
#4  0x00007f293ffdbbfa in dump_core () at ../../source3/lib/dumpcore.c:338
#5  0x00007f293ffed661 in smb_panic_s3 (why=0x7f2940276e08 "assert 
failed: share_mode_lock_key_refcount == 0") at ../../source3/lib/util.c:713
#6  0x00007f293fce19a1 in smb_panic (why=0x7f2940276e08 "assert failed: 
share_mode_lock_key_refcount == 0") at ../../lib/util/fault.c:198
#7  0x00007f2940124d7a in _share_mode_entry_prepare_lock 
(prepare_state=0x7ffe5b82b610, id=..., servicepath=0x561513488970 
"/home/pfilipen/workspace/projects/samba/2571/st/ad_member/share",
     smb_fname=0x5615134a8880, old_write_time=0x7ffe5b82b560, 
fn=0x7f2940179986 <open_ntcreate_lock_add_entry>, 
private_data=0x7ffe5b82b610, location=0x7f2940291830 
"../../source3/smbd/open.c:4342")
     at ../../source3/locking/share_mode_lock.c:3010
#8  0x00007f294017aec1 in open_file_ntcreate (conn=0x5615134184d0, 
req=0x0, access_mask=137, share_access=7, create_disposition=1, 
create_options=0, new_dos_attributes=0, oplock_request=8, lease=0x0,
     private_flags=0, parent_dir_fname=0x561513430540, 
smb_fname_atname=0x5615134aa040, pinfo=0x7ffe5b82b7cc, 
fsp=0x5615134a5d00) at ../../source3/smbd/open.c:4342
#9  0x00007f294017fdad in create_file_unixpath (conn=0x5615134184d0, 
req=0x0, dirfsp=0x5615134a9b10, smb_fname=0x5615134a5aa0, 
access_mask=137, share_access=7, create_disposition=1, create_options=0,
     file_attributes=128, oplock_request=8, lease=0x0, 
allocation_size=0, private_flags=0, sd=0x0, ea_list=0x0, 
result=0x7ffe5b82b990, pinfo=0x7ffe5b82b99c) at 
../../source3/smbd/open.c:6337
#10 0x00007f2940180993 in create_file_default (conn=0x5615134184d0, 
req=0x0, dirfsp=0x5615134a9b10, smb_fname=0x5615134a5aa0, 
access_mask=137, share_access=7, create_disposition=1, create_options=0,
     file_attributes=128, oplock_request=0, lease=0x0, 
allocation_size=0, private_flags=0, sd=0x0, ea_list=0x0, 
result=0x7ffe5b82bbf8, pinfo=0x7ffe5b82bbec, in_context_blobs=0x0, 
out_context_blobs=0x0)
     at ../../source3/smbd/open.c:6656
#11 0x00007f2940130932 in vfswrap_create_file (handle=0x561513496dc0, 
req=0x0, dirfsp=0x5615134a9b10, smb_fname=0x5615134a5aa0, 
access_mask=137, share_access=7, create_disposition=1, create_options=0,
     file_attributes=128, oplock_request=0, lease=0x0, 
allocation_size=0, private_flags=0, sd=0x0, ea_list=0x0, 
result=0x7ffe5b82bbf8, pinfo=0x7ffe5b82bbec, in_context_blobs=0x0, 
out_context_blobs=0x0)
     at ../../source3/modules/vfs_default.c:827
#12 0x00007f294018d328 in smb_vfs_call_create_file 
(handle=0x561513496dc0, req=0x0, dirfsp=0x5615134a9b10, 
smb_fname=0x5615134a5aa0, access_mask=137, share_access=7, 
create_disposition=1, create_options=0,
     file_attributes=128, oplock_request=0, lease=0x0, 
allocation_size=0, private_flags=0, sd=0x0, ea_list=0x0, 
result=0x7ffe5b82bbf8, pinfo=0x7ffe5b82bbec, in_context_blobs=0x0, 
out_context_blobs=0x0)
     at ../../source3/smbd/vfs.c:1576
#13 0x00007f2940149b77 in copy_internals (ctx=0x561513425150, 
conn=0x5615134184d0, req=0x0, src_dirfsp=0x5615134a9b10, 
smb_fname_src=0x5615134a5aa0, dst_dirfsp=0x5615134a69d0, 
smb_fname_dst=0x5615134a90c0,
     attrs=6) at ../../source3/smbd/smb2_nttrans.c:248
#14 0x00007f292b549060 in copy_reg (handle=0x56151348adb0, 
srcfsp=0x5615134a9b10, source=0x561513cb64b0, dstfsp=0x5615134a69d0, 
dest=0x56151342bc80) at ../../source3/modules/vfs_crossrename.c:116
#15 0x00007f292b5491aa in crossrename_renameat (handle=0x56151348adb0, 
srcfsp=0x5615134a9b10, smb_fname_src=0x561513cb64b0, 
dstfsp=0x5615134a69d0, smb_fname_dst=0x56151342bc80)
     at ../../source3/modules/vfs_crossrename.c:167
#16 0x00007f294018e176 in smb_vfs_call_renameat (handle=0x56151348adb0, 
srcfsp=0x5615134a9b10, smb_fname_src=0x561513cb64b0, 
dstfsp=0x5615134a69d0, smb_fname_dst=0x56151342bc80) at 
../../source3/smbd/vfs.c:1775
#17 0x00007f294014fe00 in rename_internals_fsp (conn=0x5615134184d0, 
fsp=0x56151348bac0, dst_dirfsp=0x0, smb_fname_dst_in=0x5615134262d0, 
dst_original_lcomp=0x561513426470 "QQQ08b", attrs=6,
     replace_if_exists=false) at ../../source3/smbd/smb2_reply.c:1749
#18 0x00007f2940163be8 in smb2_file_rename_information 
(conn=0x5615134184d0, req=0x56151341cbe0, pdata=0x5615134a8530 "", 
total_data=40, fsp=0x56151348bac0, smb_fname_src=0x561513496a10)
     at ../../source3/smbd/smb2_trans2.c:5042
#19 0x00007f2940167fe5 in smbd_do_setfilepathinfo (conn=0x5615134184d0, 
req=0x56151341cbe0, mem_ctx=0x56151348e100, info_level=65290, 
fsp=0x56151348bac0, smb_fname=0x561513496a10, ppdata=0x7ffe5b82c0c8,
     total_data=40, ret_data_size=0x7ffe5b82c0c4) at 
../../source3/smbd/smb2_trans2.c:6990
#20 0x00007f29401ea2dc in smbd_smb2_setinfo_send 
(mem_ctx=0x561513499000, ev=0x56151335da60, smb2req=0x561513499000, 
fsp=0x56151348bac0, in_info_type=1 '\001', in_file_info_class=10 '\n', 
in_input_buffer=...,
     in_additional_information=0) at ../../source3/smbd/smb2_setinfo.c:513
#21 0x00007f29401e9202 in smbd_smb2_request_process_setinfo 
(req=0x561513499000) at ../../source3/smbd/smb2_setinfo.c:112
#22 0x00007f29401c1b96 in smbd_smb2_request_dispatch 
(req=0x561513499000) at ../../source3/smbd/smb2_server.c:3482


So we really need to address this.

On 10/6/22 19:55, Jeremy Allison wrote:
> On Thu, Oct 06, 2022 at 10:40:57AM -0400, Andrew Walker via 
> samba-technical wrote:
>> On Thu, Oct 6, 2022 at 10:28 AM Pavel Filipenský via samba-technical <
>> samba-technical@lists.samba.org> wrote:
>>
>>> Hi,
>>>
>>> I am working on a fix for RH bugzillahttps://
>>> bugzilla.redhat.com/show_bug.cgi?id=2125339
>>>
>>> If the share is using vfs_recycle and vfs_crossrename modules and the
>>> recycle repo is on a different filesystem, like here:
>>>
>>> vfs objects = recycle crossrename
>>> recycle:repository = /different_filesystem/
>>>
>>> The deleted file should be moved to /different_filesystem/recycle, 
>>> but it
>>> fails. Since this is a different fs, we cannot use
>>>
>>> rename("File", "/different_filesystem/recycle/File")
>>>
>>> but instead samba code uses two syscalls:
>>>
>>> unlink("/different_filesystem/recycle/File")
>>> openat(AT_FDCWD, "/different_filesystem/recycle/File", O_CREAT, 0600)
>>>
>>> Normally, the destination file "/different_filesystem/recycle/File" 
>>> does
>>> not exist and unlink() fails with ENOENT. This is correctly handled in
>>> samba-4.12:
>>>
>>>
>>>   51 static int copy_reg(const char *source, const char *dest)
>>>   52 {
>>> ...
>>>   76 »···if (unlink (dest) && errno != ENOENT) {
>>>   77 »···»···close(ifd);
>>>   78 »···»···return -1;
>>>   79 »···}
>>>
>>> But newer versions of samba miss the check for ENOENT and the operation
>>> fails, doing map_nt_error_from_unix(errno). I have tried to the same 
>>> fix,
>>> and added to copy_reg() this:
>>>
>>> -       if (ret == -1) {
>>> +       if (ret == -1 && errno != ENOENT) {
>>>                  status = map_nt_error_from_unix(errno);
>>>                  goto out;
>>>          }
>>>
>>> Unfortunately, it does not work. It causes this panic:
>>>
>>>
>>>
>>> Program received signal SIGABRT, Aborted.
>>> __pthread_kill_implementation (threadid=<optimized out>, 
>>> signo=signo@entry=6,
>>> no_tid=no_tid@entry=0) at pthread_kill.c:44
>>> 44»·      return INTERNAL_SYSCALL_ERROR_P (ret) ? 
>>> INTERNAL_SYSCALL_ERRNO
>>> (ret) : 0;
>>> #0  __pthread_kill_implementation (threadid=<optimized out>,
>>> signo=signo@entry=6, no_tid=no_tid@entry=0) at pthread_kill.c:44
>>> #1  0x00007fc04abb7cb3 in __pthread_kill_internal (signo=6,
>>> threadid=<optimized out>) at pthread_kill.c:78
>>> #2  0x00007fc04ab679c6 in __GI_raise (sig=sig@entry=6) at
>>> ../sysdeps/posix/raise.c:26
>>> #3  0x00007fc04ab517f4 in __GI_abort () at abort.c:79
>>> #4  0x00007fc04b076bfa in dump_core () at 
>>> ../../source3/lib/dumpcore.c:338
>>> #5  0x00007fc04b088661 in smb_panic_s3 (why=0x7fc04b311928 "assert 
>>> failed:
>>> share_mode_lock_key_refcount == 0") at ../../source3/lib/util.c:713
>>> #6  0x00007fc04ad7c9a1 in smb_panic (why=0x7fc04b311928 "assert failed:
>>> share_mode_lock_key_refcount == 0") at ../../lib/util/fault.c:198
>>> #7  0x00007fc04b1bfd7a in _share_mode_entry_prepare_lock
>>> (prepare_state=0x7fffa9900f60, id=..., servicepath=0x565379144e10
>>> "/home/pfilipen/workspace/projects/samba/2571/st/ad_member/share",
>>>      smb_fname=0x565379162da0, old_write_time=0x7fffa9900eb0,
>>> fn=0x7fc04b2145d9 <open_ntcreate_lock_add_entry>,
>>> private_data=0x7fffa9900f60, location=0x7fc04b32c0f0
>>> "../../source3/smbd/open.c:4342")
>>>      at ../../source3/locking/share_mode_lock.c:3010
>>> #8  0x00007fc04b215b14 in open_file_ntcreate (conn=0x5653790d46b0,
>>> req=0x0, access_mask=137, share_access=7, create_disposition=1,
>>> create_options=0, new_dos_attributes=0, oplock_request=8, lease=0x0,
>>>      private_flags=0, parent_dir_fname=0x5653790019b0,
>>> smb_fname_atname=0x565379156ec0, pinfo=0x7fffa990111c, 
>>> fsp=0x565379162bc0)
>>> at ../../source3/smbd/open.c:4342
>>> #9  0x00007fc04b21a8c8 in create_file_unixpath (conn=0x5653790d46b0,
>>> req=0x0, dirfsp=0x56537905a9d0, smb_fname=0x5653791497d0, 
>>> access_mask=137,
>>> share_access=7, create_disposition=1, create_options=0,
>>>      file_attributes=128, oplock_request=8, lease=0x0, 
>>> allocation_size=0,
>>> private_flags=0, sd=0x0, ea_list=0x0, result=0x7fffa99012e0,
>>> pinfo=0x7fffa99012ec) at ../../source3/smbd/open.c:6337
>>> #10 0x00007fc04b21b4ae in create_file_default (conn=0x5653790d46b0,
>>> req=0x0, dirfsp=0x56537905a9d0, smb_fname=0x5653791497d0, 
>>> access_mask=137,
>>> share_access=7, create_disposition=1, create_options=0,
>>>      file_attributes=128, oplock_request=0, lease=0x0, 
>>> allocation_size=0,
>>> private_flags=0, sd=0x0, ea_list=0x0, result=0x7fffa9901548,
>>> pinfo=0x7fffa990153c, in_context_blobs=0x0, out_context_blobs=0x0)
>>>      at ../../source3/smbd/open.c:6656
>>> #11 0x00007fc04b1cb932 in vfswrap_create_file (handle=0x565379152be0,
>>> req=0x0, dirfsp=0x56537905a9d0, smb_fname=0x5653791497d0, 
>>> access_mask=137,
>>> share_access=7, create_disposition=1, create_options=0,
>>>      file_attributes=128, oplock_request=0, lease=0x0, 
>>> allocation_size=0,
>>> private_flags=0, sd=0x0, ea_list=0x0, result=0x7fffa9901548,
>>> pinfo=0x7fffa990153c, in_context_blobs=0x0, out_context_blobs=0x0)
>>>      at ../../source3/modules/vfs_default.c:827
>>> #12 0x00007fc04b227e43 in smb_vfs_call_create_file 
>>> (handle=0x565379152be0,
>>> req=0x0, dirfsp=0x56537905a9d0, smb_fname=0x5653791497d0, 
>>> access_mask=137,
>>> share_access=7, create_disposition=1, create_options=0,
>>>      file_attributes=128, oplock_request=0, lease=0x0, 
>>> allocation_size=0,
>>> private_flags=0, sd=0x0, ea_list=0x0, result=0x7fffa9901548,
>>> pinfo=0x7fffa990153c, in_context_blobs=0x0, out_context_blobs=0x0)
>>>      at ../../source3/smbd/vfs.c:1576
>>> #13 0x00007fc04b1e4b77 in copy_internals (ctx=0x5653790e1330,
>>> conn=0x5653790d46b0, req=0x0, src_dirfsp=0x56537905a9d0,
>>> smb_fname_src=0x5653791497d0, dst_dirfsp=0x5653790d4aa0,
>>> smb_fname_dst=0x565379162700,
>>>      attrs=6) at ../../source3/smbd/smb2_nttrans.c:248
>>> #14 0x00007fc0365e4060 in copy_reg (handle=0x565379148050,
>>> srcfsp=0x56537905a9d0, source=0x565379155650, dstfsp=0x5653790d4aa0,
>>> dest=0x5653790e28e0) at ../../source3/modules/vfs_crossrename.c:115
>>> #15 0x00007fc0365e41aa in crossrename_renameat (handle=0x565379148050,
>>> srcfsp=0x56537905a9d0, smb_fname_src=0x565379155650, 
>>> dstfsp=0x5653790d4aa0,
>>> smb_fname_dst=0x5653790e28e0)
>>>      at ../../source3/modules/vfs_crossrename.c:166
>>> #16 0x00007fc04b228c91 in smb_vfs_call_renameat (handle=0x565379148050,
>>> srcfsp=0x56537905a9d0, smb_fname_src=0x565379155650, 
>>> dstfsp=0x5653790d4aa0,
>>> smb_fname_dst=0x5653790e28e0) at ../../source3/smbd/vfs.c:1775
>>> #17 0x00007fc0365ded2f in recycle_unlink_internal 
>>> (handle=0x565379148680,
>>> dirfsp=0x56537905a9d0, smb_fname=0x565379155650, flags=0) at
>>> ../../source3/modules/vfs_recycle.c:690
>>> #18 0x00007fc0365defaa in recycle_unlinkat (handle=0x565379148680,
>>> dirfsp=0x56537905a9d0, smb_fname=0x565379155650, flags=0) at
>>> ../../source3/modules/vfs_recycle.c:735
>>> #19 0x00007fc04b2296fe in smb_vfs_call_unlinkat (handle=0x565379148680,
>>> dirfsp=0x56537905a9d0, smb_fname=0x565379155650, flags=0) at
>>> ../../source3/smbd/vfs.c:1932
>>> #20 0x00007fc04b21d106 in close_remove_share_mode (fsp=0x565379152c80,
>>> close_type=NORMAL_CLOSE) at ../../source3/smbd/close.c:581
>>> #21 0x00007fc04b21dcf2 in close_normal_file (req=0x5653790ce430,
>>> fsp=0x565379152c80, close_type=NORMAL_CLOSE) at
>>> ../../source3/smbd/close.c:910
>>> #22 0x00007fc04b22061c in close_file_smb (req=0x5653790ce430,
>>> fsp=0x565379152c80, close_type=NORMAL_CLOSE) at
>>> ../../source3/smbd/close.c:1663
>>>
>>>
>>> The cause of the panic is  "assert failed: 
>>> share_mode_lock_key_refcount ==
>>> 0" in source3/locking/share_mode_lock.c:3010
>>> The share_mode_lock_key_refcount is already 1, the first reference is
>>> taken here:
>>>
>>> Hardware watchpoint 2: share_mode_lock_key_refcount
>>> Old value = 0
>>> New value = 1
>>> get_share_mode_lock_internal (id=..., servicepath=0x0, smb_fname=0x0,
>>> old_write_time=0x0, lck=0x7fffa9901980) at
>>> ../../source3/locking/share_mode_lock.c:972
>>> 972»»···if (static_share_mode_data != NULL) {
>>> #0  get_share_mode_lock_internal (id=..., servicepath=0x0, 
>>> smb_fname=0x0,
>>> old_write_time=0x0, lck=0x7fffa9901980) at
>>> ../../source3/locking/share_mode_lock.c:972
>>> #1  0x00007fc04b1bfa24 in share_mode_entry_prepare_lock_fn
>>> (glck=0x7fffa9901190, cb_private=0x7fffa9901760) at
>>> ../../source3/locking/share_mode_lock.c:2952
>>> #2  0x00007fc04b05c7d2 in g_lock_lock_cb_run_and_store
>>> (cb_state=0x7fffa9901190) at ../../source3/lib/g_lock.c:597
>>> #3  0x00007fc04b05e8c1 in g_lock_lock_simple_fn (rec=0x7fffa99014a0,
>>> value=..., private_data=0x7fffa9901630) at 
>>> ../../source3/lib/g_lock.c:1212
>>> #4  0x00007fc04b05833d in dbwrap_watched_do_locked_fn
>>> (backend_rec=0x7fffa9901350, backend_value=...,
>>> private_data=0x7fffa9901470) at 
>>> ../../source3/lib/dbwrap/dbwrap_watch.c:458
>>> #5  0x00007fc04aa33e44 in db_tdb_do_locked (db=0x5653790ca050, key=...,
>>> fn=0x7fc04b0582ab <dbwrap_watched_do_locked_fn>,
>>> private_data=0x7fffa9901470) at ../../lib/dbwrap/dbwrap_tdb.c:208
>>> #6  0x00007fc04aa304db in dbwrap_do_locked (db=0x5653790ca050, key=...,
>>> fn=0x7fc04b0582ab <dbwrap_watched_do_locked_fn>,
>>> private_data=0x7fffa9901470) at ../../lib/dbwrap/dbwrap.c:553
>>> #7  0x00007fc04b058435 in dbwrap_watched_do_locked (db=0x5653790cf910,
>>> key=..., fn=0x7fc04b05e4fa <g_lock_lock_simple_fn>,
>>> private_data=0x7fffa9901630) at 
>>> ../../source3/lib/dbwrap/dbwrap_watch.c:480
>>> #8  0x00007fc04aa304db in dbwrap_do_locked (db=0x5653790cf910, key=...,
>>> fn=0x7fc04b05e4fa <g_lock_lock_simple_fn>, 
>>> private_data=0x7fffa9901630) at
>>> ../../lib/dbwrap/dbwrap.c:553
>>> #9  0x00007fc04b05eb28 in g_lock_lock (ctx=0x565379020280, key=...,
>>> type=G_LOCK_WRITE, timeout=..., cb_fn=0x7fc04b1bf90d
>>> <share_mode_entry_prepare_lock_fn>, cb_private=0x7fffa9901760) at
>>> ../../source3/lib/g_loc…
>>> #10 0x00007fc04b1bfe1c in _share_mode_entry_prepare_lock
>>> (prepare_state=0x7fffa9901960, id=..., servicepath=0x0, smb_fname=0x0,
>>> old_write_time=0x0, fn=0x7fc04b21c0b5 <close_share_mode_lock_prepare>,
>>> private_dat…
>>> #11 0x00007fc04b21c99b in close_remove_share_mode (fsp=0x565379152c80,
>>> close_type=NORMAL_CLOSE) at ../../source3/smbd/close.c:451
>>> #12 0x00007fc04b21dcf2 in close_normal_file (req=0x5653790ce430,
>>> fsp=0x565379152c80, close_type=NORMAL_CLOSE) at
>>> ../../source3/smbd/close.c:910
>>> #13 0x00007fc04b22061c in close_file_smb (req=0x5653790ce430,
>>> fsp=0x565379152c80, close_type=NORMAL_CLOSE) at
>>> ../../source3/smbd/close.c:1663
>>>
>>>
>>> So the issue comes from the logic in close_remove_share_mode()
>>>
>>> static NTSTATUS close_remove_share_mode(files_struct *fsp, enum
>>> file_close_type close_type)
>>> {
>>>         status =
>>> share_mode_entry_prepare_lock_del(&lck_state.prepare_state,
>>>
>>>         ret = SMB_VFS_UNLINKAT(conn,
>>>
>>>         ulstatus =
>>> share_mode_entry_prepare_unlock(&lck_state.prepare_state,
>>> }
>>>
>>> Each process can hold just one share_mode_lock_key_refcount, but 
>>> here we
>>> have two nested calls, both grabbing share_mode_lock_key_refcount:
>>> 1. share_mode_entry_prepare_lock_del()
>>> 2. SMB_VFS_UNLINKAT() -> recycle_unlink_internal() ->
>>> crossrename_renameat() -> open_file_ntcreate() ->
>>> _share_mode_entry_prepare_lock()
>>>
>>>
>>>
>>> How this should be fixed? Can we remove the assert and allow to grab 
>>> the
>>> share_mode_lock_key_refcount
>>>   again give the owner is the process itself?
>>>
>>>
>>> Thanks,
>>> Pavel
>>>
>>
>> Perhaps instead of layering the recyclebin over vfs_crossrename, we 
>> should
>> generate separate recyclebins at filesystem mountpoints when the SMB
>> share contains nested ones?
>>
>> This would preserve atomicity of the rename operation and would avoid
>> exposing users to limits of vfs_crossrename (e.g. purging of files that
>> exceed the cross-rename limit -- which is a pretty significant POLA
>> violation).
>>
>> If we want to go this route, I can make a merge request to add it 
>> (since I
>> already have POC code to do this).
>
> That sounds like a plan to me ! Can we see the MR request ?

