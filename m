Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B8865A8021
	for <lists+samba-technical@lfdr.de>; Wed,  4 Sep 2019 12:12:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=ohgR29bAB16NCchTzb8RKqrIyXIJ04zdrf7YXoxNER4=; b=BmPJkXz+FwJlMEhPDIoWKh4FsM
	67URnlI4e1M2/LzMv3hA05MqGodRB1JW6csEiWTOR0mfFoEcvcFe/xnh5FF1tzCG5OTZq6+lIMEXg
	/68mmk7OOpkcCRDsm42kOkaPwt1b5sO15nRpv6VUneL47u7gtv1UjzYbrJf9c46+1EhdTpRxFcnT9
	DJKoLs7v8gtyPFaTwT75/VsIc44X+KgecOc9iGRd/pH16ThuRBGv5BozKgMpd/PnglWto+Hn1PCRz
	Zo5VNh8tDQFWuvFk08DXCpxSvG+iRNmyymCHcAfc3VVmbK0dQwVf/z2qPuWGMFrO8aN6akQhWeAoh
	aZlvQpWA==;
Received: from localhost ([::1]:50522 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i5SGk-003Mcj-7P; Wed, 04 Sep 2019 10:12:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31938) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5SGf-003Mcb-Em
 for samba-technical@lists.samba.org; Wed, 04 Sep 2019 10:12:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=ohgR29bAB16NCchTzb8RKqrIyXIJ04zdrf7YXoxNER4=; b=Jmau/w2Wykzn+F3KK661nT2ra9
 ilD9HksmLRettqm4+DWOmVpDko8wTQjZBq475DvxLWtBnyg92OcWM+0UwFMtRy0H0TTcYIvkjPyVS
 UEuwb4rXRqxmsS3hQnThf9cAMjKxuQm6Qsqwa9pwCamp5sUGdQQl+fGGVs62Oc3ToXsw=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5SGd-0004Tb-RM
 for samba-technical@lists.samba.org; Wed, 04 Sep 2019 10:11:59 +0000
