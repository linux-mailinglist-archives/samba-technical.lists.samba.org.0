Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D19F71D7DC6
	for <lists+samba-technical@lfdr.de>; Mon, 18 May 2020 18:06:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=OYuvwRSQ1DfHy+hfmlFgwjoG4BdRmm3wNILT3sBrs8I=; b=g/AmwWFGKLGrC3X/7yEKSjvrnr
	4/GkjlmIs4fFrliLH9ZBQYGp8BsVw2+M8ecNOsLbPYLoXnnjAi3p9vPjKBTz9LDNQW6cqcFnJDTgX
	zita9X7MJilPbeCj2DVO1wEFY0uojTePEUlr+EWAFiSLiQmjJlQZni5KzvvBRNOPohrvYllNdsypp
	lDFgWQA8udXHV3Z5fR5Ty60J+mYgGtIt0UL869936/3tjJwvn70vhduFY/ZaMG+dZ7DPNoOu9sI5/
	TFPjhW2/a48ACb8QqvHZvGAr35wWvaQl7pBJg+JbtvgarXWmFfkZzXLDTqgly46M1ry28jEPrtTsF
	ON9kaJ/A==;
Received: from localhost ([::1]:61938 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jaiHW-004wg4-72; Mon, 18 May 2020 16:06:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58668) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jaiHQ-004wfw-GD
 for samba-technical@lists.samba.org; Mon, 18 May 2020 16:06:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=OYuvwRSQ1DfHy+hfmlFgwjoG4BdRmm3wNILT3sBrs8I=; b=TYv91Ltzp65qIqjkWkHjuI0/pa
 GAbPsKneiY6iKo24nxwDFVf4YkJ/Y1sIXqNX6GDEer4ceaVoFYUi0nbjfGgUJhkr94ZLBDUEByWhH
 DgvMmTI3EHocqVyqKE8ubGY58yG2tV+WS/NxCL9bNMoZVf0abaQydsi7cEUNfd3KF5rYxNdUxUAsn
 6RO+Tquu46PEbRRGeSpZ0NZJLRotrU7ViWMggAJ99mQvuxGqK3fIX43uu6kYazj6xQ7hpsfKiwylQ
 DL7nuQ9tzVdv4j5F1th1+Gie6SgWd8M3ergIeYtLk+BsgMwknotgmgb55eOnBQqNbB1qT/kIXcktj
 wrR2VB9iuGHy+dqfgRbfD+/E4INWC8hft7mAON0U9MidjogmUAcdviW1XB7gHmzWffso9xOViocD5
 iWu34Noum3EQBN7J5z9gig9Q94W2eqQ/+6EA2X2gyIOmmwmlZeP0OXCTkUfqPB2zMiMGR/2TbYn6i
 FuP6KGmpiiOKNsI6zKC2+/+s;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jaiHP-0003LH-FJ; Mon, 18 May 2020 16:06:15 +0000
Subject: Re: [PATCH] SMB2 Compound related chain handling when generation of
 FileId has failed
To: anubhav rakshit <anubhav.rakshit@gmail.com>
References: <CAGuNez4rgOrtf_jEX1TC-D-bjaFVRr46=WmMi5N1hdqoYBP1ig@mail.gmail.com>
 <2161e53c-ccd5-864c-8b4c-ceeb8cf120ea@samba.org>
 <CAPkcVAEg+PQC1Q5=2oXWZeM7ZvS6JJe46HpERAbxVydM2iz0oQ@mail.gmail.com>
 <d994e36b-614a-06d6-385d-8ca696b37dcd@samba.org>
 <CAPkcVAHPa7fpeDO8BoyBdYr2ekNNROD1uM+_55etG0vugMYETQ@mail.gmail.com>
Message-ID: <6133c69c-8b85-179b-0f93-380f6d43d853@samba.org>
Date: Mon, 18 May 2020 18:06:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAPkcVAHPa7fpeDO8BoyBdYr2ekNNROD1uM+_55etG0vugMYETQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="vikBJdKiRoU7kaAfYYOREq8cuvZm0WV5z"
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
--vikBJdKiRoU7kaAfYYOREq8cuvZm0WV5z
Content-Type: multipart/mixed; boundary="8kdXGI7KGMP2BRfJF3Qna6EAJvuh4K0cw"

--8kdXGI7KGMP2BRfJF3Qna6EAJvuh4K0cw
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 5/18/20 um 6:00 PM schrieb anubhav rakshit:
>=20
>=20
> On Mon, May 18, 2020 at 8:37 PM Ralph Boehme <slow@samba.org
> <mailto:slow@samba.org>> wrote:
>=20
>     Am 5/18/20 um 5:02 PM schrieb anubhav rakshit:
>     > Hi=C2=A0Ralph,
>     > I am attaching additional test case that would verify
>     > Create(RO)->Read->Write->Read->Close chain. As expected we see Wr=
ite
>     > failing with ACCESS DENIED.
>=20
>     yes, that's as expected. WHat about the read?
>=20
> Both the Reads succeed.

cool, slow: 1, metze: 0: :)))

>     Also, CI fails with the new code:
>=20
>     https://gitlab.com/samba-team/devel/samba/-/jobs/557045164
>=20
>     I have no clue to offer atm why this fails in an unrelated test. So=
rry!
>=20
> Let me triage the failure.

Thanks! Looks like the server disconnects the client for some reason.
Let me know if you need help.

We have a page dedicated to debug gitlab CI related failures that may be
helpful if the issue is only reproducible on gitlab CI:

<https://wiki.samba.org/index.php/Samba_CI_on_gitlab/Debugging_CI_failure=
s>

-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--8kdXGI7KGMP2BRfJF3Qna6EAJvuh4K0cw--

--vikBJdKiRoU7kaAfYYOREq8cuvZm0WV5z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAl7CsnYACgkQqh6bcSY5
nka1MhAAkdchXVwYP7zgYti50eprM/2B1zYI++7vuvtsKueI2KtzI8Ttu6mVfLY1
F4p9KzlVgAjYQbvMTWBhEjTfFhkGvpQd1GfhgJmv+OrTlgYswN6SCdShaWdDJx4f
nVVr9fhuyEPXO2W4oQPrS8X7iDDfQhqd+Rq/+1asRclssPx7Gwr/d0sFwWJiNGqA
5mhl0uyKto1Nm7MVi1H96oc0czta+GQtbEa9JgvHDf3sJMllBu5bf4NCP0eN1MwV
7wbN8DqgjPeoCf+ujq/u0OrErifUnWANVgA35HGVGpHtQJJltwG/iLYgX+6ZYo+v
cnWIdAkhSSFcBLUJk1hrBc5VhjM3vm4GRGQ9kIeX8khFx2yCmbE3aDrtzbwxo5Kw
ptbjCy+diQJGpmzu55bbEfdqJbfJrY4f4p2zmq2Kr+UKGXL8NzXSzNhIBYGdFAOH
SWrntdOYvZBxVZF2G/Lq7JIuZPB70wxOg3qudG/jqb2OH+gTOy+acQ94/omdgOak
kOAJ2TwEWJzmD57wadE34RcgHumTXnpxEPZdZqjYJpfienEpFw8ru3bIumYW9pxJ
Fn7YMuz1HFR6V781ZWJffhlZyiB2V3k1fxxkBLFhOFr0ilvihDcJbKyf3B5YFlTZ
hNSB3Lpnlqh9D44NVlEbi/SsIH/96I1V9j3KrDdL8r+h3MPnNaM=
=xgwy
-----END PGP SIGNATURE-----

--vikBJdKiRoU7kaAfYYOREq8cuvZm0WV5z--

