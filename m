Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C99D39C7997
	for <lists+samba-technical@lfdr.de>; Wed, 13 Nov 2024 18:06:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=zEep/OMfJyldzNvkNFDVhhiUsnQA3+XUm5BPLdUV5Uo=; b=rsBSB9X4orsR2wRHpwuTANNTEl
	3kzdBpWSjA5/lF2kCaUMk07Rp55kop+7GAcZwGnjcSKfZ+ewxwcL22FfnTdfRjPASNwUStWyuTOWB
	KiXJmcRmmRBcpkFwhvTRgcC7YVc4uAqFvtBVz5KFC36W14NIvrK9UHycaHnxiXNXlviEgqR0c6AnF
	wCtW5ArBGJnUCsU+Txr33hpjg9ry4p4k1Ypx2x3ceBUsyJJMcTBI1ULZcfG6HjfrWUVf13tXAZa2f
	n4yialIYUYFRgSsDs2d4wGVX484a3NO81BcUwdjRrxMBkANGFbfL2C5I4kiqXELwMxyEyqkzf3tLf
	xwHMNfbw==;
Received: from ip6-localhost ([::1]:61652 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tBGob-008VBd-SZ; Wed, 13 Nov 2024 17:06:01 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:54608) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tBGoX-008VBW-7L
 for samba-technical@lists.samba.org; Wed, 13 Nov 2024 17:05:59 +0000
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-53da3545908so655178e87.1
 for <samba-technical@lists.samba.org>; Wed, 13 Nov 2024 09:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731517556; x=1732122356; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zEep/OMfJyldzNvkNFDVhhiUsnQA3+XUm5BPLdUV5Uo=;
 b=SyWBj0iUHo4ABPcozASY0yYMQ08BulR/kUju/Qe0AYRJaKmieQgpFdb9OcDVXSerma
 EpeobLfRAi8j39dDBgaTQ4sVNxp0vYINxgcnO7vhOnySLycBmBtJMz4YtKnzR+LflZwB
 FKgtOPzGjX7TCjls0cBK+3alSkB+DfqBXZaXZTm/dRzOnd8M6g2QhJHCwR/UJ3+XKvqG
 jUlqFZBaJpi8AYahQTkSUIwj7d3LNjmNOTl1gTGFlzQAIDjPCMnjaQ5z5ijkuDni+yWk
 uQM5U0KlvdBfFSxXGA5WQMlKMgi9SveTKqzpGePfC6C0jjVqW5v0hPLSIcMwfjpOSpPs
 qh1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731517556; x=1732122356;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zEep/OMfJyldzNvkNFDVhhiUsnQA3+XUm5BPLdUV5Uo=;
 b=DSiZ7V6duMBSPxbYnyMGoUrliy9dO3vFjnbgYr2Ob/6kixgFCUZpk3rjbFIpGM3dau
 0y3MCFTSSdl+0ITK83krspHIeLtqZdxvOhKnxjnSqOx2D4qL4ekXTdQDuP09yrqLObup
 nmB3eUN8Pnd4TaQowrJ3gUX167+aQ/vNHCcJYkXei6adVcWehB8/xjzvywYsWwqzLBFh
 Lx4P/u+sckyeJM+Zu75KOCFujWGI4MzBVGOLqJ+qik3ZEVOTH3AvgQA4SLtrf2r0YhPC
 85Jsqw0lehckAT2xY4y4sLY07fwEwJ/yG5jLtkUf6FyaiUZcsdEN+To5W0OKlcDYLRec
 BL1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSgySJxqOAiO/EdV1oTzNSFDLq0eZ8IPPP52K0JPxLuNZxEn9OZch5Zx/tydxT/ccCzYS2dMpN1Fd2SD9qwuI=@lists.samba.org