To: Samba Technical <samba-technical@lists.samba.org>
Subject: [PATCH] Fix joining specific ou (regression from #13861)
Openpgp: preference=signencrypt
Message-ID: <555a364d-eeda-cf1e-3fd5-eafb3422f347@samba.org>
Date: Wed, 4 Sep 2019 12:11:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="sKRei5yAvADbJzgcSmuAM32VNGrptRAVf"
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
--sKRei5yAvADbJzgcSmuAM32VNGrptRAVf
Content-Type: multipart/mixed; boundary="Ie9f2Ae3gV6U1u9qTRMwrAjKvX4s1Z59U";
 protected-headers="v1"
From: =?UTF-8?Q?G=c3=bcnther_Deschner?= <gd@samba.org>
To: Samba Technical <samba-technical@lists.samba.org>
Message-ID: <555a364d-eeda-cf1e-3fd5-eafb3422f347@samba.org>
Subject: [PATCH] Fix joining specific ou (regression from #13861)

--Ie9f2Ae3gV6U1u9qTRMwrAjKvX4s1Z59U
Content-Type: multipart/mixed;
 boundary="------------207E046CA13601B7249B9DE9"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------207E046CA13601B7249B9DE9
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

while fixing bug #13861 we brought in a regression via
2044ca0e20bd3180720a82506b3af041d14b5c68 (we check only for LDAP result
code but the result itself). Andreas has a similar patch in his larger
join related patchset but we should first push this isolated join fix.

Please review and push.

Thanks,
Guenther

--=20
G=C3=BCnther Deschner                    GPG-ID: 8EE11688
Red Hat                         gdeschner@redhat.com
Samba Team                              gd@samba.org

--------------207E046CA13601B7249B9DE9
Content-Type: text/plain; charset=UTF-8;
 name="patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="patch"

RnJvbSAwZjYzNTdmNWZjZTJhMjVkZmY5NTdmZmZmYjIzNjI1Mjk1MTI0NGZhIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/Rz1DMz1CQ250aGVyPTIwRGVzY2hu
ZXI/PSA8Z2RAc2FtYmEub3JnPgpEYXRlOiBGcmksIDMwIEF1ZyAyMDE5IDE3OjE5OjUxICsw
MjAwClN1YmplY3Q6IFtQQVRDSF0gczMvbGliYWRzOiBmaXggam9pbmluZyB0byBBRCBhbmQg
c3BlY2lmaWMgb3JnYW5pemF0aW9uYWwKIHVuaXRzCgpCVUc6IGh0dHBzOi8vYnVnemlsbGEu
c2FtYmEub3JnL3Nob3dfYnVnLmNnaT9pZD0xNDExNAoKVGhlIGNoYW5nZSBtYWRlIGluIDIw
NDRjYTBlMjBiZDMxODA3MjBhODI1MDZiM2FmMDQxZDE0YjVjNjggKGZvciAjMTM4NjEpCmRp
ZCBvbmx5IGNoZWNrIHdoZXRoZXIgdGhlIExEQVAgcXVlcnkgd2FzIHN1Y2Nlc3NmdWwsIGl0
IGRpZCBub3QKY2hlY2sgZm9yIHRoZSBMREFQIHJlc3VsdHMuCgpHdWVudGhlcgoKU2lnbmVk
LW9mZi1ieTogR3VlbnRoZXIgRGVzY2huZXIgPGdkQHNhbWJhLm9yZz4KLS0tCiBzb3VyY2Uz
L2xpYmFkcy9sZGFwLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9zb3VyY2UzL2xpYmFkcy9sZGFwLmMgYi9z
b3VyY2UzL2xpYmFkcy9sZGFwLmMKaW5kZXggNGYzZDQzYjAyYjEuLmQ3NzQxZTA5MjBiIDEw
MDY0NAotLS0gYS9zb3VyY2UzL2xpYmFkcy9sZGFwLmMKKysrIGIvc291cmNlMy9saWJhZHMv
bGRhcC5jCkBAIC0yMTIyLDcgKzIxMjIsNyBAQCBBRFNfU1RBVFVTIGFkc19jcmVhdGVfbWFj
aGluZV9hY2N0KEFEU19TVFJVQ1QgKmFkcywKIAogCXJldCA9IGFkc19maW5kX21hY2hpbmVf
YWNjdChhZHMsICZyZXMsIG1hY2hpbmVfZXNjYXBlZCk7CiAJYWRzX21zZ2ZyZWUoYWRzLCBy
ZXMpOwotCWlmIChBRFNfRVJSX09LKHJldCkpIHsKKwlpZiAoQURTX0VSUl9PSyhyZXQpICYm
IGFkc19jb3VudF9yZXBsaWVzKGFkcywgcmVzKSA9PSAxKSB7CiAJCURCR19ERUJVRygiSG9z
dCBhY2NvdW50IGZvciAlcyBhbHJlYWR5IGV4aXN0cy5cbiIsCiAJCQkJbWFjaGluZV9lc2Nh
cGVkKTsKIAkJcmV0ID0gQURTX0VSUk9SX0xEQVAoTERBUF9BTFJFQURZX0VYSVNUUyk7Ci0t
IAoyLjIxLjAKCg==
--------------207E046CA13601B7249B9DE9--

--Ie9f2Ae3gV6U1u9qTRMwrAjKvX4s1Z59U--

--sKRei5yAvADbJzgcSmuAM32VNGrptRAVf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQQi7xTdNz0EbkNwwhJI6TdojuEWiAUCXW+N7wAKCRBI6TdojuEW
iOTxAJ9Vx+BmSYoYaSdiuzsGVWuPpowsbACfa6J19q9D7nf/6k3z8lg3ABDDVhk=
=sMPF
-----END PGP SIGNATURE-----

--sKRei5yAvADbJzgcSmuAM32VNGrptRAVf--

