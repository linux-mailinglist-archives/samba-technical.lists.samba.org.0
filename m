Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DAEB2FFB5
	for <lists+samba-technical@lfdr.de>; Thu, 21 Aug 2025 18:13:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=7ok/5nUOVAT5FffFe4Cs+qwNagRoMiylJUp8FPuWeFo=; b=HQjS/BQ2uOSg5KLeUWBDIprqej
	IeCgcdXmjeO7z97whcSrbW9oQGAYbSZAgdX1teNjsgjKKBEG25us+n0bqEJ8Y9kNjqPW61yQp/Z/c
	WNCaZ8NoQ1jA7pTXBp5a4FyKEVVXA7wQSMNp66q1BCWcodI4eGh3XEqOH98y6hfHWRkMyVat/tFZX
	+C1q7jSXPBC3EsY35VSuXUY6ih93/UWugAvNituk99TvqTIj59LaYVyvbISYE4BpwEk3iWvPUZKZ8
	w0rywzfjq5fAZ8f32BdVIFFc6ykPcQYTTfu0R6eclKdKchUPTtwt7aal3bE3kFvwVVljmIf60EOwX
	aBIs2yIw==;
Received: from ip6-localhost ([::1]:21796 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1up7u8-0004AE-M5; Thu, 21 Aug 2025 16:12:44 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:51620) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1up7u4-0004A7-0m
 for samba-technical@lists.samba.org; Thu, 21 Aug 2025 16:12:42 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id
 6a1803df08f44-70a9f5d4d97so13275336d6.3
 for <samba-technical@lists.samba.org>; Thu, 21 Aug 2025 09:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755792758; x=1756397558; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7ok/5nUOVAT5FffFe4Cs+qwNagRoMiylJUp8FPuWeFo=;
 b=XibHOCQHVgScUnm7YaWMGTJ6jm5EUmsrhDiZu6awVWx9H7wR1ZoXT/N1okOuPnc1cO
 8d3CeDCO3ZjFBHLG8E0VWV5xd3UQBhhELL3cVQ+W9ZPSxw6/WNUvRr+K4zJQUEEkwQ2s
 upV1xYvCYHqZFci8h73TClgIavtwBejeOWVNlUCNwyfOtRH6/LwsdJBF4Rfoa6hf4+Il
 Y35nzuE3mhEpHaZNBaF2/jGZIwupspImFuX9dpnalIlv4642bMy40Bpdlqp2Afu6/Qnp
 5aaehGT+7XMUXh6+AukE9UynZEvtEfKXpckB1UgRXGgvlLDjOkCmZkNfff8aqaC2rOK5
 O8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755792758; x=1756397558;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7ok/5nUOVAT5FffFe4Cs+qwNagRoMiylJUp8FPuWeFo=;
 b=QM3VABBDYDeUGXcmPdn9JWH7eMNjX7wCHWZSUXuL3y815BLC/OgIRJAljxymXuEKpI
 71kA5PfYUUDF1oiPGLRP8wPaNcO6ccjLNFwVndbthIjQit6FkVzltNUR+hJo0b4y9dEk
 vAj7HQJLXZblxRZSK3DMajteSlGotoT9qIRoGzDwl89FJ4zzkAt63nVihDf6q2x20FLA
 w44ZG8pn0a/FpZNmy37iG7zZDR0H8vI2P7dzxYUaeadKquYitTeRKKIAgW45ocPlK4g1
 hMZXvm8Q8YBEU7LFpAI5pNELZkFeItTMi7+rhkdpImcQHFN4QmgwQKEuFe8iXMZMtRDU
 ngzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmZ8btyOR08fM4F/jz9HWNFOPiho+DcgGsveaq+DvTxAE7LR7H+p+o6NJYN5XUe2vgJvksbcZRF2DeZ6LIF/Q=@lists.samba.org
X-Gm-Message-State: AOJu0YyQxhog56+gPb3Kfz2gqTV3dgZA2lgpg3vmouLfQ8TNDBz+QDYe
 Ce5BuBA45Ir6hXIj8UVZ10WNNlF5Unb1ddXmX2zXYZWVdVCHK4v1BYebejcB0RfdG4usst4VoBG
 HIjRz2bYvM/mtKbAtWl96eExUTZNGa60=
