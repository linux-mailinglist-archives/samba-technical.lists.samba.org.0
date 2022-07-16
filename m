Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB3D576B82
	for <lists+samba-technical@lfdr.de>; Sat, 16 Jul 2022 05:48:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=QGWfWYXPfiLvd3vbWyevJ7CNG70A+KKafGnsLWBzmhQ=; b=3hh0qQ6iBSJsTKQIO6xSnDZRQB
	QFeCddH3YBBn/uw842AC0yq4uqaDIJBnl/qJ2UL7Flg5b+AvMKKMmS+D1WMUssEBwh5X8YVU8yalQ
	f9ketL+/k2uD7WeQIzUgqQ7iwIwWYkk1s/q9DDxV7LA/LxM03rJ5BkrrK2OcxzOTsULaLD9/4MdFg
	UoDo7wMZECZIqD92cK6eDDWb0HZ1jlTRJ5XbYLMxWgMBAUJuZFAW3f7dmayQDnAqHVsgEy85njzXf
	b7TA/eI+EkREAEbIpz5OoQMxXAPtqA3fyiKof7GQqi/MQ4Wu1hMXt6KxPKVI7sYIR/13xgl5zJVci
	gs2UNYLg==;
Received: from ip6-localhost ([::1]:34422 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oCYmG-000IY5-RE; Sat, 16 Jul 2022 03:47:36 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33]:35443) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oCYm7-000IXw-VV
 for samba-technical@lists.samba.org; Sat, 16 Jul 2022 03:47:33 +0000
Received: by mail-vs1-xe33.google.com with SMTP id 189so5849631vsh.2
 for <samba-technical@lists.samba.org>; Fri, 15 Jul 2022 20:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QGWfWYXPfiLvd3vbWyevJ7CNG70A+KKafGnsLWBzmhQ=;
 b=BJLdSuZMAjyLFWccG4cfKkDk0+ocVeQ4ngluR72PnJWHGuQ68HvDDHXgAt+Mmxe6WC
 EIS1FaeHTDxK2PdJmnHW9HTt+3xHifpUqw2dXV1z09C0Lksupe+oV0kj2X+CsjDxZCyP
 h3riAwmShyLV7PqCvnYHWjNv0C106qMNfHQlNTJouHGWc+LGqs1U8H4saJbHeJQhscqu
 TBRfJ+OGNDTkq+byEQ0KhOBHgQW+gNqxxp7rlNX3eb6lwlEW40AwCbcIFDoMJOWuTRqZ
 XZEBnJjzHwQ6ceycVctxbyy1oM8BBFMcz8hkz0y1v9EvAjvI6Jylc9NTCu/WkoqIJeiK
 27wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QGWfWYXPfiLvd3vbWyevJ7CNG70A+KKafGnsLWBzmhQ=;
 b=CTjjHS13oyHEUC7e25DozYj8qOsLOIUcMkB29fuhkdNsj5o9D/rNtL1PR5jjg0+OPg
 1mSU6uddgjLX3QXe+nCSwTSoOdME6zs4/dYseDvPvcv7gW75IdUz0cor1di4554IGNHB
 CK1VZ/ntA5PW75wZdFDlzVmbjKBd5z7eQFSPZfJI23Dzi+eUsm6h7O9abgETIsQshZ5x
 H8WeWSMxqgTMBGOy3SpRs8Xc1yQ00Pd1fXYqDVjWiSCjSZwyYvppNK95Mr5TNFzln+aX
 uAOI+T7B1MdU+PkFZ++m/d9/Pyc4MmzLitks96bv/bpo4SaaQTzRfkaDAmW3ua9AYMqq
 MllQ==
X-Gm-Message-State: AJIora/Ee75uzfPXWyWTU26tzcPQZynxP1rLlvdN8y48W0RCzuiPyITX
 0mX9vTFaHtTIam1SKggrwPzr6VWYGlTfxGLaO54=
X-Google-Smtp-Source: AGRyM1tx8tFiDZjLT1QTBMByoqYqfgK/aCT2vNiHoLT+Auh0f4oSTW1bdA3gdqAvJcKRxQ5iW/k8xJ/vRG5ugDNkMMQ=
X-Received: by 2002:a67:c98e:0:b0:356:fb90:f729 with SMTP id
 y14-20020a67c98e000000b00356fb90f729mr7377409vsk.17.1657943245480; Fri, 15
 Jul 2022 20:47:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220630093027.26200-1-yuzhe@nfschina.com>
In-Reply-To: <20220630093027.26200-1-yuzhe@nfschina.com>
Date: Fri, 15 Jul 2022 22:47:14 -0500
Message-ID: <CAH2r5mvOwRH_N8NuouK=N0yDqcCZD2chxZM=52y11a5-yrZAeg@mail.gmail.com>
Subject: Re: [PATCH] cifs: remove unnecessary type castings
To: Yu Zhe <yuzhe@nfschina.com>
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
Cc: Steve French <sfrench@samba.org>, CIFS <linux-cifs@vger.kernel.org>,
 liqiong@nfschina.com, samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Thu, Jun 30, 2022 at 4:38 AM Yu Zhe <yuzhe@nfschina.com> wrote:
