Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D35A23A5B0E
	for <lists+samba-technical@lfdr.de>; Mon, 14 Jun 2021 01:34:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=vV90fcW15TwLBPqHX4M775nsbVmDSBXQLEB4HxZLGiU=; b=HyPHsJY3oh4cFEiuvjvIWWG2Ig
	w8a2hl0jd+Vb0zcwx4e/yjnU/l2duSPq3CEuhd5Cg9Lz4kVxwr2OKFw+zMnil4zQ33l9dzNFxqvpQ
	nmR9xGZjzA6m1vGNDwAuLtUdzbQp839zborju2sNIx8PRBV4iceU4zkr2SYQoFWTePx0/+9OEYU3o
	HgivWAm9pi5mtS9XmUD7T020SHRCsZYnONx0R4+HC40/tU7uxga6nU5qrOfGTD/icUJ0sXiMNlPXK
	aCbNiUxuFReG3ZUwif+/HBBk4MrbD65iWlbxLQ+Km0Hz+Tpx+Q69Fvf98+ZYoR9wY/B6f4CaM/qUX
	fXtfxIWQ==;
Received: from ip6-localhost ([::1]:32666 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lsZbd-005RCU-Vv; Sun, 13 Jun 2021 23:33:30 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:33642) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lsZbY-005RCL-Cm
 for samba-technical@lists.samba.org; Sun, 13 Jun 2021 23:33:26 +0000
Received: by mail-lj1-x22e.google.com with SMTP id l4so5076011ljg.0
 for <samba-technical@lists.samba.org>; Sun, 13 Jun 2021 16:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vV90fcW15TwLBPqHX4M775nsbVmDSBXQLEB4HxZLGiU=;
 b=seRI9gnaOlXqsebUbY+0EN2h31nRN9n29+w6E/Yx07jhyfc5lmimOLjlpBQ2ZmWXOt
 QZZTYfQVaqTB6KlTdUGhCEFyTlFAnEZk1M6iIxWovvkZgJitCEWKbpfz+msd5OjRqAEu
 458+/fspmIX1Dn+UukB9FpSxC0XvVtmzaaf1lg+jK0OgwaKZ2q8F6LP7SZRuR2yBVtEc
 brkyT+zIPf0NauAK9rXQhU57B3zcj7sIGrVc0j14pV7NeD/pxu7SWq6Ox/Ac83oLvTjZ
 zUc4HTEQMmwTmEpvEJ3StL5Hev64Lo/ryfTlpb/yXAjn6y6cjIkkPZ0Anm3wn7++KvF1
 7LJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vV90fcW15TwLBPqHX4M775nsbVmDSBXQLEB4HxZLGiU=;
 b=bpXkMgZp2F66pL8x8s7KqdLfq9Ow6FiLl8snop8YLGmC9H+WKGHrdMJ5mZdN4ENFRq
 QkICI8ipStd+GVo3K4DPkgbdL+bRu1h/Fko7vDy7PLpWzCrphlf7SK/5IE4V07EdyzUL
 AcG2yvykkwjNsbHyrtP92tc8D+ybenV8gFPCkWiBCl29862tRE0Qp/n6e8KGYHTqkKbp
 lKaiz26UmA7pCQQIE4PP2uZPHfZZtUW6MYIpqFHh9XvkLsTzz0aYLtlik57yVjbuDCH7
 z7rNm7VE5i9TpVePrlH5uBQ01VH9u5oWGF72blPJQPeZuWMG+zpGwcYxNjwHIYKmPVbC
 HffA==
X-Gm-Message-State: AOAM533p3idUqYLoru03ev9CtM+FZrI3cKZWdLEROmZhSyM77grF8Z64
 b1O8eWWBzZuoR0Ht6dJFky5br+7yL9mQOw77a38=
X-Google-Smtp-Source: ABdhPJwF5rfK6nFEkoOSqYEGVSSNwf7lZ471cE2ZhMxDz1+qpvKgXjMZibrLWN34Tem81MF0KE0MUFNh7nfE9lFIwpY=
X-Received: by 2002:a2e:a7ca:: with SMTP id x10mr11349512ljp.218.1623627201751; 
 Sun, 13 Jun 2021 16:33:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210613140123.74900-1-colin.king@canonical.com>
In-Reply-To: <20210613140123.74900-1-colin.king@canonical.com>
Date: Sun, 13 Jun 2021 18:33:10 -0500
Message-ID: <CAH2r5msKOBuZzvW83OyN4o5S34U=pBcgLcXPFPywL8c3wV_ixQ@mail.gmail.com>
Subject: Re: [PATCH] cifs: remove redundant initialization of variable rc
To: Colin King <colin.king@canonical.com>
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

On Sun, Jun 13, 2021 at 9:02 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable rc is being initialized with a value that is never read, the
> assignment is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/cifs/cifssmb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/cifs/cifssmb.c b/fs/cifs/cifssmb.c
> index 037c44bf48f1..277cb1044cbe 100644
> --- a/fs/cifs/cifssmb.c
> +++ b/fs/cifs/cifssmb.c
> @@ -1238,7 +1238,7 @@ SMBLegacyOpen(const unsigned int xid, struct cifs_tcon *tcon,
>             int *pOplock, FILE_ALL_INFO *pfile_info,
>             const struct nls_table *nls_codepage, int remap)
>  {
> -       int rc = -EACCES;
> +       int rc;
>         OPENX_REQ *pSMB = NULL;
>         OPENX_RSP *pSMBr = NULL;
>         int bytes_returned;
> --
> 2.31.1
>


-- 
Thanks,

Steve

