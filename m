Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 04724D00AF
	for <lists+samba-technical@lfdr.de>; Tue,  8 Oct 2019 20:25:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=7c77XsaxaUFJHhWKMrKqosInwudsC5gIMUDO6G1PIYg=; b=IuJhA1w/HxwSCchi7CYsTjIyfT
	+Axwa0liS/ZOHUVDV02xw38XQRjEjMyMVvADFSm3xtx4fLTjLCNi1dXAnrjc1avqacASV/s336zWS
	upGG3LdqBYSwe7RafXWDeqUXctzwtM8+mK4OwHxKI8oN026oh8XeoPwEXdy/Tkb+lXsL3kkMmkjmy
	6cu8uuXjYn4OZW65NOzu4Fjjw5Wgj5aGtUeUe2Rl6dEad8JPYlWS4fVDPfidJLFR4Ro4F1hu2ez5x
	Gto3nnPL7K2xovCR8EnQ4EWBJoF7oH4nyRdoEsYRWRLwbsArcAUGU1EGHAr9MNLgFa+EYhNbcjv2e
	SrFYr2Vw==;
Received: from localhost ([::1]:18084 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iHuBB-002AG2-6n; Tue, 08 Oct 2019 18:25:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22020) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iHuB6-002AFv-BX
 for samba-technical@lists.samba.org; Tue, 08 Oct 2019 18:25:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=7c77XsaxaUFJHhWKMrKqosInwudsC5gIMUDO6G1PIYg=; b=oMn6a1oi7CT6U85uUXkh+o2jdz
 6MRLqj+T7YlYMNCtOlWKx+xhfaHp3LRgmAh9idxaHV8sidOZCjdJfwzgyVf0KlV3fZkLDH5qWr9EQ
 CGZxez8r2U79nbNCBqGlo96LUJWe4sM8pfPKJU0w3/LRJi4WmzPd3PfXALD8FZWKKMT0=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iHuB5-0000w2-VC; Tue, 08 Oct 2019 18:25:44 +0000
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
References: <5849953.E8HlOTvGIY@magrathea>
 <d7532a8d-aa6b-4f30-efde-891b7b5b8333@samba.org>
 <7864352.Hjom7Gqvmf@magrathea>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Subject: Re: Samba and legacy Windows support
Message-ID: <3616bd99-1556-f9c9-dd77-0effb56fc264@samba.org>
Date: Tue, 8 Oct 2019 20:25:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7864352.Hjom7Gqvmf@magrathea>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="WNArhpusqKF9e2VjRFAJQ7QoavmZZgZBT"
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WNArhpusqKF9e2VjRFAJQ7QoavmZZgZBT
Content-Type: multipart/mixed; boundary="UqdmfFTdT71K2ifviEBl4x6GDzKXNpOXv";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Message-ID: <3616bd99-1556-f9c9-dd77-0effb56fc264@samba.org>
Subject: Re: Samba and legacy Windows support
References: <5849953.E8HlOTvGIY@magrathea>
 <d7532a8d-aa6b-4f30-efde-891b7b5b8333@samba.org>
 <7864352.Hjom7Gqvmf@magrathea>
In-Reply-To: <7864352.Hjom7Gqvmf@magrathea>

--UqdmfFTdT71K2ifviEBl4x6GDzKXNpOXv
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 08.10.19 um 19:42 schrieb Andreas Schneider via samba-technical:
> On Tuesday, 8 October 2019 13:05:14 CEST Stefan Metzmacher via samba-te=
chnical=20
> wrote:
>>> * Can we remove DES and 3DES Kerberos support for Samba 4.12?
>>
>> Yes. The question is how to store the keys.
>> Is there a way to disable DES on Windows, so that we could
>> check what they store in the Primary:Kerberos-Newer-Keys
>> and Primary:Kerberos blobs in that case.
>=20
> Windows Servers with a Domain Functional Level > 2008 do not accept DES=
 keys=20
> by default. RC4 keys should be present since Windows 2000. See first an=
swer=20
> to:
>=20
> https://social.technet.microsoft.com/Forums/windowsserver/en-US/
> 120efed0-10ad-4f78-821f-38def967f3c5/ad-kerberos-question
> =20
> Also looking at the KDC code we don't handle DES keys, we only support =
RC4 and=20
> AES. See source4/kdc/db-glue.c -> samba_kdc_message2entry_keys()
>=20
> Looking at the code ENC_RSA_MD5 can be removed. We don't really do anyt=
hing=20
> with it.

kerberos_enctype_to_bitmap() handles it and we just take what we found
in pkb4->keys[i].value or pkb3->keys[i].value.

But just skipping the keys there and in gssapi is fine.

I'm just worried about the records in our database.

We had the problem before that we stored something that was unexpected
for a Windows DC and it crashed after replicating password changes from u=
s.

>>> * When can we remove RC4 support with Kerberos?
>>
>> I think we need to keep that, because not every account
>> has aes keys, as the password might not be changed.
>=20
> Ok, so we have to discuss this with Microsoft.

Maybe we could start with a special auditing warning for accounts
only having an nthash.

And also hide the nthash if aes keys are available.

For service accounts we may be able to just expose the
highest available keytype.

metze





--UqdmfFTdT71K2ifviEBl4x6GDzKXNpOXv--

--WNArhpusqKF9e2VjRFAJQ7QoavmZZgZBT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl2c1KMACgkQDbX1YShp
vVaDqhAAhi6tuKC5a8Ee9WmU33UncKn8XXClaPhb+lR6a4TOCrrw3658yH8ZbrRd
vnwarVq7M/fgxzNNKLL1tCxBCIqtmRFilCyRb3h4tdgSP1eJFTkAyBDgEqKYMZ1v
BlSEgLbbaizKG+wuYJIKJjzQ7K0uDCUu9/+acnmh5rsTm735N7D/WyrnlMiZLBbr
5vvO2sY2ZN7bPV0sPhiifSua4Kwdks9ElDAhfQH5gbfYSSTV//AOVoSuLciRKJ7m
4UcM8Wq71UNvlNsCnupd9FMVC5z6PQoKXcmnzvZSq+KxGEtspepN7/mwY8qO3RqG
kuVEG++j1ig/InmfzHTtYZ5xJjH7+ScaMwopPS1EGk0exsvp6nX4YkZkycZ6i9Xh
J/eJC7v0vvzU5qw9bEgqDb88ylN/yw9l2vpuaY9BNJ/nDlxZ9ceumqofBHEOZkqY
ARkP2TmCMlNWeovsMx7z3GUXQfoKDe1RdjLncC0wLrL8cycgRYnW26gRiHMu0aVM
nIuPbr7Dl0AuZwAzJTTUf3wgADhgjv1q5FcNFDzUjiLEqbLjIbZdb0ull6DLbDif
RtOsd6ZqI19mUMLb5kLa4tJlToIV39XARtg2hyq73AmoJNm664Y1y0nG7EnFOE89
LOILy54BP3B/duYGR0mESwMEBLBuEdIRYLUKYngVY+SFil8W+GA=
=MRG+
-----END PGP SIGNATURE-----

--WNArhpusqKF9e2VjRFAJQ7QoavmZZgZBT--

