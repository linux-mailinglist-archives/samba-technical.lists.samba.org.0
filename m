Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A004295C8
	for <lists+samba-technical@lfdr.de>; Fri, 24 May 2019 12:28:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=UXjT5hwfRWXTTcyvR2mtEFjR3zOgWXAInkRdvNYt8TE=; b=SF29nh6jgE1Yd46BriDjpFqgJY
	cGOhW6BOpP2vJKzUJ95RwujrcdQE8FrueR6/KOWHPLKGgLkhIN9lr3SgU1LMj0UVWAsvrF8BaOl+M
	AFO14GhIN71X1ezAWlaFzF3BvpnXG0NOb0GGfilmIMU5+rzSZ29cCT0Zn6NoZ3jWiles/rmnWclM3
	7go5J6Xto5PL5YTRtaHV0bn1uzb2BUi5bilzGvboWfO/01IfwIs92JL8t67rugQz33cfm60f60o/B
	34xk8g9qDi6lc8ZZLKG1mQzfLc4H5qLBmuZjuw22WmAQPO/I1ypgD60WMOHYwksSWxLRW1dChAxWL
	McfiW7Lw==;
Received: from localhost ([::1]:46434 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hU7QM-001Z4m-4D; Fri, 24 May 2019 10:27:42 +0000
Received: from [2a01:4f8:192:486::147:1] (port=21956 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hU7QI-001Z4O-1u
 for samba-technical@lists.samba.org; Fri, 24 May 2019 10:27:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=UXjT5hwfRWXTTcyvR2mtEFjR3zOgWXAInkRdvNYt8TE=; b=QsKKw8tAG1vN3Y/jZ+iMK7l42o
 BykQnpO1Gb1ku6FYkYM3CPev6jhu1pJYHvPU0xOqcVIBEbDi80aotSafs91/OoPFaTOKQpzKGI8h8
 zBVm8hDn2HqWmbp5zsMQLkWGyQB1pfMV4q1vT8p36u1/puglrC6mNLsxeutCCLiUDpOc=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hU7QB-0000Y9-7l; Fri, 24 May 2019 10:27:31 +0000
To: Tom Talpey <ttalpey@microsoft.com>, Jeremy Allison <jra@samba.org>,
 Steve French <smfrench@gmail.com>
References: <CAH2r5mvEYMEUjz8BDRUumn0yGq__VntNKx-8AzWcZgCDOJQv-Q@mail.gmail.com>
 <20190418172353.GB236057@jra4>
 <BN8PR21MB11863B736AA5D284CC213118A0220@BN8PR21MB1186.namprd21.prod.outlook.com>
 <CY4PR21MB0149DC81B079BCD36D580AC5A0350@CY4PR21MB0149.namprd21.prod.outlook.com>
 <4591362b-cb4e-7e22-00a6-bf7239584957@samba.org>
 <CY4PR21MB014907F825DED7F5057E69E2A0010@CY4PR21MB0149.namprd21.prod.outlook.com>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Subject: Re: [PATCH][SMB3] Add missing defines for new negotiate contexts
Message-ID: <edd1ac0f-abe3-58b2-09c1-736d45c3ff31@samba.org>
Date: Fri, 24 May 2019 12:27:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CY4PR21MB014907F825DED7F5057E69E2A0010@CY4PR21MB0149.namprd21.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="bobSvmW4MotmI6nHposFC5KSlmO3PsJC8"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bobSvmW4MotmI6nHposFC5KSlmO3PsJC8
Content-Type: multipart/mixed; boundary="gCHM7wOOnv9lomLEadGK8Nu7KFkrbDwjo";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Tom Talpey <ttalpey@microsoft.com>, Jeremy Allison <jra@samba.org>,
 Steve French <smfrench@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Message-ID: <edd1ac0f-abe3-58b2-09c1-736d45c3ff31@samba.org>
Subject: Re: [PATCH][SMB3] Add missing defines for new negotiate contexts
References: <CAH2r5mvEYMEUjz8BDRUumn0yGq__VntNKx-8AzWcZgCDOJQv-Q@mail.gmail.com>
 <20190418172353.GB236057@jra4>
 <BN8PR21MB11863B736AA5D284CC213118A0220@BN8PR21MB1186.namprd21.prod.outlook.com>
 <CY4PR21MB0149DC81B079BCD36D580AC5A0350@CY4PR21MB0149.namprd21.prod.outlook.com>
 <4591362b-cb4e-7e22-00a6-bf7239584957@samba.org>
 <CY4PR21MB014907F825DED7F5057E69E2A0010@CY4PR21MB0149.namprd21.prod.outlook.com>
In-Reply-To: <CY4PR21MB014907F825DED7F5057E69E2A0010@CY4PR21MB0149.namprd21.prod.outlook.com>

--gCHM7wOOnv9lomLEadGK8Nu7KFkrbDwjo
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Tom,

> It's an advisory payload, and can be used to direct the connection appr=
opriately
> by load balancers, servers hosting multiple names, and the like. It's b=
asically the
> same servername that will be presented later in SMB2_TREE_CONNECT, only=
 it's
> available early, prior to any SMB3 processing. Other possible uses are =
for logging
> and diagnosis.

Ok, I think it should be explicitly stated, otherwise it's a bit
confusing, if it's completely missing from 3.3.5.4 Receiving an SMB2
NEGOTIATE Request.

> It has no actual function in the SMB3 protocol, so apart from defining =
the payload
> it's not a matter for the MS-SMB2 document. We would hope, however, tha=
t clients
> will include the context when sending SMB2_NEGOTIATE.

This might be an information leak if client or server require
encryption, as the unc in the tree connect is encrypted and the
negotiate value isn't. On the other side it's likely that the target
principal name is already visible in a kerberos ticket or the
NTLMSSP MsvAvTargetName.

metze


--gCHM7wOOnv9lomLEadGK8Nu7KFkrbDwjo--

--bobSvmW4MotmI6nHposFC5KSlmO3PsJC8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAlznxw4ACgkQDbX1YShp
vVa4FA/9HORQ7XXubah4jCH1aUMdwKiNpIuMCkV8jnZBzNI8QXMZ5adEKlatNeE6
SIw/wtTQTrfqzracloIXnSuv1l65x7IqjklspJ9pqjs8Ll1ZSRiVpcM/ebAvdYcK
0Vx/wl9XIYWtebaq3pPoaQnRZwjggypNj2o6DgOH2w+GnZt43jl0kfvZ/ClNGwpP
fL4oXRJbZi8YSKq63UXz0ePiitY9uU7i+Wx2OgXi/T4Oa7uPWFPjMWWGKgOajhKE
3/kRhyo2iOWZ0pxWSCUJexYmC7vFHxwgmP7DvFiMr/qVYogNN3YxdyYeAL9fe+vv
OlvHg6d6NrZzYfzvPq5GEweFmQ+gdSjF1b4r7fmnsuJ8SeVPp4cO9p8qsGW9hX2d
5xjUa5gY/SqVzPnV9lIc/YCnMaGWkhYVamxB9es3aBB4VT0WKblwCZ9ZZg94bUWk
vRd3gsUDq70Zy0/arVc+JMhjGoKaE4oENxWYxRpqV0l+y3nTV5t6/2i2JUAKSX1a
l32amNg+1cDEnBgRX5udVl3LWlw/Llq3CUK/sG3JvMyF+TE3zMWNTVu1mVZYREnf
PAT77z5Edx10I6KQClNfHV2joWS8KCzQWSbwTZwhGPxE4sQWmgifHKFz3PY+N0DF
nxycYiqhAWLvdKm27MfV53MwyZzFJuFHspo4b8POn4qjO7Io/m4=
=UrKO
-----END PGP SIGNATURE-----

--bobSvmW4MotmI6nHposFC5KSlmO3PsJC8--

