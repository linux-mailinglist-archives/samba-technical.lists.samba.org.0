Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 91579B2AB06
	for <lists+samba-technical@lfdr.de>; Mon, 18 Aug 2025 16:40:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=78+Iu2uSbmJaMmYelyttGEPPOR7pghAVUB7MS14cwzY=; b=Vigiu041YxRfRYFrZtMvVqkh3u
	wsQT59rMEx0mZTwQyPhMHV6WNUAmYvCCTHId92dA1FTm4wZ4n8CKIXfEdzmNoBGVO2fjKKi5HyzsP
	6g2WzcwH0pHYA6t3oVytp8lIaM1Icj+a4j2PPCgbVFs739rpIJ2+9mmZGf94cZ7yBpUHXYWH5Ogfn
	PeslT2e/Z/8v4p5Czw8AmimNp8gd3Z/si1zn17xb1Q7tTRHhus72TPKvPowZ+0Lo6spgb62fdklXB
	Lne6ZpKcJnNwMyduEKGS3fJu/lloFqycRGniMdo7hIvZzkZTc2UGKhizntfkHFW3YTDvLTMWUH9UI
	oVaXW9rQ==;
Received: from ip6-localhost ([::1]:37944 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uo11y-00FFTf-QK; Mon, 18 Aug 2025 14:40:14 +0000
Received: from mx1.manguebit.org ([143.255.12.172]:60354) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uo11n-00FFTW-TC
 for samba-technical@lists.samba.org; Mon, 18 Aug 2025 14:40:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=manguebit.org; s=dkim; h=Content-Type:MIME-Version:Date:References:
 In-Reply-To:Subject:Cc:To:From:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=78+Iu2uSbmJaMmYelyttGEPPOR7pghAVUB7MS14cwzY=; b=1LRZ+INq2fVasxA8cdFDiQOsgL
 +zHlkQ0VsBIHNw9Ac4wuKcT2sr38vJ/VQrGt2o8pDb3TPP0yriB0RemEtGkn7b8twSUopvQtR3hqu
 YP5y3lZgnUloBDtkIQufRPeqC5E/bJHgoMghnOV0YBbKURK5nXMhFETgnGfhCig3g+NeECRXtTn5L
 eruiYfjc88OMVVEfbes+vRyZqdTAjEkjRBzDeNJfQT+hbVLjRDj7qHqtZLvwcKGbERbUgxgEm3c+N
 Xn6idu+sGNIcKNvXQlpEgHINfFBGKW/fLHIRI+7gY6vdNjJo+zMVd+WOKCNLnKBbeCCUJN4E6PJTJ
 nsZjIGog==;
Received: from pc by mx1.manguebit.org with local (Exim 4.98.2)
 id 1uo11h-00000000OKq-2tHI; Mon, 18 Aug 2025 11:39:57 -0300
Message-ID: <b3967fbbe442787c3f0d735d257f218a@manguebit.org>
To: Wang Zhaolong <wangzhaolong@huaweicloud.com>, sfrench@samba.org
Subject: Re: [PATCH v4] smb: client: Fix mount deadlock by avoiding super
 block iteration in DFS reconnect
In-Reply-To: <20250815031618.3758759-1-wangzhaolong@huaweicloud.com>
References: <20250815031618.3758759-1-wangzhaolong@huaweicloud.com>
Date: Mon, 18 Aug 2025 11:39:52 -0300
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
>                                 down_read(&sb->s_umount); // Deadlock
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
> V4:
>  - Perform a null pointer check on the return value of cifs_get_dfs_tcon_super()
>    to prevent NULL ptr dereference with DFS multiuser mount
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
>  fs/smb/client/dfs.c        |  4 +-
>  fs/smb/client/misc.c       | 84 ++++++++++++++------------------------
>  5 files changed, 35 insertions(+), 57 deletions(-)

Thanks for fixing the NULL ptr deref issue.

This patch still introduces a regression when reconnecting tcons
created in multiuser mounts by cifs_construct_tcon().  That is,
cifs_sb_info::prepath will not get updated in tree_connect_dfs_target()
because @cifs_sb will be NULL when calling cifs_get_dfs_tcon_super() on
non-master tcons.

Currently only master tcons will have a pointer to the superblock, which
is set in mount_setup_tlink().  You'd need to set superblock pointer to
all tcons in order to make this work.

