Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF53BCEA3F
	for <lists+samba-technical@lfdr.de>; Fri, 10 Oct 2025 23:48:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=3CR2CWtGpIxQ0lSsR8U+87pwlo1Y1um+ZQFcDhfvovw=; b=Qxm4vOk2vF53RtQBQQYnsusm/X
	zUE1vnU6clPycN9uTkioKtxr36TfS/CrOhbT0YB0Mp0bK5C9BDTLp3Q2MemuJA6O7PckhpiAQZQZO
	R9i178zfzb08jswrFqbdDoYHE6LZn4ZJUaeXwkFessxGx6d8qi26S/WZ8t2rSRqQa+XgUQ7QOa3G4
	4nzc/TGzga6aHdH9f9waSP8xOV7+qEv/lsLEioIsG68wXIL22Qq266zarbqCXuFYM7e9EQpyeaNcR
	yOPAHBaKgzeRq41AawQwGgkMof3g7qhTlZIphve4rE61i7xJlyFUljJXCx6aIeXsQeyfKb/rWkYE0
	2jl8KLiQ==;
Received: from ip6-localhost ([::1]:37350 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v7Kxy-007W68-3N; Fri, 10 Oct 2025 21:47:58 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:58404) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v7Kxt-007W61-9W
 for samba-technical@lists.samba.org; Fri, 10 Oct 2025 21:47:55 +0000
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-795be3a3644so16586176d6.0
 for <samba-technical@lists.samba.org>; Fri, 10 Oct 2025 14:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760132871; x=1760737671; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3CR2CWtGpIxQ0lSsR8U+87pwlo1Y1um+ZQFcDhfvovw=;
 b=CRCXV9sWTNM0gjYjVzEmVwGRXPs8/XEg8JKoLsxb6gGSJlLqOlsjN+484hHvqpgNng
 dq0qr++d/x0XpQOssTRVM/+VOYN0Mzd64BGZMDiDr4EF4G/9hCk/+98BizcJg4yOcNQ6
 OL8hAMQViiNIe7V1uzhlQUyj7Y79EYorajgUowSyJdvidOZjBWKnmateo+LSFueMkr0U
 8FOsixlUKSlFCwCBLAcvgIPprz54SKMpIIEtD08Z87SV63hHuc/y6frMPMNcxlRf/Tbf
 7L58Yt/9OGHcYMlksvApFeYRwrZfs3Wge2C6xY4jS579sS7iAFbyJJAD/zAS8fhWSxYn
 Hajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760132871; x=1760737671;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3CR2CWtGpIxQ0lSsR8U+87pwlo1Y1um+ZQFcDhfvovw=;
 b=s4HbobrMemkfxoUmIFXwgJCDiS46rVAavHOgjRNglgo7wJPXYBJjGrnZVDpCiQCuvt
 z2FXdA6rn1QfeaCaY4HZxd4J9hDmgyWAzD+mFSovfba+5purfBlyaZt8NuhptzJT9bPK
 XZyoWo44s5yHjlVOpjQKVhw68dm9bFVmQZ4e1hL1Cm3c1Y9SrMNblPo4lO8/aypATdUd
 3QLxH+zp53I0JTkz2zG5NLfq6rSDEsyU2CSyz8K8TOy9o9z5c2IS95WumeLFZMxmlxIx
 WmLpgSVgm4fIONjBUBVUkWYi9tc3EXrmPdD9+NloXvH5QEia1moH+zwCHJDgolQBVdoD
 TpLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIub2h7VDnCc+Hd1T8Y2nxGRshRY2h9R5yxcmoLsj+iqerb9JvP/1C7lY2yWs0BnHYRwFmXCDEYbO2wIPXTWo=@lists.samba.org
X-Gm-Message-State: AOJu0YzR45f1/NEExzYVqF3sDjFJ7/Mwy4W2Fe5KCAJoTV+NdPf/suPv
 w+DXhe2H0Y+/H0KOPcq4ouFb+HsCCqjRnpAJA0GD1JVfmUa/KmbjZM6FNC7DwWqN98/3kr2H5gH
 yKgayYeUD7x1kPLJB/2/GqojDaPQW4Y0=
