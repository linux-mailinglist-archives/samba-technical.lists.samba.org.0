Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A92C8D7C
	for <lists+samba-technical@lfdr.de>; Wed,  2 Oct 2019 17:58:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=eTqNtVHiqQXDAt6EdSMQrpwuN5DWK1KrWf9SAAyS1LM=; b=MlRreYRZUod1TdLA7RfO1UQkr/
	+G5vijDoif85I35mGeGAqs/bFFmo8+qsnsD36JH8v3B0f80lkRo++j7Y4Hzmsz9b9WX2Z7B7KJ3Fg
	aYwiCDptFMIv+SbsBynLZjwbZuXRX6cLfDGaEVVRHrSNBTMI6ZZu00AC8TJpohO5svEldvhbUiBZv
	cvI0l9FlrpgwR/BK5sJtQdVXRfXbsscJtm0VLHp/qH2Dp/XemgV++eBFLWpd6Qnfmq106ObQCBkd1
	r1pZ+rfBap/RZ29sjTWX9Blprdcv9K/DQp/rf/EMAETgEFq50Oi2nvr8aLgpVJwQuig1whLC3GHhK
	mJushN3g==;
Received: from localhost ([::1]:27122 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iFh0r-000UBM-Tk; Wed, 02 Oct 2019 15:58:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58852) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iFh0o-000UBF-Iu
 for samba-technical@lists.samba.org; Wed, 02 Oct 2019 15:58:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=eTqNtVHiqQXDAt6EdSMQrpwuN5DWK1KrWf9SAAyS1LM=; b=Xvy0lQIk/ZJlVMC2cP85BG3ToE
 bB4yYbLN8LdPY+uvWMYGFA/DN/LutATh1vMnmSzcVXqN5YzM6pomRwqP/5EPfFonHejNuEEURQm+8
 bA3NABjNIcQl8A4P2xQKpniDuTL1wmm3as3jIZtqIGtm4q7V9CiTXM7BTq91uKaylsYc=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iFh0n-00075i-LQ; Wed, 02 Oct 2019 15:57:57 +0000
To: Samuel Cabrero <scabrero@suse.de>, samba-technical@lists.samba.org
References: <20191002154202.upjxr3pqii47wt3a@aneto>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Subject: Re: About adding a new 'winbind:allow domains' parameter
Message-ID: <b2536fb0-4ae2-ee41-e5b8-bed143aae9d2@samba.org>
Date: Wed, 2 Oct 2019 17:57:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191002154202.upjxr3pqii47wt3a@aneto>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="907YbbnEyKMRvuJhxXme8JryFQQIkFC4b"
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
Cc: asn@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--907YbbnEyKMRvuJhxXme8JryFQQIkFC4b
Content-Type: multipart/mixed; boundary="LOU06rYusJGWDVFGYQVgCg71v6LXNUWNx";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Samuel Cabrero <scabrero@suse.de>, samba-technical@lists.samba.org
Cc: asn@samba.org
Message-ID: <b2536fb0-4ae2-ee41-e5b8-bed143aae9d2@samba.org>
Subject: Re: About adding a new 'winbind:allow domains' parameter
References: <20191002154202.upjxr3pqii47wt3a@aneto>
In-Reply-To: <20191002154202.upjxr3pqii47wt3a@aneto>

--LOU06rYusJGWDVFGYQVgCg71v6LXNUWNx
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Samuel,

> I would like to ask your opinion about adding a new 'winbind:allow doma=
ins'
> parameter to ignore all trusted domains except the ones specified,
> taking precedence over the existing 'winbind:ignore domains'.
>=20
> The use case is to avoid having to edit the smb.conf file everytime a
> new domain or trust relationship is added to Active Directory.
>=20
> Do you foresee any undesired side-effects or problems by adding it?

What is the reason have just a manual specified subset of the trusted
domains?

I'd actually like to get rid of all this hacks and just trust our dc.

metze




--LOU06rYusJGWDVFGYQVgCg71v6LXNUWNx--

--907YbbnEyKMRvuJhxXme8JryFQQIkFC4b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl2UyQAACgkQDbX1YShp
vVajFxAAqUCxKDUZJzKalti38+fAWROOmeFMTrXrR+dQyu6XCpQpIaQ9QHH3Oc2W
VURSl3DaZAmLhma3FUv1HzJZ9yilRkWjh2ZK3/0ayWdmht4QbKiTdyemBXIVqAEX
oHcuAduRYs/sWTv2sLHS+RcY8MXdEc2Q8xYMKKdligqgevfbS+YWvlO/joTpW+WN
eVtlSvyeLD4asRzDPMyJJN8LLu9OouzyQVMonDdD5JdjUoGYpeiUxZSgovOwAfhQ
wAduJvw8bgVm5GLu9Dyb1QlfzvwEoI6yToBX32E3wPYmUMnX55hiHWqFzySWwC+8
5J+uktT9XREC7rlpBoAZOG37/hAb5ZZETYpfENjYs0w766r2taK47s41M5M9PXNw
vKAC9sOU6zqCTuM5Ck3EtemBD/RsciOf3PuGusOnnqItI4nLQGbqJ3yJxUW+dTAX
mPRDx+eDthzGOOTfdxg/unMVPxMcqIQ/uEBF2+34kjwInQAN+hx7Zzue0upWG1FH
LE53XBDeY2qBeXGgkzQ1DRCoTn4pkEuR6YdwgcLQp32hRIaab0Adz+sG2NaLIHQo
CDsuBv2o3ZDClqR0pE97iwdXOY8BN3xE3CCGcgU3Xqzv2KqesInoj4u06pRQMBbj
rQ4Yk+tsxFVc54SFIejiq8HvKkA20CGObBm/CBDCqmdxQvu5MCc=
=+bEJ
-----END PGP SIGNATURE-----

--907YbbnEyKMRvuJhxXme8JryFQQIkFC4b--

