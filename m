Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D181F8569
	for <lists+samba-technical@lfdr.de>; Sat, 13 Jun 2020 23:31:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=nOtq4IfCN7fb95vJs6iUg3mhuTz6pORH3UinBbE37sI=; b=HxxmNrIQPd6Vuizuq5eMzF5Zy1
	dHQrSsNRbs40k9c7mlaWjEo5zGzGEwwv2gNMmT1XHMTKUIrL3fFhxZBrHqEZGf1ZBMFTMv5VygzMp
	yCbEoqQZLGLX6EbwlpcYPsYjCvslBCx5QcjrQi/TGTU+TuqM6rygSljJTACDpTqSYEaGXPAOoWgOs
	WBxdVJZ+H611XX87/+YEll7BLpoI+N7iIRUqR+T9Co1aVHqcAwhXYLViegHHC+vlNejZcgRqeo4SX
	fP+EfVXcYnP602i64P0jbw2VH2K2p5J87191rXP5yP3VrX/FKjOTjKdQ+QTIdKcucDGzp6ce8MGW8
	LRU4V61g==;
Received: from localhost ([::1]:56286 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jkDkJ-000GUj-93; Sat, 13 Jun 2020 21:31:23 +0000
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:44059) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jkDkC-000GUc-8D
 for samba-technical@lists.samba.org; Sat, 13 Jun 2020 21:31:19 +0000
Received: by mail-yb1-xb44.google.com with SMTP id n123so6862898ybf.11
 for <samba-technical@lists.samba.org>; Sat, 13 Jun 2020 14:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nOtq4IfCN7fb95vJs6iUg3mhuTz6pORH3UinBbE37sI=;
 b=f2rfWr3UnBc7TAhoJXIMZSx2Fect0CYk4IxifgL8ua+OrYVv82/Hk89QPliiJK5PR0
 6nqX26p8qqOljOi5Hvi1T7/xv7VvhfWhi3KqAESP6GuJ8/u1G1kaQr3M7jjmrp1aVtlD
 en4ei33ZVHs/yj7S7QeMgQuinR2FiY68xms/EgLeAOGlow+rCRqpI3S0WcpsBVoaWB0+
 GmcSeGyhtLIJ9hSkjE9uXrY9fcyupZZbOFC1CiBoW70dVrJFJYmDmg5vSviVWRh4hlWy
 OMcpk1mMvX+KCkefaOWkZWeYQqRicdck/DUdyyTuCZ5unRJYw8HkvUrNaI5IBxrtJapR
 zwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nOtq4IfCN7fb95vJs6iUg3mhuTz6pORH3UinBbE37sI=;
 b=Pt6MTZMq+/THwlDFqUoQatCJhg/xNLohhhhOaNbUvag9BAOfT2yQlBDg2BIbTDQjeO
 T2AGvvDB4YlwvHX+b5ZEEHeh5pw2fmcOszf06O3FojIdIIcr5DjVVlD6DmFy7BocnOwW
 6rhYWr1nMmQSM9OasGHAznlSOUNXnkZfMZQCHalmT4SDYVzcpYcjhxendXaOXIg0tpvs
 Zkz9tIYR/MBbk7k0yKwj6ge2zV90LPNBKLv/0uCJnrhzhQi3puEHqketyF4QUaQ0Etl4
 K8CmR/x9KMDbKClNR9nnCduGEnNXT2TRt9kSiidK7ZF9TIaoiy3Eoq8XG/XBiwclMqqG
 MEuQ==
X-Gm-Message-State: AOAM530cyiYTO1trv0YQU3t0sfQox5kbrxF22iXLvyeIg+k9xBrI3PxZ
 utLojUftko/M3m4KD4oT1dr/gHivEkxtSE+bs5k=
X-Google-Smtp-Source: ABdhPJx/QdegrSi/PieXiJ1curU9LJV9mDZho/vWSlJm8ozO0w7/odlnaJPKy49cX/9cytFQFApn9bc4a861GJxFFXE=
X-Received: by 2002:a25:ca45:: with SMTP id a66mr31494866ybg.85.1592083873963; 
 Sat, 13 Jun 2020 14:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <1592051229-93898-1-git-send-email-xiyuyang19@fudan.edu.cn>
In-Reply-To: <1592051229-93898-1-git-send-email-xiyuyang19@fudan.edu.cn>
Date: Sat, 13 Jun 2020 16:31:02 -0500
Message-ID: <CAH2r5msU3Oq4swZ2wkUHgNAW1BAM33NT01YEdaGWKSCK+NX-JQ@mail.gmail.com>
Subject: Re: [PATCH] cifs: Fix cached_fid refcnt leak in open_shroot
To: Xiyu Yang <xiyuyang19@fudan.edu.cn>
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
Cc: CIFS <linux-cifs@vger.kernel.org>, Xin Tan <tanxin.ctf@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>, yuanxzhang@fudan.edu.cn,
 kjlu@umn.edu, LKML <linux-kernel@vger.kernel.org>,
 Steve French <sfrench@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

added cc:stable and merged into cifs-2.6.git for-next

On Sat, Jun 13, 2020 at 7:36 AM Xiyu Yang <xiyuyang19@fudan.edu.cn> wrote:
>
> open_shroot() invokes kref_get(), which increases the refcount of the
> "tcon->crfid" object. When open_shroot() returns not zero, it means the
> open operation failed and close_shroot() will not be called to decrement
> the refcount of the "tcon->crfid".
>
> The reference counting issue happens in one normal path of
> open_shroot(). When the cached root have been opened successfully in a
> concurrent process, the function increases the refcount and jump to
> "oshr_free" to return. However the current return value "rc" may not
> equal to 0, thus the increased refcount will not be balanced outside the
> function, causing a refcnt leak.
>
> Fix this issue by setting the value of "rc" to 0 before jumping to
> "oshr_free" label.
>
> Signed-off-by: Xiyu Yang <xiyuyang19@fudan.edu.cn>
> Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
> ---
>  fs/cifs/smb2ops.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
> index 736d86b8a910..28553d45604e 100644
> --- a/fs/cifs/smb2ops.c
> +++ b/fs/cifs/smb2ops.c
> @@ -763,6 +763,7 @@ int open_shroot(unsigned int xid, struct cifs_tcon *tcon,
>                         /* close extra handle outside of crit sec */
>                         SMB2_close(xid, tcon, fid.persistent_fid, fid.volatile_fid);
>                 }
> +               rc = 0;
>                 goto oshr_free;
>         }
>
> --
> 2.7.4
>


-- 
Thanks,

Steve

