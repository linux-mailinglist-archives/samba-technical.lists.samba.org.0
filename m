Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4931694C8F7
	for <lists+samba-technical@lfdr.de>; Fri,  9 Aug 2024 05:51:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=GcsKyLDJONt+ZvzDLWHq4abBRnvwVFDALz1JbD/AO9M=; b=TBH2PededbjDYCkGVqHcKwO6H8
	k6ddSu+TMrB2oRXF8hDaoHRZ4SEhnCGXe5GXwWpYqxfeyNbUL6T9jDVl24BGrdZr19gOCSp3yRxT6
	1BKObfGJV5aBhyeS4PybQTS8zC0p0GzoIeseqipGMX9albjvUp09jRBiFEjT5XdKJyvw5FCDmXSnA
	1Pcp8UoUV5u56IKI05cKdlEZOqBCCVkJxlEv8hKKuwdHSZLtdUu25YFppcCyB+wgQRh3i0F15a9Ok
	D5vpLS7QSeYb4Fr7sLZ/2MRCeEb9STVoQ20bFKQ/dNefXK7gprqfJy9qVlrFdY1QHopjiNFZz+ECW
	XBXV0YKg==;
Received: from ip6-localhost ([::1]:56732 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1scGe8-004Dgr-Sb; Fri, 09 Aug 2024 03:50:32 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:55311) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1scGe4-004Dgk-2u
 for samba-technical@lists.samba.org; Fri, 09 Aug 2024 03:50:30 +0000
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52f01993090so2192965e87.2
 for <samba-technical@lists.samba.org>; Thu, 08 Aug 2024 20:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723175426; x=1723780226; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GcsKyLDJONt+ZvzDLWHq4abBRnvwVFDALz1JbD/AO9M=;
 b=nofbwriCyjHs/dW4rM1omnJuWa6G8buPEHFzDSSO9ozzM/GgFrrgux85zFiZ3uWaKM
 3nSlL5UAp+RrPAFXpbA+3D4n5EB9KB7mmmlq1Jf2v2zdvF/m8zFr/XG5a5p8FkFcyTQ4
 f9eF0tInJj2svUpFrMrOtb79rpJPj5P0nyqq71JSP9w0ynqJW0LHeFPv9Ic0ExjUcMlz
 9La677dNDMCmm1AMICZzTNsuat2nKJNPE/cuXOJoJYegMSse3K9iq9ms7TvOlGoSJ1dx
 CB3Tz9QGWk0Q+wyhV7cDoIe0z7907HpxzwF51lM8NSSRBmmtB5D4wtk3BFInVv2DbJ88
 UF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723175426; x=1723780226;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GcsKyLDJONt+ZvzDLWHq4abBRnvwVFDALz1JbD/AO9M=;
 b=EOjGYe8hMsVW8c7h/kYzrFmzLn+/wzAY2uhLmlc8ZL/3PI0/Hy+PlFNxIJy3g1peB2
 Hn+yT8GSn5bZJ3LkPJNRN5r/pYi7FEbrk3L+Q04ORH13/AAPc48noe9ahFHR9YmmGGIH
 SDp2Sdt58Nd3ERSpXYqZTPl7aEE9IJGPgGRT6FhN7uLxzDZPhx1KAhbrzWcn07yFFQP9
 321C7GZD56zfZJDteWXJzN52dCkfOmuQeWOz6swQhJcY0A+QTVRZ3AbfWQQcQtRwixfq
 /OHQV3hv4x21q4N680Bwkbzvq+zXXsRtyz1MU7Oq46eUpcaCCQJjrW75wuc9efRQuc4/
 TE1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeUvs/5/rU/yoFDO4v/bA5UHurLmrwTmmiMYqepEkTxQUAHpJr+dtuN2wk0Nwiku2JZjETzoeeLGlbpFpJK5RnKF39yfAvDqO9wLVeGgzR
X-Gm-Message-State: AOJu0Yw6xA/j27gEuKEWqNCkiTF9Uu3Mn/KFXvhjJdJRxCERhYCUnEX3
 zgs38O+v4aB+ffRaoJ0c4UcprcvLTwviTOnEXsoCbuRoEYQxey1J8/IK5/Ls4j6+pbivMBE0Niv
 bJf3NHHU35Mowm9Vxep9hvwCcx7w=
X-Google-Smtp-Source: AGHT+IHAViZ+40B8/UqdywKboDwJDM5h369EKkboKszxuNwuILrsCiD/Dz2BVQ2iWoUGlelJi3lxJWMEmm+/c9da4s8=
X-Received: by 2002:a05:6512:2314:b0:52e:9b9f:9377 with SMTP id
 2adb3069b0e04-530ee9cc5d8mr180073e87.21.1723175425293; Thu, 08 Aug 2024
 20:50:25 -0700 (PDT)
MIME-Version: 1.0
References: <ZrVA1N6Iv0Byb3I7@cute>
 <CAKYAXd-5gKBEAO_GvSKBLciiB1qhjevTSd8kre_-nJQpTw+3vQ@mail.gmail.com>
In-Reply-To: <CAKYAXd-5gKBEAO_GvSKBLciiB1qhjevTSd8kre_-nJQpTw+3vQ@mail.gmail.com>
Date: Thu, 8 Aug 2024 22:50:13 -0500
Message-ID: <CAH2r5muVvaOii15Kg5e0zWzhKdDy5fVh=GjtM=kZ=fyapKxtyQ@mail.gmail.com>
Subject: Re: [PATCH][next] smb: smb2pdu.h: Use static_assert() to check struct
 sizes
To: Namjae Jeon <linkinjeon@kernel.org>
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
 samba-technical@lists.samba.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-kernel@vger.kernel.org, Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Bharath SM <bharathsm@microsoft.com>, linux-hardening@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Thu, Aug 8, 2024 at 9:51=E2=80=AFPM Namjae Jeon <linkinjeon@kernel.org> =
wrote:
>
> 2024=EB=85=84 8=EC=9B=94 9=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 7:04, =
Gustavo A. R. Silva <gustavoars@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
> >
> > Commit 9f9bef9bc5c6 ("smb: smb2pdu.h: Avoid -Wflex-array-member-not-at-=
end
> > warnings") introduced tagged `struct create_context_hdr`. We want to
> > ensure that when new members need to be added to the flexible structure=
,
> > they are always included within this tagged struct.
> >
> > So, we use `static_assert()` to ensure that the memory layout for
> > both the flexible structure and the tagged struct is the same after
> > any changes.
> >
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> Acked-by: Namjae Jeon <linkinjeon@kernel.org>
>
> Thanks!
>


--=20
Thanks,

Steve

