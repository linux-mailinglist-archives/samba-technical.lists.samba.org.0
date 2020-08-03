Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BA63423ACE2
	for <lists+samba-technical@lfdr.de>; Mon,  3 Aug 2020 21:21:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=QXcfMaoh+cu3NqazhG12ZkGN8VLIz8xn7zIwcXK+K/0=; b=AL/1oqMqiCgjrCuNhi9TzDunEB
	eoKAFVEcPvPz+jrktncM90yeWlrSWB9KJ+JEjtGyxLPEGWqpPi/qRw3crXiMew3gRzr4jmtdMjnEc
	Fly3hxYCGzSDNnFYC/kQpzDtZd6fdzdfAOPnCP4aJPXCo0pOcFodSzS/RTfkSP1OhQzI0zSFPmjQD
	kWD+G3H5tK24We5aiROmAX4rrP4fCd3LFdaMOYP4ZfVMZMWpNUPTbDGC9iilAH8dZMTikFHtawfoT
	Z/QwM0BNNojfBmmWf8gBv4Zq3yX1G/0BJDdgPf0sny4bW2oa6MmFwgryRHIY/DC1pdQcWLsTIeona
	XRFiSbaw==;
Received: from localhost ([::1]:23738 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k2g0j-00CNQO-5K; Mon, 03 Aug 2020 19:20:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26350) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k2g0c-00CNQH-JS
 for samba-technical@lists.samba.org; Mon, 03 Aug 2020 19:20:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:Cc:From:To;
 bh=QXcfMaoh+cu3NqazhG12ZkGN8VLIz8xn7zIwcXK+K/0=; b=NdwzIJdlIH67rD1z6Cffp8RHaA
 fZS4h4BewMRFL8Lw4o+ooS4UJYjAydBejD4on3UHFCeYFhnnE+R/SIhbS/FEU7Mj0ZHd9rKhHftl5
 oPcWZ9JycPxXBWLQ8qc8vFMIy+829FxK5rfwyu49mkcf7lpezqk6BZIMV3OYYgWA/uKuD9XUBCN+d
 lYBDoAY291LzTphuHNjaE9He61ecUCfdUQF2I5otAF3IYBhpkIfMd/1tqcpQhCN5MyCPwmWrYuuHn
 K364MhhST0a/ffcK5E7G9ErcBrPY7tU+y9kiZlbmmu0o7z7Fu9nSDSpVT4i+ENX0N2sRJub97k7jB
 VIkX/NkpudSXf5ujVtqMZLlZoaiIbJRMYP8I5hOiThpaMsI/cY2KQXaBYzxZDYzrpiartojfM+g2k
 zlmTdkVXe5EfIe4xwbxLmyYq+sBBfguMjkEgpa6qLaMFL9e2p/kAbkU1jnZaOHyijnj609XWe1Hq1
 jo9ExJTam/Y8bVUNRh6TcpM8;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k2g0b-0002bR-Td; Mon, 03 Aug 2020 19:20:30 +0000
Subject: Re: PANIC internal error: samba 4.12.5 CTDB cluster
To: David Rivera <rivera.david87@gmail.com>
References: <CAMYxiYw4E5qX7KPMY2gsnd9+y2BkusL1Ef=gZ1i017TWGCmQwQ@mail.gmail.com>
 <CAMYxiYx9QWJKafzy02n34KA2LuGxjKT3i16rR9U1TvyMaA79Aw@mail.gmail.com>
Message-ID: <9532a8e3-0ed1-3b84-4c89-7a0674e97edb@samba.org>
Date: Mon, 3 Aug 2020 21:20:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMYxiYx9QWJKafzy02n34KA2LuGxjKT3i16rR9U1TvyMaA79Aw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="18IRwVgb2Z4rtfFztmQGcMR2s9dyikGk6"
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
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--18IRwVgb2Z4rtfFztmQGcMR2s9dyikGk6
Content-Type: multipart/mixed; boundary="OKF7PfEe8CuLa0QEdbBAV5WbKHqpBe5CW"

--OKF7PfEe8CuLa0QEdbBAV5WbKHqpBe5CW
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 8/3/20 um 8:55 PM schrieb David Rivera via samba-technical:
> Any help to fix this problem would be appreciated.
if it's reproducible by just accessing a specific directory atm, then jus=
t:

* make sure debug symbols are available

* run the smbd servicing the connection with level 10

* start a network trace port 445, raw packets, -s 0

* reproduce problem

Upload the tracedata somewhere where folks with time to help can grab it.=


Cheers!
-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--OKF7PfEe8CuLa0QEdbBAV5WbKHqpBe5CW--

--18IRwVgb2Z4rtfFztmQGcMR2s9dyikGk6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAl8oY3wACgkQqh6bcSY5
nkYU8g//U+O6BiYJax7gq2Q1Qj1evkZZXqjN11jp38L3BFlPy/a7a9s2Iyvofl8c
TPxWetYXV3GzNuistbZWeYgdyJBFPUJ47Po12c1Me2w4FVRSwQmpQcZl5sa7CJfS
CsOmfNo/tL0m/1+OrIR+QeuiaOBQGOWr9Nyt/wSdFuqyFioFDmNk/iULSR9Z1geQ
jZbv+EMuMUL9uoRFpyvBp6WKIxXDccoIgmoJ4XIV7zmRI1rYQDTEo0XLs7ZSNI6V
+Af10KdqTFV9+1hEjATg1D8H3KQ1oIr1CM/nhO8my614BW7mTgZfcFEx2+kJPKSC
epO8gW4peNz8VNWjkGAS1lYG8A0yV/39x12Z/1CHpbRLtE9RNupeMLqMucb8rw7v
QRTwZjUsA+kpBQHhg4jNcd4QcrnB7ZIf9iMNUQSyxMasWZcCP4aGHq0iAf+GUp+e
ygE9O7GVAhwlFRWvdwwchptQvQnQYW8heUJn3aPQjlfcSVnG/a9DqHyzoARNucRb
hs7QjmaLRZ0LYOaDJmVnp/+MtAO3itHS6/8RNK260vxpdz8ZSHjEhKlNxSmFEvNl
4D+1vLyR7qWYIZoH8rdxvVA+rVtxVIiBzOHiL1WK2JLUNsds8ulpH9YA/kevk5Tg
ukb81RV1IVKBnfgj0/DNtopdIqrVCqhlTKNM8wIYcFbOyTrZBkU=
=OkKT
-----END PGP SIGNATURE-----

--18IRwVgb2Z4rtfFztmQGcMR2s9dyikGk6--