>
> remove unnecessary void* type castings.
>
> Signed-off-by: Yu Zhe <yuzhe@nfschina.com>
> ---
>  fs/cifs/connect.c  | 2 +-
>  fs/cifs/inode.c    | 4 ++--
>  fs/cifs/netmisc.c  | 2 +-
>  fs/cifs/smb2misc.c | 2 +-
>  fs/cifs/smb2pdu.c  | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
> index fa29c9aae24b..90863b3b5204 100644
> --- a/fs/cifs/connect.c
> +++ b/fs/cifs/connect.c
> @@ -2646,7 +2646,7 @@ match_prepath(struct super_block *sb, struct cifs_mnt_data *mnt_data)
>  int
>  cifs_match_super(struct super_block *sb, void *data)
>  {
> -       struct cifs_mnt_data *mnt_data = (struct cifs_mnt_data *)data;
> +       struct cifs_mnt_data *mnt_data = data;
>         struct smb3_fs_context *ctx;
>         struct cifs_sb_info *cifs_sb;
>         struct TCP_Server_Info *tcp_srv;
> diff --git a/fs/cifs/inode.c b/fs/cifs/inode.c
> index 81da81e18553..3ad303dd5e5a 100644
> --- a/fs/cifs/inode.c
> +++ b/fs/cifs/inode.c
> @@ -1223,7 +1223,7 @@ static const struct inode_operations cifs_ipc_inode_ops = {
>  static int
>  cifs_find_inode(struct inode *inode, void *opaque)
>  {
> -       struct cifs_fattr *fattr = (struct cifs_fattr *) opaque;
> +       struct cifs_fattr *fattr = opaque;
>
>         /* don't match inode with different uniqueid */
>         if (CIFS_I(inode)->uniqueid != fattr->cf_uniqueid)
> @@ -1247,7 +1247,7 @@ cifs_find_inode(struct inode *inode, void *opaque)
>  static int
>  cifs_init_inode(struct inode *inode, void *opaque)
>  {
> -       struct cifs_fattr *fattr = (struct cifs_fattr *) opaque;
> +       struct cifs_fattr *fattr = opaque;
>
>         CIFS_I(inode)->uniqueid = fattr->cf_uniqueid;
>         CIFS_I(inode)->createtime = fattr->cf_createtime;
> diff --git a/fs/cifs/netmisc.c b/fs/cifs/netmisc.c
> index 235aa1b395eb..28caae7aed1b 100644
> --- a/fs/cifs/netmisc.c
> +++ b/fs/cifs/netmisc.c
> @@ -911,7 +911,7 @@ map_and_check_smb_error(struct mid_q_entry *mid, bool logErr)
>  unsigned int
>  smbCalcSize(void *buf, struct TCP_Server_Info *server)
>  {
> -       struct smb_hdr *ptr = (struct smb_hdr *)buf;
> +       struct smb_hdr *ptr = buf;
>         return (sizeof(struct smb_hdr) + (2 * ptr->WordCount) +
>                 2 /* size of the bcc field */ + get_bcc(ptr));
>  }
> diff --git a/fs/cifs/smb2misc.c b/fs/cifs/smb2misc.c
> index 17813c3d0c6e..db0f27fd373b 100644
> --- a/fs/cifs/smb2misc.c
> +++ b/fs/cifs/smb2misc.c
> @@ -402,7 +402,7 @@ smb2_get_data_area_len(int *off, int *len, struct smb2_hdr *shdr)
>  unsigned int
>  smb2_calc_size(void *buf, struct TCP_Server_Info *srvr)
>  {
> -       struct smb2_pdu *pdu = (struct smb2_pdu *)buf;
> +       struct smb2_pdu *pdu = buf;
>         struct smb2_hdr *shdr = &pdu->hdr;
>         int offset; /* the offset from the beginning of SMB to data area */
>         int data_length; /* the length of the variable length data area */
> diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
> index 12b4dddaedb0..92fb513e5478 100644
> --- a/fs/cifs/smb2pdu.c
> +++ b/fs/cifs/smb2pdu.c
> @@ -354,7 +354,7 @@ fill_small_buf(__le16 smb2_command, struct cifs_tcon *tcon,
>                void *buf,
>                unsigned int *total_len)
>  {
> -       struct smb2_pdu *spdu = (struct smb2_pdu *)buf;
> +       struct smb2_pdu *spdu = buf;
>         /* lookup word count ie StructureSize from table */
>         __u16 parmsize = smb2_req_struct_sizes[le16_to_cpu(smb2_command)];
>
> --
> 2.11.0
>


-- 
Thanks,

Steve

