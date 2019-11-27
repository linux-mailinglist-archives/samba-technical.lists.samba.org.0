Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A051410B48E
	for <lists+samba-technical@lfdr.de>; Wed, 27 Nov 2019 18:36:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=m/7eafJgfpqueNmh9ZRZEk1gJa1dWUpLF0+zUtuTQtk=; b=gkVfxV52MCbCsXemAa8Y4MhcDV
	BXPUj4/2RgFr76wLljM9YHomAcP+zWHEuydWW49/5a6tfJ+Glfng9Ou/qx3WbTqFpiPM+vxgao92u
	RMISx5nElfEuAoxoIQq5VkuyoIepZunUewqLLOOhMSvb28rUoKwCiqPqx/XQmFV82eK0j+On5BNFh
	QL6bfuu0vd7hqB4h85GRMivYo09eaXePkt63PgOqTDJfaC/VMmQCHJ+hy42cbRYpnV7v559h1gMM/
	YQjBo0uReP37BxnNH3IVVsdN/NWQeMTMSZLVBWX9tqn1UHKQWe9dsumVJqy9A1L7k7H8/MyryhLXA
	SHlaK9oA==;
Received: from localhost ([::1]:25710 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ia1Dz-002r1o-Ft; Wed, 27 Nov 2019 17:35:35 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:43805) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ia1Dm-002r1h-Db
 for samba-technical@lists.samba.org; Wed, 27 Nov 2019 17:35:25 +0000
Received: by mail-il1-x142.google.com with SMTP id r9so21691629ilq.10
 for <samba-technical@lists.samba.org>; Wed, 27 Nov 2019 09:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m/7eafJgfpqueNmh9ZRZEk1gJa1dWUpLF0+zUtuTQtk=;
 b=kzH4NtVh4OYNO5XWK5q2X34roBeaEFv1hYVrJESPnFMoeX4x6zh9tBek7hAClUkA4g
 k0u/lh3gbjt9kDolNMObn5NxGmBbkvjXhXKltFq5DyktQmHKmXKOzcMrleO4B9c8gL6u
 J7mnuhFXSY7YfFoP6RPu+Bp5dJDR0woy9Z0IHdGYtYOwbPNrf/xDomR1JGfefAL0Liuz
 Q3G9OtMFeRBKoRex2cSnSpSGpnRJaooF0TyxQo6GhD17UXeaQGoP+0UqqDl0rVRkVKQz
 WlgoblxJza9sp4/4zTB3Z0fk6DVyt3n2DpJ/WsGkYjh9tgCL1TEagmjQp/WSOa6FD2FM
 djXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m/7eafJgfpqueNmh9ZRZEk1gJa1dWUpLF0+zUtuTQtk=;
 b=kDhU/YeVG3MXYY1pn63eBAjFEYNOCouzrSO44LGxzK0qtL9flvBL7CXWlXaffDEohD
 WPgbHX11LYoQ6aXthAvYsFON0Ib8HQzjLfz7hjsaxXInLkE9lepko99xyUz/ifBjQLt4
 GGbn9rjcL2B1HsQ2UFciDgv4NO2n4tdZ2xnNCJDV0VDQukv35Kh64DVgYKPc6Xnr8km4
 dBpRqBN0ZaGHuZbiSnNu3PBg9uXAJfKbAdvly7oQcrv3ReBkegzSp+WQmCnTa5pdTPcj
 /Up1HOyr3erMOZ0orGxHLB6CRnpqSw8Dt98OKRkn0ULFFxUUDDWV5GbPNf/0eFhCwVPi
 SV4Q==
X-Gm-Message-State: APjAAAU7ZpsGinH4bxUlhTmFDiWYa4+j9fb2zfAZ2ApBq1CpVHxYDO4D
 IEpGSw4KtgMX/HfZ7CuCpcTep62pNVH/oKVgQQM=
X-Google-Smtp-Source: APXvYqzfpLfQOzc7XEa3BV41a6BtYeGTMMZpACmEKhIdx9LxMLKPyflnCM1JcbwVuzhbPGp9MFPcwKQVTKF6qnH46ag=
X-Received: by 2002:a92:d642:: with SMTP id x2mr8753929ilp.169.1574876120477; 
 Wed, 27 Nov 2019 09:35:20 -0800 (PST)
MIME-Version: 1.0
References: <20191126071650.c76un267i4v6vuoz@kili.mountain>
In-Reply-To: <20191126071650.c76un267i4v6vuoz@kili.mountain>
Date: Wed, 27 Nov 2019 11:35:09 -0600
Message-ID: <CAH2r5mvtC4Dt3XDigxp5cqwEtjYCnSK3_aATiW0Dt0s9kBtTuA@mail.gmail.com>
Subject: Re: [PATCH] CIFS: fix a white space issue in cifs_get_inode_info()
To: Dan Carpenter <dan.carpenter@oracle.com>
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
 samba-technical <samba-technical@lists.samba.org>,
 kernel-janitors <kernel-janitors@vger.kernel.org>,
 Aurelien Aptel <aaptel@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Tue, Nov 26, 2019 at 6:14 AM Dan Carpenter via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> We accidentally messed up the indenting on this if statement.
>
> Fixes: 16c696a6c300 ("CIFS: refactor cifs_get_inode_info()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  fs/cifs/inode.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/fs/cifs/inode.c b/fs/cifs/inode.c
> index 1fec2e7d796a..8a76195e8a69 100644
> --- a/fs/cifs/inode.c
> +++ b/fs/cifs/inode.c
> @@ -967,7 +967,8 @@ cifs_get_inode_info(struct inode **inode,
>                 }
>         } else if (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_CIFS_ACL) {
>                 rc = cifs_acl_to_fattr(cifs_sb, &fattr, *inode, false,
> -                                      full_path, fid);         if (rc) {
> +                                      full_path, fid);
> +               if (rc) {
>                         cifs_dbg(FYI, "%s: Getting ACL failed with error: %d\n",
>                                  __func__, rc);
>                         goto out;
> --
> 2.11.0
>
>


-- 
Thanks,

Steve

