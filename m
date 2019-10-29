Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E4AE8B31
	for <lists+samba-technical@lfdr.de>; Tue, 29 Oct 2019 15:50:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=8PrVLRKYjrUVTJ7OSv5QhXVMkxx2SbV9ZPy1cQaHoEc=; b=FztMJhLe8FGY8+FetFAYGHhIQ6
	AknW4MfYpTYpigw22/XI0ON0sTIT0jk2sSAw5q++bNDwJY270Ienl1Qudz3hi4Lm28Xaa5qECzESF
	9XLZlIC8M5jheVV3DjZ2x7vIZystYNj5VAs6H++woHHb9n3+GE+R1uX5OxBTaYcWIRkN+R1EUVDSo
	glsVhmIieuwzk4TN4rUoLoOA7S+47BKndIXP9A585E4by70M6Jc8W0oI4fTljdhQqByKY/1sgQsWQ
	+N+BNC9F5vPP0ptPeQUz/ZI+d74wuuh9xoRvYEoyYr5sdIXnbviDrDYKbXmld6iMocnFbcVcu17AK
	1g7diqzA==;
Received: from localhost ([::1]:44400 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iPSow-003GIB-7H; Tue, 29 Oct 2019 14:50:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50878) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iPSos-003GI4-02
 for samba-technical@lists.samba.org; Tue, 29 Oct 2019 14:50:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=8PrVLRKYjrUVTJ7OSv5QhXVMkxx2SbV9ZPy1cQaHoEc=; b=XwVytJDq8B6ElR1dBldiY58Nru
 dshGhDrYgX3X1KUe4qkHsZIRtOGEJCY6NRt0p+74Ij2AEC7McDG6D7nT7AFm6h8aImlTraDVYKQPX
 AWFzd1EkiaKgmFKsXJU4IoHwR8RhgrnfH8bE+WkCnKYY36sBMMHX3m+OpLnD3TkUcEiviz2EeoPnW
 Oo64nUu+O+BXGO2geU4Je4OicuEGTrHX5wiBsJgLgMdprHpTsP4tuOGyES1YLv5jjkgjN8yo/gFY/
 3RXvaMkmRaI365yQfgJYyEGVB57bW8InSnGFth4RV65T6AZIBiabuCRZgQtTd6WtwGv9Zlr1CjYuu
 Ay4SyTsoK5jnnpAvMXBjBJxoLsmPqZuGOzEo6zsEBUng+o4vuUw8znvMu0+INZGinT4FTkKczZT8u
 K2NCalmrberpaYSCqp6Y2r2Y6eLWqO+itFYVRDEU4H3PwGU/4VQbMcl+ULNePQw4wiGKxxPu+8rhI
 ac5/jiuXAJQehOHQtnSTXqNq;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iPSor-0007pL-9J; Tue, 29 Oct 2019 14:50:01 +0000
To: Isaac Boukris <iboukris@gmail.com>, samba-technical@lists.samba.org
References: <CAC-fF8Tp4FsXokCrDkXFrdD2PhFs4wVpqyjEWDjpj4smam8VXA@mail.gmail.com>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Subject: Re: kdc: allow referrals for krbtgt in transitively trusted realm
Message-ID: <f1c0f4c5-cde1-6fb6-b481-adea7a8be5eb@samba.org>
Date: Tue, 29 Oct 2019 15:49:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAC-fF8Tp4FsXokCrDkXFrdD2PhFs4wVpqyjEWDjpj4smam8VXA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="1XdQH73WzzYANExlSG64ZKPCfPCQmWrYj"
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
--1XdQH73WzzYANExlSG64ZKPCfPCQmWrYj
Content-Type: multipart/mixed; boundary="wkdnoNnjiY2w7qp9R96knUlZBLasFf3Rq";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Isaac Boukris <iboukris@gmail.com>, samba-technical@lists.samba.org
Message-ID: <f1c0f4c5-cde1-6fb6-b481-adea7a8be5eb@samba.org>
Subject: Re: kdc: allow referrals for krbtgt in transitively trusted realm
References: <CAC-fF8Tp4FsXokCrDkXFrdD2PhFs4wVpqyjEWDjpj4smam8VXA@mail.gmail.com>
In-Reply-To: <CAC-fF8Tp4FsXokCrDkXFrdD2PhFs4wVpqyjEWDjpj4smam8VXA@mail.gmail.com>

--wkdnoNnjiY2w7qp9R96knUlZBLasFf3Rq
Content-Type: multipart/mixed;
 boundary="------------A6BE7FBD35FFAB52AEB2DBEE"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------A6BE7FBD35FFAB52AEB2DBEE
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Isaac,

I just found this old thread.

