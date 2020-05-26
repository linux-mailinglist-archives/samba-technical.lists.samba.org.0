Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B3E1E24EE
	for <lists+samba-technical@lfdr.de>; Tue, 26 May 2020 17:06:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=jsZj6lzY2WYBJyHeWnKFfDUD4qYsOFYY5EPoaFlxroo=; b=l8wiM7z7qy6+HxcOYsPceShniv
	rAkGWzT0OlSWvvwzSVr51k+VwQJGrFzLDXjn/DA4RuOm8DwKNckFrDwoJ9fgg+7iYreNDl4j8VZSD
	Rf5vGpngsNxHq4WuM7puN7EZF9vE/WpE9YbvbXUUG3UYSeo951dsiES+LWcUVs8HwvSnkBsnc4D3V
	ALGAwiTK6H1F6nSw6rDSZexij/hhnRvrjd6xG5+9XalNtOK5yDMYF4xjR6w1LOI7LDXO9yhgnccld
	cFkrajLNRGl6IOf6XDx/olw09+ViQbc4VsxfTW68cccbkTSS5kLNr9Tjr+LLjLTKAVuHJrfYlaCT1
	qdvRSiBg==;
Received: from localhost ([::1]:20514 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jdbA2-005xol-TK; Tue, 26 May 2020 15:06:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42110) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jdb9x-005xoe-OV
 for samba-technical@lists.samba.org; Tue, 26 May 2020 15:06:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=jsZj6lzY2WYBJyHeWnKFfDUD4qYsOFYY5EPoaFlxroo=; b=ccst2j7oRfrJsI8Gj4GmS6PGZ0
 9hYPR1+/O1gdUqYF/1idCJJ1Bngygmt1n23L2k4kNx1jTVuHV9lixusInV7MOUzIrleKOuPonLPUo
 de80XAzSLRVNoFNyIOuil6PWDLY7lMwMnpcOtjr/B0CCFoD+f+P1gsMUhnRR1QYuaEvPMTXJJqzwe
 P2FS6JV3n8a+wPakm+seakIUTZ5HABddKSACzB/wTixVrIo0wvEnx1HIJ/qsEDDXVpqCc6P08/6Oq
 PbzndBnCnjPnmq+4Dx4d78/F43eQMPPLMCxr9xUDifTWzmuEMlol8AFP7B7IVZWwj4mZYWdvkDiiP
 d9QtYaQugUQrwMWlRHuy/FVzvJUS3zTtDPV0SawG1MdXi3RkESB0dshw9ec9T0HC/D4HnPt2DxTFK
 G9sh7W3le+wZIUKZR1yXdTT0kC4PFLSEIO5QF7wy7abtd/0R/uSJBbzbJVIH9RKqi6SRnP8xyReFU
 e2Ksl0sTC8CUBbUew+NunvnU;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jdb9w-0004T5-IA; Tue, 26 May 2020 15:06:28 +0000
Subject: Re: New Contribute page on the wiki
To: David Mulder <dmulder@suse.com>,
 samba-technical <samba-technical@lists.samba.org>
References: <8b444948-cef4-74d8-a455-958446832aaa@suse.com>
Message-ID: <a79e4bd9-d45c-3c9a-05be-36b91abe7ad7@samba.org>
Date: Tue, 26 May 2020 17:06:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <8b444948-cef4-74d8-a455-958446832aaa@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="QM1VKpGGDSLaBYRFmt0yRI1oEm0DZB3Rp"
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--QM1VKpGGDSLaBYRFmt0yRI1oEm0DZB3Rp
Content-Type: multipart/mixed; boundary="4tItAVKXSeib9h4ujMWOjtto7jYQIOtJ3"

--4tItAVKXSeib9h4ujMWOjtto7jYQIOtJ3
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi David,

Am 5/26/20 um 4:13 PM schrieb David Mulder via samba-technical:
> We've started hashing out a new Contribute page for the samba wiki.
> You can view it here: https://wiki.samba.org/index.php/Contribute_New
>=20
> The old Contribute page doesn't match the current process, so it seemed=

> writing a new page from scratch was in order.
>=20
> I want to start a discussion here so we can hopefully improve the page.=

> Please comment and also contribute to the Contribute page!

this looks great! Thanks!

I haven't looked in detail, I guess that has to wait til I finished my
slides... :)

-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--4tItAVKXSeib9h4ujMWOjtto7jYQIOtJ3--

--QM1VKpGGDSLaBYRFmt0yRI1oEm0DZB3Rp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAl7NMHMACgkQqh6bcSY5
nkYIqg//erTi/blFHqVeUNrsLIT2t6XOcwihHlqNfZbGuUUnizmPbtG1ISV9tnM1
68jE39WCiwaOIz1QKS2jHi9awI1nN7MFtNIwHA6ITRmxLo/Om16Cx7eQ4BoHuHP1
PAfdNaGxdZugAPwRaVzGfspcEKB6fDP3wMP8QRexAN8HeU5GSw3fA74FJuouZpP3
swMCGEJi8F4RmteC2iLjiTCOyZBi6EosqZV8ageq+tGUySdlGyZzcxQ6TwwB3MtT
b9fm4jp/VMi2UtVZmy48bDX1XH7fWqsf9YagdxSwgkdZWREwmc+t43M+aj/XWVyR
wG+vWZfcNaziydDdrtO01UvVWvveA8x05D1Kg3ruWdDL5+Ik+2ckCVEExEy1cYMa
hmVqRGpmVUT//FheCUHEFjGVLWUby3czSiy61PaYwGFhX2KNJUhD510MsRmDQe/X
4mf3FopfBVEwPWUSddNzrCEVRjiPlI1U03a6KbUvAZpyZdXw3fFoSA/EZ7nqv3iG
Oerl4r4Jw28lAdR0dyAipBB3t7eDGa8NhfCRQelmQYWEGjSapO+EaQFJXbGQPReU
qD+m1dsVhnA1T/BKDS5OEdLuHwxKIusyAzT88qFnlp+YEXKQ/d8R299THQAP2K43
+EAYluBnytLdtH+ZVkEcRqEf8P7fSjo1TKNMEXRnjBkfxSRgCoA=
=zADh
-----END PGP SIGNATURE-----

--QM1VKpGGDSLaBYRFmt0yRI1oEm0DZB3Rp--