X-Gm-Gg: ASbGncsRdabpu3+kUylsb70xhmOdz+Z03z7glWVF06CiI17GN3utSzDuD+XWsB2m/OC
 COBZjSJIkrzsI1Hpnb9PsPyI1qPuiH8vWXnbDO7J8OfeEqbmRA0GFeR5xCVTZ11iHDT80TlLQKb
 jWjm3OzjuShPrBvfT2L6+D2OGOBqOVHZtMXxDDl8i6EyRwH3Ix2xJJ6uXr6+/8ysb5umk063mMp
 PfiFD0knjRp2c7eYJQnNQ+eWxsFjf0PlqmxhJzfP8tuH+WGKHMxNmPDHBsGD2wIFwmeOvGK5LaH
 isQg0iaT7T9hzUg/QHat0X8sx+h9cPdx+SLSHW1dNifpqQwqkauIiQOin2ZUtZzFaeDL8X+t8HK
 bpxet5c5nhHdXCIrYGpsng/IrbK1AzC/na74d5MpXt0Lo6+chQ+M=
X-Google-Smtp-Source: AGHT+IEKPVwEdU4o07u55ueyk8vUy2UzmXDdxkCxRSLFg22YsdbJNI49WIX6CJNsbf/SmtfBMyBAU8Q57eqBkexOrMk=
X-Received: by 2002:a05:6214:d4e:b0:879:dc43:6334 with SMTP id
 6a1803df08f44-87b2101ea49mr216502996d6.25.1760132870981; Fri, 10 Oct 2025
 14:47:50 -0700 (PDT)
MIME-Version: 1.0
References: <e8a44f5e-0f29-40ab-a6a3-74802cd970aa@web.de>
 <8f7ac740-e6a8-4c37-a0aa-e0572c87fe9e@web.de>
In-Reply-To: <8f7ac740-e6a8-4c37-a0aa-e0572c87fe9e@web.de>
Date: Fri, 10 Oct 2025 16:47:39 -0500
X-Gm-Features: AS18NWDpFATkfplY4kQV4nikbT2tj78bFi9hHJ8bS3alHy0nVzf3BOr0-aoJg40
Message-ID: <CAH2r5msRAejKX=vo7xGxMZDG_s++zZyHTazoFomd6GKOSt1XQA@mail.gmail.com>
Subject: Re: [PATCH 3/3] smb: client: Omit a variable initialisation in
 smb311_crypto_shash_allocate()
To: Markus Elfring <Markus.Elfring@web.de>
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
Cc: linux-cifs@vger.kernel.org, Shyam Prasad N <sprasad@microsoft.com>,
 Paulo Alcantara <pc@manguebit.org>, kernel-janitors@vger.kernel.org,
 samba-technical@lists.samba.org, Aurelien Aptel <aaptel@suse.com>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
 Bharath SM <bharathsm@microsoft.com>, Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Fri, Oct 10, 2025 at 1:52=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 10 Oct 2025 08:05:21 +0200
> Subject: [PATCH 3/3] smb: client: Omit a variable initialisation in smb31=
1_crypto_shash_allocate()
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>
> The local variable =E2=80=9Crc=E2=80=9D is immediately reassigned. Thus o=
mit the explicit
> initialisation at the beginning.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  fs/smb/client/smb2transport.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/smb/client/smb2transport.c b/fs/smb/client/smb2transport.=
c
> index b790f6b970a9..3f8b0509f8c8 100644
> --- a/fs/smb/client/smb2transport.c
> +++ b/fs/smb/client/smb2transport.c
> @@ -50,7 +50,7 @@ int
>  smb311_crypto_shash_allocate(struct TCP_Server_Info *server)
>  {
>         struct cifs_secmech *p =3D &server->secmech;
> -       int rc =3D 0;
> +       int rc;
>
>         rc =3D cifs_alloc_hash("hmac(sha256)", &p->hmacsha256);
>         if (rc)
> --
> 2.51.0
>
>
>


--=20
Thanks,

Steve

