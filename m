Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D16CBB23
	for <lists+samba-technical@lfdr.de>; Fri,  4 Oct 2019 15:02:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=LopkMKTiZBDFYtGc4+72kz6MUbXjRmUGr4/dvsQg4Bg=; b=vueyOk6gqesXPNwanUQDW9Wq7X
	nUHgsqQZkC+/y9r8Qw/cjqLCFa3FiM/myQEnC0lpsmcqA+NbT1AWoZa/uT2vvBbaU7SC7ZDbijYWd
	L5y4nKSywkrF1mqcBP5SwYjN6sxusbq/00kptRRqHTRRHImvKHr4/6sexuOcWSG9j4DHogY7CIlY9
	cMZeQa7HW5wTjZewcllTEKPdDy8GzQ2J5s9cEPg0a0p47pKdhGP625tGbIKh/IgLHmKzcu/HhgS06
	4+vLpuy5JdLEPSNpEXMNoRAdHKF5310zhL0rbdDcBTlPzwAiZlcydOXGte3d7CNj+XmWis7FQjNzx
	mRZjOqTw==;
Received: from localhost ([::1]:20448 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iGNDT-0018dV-6F; Fri, 04 Oct 2019 13:01:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37144) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iGNDO-0018dA-Iz
 for samba-technical@lists.samba.org; Fri, 04 Oct 2019 13:01:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=LopkMKTiZBDFYtGc4+72kz6MUbXjRmUGr4/dvsQg4Bg=; b=NVjk7og/p0Ht93eHD7pnARqMDQ
 NcoOPv2rsL1qatSLVqdBcRGhln54OsLAGuPasPaHQQsg76Y9XsJ3LTwcdXBMypW7/+2JGrguE+5ol
 cTRi4WPQWUifytLfnCMr39l7Hs0Kbhuv0Z8UakfGuXKoYN0QZM/uc+6TcFErOmnQFoPs=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iGNDN-0000FE-Me; Fri, 04 Oct 2019 13:01:45 +0000
To: Samuel Cabrero <scabrero@samba.org>
References: <20191002154202.upjxr3pqii47wt3a@aneto>
 <b2536fb0-4ae2-ee41-e5b8-bed143aae9d2@samba.org>
 <20191003163758.xsetow666fudtkxc@aneto>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Subject: Re: About adding a new 'winbind:allow domains' parameter
Message-ID: <a351e37d-2214-a575-d68a-e26d6ae62bea@samba.org>
Date: Fri, 4 Oct 2019 15:01:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191003163758.xsetow666fudtkxc@aneto>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="PTHrbwhWMhBje6NwGiifs4iVFVDoxTJ6K"
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
Cc: asn@samba.org, samba-technical@lists.samba.org,
 Samuel Cabrero <scabrero@suse.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PTHrbwhWMhBje6NwGiifs4iVFVDoxTJ6K
Content-Type: multipart/mixed; boundary="w9gLJmEdEC0HSEQ8iAHZ4HfoBNpmEvlzW";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Samuel Cabrero <scabrero@samba.org>
Cc: asn@samba.org, samba-technical@lists.samba.org,
 Samuel Cabrero <scabrero@suse.de>
Message-ID: <a351e37d-2214-a575-d68a-e26d6ae62bea@samba.org>
Subject: Re: About adding a new 'winbind:allow domains' parameter
References: <20191002154202.upjxr3pqii47wt3a@aneto>
 <b2536fb0-4ae2-ee41-e5b8-bed143aae9d2@samba.org>
 <20191003163758.xsetow666fudtkxc@aneto>
In-Reply-To: <20191003163758.xsetow666fudtkxc@aneto>

--w9gLJmEdEC0HSEQ8iAHZ4HfoBNpmEvlzW
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Samuel,

> On Wed, Oct 02, 2019 at 05:57:52PM +0200, Stefan Metzmacher via samba-t=
echnical wrote:
>> What is the reason have just a manual specified subset of the trusted
>> domains?
>>
>> I'd actually like to get rid of all this hacks and just trust our dc.
>=20
> Because some users are currently using the documented parameter
> 'winbind:ignore domains', and when new domains are added to AD they hav=
e
> to be added to this setting too. It is just a usability improvement.
>=20
> But let me ask, why the 'ignore domains' option exists in first place?
> The documentation says it "can avoid the overhead of resources from
> attempting to login to DCs that should not be communicated with" but
> from your reply I am not sure if this is still a valid assertion.

I hope most of it is gone with "winbind scan trusted domains =3D no" and
the new "winbind use krb5 enterprise principals =3D yes".

I also think the "untrust" part of "... list of trusted domains winbind
should ignore (untrust)..." is not really true anymore (or never was).

What is the idmap configuration?

metze


--w9gLJmEdEC0HSEQ8iAHZ4HfoBNpmEvlzW--

--PTHrbwhWMhBje6NwGiifs4iVFVDoxTJ6K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl2XQrIACgkQDbX1YShp
vVY93xAArH42BeQ+LIxtA4xhkwSFJV/QZtMJ+eNH9wb3XURO7fXRlXoJDtHJLXVj
LOXVSbMLJ/q03hiKwHLfPPt7AkOZk6EWNHdVVSIxKuv33NOp1tbCYK9hJpoYVsja
xkkWpbqN1470gXIzg1G+ANg8unE0bPk2CjWG6Q8e/CW0PXBw9ACMriOxvW6JNf4u
XoL0+8YACiG4WYytrFWo+CeCWxIFtZyCeno1cMkYIU9Ui3snE8c9zryLTmc/j/Qg
uZFAWgVXIUaWuU/FDciVTRRgMYdC2Lm6j+1bFXlsnn8HREIsoX//VfdZnpOzYJDk
tJlUDpx2yfGlRCOvGeZugNT4daH8QLirztMqsYNH363du8wrxLhyDXEfRvseqAdJ
YZOc8pRb0XmFpq9UQ+u/ZTjw+lGLu0CEB6fLK6AbsP1wt4zVmccodi9OCidpyYTw
7ekNXQvD0oNQ+4/0B+IDNZpgbp29F0Cb6DjaAICBlmESsh4h+zdNhW7PruYIeLAZ
trCjzx40N5YJjOo9CX7OMzRJ+A8Ff/KjwKzUJksG7QA0fpp3tahfPgsnsQPj/lXm
3XqQfHe15p21B2Ko/jVCv1H3fNgDqmyeH8g50pmjSB7fESPu29lVTBaeBzVGi2s8
4pMGIu7nQ2oW2vrD38+7IOzbpOpKMxD31XSUOiJjtR4Cx5f3zqs=
=6mhT
-----END PGP SIGNATURE-----

--PTHrbwhWMhBje6NwGiifs4iVFVDoxTJ6K--

