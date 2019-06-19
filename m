Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1C64B77D
	for <lists+samba-technical@lfdr.de>; Wed, 19 Jun 2019 13:54:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=oyMCDI+Bp9nVda6ToJje/LIBx2Rsu2dyWFugRFypoCs=; b=pYgTuaKRA7vq2rg7yC2pByYd5w
	pOv6TFGB6QkVvnbhghuGi/UpPrz9DK0Ghj61UKD+9EM0eYrp9JPsNtLqJ/tO5Vn1BH35kN5VzwZvw
	fBLVBPZgk3RnPU9ZqsUbxzOe4d6Y7tIr+E3Sxi57kjHdv9JXdJ9Y0G5zzLKkYAB56fuiDkyhrvLlv
	L/WXp4hC/26ITW0UApVnLN5vg6b66WG9HiLUEBTmFswC16V8+U9Ik4uWeL+4rppShLf2rJlFXNgxR
	ZKqGMWAvwdsdAKszP1/Z88fhEMqSRnF6UegV7wzY5HJ0/BW7OWNMyHz9fKQZSKgRbX7cIl0twgVqt
	qNNvkdGQ==;
Received: from localhost ([::1]:50464 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hdZAk-000LB4-JD; Wed, 19 Jun 2019 11:54:38 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:42183) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hdZAg-000LAx-3P
 for samba-technical@lists.samba.org; Wed, 19 Jun 2019 11:54:36 +0000
Received: from intern.SerNet.DE by mail.SerNet.DE with esmtps (Exim 4.92 #3)
 for samba-technical@lists.samba.org
 id 1hdZAf-0007Qq-Lf; Wed, 19 Jun 2019 13:54:33 +0200
Received: by intern.sernet.de
 id 1hdZAf-0005T8-If; Wed, 19 Jun 2019 13:54:33 +0200
Received: from bjacke by pell.sernet.de with local (Exim 4.90_1)
 (envelope-from <bjacke@sernet.de>) id 1hdZAf-0003bx-DB
 for samba-technical@lists.samba.org; Wed, 19 Jun 2019 13:54:33 +0200
Date: Wed, 19 Jun 2019 13:54:33 +0200
To: samba-technical@lists.samba.org
Subject: Re: RFC: deprecate allocation roundup size
Message-ID: <20190619115433.GB9207@sernet.de>
Mail-Followup-To: samba-technical@lists.samba.org
References: <20190618144358.GA6800@sernet.de> <20190619113121.GA9207@sernet.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZmUaFz6apKcXQszQ"
Content-Disposition: inline
In-Reply-To: <20190619113121.GA9207@sernet.de>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--ZmUaFz6apKcXQszQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019-06-19 at 13:31 +0200 Bj=F6rn JACKE via samba-technical sent off:
> On 2019-06-18 at 16:43 +0200 Bj=F6rn JACKE via samba-technical sent off:
> > As this performance trick is not needed for modern SMB clients any more=
, it
> > might also be be better idea to just reset the value of "allocation rou=
ndup
> > size" to 4k again, deprecate the option and remove it with one of the n=
ext
> > releases completely to behave more windows standard conforming and to j=
ust cut
> > off this source of irritation.
>=20
> thanks for your feedback on this.
>=20
> Attached is a small patch set, which changes the default to 0 now, docume=
nts
> that and finally deprecates the parameter.

ah, I missed source3 also, will add that also and submit it as a merge requ=
est
then.

Bj=F6rn

--ZmUaFz6apKcXQszQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRTh3WYB8ykhrzLAI8xQwafzsNCPwUCXQoidwAKCRAxQwafzsNC
P/v2AP4s8N5mhQAF/gmHcSfIQhIr8sqrbSVy/jhX036SZHf2MwEAs7Dtgg0kt2Qb
S5yvHqIDOpli/9Hhz1jx0oACoYPWywg=
=+Chs
-----END PGP SIGNATURE-----

--ZmUaFz6apKcXQszQ--

