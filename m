Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF9D1D7C59
	for <lists+samba-technical@lfdr.de>; Mon, 18 May 2020 17:07:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=OEaag/0jU9K2/EWT3qCTvThjsOExY01whRGubzJj9yc=; b=Hyorptax3RapMOSmx5fly+5bBK
	yDKyrFC1jMz48kENZrCM8G1EuCg6Ovgaf+3E4SJ+S07r7lWkBvAgT65DUiRQNSViFVpVVTDpdFbX2
	KnynnbAiC9CXS6FEU7wQ5MvYWuUjpBSCKL8XT76Y2NDLc0u/uXlngrtU0EsIz5ysSUs5ZiZGnDxec
	NsNo2XAgnx+P+9qOgalHgWDha/ERwCYfTYbfjdEELl8QYb+d86QpBFdYFitYrDKeaVLO7ux5Wo9MM
	y1WATRjhpe72SkBwfZ7O0CIORb5hCJg6g7tLl8KRic+3er5j8h/Zy0azI4xybmJpwHxnQvdTX/mIc
	AKX5/OaA==;
Received: from localhost ([::1]:53740 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jahMH-004vWS-OV; Mon, 18 May 2020 15:07:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34932) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jahMB-004vW6-Tu
 for samba-technical@lists.samba.org; Mon, 18 May 2020 15:07:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=OEaag/0jU9K2/EWT3qCTvThjsOExY01whRGubzJj9yc=; b=xmDakoHTfnVK8daTBESCjr7Qve
 QDln3PlFMbBPVEayhfgsPlMaHJMK83fjTAPd2uRliC4gJfzp8f44awtqt0qHEzUhSLa4BJVH0tGIc
 44C1+uHBBrJTeJBceEpIZw1/BVyl7dypKq8bR2ah9lV7dCcgac3Gr4vx47+P4f6gw5inB/wiTJ0T2
 6ECNHb/z4Ypg01XVv6AFM8w9w+zr6KBwv+gppMf/eB+J5jAaJtcxghFSoGXZNQQbIPcZhPr6ehYuU
 fNQDmIgqwOxZpyitZl79CNpOkTKSLeJbSEOBMjwwAkgMMkQN2CRH6wM852z+b117D4fRwi3/uBJ04
 nOAbY1uPlee5UbCVzXFg18YIzF3M17HeL+UScTVdUlWiQu2kFJvaixIDQnY8HgePdQyn9LEmn+Xm5
 VX65vl7CCB21J5nC6/kmJJkM6mDhjsW0A3uDZgtTjjgaAdZXwg1AarXNhiSpy5fGOevPKvogykuo6
 yLHmJgveIk209GNTABI+5WTJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jahMB-0002is-2H; Mon, 18 May 2020 15:07:07 +0000
Subject: Re: [PATCH] SMB2 Compound related chain handling when generation of
 FileId has failed
To: anubhav rakshit <anubhav.rakshit@gmail.com>
References: <CAGuNez4rgOrtf_jEX1TC-D-bjaFVRr46=WmMi5N1hdqoYBP1ig@mail.gmail.com>
 <2161e53c-ccd5-864c-8b4c-ceeb8cf120ea@samba.org>
 <CAPkcVAEg+PQC1Q5=2oXWZeM7ZvS6JJe46HpERAbxVydM2iz0oQ@mail.gmail.com>
Message-ID: <d994e36b-614a-06d6-385d-8ca696b37dcd@samba.org>
Date: Mon, 18 May 2020 17:07:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAPkcVAEg+PQC1Q5=2oXWZeM7ZvS6JJe46HpERAbxVydM2iz0oQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="p7wZl0g23HEmDugkzEYHPdT64sOzgkxVJ"
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: hemanth.thummala@nutanix.com,
 "samba-technical@lists.samba.org \(samba-technical@lists.samba.org\)"
 <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--p7wZl0g23HEmDugkzEYHPdT64sOzgkxVJ
Content-Type: multipart/mixed; boundary="CQRQHhuNgVoOcgXh4ufsi9HuSTAqsZrMy"

--CQRQHhuNgVoOcgXh4ufsi9HuSTAqsZrMy
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 5/18/20 um 5:02 PM schrieb anubhav rakshit:
> Hi=C2=A0Ralph,
> I am attaching additional test case that would verify
> Create(RO)->Read->Write->Read->Close chain. As expected we see Write
> failing with ACCESS DENIED.

yes, that's as expected. WHat about the read?

Also, CI fails with the new code:

https://gitlab.com/samba-team/devel/samba/-/jobs/557045164

I have no clue to offer atm why this fails in an unrelated test. Sorry!

-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--CQRQHhuNgVoOcgXh4ufsi9HuSTAqsZrMy--

--p7wZl0g23HEmDugkzEYHPdT64sOzgkxVJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAl7CpJoACgkQqh6bcSY5
nkaRug//XGgXSLIrCVeMgKd1qWztioLBK2C4343HTsvgKPALFw8q1r3aQ4JvqToZ
FfvaePQHvCo1K6Z2oH4pMkfN7AoMX7k+csJP/f6tIw7TiadGXcs4nozWNUeq9H3Y
rZ/BY5ggz9GcTTQ5KvqlUexp6c0f18sR+A34YdzQHQCOOts4VQtT9PP9010eZg6P
h3iLhBxkJoBgHAry47w3Pgki92IjKJ2wl/NQ15oscidF15yjrKspshRqyggccS7e
+f8VT79yI5F3tqCRND256P1qBxr31bVkZo3m0Wt32R9/gZUpvNqIXrw/y5IWfkRz
dSfSi89TMBwEcbda2rqWSKnkq5gV1AkulzgGEPo5KbFonq9lbQfvSwwvfhZjSOFA
3a7HUbavqk0oWq/We2z4cirGkwD/m03ELPSE7XEnGZugDt00ikfswBr9VCjZ/XX1
1Q98FoMx7VHp7TlwtMZoq+GYXRixtcc6BIiq+4LqR7uMsy1ZrhqwyVzap2J8exk3
TVYZTjmXQu+Cn2KU3pXppl9pxrS1zZ/ypJZLG5J91i1suLGGd/DWFAa4M3xoV1b5
E+gbZwYCZprnEglIgVBzI3ET7JhktjuOL6Z8ElNcMbM4iYr+/KCZ/ZzbtYiZpHCE
hou4kL3V6iBWfJfG6r1PZPCYIS+EiddGXhBW5G75+RFMv6DyN0A=
=gJrJ
-----END PGP SIGNATURE-----

--p7wZl0g23HEmDugkzEYHPdT64sOzgkxVJ--

