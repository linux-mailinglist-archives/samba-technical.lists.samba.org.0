Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A801B3B6669
	for <lists+samba-technical@lfdr.de>; Mon, 28 Jun 2021 18:07:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=vllJIejJhrmeZARGU3bg88i1VfOiRHYnGqKctRzOnIE=; b=k+eVlNAJ2+U2NHUy/Jozo2Ukh5
	F+5dsC4dukHH0W9w4B5QlJTGV+ue69oP2hjNbAkzJGSnKqY3pBF1xnLTASCvkC3SXUWsbYByscGNr
	z1PybIfCy4spDYyyLKvsojblxV2v6JwEqpGINuuwc9mEZAM5aBbgQ9rfuI69Xv9kb5DTJvmIomf3G
	cw5VxJ6SYMG6rqekNudfAsC9v1hQjP9DNqhl3+XmoDwhgU2ODFmuV83ywf2raNq9R+qagyyHI7znk
	+/qCsGtPU1szCkpsYshNG8iL4VvBgfp8fZ8ye7KeJnIlTJvbFcOcb1RbnvcUQBCXEfEyGGKAG1Nl+
	BTapxjiQ==;
Received: from ip6-localhost ([::1]:65332 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lxtlu-008lOH-Hn; Mon, 28 Jun 2021 16:06:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28098) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lxtlp-008lO8-6M
 for samba-technical@lists.samba.org; Mon, 28 Jun 2021 16:06:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=vllJIejJhrmeZARGU3bg88i1VfOiRHYnGqKctRzOnIE=; b=wpqeRGP1uGA3MbC7nbGoYywggg
 IPXGK94nAe8xqfV4mYj6IHdJbjpiZtcGRLgGa4uVMYsy5ds7lLhFnYpR6abqkeO9k6UMYKndM79Lu
 iwcoJv6ABCkUztKNwYEe62u4kJkb7N+JJeZmMJJas0zXN5ZjUor+b0QP2ytAqobs7tFM0x6vlr97T
 IcYxBvhhZBHDgD3spyPGnuRzrmONJkQVjrhE1FZDxA47+IR5trWrTof9JRaHiZ/0sUaWkiwQMRBWa
 +YRLNOMhGERDLYmcWZYewAqR+j7OlwObiOMYcA75SaojF5Ispk4uoOxMMSM+B4f/iG7GG5wMDbcam
 whsX1cyF8XUng7Hb5ZbOiDQxCM7thqoaA4ZlPMydDgZOQfbPqhHLqx6Ql4k29mYX4sAUQgQ1cBZdH
 Wa79wFxoh7z4tpKFDFP32yBGvnsm8fWVZ5F0Cq/ErsTnSlu7yhq9mssbEAhcLitQ9W1/lu06SVaQ7
 QAZRp2IMF4kl8GPUcOTD1FM+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lxtln-0003y5-Rr; Mon, 28 Jun 2021 16:05:59 +0000
To: Steve French <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 COMMON INTERNET FILE SYSTEM SERVER <linux-cifsd-devel@lists.sourceforge.net>
References: <CAH2r5mubZZjJcSxLvkAZNU-AFWe6+w51m5KQ5xjNAE4_xG2Xow@mail.gmail.com>
Subject: Re: [PATCH][SMB3.1.1] client support for signing negotiate context
Message-ID: <1e313824-28a3-c2de-8281-2a3ee0d0cfa9@samba.org>
Date: Mon, 28 Jun 2021 18:05:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAH2r5mubZZjJcSxLvkAZNU-AFWe6+w51m5KQ5xjNAE4_xG2Xow@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="3JxbtoexIzANVyj86cVLguNyDQIVToRPF"
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3JxbtoexIzANVyj86cVLguNyDQIVToRPF
Content-Type: multipart/mixed; boundary="DyEWaKQZtzgSMTcy7Z7EOYK2yUfiEQ149";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Steve French <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 COMMON INTERNET FILE SYSTEM SERVER <linux-cifsd-devel@lists.sourceforge.net>
Message-ID: <1e313824-28a3-c2de-8281-2a3ee0d0cfa9@samba.org>
Subject: Re: [PATCH][SMB3.1.1] client support for signing negotiate context
References: <CAH2r5mubZZjJcSxLvkAZNU-AFWe6+w51m5KQ5xjNAE4_xG2Xow@mail.gmail.com>
In-Reply-To: <CAH2r5mubZZjJcSxLvkAZNU-AFWe6+w51m5KQ5xjNAE4_xG2Xow@mail.gmail.com>

--DyEWaKQZtzgSMTcy7Z7EOYK2yUfiEQ149
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


Am 27.06.21 um 23:03 schrieb Steve French via samba-technical:
> Here is a WIP patch for negotiating optional signing negotiate context
> (which will allow negotiating faster GMAC packet signing if server
> supports it).  This patch handles enabling requesting it during
> negotiate protocol  (set module parm "enable_GMAC_signing" to 1) and
> parsing the negotiate protocol response.

Please drop the GMAC part and negotiate CMAC and HMAC-SHA256 for now.

The GMAC signing has a bug with Cancel PDUs in Windows 2022
(client and server use a different nonce, the client uses the MID of the =
original request, while sending a MID=3D0 on the wire,
then server uses MID=3D0 for the nonce and returns ACCESS_DENIED).

metze


--DyEWaKQZtzgSMTcy7Z7EOYK2yUfiEQ149--

--3JxbtoexIzANVyj86cVLguNyDQIVToRPF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAmDZ82EACgkQDbX1YShp
vVY9AQ/+KfdeTJSm8e0LJLgwkp3tPUPzUJKYvfy3BhQFsa5XCZbIh+QGYCJ/3AZ+
vgCMOhnb01TdVFX6xgpoWwhxHYb/dGykq506HV8/sWVNKLFJnjtmlFVZtB8DqQ5u
xGEfBNwxTU4v414ttwb55ZtUgftnn06Uf2dzf0nlGks9oh8pV2x2JlD/mWpjoQl+
e2DN9P3RQLQ8JvfUcfKeTnc/VdxuC6mz1HRcCOSQ9Ah0DEXVt/Nf+jRvpjwr9ZxJ
HBvj9etzpxg0ZHK6sOedkAEnn1tj8q9VETfrNmwq6ApngKEW/vmdT/WfDni2XFtC
i0McN6VY4W6yAuFTFyT9QgY6pgG6T5SKufM+hzrixg+daLpaYRUcxjBx91GO3DKG
fP2cZ5pW4dcBNRbxqTVqFMBL31y1cHSbjhv2SLGlk4ofyckFm/p+8aTfG+AstHmU
a6X5xUvVVxfDAtMeWq5EVa5AJC2kCinqyEgMhfH++ZIf1gWIFN2Plh3NxJd6sqCK
LsIet0TXJJkkMxPOF0OlELrT7kDuroZvrIMxYz/LGy9Uck8wjBU4xMTXblwxlp75
bJh8gBcbfW0jaKTvmQKmAmRxK7qz/WEz6lqykPS4k3NirP+bFC49kb42dqzx0MFd
k815cyldLK9I2B6c+8arS/jOPJ1ARi6+AWUJfWWmlnu51RdtKkM=
=6cl7
-----END PGP SIGNATURE-----

--3JxbtoexIzANVyj86cVLguNyDQIVToRPF--

