Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1331A975C5D
	for <lists+samba-technical@lfdr.de>; Wed, 11 Sep 2024 23:27:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=sqtRh/pJ/kG5Ee3Qg3j3oLtps4VUqaM2CM4az1A8dtU=; b=BvgHqbFaxo4rLON5LiVHduuifk
	vMKFxBEKmxqFap5LgpnEg6NDpQ2BTYG2uWiMsoJYR8i8OUKVQnzZjxmz+XIEnlp/zCBhyyAlRz5LL
	UvrajR3Ze3XEAOHgoaYlw/toEzvNi+xEHMP91Db3wqGT/0zXNZRDssbPFngXV9Zbz5LuJ/BqiL06y
	gzlOGcpTm9Dc3fTVWajOW3izZgR8sNiDL+grIHYTEWUw7C6HAEZ+/H7dJ7O1NWPaEKOXRpseBNtRF
	ltaG9dT08sh2oXdqcnbxqKFsqtADQxoHIBYyCPiYwWuB513vC3C94a2s2czoMaAoNp6/ZSZs1nAOJ
	OyC2CCTg==;
Received: from ip6-localhost ([::1]:56270 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1soUra-008I8p-5h; Wed, 11 Sep 2024 21:26:58 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:42019) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1soUrU-008I8i-QU
 for samba-technical@lists.samba.org; Wed, 11 Sep 2024 21:26:55 +0000
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-535694d67eeso253802e87.0
 for <samba-technical@lists.samba.org>; Wed, 11 Sep 2024 14:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726090011; x=1726694811; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sqtRh/pJ/kG5Ee3Qg3j3oLtps4VUqaM2CM4az1A8dtU=;
 b=Kgge2Ql6wQ+GMiDiEiuW9TvHu1EjcnqW6gxmb04RaGgxPdCxlWDAd4HlovW5vuPIXa
 pq+3HAi9Obow4N7GPp1K9bUykjlME1cha7O4Q5THT98AbpK1WULxsBBuBjWKeD5TLR5G
 74MI4WBaWblL4mjTrZqZEKB42CaCEqFconmiyLKI5o79GNNugmwg1Cl87jGzPz5M0/FR
 jw08qK39h9/GPrRTuy0nyIXIxzzgSGNJBGlhGXpozs0NWjXywuFg/sBkMlCyS9pE7mCA
 q0UT8Ofr5M6ZMlCFWSkPacwD+nYecqRRSK6DHDGJlfmHlvea+X/EQ7JZeNCsHNz0JsKX
 WyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726090011; x=1726694811;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sqtRh/pJ/kG5Ee3Qg3j3oLtps4VUqaM2CM4az1A8dtU=;
 b=PSD1CdkmGMSdfgKZiJwtLCutbir8uJXGXvSzwgkNpW/EVSppLELiVOlYvUMbObVmwb
 bDEDdQRRCKVXVwQzuR7uXEEUOhtZH17YoEpLakvO7U0HUdewh9xDZ1WfVltMdFX74Tzk
 ltdbdE6Vicgw1oQUNTL6bNELcfrQs6HM2kCVtADpXX0fkB8yrVVEKB3i79CGGVhnSK75
 4qY01+tVhgX60cFqNvMJVJMiVKdw307rGxEON1durRotDVFuS8VH5d7TAaVnJzO+Ma5A
 gsRV95zGCQWW1sp6VrX7zsax/wCgsImPfyNzHdZwSU3Dy6kO8ay5JAk2zadypRAwD748
 zYdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYZUmuSxNf4fmoUA5/+9+d6fdpBJaLDu6JSqZcyczXjr/VQBmbhWTgbi9ucQT8JrBjzKX6JcLB2f8NGbQomL8=@lists.samba.org
X-Gm-Message-State: AOJu0YyPl7CBVQpdWzxmRwOpcl1l6qYe5/tRim2GDCEv0EdKC3WEs8CA
 0BM9oi/NcC0LmLnTJUxaRZNRYmVb6/s29O8u5KDiZXN0eDRyBm+iYryUz1AV7CMAXqh5HWKAL9S
 fGra6qGDoDYOy7+n6Q8BQBpSNL4w=
