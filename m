Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 10254B25030
	for <lists+samba-technical@lfdr.de>; Wed, 13 Aug 2025 18:54:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=E6MBle6Z24FhG97vr5wn3kmkBwAjL03U/pWvhNnifGQ=; b=KpH0sBeFyz2zRhtrU0BNfOccRX
	O/3GW9TDKQDXmbKXVBXNtcnn2QNKeVBbjz3b5QUoVuidVt/GmFvD+UHgB+3mAnmhQuPchzk+nxNZc
	dqbaiNPRIeq59tci8XCR6Mi3ZIoTQxyRooS5GDjfQvvoPb8TKZ/+mvvKbB6CPCeQDM9O0LRugwXqv
	ZVfp4ppKydyGgecy8L/XGfzsxbCnq9MiHDspB4xCkcTfnaIAHQv5adXQkqdzXZ6iZtyhYwj5aHwkY
	vD7wNJEIpsLiDz1FPavaDPwHHeYWFyl6P1MAYlAxdWcU+AmlesTbVcecA/LjzuABmvTU/5FGnVIX5
	74G4kluQ==;
Received: from ip6-localhost ([::1]:58232 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1umEjG-00Eya1-2q; Wed, 13 Aug 2025 16:53:34 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:43460) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1umEjB-00EyZu-AB
 for samba-technical@lists.samba.org; Wed, 13 Aug 2025 16:53:31 +0000
Received: by mail-qv1-xf36.google.com with SMTP id
 6a1803df08f44-709e781cf2eso8978786d6.1
 for <samba-technical@lists.samba.org>; Wed, 13 Aug 2025 09:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755104007; x=1755708807; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E6MBle6Z24FhG97vr5wn3kmkBwAjL03U/pWvhNnifGQ=;
 b=B3CFrcKS4/eXBsz8X19dTgMzmQ55JdnaX5Dw4RCvTuprjIkNZMsAdYlU6px2HPR5Rq
 BRPZ0zxRIt5fIp7yWKVw0VZVey9nZEbAK231RzskKKYOZl7ufmG0cJQ2Ld2PfN/5K+j2
 pGSHK5ZcYD/2a5y+kJkeJBmeIU8htZQpG3oN9o73tKSdNQq8DEKvYXjvWlWi5GT5n27A
 LiT8YGyXLInDUEyFGQO180KUWc0yPkqMiRqB+AOvgxy3dJnfWGFETdb0cYBa0bfmpQPw
 vc0KNxUMqb6C6IBUL+4N62lrWhrkIUE97ZkMyIxFqLfOY+HeWx5zcXAKDW5zC7Ssiv4G
 TGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755104007; x=1755708807;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E6MBle6Z24FhG97vr5wn3kmkBwAjL03U/pWvhNnifGQ=;
 b=hKfIrJmVnYhPELZ1/oNFi53LIVvgfpRtTVnGnbJ/lbrdthuQJqP0SUibOVAkBS+eDS
 30dvH39VEap8RNRCz5TOSVRz+bnt9jYt/Hiq98rpYihem9UfNZmfZgf+ib2NwuE8gjWb
 k94np1rY6ROU0KysCAGryoeW13FhJQ/szORxOe8SsGLdaxMzIKlrb2xf/OQ1cB4s7HVY
 xS2F8WhEScJBch+D+sSeA9kx8YaGWATFIBGrb+gxDlWaJNiA7IVveQHNNtoIhnbpX8EX
 fWtym1M7XMg9zDkWIf1VZirR0kuVq18MwOZNs8JIgLJ+oq/r3tUXaFmtFaDznAvwXdVh
 KUHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYw9++g0R28vmJqa6hC4Pz+yl0eNaC9kLAup/UfddbQEmQBJnQPX+jpK3Ce/HlSC91hos7F4YTpjoNltPhq4w=@lists.samba.org
X-Gm-Message-State: AOJu0YzYu1k2ukrLH63SXHoUcPWivTrz4xG/t0PQnbfApClD4w7StxdX
 +YKPpBkrczkONW9XmLSyJy1OooReeAvfD1D0c+bqUpAFX4CVFdloLxMoWa9gFJnSKX7onS7wIgl
 mrbiKlq19VIjEqiNXdFuoi09qkRlDewp5Sg==
X-Gm-Gg: ASbGncs7eOQippr+9QDXBp4b0JCQn1wMU9ewiQezf9+pkTHBO6RSbOiSgmQ9Chkunoi
 oUZ1x10nd25p+kMM9awbick86uOQ4EOlamLlqgbJQsgeZQob+/JmTYMnTiQ+BehFeSGKQY/QSGK
 d4ROhTQjN4G4/u3GP1+EmusCyZ8If7HNGXybIz0nvgxyS6IAJOeTRmsw8mdxDMmMFxhHTB1NzWT
 DRxTYYum+OHsxKQFJJbc3ZhFRhXYu9xbRLUAVhL6LCAZ09W120A
