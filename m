Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D241F48B9CB
	for <lists+samba-technical@lfdr.de>; Tue, 11 Jan 2022 22:42:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=xfXoAe+Vr+wVYpAjUIwEml+WxjdDvaFLuGHxawax4dI=; b=IJ4n/eXw7OCCNLSdEQo8PTZmxd
	CpaaiXUI2eZq92I9i5BqTTtWg6lelyKbfsHXVR3PAhOMLjRODSUi6zo7TCY2YbOiS8n3QG+IP2MlU
	djsmz4gFxlGKxBdIaMq0kMkbYzK61hqG1DD7hQPzQbD+A4QguNyFfJz1Y2Q9+ysae5gnrOazkoAT1
	zsZOO/tP09uI7WbPPNepapozUy77xJFuIbTE4LxgHT26Vlj3pvTkLXKGYwn3/8gbS5F6dWmMHmAqW
	AUA48VcMGiXk+MCFTg7AykVC+vkSnsdz/E6bsMIW4SFn/x4nhNrqEbLtIczhYKQ97sHljgjsa2jgP
	sJgq/oew==;
Received: from ip6-localhost ([::1]:46898 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1n7Otd-007NMc-0v; Tue, 11 Jan 2022 21:41:37 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:44782) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1n7OtE-007NMS-Hq
 for samba-technical@lists.samba.org; Tue, 11 Jan 2022 21:41:17 +0000
Received: by mail-lf1-x129.google.com with SMTP id o15so1237396lfo.11
 for <samba-technical@lists.samba.org>; Tue, 11 Jan 2022 13:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xfXoAe+Vr+wVYpAjUIwEml+WxjdDvaFLuGHxawax4dI=;
 b=TC0pmGpn3hr9VXbQQ74r4BDQQEllW9JeN3eeTIadmMbbY1D8baGxOFdJEoARQtYMs0
 7D8yUFtaGv6sANxEc/VSM8IRUQjEsreLAa1lcHak9yvBsMYeVPcsnXBnkXzxsGOKOclz
 O08RF+BEf5sjYj6u7PPLyi83lBCM1jkma6PU17aTfrq+xpeoFF61oo1sy41D26b+8CO8
 2IzG+Ble9qig1OIbVABc9RjqPhyUDCR/7NzffXVvDP6MjgGC4HQZ7D5X8VOX+/VlpqUn
 AscMcLncvlESH5uFzqOUx5c53vmwjp77Kag5di+MaNxrMtnll3QS0hdvaCkIKkGC8Gga
 C+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xfXoAe+Vr+wVYpAjUIwEml+WxjdDvaFLuGHxawax4dI=;
 b=i5h3rbYffw8iL7TVCkwjJnZLzfE0hi7p2tnimyT+CE7nXNOq3gBWtYYQQtTpyW4OMS
 /zMrc9hP/jZpAhNBhe6H3PBGuIvZHfpL4MKYxK6RkOXU8xbcF46+9Ifev2tbGkgE6awt
 HX+MGDM3e0M93SpwSY8nWXZDFk77mpqNd3pTlhv0WAGoR7679FPZIpmW8fXsDk6W5jvM
 drJPhJaCfRgZP4Z1QOCzxIBC0fIBS2rRTHomvftO1e41711Ppd5UpCO8MA1ceH3H1p9e
 Gp0HPI9UvYtzPlB1CA1u+AG/CoWJw3wcBFPyan6uZH2QV2phoPM41SG0yNhU37Xwh6ft
 I6Jw==
X-Gm-Message-State: AOAM532cahHxukYHlnzMjLQMX1OKU3qTkqStuG5PUjBa4bUWeZ+Hfl+e
 Zkfywi8eM8mrrwQfyCzU/8NTKN9+8OFM/K775iPqEP2RAW8=
X-Google-Smtp-Source: ABdhPJw4OLUWqvCpcDqUSuvMj9lAi1g2N7kIL3KMpZb6//moWAFGpxg63qUB5ebSf5RsSu+gcaApisEgWYUhPy39qs8=
X-Received: by 2002:a05:6512:3e02:: with SMTP id
 i2mr4638095lfv.667.1641937268836; 
 Tue, 11 Jan 2022 13:41:08 -0800 (PST)
MIME-Version: 1.0
References: <20220111071716.GC11243@kili>
In-Reply-To: <20220111071716.GC11243@kili>
Date: Tue, 11 Jan 2022 15:40:58 -0600
Message-ID: <CAH2r5mtpdxfAcuThHDs+-UHFf1S=dmSxyXkk2NbaxMwd6FwfQA@mail.gmail.com>
Subject: Re: [PATCH] cifs: uninitialized variable in cifs_get_next_mid()
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
Cc: CIFS <linux-cifs@vger.kernel.org>, Shyam Prasad N <sprasad@microsoft.com>,
 Enzo Matsumiya <ematsumiya@suse.de>,
 samba-technical <samba-technical@lists.samba.org>,
 kernel-janitors <kernel-janitors@vger.kernel.org>,
 Steve French <sfrench@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

That was fixed similarly a couple of days ago by a patch from Enzo

commit 1913e1116a3174648cf2e6faedf29204f31cc438
Author: Enzo Matsumiya <ematsumiya@suse.de>
Date:   Fri Jan 7 19:51:39 2022 -0300

    cifs: fix hang on cifs_get_next_mid()

    Mount will hang if using SMB1 and DFS.

    This is because every call to get_next_mid() will, unconditionally,
    mark tcpStatus to CifsNeedReconnect before even establishing the
    initial connect, because "reconnect" variable was not initialized.

On Tue, Jan 11, 2022 at 5:03 AM Dan Carpenter via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> The "reconnect" was never initialized to false.
>
> Fixes: 220c5bc25d87 ("cifs: take cifs_tcp_ses_lock for status checks")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  fs/cifs/smb1ops.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/fs/cifs/smb1ops.c b/fs/cifs/smb1ops.c
> index 54319a789c92..6b1b048b36ae 100644
> --- a/fs/cifs/smb1ops.c
> +++ b/fs/cifs/smb1ops.c
> @@ -163,7 +163,8 @@ cifs_get_next_mid(struct TCP_Server_Info *server)
>  {
>         __u64 mid = 0;
>         __u16 last_mid, cur_mid;
> -       bool collision, reconnect;
> +       bool reconnect = false;
> +       bool collision;
>
>         spin_lock(&GlobalMid_Lock);
>
> --
> 2.20.1
>
>


-- 
Thanks,

Steve

