Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E79DB1B071
	for <lists+samba-technical@lfdr.de>; Tue,  5 Aug 2025 10:49:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=kwp1D4thNw0ErXWiATWSkrXe52/Xx3sx+8XEergr5J4=; b=RTZJIyj7wRY5Bng5vHaN1hli5I
	nGiFVsOtfKrwf8r34bakyKiZ7ugfYz5t/I5mpnaCzMjKlNjoKT3GNRw8R6BlwARCk6K/sgBJ6fG+B
	Oxz43IRiHQ7ovKO5NWwRywWqiAeCasMj2Om8+T/ftaI6cjBdgxK0W9hZ3nbjKzy2XVGYL+Snwyhe4
	tsPZGWHmSvxANqxfUsYzFeEPbpmprtomTLBf+9taXVStKtXTPmWhVFovNTiL3dhhdJvViRG1Lcwib
	rJ72pQ8SGce93HBlVrH5xnvM5gsEWEmhRKmhTL8nf6Qj+M6s060iBUErO2tCCQgsQ5qqcw88e4njC
	RPNJmI1Q==;
Received: from ip6-localhost ([::1]:42106 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ujDLt-00EKqm-2N; Tue, 05 Aug 2025 08:48:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31]:45970) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ujDLo-00EKqf-Lg
 for samba-technical@lists.samba.org; Tue, 05 Aug 2025 08:48:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7B9BB45AF9
 for <samba-technical@lists.samba.org>; Tue,  5 Aug 2025 08:48:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B3AEC4CEF9
 for <samba-technical@lists.samba.org>; Tue,  5 Aug 2025 08:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754383718;
 bh=fC2sPesJaWB3vGS89DrAE+1B7+NtGw7FUUhJTtAJBSU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=b/42iUsCIMt5dMcLQerMlV2P4BOR4H+k6pwXpMvQEoUZ5BTV71/x2TH1TDhq2Adpj
 KtNbrxd3GY2aN14CvcJthNxzuyHgQMSl/6AR8wRs7A8CUux6zLbVTqKi1g5Fy5mAtG
 KMpD9I7g3B0dE9p1UPgYZoa7+g5kJPoA4aJlJCZCZ4adun1fIMOJwRh0CW8l+XgUTg
 +66sqKX0nrGMXtNV9BHaDMa3dHcafPzoD/5LcpLbhs8pHYqdMMmLGsmajmy65laeST
 +Y3br11yLrn6wqZEdsIGjcA3CoHSLX4P4kvJbIjyJ4zmp80qNJOpKF+ZIAWc5rFN9g
 X+7m3icV/cnEA==
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-af93bcaf678so474930266b.0
 for <samba-technical@lists.samba.org>; Tue, 05 Aug 2025 01:48:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV1NvPdfsmSouF9P0uhZ8rUBmZPkC0u1zCVeuLGhrFSUjJ2iPtO/o1ffQshLRlUYblcXJrsIzvySJxjeOM+mO0=@lists.samba.org
X-Gm-Message-State: AOJu0YxUw8OHsWyDcMwoGtDL+QijJfBNWFsCYglm5ikvvlilZ4VatRZA
 uuoWp+Jux6Z0yg2dfVHzDr0j+QEuLYT+eQqLjV0y6rXE5GEIVHuRQQy296OW2p/MvgsQX7pV3N4
 SWrP9tD1Vk9hjRltfpvljdLmg5d6F+S8=
X-Google-Smtp-Source: AGHT+IFmIl/8zAWy1JkAgJEaMj5eAr6p08BQSFWK5JB9Ng4kiDAEG3UGvl+nll8cNsJrKPsSubymdKTI0hacn72qD7A=
X-Received: by 2002:a17:907:6e8f:b0:ae3:bb0a:1ccd with SMTP id
 a640c23a62f3a-af94006657emr1404181666b.26.1754383716960; Tue, 05 Aug 2025
 01:48:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754309565.git.metze@samba.org>
In-Reply-To: <cover.1754309565.git.metze@samba.org>
Date: Tue, 5 Aug 2025 17:48:25 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9U1EE4DjPdkzzB0FA_Smd3xpm9CBHpy_3rzczxEQdQ_w@mail.gmail.com>
X-Gm-Features: Ac12FXwGxO7sQmxjLH1RYAT4OCSCkz3f8FfTOE-Q__AA-1ueu0mP4GF4gVvgfrw
Message-ID: <CAKYAXd9U1EE4DjPdkzzB0FA_Smd3xpm9CBHpy_3rzczxEQdQ_w@mail.gmail.com>
Subject: Re: [PATCH 0/4] smb:server: fix possible use after free problems
To: Stefan Metzmacher <metze@samba.org>
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
From: Namjae Jeon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Tom Talpey <tom@talpey.com>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Aug 4, 2025 at 9:16=E2=80=AFPM Stefan Metzmacher via samba-technica=
l
<samba-technical@lists.samba.org> wrote:
>
> While refactoring the client and server smbdirect code I
> noticed a few problems where we might hit use after free
> style problems.
>
> In order to allow backports I decided to fix the problems
> before trying to move things to common code.
>
> The client has similar problems, I've sent a separate
> patchset for the client already.
>
> Stefan Metzmacher (4):
>   smb: server: remove separate empty_recvmsg_queue
>   smb: server: make sure we call ib_dma_unmap_single() only if we called
>     ib_dma_map_single already
>   smb: server: let recv_done() consitently call
>     put_recvmsg/smb_direct_disconnect_rdma_connection
>   smb: server: let recv_done() avoid touching data_transfer after
>     cleanup/move
I have directly fixed a typo : consitently -> consistently
Applied 4 patches into #ksmbd-for-next-next.
Thanks!
>
>  fs/smb/server/transport_rdma.c | 97 ++++++++++++----------------------
>  1 file changed, 35 insertions(+), 62 deletions(-)
>
> --
> 2.43.0
>
>