>> However, I think I found another bug in samba KDC with transitive
>> trust, which would cause s4u2self to fail.
>> This bug is not directly related to s4u2self, and can easily be
>> reproduces with MIT's kvno tool against samba KDC (in transitive trust=

>> env).
>>
>> In short, the first step in cross-realm s4u2self, is to obtain a
>> krbtgt to client realm, and while samba kdc gives proper referral to
>> intermediate realm when asked for HOST/transitively-trusted-realm, it
>> won't give a referral when asked for
>> krbtgt/transitively-trusted-realm, so the service cannot get started
>> (windows kdc does give referral in that case).
>> I have a POC patch for this bug (which I'm not happy with), but since
>> it's not directly related, I send it with more details in a separate
>> thread.
>=20
>=20
> Consider a samba KDC in domain S trusting ad domain A (forest trust),
> who has a child domain C.
> Once I acquire creds in domain S, I run 'kvno HOST/dc-in-domain-C'
> and samba kdc returns tgt-referral to A, which the kvno tool follows
> to ends up getting a service ticket from domain C.
> However, if I run 'kvno krbtgt/C@S' samba kdc returns
> KDC_ERR_S_PRINCIPAL_UNKNOWN (while windows kdc returns a referral in
> such case).
> As mentioned, this is necessary for cross-realm s4u2self.
>=20
> The attached poc patch solves the bug, but I think not efficient (and
> may leak?). I think what I need is, to find out efficiently in
> samba_kdc_lookup_realm(krbtgt) whether the realm is directly trusted
> in which case return 0, or only transitively trusted and then return
> WRONG_REALM with referral to intermediate realm.

I recently hit the same problem
and created a different fix.

Can you have a look?
It would be good to get this finally fixed.

If you think it's good, I'll extend the commit message
and start a merge request.

Thanks!
metze


--------------A6BE7FBD35FFAB52AEB2DBEE
Content-Type: text/plain; charset=UTF-8;
 name="tmp.diff.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="tmp.diff.txt"

RnJvbSBjOWZiMTVhOTIxOTMzNDFmYmY4MTVkNjNjNzRlNTdmOWIyYzMzZjU1IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBTdGVmYW4gTWV0em1hY2hlciA8bWV0emVAc2FtYmEu
b3JnPgpEYXRlOiBUaHUsIDEwIE9jdCAyMDE5IDE2OjIyOjM1ICswMjAwClN1YmplY3Q6IFtQ
QVRDSF0gczQ6a2RjOiBmaXggc2FtYmFfa2RjX2xvb2t1cF9yZWFsbSgpIHdpdGgKIGtyYnRn
dC9PVEhFUi5SRUFMTS9PVVIuUkVBTE0KCi0tLQogc291cmNlNC9rZGMvZGItZ2x1ZS5jIHwg
MzAgKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjUg
aW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zb3VyY2U0L2tk
Yy9kYi1nbHVlLmMgYi9zb3VyY2U0L2tkYy9kYi1nbHVlLmMKaW5kZXggZjYyYTYzM2M2Yzc4
Li40MGMxM2VjMzU3MGQgMTAwNjQ0Ci0tLSBhL3NvdXJjZTQva2RjL2RiLWdsdWUuYworKysg
Yi9zb3VyY2U0L2tkYy9kYi1nbHVlLmMKQEAgLTIxMjIsNiArMjEyMiw3IEBAIHN0YXRpYyBr
cmI1X2Vycm9yX2NvZGUgc2FtYmFfa2RjX2xvb2t1cF9yZWFsbShrcmI1X2NvbnRleHQgY29u
dGV4dCwKIAl1bnNpZ25lZCBpbnQgbnVtX2NvbXA7CiAJYm9vbCBvazsKIAljaGFyICp1cHBl
ciA9IE5VTEw7CisJYm9vbCBnZXRfa3JidGd0ID0gZmFsc2U7CiAKIAludW1fY29tcCA9IGty
YjVfcHJpbmNfc2l6ZShjb250ZXh0LCBwcmluY2lwYWwpOwogCkBAIC0yMTk3LDExICsyMTk4
LDExIEBAIHN0YXRpYyBrcmI1X2Vycm9yX2NvZGUgc2FtYmFfa2RjX2xvb2t1cF9yZWFsbShr
cmI1X2NvbnRleHQgY29udGV4dCwKIAogCQlyZXQgPSBwcmluY2lwYWxfY29tcF9zdHJjbXAo
Y29udGV4dCwgcHJpbmNpcGFsLCAwLCBLUkI1X1RHU19OQU1FKTsKIAkJaWYgKHJldCA9PSAw
KSB7Ci0JCQkvKgotCQkJICogd2UgbmVlZCB0byBzZWFyY2gga3JidGd0LyBsb2NhbGx5Ci0J
CQkgKi8KLQkJCVRBTExPQ19GUkVFKGZyYW1lKTsKLQkJCXJldHVybiAwOworCQkJaWYgKG51
bV9jb21wICE9IDIpIHsKKwkJCQlUQUxMT0NfRlJFRShmcmFtZSk7CisJCQkJcmV0dXJuIFNE
Ql9FUlJfTk9FTlRSWTsKKwkJCX0KKwkJCWdldF9rcmJ0Z3QgPSB0cnVlOwogCQl9CiAKIAkJ
LyoKQEAgLTIyNTIsNiArMjI1MywyNSBAQCBzdGF0aWMga3JiNV9lcnJvcl9jb2RlIHNhbWJh
X2tkY19sb29rdXBfcmVhbG0oa3JiNV9jb250ZXh0IGNvbnRleHQsCiAJCXJldHVybiAwOwog
CX0KIAorCWlmIChnZXRfa3JidGd0KSB7CisJCW9rID0gc3RyZXF1YWwocmVhbG0sIHRkby0+
ZG9tYWluX25hbWUuc3RyaW5nKTsKKwkJaWYgKG9rKSB7CisJCQkvKgorCQkJICogVGhpcyBw
cmluY2lwYWwgaGFzIHRvIGJlIGxvY2FsCisJCQkgKi8KKwkJCVRBTExPQ19GUkVFKGZyYW1l
KTsKKwkJCXJldHVybiAwOworCQl9CisJCW9rID0gc3RyZXF1YWwocmVhbG0sIHRkby0+bmV0
Ymlvc19uYW1lLnN0cmluZyk7CisJCWlmIChvaykgeworCQkJLyoKKwkJCSAqIFRoaXMgcHJp
bmNpcGFsIGhhcyB0byBiZSBsb2NhbAorCQkJICovCisJCQlUQUxMT0NfRlJFRShmcmFtZSk7
CisJCQlyZXR1cm4gMDsKKwkJfQorCX0KKwogCWlmICh0ZG8tPnRydXN0X2F0dHJpYnV0ZXMg
JiBMU0FfVFJVU1RfQVRUUklCVVRFX1dJVEhJTl9GT1JFU1QpIHsKIAkJLyoKIAkJICogVE9E
TzogaGFuZGxlIHRoZSByb3V0aW5nIHdpdGhpbiB0aGUgZm9yZXN0Ci0tIAoyLjE3LjEKCg==
--------------A6BE7FBD35FFAB52AEB2DBEE--

--wkdnoNnjiY2w7qp9R96knUlZBLasFf3Rq--

--1XdQH73WzzYANExlSG64ZKPCfPCQmWrYj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl24UZUACgkQDbX1YShp
vVYldw/+K5okcZam2PHtN28PfA72BYnVEQSv2G8Whg7AU0N70h30ESEREUGR5A5p
7LMUvyB04cwiCV1AU+o9rJWtTIVWvkwYnWVKu3rUWIbqFgM68N2X9V1hp3GTqeOn
0JhBZ6zKMRbaOzoe/aFBYuci+1xRUViG6MjGylbv7DTghMvkh8mBGKsyT6CVzfUq
f9owaA4Mq4zNj1sU4fsWjS3VQLGuE+wRHTK7hJDsCjSkNRHWb+k0NHQJMiMCTrRx
5ndVqHXvPLEeyVWwT+s3zg+ufYoaHSGUpxxbFPZbK1N3mtMZ4/p2SXnqgZJliaOg
2XpNs1+AxEml5Zwnyk3WJx49c7dd6hHKfjYyG23CUAzsQ2PsFKFrCn2EyXP2fdI2
TGOrCbn3ZhonRWjNl54omxv4uR19pWj7nzIjsrGqa2Pc0MEkcIedlMv11y0qUYuu
C4h+ypHNEqW7wqTD0yHpdFEJmFoUlyAsL4JOWTJZA8wJ96UShjAK58xbgh8VbuUk
sB1h7diwCZFmJfRDPKWC6SzAg1dqc4CkbsOjIfroKeGrxyOVNjGnRIjCqWdwfNLN
KT/bze8iVLACqRIHX3jA9U2Ef4fgVcEppBtdfn3M14Pk5DUvflfqSn7cQV3+H+Wf
xR0zJRa8Ab7HzhlBEE73dDX7E1s8SjWjmU7nHx+9kPCMnFxMa+M=
=HRI2
-----END PGP SIGNATURE-----

--1XdQH73WzzYANExlSG64ZKPCfPCQmWrYj--

