Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F531B1AC4
	for <lists+samba-technical@lfdr.de>; Fri, 13 Sep 2019 11:29:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=mEwceAYB17RW+xX/8YQvBA7emuxELpDZ35cKRyGrCts=; b=n2d+zDjWcyLj4cOpBKdT5dTlKy
	LP3A+Bmf6/CiFJfj9wUm0bgF42YW2NpV+fRVgUlUl3RxFtW8UVmRHLs5MhdUYMcqQ3xKIkyzy30t+
	X0/KjSsuE872i8evOWAdcngoZ1cYDUYmlPVGrpmufGBK/RZrVnhz4jrucoKziPnbvT5abBrOuSKr6
	bByyMuSFYwHlWGoT4RT3Yqmy+X2ROZfBQBDkUktox8mu1+/kCtJkxk0SgZHjw48hCsFoIrGsa2SOJ
	87cmfDq0GIbavClnNe7SAsqKFLoR8AOHyogVUhwnWeNxnzjKeWPrExyDnHNjGTM1Cz/RC2kxYU10V
	E9l/sQ8Q==;
Received: from localhost ([::1]:46810 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i8hsz-005CWE-NZ; Fri, 13 Sep 2019 09:29:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42148) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i8hsv-005CW7-1y
 for samba-technical@lists.samba.org; Fri, 13 Sep 2019 09:28:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=mEwceAYB17RW+xX/8YQvBA7emuxELpDZ35cKRyGrCts=; b=dYENawQAdq3jTLPgIqGVcsP+DX
 0gwwgw78DeLT+kGm63tdDDMEvIQp69gxm8dsnmGW54Ub9hUsYU3BmNhN90oprfMxNFZ7nxIpiFQJu
 3zS44yAuylSe5LDlx2dqC/KOS0bnpNqk5YU2J4I6YJmqMyQh9QNEbCOqafNTd7QtxZe8=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i8hsu-0007g4-7U
 for samba-technical@lists.samba.org; Fri, 13 Sep 2019 09:28:56 +0000
To: Samba Technical <samba-technical@lists.samba.org>
Subject: [PATCH] add new lsa trust attributes
Openpgp: preference=signencrypt
Message-ID: <eca08ad5-2980-57ef-eb77-ba5cdb3bd95a@samba.org>
Date: Fri, 13 Sep 2019 11:28:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="oCZA9IePJDChkCTs6srKCceBsDExV2z7N"
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
From: =?utf-8?q?G=C3=BCnther_Deschner_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?G=c3=bcnther_Deschner?= <gd@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oCZA9IePJDChkCTs6srKCceBsDExV2z7N
Content-Type: multipart/mixed; boundary="C9DFXyQHecvcMFpZgJWKI3gWmTuO48xVp";
 protected-headers="v1"
From: =?UTF-8?Q?G=c3=bcnther_Deschner?= <gd@samba.org>
To: Samba Technical <samba-technical@lists.samba.org>
Message-ID: <eca08ad5-2980-57ef-eb77-ba5cdb3bd95a@samba.org>
Subject: [PATCH] add new lsa trust attributes

--C9DFXyQHecvcMFpZgJWKI3gWmTuO48xVp
Content-Type: multipart/mixed;
 boundary="------------60B3924E5496E0F114968F76"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------60B3924E5496E0F114968F76
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

attached a patch to add the new lsa trust attributes. There is currently
a winbind forest trust issue related to the use of the new flags,
winbind patch to follow.

Please review and push.

Tuanks,
Guenther
--=20
G=C3=BCnther Deschner                    GPG-ID: 8EE11688
Red Hat                         gdeschner@redhat.com
Samba Team                              gd@samba.org

--------------60B3924E5496E0F114968F76
Content-Type: text/plain; charset=UTF-8;
 name="patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="patch"

