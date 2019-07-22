Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B88E7009C
	for <lists+samba-technical@lfdr.de>; Mon, 22 Jul 2019 15:11:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=zRugMPP30iBYv3HV1G/czlCTOMVZhctw3eAJCjGoZh8=; b=G+HBA02uSsfx8ragHGU+2yK5YI
	HNLtDaoW643++yA9pdmvTjm8K+dBZDLnLRKcP5qFf0TI6hn4CFn5nbJbJkdMQRgPey9FGcGKALMk0
	N6sWrD6+WkmYhWpdJq1k62jreJohG823hHJAARy6n+QRmA9PjjiMAhc6Rt/mV+9UuyMK9zqLPvvRl
	BvYfc1WLIl4lonhfuYyvOrSkyBFa44gIX9G2GG6J1uzXcahLa8uv+Vmm5cxQdLAo9lDm+vOORD1tr
	FQa5s6erLjfEIEMLMM95zZjaWax0ZehhjmQCq57Wkb+YYCIQte93NvVs2qZTuhU4DpozFWQCzZiVo
	AIY2sINw==;
Received: from localhost ([::1]:63250 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hpY4r-001gPQ-Ah; Mon, 22 Jul 2019 13:10:05 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34736
 helo=mx0a-001b2d01.pphosted.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hpY4m-001gPJ-2q
 for samba-technical@lists.samba.org; Mon, 22 Jul 2019 13:10:02 +0000
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6MD78v5112000
 for <samba-technical@lists.samba.org>; Mon, 22 Jul 2019 09:09:49 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2twdr8g4k4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <samba-technical@lists.samba.org>; Mon, 22 Jul 2019 09:09:48 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <samba-technical@lists.samba.org> from <swen@linux.ibm.com>;
 Mon, 22 Jul 2019 14:09:47 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 22 Jul 2019 14:09:44 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6MD9hnK52953328
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Jul 2019 13:09:43 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD21411C04C;
 Mon, 22 Jul 2019 13:09:43 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B6A811C04A;
 Mon, 22 Jul 2019 13:09:43 +0000 (GMT)
Received: from dhcp-9-244-58-64.kelsterbach.de.ibm.com (unknown [9.244.58.64])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 22 Jul 2019 13:09:43 +0000 (GMT)
Subject: [PATCH] resolv_wrapper: prevent RTLD_DEEPBIND if run with libasan
To: samba-technical <samba-technical@lists.samba.org>, asn@samba.org
Date: Mon, 22 Jul 2019 15:09:38 +0200
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-bbBuEzD8ZTWm+eRtZ+F7"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19072213-0020-0000-0000-00000356257A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19072213-0021-0000-0000-000021AA0B09
Message-Id: <754eb6da79776c66d8df834a0b0f287ab9e09aa1.camel@linux.ibm.com>
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


--=-bbBuEzD8ZTWm+eRtZ+F7
Content-Type: multipart/mixed; boundary="=-5B2M7L/RbIaWDdWH0Tm3"


--=-5B2M7L/RbIaWDdWH0Tm3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The only one missing afer Andreas' update.

Please review and push if happy.

Cheers Swen

--=-5B2M7L/RbIaWDdWH0Tm3
Content-Disposition: attachment; filename="resolv_wrapper.patch"
Content-Transfer-Encoding: base64
Content-Type: text/x-patch; name="resolv_wrapper.patch"; charset="UTF-8"

RnJvbSAyMzkyMjlhYmE5NmI5NWYzNmIyMThhZjEyZGU3MTVlZTdiMWVkODgzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTd2VuIFNjaGlsbGlnIDxzd2VuQGxpbnV4LmlibS5jb20+CkRh
dGU6IE1vbiwgMjIgSnVsIDIwMTkgMTU6MDQ6MjIgKzAyMDAKU3ViamVjdDogW1BBVENIXSByZXNv
bHZfd3JhcHBlcjogcHJldmVudCBSVExEX0RFRVBCSU5EIGlmIHJ1biB3aXRoIGxpYmFzYW4KCklm
IHJ1biB3aXRoIEFTQU4gc2FuaXRpemVyIHdlIGNhbm5vdCB1c2UgUlRMRF9ERUVQQklORCBmbGFn
IGZvciBkbG9wZW4uCgpTaWduZWQtb2ZmLWJ5OiBTd2VuIFNjaGlsbGlnIDxzd2VuQGxpbnV4Lmli
bS5jb20+Ci0tLQogdGhpcmRfcGFydHkvcmVzb2x2X3dyYXBwZXIvcmVzb2x2X3dyYXBwZXIuYyB8
IDIwICsrKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3RoaXJkX3BhcnR5L3Jlc29sdl93cmFwcGVy
L3Jlc29sdl93cmFwcGVyLmMgYi90aGlyZF9wYXJ0eS9yZXNvbHZfd3JhcHBlci9yZXNvbHZfd3Jh
cHBlci5jCmluZGV4IDQ4MDE4YmU4MDM5Li5iYTZjNjZlNWYzOSAxMDA2NDQKLS0tIGEvdGhpcmRf
cGFydHkvcmVzb2x2X3dyYXBwZXIvcmVzb2x2X3dyYXBwZXIuYworKysgYi90aGlyZF9wYXJ0eS9y
ZXNvbHZfd3JhcHBlci9yZXNvbHZfd3JhcHBlci5jCkBAIC0xMTM3LDcgKzExMzcsMjUgQEAgc3Rh
dGljIHZvaWQgKnJ3cmFwX2xvYWRfbGliX2hhbmRsZShlbnVtIHJ3cmFwX2xpYiBsaWIpCiAJaW50
IGk7CiAKICNpZmRlZiBSVExEX0RFRVBCSU5ECi0JZmxhZ3MgfD0gUlRMRF9ERUVQQklORDsKKwlj
b25zdCBjaGFyICplbnZfcHJlbG9hZCA9IGdldGVudigiTERfUFJFTE9BRCIpOworCWNvbnN0IGNo
YXIgKmVudl9kZWVwYmluZCA9IGdldGVudigiUkVTT0xWX1dSQVBQRVJfRElTQUJMRV9ERUVQQklO
RCIpOworCWJvb2wgZW5hYmxlX2RlZXBiaW5kID0gdHJ1ZTsKKworCS8qIERvbid0IGRvIGEgZGVl
cGJpbmQgaWYgd2UgcnVuIHdpdGggbGliYXNhbiAqLworCWlmIChlbnZfcHJlbG9hZCAhPSBOVUxM
ICYmIHN0cmxlbihlbnZfcHJlbG9hZCkgPCAxMDI0KSB7CisJCWNvbnN0IGNoYXIgKnAgPSBzdHJz
dHIoZW52X3ByZWxvYWQsICJsaWJhc2FuLnNvIik7CisJCWlmIChwICE9IE5VTEwpIHsKKwkJCWVu
YWJsZV9kZWVwYmluZCA9IGZhbHNlOworCQl9CisJfQorCisJaWYgKGVudl9kZWVwYmluZCAhPSBO
VUxMICYmIHN0cmxlbihlbnZfZGVlcGJpbmQpID49IDEpIHsKKwkJZW5hYmxlX2RlZXBiaW5kID0g
ZmFsc2U7CisJfQorCisJaWYgKGVuYWJsZV9kZWVwYmluZCkgeworCQlmbGFncyB8PSBSVExEX0RF
RVBCSU5EOworCX0KICNlbmRpZgogCiAJc3dpdGNoIChsaWIpIHsKLS0gCjIuMjAuMQoK


--=-5B2M7L/RbIaWDdWH0Tm3--

--=-bbBuEzD8ZTWm+eRtZ+F7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErGbWt5PHCTgy2J0tug2knLYPYasFAl01tZIACgkQug2knLYP
YaukZw//fj9xvl64iyfKQQlAwgkUrhQRGvqVdutYuKQXy5EwKOau2bD9lgZu4CJn
U1ws69i3zU8TEk4M6U+Tw9IVDG/e33ksI7hMFzHMl/UXSS26NdVijClLvUF/lFcK
gTpP8/8SwCD4xYrr6L2c5PEi7Mv8f6WOlzuK9/cYEtfM/maM12/t5rYEPdpcXBP/
o4kO/mCgCUOAxTk3tSHkKqWpw36P0NTQmc30Vs7Avvw9NIOirpiwWT4cLtRJhyy6
LkrN+aB+YUYCgNoSYAiRWbGOeCk6p22SaEWy2mC0dho9N3RT9wOc3Ca2Vs+Az7IG
F1GhZoe5yOMQ9Bv+wKY9BVoX+CWzO8NCSRlEWaBSieAbW9mIoT/2MnosXAmSLfob
2D2af1eDz2W72qi1xxFItxXRuF4Ql1nlNQmpnjPB1SAVp5/eog85bXlxkV7k5ml/
oBgJfsgXpIYFCVXOMc+/MwdUze2Dc4/7KpR+9JLIqi9VQNCyGOUCuENit0NrQ/iC
b7wxNSRMmJJnwOqdlEgwXaiTgfD9mvsbA9SLdChcQZELKMOo72z9xiTPlxHlCWI5
WuvnHFmnzEWsrQK4suV2+LcIUWQHctdidFV01o33ZxxARjKFxwofXL7RBOtdYqQ4
xmZdtCo7S0D+KhnsQlRrTkglE6EoVb/IanrD9cKdw/ZF+cYgWYo=
=SAOo
-----END PGP SIGNATURE-----

--=-bbBuEzD8ZTWm+eRtZ+F7--