X-Gm-Gg: ASbGncsa7EFnraS161+/ZC/+dBF1IAWA6R5HqFDXb9rZ/AUJJaDAb1P2ZdZ4w+JDxa3
 V7FeOGPRLjvpswxlQT5NvS3cIDdcwIQDqaA8z8NYfL/OEeP0QAtwwz7z3+2SaFflqdpAB8l22Bp
 ugKEVhG7d724QcuWuksl22g8bkqDztD2hk1d7mfaSXgcZwe0nAnytxJjPZJlMc1Ezw1yB+fNpX8
 DpxpjiG7EqWlrsMdkSiQwrlp3EZMXbbe+bwlsW2XA60B1LXOfk=
X-Google-Smtp-Source: AGHT+IHWoG28bTrMLzheeQiCjeMMmJBo8021kxrCPGco+0bzbb9f9olxsF6hR8Fu+U6DrLkdsrwMxulO25HwgR0LCzw=
X-Received: by 2002:a05:6214:e6e:b0:709:e0d9:c505 with SMTP id
 6a1803df08f44-70d9714413amr904216d6.24.1755792757635; Thu, 21 Aug 2025
 09:12:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250820113435.2319994-1-wangzhaolong@huaweicloud.com>
In-Reply-To: <20250820113435.2319994-1-wangzhaolong@huaweicloud.com>
Date: Thu, 21 Aug 2025 11:12:23 -0500
X-Gm-Features: Ac12FXxEYuF7qAeThyxqYaf-_myLpXNgoHIoU6dThfB_hT38gBqDrx9UlMxU004
Message-ID: <CAH2r5msNho7x0aQ9XZ=ra8hw=z4P-U74iS6SzcL+pDbp5R21UQ@mail.gmail.com>
Subject: Re: [PATCH V5] smb: client: Fix mount deadlock by avoiding super
 block iteration in DFS reconnect
To: Wang Zhaolong <wangzhaolong@huaweicloud.com>
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
Cc: linux-cifs@vger.kernel.org, pc@manguebit.org, yi.zhang@huawei.com,
 yangerkun@huawei.com, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, chengzhihao1@huawei.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Does this patch deal with the regression with multiuser mounts that
Paulo mentioned in the earlier email?

