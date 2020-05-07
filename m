Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CCB1C9E83
	for <lists+samba-technical@lfdr.de>; Fri,  8 May 2020 00:34:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=71GrwgpNagtuzLRw6i/O2qr2PKOEgPpC0Ag5zWIB4sY=; b=6In6wi0DlzFYOO0w/tuIJdRYNN
	qPw0I8cjfvn7u84CucrY3lwFcZB6Ak7oKGOwRAxKxl1Zprj9ANAjmGNjri+Pdrjohj7vfx1iC44SN
	r3aC7zkcyKyosQh2V4IZD9bqElawG9Ng5HRYTkjcciLD2IM47tTunGtrC/4i5bb8D1LbAl7LIltVf
	pRfv48mc1opjYrZX/MeLJr2LDmtcDSFqkX6kVtQY9xv7DgAoBKCW6xDNk7ccWV1Ogt0L3AnLYMQ5O
	4k9uyzePGhaa8EQ78SeaAgJD1kfzQkOSJRkhowjglixtLDW1Kj0h0C/yaQTIE+5G1HWlFQt5yv8Af
	B32s/J1Q==;
Received: from localhost ([::1]:49212 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jWp5D-003Bdi-4b; Thu, 07 May 2020 22:33:35 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz ([202.78.240.226]:50766) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWp54-003Bda-FS
 for samba-technical@lists.samba.org; Thu, 07 May 2020 22:33:30 +0000
Received: from [192.168.1.7] (unknown [114.23.145.136])
 (Authenticated sender: gary@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 0B7A180CC4
 for <samba-technical@lists.samba.org>; Fri,  8 May 2020 10:08:40 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1588889320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=71GrwgpNagtuzLRw6i/O2qr2PKOEgPpC0Ag5zWIB4sY=;
 b=q892HBxjcTlZwRFgEDiuybG0d86/O8me1sI090uI+z5e3GXg2Gwk4CaCLBHMB+/u5NJkGF
 uX/lEUHlYOqjczJGqcrleQm+/dTFjFvjWjvK/OgauKMB8Votsah4SdFQTSDKeJ7DtTmzEs
 wov4ajlkcNG6AIe0Q4EdtMUmVdcadD+LDE9JQdL1IVs3NoUoizNbAIjkaTiyfShmxf2lvJ
 RJsd/Q8+U9yQQ0PJ3UTtzdwOOlc5tRogDlXOUqxb+cajxwAGzi3dGUP2wq4vW6lBQuDrhU
 bPgk9cJ5CIr6CadOB5i5UnJfIirI4AOp/jJ4L/8d1Ix2BdbKJXxRae2RamuwaQ==
Subject: Re: ldb 2.1.2: test_get_size failure on ppc64el
To: samba-technical@lists.samba.org
References: <CANYNYEHEeDcD+5GL+wCotQG9O1XA1F_i_XmRwcGWbqj15PKxjw@mail.gmail.com>
Message-ID: <0a650511-9ab0-4501-ee3b-c2c564b3b51f@catalyst.net.nz>
Date: Fri, 8 May 2020 10:08:32 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CANYNYEHEeDcD+5GL+wCotQG9O1XA1F_i_XmRwcGWbqj15PKxjw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="7wmQbpTmTTNR9JCpF1ZhWpeZfmg4ZC8up"
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=gary@catalyst.net.nz smtp.mailfrom=gary@catalyst.net.nz
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
From: Gary via samba-technical <samba-technical@lists.samba.org>
Reply-To: Gary <gary@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7wmQbpTmTTNR9JCpF1ZhWpeZfmg4ZC8up
Content-Type: multipart/mixed; boundary="4hAoznMjRPAFklQyQFfhn1HitO6nhTa6N"

--4hAoznMjRPAFklQyQFfhn1HitO6nhTa6N
Content-Type: text/plain; charset=utf-8
Content-Language: en-NZ
Content-Transfer-Encoding: quoted-printable



On 8/05/20 6:16 am, Andreas Hasenack via samba-technical wrote:
> Hi,
>=20
> I'm building ldb 2.1.2 on ubuntu groovy 20.10, along with all the
> other dependencies for samba 4.12.2, and I'm getting this test error
> on ppc64el only:
>=20
> [ RUN      ] test_get_size
> [  ERROR   ] --- 13369 is not within the range 2500-5000
> [   LINE   ] --- ../../tests/ldb_kv_ops_test.c:1721: error: Failure!
> [  FAILED  ] test_get_size
> [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D] 13 test(s) run.
> [  PASSED  ] 12 test(s).
> [  FAILED  ] 1 test(s), listed below:
> [  FAILED  ] test_get_size
>=20
> That assert use to be
>=20
> assert_true( size > 2500);
>=20
> but was changed to
>=20
> assert_in_range(size, 2500, 5000);
>=20
> in commit
>=20
> commit e464e40c977cd6592240763c7dbb9c45ff16470f
> Author: Andreas Schneider <asn@samba.org>
> Date:   Thu Dec 5 17:14:31 2019 +0100
>=20
>     ldb:tests: Use assert_in_range() in test_get_size()
>=20
>     Signed-off-by: Andreas Schneider <asn@samba.org>
>     Reviewed-by: Gary Lockyer <gary@samba.org>
>=20
>=20
> Is that 5000 ceiling limit just a guess, or is this failure indicating
> a real bug somewhere? The value 13369 I got on ppc64el seems a bit
It's just a guess. for tdb we estimate the number of records with
#define RECORD_SIZE 500

static size_t ltdb_get_size(struct ldb_kv_private *ldb_kv)

{

    size_t map_size =3D tdb_map_size(ldb_kv->tdb);

    size_t size =3D map_size / RECORD_SIZE;


    return size;

}

This estimate gets used to size the in memory TDB used when re-indexing
the database.

So changing the test to assert_in_range(size, 2500, 20000);
Should be ok.

> excessive. On amd64, size is 2572, so it falls within that range.
>=20



--4hAoznMjRPAFklQyQFfhn1HitO6nhTa6N--

--7wmQbpTmTTNR9JCpF1ZhWpeZfmg4ZC8up
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEDO84T/PRptSsMEixei/9ZKIyR1MFAl60huYACgkQei/9ZKIy
R1OVJAgAkOPdtWEoFINm3CwttSGGvLIvRZXvbh19BW48ALfFKXhgbNOHuWsZXmS9
EXERVOdHw5Y6HIyoJNGi8bqOqgJGtJms3ty82acwzGDiHWNm/qFsnWjyenpuW3nV
TYw020Lfv6xV8aqXGVC422HZ6wuLqOnkOKibX2X9WX+qzPEL8FrHOvDoOUZICD6U
03NsQSvnuz+/f5G4+VTEdiVFfKPbcRpAfODmjLwOoJaWQQdLNRJwuyUEpOtHVJK0
RKcdFP0onDxanGY7kyme90jn+midO23BfZTuqWMXBNu0WIUEzacb2jTEpVlnA+Vg
okAqP5L7mlJYChii+4qTebEWnymC0Q==
=TLtg
-----END PGP SIGNATURE-----

--7wmQbpTmTTNR9JCpF1ZhWpeZfmg4ZC8up--