X-Gm-Message-State: AOJu0YwFzpQK5s7ZUmLGokxB3gjmUMFPn3RrDF+BP9F0dy/Y+FqlPLdV
 1yLIAY7HeQaj+bBIvhOuDZeeF122vD3qTav6EZXkVICQhI1+HQ20H1T2ZTBRJQcwcPXaLByPrWP
 62Nxta7bYqukT0ZCXn3ycK1k+18U=
X-Google-Smtp-Source: AGHT+IHklTE9+daZ5V6N7lYW+6/IbHQcQEhMqhqVGJ7scdARVw98D3T0fBcxFBULN/mfvPbKatFu8XWI1hgeC9KqiEw=
X-Received: by 2002:ac2:4e13:0:b0:535:82eb:21d1 with SMTP id
 2adb3069b0e04-53d8630341bmr9311605e87.57.1731517555466; Wed, 13 Nov 2024
 09:05:55 -0800 (PST)
MIME-Version: 1.0
References: <20241112105837.166575-2-thorsten.blum@linux.dev>
In-Reply-To: <20241112105837.166575-2-thorsten.blum@linux.dev>
Date: Wed, 13 Nov 2024 11:05:44 -0600
Message-ID: <CAH2r5mvUNiXVAVVmvt=W_RAVMCm5Fgs_=Etcme3uBZ8gKFK30w@mail.gmail.com>
Subject: Re: [PATCH] smb: client: Use str_yes_no() helper function
To: Thorsten Blum <thorsten.blum@linux.dev>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>,
 Shyam Prasad N <sprasad@microsoft.com>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 Steve French <sfrench@samba.org>, Bharath SM <bharathsm@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

tentatively merged into cifs-2.6.git for-next pending testing and
additional review

On Tue, Nov 12, 2024 at 5:33=E2=80=AFAM Thorsten Blum <thorsten.blum@linux.=
dev> wrote:
>
> Remove hard-coded strings by using the str_yes_no() helper function.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  fs/smb/client/dfs_cache.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/fs/smb/client/dfs_cache.c b/fs/smb/client/dfs_cache.c
> index 110f03df012a..00820f57b434 100644
> --- a/fs/smb/client/dfs_cache.c
> +++ b/fs/smb/client/dfs_cache.c
> @@ -173,8 +173,8 @@ static int dfscache_proc_show(struct seq_file *m, voi=
d *v)
>                                    "cache entry: path=3D%s,type=3D%s,ttl=
=3D%d,etime=3D%ld,hdr_flags=3D0x%x,ref_flags=3D0x%x,interlink=3D%s,path_con=
sumed=3D%d,expired=3D%s\n",
>                                    ce->path, ce->srvtype =3D=3D DFS_TYPE_=
ROOT ? "root" : "link",
>                                    ce->ttl, ce->etime.tv_nsec, ce->hdr_fl=
ags, ce->ref_flags,
> -                                  DFS_INTERLINK(ce->hdr_flags) ? "yes" :=
 "no",
> -                                  ce->path_consumed, cache_entry_expired=
(ce) ? "yes" : "no");
> +                                  str_yes_no(DFS_INTERLINK(ce->hdr_flags=
)),
> +                                  ce->path_consumed, str_yes_no(cache_en=
try_expired(ce)));
>
>                         list_for_each_entry(t, &ce->tlist, list) {
>                                 seq_printf(m, "  %s%s\n",
> @@ -242,9 +242,9 @@ static inline void dump_ce(const struct cache_entry *=
ce)
>                  ce->srvtype =3D=3D DFS_TYPE_ROOT ? "root" : "link", ce->=
ttl,
>                  ce->etime.tv_nsec,
>                  ce->hdr_flags, ce->ref_flags,
> -                DFS_INTERLINK(ce->hdr_flags) ? "yes" : "no",
> +                str_yes_no(DFS_INTERLINK(ce->hdr_flags)),
>                  ce->path_consumed,
> -                cache_entry_expired(ce) ? "yes" : "no");
> +                str_yes_no(cache_entry_expired(ce)));
>         dump_tgts(ce);
>  }
>
> --
> 2.47.0
>
>


--=20
Thanks,

Steve

