Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CC38A7BE41
	for <lists+samba-technical@lfdr.de>; Wed, 31 Jul 2019 12:21:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=tJldAghRkjkbBuT78VNbbxTygYAYavnIBh+cu05Mqb8=; b=Y0quWmATf6c/Fw+W++gBcIgq+I
	UvULMUzb1re1TZsyedUiyLIlGT6AbKRrdr7YLXLI9jfDY9dF3knGNwJmq1MFF+xcZE+sjGTWNbmFw
	xFxzUvpnJ/DfALb6Cn2njwSLZkePBYvUFVbEMZNgSoa0cK2Y0GO32KL4Wl+2ALjykvnLFFtwWLUIl
	CHwpFiibD0UxIW4/C+L9oHPr6dk4fsX28f6NMNmq0yv8hY91hkDs1MQ/75Hs1WnX3ExvlcALiULkf
	5s9rcjFvYBIrpTah1CL8+k+yQ4mYbJ3OT3vnFXa7ehXGd6iA2kA9aJmbAAemX/S6PRicxrVfyLQq1
	mJ6bueQg==;
Received: from localhost ([::1]:30896 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hsljZ-001Gtc-Lm; Wed, 31 Jul 2019 10:21:25 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:62706
 helo=mx0a-001b2d01.pphosted.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hsljU-001Grt-JY
 for samba-technical@lists.samba.org; Wed, 31 Jul 2019 10:21:23 +0000
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6VAH3X0131980
 for <samba-technical@lists.samba.org>; Wed, 31 Jul 2019 06:21:11 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2u390hgc73-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <samba-technical@lists.samba.org>; Wed, 31 Jul 2019 06:21:10 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <samba-technical@lists.samba.org> from <swen@linux.ibm.com>;
 Wed, 31 Jul 2019 11:21:09 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 31 Jul 2019 11:21:07 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6VAL6pA53870814
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <samba-technical@lists.samba.org>; Wed, 31 Jul 2019 10:21:06 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4CB7042042
 for <samba-technical@lists.samba.org>; Wed, 31 Jul 2019 10:21:06 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3BF7F42041
 for <samba-technical@lists.samba.org>; Wed, 31 Jul 2019 10:21:06 +0000 (GMT)
Received: from sig-9-145-21-34.uk.ibm.com (unknown [9.145.21.34])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <samba-technical@lists.samba.org>; Wed, 31 Jul 2019 10:21:06 +0000 (GMT)
Subject: [PATCH]
To: samba-technical <samba-technical@lists.samba.org>
Date: Wed, 31 Jul 2019 12:20:57 +0200
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-nXz7AfvcI2CEN79G3MNK"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19073110-0028-0000-0000-0000038997EC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19073110-0029-0000-0000-00002449E840
Message-Id: <8afdd354536d6fa626d724b961f7972e09028435.camel@linux.ibm.com>
X-Warn: EHLO/HELO not verified: Remote host 148.163.158.5
 (mx0b-001b2d01.pphosted.com) incorrectly presented itself as
 mx0a-001b2d01.pphosted.com
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
From: swen via samba-technical <samba-technical@lists.samba.org>
Reply-To: swen@linux.ibm.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--=-nXz7AfvcI2CEN79G3MNK
Content-Type: multipart/mixed; boundary="=-8S0TnuJF3sSNEMLopJAM"


--=-8S0TnuJF3sSNEMLopJAM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Patchset containing 2 small fixes for possible memleaks in error
scenarios.

Patchset passed gitlab-ci test runs and a merge requet is created.

https://gitlab.com/samba-team/samba/merge_requests/679

Please review and push if happy.

Thanks for your support in advance.

Cheers Swen

--=-8S0TnuJF3sSNEMLopJAM
Content-Disposition: attachment; filename="patch.txt"
Content-Transfer-Encoding: base64
Content-Type: text/plain; name="patch.txt"; charset="UTF-8"

RnJvbSAxMDhhYjU1N2ZjODA3Y2QyMjg5YTU2NjAxYjA1NDcxODIyMzM2NTAxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTd2VuIFNjaGlsbGlnIDxzd2VuQGxpbnV4LmlibS5jb20+CkRh
dGU6IFdlZCwgMzEgSnVsIDIwMTkgMTA6MTU6MTcgKzAyMDAKU3ViamVjdDogW1BBVENIIDEvMl0g
bGRiOiBQcmV2ZW50IG1lbS1sZWFrIGluIGVycm9yIGNhc2UKCkZyZWUgcHJldmlvdXNseSBhbGxv
Y3RlZCBtZW1vcnkgaWYgbmV3IGFsbG9jIGZhaWxzCgpTaWduZWQtb2ZmLWJ5OiBTd2VuIFNjaGls
bGlnIDxzd2VuQGxpbnV4LmlibS5jb20+Ci0tLQogbGliL2xkYi9jb21tb24vbGRiX2RuLmMgfCAx
ICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2xpYi9sZGIv
Y29tbW9uL2xkYl9kbi5jIGIvbGliL2xkYi9jb21tb24vbGRiX2RuLmMKaW5kZXggZWNjYjRhMGNl
NGIuLjYyZjU0M2NmNDUyIDEwMDY0NAotLS0gYS9saWIvbGRiL2NvbW1vbi9sZGJfZG4uYworKysg
Yi9saWIvbGRiL2NvbW1vbi9sZGJfZG4uYwpAQCAtMzQwLDYgKzM0MCw3IEBAIHN0YXRpYyBib29s
IGxkYl9kbl9leHBsb2RlKHN0cnVjdCBsZGJfZG4gKmRuKQogCS8qIENvbXBvbmVudHMgZGF0YSBz
cGFjZSBpcyBhbGxvY2F0ZWQgaGVyZSBvbmNlICovCiAJZGF0YSA9IHRhbGxvY19hcnJheShkbi0+
Y29tcG9uZW50cywgY2hhciwgc3RybGVuKHBhcnNlX2RuKSArIDEpOwogCWlmICghZGF0YSkgewor
CQlMREJfRlJFRShkbi0+Y29tcG9uZW50cyk7CiAJCXJldHVybiBmYWxzZTsKIAl9CiAKLS0gCjIu
MjAuMQoKCkZyb20gY2U2NGRmN2Y5ZDRkODA4ZGQzM2FmOTA3NWY5ZGRlNjNmNTY2ODE0MSBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKRnJvbTogU3dlbiBTY2hpbGxpZyA8c3dlbkBsaW51eC5pYm0u
Y29tPgpEYXRlOiBXZWQsIDMxIEp1bCAyMDE5IDEwOjI3OjM3ICswMjAwClN1YmplY3Q6IFtQQVRD
SCAyLzJdIGxkYjogRml4IG1lbS1sZWFrIGlmIHRhbGxvY19yZWFsbG9jIGZhaWxzCgpJbiBjYXNl
IG9mIGEgZmFpbGluZyB0YWxsb2NfcmVhbGxvYygpLCB0aGUgb25seSByZWZlcmVuY2UKdG8gdGhl
IG9yaWdpbmFsbHkgYWxsb2NhdGVkIG1lbW9yeSBpcyBvdmVyd3JpdHRlbi4KSW5zdGVhZCB1c2Ug
YSB0ZW1wIHZhciB1bnRpbCBzdWNjZXNzIGlzIHZlcmlmaWVkLgoKU2lnbmVkLW9mZi1ieTogU3dl
biBTY2hpbGxpZyA8c3dlbkBsaW51eC5pYm0uY29tPgotLS0KIGxpYi9sZGIvY29tbW9uL2xkYl9k
bi5jIHwgMTUgKysrKysrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9saWIvbGRiL2NvbW1vbi9sZGJfZG4uYyBi
L2xpYi9sZGIvY29tbW9uL2xkYl9kbi5jCmluZGV4IDYyZjU0M2NmNDUyLi5jY2M1ZWEzMjlkZiAx
MDA2NDQKLS0tIGEvbGliL2xkYi9jb21tb24vbGRiX2RuLmMKKysrIGIvbGliL2xkYi9jb21tb24v
bGRiX2RuLmMKQEAgLTM3Nyw2ICszNzcsNyBAQCBzdGF0aWMgYm9vbCBsZGJfZG5fZXhwbG9kZShz
dHJ1Y3QgbGRiX2RuICpkbikKIAkJCX0KIAogCQkJaWYgKGluX2V4X3ZhbHVlICYmICpwID09ICc+
JykgeworCQkJCXN0cnVjdCBsZGJfZG5fZXh0X2NvbXBvbmVudCAqZXh0X2NvbXAgPSBOVUxMOwog
CQkJCWNvbnN0IHN0cnVjdCBsZGJfZG5fZXh0ZW5kZWRfc3ludGF4ICpleHRfc3ludGF4OwogCQkJ
CXN0cnVjdCBsZGJfdmFsIGV4X3ZhbCA9IHsKIAkJCQkJLmRhdGEgPSAodWludDhfdCAqKWV4X3Zh
bHVlLApAQCAtMzg5LDE1ICszOTAsMTkgQEAgc3RhdGljIGJvb2wgbGRiX2RuX2V4cGxvZGUoc3Ry
dWN0IGxkYl9kbiAqZG4pCiAKIAkJCQkvKiBQcm9jZXNzIG5hbWUgYW5kIGV4X3ZhbHVlICovCiAK
LQkJCQlkbi0+ZXh0X2NvbXBvbmVudHMgPSB0YWxsb2NfcmVhbGxvYyhkbiwKLQkJCQkJCQkJICAg
IGRuLT5leHRfY29tcG9uZW50cywKLQkJCQkJCQkJICAgIHN0cnVjdCBsZGJfZG5fZXh0X2NvbXBv
bmVudCwKLQkJCQkJCQkJICAgIGRuLT5leHRfY29tcF9udW0gKyAxKTsKLQkJCQlpZiAoICEgZG4t
PmV4dF9jb21wb25lbnRzKSB7CisJCQkJZXh0X2NvbXAgPQorCQkJCQl0YWxsb2NfcmVhbGxvYyhk
biwKKwkJCQkJCSAgICAgICBkbi0+ZXh0X2NvbXBvbmVudHMsCisJCQkJCQkgICAgICAgc3RydWN0
IGxkYl9kbl9leHRfY29tcG9uZW50LAorCQkJCQkJICAgICAgIGRuLT5leHRfY29tcF9udW0gKyAx
KTsKKworCQkJCWlmIChleHRfY29tcCA9PSBOVUxMKSB7CiAJCQkJCS8qIG91Y2ggISAqLwogCQkJ
CQlnb3RvIGZhaWxlZDsKIAkJCQl9CiAKKwkJCQlkbi0+ZXh0X2NvbXBvbmVudHMgPSBleHRfY29t
cDsKKwogCQkJCWV4dF9zeW50YXggPSBsZGJfZG5fZXh0ZW5kZWRfc3ludGF4X2J5X25hbWUoZG4t
PmxkYiwgZXhfbmFtZSk7CiAJCQkJaWYgKCFleHRfc3ludGF4KSB7CiAJCQkJCS8qIFdlIGRvbid0
IGtub3cgYWJvdXQgdGhpcyB0eXBlIG9mIGV4dGVuZGVkIEROICovCi0tIAoyLjIwLjEKCg==


--=-8S0TnuJF3sSNEMLopJAM--

--=-nXz7AfvcI2CEN79G3MNK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErGbWt5PHCTgy2J0tug2knLYPYasFAl1Ba4kACgkQug2knLYP
YatyURAAhZFxxV6z4AYJnlXbsJWdiOsa567859YmCJWYyn+aGUW17QisUTSoKQUX
Ysm22jSvgFrNG4c0T3fHi/T1VkFEV++VFU/CRvMsDLO8htWtVT3c683HfQpbKnqP
sFoFrsex4AvF8QhzdbX69o9uUc+xcfbdvzZfzz48C3LRUd6b806W8Q5fhDGmqppx
4FYEZMa0/+IsBDV/qJRndR1nYsafZL5rSxiGQJr1Bzyu+rTojxctZeW60M7BjFKP
S7gxJpGLO64SfWFpKtr/bAVM6ypjt03DfnyVlLUGkCj6q7EGEQvyK5Ux+sTuy2/9
Dtu/U7xr40Aomdn09a1+UsMRhEJYcx5oe6fNwcGRCcYkLHgXAB7pCx2YeTw5skSl
B9Lh8K1neUhN/PFFVEa95HKLIVdt66RpCUfQVB4ooEE9q5ClNsg/zitljGwqqg4O
XcpkmfLjvFxdRjI0VPWmY0LihB6R7E+6OM+wTed2aEtWSsthXXX3N7NFfzxjNvJe
uJbO2bfEsD9DhEFZGxSaw8kQ5UfHCjfsoCxR1oZhTviwglcoJTVlIQk43bOsAsJz
o3cnrhDeAKOCd8MQ0BiHp6hKnSM+jcoH2pdcQP+3bXJ49NWiuAnRkZ0ZUX26Ydu7
PcEhlbI0hGC2+dBCqKL0Gy0NS7QD33wRur91OvMmv+Y16nitq34=
=cLOA
-----END PGP SIGNATURE-----

--=-nXz7AfvcI2CEN79G3MNK--