RnJvbSA3ZTEyOWQxOTE1Yjk2NDI5M2E1MTBhMTY0ZDU5NDI3YzQwMjA4YWIyIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/Rz1DMz1CQ250aGVyPTIwRGVzY2hu
ZXI/PSA8Z2RAc2FtYmEub3JnPgpEYXRlOiBUaHUsIDEyIFNlcCAyMDE5IDE2OjM2OjIwICsw
MjAwClN1YmplY3Q6IFtQQVRDSCAxLzJdIGxzYTogZG9jdW1lbnQgbmV3IExTQSB0cnVzdCBh
dHRyaWJ1dGVzCgpHdWVudGhlcgoKU2lnbmVkLW9mZi1ieTogR3VlbnRoZXIgRGVzY2huZXIg
PGdkQHNhbWJhLm9yZz4KLS0tCiBsaWJycGMvaWRsL2xzYS5pZGwgfCAxOSArKysrKysrKysr
Ky0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9saWJycGMvaWRsL2xzYS5pZGwgYi9saWJycGMvaWRsL2xz
YS5pZGwKaW5kZXggZWE4YTQyNmZhMDEuLjM5ZWQzYmU4MjYyIDEwMDY0NAotLS0gYS9saWJy
cGMvaWRsL2xzYS5pZGwKKysrIGIvbGlicnBjL2lkbC9sc2EuaWRsCkBAIC03MDIsMTQgKzcw
MiwxNyBAQCBpbXBvcnQgIm1pc2MuaWRsIiwgInNlY3VyaXR5LmlkbCI7CiAJfSBsc2FfVHJ1
c3RUeXBlOwogCiAJdHlwZWRlZiBbcHVibGljLGJpdG1hcDMyYml0XSBiaXRtYXAgewotCQlM
U0FfVFJVU1RfQVRUUklCVVRFX05PTl9UUkFOU0lUSVZFICAgICAgPSAweDAwMDAwMDAxLAot
CQlMU0FfVFJVU1RfQVRUUklCVVRFX1VQTEVWRUxfT05MWSAgICAgICAgPSAweDAwMDAwMDAy
LAotCQlMU0FfVFJVU1RfQVRUUklCVVRFX1FVQVJBTlRJTkVEX0RPTUFJTiAgPSAweDAwMDAw
MDA0LAotCQlMU0FfVFJVU1RfQVRUUklCVVRFX0ZPUkVTVF9UUkFOU0lUSVZFICAgPSAweDAw
MDAwMDA4LAotCQlMU0FfVFJVU1RfQVRUUklCVVRFX0NST1NTX09SR0FOSVpBVElPTiAgPSAw
eDAwMDAwMDEwLAotCQlMU0FfVFJVU1RfQVRUUklCVVRFX1dJVEhJTl9GT1JFU1QgICAgICAg
PSAweDAwMDAwMDIwLAotCQlMU0FfVFJVU1RfQVRUUklCVVRFX1RSRUFUX0FTX0VYVEVSTkFM
ICAgPSAweDAwMDAwMDQwLAotCQlMU0FfVFJVU1RfQVRUUklCVVRFX1VTRVNfUkM0X0VOQ1JZ
UFRJT04gPSAweDAwMDAwMDgwCisJCUxTQV9UUlVTVF9BVFRSSUJVVEVfTk9OX1RSQU5TSVRJ
VkUJCQkJPSAweDAwMDAwMDAxLAorCQlMU0FfVFJVU1RfQVRUUklCVVRFX1VQTEVWRUxfT05M
WQkJCQk9IDB4MDAwMDAwMDIsCisJCUxTQV9UUlVTVF9BVFRSSUJVVEVfUVVBUkFOVElORURf
RE9NQUlOCQkJCT0gMHgwMDAwMDAwNCwKKwkJTFNBX1RSVVNUX0FUVFJJQlVURV9GT1JFU1Rf
VFJBTlNJVElWRQkJCQk9IDB4MDAwMDAwMDgsCisJCUxTQV9UUlVTVF9BVFRSSUJVVEVfQ1JP
U1NfT1JHQU5JWkFUSU9OCQkJCT0gMHgwMDAwMDAxMCwKKwkJTFNBX1RSVVNUX0FUVFJJQlVU
RV9XSVRISU5fRk9SRVNUCQkJCT0gMHgwMDAwMDAyMCwKKwkJTFNBX1RSVVNUX0FUVFJJQlVU
RV9UUkVBVF9BU19FWFRFUk5BTAkJCQk9IDB4MDAwMDAwNDAsCisJCUxTQV9UUlVTVF9BVFRS
SUJVVEVfVVNFU19SQzRfRU5DUllQVElPTgkJCQk9IDB4MDAwMDAwODAsCisJCUxTQV9UUlVT
VF9BVFRSSUJVVEVfQ1JPU1NfT1JHQU5JWkFUSU9OX05PX1RHVF9ERUxFR0FUSU9OCT0gMHgw
MDAwMDIwMCwKKwkJTFNBX1RSVVNUX0FUVFJJQlVURV9QSU1fVFJVU1QJCQkJCT0gMHgwMDAw
MDQwMCwKKwkJTFNBX1RSVVNUX0FUVFJJQlVURV9DUk9TU19PUkdBTklaQVRJT05fRU5BQkxF
X1RHVF9ERUxFR0FUSU9OCT0gMHgwMDAwMDgwMAogCX0gbHNhX1RydXN0QXR0cmlidXRlczsK
IAogCXR5cGVkZWYgc3RydWN0IHsKLS0gCjIuMjEuMAoKCkZyb20gZTc4ZTIwOTFiMmIzMGIy
MmJhMWU1YWIyMjZkZGM3ZjZmYTI2NDE3MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKRnJv
bTogPT9VVEYtOD9xP0c9QzM9QkNudGhlcj0yMERlc2NobmVyPz0gPGdkQHNhbWJhLm9yZz4K
RGF0ZTogVGh1LCAxMiBTZXAgMjAxOSAyMzoyNzoxMyArMDIwMApTdWJqZWN0OiBbUEFUQ0gg
Mi8yXSBtaXNjOiBmaXggQUQgdHJ1c3QgYXR0cmlidXRlcyBpbiBhZHNzZWFyY2gKCkd1ZW50
aGVyCgpTaWduZWQtb2ZmLWJ5OiBHdWVudGhlciBEZXNjaG5lciA8Z2RAc2FtYmEub3JnPgot
LS0KIGV4YW1wbGVzL21pc2MvYWRzc2VhcmNoLnBsIHwgMTcgKysrKysrKysrKysrLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2V4YW1wbGVzL21pc2MvYWRzc2VhcmNoLnBsIGIvZXhhbXBsZXMvbWlzYy9h
ZHNzZWFyY2gucGwKaW5kZXggN2MzNTcwYWJkNmUuLmZjMjQ4MTFiNjI2IDEwMDc1NQotLS0g
YS9leGFtcGxlcy9taXNjL2Fkc3NlYXJjaC5wbAorKysgYi9leGFtcGxlcy9taXNjL2Fkc3Nl
YXJjaC5wbApAQCAtMjg1LDEwICsyODUsMTcgQEAgbXkgJWFkc19zZGVmZmVjdGl2ZSA9ICgK
ICk7CiAKIG15ICVhZHNfdHJ1c3RhdHRycyA9ICgKLQkiVFJVU1RfQVRUUklCVVRFX05PTl9U
UkFOU0lUSVZFIgk9PiAxLAotCSJUUlVTVF9BVFRSSUJVVEVfVFJFRV9QQVJFTlQiCQk9PiAy
LAotCSJUUlVTVF9BVFRSSUJVVEVfVFJFRV9ST09UIgkJPT4gMywKLQkiVFJVU1RfQVRUUklC
VVRFX1VQTEVWRUxfT05MWSIJCT0+IDQsCisJIlRSVVNUX0FUVFJJQlVURV9OT05fVFJBTlNJ
VElWRSIJCQkJPT4gMHgwMDAwMDAwMSwKKwkiVFJVU1RfQVRUUklCVVRFX1VQTEVWRUxfT05M
WSIJCQkJCT0+IDB4MDAwMDAwMDIsCisJIlRSVVNUX0FUVFJJQlVURV9RVUFSQU5USU5FRF9E
T01BSU4iCQkJCT0+IDB4MDAwMDAwMDQsCisJIlRSVVNUX0FUVFJJQlVURV9GT1JFU1RfVFJB
TlNJVElWRSIJCQkJPT4gMHgwMDAwMDAwOCwKKwkiVFJVU1RfQVRUUklCVVRFX0NST1NTX09S
R0FOSVpBVElPTiIJCQkJPT4gMHgwMDAwMDAxMCwKKwkiVFJVU1RfQVRUUklCVVRFX1dJVEhJ
Tl9GT1JFU1QiCQkJCQk9PiAweDAwMDAwMDIwLAorCSJUUlVTVF9BVFRSSUJVVEVfVFJFQVRf
QVNfRVhURVJOQUwiCQkJCT0+IDB4MDAwMDAwNDAsCisJIlRSVVNUX0FUVFJJQlVURV9VU0VT
X1JDNF9FTkNSWVBUSU9OIgkJCQk9PiAweDAwMDAwMDgwLAorCSJUUlVTVF9BVFRSSUJVVEVf
Q1JPU1NfT1JHQU5JWkFUSU9OX05PX1RHVF9ERUxFR0FUSU9OIgkJPT4gMHgwMDAwMDIwMCwK
KwkiVFJVU1RfQVRUUklCVVRFX1BJTV9UUlVTVCIJCQkJCT0+IDB4MDAwMDA0MDAsCisJIlRS
VVNUX0FUVFJJQlVURV9DUk9TU19PUkdBTklaQVRJT05fRU5BQkxFX1RHVF9ERUxFR0FUSU9O
Igk9PiAweDAwMDAwODAwLAogKTsKIAogbXkgJWFkc190cnVzdGRpcmVjdGlvbiA9ICgKQEAg
LTEyODMsNyArMTI5MCw3IEBAIHN1YiBkdW1wX3NkZWZmZWN0aXZlIHsKIH0KIAogc3ViIGR1
bXBfdHJ1c3RhdHRyIHsKLQlyZXR1cm4gZHVtcF9iaXRtYXNrX2VxdWFsKEBfLCVhZHNfdHJ1
c3RhdHRycyk7CisJcmV0dXJuIGR1bXBfYml0bWFza19hbmQoQF8sJWFkc190cnVzdGF0dHJz
KTsKIH0KIAogc3ViIGR1bXBfdHJ1c3R0eXBlIHsKLS0gCjIuMjEuMAoK
--------------60B3924E5496E0F114968F76--

--C9DFXyQHecvcMFpZgJWKI3gWmTuO48xVp--

--oCZA9IePJDChkCTs6srKCceBsDExV2z7N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQQi7xTdNz0EbkNwwhJI6TdojuEWiAUCXXthTwAKCRBI6TdojuEW
iMyLAJ9c669dD9cQvBnA3qdRe/ADetMngwCfUfN0zlymPUISVkUgKgjtT8RxiY4=
=H3oU
-----END PGP SIGNATURE-----

--oCZA9IePJDChkCTs6srKCceBsDExV2z7N--