X-Google-Smtp-Source: AGHT+IECQND+XqtTbw7Y9RUWpI1uatVVVMbY2m/QKwsk9Ucsr1Q5zhTzhe5vVFE6px3hRjNRtbob2TkYFNLDrEZLtlc=
X-Received: by 2002:ad4:5bc9:0:b0:709:e195:1d38 with SMTP id
 6a1803df08f44-70aabf6b4bamr3522486d6.20.1755104006958; Wed, 13 Aug 2025
 09:53:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250813013208.1564486-1-wangzhaolong@huaweicloud.com>
In-Reply-To: <20250813013208.1564486-1-wangzhaolong@huaweicloud.com>
Date: Wed, 13 Aug 2025 11:53:15 -0500
X-Gm-Features: Ac12FXwDl1gDIvtuqR_qfn_WtLSHol40_2dK0aruUtkoIBL1BCuIdeSs0veojLo
Message-ID: <CAH2r5msXPbOu5pbZhzHb6ckMP=KAx_rJN9Rc+-8LHP0vSFDGQw@mail.gmail.com>
Subject: Re: [PATCH V3] smb: client: Fix mount deadlock by avoiding super
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

Tentatively merged into cifs-2.6.git for-next but still pending more
testing and reviews

On Tue, Aug 12, 2025 at 8:39=E2=80=AFPM Wang Zhaolong
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
>                                 super_lock_shared
>                                   super_lock
>                                     __super_lock
>                                       down_read(&sb->s_umount); // Deadlo=
ck
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
> Fixes: 3ae872de4107 ("smb: client: fix shared DFS root mounts with differ=
ent prefixes")
> Signed-off-by: Wang Zhaolong <wangzhaolong@huaweicloud.com>
> ---
>
> V3:
>  - Adjust the trace diagram for the super_lock_shared() section to align =
with
>    the latest mainline call flow.
> V2:
>  - Adjust the trace diagram in the commit message to indicate when the lo=
ck
>    is released
>
>  fs/smb/client/cifs_fs_sb.h |  1 +
>  fs/smb/client/cifsfs.c     |  1 +
>  fs/smb/client/cifsproto.h  |  2 +-
>  fs/smb/client/dfs.c        |  2 +-
>  fs/smb/client/misc.c       | 84 ++++++++++++++------------------------
>  5 files changed, 34 insertions(+), 56 deletions(-)
>
> diff --git a/fs/smb/client/cifs_fs_sb.h b/fs/smb/client/cifs_fs_sb.h
> index 5e8d163cb5f8..8c513e4c0efe 100644
> --- a/fs/smb/client/cifs_fs_sb.h
> +++ b/fs/smb/client/cifs_fs_sb.h
> @@ -49,10 +49,11 @@
>
>  struct cifs_sb_info {
>         struct rb_root tlink_tree;
>         struct list_head tcon_sb_link;
>         spinlock_t tlink_tree_lock;
> +       struct super_block *vfs_sb;
>         struct tcon_link *master_tlink;
>         struct nls_table *local_nls;
>         struct smb3_fs_context *ctx;
>         atomic_t active;
>         unsigned int mnt_cifs_flags;
> diff --git a/fs/smb/client/cifsfs.c b/fs/smb/client/cifsfs.c
> index 3bd85ab2deb1..383f651eb43f 100644
> --- a/fs/smb/client/cifsfs.c
> +++ b/fs/smb/client/cifsfs.c
> @@ -939,10 +939,11 @@ cifs_get_root(struct smb3_fs_context *ctx, struct s=
uper_block *sb)
>
>  static int cifs_set_super(struct super_block *sb, void *data)
>  {
>         struct cifs_mnt_data *mnt_data =3D data;
>         sb->s_fs_info =3D mnt_data->cifs_sb;
> +       mnt_data->cifs_sb->vfs_sb =3D sb;
>         return set_anon_super(sb, NULL);
>  }
>
>  struct dentry *
>  cifs_smb3_do_mount(struct file_system_type *fs_type,
> diff --git a/fs/smb/client/cifsproto.h b/fs/smb/client/cifsproto.h
> index c34c533b2efa..6415bb961c1e 100644
> --- a/fs/smb/client/cifsproto.h
> +++ b/fs/smb/client/cifsproto.h
> @@ -678,11 +678,11 @@ int copy_path_name(char *dst, const char *src);
>  int smb2_parse_query_directory(struct cifs_tcon *tcon, struct kvec *rsp_=
iov,
>                                int resp_buftype,
>                                struct cifs_search_info *srch_inf);
>
>  struct super_block *cifs_get_dfs_tcon_super(struct cifs_tcon *tcon);
> -void cifs_put_tcp_super(struct super_block *sb);
> +void cifs_put_super(struct super_block *sb);
>  int cifs_update_super_prepath(struct cifs_sb_info *cifs_sb, char *prefix=
);
>  char *extract_hostname(const char *unc);
>  char *extract_sharename(const char *unc);
>  int parse_reparse_point(struct reparse_data_buffer *buf,
>                         u32 plen, struct cifs_sb_info *cifs_sb,
> diff --git a/fs/smb/client/dfs.c b/fs/smb/client/dfs.c
> index f65a8a90ba27..55bcdde4fe26 100644
> --- a/fs/smb/client/dfs.c
> +++ b/fs/smb/client/dfs.c
> @@ -446,11 +446,11 @@ int cifs_tree_connect(const unsigned int xid, struc=
t cifs_tcon *tcon)
>                                      &tl);
>         free_dfs_info_param(&ref);
>
>  out:
>         kfree(tree);
> -       cifs_put_tcp_super(sb);
> +       cifs_put_super(sb);
>
>         if (rc) {
>                 spin_lock(&tcon->tc_lock);
>                 if (tcon->status =3D=3D TID_IN_TCON)
>                         tcon->status =3D TID_NEED_TCON;
> diff --git a/fs/smb/client/misc.c b/fs/smb/client/misc.c
> index da23cc12a52c..3b6920a52daa 100644
> --- a/fs/smb/client/misc.c
> +++ b/fs/smb/client/misc.c
> @@ -1108,84 +1108,60 @@ int copy_path_name(char *dst, const char *src)
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
> +static struct super_block *cifs_get_tcon_super(struct cifs_tcon *tcon)
>  {
> -       struct super_cb_data *sd =3D arg;
> +       struct super_block *sb;
>         struct cifs_sb_info *cifs_sb;
> -       struct cifs_tcon *t1 =3D sd->data, *t2;
>
> -       if (sd->sb)
> -               return;
> +       if (!tcon)
> +               return NULL;
>
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
> +       spin_lock(&tcon->sb_list_lock);
> +       list_for_each_entry(cifs_sb, &tcon->cifs_sb_list, tcon_sb_link) {
>
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
> +               if (!cifs_sb->vfs_sb)
> +                       continue;
> +
> +               sb =3D cifs_sb->vfs_sb;
> +
> +               /* Safely increment s_active only if it's not zero.
> +                *
> +                * When s_active =3D=3D 0, the super block is being deact=
ivated
> +                * and should not be used. This prevents UAF scenarios
> +                * where we might grab a reference to a super block that'=
s
> +                * in the middle of destruction.
> +                */
> +               if (!atomic_add_unless(&sb->s_active, 1, 0))
> +                       continue;
> +
> +               spin_unlock(&tcon->sb_list_lock);
> +               return sb;
>         }
> -       pr_warn_once("%s: could not find dfs superblock\n", __func__);
> -       return ERR_PTR(-EINVAL);
> -}
> +       spin_unlock(&tcon->sb_list_lock);
>
> -static void __cifs_put_super(struct super_block *sb)
> -{
> -       if (!IS_ERR_OR_NULL(sb))
> -               cifs_sb_deactive(sb);
> +       return NULL;
>  }
>
>  struct super_block *cifs_get_dfs_tcon_super(struct cifs_tcon *tcon)
>  {
>         spin_lock(&tcon->tc_lock);
>         if (!tcon->origin_fullpath) {
>                 spin_unlock(&tcon->tc_lock);
>                 return ERR_PTR(-ENOENT);
>         }
>         spin_unlock(&tcon->tc_lock);
> -       return __cifs_get_super(tcon_super_cb, tcon);
> +
> +       return cifs_get_tcon_super(tcon);
>  }
>
> -void cifs_put_tcp_super(struct super_block *sb)
> +void cifs_put_super(struct super_block *sb)
>  {
> -       __cifs_put_super(sb);
> +       if (!IS_ERR_OR_NULL(sb))
> +               deactivate_super(sb);
>  }
>
>  #ifdef CONFIG_CIFS_DFS_UPCALL
>  int match_target_ip(struct TCP_Server_Info *server,
>                     const char *host, size_t hostlen,
> --
> 2.39.2
>
>


--=20
Thanks,

Steve

