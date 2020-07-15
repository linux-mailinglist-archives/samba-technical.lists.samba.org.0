Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A59122034B
	for <lists+samba-technical@lfdr.de>; Wed, 15 Jul 2020 06:20:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=n7GY+WJuUal6vZC2qyTKGq0rmN3PIL2kDK1bpGspZE0=; b=Rxxk1SqGPqrnNPcfOS//M3JYn2
	DLCsoupBfbGlDiOaEXHLP7Z8lkCguWmL4t2c9jBUzoBt4oTde6lSplXebJnMt1svvMwkqTBmEet+Q
	/CEpNUeLj6NrAbDjXPRA2+5l2nu0EwKVxd/ubMbD82uGscvlzm/37/KX4aUg6uMrLejD6LNePIcfe
	xGe5oC0eqNgAkzX/NCVzA1VLrgOQSqEuENOsIv0+qhd0FCxkF6TGiX6HlNMgoNwr57cwVKaQONCaF
	7rOJs30dS7/PzBpASST0XqT/QPVKdwf0M/ZDyIYeMuw4Ap3aPHeC0Kd0tJgwe44LSCp2EzBAg89eR
	I57tKgzQ==;
Received: from localhost ([::1]:50504 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jvYtB-007ajF-U3; Wed, 15 Jul 2020 04:19:26 +0000
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:35141) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jvYt5-007aj8-0e
 for samba-technical@lists.samba.org; Wed, 15 Jul 2020 04:19:21 +0000
Received: by mail-yb1-xb43.google.com with SMTP id f5so515439ybq.2
 for <samba-technical@lists.samba.org>; Tue, 14 Jul 2020 21:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n7GY+WJuUal6vZC2qyTKGq0rmN3PIL2kDK1bpGspZE0=;
 b=KOX6dxv50PeEz3NBTMxawpG8CoBeTrEHVlITwgBKI3UTMRJ8c75Q6boiJzj9k4Susm
 wNqYZ66jq52MHGD9rifNgImnw3xGQn/nis+awUIqZ81o2L6vW00sWSoVbGmMrxsfX3NS
 /hBu8s1l6dZD/Y4K0b4WtYr80grhepO+nTZHMGyvCfKwIOVqLa8JU821PVw0Js6pv5Hu
 55Wj64k9JPuD3E3qvP1ZTrUadB7iT+Y0WcXCHYjBnJgFargui2RkQ9KUoIsHv35mNTXV
 +YQwHyj17w4MsUasUmbdCmb3mEJlwc4F5Uq7vJ0mpsx0jOcT1xZZcgXlQdh8+DMVWxV7
 HOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n7GY+WJuUal6vZC2qyTKGq0rmN3PIL2kDK1bpGspZE0=;
 b=MIX6v+KwaUYqTdSV1CdFuJcyiGA9Kj1/awqXwf3wHDigcp0sPmh+ACXajJ/eKqvq/+
 RrDhxKAmcGziGg39b6CdECiGxoo+KwOSN/SMP6DM6Uuz1sdUtgC8trp9UPMZBCcGbFml
 OLpHhgSDX+ERytWFdPQCPmrXGsAlXFSFRuEeYxxtn05EoLxVQTx/KAnUyjTgK0FpWucA
 qfQaIPQmuyb6n2Bq0eHuv2CmzNXI97PhpMvlvAt6YPIxpclh+t1yJmNPqBoXG8oCl+jQ
 YA4XeDF/j11zXQ3MhGsj3SRrt7ltnup+OI2rpPoPKl7wEIYxj1thxFfQn9qyGIIyS9+B
 14WQ==
X-Gm-Message-State: AOAM531HxIrDrW9nmm9Iyzv4rKN1ZlnXNk5LhTHQaBKwlJdO9mNBPmsL
 qYChMaSGstQDOEGAvaGFgpgW1zFZLv1P2V36Txo=
X-Google-Smtp-Source: ABdhPJzxOEManeM1VS4Ej7+mHpB4DMdkSQHnSTzwu69n9tgGLjbMLG2LU44grBL/dzIbmNNcNI9vP+KqcTTTYenwGj0=
X-Received: by 2002:a25:880e:: with SMTP id c14mr14101146ybl.376.1594786756160; 
 Tue, 14 Jul 2020 21:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <1594724352-11451-1-git-send-email-wang.yi59@zte.com.cn>
In-Reply-To: <1594724352-11451-1-git-send-email-wang.yi59@zte.com.cn>
Date: Tue, 14 Jul 2020 23:19:05 -0500
Message-ID: <CAH2r5mvm=PWV4cVKznJEB1FQW3jRMXBFF1vXv=-Jy8PQLRCgdQ@mail.gmail.com>
Subject: Re: [PATCH] cifs: Remove the superfluous break
To: Yi Wang <wang.yi59@zte.com.cn>
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
Cc: CIFS <linux-cifs@vger.kernel.org>, wang.liang82@zte.com.cn,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
 xue.zhihong@zte.com.cn, Liao Pingfang <liao.pingfang@zte.com.cn>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

thx

On Tue, Jul 14, 2020 at 6:14 AM Yi Wang <wang.yi59@zte.com.cn> wrote:
>
> From: Liao Pingfang <liao.pingfang@zte.com.cn>
>
> Remove the superfuous break, as there is a 'return' before it.
>
> Signed-off-by: Liao Pingfang <liao.pingfang@zte.com.cn>
> Signed-off-by: Yi Wang <wang.yi59@zte.com.cn>
> ---
>  fs/cifs/sess.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/fs/cifs/sess.c b/fs/cifs/sess.c
> index 5d05bd2..6708ab0 100644
> --- a/fs/cifs/sess.c
> +++ b/fs/cifs/sess.c
> @@ -1705,7 +1705,6 @@ static int select_sec(struct cifs_ses *ses, struct sess_data *sess_data)
>  #else
>                 cifs_dbg(VFS, "Kerberos negotiated but upcall support disabled!\n");
>                 return -ENOSYS;
> -               break;
>  #endif /* CONFIG_CIFS_UPCALL */
>         case RawNTLMSSP:
>                 sess_data->func = sess_auth_rawntlmssp_negotiate;
> --
> 2.9.5
>


-- 
Thanks,

Steve

