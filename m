Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE1C8410E0
	for <lists+samba-technical@lfdr.de>; Mon, 29 Jan 2024 18:38:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=cj2pRN3nRNLmx4Fiy+evZ9AcI9p/3OOEd7dXw42xKEQ=; b=eVQxGNRGnSA6aD4lUDkoUxHi+q
	ieGO9kJ4+vYoWUqGhR5Gn9fkU7X7LXNbOKbSkv8rEzdtjPJItL5wHVqxgfTOOcYYpAteanVfpiLqy
	WkhaxN7Pp9BLuRxy9j5r21wPQ4YtuGo/EgOnQeIFPbmLuMtnCHoKqZwg4ZTPfTRH16469AFMbe/CY
	S5p5Wie9IIj59XSeyuweDSCoeE/1dSvyTge50NK7ChUYwRITbThxrxKe9zHKbCldj0DyfVVx3dDjq
	YRdA7QYJMALyhNaIr5g3Gkz4Kg5rDW+nPjH9rvmj+JC8h+VORGOlUgJbdOo6VS/hDB6d0reWWBBTC
	9GB5q4yQ==;
Received: from ip6-localhost ([::1]:55672 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rUVaQ-004xqh-Mk; Mon, 29 Jan 2024 17:38:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39838) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rUVaL-004xqK-GA; Mon, 29 Jan 2024 17:38:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=cj2pRN3nRNLmx4Fiy+evZ9AcI9p/3OOEd7dXw42xKEQ=; b=3WxS4JLPegHoWx9pLbfD62jqXT
 m2jAvYqiHL6PAvG5XaBTPmH6fPwbxtT5zfR/4BQOXwwkC/nQOipM2Q7R5sZkxB38dbluJaXcU1auX
 eiDGFHr3LPyvYFTK9L3Qr51n1BH+iOU1c/kHhwHV9aAZgqs7uDvbsOWJ89ItO+7KnxlYZCSGjFf7n
 KkB3QNbbmqLdCpfg4VFws+LjJR4D40rs3kfrBfuTD4HwALSqfOv5LVdnSw3E5Pi9wlpnvFnBMmnrQ
 wxa99IKFYei7u8t5BAY4/eSMrdEVCTJ5m2SNhnUmwofmQOUdNyVSQe2tZ0OPma+12UoyPWqkQDy+J
 kPQb+BXQEGva/4wLnw1RGw3d0PNNPR67fE7rVKWcEak/WFIGcwtj0Y2h/EE2exHYbyKj656/gtak/
 +CJEor20DvzeghQPngcqOmmVhGTvWlUEp2+8h8jKre6vG7KB57I1sUwEpRetntrFei0Ak9e/OHJs6
 mO69h6ck0Bd+VI2WmZg1cUYw;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rUVaK-00APhE-39; Mon, 29 Jan 2024 17:38:17 +0000
Message-ID: <334b4f3e-8711-4e26-9668-166f57b9414d@samba.org>
Date: Mon, 29 Jan 2024 18:38:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Samba] Invitation to SambaXP 2024: digital & free - 17th and
 18th of April
Content-Language: en-US, de-DE
To: Jeremy Allison <jra@samba.org>
References: <2fa86f4f-925e-47c1-9b98-5571cced984e@samba.org>
 <5d803c66-5740-4943-8985-edfb6e690f4f@samba.org>
 <ZbffMjb5aE4osjbc@jeremy-HP-Z840-Workstation>
In-Reply-To: <ZbffMjb5aE4osjbc@jeremy-HP-Z840-Workstation>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Pqo7ZxZthEfxJEelDBnTL8HM"
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
Cc: sambalist <samba@lists.samba.org>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Pqo7ZxZthEfxJEelDBnTL8HM
Content-Type: multipart/mixed; boundary="------------G5OJZ7xCAhlBx0y0mca0DnSx";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Jeremy Allison <jra@samba.org>
Cc: samba-technical@lists.samba.org, sambalist <samba@lists.samba.org>
Message-ID: <334b4f3e-8711-4e26-9668-166f57b9414d@samba.org>
Subject: Re: [Samba] Invitation to SambaXP 2024: digital & free - 17th and
 18th of April
References: <2fa86f4f-925e-47c1-9b98-5571cced984e@samba.org>
 <5d803c66-5740-4943-8985-edfb6e690f4f@samba.org>
 <ZbffMjb5aE4osjbc@jeremy-HP-Z840-Workstation>
In-Reply-To: <ZbffMjb5aE4osjbc@jeremy-HP-Z840-Workstation>

--------------G5OJZ7xCAhlBx0y0mca0DnSx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMS8yOS8yNCAxODoyNCwgSmVyZW15IEFsbGlzb24gd3JvdGU6DQo+IENsb3NlLCBidXQg
aXQncyBSb2NreSBMaW51eCwgbm90IFJvY2sgOi0pLg0KDQphaGhoLCBJIGtub3csIHNvcnJ5
ISBJcmEgd2FzIHF1aWNrZXIgdGhlbiB5b3UgaW4gcG9pbnRpbmcgdGhpcyBvdXQgDQpwcml2
YXRlbHksIEkgd2FzIHN0aWxsIGhpZGluZyBpbiBteSBiYXNlbWVudCBpbiBzaGFtZS4gOikN
Cg0KLVJhbHBoDQo=

--------------G5OJZ7xCAhlBx0y0mca0DnSx--

--------------Pqo7ZxZthEfxJEelDBnTL8HM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmW34ogFAwAAAAAACgkQqh6bcSY5nkYI
NA//cTpTSb07fs1841Mz75IU/pasXnutSi4H38pCy6RChuVBRLWlg+9rL1BtoQ5pE8te6VRY2V0C
i7QIlixsFhukiGsO3W4sW0sOTR4t+JEhQj2O3wjRzN183taTZuXoMy/ALglzpZZX7ojjJN9SAQnZ
xXV+x/tSzBq5XPZfl7xHa+DbGfQ2+5F+Bdu5OCAzRgkzrgwube07U79hh3Bddh8H+Q2w1pv89te6
kPkEBlgqmy+tpgRyxX7jrBUejN7gzpAul6HglLRjsErycWIB7NqeW9t1uXS7OxyCryvQdmhOaPHw
fPq1E7BhkoNrLHh8d6FyDVh9iiV7XKyo0/6x6lcaARfLHsjkGzj4Oh6rcGPwlqBeP1PbWg1NTNer
WfrC7iPZ9k5GM60fV4YL2oPc67OYrKPHlIkrlCsws54cDXgfnbIqXTK8bxkowRuT0c7WPaoyk14m
u2RcN98gmVljmFo8I8H6JaQ1AyS0voTOgIX9EtkB4PjSODcDCymYw77VwKmnvW5k5pCPaZ2M+9u+
8VeAn/HJUFSQ3AAASA14RUWN8f7fP05+AFIfcl6PvFHNBiKoaFpOyXH+yYHDeQFhZjgGCWvuDgo3
urXPCAURtHdyzBw8ms5jJV0yus731h+JHwSiiJ/wzB9brZG49EvEmzCBU8bS1sDjrw8pHizWaO0W
jRY=
=I72T
-----END PGP SIGNATURE-----

--------------Pqo7ZxZthEfxJEelDBnTL8HM--

