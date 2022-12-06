Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C49AC643C80
	for <lists+samba-technical@lfdr.de>; Tue,  6 Dec 2022 05:43:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=EmQnhFLYiKVLZ0sQxBjLXkPoOHHxOBv8/dLLVHr33BU=; b=uA+oPNlSZX2NPNwxSKT3rd+Zpu
	EyDYjAm4etg6m/4J0uovFBthJX9SwA2AGajfZmDf4bCpRu9VM8K66Qnaxr2QwBDyJEGk0id24q90d
	jZqLpHGowM89PNaxzxiBuMvb7DR0hLeAdOZUBT1p+CEBKFz82etG9smN+L2pmmIC6CYp5wlDkHFba
	qydQ/E0y3brvD9IN8d8GxWrOonK0n0Ki+/31ioYNbbzKbxHW25B56LFKJb5BpAGonvnk3oth5k3N4
	lNYsB4HhC8ziOnfGhAB8VNXO5ZSxjRzzloUM5184I70Ku3QjfLSyXBgssuQmS/QyFmRNFVj9wCyDk
	Jz/cmCZg==;
Received: from ip6-localhost ([::1]:63878 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1p2Pn5-006Zoq-IJ; Tue, 06 Dec 2022 04:42:47 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:35364) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1p2Pn0-006Zog-Ad
 for samba-technical@lists.samba.org; Tue, 06 Dec 2022 04:42:44 +0000
Received: by mail-lf1-x134.google.com with SMTP id b3so21843108lfv.2
 for <samba-technical@lists.samba.org>; Mon, 05 Dec 2022 20:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EmQnhFLYiKVLZ0sQxBjLXkPoOHHxOBv8/dLLVHr33BU=;
 b=nbnCJFb1UM/7eT5kl6UMan5FW3VaziTWa7/nh//braawBcn5TqWN5D8jS6B/T5PBQI
 U/ar8Z3PHZvRjKV4ipKi6wOpDMWCfhb1AvPbhdxB44wvET2KvyUiF1H4yGH4wtpLDfXU
 BR+PZKFAbNp2zkjKy3T00mKrkCScomK40jeKmHYuW/EMisVUUiRxDZY+RR4G56ulbbv0
 QJcI8fK6ah2zzRNVOYwVdFx3N1uy21GgZkQqLuqGun8ZgHkJLTp+o03FER/tKMXenjsW
 0eo4UKQtbTP4W0UN+S+GSyugZv/VEF02nPzlFBZ2AtCkBk/KGCQmFyECI/+la6mzFeIC
 bR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EmQnhFLYiKVLZ0sQxBjLXkPoOHHxOBv8/dLLVHr33BU=;
 b=GbCwKqM3MuVX8W44dahVqaQ2Q6ouxVkeHaW/BXJkQYzYPe69p/XqzcwSiXo8/ir/af
 MCxEBketphvjTZonhrBXYhYjTDKqxFeXv3TfXHimtYrpiHv8OihDxTO965Q6Uaxzii9W
 mEscjkVHOsluRtJhn6dTd4wb/lYGpeJMlAcKfHCry4i8IgevKAybhQDqvZC5B5VETZJv
 r2qPFAFl9rrB2jfoPXENN8Ojz3DithBoOQbfaO6YHU947LR2UJSNyvoRCYDbOPZkMpQl
 FF9FSINiaZrcrKMF9FUDsM4qp96fYMwYXJN77gAsPegSDzEYrteGoZeIUsY1IA7SEsNq
 oF1Q==
X-Gm-Message-State: ANoB5pnO67Jd6OSmqFl9iYJe50eaiVh+aZuZtoqQCv9Me9WgyNIz+X3w
 dGnf/TDex7BOwguvYOkU52ZJve+2Urw14qsPp50=
X-Google-Smtp-Source: AA0mqf57OrDVOXhUTa4ozOdA768OvYfpqUnqVu7DvaGpyBAHMk2rQqboIzSXdXhNWfZ8Ec5byIBpUUUbXCHwfPkdrjg=
X-Received: by 2002:ac2:4bd1:0:b0:4a2:4dc3:a2e with SMTP id
 o17-20020ac24bd1000000b004a24dc30a2emr23841388lfq.403.1670301760473; Mon, 05
 Dec 2022 20:42:40 -0800 (PST)
MIME-Version: 1.0
References: <184e4ae599e.dafedd623365931.2204914765704117230@elijahpepe.com>
 <184e4fef6ac.ef8cabb03371505.6462526642609891535@elijahpepe.com>
In-Reply-To: <184e4fef6ac.ef8cabb03371505.6462526642609891535@elijahpepe.com>
Date: Mon, 5 Dec 2022 22:42:29 -0600
Message-ID: <CAH2r5mvYhYfO10U8QbRVsx03VUnudv-hcQvtqyw4Qt+4ugGT9A@mail.gmail.com>
Subject: Re: [PATCH] cifs: fix tabbing
To: Elijah Conners <business@elijahpepe.com>
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
Cc: linux-cifs <linux-cifs@vger.kernel.org>, sprasad <sprasad@microsoft.com>,
 pc <pc@cjr.nz>, samba-technical <samba-technical@lists.samba.org>,
 lsahlber <lsahlber@redhat.com>, tom <tom@talpey.com>,
 sfrench <sfrench@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

wasn't this problem introduced in your previous patch?  Why not merge
them together since this is a cleanup for the tab problem in the
previous patch

On Mon, Dec 5, 2022 at 7:15 PM Elijah Conners <business@elijahpepe.com> wrote:
>
> Signed-off-by: Elijah Conners <business@elijahpepe.com>
> ---
>  fs/cifs/cifsroot.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/fs/cifs/cifsroot.c b/fs/cifs/cifsroot.c
> index f0aba7c824dc..46aaa731723d 100644
> --- a/fs/cifs/cifsroot.c
> +++ b/fs/cifs/cifsroot.c
> @@ -37,9 +37,9 @@ static void __init parse_srvaddr(char *start, char *end, struct in6_addr *out6,
>         addr[i] = '\0';
>
>         if (inet_pton(AF_INET6, addr, &in6) > 0) {
> -    *out6 = in6;
> -  } else {
> -    *out32 = in_aton(addr);
> +               *out6 = in6;
> +       } else {
> +               *out32 = in_aton(addr);
>    }
>  }
>
> --
> 2.29.2.windows.2
>
>
>


-- 
Thanks,

Steve

