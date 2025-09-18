Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 232C5B26868
	for <lists+samba-technical@lfdr.de>; Thu, 14 Aug 2025 16:04:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=zewlUH5uYOMSF9KPSN2MJuR6HhHC4bRH4ssstU7jG4M=; b=CuwoCVzH5RG24yprl84Nje9rz3
	3x5HrT7ybRgRfg8LfMhbspantsusdQ4ziF41Tt9Cv+tQhnariM2ZQiYaK0tzNLxIWu1yVcrne2Y+q
	IpcBEurj0fxI3il0qkOmV/nSgYR4NQHQ6gq/SMc6Fqo5iksA3HMch9xsedeTbcBZ583YAeWV4rSLn
	X9iBterSHn8VmgP3K7SDhy0RBwI7TuUbT79dWKuClrfX95hBICqVjFaYvAyl+jBdoUrMMjOgk4bO+
	Yq/UdTrtsdslrOzdKTcPH+Z9A2U+6PInJsnwzPerQdV3wK9sEsaUEZCiccT2eM0klv2UYVeIrPv3V
	kOqPAHMA==;
Received: from ip6-localhost ([::1]:59780 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1umYYM-00F1CD-Fd; Thu, 14 Aug 2025 14:03:38 +0000
Received: from mx1.manguebit.org ([143.255.12.172]:48848) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1umYYH-00F1C6-Sa
 for samba-technical@lists.samba.org; Thu, 14 Aug 2025 14:03:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=manguebit.org; s=dkim; h=Content-Type:MIME-Version:Date:References:
 In-Reply-To:Subject:Cc:To:From:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=zewlUH5uYOMSF9KPSN2MJuR6HhHC4bRH4ssstU7jG4M=; b=ce7X2KyoULy8Z3v3i/4bZdA73A
 USe0L9ltnv5gdmzpE1r/qiuntciSJ57Q810u2h+0hMMhboxjO2ti3FTYc7HMp4A1XaYMTTVOM3qyK
 hc+uir69F9m/arkIIF1cMyYI30zBX1fRqHy2t6hKOYJpHxuJyZEmqaaqvOeN08u0S97nuz+6yJzoJ
 iUC13enbQlVuiJu6CQI7OcL5tNCOf1gUJ2EassxsPrTFNCYc5c3ByXVMIMWdLXgfP8bQkSCHIAyxc
 K2xdyQFQR00OzHzizTbJ74eXFiTWOXdOaKx+HXwI1ZXzjgWskkwDrUxcHYwJE4FUCtwF4vygP/AOb
 4MjzDwOg==;
Received: from pc by mx1.manguebit.org with local (Exim 4.98.2)
 id 1umYJ3-00000000E6M-3x39; Thu, 14 Aug 2025 10:47:49 -0300
Message-ID: <f0490a5be0ebe2eac03be48ec787e1ec@manguebit.org>
To: Wang Zhaolong <wangzhaolong@huaweicloud.com>, sfrench@samba.org
Subject: Re: [PATCH V3] smb: client: Fix mount deadlock by avoiding super
 block iteration in DFS reconnect
In-Reply-To: <20250813013208.1564486-1-wangzhaolong@huaweicloud.com>
References: <20250813013208.1564486-1-wangzhaolong@huaweicloud.com>
Date: Thu, 14 Aug 2025 10:47:41 -0300
MIME-Version: 1.0
Content-Type: text/plain
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
From: Paulo Alcantara via samba-technical <samba-technical@lists.samba.org>
Reply-To: Paulo Alcantara <pc@manguebit.org>
Cc: linux-cifs@vger.kernel.org, yi.zhang@huawei.com, yangerkun@huawei.com,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 chengzhihao1@huawei.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Wang Zhaolong <wangzhaolong@huaweicloud.com> writes:

> An AA deadlock occurs when network interruption during mount triggers
> DFS reconnection logic that calls iterate_supers_type().
>
> The detailed call process is as follows:
>
>       mount.cifs
> -------------------------
> path_mount
>   do_new_mount
>     vfs_get_tree
>       smb3_get_tree
>         cifs_smb3_do_mount
>           sget
>             alloc_super
>               down_write_nested(&s->s_umount, ..);  // Hold lock
>           cifs_root_iget
>             cifs_get_inode_info
>               smb2_query_path_info
>                 smb2_compound_op
>                   SMB2_open_init
>                     smb2_plain_req_init
>                       smb2_reconnect           // Trigger reconnection
>                         cifs_tree_connect
>                           cifs_get_dfs_tcon_super
>                             __cifs_get_super
>                               iterate_supers_type
>                                 super_lock_shared
>                                   super_lock
>                                     __super_lock
>                                       down_read(&sb->s_umount); // Deadlock
>     do_new_mount_fc
>       up_write(&sb->s_umount);  // Release lock
>
> During mount phase, if reconnection is triggered, the foreground mount
> process may enter smb2_reconnect prior to the reconnect worker being
> scheduled, leading to a deadlock when subsequent DFS tree connect
> attempts reacquire the s_umount lock.
>
> The essential condition for triggering the issue is that the API
> iterate_supers_type() reacquires the s_umount lock. Therefore, one
> possible solution is to avoid using iterate_supers_type() and instead
> directly access the superblock through internal data structures.
>
> This patch fixes the problem by:
> - Add vfs_sb back-pointer to cifs_sb_info for direct access
> - Protect list traversal with existing tcon->sb_list_lock
> - Use atomic operations to safely manage super block references
> - Remove complex callback-based iteration in favor of simple loop
> - Rename cifs_put_tcp_super() to cifs_put_super() to avoid confusion
>
> Fixes: 3ae872de4107 ("smb: client: fix shared DFS root mounts with different prefixes")
> Signed-off-by: Wang Zhaolong <wangzhaolong@huaweicloud.com>
> ---
>
> V3:
>  - Adjust the trace diagram for the super_lock_shared() section to align with
>    the latest mainline call flow. 
> V2:
>  - Adjust the trace diagram in the commit message to indicate when the lock
>    is released
>
>  fs/smb/client/cifs_fs_sb.h |  1 +
>  fs/smb/client/cifsfs.c     |  1 +
>  fs/smb/client/cifsproto.h  |  2 +-
>  fs/smb/client/dfs.c        |  2 +-
>  fs/smb/client/misc.c       | 84 ++++++++++++++------------------------
>  5 files changed, 34 insertions(+), 56 deletions(-)

Thanks for the patch.  Unfortunately this introduces a NULL ptr
dereference with DFS multiuser mounts:

[  725.383434] ==================================================================                                                  
[  725.383647] BUG: KASAN: null-ptr-deref in cifs_tree_connect+0x23c/0xc10 [cifs]                                                  
[  725.383983] Read of size 8 at addr 0000000000000680 by task kworker/2:1/82                                                      
[  725.384189]                                                                                                                     
[  725.384241] CPU: 2 UID: 0 PID: 82 Comm: kworker/2:1 Not tainted 6.17.0-rc1 #2 PREEMPT(voluntary)                                
[  725.384245] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.17.0-5.fc42 04/01/2014                                   
[  725.384246] Workqueue: cifsiod smb2_reconnect_server [cifs]                                                                     
[  725.384360] Call Trace:                                                                                                         
[  725.384361]  <TASK>                                                                                                             
[  725.384362]  dump_stack_lvl+0x5d/0x80                                                                                           
[  725.384368]  kasan_report+0xdf/0x1a0                                                                                            
[  725.384371]  ? cifs_tree_connect+0x23c/0xc10 [cifs]                                                                             
[  725.384543]  cifs_tree_connect+0x23c/0xc10 [cifs]                                                                               
[  725.384650]  ? __lock_acquire+0xc46/0x19d0                                                                                      
[  725.384653]  ? rcu_lockdep_current_cpu_online+0x62/0xb0                                                                         
[  725.384656]  ? __pfx_cifs_tree_connect+0x10/0x10 [cifs]                                                                         
[  725.384762]  ? lock_acquire+0x157/0x2e0                                                                                         
[  725.384765]  ? lock_acquire+0x157/0x2e0                                                                                         
[  725.384767]  ? __pfx_do_raw_spin_trylock+0x10/0x10                                                                              
[  725.384769]  ? find_held_lock+0x32/0x90                                                                                         
[  725.384772]  ? cifs_mark_open_files_invalid+0xe5/0x130 [cifs]                                                                   
[  725.384887]  ? local_clock_noinstr+0xd/0xd0                                                                                     
[  725.384889]  ? smb2_reconnect+0x31f/0xe10 [cifs]                                                                                
[  725.385004]  ? local_clock+0x15/0x30                                                                                            
[  725.385006]  ? lock_release+0x29b/0x390                                                                                         
[  725.385009]  smb2_reconnect+0x347/0xe10 [cifs]                                                                                  
[  725.385116]  smb2_reconnect_server+0x413/0xd30 [cifs]                                                                           
[  725.385225]  ? __pfx_smb2_reconnect_server+0x10/0x10 [cifs]                                                                     
[  725.385331]  ? local_clock_noinstr+0xd/0xd0                                                                                     
[  725.385333]  ? local_clock+0x15/0x30                                                                                            
[  725.385334]  ? lock_release+0x29b/0x390                                                                                         
[  725.385337]  process_one_work+0x4c5/0xa10                                                                                       
[  725.385341]  ? __pfx_process_one_work+0x10/0x10                                                                                 
[  725.385343]  ? __list_add_valid_or_report+0x37/0x120                                                                            
[  725.385349]  worker_thread+0x2f1/0x5a0                                                                                          
[  725.385351]  ? __kthread_parkme+0xde/0x100                                                                                      
[  725.385354]  ? __pfx_worker_thread+0x10/0x10                                                                                    
[  725.385356]  kthread+0x1fe/0x380                                                                                                
[  725.385358]  ? kthread+0x10f/0x380                                                                                              
[  725.385360]  ? __pfx_kthread+0x10/0x10                                                                                          
[  725.385363]  ? local_clock_noinstr+0x3e/0xd0                                                                                    
[  725.385365]  ? ret_from_fork+0x1b/0x1f0                                                                                         
[  725.385367]  ? local_clock+0x15/0x30                                                                                            
[  725.385369]  ? lock_release+0x29b/0x390                                                                                         
[  725.385370]  ? rcu_is_watching+0x20/0x50                                                                                        
[  725.385373]  ? __pfx_kthread+0x10/0x10                                                                                          
[  725.385375]  ret_from_fork+0x15b/0x1f0                                                                                          
[  725.385377]  ? __pfx_kthread+0x10/0x10                                                                                          
[  725.385380]  ret_from_fork_asm+0x1a/0x30
[  725.385384]  </TASK>

$ ./scripts/faddr2line --list fs/smb/client/cifs.o cifs_tree_connect+0x23c
cifs_tree_connect+0x23c/0xc10:

CIFS_SB at /home/pc/g/linux/fs/smb/client/cifsglob.h:1624
 1619   }
 1620 
 1621   static inline struct cifs_sb_info *
 1622   CIFS_SB(struct super_block *sb)
 1623   {
>1624<          return sb->s_fs_info;
 1625   }
 1626 
 1627   static inline struct cifs_sb_info *
 1628   CIFS_FILE_SB(struct file *file)
 1629   {

(inlined by) cifs_tree_connect at /home/pc/g/linux/fs/smb/client/dfs.c:435
 430                    goto out;
 431            }
 432 
 433            sb = cifs_get_dfs_tcon_super(tcon);
 434            if (!IS_ERR(sb))
