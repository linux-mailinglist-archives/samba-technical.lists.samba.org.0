Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C88B2DDCFB
	for <lists+samba-technical@lfdr.de>; Fri, 18 Dec 2020 03:40:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ZE86BXyvArdHmgN9djhka1IqmUM9a7VE+3q/p0XrV0c=; b=VxbaFSbIXsMpZblYp3yJbyBcPY
	PhZ4mcPtjGsR4Pkj7O3xghunfd8clxy4ZWg3rnoovINkl1sfl/YFnSl7ys/djHXyFLfFALsiv/I/N
	vCEJ8oIfGrAYcXQo72MVT9GwpTWAl2SAhe53SXBFL2sP7vXBe17FQzH20xzxXHDGsaGA3vvP2IiRS
	7q6CeqJE39ZrXa2kMJOLQmiIdBZx09t4rIUNRLnISMsfRBp23HnPWdNQswBIa8yAmPYA69O+yUx1r
	lmIQBylrALwrGulHhumzgvxLJbo96jmEvDb26zFKNVbXOauNy/YNtIpPT5lIVUR+WiiaZkfxu/B9a
	qdQbJiXg==;
Received: from ip6-localhost ([::1]:18664 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kq5g5-001vOV-Ia; Fri, 18 Dec 2020 02:39:33 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:33502) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kq5fz-001vOO-CB
 for samba-technical@lists.samba.org; Fri, 18 Dec 2020 02:39:29 +0000
Received: by mail-lf1-x133.google.com with SMTP id l11so1716381lfg.0
 for <samba-technical@lists.samba.org>; Thu, 17 Dec 2020 18:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZE86BXyvArdHmgN9djhka1IqmUM9a7VE+3q/p0XrV0c=;
 b=i+/2IQ8vPOj6GMP0ej97DYBocXFLt7tnedy+7IAvrbynfHqKfJVfcIywuakRFNe2Dx
 9ScfMXSgYR70aVNx+Pr8KTLUhxx2xwiXl8gmSK8pQjgKAhxDga4Hlvy0aoGzSFc47jJ7
 XteetgFJJjdmy7PWDWzYd8wso4JuFP2AlvX43P8tnua6cN+9GzBlbyNXzUxMd34abuf7
 iEySw1vfa67O0moks5LwWH032/rtijtxY6aXd44zr4XsXO3NexKbwbk9G13j64uvaQbg
 Zv8yQCWGRNMwZ21lLVs3hJrgyq7SUdCjysSDxBgP7J+95r2wHFzzwcW7kBu6DCHfmKOp
 6s3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZE86BXyvArdHmgN9djhka1IqmUM9a7VE+3q/p0XrV0c=;
 b=kg8GrH7WEyeFRndR6py+U56elVq/SIlG3GrEe5k9JTfSg/ZO0LQ9pP/t5HwC3MkyhA
 t2hO47asPAviJDWGj4G5yDeDYzzwa+OxWSqyIXYNuYmhAES8ZhGhCjfvqU4EqSV8q1Tq
 bCvtnbhTBA3LXH/yLele4roai9piVu6XG1g9bmnwI3zgL9BkFCwVJL8IoUYsuc8s6275
 /lt/G26wdfGqbKf+57xJFaFWsOm0yyHyLEp/Oy0S1KHRM0q5v9hPXGPXyxgM1aZuilsJ
 QShHwBhDO3WUv/fRdwfa1GZxRSm3Hn7hRVcDrAlomuka/L8+I/hxSPR55gXPDveZBmqF
 pOuA==
X-Gm-Message-State: AOAM533ZsgfQshmHLF8/AQM/8jvohrbV6kp3HqLmrvvQ/R+phAs0FimC
 GldZAkPQXsnAiSvPWqhMfPXOWkqI/ugbesb9zec=
X-Google-Smtp-Source: ABdhPJywNGOuoIbh6tqnO0fPuTXa+f/Ysukt3QGAm1SZ+S0rVRjf8wz0e+ZS6U16CCOBr3wXkMgUnH1cJgslyrSbA7E=
X-Received: by 2002:a2e:8eda:: with SMTP id e26mr863678ljl.272.1608259150084; 
 Thu, 17 Dec 2020 18:39:10 -0800 (PST)
