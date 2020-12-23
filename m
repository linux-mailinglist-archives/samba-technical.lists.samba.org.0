Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A98662E2245
	for <lists+samba-technical@lfdr.de>; Wed, 23 Dec 2020 22:53:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=HbGX9UCEHAXsHNnByo930Nuc78QQd0MkAT/+/CDJALg=; b=Gcz88icEALFDDSVoujJKnWTF7Z
	RFkpeyUjuXorC9H2EtQcCuPxx2ociJNG0ObAP7kSKqpHNfhOsBw9XzEVcqczMLLJQ12jVZ9k2wMBp
	73/P2xCV1J6Erlb0+ADM+V87dAZGb3LlF1/Dgc7iXg5TR/K7t958hXp85r3vDucCOT6xsXkH4icSw
	B7L8b2HtJLw3AJXi66csopWTKZyaJGiFYw+uXT5G7mOSRzCOlaP9usAsiXrJiJzOy38b5Ed2qAoJF
	jAy+q6vEM8dFcDuYQzPgYTlhd3iGCkl8TdHVEVDGmEvSsv2N6Gm75mN7NwDlsK1AktfKclGkhJEp+
	EGTFzOSw==;
Received: from ip6-localhost ([::1]:48852 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ksC3z-002H67-SC; Wed, 23 Dec 2020 21:52:55 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:42728) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ksC3t-002H60-H2
 for samba-technical@lists.samba.org; Wed, 23 Dec 2020 21:52:53 +0000
Received: from [192.168.1.157] (unknown [114.23.142.188])
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 436678166A; 
 Thu, 24 Dec 2020 10:34:04 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1608759245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=HbGX9UCEHAXsHNnByo930Nuc78QQd0MkAT/+/CDJALg=;
 b=RdJfqJ9wjxZOYgcJhKHheUo60dZ487C2N88WrLnwsd8/0Qlv30ZNb4SoADADKGrTiuM4iw
 twzGVR04bWrvT6hj86D6rFqrG15ZoaGcg4OXeZOAvi0gmBTMK3tMG5z8mLMtTrPfSXlXwD
 yDfX5xoVV47HwomrWiWv4gcs1OB0/22bxnt7elMn8ie5Di/dhbz3K+QY1Kp8q8H+dLyN+I
 6Csk9n+INlXDileCs5SkuXOKBleE9X38sVWfQYFixYPF3HD+T34DHsleIQtcXnGtGKYkEU
 8+D1WiLyd8qOEFLd39poBaOy5el6PViuWZ4xAr9A7Xbn+GJpoeLPFlfAGGXq+g==
Subject: Re: TDB restrictions from 2015: Still the case?
To: Noel Kuntze <noel.kuntze@thermi.consulting>,
 samba-technical@lists.samba.org
References: <a721c07f-9c68-bed8-29de-7ffe59b10b28@thermi.consulting>
Message-ID: <d0e890ea-3922-894a-8290-0abb86584027@catalyst.net.nz>
Date: Thu, 24 Dec 2020 10:34:02 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a721c07f-9c68-bed8-29de-7ffe59b10b28@thermi.consulting>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="9S7JDrWS0xZM3W3G7v1zPmy2PaNfpgUVd"
X-Spamd-Result: default: False [-2.20 / 15.00]; ARC_NA(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 SIGNED_PGP(-2.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 ASN(0.00)[asn:56030, ipnet:114.23.0.0/16, country:NZ];
 MID_RHS_MATCH_FROM(0.00)[]
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=douglasb@catalyst.net.nz
 smtp.mailfrom=douglas.bagnall@catalyst.net.nz
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9S7JDrWS0xZM3W3G7v1zPmy2PaNfpgUVd
Content-Type: multipart/mixed; boundary="zDZT1WNOGacnkDdPj25GVL62Thn3SdHpx"

--zDZT1WNOGacnkDdPj25GVL62Thn3SdHpx
Content-Type: text/plain; charset=utf-8
Content-Language: en-NZ
Content-Transfer-Encoding: quoted-printable

hi Noel,
>=20
> I am looking for a replacement for Berkeley DB.
> At the moment, I am looking at TDB for that, and I found an email from =
2015
> detailing issues if TDB was used in large scale projects.
> The Email from 2015 can be found in the archive[1].
>=20
> Please let me know if these restrictions are still true today.
>=20
> Kind regards
>=20
> Noel
>=20
> [1] https://lists.samba.org/archive/samba-technical/2015-August/109166.=
html

The 32 bit limit has not changed.

The "Extremly poor Performance of the LDB/TDB Database Stack" was due to =
the LDB
layer which has a lot of work to do and was then quite inefficient.

I don't know about the threads. The CPU load mentioned would be LDB load.=


We have improved LDB performance a lot, and for >4GB installs we introduc=
ed LMDB
as a backend option. I can't remember exact numbers, but when comparing L=
DB
performance with TDB and LMDB, there is not much to distinguish the two (=
with
<4GB databases, obviously). The core database is not a bottleneck.

Douglas


--zDZT1WNOGacnkDdPj25GVL62Thn3SdHpx--

--9S7JDrWS0xZM3W3G7v1zPmy2PaNfpgUVd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEU5izEodn2f3xTzSydyozSbGxfm0FAl/jt8oACgkQdyozSbGx
fm39IggAgzVNmlAbixQKsSeyiqtQc7XYYa69y6dpdvmMI12QGdqsoiZS10UbXtop
/2IAlQzwzN5HsiUcwd9J7o6GlVfgUf95FSKBPHoEyClmyY3V30XTpgFKfxYka3SK
xsHRFqHkKJDt+MNnN8mVTZAo3Q3k7R5SkD2mHlhKt+0vOrVZ563dIwrMXOcNg9xm
lpV+bRSSmySRy4PwYp1phnR/4NtU+0JN+pblyCtwsMakyHzABdpEm7l2FXc5IOyv
quko+JC57xlBxMDXKL4v1kmtr0N4tDgOsHYXhOHSBGOqUgWaAcndsTC1dYgZPMM9
UC/7e5F/qS15jfRbhI4+ormwvJMAZg==
=gkh2
-----END PGP SIGNATURE-----

--9S7JDrWS0xZM3W3G7v1zPmy2PaNfpgUVd--