>435<                   cifs_sb = CIFS_SB(sb);
 436 
 437            /* Tree connect to last share in @tcon->tree_name if no DFS referral */
 438            if (!server->leaf_fullpath ||
 439                dfs_cache_noreq_find(server->leaf_fullpath + 1, &ref, &tl)) {
 440                    rc = ops->tree_connect(xid, tcon->ses, tcon->tree_name,

You can reproduce with the following:

$ kinit administrator@ZELDA.TEST
$ su testuser -c 'kinit administrator@ZELDA.TEST'
$ mount.cifs //w22-dc1.zelda.test/dfstest/link2 /mnt/1 -o sec=krb5,multiuser,echo_interval=10
$ mount -t cifs
//w22-dc1.zelda.test/dfstest/link2 on /mnt/1 type cifs (rw,relatime,vers=3.1.1,sec=krb5,cruid=0,cache=strict,upcall_target=app,multiuser,uid=0,noforceuid,gid=0,noforcegid,addr=192.168.124.33,file_mode=0755,dir_mode=0755,soft,nounix,mapposix,noperm,reparse=nfs,nativesocket,symlink=native,rsize=4194304,wsize=4194304,bsize=1048576,retrans=1,echo_interval=10,actimeo=1,closetimeo=1)
$ su testuser -c 'ls /mnt/1'
dir1  dir10  dir3  dir5  dir6  dir8  dir9  target1_file.txt  tsub
# disconnect target server 192.168.124.33 and then wait for oops...

The problem seems related to the tcon created for testuser not having a
link to the CIFS superblock, hence the oops when reconnecting the tcon.

Could you please verify?  Thanks.

