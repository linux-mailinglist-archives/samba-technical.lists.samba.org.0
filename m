Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D5036A7710F
	for <lists+samba-technical@lfdr.de>; Tue,  1 Apr 2025 00:49:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=JJncbmJLl+VK6TEg0oGQymF+gbbxt9mxEVuNURYUInk=; b=5UpcFC6LeX0mhd+BRZpBsybXiV
	NXxjOfdKoyqUTCJlkxuN8nL9a7LMP0qQ3vJUw0r2qrtAEbmbKaxJtfAyOfL8PDnYr1zg9MDtW1CMq
	enBDDOVRDB534ogxpjwIQLgXu0hjs4ZnLPAWQhC4a51LLchHx4Fs/wwvdDHH6K4H/9F3x+awwonhg
	l56f4U2VtmPn3qkJ7YqZO/M0ZvsRTKU2KBlsVZzhb+HtidPM5mPycE03dswI99Mkpw/CfTvArwhno
	U0I71csFS5OarpLrVO+cEyV2G/zYRjmd//GD5Jb1LvfKpOojTq7dSNau1rk9obD/VyLfeOFCFH1XQ
	HbFwGrwg==;
Received: from ip6-localhost ([::1]:64018 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tzNwY-00HFAL-BF; Mon, 31 Mar 2025 22:49:22 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:60596) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tzNwU-00HFAD-7U
 for samba-technical@lists.samba.org; Mon, 31 Mar 2025 22:49:20 +0000
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-307325f2436so49054001fa.0
 for <samba-technical@lists.samba.org>; Mon, 31 Mar 2025 15:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743461344; x=1744066144; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JJncbmJLl+VK6TEg0oGQymF+gbbxt9mxEVuNURYUInk=;
 b=W8WPhQkScIZyd3TwpV62lRkQ0KDqWZi7AyvYRu3tBDEQzLbJ6t8A9xa9LYFU/cOr/b
 ozKMnla58KRH2ONxv2DC7nGfS8wE2D59m1F7pC4FmWSsLHRm0O50ZLGiTKalaU7Q+Nig
 xqV/hDu2FjbEIW51zZKrjWqIWN4SnN3Xge3K5A/ESHi9hoOWO/g96GlmaKp/NpI1ZFGy
 RYBOd1C/bjunKvXkK9AvNrBmYLKZHvjwo5+PUce9G2K+8E2buCoVMdnbte4SS8im0nTc
 LRt2ocBxv1F+xN5vqRdRcaTl1eCZDOCdByO1WQTzfpfP+EK/zzqKNFk9gX9iA2un01sX
 GQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743461344; x=1744066144;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JJncbmJLl+VK6TEg0oGQymF+gbbxt9mxEVuNURYUInk=;
 b=nCOgwyLrG3TQAW9VLSyVNVDOy4wab1RhUgorfGz/KoAU7rHq6vt9Adhjreamct0YPM
 lbPSQcVTBeTJgAasduAyL0YJONjw6cttOBX6/IDlG7MF1BsrPoauzrCgU1dLaWqbXIAN
 wpn9I9pyRevqTnRlpBRMWJGtjRLe88k2WOWvfwcfoREy9+Rw+rhGS2VgiUz/Ox1mep28
 AfW/hxl0sbqjg9si46dLeSdSatMCPvwLRqErAilS8Q6XnRI7XSD0krxa3JDe3EJxr2qE
 B03w970lS0XuX9G3wgP71zhi2IEFQcm5MGgA4YuHSc5oXW6VaaoUTyEOX6wO1vz9m8ZI
 dAPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU74mVXg4UdzDvP/H4N3feiQKjmPVXsBSC4IM2UOjJN/fg5/EisTXNVEmWl9FHAcZkBzm5B9qDaZqRyHEoJbR8=@lists.samba.org
X-Gm-Message-State: AOJu0YxReG29rC30+Th/WlmiFmffyDIG2QwdPliCqAuJVQccJQjvu7nO
 2ZPGi2PqbvfxxkcqCb0FWi6DdHsZ6qYduRdhfEfj2nsVmQNOqvlx2CTGKUuDlPg4NhIIx8C8B7I
 Z/bkH6lw2MiH4ZqOGrpMMNKtHXYg=
X-Gm-Gg: ASbGncsirKr5ATSfX/91OT2Ehe9Jn0dF9PGz3hjiXinyUNdBXDZCCC268DH2tP5yVu8
 prKvYFS8jvHNRezwFsZK7QAmm7x8r8iGi90M+9V5973gTnNDlwhdwXaRVcPV7DG3U0xS1jyM0Zk
 8B0ESaNZAC8m3QZ14fkRYVDznBlD13jIyvhoYd+Sd353SvdFkRrZ79jNJTjw==
X-Google-Smtp-Source: AGHT+IFo6fCjpdqA4vfxsp3o/NnEBqFJy1/SxPTHysERpTkduj0rc0zuI6zgJHSdYETc8tbGvR6edlfPCXOcFfjeamM=
X-Received: by 2002:a2e:ad90:0:b0:30c:467f:cda2 with SMTP id
 38308e7fff4ca-30de0248a84mr39845021fa.10.1743461343946; Mon, 31 Mar 2025
 15:49:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250331082251.123381-1-r.smirnov@omp.ru>
In-Reply-To: <20250331082251.123381-1-r.smirnov@omp.ru>
Date: Mon, 31 Mar 2025 17:48:52 -0500
X-Gm-Features: AQ5f1JrmN4-FDQbhNyJ2tAAA5NJkv_0KAU_KrvRkEUwYudcVKQIfG4o7iA0f3-s
Message-ID: <CAH2r5mtkVvPyT0qvZbNwwKSmsXtryStiE6bGGn_mK=E3V_waEw@mail.gmail.com>
Subject: Re: [PATCH 0/2] cifs: fix integer overflow in match_server()
To: Roman Smirnov <r.smirnov@omp.ru>
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
 Shyam Prasad N <sprasad@microsoft.com>, lvc-project@linuxtesting.org,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, Steve French <sfrench@samba.org>,
 Bharath SM <bharathsm@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Merged into cifs-2.6.git for-next

On Mon, Mar 31, 2025 at 3:23=E2=80=AFAM Roman Smirnov <r.smirnov@omp.ru> wr=
ote:
>
> If a large number is written to echo_interval during mount,
> an integer overflow may occur in match_server():
>
> smb3_fs_context_parse_param()
>
> cifs_smb3_do_mount()
>   sget()
>     cifs_match_super()
>       match_server()
>
> Found by Linux Verification Center (linuxtesting.org) with Svace.
>
> Roman Smirnov (2):
>   cifs: fix integer overflow in match_server()
>   cifs: remove unreachable code in cifs_get_tcp_session()
>
>  fs/smb/client/connect.c    | 6 +-----
>  fs/smb/client/fs_context.c | 5 +++++
>  2 files changed, 6 insertions(+), 5 deletions(-)
>
> --
> 2.34.1
>
>


--=20
Thanks,

Steve

