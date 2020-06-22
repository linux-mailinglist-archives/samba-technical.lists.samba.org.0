Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 829CA203E45
	for <lists+samba-technical@lfdr.de>; Mon, 22 Jun 2020 19:47:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=qtVrBo9zCm9WHKS+1UqbrkmxlJgEwTlf3D0xpFuHfTg=; b=bfdKrWBMRKzSW7lotV2XtZ+vqh
	xHb6k8y/qK0ePbnJTi3QYr197F6LVhEp3C3paVUZr8Vb3ivkJkyqYBLRnfvqj3ABQEOXWI8NUFYgR
	yOddwd4Sfoa8O8eYMCHS205T6fuyEVmuV/JCb4Y/THjglCNgRikoP1sLnjzW8IKXZ0kTR4OirEcxv
	vJGzsXlDQWFYvru1jdlR7pAjLO8Ll9KmB9lJBBoTEL1SUuzLmAaG9uVEuXQv0sf/jdtY+OgbOiPvi
	SoLRNqBzu2vOy/afrBXyHfQN5es1EHKlmdnxrJWZgvYLAvEwUAzX4Vof7ojHI4XjPvmVi7DgdgeoG
	p2mMe7yw==;
Received: from localhost ([::1]:18146 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jnQWk-001rZu-Pp; Mon, 22 Jun 2020 17:46:38 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:33489) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jnQWe-001rZn-9y
 for samba-technical@lists.samba.org; Mon, 22 Jun 2020 17:46:35 +0000
Received: by mail-ej1-x642.google.com with SMTP id n24so18909386ejd.0
 for <samba-technical@lists.samba.org>; Mon, 22 Jun 2020 10:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qtVrBo9zCm9WHKS+1UqbrkmxlJgEwTlf3D0xpFuHfTg=;
 b=Jngs8FdxtsELlqIPLhjsN4rsqQmYRHKs9CwwOTyqM4k/U7SrkP2pCbtJSYgBjlZ9Fr
 9goTLZ7HtFFIOvm/1KkZ9Bp7UqtPNewMhWJzwSHibEd6Vt0rgyxnoWph2HX910PBXG+p
 R0mEV7gN5uKYxXuhNFbXCPERN5dq742MJxBe9JIAj21Kqovwcor++ytCR/mD2jMdrSG7
 Xw5oomaPgqijdeBDRXe9R4CmE7nvFQBXhtNXuLCYXX6tSSoBox3eNyBFvbQmsqa0edcr
 kjJi4NauBLdFmBgQGwH7vj0ymIhyWj0svhr5pTaadajcrLhyhcrzeXzA5x4aC4wlx0fc
 LUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qtVrBo9zCm9WHKS+1UqbrkmxlJgEwTlf3D0xpFuHfTg=;
 b=rvW9rfSxqhV20nADkJeD+rOo6uu38t65jIv1lhoE9l8SKcoDVBXAeiOhOJhkKvQxvR
 vGeXpU7AP2PIzitOnmOqGaANG0id6jaR7xlCmtoXXCx1B8caNEQgWYEosmHoq9L3fZFO
 2uGfeJA1aHReCmn9jXTEmZiXkFOgvctyA1QHw6kLWU/6jUAFxSOgjhjkmjFXa9y4Lyjo
 IslIwSzcRPU8pBfVZH1JDyJs+qc8r3UM+Dely9hF/Y4R5gszw4Myw6p3JLsMzkN1HH/y
 XlDJ4AEXZIDyoiGZQTsiHOMtPMg3SAUcKoZ2brVh1BAjPOJgHJc7Y0b+vuQ+NriYroW2
 cp7Q==
X-Gm-Message-State: AOAM533tL5uM/jxH5zgImU4eciDSX2/a+n+nYDis138sHcZyOSokEkPu
 nC+MlWrdg0odQb+tR//Q/zeeJLc5GB1mePugEQ==
X-Google-Smtp-Source: ABdhPJzjNTTW/txt6qijBg4LwFKBAt9v9qwg7uLYVef1/LerVEws6433kX3BRsqFhAW0UUcvdTdoSBwtTW6/yq6lDy0=
X-Received: by 2002:a17:906:6a1b:: with SMTP id
 o27mr17307614ejr.271.1592847990718; 
 Mon, 22 Jun 2020 10:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200620025033.4180077-1-zhangxiaoxu5@huawei.com>
In-Reply-To: <20200620025033.4180077-1-zhangxiaoxu5@huawei.com>
Date: Mon, 22 Jun 2020 10:46:19 -0700
Message-ID: <CAKywueQD0aM3uJYmC0GbAj_F5RwcKNX1PS1_q+3dn6gyUR_+Xw@mail.gmail.com>
Subject: Re: [PATCH] cifs/smb3: Fix data inconsistent when zero file range
To: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
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
From: Pavel Shilovsky via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Shilovsky <piastryyy@gmail.com>
Cc: Steve French <sfrench@samba.org>, linux-cifs <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

=D0=BF=D1=82, 19 =D0=B8=D1=8E=D0=BD. 2020 =D0=B3. =D0=B2 22:04, Zhang Xiaox=
u <zhangxiaoxu5@huawei.com>:
>
> CIFS implements the fallocate(FALLOC_FL_ZERO_RANGE) with send SMB
> ioctl(FSCTL_SET_ZERO_DATA) to server. It just set the range of the
> remote file to zero, but local page cache not update, then the data
> inconsistent with server, which leads the xfstest generic/008 failed.
>
> So we need to remove the local page caches before send SMB
> ioctl(FSCTL_SET_ZERO_DATA) to server. After next read, it will
> re-cache it.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
> ---
>  fs/cifs/smb2ops.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
> index 736d86b8a910..250b51aca514 100644
> --- a/fs/cifs/smb2ops.c
> +++ b/fs/cifs/smb2ops.c
> @@ -3187,6 +3187,11 @@ static long smb3_zero_range(struct file *file, str=
uct cifs_tcon *tcon,
>         trace_smb3_zero_enter(xid, cfile->fid.persistent_fid, tcon->tid,
>                               ses->Suid, offset, len);
>
> +       /*
> +        * We zero the range through ioctl, so we need remove the page ca=
ches
> +        * first, otherwise the data may be inconsistent with the server.
> +        */
> +       truncate_pagecache_range(inode, offset, offset + len - 1);
>
>         /* if file not oplocked can't be sure whether asking to extend si=
ze */
>         if (!CIFS_CACHE_READ(cifsi))
> --
> 2.25.4
>

Looks good!

Reviewed-by: Pavel Shilovsky <pshilov@microsoft.com>

Don't we need to do the same for smb3_punch_hole()?

--
Best regards,
Pavel Shilovsky

