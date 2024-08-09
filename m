Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3E794C8BF
	for <lists+samba-technical@lfdr.de>; Fri,  9 Aug 2024 05:09:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Pa7eDJ4t1xpc18+Np23nsKw+Qc3avfwtmBY5kU8KZ50=; b=teGmDCfmJT8G0iHy/nWVS+gSg4
	tWvpLq/QtZskkqQqHSk6oplWXYccyeOV3GAR0rmxwrIrXYbR90yJ2gCGI1tnQ3Ig5YT6i4EmsveMv
	wZmgfrXjjzifCJIlBMSV/ILnCQTkJJnHkbS9/Dw/VrEmJgNpTEfTYALIN5x5YJpl7s+IC6316wPnV
	vI5ENbAjvA992rc+ZyCgM5F+2EK9OuhV/erR8na7cQw65TRz0n0YW0GczSwStYvmmFF1d4jmw0Iy4
	NgjQE5T8f31wFPJHKSDqGDxxfrBlahq96m6AxH1OkBqsgM9W1M0dtuV4Uk4ky7ouJ6eVs57dUqHpI
	NZIShPgQ==;
Received: from ip6-localhost ([::1]:29634 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1scFzo-004DWd-Kb; Fri, 09 Aug 2024 03:08:52 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1]:53460) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1scFzk-004DWV-Au
 for samba-technical@lists.samba.org; Fri, 09 Aug 2024 03:08:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3CDC2CE1383
 for <samba-technical@lists.samba.org>; Fri,  9 Aug 2024 02:51:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D33EC32782
 for <samba-technical@lists.samba.org>; Fri,  9 Aug 2024 02:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723171902;
 bh=Pa7eDJ4t1xpc18+Np23nsKw+Qc3avfwtmBY5kU8KZ50=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Tp2RTvOgG3K4xiDPI7cCiLrTQs1QX2Bl8yGPYlnC4aio0GCEidWPGX6jqMoXF7Wre
 BWlskMjaVUut6fuLMHcruUIw14PLApn3VNdcGecwOAtQFlR8TnRuOoA52kB1qgw0cA
 OYbjLLrJQNTp2eWRq+kIIwlPCXKh6d2GmaJPNnTYkUSrn2DnOXFvjgv4ihKqC03asb
 yvUbgW1S45OwDJjdf0CVyyNKNJ9ZyvGxzz/Hg6QmaSMgy0r8cTHgSkw6hbABj+SpCH
 okFzxwdgB08ySM0CrPGTjSfPZ286vBBbQOgAKYNmSp9bknI0gvo7ebgL67QW+wlWJD
 /GwUgmQDOnz8Q==
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-260f1664fdfso1068198fac.1
 for <samba-technical@lists.samba.org>; Thu, 08 Aug 2024 19:51:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX7ZMW4bpSRCyXGNK2Lis4/RiSkpHEPHapBwKWuZr9CcHPqQZVGkHbJv3fQEP8WOEuv2tlnyoXP9yxgcKOuVlY3hohrbreyELoNZ/3E7cHD
X-Gm-Message-State: AOJu0YxMwVRDmVbCtPesNlJHwlU1WiDDgarK0iqCPFbq7QY7HSbt/oEt
 asJEWFtCZgojqTIW6kWpdxsM2PfgXN3J6wmvDeFVvIrWTxhUe5gS3mPHwANNNETQg44HjlBBBqm
 uCp8nd+XYss2Y5MVAYSpu0rNjVkE=
X-Google-Smtp-Source: AGHT+IEoUjgjrKsz7zNykn14iHMUq5I0duHy7vcOoiOasSgT3fpmZ3N3RprxQxmTKbqOGsGT1nvjMGBGPRFnlESiqUo=
X-Received: by 2002:a05:6870:46a8:b0:25d:fc34:ba6a with SMTP id
 586e51a60fabf-26c62cbe04amr286423fac.26.1723171901804; Thu, 08 Aug 2024
 19:51:41 -0700 (PDT)
MIME-Version: 1.0
References: <ZrVA1N6Iv0Byb3I7@cute>
In-Reply-To: <ZrVA1N6Iv0Byb3I7@cute>
Date: Fri, 9 Aug 2024 11:51:30 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-5gKBEAO_GvSKBLciiB1qhjevTSd8kre_-nJQpTw+3vQ@mail.gmail.com>
Message-ID: <CAKYAXd-5gKBEAO_GvSKBLciiB1qhjevTSd8kre_-nJQpTw+3vQ@mail.gmail.com>
Subject: Re: [PATCH][next] smb: smb2pdu.h: Use static_assert() to check struct
 sizes
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
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
Cc: Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>,
 Shyam Prasad N <sprasad@microsoft.com>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Bharath SM <bharathsm@microsoft.com>, linux-hardening@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

2024=EB=85=84 8=EC=9B=94 9=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 7:04, Gu=
stavo A. R. Silva <gustavoars@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=
=B1:
>
> Commit 9f9bef9bc5c6 ("smb: smb2pdu.h: Avoid -Wflex-array-member-not-at-en=
d
> warnings") introduced tagged `struct create_context_hdr`. We want to
> ensure that when new members need to be added to the flexible structure,
> they are always included within this tagged struct.
>
> So, we use `static_assert()` to ensure that the memory layout for
> both the flexible structure and the tagged struct is the same after
> any changes.
>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
Acked-by: Namjae Jeon <linkinjeon@kernel.org>

Thanks!

