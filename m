Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2EB4FEA26
	for <lists+samba-technical@lfdr.de>; Wed, 13 Apr 2022 00:33:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=FsJYLxOhIxt3rQLA+O/P6SUgZEOQeFz25qq7q/fcHi8=; b=aVDcmWMiZ9bDW9E5e0r2UpfCth
	xtg3tw90N2ddlHK2FaK5d19pqFaupArT2wFpCKI5SbD3M0u2UhMmdZH0fDsHZVM4P6dlX/p9YmrfS
	TGcquC+oGZsVX5Z60OGPGOthTwnEIngUVWymkTltVftbNkP1cweBMOomY/ZxJ86qHIc651I/JdWzQ
	ES9q0ulJ8BeImuOvqzspFIgyvaO5OdjoaNKwcdbToRRinsEbuvW1biVSlOWzKFBRlFXc2Ps9IZy9k
	eId0Q7P2+iqDB1sX4XXr3iENFTN4KYlihVgtw9g2QQ0XH8GI0h9IzKZ38K0WQFcymxxleVEZ9xZ96
	p/yuIUjg==;
Received: from ip6-localhost ([::1]:34822 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1neP3e-0007tX-Kn; Tue, 12 Apr 2022 22:32:22 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:33422) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1neP3Y-0007tO-QG
 for samba-technical@lists.samba.org; Tue, 12 Apr 2022 22:32:18 +0000
Received: by mail-lj1-x22e.google.com with SMTP id r18so157370ljp.0
 for <samba-technical@lists.samba.org>; Tue, 12 Apr 2022 15:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FsJYLxOhIxt3rQLA+O/P6SUgZEOQeFz25qq7q/fcHi8=;
 b=lTexwf1HxdZGAcVTWoD0ugTlac61PvCWW3F8HQtXKOmX3JezT10nb4HZtZdWAwyAwK
 JAdEJHFK9RQ/adANwbDQRAaFvoWqugCSX+rmZpNxYgLLIvBDFcubPsVUTYWzT2US476a
 Kn4Syv5auhCIo1tQNRvXnWTtVK/P4WbvG+TOUgy5Q2N1L1Wfqdfw5uxG1aLNJA2OceYV
 8aIWX1aPlJcZRtT6uyUE55A1cT1nC1sNHsziyzGUCqvrktoKiX14f2a20EX+erSlVdie
 Ho4JypLz4jjjI+vJwFUGBiYcsPyGkJJC2E13XFQoTGMcO9aL6gUabeo6bomqYDjTn/XL
 MfdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FsJYLxOhIxt3rQLA+O/P6SUgZEOQeFz25qq7q/fcHi8=;
 b=WTRASunXOffRo6+zj3Yz/J6TjqYnaMyw3K8/dSt0GwRzmcgUgTMDjdlhrdMLpJ8jF+
 elebv1Fag0lSuRS5zXgBFGiHSU8ndnqrdX3m9uvOzt4HZBb7/RzzpyiRXshlKL82ODmR
 Nwi8hIfXQwhPIl/LwJNamlSiEpkPzSLhiv/JMFHuGAG3Qa2cXYIjqpxoZ7zJoZS4wZwP
 gKW6DHocYISr5wOWlcAWrFOnIWLCHDCcpJ2/G7OIxlk4PsLWaYIRBkuN6xYvzPSKElJ5
 vj31So5VJnJ3bHNfUs12kAkWkzB+HC4Rc9Qe5kXLhGut6oLt6zWMSwrNagPWQy4egj0f
 OMAA==
X-Gm-Message-State: AOAM530z6CwYiRX2tS4TP2X3sXA1mhru7KnDrI+e+qyDk9eW75oLtbn6
 7DX3kiChG+U3YiXe/G5LdpOX85GOkh831KDXUpw=
X-Google-Smtp-Source: ABdhPJyotQc5lx8nzjPYQvWzHV1dNOIG+D0mdNU459MdDr2om1lc6UhX9ewBqaAIaX3WVyEVwQZVknBGkIfV+hqY9gg=
X-Received: by 2002:a05:651c:ba0:b0:24b:6046:3f24 with SMTP id
 bg32-20020a05651c0ba000b0024b60463f24mr8499467ljb.460.1649802734687; Tue, 12
 Apr 2022 15:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220412043823.57037-1-harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20220412043823.57037-1-harshit.m.mogalapalli@oracle.com>
Date: Tue, 12 Apr 2022 17:32:03 -0500
Message-ID: <CAH2r5mvBH8wO9rS2UwCpgjbhcLp89-RLbr1wxK76Pj=OprKwOA@mail.gmail.com>
Subject: Re: [PATCH] cifs: potential buffer overflow in handling symlinks
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
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
Cc: Stefan Metzmacher <metze@samba.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Wouldn't it be easier and clearer to do the compare vs the maximum len ie

if (link_len > CIFS_MF_SYMLINK_LINK_MAXLEN)

instead of

if (link_len > buf_len - CIFS_MF_SYMLINK_LINK_OFFSET)

since buf_len is  CIFS_MF_SYMLINK_FILE_SIZE and looking at link.c line
26 and 27 this means we can use CIFS_MF_SYMLINK_LINK_OFFSET for the
comparison:

#define CIFS_MF_SYMLINK_LINK_MAXLEN (1024)
#define CIFS_MF_SYMLINK_FILE_SIZE \
        (CIFS_MF_SYMLINK_LINK_OFFSET + CIFS_MF_SYMLINK_LINK_MAXLEN)

On Tue, Apr 12, 2022 at 1:01 AM Harshit Mogalapalli
<harshit.m.mogalapalli@oracle.com> wrote:
>
> Smatch printed a warning:
>         arch/x86/crypto/poly1305_glue.c:198 poly1305_update_arch() error:
>         __memcpy() 'dctx->buf' too small (16 vs u32max)
>
> It's caused because Smatch marks 'link_len' as untrusted since it comes
> from sscanf(). Add a check to ensure that 'link_len' is not larger than
> the size of the 'link_str' buffer.
>
> Fixes: c69c1b6eaea1 ("cifs: implement CIFSParseMFSymlink()")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
>  fs/cifs/link.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/fs/cifs/link.c b/fs/cifs/link.c
> index 852e54e..ebfedae 100644
> --- a/fs/cifs/link.c
> +++ b/fs/cifs/link.c
> @@ -85,6 +85,9 @@
>         if (rc != 1)
>                 return -EINVAL;
>
> +       if (link_len > buf_len - CIFS_MF_SYMLINK_LINK_OFFSET)
> +               return -EINVAL;
> +
>         rc = symlink_hash(link_len, link_str, md5_hash);
>         if (rc) {
>                 cifs_dbg(FYI, "%s: MD5 hash failure: %d\n", __func__, rc);
> --
> 1.8.3.1
>


-- 
Thanks,

Steve

