Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 74804413F1A
	for <lists+samba-technical@lfdr.de>; Wed, 22 Sep 2021 03:52:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=iJIazCWnX6yOgFmMKuP81y+fh3OFoGS5C6d27wUgHy4=; b=B/AW4Q0TnlqbGI/9YOWIr3k+fA
	WanYOs2sts7Hsob117bhfcWzrgBtAC/aPl2q45MrL5viBFvTGShSXLto2jdRo7+HeHLPJNZ8kuuaO
	PgUTmKUICmazy0k42lLF4baGeu5C/DE5LR+d/XyAeiGPnvhlyKJBw5FShOEsX+IC/zEpYPNzQaGjV
	19vIe6EpwulSkM6aP98OK4sJkM/bTYwSBadhpOEc5Q8KsQC7/c2Q6DMHosjbi+a0Zh1LTRSv0mazR
	wW4U3XIYitSXRiUSDpNeLhNxFljmMGV9NUu9yLJK6VyPqftKR+HaYrqEGU0reiYMHs2kiG8o8nz6k
	7Cj/8Gdw==;
Received: from ip6-localhost ([::1]:46104 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mSrR2-00GMQQ-Hh; Wed, 22 Sep 2021 01:52:32 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:45836) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mSrQw-00GMQH-H9
 for samba-technical@lists.samba.org; Wed, 22 Sep 2021 01:52:28 +0000
Received: by mail-lf1-x129.google.com with SMTP id u18so5147201lfd.12
 for <samba-technical@lists.samba.org>; Tue, 21 Sep 2021 18:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iJIazCWnX6yOgFmMKuP81y+fh3OFoGS5C6d27wUgHy4=;
 b=UEniQJTLhBnggz7K4ch50uBlvN1Q6S4zao1gXrs3QRUv2V2RxKmOTlw6Utk1vTwsoZ
 iLl3VNQixS/wfPpDcVJ2hUGBmVR+Wx5eJdT27Fo5ElDKEnan13fJ8nvDp1F7jPbcEg2L
 OvqwJbat5aukAMULGbolSUMfWG0yV5/Nj4rB1knfM/Q7QyGc5gjY/o55lj4R6/YIkvff
 6U+OVZ62grGNMQo+VQa38NHp2iwoCFF5p1D/BaoUrfrEk8i6Ty26pJMK6ySFHmgZmk80
 0YBMLtaiLdPne+9TR7/kneUG08mrb2I3txk+EC/oU/H2lEsbSIeF08RfVIaaR44As12/
 x+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iJIazCWnX6yOgFmMKuP81y+fh3OFoGS5C6d27wUgHy4=;
 b=U/b8A0Pm0WZDzqs5arqrnBwOQRcFmMjeHWvn65NtHywmmmTaMw2BPDMfjTGkgZs+YY
 kztBKWhOXH6lD5yeTeOy515yBfdddBx5mX+1BDBcEtmkC58VboaMi11I7hlHc5w1lp40
 EWzgQwm/SVr0/fomLzWtqIFD4hCf4R9ilPRzA5EctripR8LbArRLIMI5ae7iVIS97qgU
 z7Idl8YBc5mwxXuCyBt0n1WdFnY6olAToqLcQjXwzCiSM2svQm4bIFZk55vk65UbjAXM
 F1U7D107dv0Y/8bJsk4QYVcur5VHNoB7lXhBcLsgFzy5JknzHsf28i5o7gp+Gr+DQp8g
 5qZQ==
X-Gm-Message-State: AOAM531dCd8KGjHfYKYpDJ9qeFdVeei8oQqc2+EoElNZ00AukGje62Sz
 fcGS+pEcA64GkNYJXwiONieHAed+ShDXDYfqt0Y=
X-Google-Smtp-Source: ABdhPJzhYWusxsBksZjNLTQcc3upAL5LW4sq47+0/jy75RwLwASzEru/d4rRbgjSjey9bNe80Qk/Q7RPlNqtcOsk6os=
X-Received: by 2002:a2e:a288:: with SMTP id k8mr21782791lja.229.1632275543995; 
 Tue, 21 Sep 2021 18:52:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210921203335.GB16529@kili>
In-Reply-To: <20210921203335.GB16529@kili>
Date: Tue, 21 Sep 2021 20:52:13 -0500
Message-ID: <CAH2r5muJ3zXHszfGUiPoqziVqQi2rRVX=NBtzqhJR0+X66GjSA@mail.gmail.com>
Subject: Re: [PATCH] smbfs_client: fix a sign extension bug
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
 kernel-janitors <kernel-janitors@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Pavel Shilovsky <pshilov@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Tue, Sep 21, 2021 at 4:13 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The problem is the mismatched types between "ctx->total_len" which is
> an unsigned int, "rc" which is an int, and "ctx->rc" which is a
> ssize_t.  The code does:
>
>         ctx->rc = (rc == 0) ? ctx->total_len : rc;
>
> We want "ctx->rc" to store the negative "rc" error code.  But what
> happens is that "rc" is type promoted to a high unsigned int and
> 'ctx->rc" will store the high positive value instead of a negative
> value.
>
> The fix is to change "rc" from an int to a ssize_t.
>
> Fixes: c610c4b619e5 ("CIFS: Add asynchronous write support through kernel AIO")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  fs/smbfs_client/file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/smbfs_client/file.c b/fs/smbfs_client/file.c
> index 4d10c9343890..7db9ddb3381f 100644
> --- a/fs/smbfs_client/file.c
> +++ b/fs/smbfs_client/file.c
> @@ -3111,7 +3111,7 @@ static void collect_uncached_write_data(struct cifs_aio_ctx *ctx)
>         struct cifs_tcon *tcon;
>         struct cifs_sb_info *cifs_sb;
>         struct dentry *dentry = ctx->cfile->dentry;
> -       int rc;
> +       ssize_t rc;
>
>         tcon = tlink_tcon(ctx->cfile->tlink);
>         cifs_sb = CIFS_SB(dentry->d_sb);
> --
> 2.20.1
>


-- 
Thanks,

Steve

