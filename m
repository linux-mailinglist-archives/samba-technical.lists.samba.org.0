Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 069F81325EB
	for <lists+samba-technical@lfdr.de>; Tue,  7 Jan 2020 13:18:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=JsTT0L2OHpoy44xUdd3bO9Y7nTa4DLPQVNR5W5IvV/Y=; b=hzkv0p+5GQ0ZjOyq2CDeVBd28G
	Dnl8Oe8ldF+AsEjZMtljLOEqBIsw3Mp6G7EKmrboVp8koS/KIBUk7wRsTcPKeQqd6RxX79V/vxix5
	Jx0eUIxltVZwRNOWH5Rdrtqj8sb28TjRFI2Jfo5Ee2/L0qISGjse+HKb9/Yfo8FIsiIUa9mr6d6K4
	+e83aZi+8l7fFbMvO65NfSyhjfhOVRLKlUK9F8k18kaJ8qqiy9ifNuWY8fwuB+QdTHxaStzsUnUFW
	kYoM+8ddS413ENJpSToKHlpGRJhZYq3LWlk2BsNYK3gj2+WxxsTUv8one8WOAeQRbbzNfNHL4m+9b
	z5b09YDg==;
Received: from localhost ([::1]:32224 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ionoI-002fCb-G7; Tue, 07 Jan 2020 12:18:10 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:52793) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ionoD-002fCU-1x
 for samba-technical@lists.samba.org; Tue, 07 Jan 2020 12:18:07 +0000
Received: from intern.SerNet.DE by mail.SerNet.DE with esmtps (Exim 4.92 #3)
 id 1ionoC-0004hp-Ja; Tue, 07 Jan 2020 13:18:04 +0100
Received: by intern.sernet.de
 id 1ionoC-00049r-EU; Tue, 07 Jan 2020 13:18:04 +0100
Received: from bjacke by pell.sernet.de with local (Exim 4.90_1)
 (envelope-from <bjacke@sernet.de>)
 id 1ionoC-00033y-AQ; Tue, 07 Jan 2020 13:18:04 +0100
Date: Tue, 7 Jan 2020 13:18:04 +0100
To: Rowland penny <rpenny@samba.org>
Subject: Re: [PATCH] docs-xml/winbindnssinfo: clarify interaction with
 idmap_ad etc.
Message-ID: <20200107121804.GA11511@sernet.de>
Mail-Followup-To: Rowland penny <rpenny@samba.org>,
 samba-technical@lists.samba.org
References: <20200107093340.GA7605@sernet.de>
 <ad2ab7ff-21b2-92c1-03e7-48698d133363@samba.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline
In-Reply-To: <ad2ab7ff-21b2-92c1-03e7-48698d133363@samba.org>
X-Q: Die Schriftsteller koennen nicht so schnell schreiben, wie die
 Regierungen Kriege machen; denn das Schreiben verlangt Denkarbeit. - Brecht
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
From: =?utf-8?q?Bj=C3=B6rn_JACKE_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?iso-8859-1?Q?Bj=F6rn?= JACKE <bj@SerNet.DE>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020-01-07 at 10:30 +0000 Rowland penny via samba-technical sent off:
> Domain Controller supports the Microsoft "Services for Unix" (SFU)
>=20
> instead of:
>=20
> Domain Controller does support the Microsoft "Services for Unix" (SFU)

I'm always happy to improve my English grammar skills, can you say why
"supports" is wrong here or is this just a matter of taste here?


> Make sure to consult the documentation of the idmap backend that you are
> using.
>=20
> As it only works with idmap_ad, wouldn't it be better as:
>=20
> Make sure to consult the documentation for the idmap_ad backend.

honestly I'm not entirely sure that no other idmap module can work with this
parameter also, for example idmap rfc2307. Actually if no idmap module is l=
eft
that supports this setting of winbind nss info, then the only parameter left
for this would be "template" and then we should actually remove this parame=
ter
entirely. There might however also be third-party idmap modules, which make=
 use
of this setting of "winbind nss info" and this is why I carefully chose the
words this way (for now).

Cheers
Bj=F6rn
--=20
SerNet GmbH, Bahnhofsallee 1b, 37081 G=F6ttingen
phone: 0551-370000-0, mail: kontakt@sernet.de
Gesch.F.: Dr. Johannes Loxen & Reinhild Jung
AG G=F6ttingen: HR-B 2816 - https://www.sernet.de

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRTh3WYB8ykhrzLAI8xQwafzsNCPwUCXhR2+QAKCRAxQwafzsNC
PxA0AP9B0Z46MmOXoopLdCCkF2+0XVcV/Tyh8Rv9k8wTGEKFcAEAqisVQ2lAk7zs
QTc1/lT2+Zf/KAfMtqjztveDtp7yYQk=
=y0qY
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--