On Wed, Aug 20, 2025 at 6:43=E2=80=AFAM Wang Zhaolong
<wangzhaolong@huaweicloud.com> wrote:
>
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
> The issue stems from cifs_get_dfs_tcon_super() using iterate_supers_type(=
)
> which reacquires the s_umount lock that's already held by the mount
> process.
>
> However, after commit a091d9711bde ("smb:client: smb: client: Add reverse
> mapping from tcon to superblocks"), we have a more direct way to access
> associated superblocks through tcon->cifs_sb_list, which was originally
> introduced to update I/O sizes after reconnection.
>
> This patch leverages the existing tcon->cifs_sb_list infrastructure to
> directly update DFS mount prepaths without needing to search through all
> superblocks.
>
> The key changes are:
> - Add update_tcon_super_prepaths() to update all related superblocks
> - Remove now-unused cifs_get_dfs_tcon_super() and related callback code
> - Update tree_connect_dfs_target() to use the new direct approach
>
> Fixes: 3ae872de4107 ("smb: client: fix shared DFS root mounts with differ=
ent prefixes")
> Signed-off-by: Wang Zhaolong <wangzhaolong@huaweicloud.com>
> ---
>
> V5:
>  - Extract update logic into update_tcon_super_prepaths() function
>  - Add error logging for prepath update failures
>  - Leverage existing tcon->cifs_sb_list infrastructure instead of iterate=
_supers_type()
>  - Remove now-unused cifs_get_dfs_tcon_super() and related callback code
>
> V4:
>  - Perform a null pointer check on the return value of cifs_get_dfs_tcon_=
super()
>    to prevent NULL ptr dereference with DFS multiuser mount
>
> V3:
>  - Adjust the trace diagram for the super_lock_shared() section to align =
with
>    the latest mainline call flow.
>
> V2:
>  - Adjust the trace diagram in the commit message to indicate when the lo=
ck
>    is released
>
>  fs/smb/client/cifsproto.h |  2 --
>  fs/smb/client/dfs.c       | 32 +++++++++++------
>  fs/smb/client/misc.c      | 76 ---------------------------------------
>  3 files changed, 21 insertions(+), 89 deletions(-)
>
> diff --git a/fs/smb/client/cifsproto.h b/fs/smb/client/cifsproto.h
> index c34c533b2efa..6b55582b427a 100644
> --- a/fs/smb/client/cifsproto.h
> +++ b/fs/smb/client/cifsproto.h
> @@ -677,12 +677,10 @@ void extract_unc_hostname(const char *unc, const ch=
ar **h, size_t *len);
>  int copy_path_name(char *dst, const char *src);
>  int smb2_parse_query_directory(struct cifs_tcon *tcon, struct kvec *rsp_=
iov,
>                                int resp_buftype,
>                                struct cifs_search_info *srch_inf);
>
> -struct super_block *cifs_get_dfs_tcon_super(struct cifs_tcon *tcon);
> -void cifs_put_tcp_super(struct super_block *sb);
>  int cifs_update_super_prepath(struct cifs_sb_info *cifs_sb, char *prefix=
);
>  char *extract_hostname(const char *unc);
>  char *extract_sharename(const char *unc);
>  int parse_reparse_point(struct reparse_data_buffer *buf,
>                         u32 plen, struct cifs_sb_info *cifs_sb,
> diff --git a/fs/smb/client/dfs.c b/fs/smb/client/dfs.c
> index f65a8a90ba27..cb0532e3868f 100644
> --- a/fs/smb/client/dfs.c
> +++ b/fs/smb/client/dfs.c
> @@ -331,13 +331,30 @@ static int target_share_matches_server(struct TCP_S=
erver_Info *server, char *sha
>         }
>         cifs_server_unlock(server);
>         return rc;
>  }
>
> +static int update_tcon_super_prepaths(struct cifs_tcon *tcon, const char=
 *prefix)
> +{
> +       struct cifs_sb_info *cifs_sb;
> +       int rc =3D 0;
> +
> +       spin_lock(&tcon->sb_list_lock);
> +       list_for_each_entry(cifs_sb, &tcon->cifs_sb_list, tcon_sb_link) {
> +               rc =3D cifs_update_super_prepath(cifs_sb, (char *)prefix)=
;
> +               if (rc) {
> +                       cifs_dbg(VFS, "Failed to update prepath for super=
block: %d\n", rc);
> +                       break;
> +               }
> +       }
> +       spin_unlock(&tcon->sb_list_lock);
> +
> +       return rc;
> +}
> +
>  static int tree_connect_dfs_target(const unsigned int xid,
>                                    struct cifs_tcon *tcon,
> -                                  struct cifs_sb_info *cifs_sb,
>                                    char *tree, bool islink,
>                                    struct dfs_cache_tgt_list *tl)
>  {
>         const struct smb_version_operations *ops =3D tcon->ses->server->o=
ps;
>         struct TCP_Server_Info *server =3D tcon->ses->server;
> @@ -370,12 +387,12 @@ static int tree_connect_dfs_target(const unsigned i=
nt xid,
>
>                 dfs_cache_noreq_update_tgthint(server->leaf_fullpath + 1,=
 tit);
>                 scnprintf(tree, MAX_TREE_SIZE, "\\%s", share);
>                 rc =3D ops->tree_connect(xid, tcon->ses, tree,
>                                        tcon, tcon->ses->local_nls);
> -               if (islink && !rc && cifs_sb)
> -                       rc =3D cifs_update_super_prepath(cifs_sb, prefix)=
;
> +               if (islink && !rc && READ_ONCE(tcon->origin_fullpath))
> +                       rc =3D update_tcon_super_prepaths(tcon, prefix);
>                 break;
>         }
>
>         kfree(share);
>         kfree(prefix);
> @@ -387,12 +404,10 @@ int cifs_tree_connect(const unsigned int xid, struc=
t cifs_tcon *tcon)
>  {
>         int rc;
>         struct TCP_Server_Info *server =3D tcon->ses->server;
>         const struct smb_version_operations *ops =3D server->ops;
>         DFS_CACHE_TGT_LIST(tl);
> -       struct cifs_sb_info *cifs_sb =3D NULL;
> -       struct super_block *sb =3D NULL;
>         struct dfs_info3_param ref =3D {0};
>         char *tree;
>
>         /* only send once per connect */
>         spin_lock(&tcon->tc_lock);
> @@ -428,29 +443,24 @@ int cifs_tree_connect(const unsigned int xid, struc=
t cifs_tcon *tcon)
>                 rc =3D ops->tree_connect(xid, tcon->ses, tree,
>                                        tcon, tcon->ses->local_nls);
>                 goto out;
>         }
>
> -       sb =3D cifs_get_dfs_tcon_super(tcon);
> -       if (!IS_ERR(sb))
> -               cifs_sb =3D CIFS_SB(sb);
> -
>         /* Tree connect to last share in @tcon->tree_name if no DFS refer=
ral */
>         if (!server->leaf_fullpath ||
>             dfs_cache_noreq_find(server->leaf_fullpath + 1, &ref, &tl)) {
>                 rc =3D ops->tree_connect(xid, tcon->ses, tcon->tree_name,
>                                        tcon, tcon->ses->local_nls);
>                 goto out;
>         }
>
> -       rc =3D tree_connect_dfs_target(xid, tcon, cifs_sb, tree, ref.serv=
er_type =3D=3D DFS_TYPE_LINK,
> +       rc =3D tree_connect_dfs_target(xid, tcon, tree, ref.server_type =
=3D=3D DFS_TYPE_LINK,
>                                      &tl);
>         free_dfs_info_param(&ref);
>
>  out:
>         kfree(tree);
> -       cifs_put_tcp_super(sb);
>
>         if (rc) {
>                 spin_lock(&tcon->tc_lock);
>                 if (tcon->status =3D=3D TID_IN_TCON)
>                         tcon->status =3D TID_NEED_TCON;
> diff --git a/fs/smb/client/misc.c b/fs/smb/client/misc.c
> index da23cc12a52c..3eedcca0d7f9 100644
> --- a/fs/smb/client/misc.c
> +++ b/fs/smb/client/misc.c
> @@ -1108,86 +1108,10 @@ int copy_path_name(char *dst, const char *src)
>         /* we count the trailing nul */
>         name_len++;
>         return name_len;
>  }
>
> -struct super_cb_data {
> -       void *data;
> -       struct super_block *sb;
> -};
> -
> -static void tcon_super_cb(struct super_block *sb, void *arg)
> -{
> -       struct super_cb_data *sd =3D arg;
> -       struct cifs_sb_info *cifs_sb;
> -       struct cifs_tcon *t1 =3D sd->data, *t2;
> -
> -       if (sd->sb)
> -               return;
> -
> -       cifs_sb =3D CIFS_SB(sb);
> -       t2 =3D cifs_sb_master_tcon(cifs_sb);
> -
> -       spin_lock(&t2->tc_lock);
> -       if ((t1->ses =3D=3D t2->ses ||
> -            t1->ses->dfs_root_ses =3D=3D t2->ses->dfs_root_ses) &&
> -           t1->ses->server =3D=3D t2->ses->server &&
> -           t2->origin_fullpath &&
> -           dfs_src_pathname_equal(t2->origin_fullpath, t1->origin_fullpa=
th))
> -               sd->sb =3D sb;
> -       spin_unlock(&t2->tc_lock);
> -}
> -
> -static struct super_block *__cifs_get_super(void (*f)(struct super_block=
 *, void *),
> -                                           void *data)
> -{
> -       struct super_cb_data sd =3D {
> -               .data =3D data,
> -               .sb =3D NULL,
> -       };
> -       struct file_system_type **fs_type =3D (struct file_system_type *[=
]) {
> -               &cifs_fs_type, &smb3_fs_type, NULL,
> -       };
> -
> -       for (; *fs_type; fs_type++) {
> -               iterate_supers_type(*fs_type, f, &sd);
> -               if (sd.sb) {
> -                       /*
> -                        * Grab an active reference in order to prevent a=
utomounts (DFS links)
> -                        * of expiring and then freeing up our cifs super=
block pointer while
> -                        * we're doing failover.
> -                        */
> -                       cifs_sb_active(sd.sb);
> -                       return sd.sb;
> -               }
> -       }
> -       pr_warn_once("%s: could not find dfs superblock\n", __func__);
> -       return ERR_PTR(-EINVAL);
> -}
> -
> -static void __cifs_put_super(struct super_block *sb)
> -{
> -       if (!IS_ERR_OR_NULL(sb))
> -               cifs_sb_deactive(sb);
> -}
> -
> -struct super_block *cifs_get_dfs_tcon_super(struct cifs_tcon *tcon)
> -{
> -       spin_lock(&tcon->tc_lock);
> -       if (!tcon->origin_fullpath) {
> -               spin_unlock(&tcon->tc_lock);
> -               return ERR_PTR(-ENOENT);
> -       }
> -       spin_unlock(&tcon->tc_lock);
> -       return __cifs_get_super(tcon_super_cb, tcon);
> -}
> -
> -void cifs_put_tcp_super(struct super_block *sb)
> -{
> -       __cifs_put_super(sb);
> -}
> -
>  #ifdef CONFIG_CIFS_DFS_UPCALL
>  int match_target_ip(struct TCP_Server_Info *server,
>                     const char *host, size_t hostlen,
>                     bool *result)
>  {
> --
> 2.39.2
>
>


--=20
Thanks,

Steve