X-Google-Smtp-Source: AGHT+IFC8+ySnmybQlygTyoRyhYMxq7uAqdH0Tu9Gl/JShGnHyNqwXrbsLhR7L3k9aYMEkxezsOAaYTLJ7OjHjnL66A=
X-Received: by 2002:a05:6512:12cb:b0:52f:27e:a82e with SMTP id
 2adb3069b0e04-5367909dca5mr192274e87.21.1726090010686; Wed, 11 Sep 2024
 14:26:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240910151418.1233049-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20240910151418.1233049-2-u.kleine-koenig@baylibre.com>
Date: Wed, 11 Sep 2024 16:26:39 -0500
Message-ID: <CAH2r5mu_PT+34JqL7O6yqfDua=6NNU+AP4+n56FJSc1X5Rpp3Q@mail.gmail.com>
Subject: Re: [PATCH] smb3: Fix complilation for gcc9
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
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
 Enzo Matsumiya <ematsumiya@suse.de>, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, Steve French <sfrench@samba.org>,
 Bharath SM <bharathsm@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

this looks like it doesn't apply anymore due to changes in "smb:
client: compress: LZ77 code improvements cleanup"

Let me know if you see any problems building the current for-next

13b68d44990d (HEAD -> for-next, origin/for-next) smb: client:
compress: LZ77 code improvements cleanup
1dcb0b607b9b smb: client: insert compression check/call on write requests
ee71379301eb smb3: mark compression as CONFIG_EXPERIMENTAL and fix
missing compression operation

Enzo,
Is it easier for you to update patch 1 and 3, to make it smaller so
you don't have to add code in patch 1 that you remove in patch 3?
Also let me know if other patches to try?

On Tue, Sep 10, 2024 at 10:14=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Compiling an x86_64 allmodconfig on Ubuntu 20.04.6 using gcc Ubuntu
> 9.4.0-1ubuntu1~20.04.2) 9.4.0 fails as follows:
>
>         $ make fs/smb/client/compress/lz77.o
>         ...
>           CC [M]  fs/smb/client/compress/lz77.o
>         In file included from fs/smb/client/compress/lz77.c:10:
>         fs/smb/client/compress/lz77.h: In function =E2=80=98__count_commo=
n_bytes=E2=80=99:
>         fs/smb/client/compress/lz77.h:220:1: error: no return statement i=
n function returning non-void [-Werror=3Dreturn-type]
>           220 | }
>               | ^
>         cc1: all warnings being treated as errors
>         make[5]: *** [scripts/Makefile.build:244: fs/smb/client/compress/=
lz77.o] Error 1
>         make[4]: *** [scripts/Makefile.build:485: fs/smb/client] Error 2
>         make[3]: *** [scripts/Makefile.build:485: fs/smb] Error 2
>         make[2]: *** [scripts/Makefile.build:485: fs] Error 2
>         make[1]: *** [Makefile:1926: .] Error 2
>         make: *** [Makefile:224: __sub-make] Error 2
>
> That compiler seems to know about __has_builtin but not to have
> __builtin_ctzll. In that case fall back to the implementation that is
> also active in the #ifndef __has_builtin case.
>
> Fixes: 0fa8d04ff36d ("smb3: mark compression as CONFIG_EXPERIMENTAL and f=
ix missing compression operation")
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> ---
> Hello,
>
> feel free to squash this into the original commit.
>
> Best regards
> Uwe
>
>  fs/smb/client/compress/lz77.h | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/fs/smb/client/compress/lz77.h b/fs/smb/client/compress/lz77.=
h
> index 3d0d3eaa8ffb..4fb939296f39 100644
> --- a/fs/smb/client/compress/lz77.h
> +++ b/fs/smb/client/compress/lz77.h
> @@ -200,10 +200,8 @@ static __always_inline long lz77_copy(u8 *dst, const=
 u8 *src, size_t count)
>
>  static __always_inline unsigned int __count_common_bytes(const unsigned =
long diff)
>  {
> -#ifdef __has_builtin
> -#  if __has_builtin(__builtin_ctzll)
> +#if defined(__has_builtin) && __has_builtin(__builtin_ctzll)
>         return (unsigned int)__builtin_ctzll(diff) >> 3;
> -#  endif
>  #else
>         /* count trailing zeroes */
>         unsigned long bits =3D 0, i, z =3D 0;
>
> base-commit: 6708132e80a2ced620bde9b9c36e426183544a23
> --
> 2.45.2
>
>


--=20
Thanks,

Steve

