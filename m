Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 70963400F33
	for <lists+samba-technical@lfdr.de>; Sun,  5 Sep 2021 12:59:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=RR4rNuUI3df9zZ+Ybe1cWwI+coLSvw2nQ4LHSMIDfQw=; b=X/8TQ5xlW2tE0LesU+PjnAj6P9
	xYCbSkdIjc5kESUHxEqNaI+tttUtlzz3MI5gseX8AW21bRgjUd70S9VS6aqkBifMWCOASPu+t9/MY
	Z5TdmDWpdyk4qeJoedriWjbiAL6PDv5kF1XdfrtW9wOpyohXAFVX9Pw9tL2ankqncGyYZIgny6V6W
	PAC1llrx7KRu7AlDShTumo4FbZy3yVaOolxhLPGnFCZDe0GqFAWNwL2fN2/0xcrn7XIs7IDU7PXB5
	H1XQ2Mlu1ZrWkQToLM3VDafkViUFaa1tEUYzgR4ateJtg5cpgS0hveNlWRBJrKLdBEIt1T50TISQh
	6zs6MsHA==;
Received: from ip6-localhost ([::1]:28658 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mMprV-00DP6F-Fg; Sun, 05 Sep 2021 10:58:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48600) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mMprP-00DP65-Jh
 for samba-technical@lists.samba.org; Sun, 05 Sep 2021 10:58:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=RR4rNuUI3df9zZ+Ybe1cWwI+coLSvw2nQ4LHSMIDfQw=; b=ctp/jyJwmWqYCnp6afSlUtDOt0
 jnBopiLmJUzixOsWdSlqXU1Apz6ufllVmON5oO5x3/lB6WkouAyANL12XniS+PQs9IKEEkp4XyJQQ
 9OEdi4stpBcZh7DpFMOwdL+mdQlUPgP+qCVG4EvZ58TogM5qfz/Kv8jA8jRNt+BLf9SXsiEBQJ4/L
 klUalnTi1YGPalv5DlkUhttzgKxsTV/q/vWdqhbESVE0zkUFBRdf1i9zuA2pATXemYr8XWEF9f+1P
 MuKUqIrDXcsLJbr298sHN/uIJN4w6akmG5mvhfD+9qvR5PL/YL8VMnzkh8WUU7sRQP8enWb9eCBc0
 sWSyhG9gieqcye25VeV3nB2lclf8f1c5MoefiX583SVmduxDzrFbCmUMoOTde8Oy2Qu/wOIX3mOLZ
 fjjI9Ixn4n8AALKgHoqvtgpj1URgMe1GsXob6PPH8g/oG3illTTx7MjMNb12/9Xf/hWZTtFBmVCQg
 YEz4JiQ7D3a4MCt+mrC/90xL;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mMprP-004kA7-8r; Sun, 05 Sep 2021 10:58:51 +0000
Subject: Re: HEADS UP: The Joys of Logging, or subtle behaviour change of
 logging in the daemons in 4.15
To: Matt Grant <matt@mattgrant.net.nz>
References: <f4ce9085-24be-55fe-e71c-ac7c67b845e4@samba.org>
 <007822c852b35cac5035eb2651380806b306d151.camel@samba.org>
 <f0e2bb66-f856-fbc1-e155-6b55ea095f13@mattgrant.net.nz>
Message-ID: <3724ea20-c074-027c-a590-bcca74b331ee@samba.org>
Date: Sun, 5 Sep 2021 12:58:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f0e2bb66-f856-fbc1-e155-6b55ea095f13@mattgrant.net.nz>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Wxhb52GJyKCClPBWoCYG7Dm9VWEy85vjE"
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Wxhb52GJyKCClPBWoCYG7Dm9VWEy85vjE
Content-Type: multipart/mixed; boundary="mTuvT44IzNdEj635LkdFzX5kXfD3TN2mg";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Matt Grant <matt@mattgrant.net.nz>
Cc: samba-technical <samba-technical@lists.samba.org>
Message-ID: <3724ea20-c074-027c-a590-bcca74b331ee@samba.org>
Subject: Re: HEADS UP: The Joys of Logging, or subtle behaviour change of
 logging in the daemons in 4.15
References: <f4ce9085-24be-55fe-e71c-ac7c67b845e4@samba.org>
 <007822c852b35cac5035eb2651380806b306d151.camel@samba.org>
 <f0e2bb66-f856-fbc1-e155-6b55ea095f13@mattgrant.net.nz>
In-Reply-To: <f0e2bb66-f856-fbc1-e155-6b55ea095f13@mattgrant.net.nz>

--mTuvT44IzNdEj635LkdFzX5kXfD3TN2mg
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 05.09.21 um 08:32 schrieb Matt Grant:
> Here's my 2 cents as a long term Debian Developer, if you don't mind me=

> chiming in please.

quite the contrary, thanks for sharing your thoughts!

Cheers!
-slow

--=20
Ralph Boehme, Samba Team                 https://samba.org/
SerNet Samba Team       https://www.sernet.de/en/team-samba
Samba Development and Support, SerNet Professional Services


--mTuvT44IzNdEj635LkdFzX5kXfD3TN2mg--

--Wxhb52GJyKCClPBWoCYG7Dm9VWEy85vjE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmE0ouoFAwAAAAAACgkQqh6bcSY5nkZX
chAArrr5l1NUGtd9F/QDK+O45OzSRacReYNL0QVTvnZpNysw+PJcJA9mZGR3LbA/7DE9kpFBtW3R
vUCaAVENBEkY/4hP6Mv86HzC9Kd8QF59ubcflwD6NBkRFKSt4pw7EjCxRfWIl7ti/0iidCBvND0A
ChS1tEWqphzEeJZvqmDogKnAU7CMo29ZN6rMGODPIDzUtcPEj/GSzctNObqpKb5q8q1b+i3o0a+b
2aOM8xM/r6NlpM3chSPMZlih6hR4kjtXwXN8hIChACuirTgZ3i2cOYwwQUMdBC6BJCR8TCslJSmw
BjEA2oYuBFF5okd//uua3iaJ8eJ7MY2jJqFM8JunWhHvab8nMr8Mzkta4+jnLRJkal4MUUhD2wdo
eWhcF+jR9yp9HniK3ZVwvcKBlzWV2DkMFqP6pikeQ0+z0Vpu4GTO4YiMV4sYbbExpy6L2kYeWrOa
5S9t1i0S6b1mlQEhplZ6ADaymxVOzBryuD7re0u4O0nKWBsavExDI7Ci23eQmN2pCiPuAHjoZfHt
17a/qRR58WloSxS03DOZE7OswxitWSuo4YxbeQOz/UvpEfmtk5ixdciW8L676BArj1/P6eFY9jsk
J2NEocNq99bQAZkzWmr9ijPGHnJ4yXB/yBWCKLd7WGIYFkgL/OEFETcaxo8xEH189PjFUOMtMvEL
Hv4=
=tTPT
-----END PGP SIGNATURE-----

--Wxhb52GJyKCClPBWoCYG7Dm9VWEy85vjE--