MIME-Version: 1.0
References: <X9s6nGDLt4xreaYN@mwanda> <X9s7By4IDIcG4D+w@mwanda>
In-Reply-To: <X9s7By4IDIcG4D+w@mwanda>
Date: Thu, 17 Dec 2020 20:38:58 -0600
Message-ID: <CAH2r5mvvevajfzFrj0Q2GGDYV1en8aupf8RM_23hA1qa23RLbg@mail.gmail.com>
Subject: Re: [PATCH 3/3] cifs: Re-indent cifs_swn_reconnect()
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
 Samuel Cabrero <scabrero@suse.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

tentatively merged these three into cifs-2.6.git for-next pending testing

On Thu, Dec 17, 2020 at 5:04 AM Dan Carpenter via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> This code is slightly nicer if we flip the cifs_sockaddr_equal()
> around and pull all the code in one tab.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  fs/cifs/cifs_swn.c | 64 ++++++++++++++++++++++++----------------------
>  1 file changed, 33 insertions(+), 31 deletions(-)
>
> diff --git a/fs/cifs/cifs_swn.c b/fs/cifs/cifs_swn.c
> index 91163d3cf8b7..d35f599aa00e 100644
> --- a/fs/cifs/cifs_swn.c
> +++ b/fs/cifs/cifs_swn.c
> @@ -484,41 +484,43 @@ static int cifs_swn_reconnect(struct cifs_tcon *tcon, struct sockaddr_storage *a
>
>         /* Store the reconnect address */
>         mutex_lock(&tcon->ses->server->srv_mutex);
> -       if (!cifs_sockaddr_equal(&tcon->ses->server->dstaddr, addr)) {
> -               ret = cifs_swn_store_swn_addr(addr, &tcon->ses->server->dstaddr,
> -                               &tcon->ses->server->swn_dstaddr);
> -               if (ret < 0) {
> -                       cifs_dbg(VFS, "%s: failed to store address: %d\n", __func__, ret);
> -                       goto unlock;
> -               }
> -               tcon->ses->server->use_swn_dstaddr = true;
> +       if (cifs_sockaddr_equal(&tcon->ses->server->dstaddr, addr))
> +               goto unlock;
>
> -               /*
> -                * Unregister to stop receiving notifications for the old IP address.
> -                */
> -               ret = cifs_swn_unregister(tcon);
> -               if (ret < 0) {
> -                       cifs_dbg(VFS, "%s: Failed to unregister for witness notifications: %d\n",
> -                                       __func__, ret);
> -                       goto unlock;
> -               }
> +       ret = cifs_swn_store_swn_addr(addr, &tcon->ses->server->dstaddr,
> +                                     &tcon->ses->server->swn_dstaddr);
> +       if (ret < 0) {
> +               cifs_dbg(VFS, "%s: failed to store address: %d\n", __func__, ret);
> +               goto unlock;
> +       }
> +       tcon->ses->server->use_swn_dstaddr = true;
>
> -               /*
> -                * And register to receive notifications for the new IP address now that we have
> -                * stored the new address.
> -                */
> -               ret = cifs_swn_register(tcon);
> -               if (ret < 0) {
> -                       cifs_dbg(VFS, "%s: Failed to register for witness notifications: %d\n",
> -                                       __func__, ret);
> -                       goto unlock;
> -               }
> +       /*
> +        * Unregister to stop receiving notifications for the old IP address.
> +        */
> +       ret = cifs_swn_unregister(tcon);
> +       if (ret < 0) {
> +               cifs_dbg(VFS, "%s: Failed to unregister for witness notifications: %d\n",
> +                        __func__, ret);
> +               goto unlock;
> +       }
>
> -               spin_lock(&GlobalMid_Lock);
> -               if (tcon->ses->server->tcpStatus != CifsExiting)
> -                       tcon->ses->server->tcpStatus = CifsNeedReconnect;
> -               spin_unlock(&GlobalMid_Lock);
> +       /*
> +        * And register to receive notifications for the new IP address now that we have
> +        * stored the new address.
> +        */
> +       ret = cifs_swn_register(tcon);
> +       if (ret < 0) {
> +               cifs_dbg(VFS, "%s: Failed to register for witness notifications: %d\n",
> +                        __func__, ret);
> +               goto unlock;
>         }
> +
> +       spin_lock(&GlobalMid_Lock);
> +       if (tcon->ses->server->tcpStatus != CifsExiting)
> +               tcon->ses->server->tcpStatus = CifsNeedReconnect;
> +       spin_unlock(&GlobalMid_Lock);
> +
>  unlock:
>         mutex_unlock(&tcon->ses->server->srv_mutex);
>
> --
> 2.29.2
>
>


-- 
Thanks,

Steve

