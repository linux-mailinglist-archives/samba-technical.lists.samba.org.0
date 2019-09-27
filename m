Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E8859BFF50
	for <lists+samba-technical@lfdr.de>; Fri, 27 Sep 2019 08:44:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=BbRacnU9lvVJJ1qqejPlaWlb/jx0rjYcuO0bYczHebQ=; b=IEJKcOHu6xs+uMjMZSJu9NDLwH
	JHLuwbcxzoc9McgZvVfQGhHGXmjNZyM5OBSr5M+YWDTNK6CgKuhOt831AcRSYGgXcqga+JSjFNIrc
	6HTpZnHajq84Wgdj2sjlPT2WXjuUmbSArScTzT2IiGCVDaBYu3Or8Es8pZKzW4LRas77o+1SfE1kO
	VjYTbVwIFADvf/x/4kjHz9ejOEeH4W5c0xdoOyEZ9U0aRogJcudd2LQ+pnhD+3tAl+/UBdqkJDvHt
	Tx8ozA7g86vTfDZNgA2bWAF2dSRYtlB2vmAnsL95pHwNaJ2SByOUP7P0qiiS9XiwBgRN0WtWhTNYg
	96PEitPg==;
Received: from localhost ([::1]:35728 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iDjzM-0094S3-Rq; Fri, 27 Sep 2019 06:44:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23032) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iDjz5-0094Rw-CH
 for samba-technical@lists.samba.org; Fri, 27 Sep 2019 06:44:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=BbRacnU9lvVJJ1qqejPlaWlb/jx0rjYcuO0bYczHebQ=; b=EuzJWNGo2zeVI8tlegaQXQmIQm
 KeBvSFO2a5Ouacee5GXRBAsbl3Icpn+jJuh81TKMMKd2kVbSy0sGdPRh/p60gqy2jj18bicA7MjY1
 5Wzm95odTaeu0PKVEIYa1Bqg404zSg6KL+wngl97Z4m8XEK+dudNZfq1qIMBjOkETCho=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iDjz2-0000dh-T4; Fri, 27 Sep 2019 06:44:05 +0000
Subject: Re: Getting the SID of the user out of the PAC ...
To: Steve French <smfrench@gmail.com>,
 ronnie sahlberg <ronniesahlberg@gmail.com>,
 Pavel Shilovsky <piastryyy@gmail.com>, =?UTF-8?Q?Aur=c3=a9lien_Aptel?=
 <aaptel@suse.com>, samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
References: <CAH2r5mueOCtAsWjOc3n2OgnygSMmj22uycsvfNKPAiqhx68xsg@mail.gmail.com>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Message-ID: <461a8f64-1f29-5b30-6b2d-4f4f88812323@samba.org>
Date: Fri, 27 Sep 2019 08:43:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAH2r5mueOCtAsWjOc3n2OgnygSMmj22uycsvfNKPAiqhx68xsg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="0j1nGIgo9z9LNwjbBmi6mp5x1FDZMyjtS"
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
--0j1nGIgo9z9LNwjbBmi6mp5x1FDZMyjtS
Content-Type: multipart/mixed; boundary="GUmOFe03RQqGMz6n8bKM8FMRHg4DuVoJ1";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Steve French <smfrench@gmail.com>,
 ronnie sahlberg <ronniesahlberg@gmail.com>,
 Pavel Shilovsky <piastryyy@gmail.com>, =?UTF-8?Q?Aur=c3=a9lien_Aptel?=
 <aaptel@suse.com>, samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Message-ID: <461a8f64-1f29-5b30-6b2d-4f4f88812323@samba.org>
Subject: Re: Getting the SID of the user out of the PAC ...
References: <CAH2r5mueOCtAsWjOc3n2OgnygSMmj22uycsvfNKPAiqhx68xsg@mail.gmail.com>
In-Reply-To: <CAH2r5mueOCtAsWjOc3n2OgnygSMmj22uycsvfNKPAiqhx68xsg@mail.gmail.com>

--GUmOFe03RQqGMz6n8bKM8FMRHg4DuVoJ1
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 27.09.19 um 08:39 schrieb Steve French via samba-technical:
> Is there a way to get the SID of the user out of the MS-PAC through
> Samba utils (or winbind)?
>=20
> This would help cifs if when we upcall as we do today to get the
> kerberos ticket, we were also given the user's SID not just the ticket
> to use to send to the server during session setup.

Only if you get a service ticket for the joined client machine.

But I don't understand what a possible use case would be.

metze


--GUmOFe03RQqGMz6n8bKM8FMRHg4DuVoJ1--

--0j1nGIgo9z9LNwjbBmi6mp5x1FDZMyjtS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl2Nr6sACgkQDbX1YShp
vVadAw//RdSE2lCGB0hIoIwUDhv5yKu0B1mi2GsbehJSXR8o+jhMzDU6SfPYM14G
sd/GQT4RIIL+A8N2gulSazxI0m5KSE1FQiCH0Z9LhLnL24dEyheXwVFEMEWAeUd2
r3HBAhqPliL5+PZVo94v41eAn//9Wx2mT0sePIfnPAXEjwE8XimOkWlXzHAT7ItK
HzjYQU64XgG4Gp7TzQpF8WeKk48BeoJFU9a4dUuOmNUGLu+dpIukdmArm6YmEL0D
Lt9rqh1KUR88RIkO4RkBiljKuXP94oJMuWkYBBbvV3onqXQa1IsDUp1ga20NO0NC
2fL0EdIQdZMzUNF5K+0pW9AyR+1tdt2mIy1v5F8IpmY2el4MougUchSE8dRT9A2b
aLsxNcUqvMsz1+ogd1j1vMuVTfEirD+VHqJthq3K2sXQrp3qEvsJwR68xwEy4Ork
7ajKZ5DOGDaJ+kxP4H9k5h7+DzlPjc+W91DuD5eqzw1YAidIX2ay4g/rxNpEZYB7
NBqBZUJtLaFzcLrxPJ3RLVB/WugoZuVZt9PXk2/4BMftTBqiOF9NG5EGYl1/ZowT
UsWizy8d97OqgFTd5EGE+PxnaHe58yRg/rit1Bn2X/Bq4HoT7eFmRt/0Ji6+j5q6
CLvMTPZkvfXptgUZQVSLaYmd2gtfJA4ujiHNXZCqKsiu6LeoHRc=
=/z5p
-----END PGP SIGNATURE-----

--0j1nGIgo9z9LNwjbBmi6mp5x1FDZMyjtS--

