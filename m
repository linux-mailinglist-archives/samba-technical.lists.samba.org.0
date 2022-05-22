Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 392C45306A6
	for <lists+samba-technical@lfdr.de>; Mon, 23 May 2022 01:01:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=SF8GydDc0GrVQnk8HXDQAYHPmkcAYm0hZkZSE4F+/Mk=; b=D/7nM8poGMIbdP6osxo63sX/vo
	Uh4jJ2/qSHgQ7gF2ViRN75utaVqkddQkjs9ehKiAqAGclvp0NuKSkgU3k7DV8bSfobTfI4mld9L8x
	VNJ+wxSWsPPrjYCHBSm/cBi9qE3bNs4KV78T7N3RWYOzgvjZPqNJRbxvBOv87hJs6a/nasr/nm8my
	uAbdtoJpDgm4Ds5zQ0hvoHFKo+Zu5hfHM0Qe9p/+x6GL9Vdc/qsV3bqN9IR+Js5L7lWfeAKi+8YE2
	zc/yySIwsqOSfEe3YD1ie3XgzT/18VLOZr9VZkEdiymHXCZPI94d3eGxEIuFGW1buTw43wuaQCekU
	ol4sarjQ==;
Received: from ip6-localhost ([::1]:42430 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nsuYf-002QxA-Ta; Sun, 22 May 2022 23:00:21 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29]:45689) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nsuYa-002Qx0-7m
 for samba-technical@lists.samba.org; Sun, 22 May 2022 23:00:19 +0000
Received: by mail-vs1-xe29.google.com with SMTP id j7so1288698vsp.12
 for <samba-technical@lists.samba.org>; Sun, 22 May 2022 16:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SF8GydDc0GrVQnk8HXDQAYHPmkcAYm0hZkZSE4F+/Mk=;
 b=lm6jR8+5QtZGNHO23qu0pS/uTGBdJ2p35Nn8Z9bH9jQ8UyxD6ID9QrQ805maUkbdpu
 ydZlalnPYIQm7CHX4GqxdFIgDcZPiJwxaEGGz2PzPdC9WjfgLqYYYXUpJfgJI6+dEONr
 KuAFLY1sp0WJmhuWo37nmVtdtSbRYrY+cKQpPLGJEuglOB11GxW+dtqxvBycMJljkT8s
 G8yZJvyhfPnVkJ3U9sWmswQhvlD6GIpVz1pC0XyFfAjVmxV4tN6UQ85SeAiz9Qth1YnF
 1enGrNGSs7YTuep8oIdgFIQivYCQKWyyHh76xcgjpdanOZTNO3ECitixu6kD4GPSt+Bk
 34sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SF8GydDc0GrVQnk8HXDQAYHPmkcAYm0hZkZSE4F+/Mk=;
 b=19LCft6yKwf0g23q8g22eGQRL/0aPFpTiHYxt4iz6bcA6g/NDGspDa5WVu58MxBhgJ
 WAO1tl6X6cVXPRZ3pMoiL9mgMJ2Y2zxsdMj9HWOWzRIG/bN1C7iUEcigAhmta1JdL8uM
 j0hGvBteevm3Wf8a2cPzhSJxCqngfHQ7HXdbfjd5b+saq7cGwaSYdxl2dQC99CadSCih
 MGTlB/F4Asr7gZqLDehOhvWucKMYe6w5UeUVp5975X4++H0PWz8PsjAC8WUxp2BnTbN6
 nRJ9XaPxKygiZ6fkqjF8lcUp73BhNcSdIeLNFl7AuImKtPgbmtLQwResb19WyrfD87hf
 QJEg==
X-Gm-Message-State: AOAM533J9LJoX3npvDbs2zcGI3hzkNx0aJB2u60FwjPxxP2JWthbPLFp
 6R/9RzKdaJScxrMBq/p2Ck3dtXxEl2k9wTn/27A=
X-Google-Smtp-Source: ABdhPJyWO8zf5D/YhtV5FcffI/x394ipbzxX+5SQUfl7UuxsZe4dKs6EW3pHTnZHlQaVb72Vj4c9jNDoPjE2A7uE2ao=
X-Received: by 2002:a05:6102:3a0e:b0:337:ab1f:3a8c with SMTP id
 b14-20020a0561023a0e00b00337ab1f3a8cmr1272232vsu.61.1653260413547; Sun, 22
 May 2022 16:00:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220521111145.81697-69-Julia.Lawall@inria.fr>
In-Reply-To: <20220521111145.81697-69-Julia.Lawall@inria.fr>
Date: Sun, 22 May 2022 18:00:01 -0500
Message-ID: <CAH2r5msEi=DrdQfJ0LJmft_w2rMio8e2hn+qznOHuywV_2iSqw@mail.gmail.com>
Subject: Re: [PATCH] cifs: smbd: fix typo in comment
To: Julia Lawall <Julia.Lawall@inria.fr>
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
 LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Sun, May 22, 2022 at 2:51 PM Julia Lawall <Julia.Lawall@inria.fr> wrote:
>
> Spelling mistake (triple letters) in comment.
> Detected with the help of Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>
> ---
>  fs/cifs/smbdirect.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/cifs/smbdirect.c b/fs/cifs/smbdirect.c
> index b3a1265711cc..c3278db1cade 100644
> --- a/fs/cifs/smbdirect.c
> +++ b/fs/cifs/smbdirect.c
> @@ -1350,7 +1350,7 @@ void smbd_destroy(struct TCP_Server_Info *server)
>         wait_event(info->wait_send_pending,
>                 atomic_read(&info->send_pending) == 0);
>
> -       /* It's not posssible for upper layer to get to reassembly */
> +       /* It's not possible for upper layer to get to reassembly */
>         log_rdma_event(INFO, "drain the reassembly queue\n");
>         do {
>                 spin_lock_irqsave(&info->reassembly_queue_lock, flags);
>


-- 
Thanks,

Steve

