Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D2E7BDFF
	for <lists+samba-technical@lfdr.de>; Wed, 31 Jul 2019 12:07:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=1R7KneQt2NayayBr0W3gdW83EoL1yWfWYJWickRARtw=; b=sxMOA/x1n32YLkQJunrPOXohu0
	W9zktQTnd8sqxLRAKNz6bdnWqKv8IhPe/M4sj7PGisF/JNS+o+sXoxkew3ypI3qV2S0stKPEYDJXU
	nEy74xlYq/U0FrCEwBVWuiTz3Y9YpwChpj/SlOu5hIkbwrRQHh76bJ01KKdI6Z85oaGErXwfP5mvp
	dlOJmjIRLasyNgdMlTi65ixUz5+Cm2p2lx1er50F14rtaDKcUYcAuXVPjszBDVGfev4epDt9f9rZ3
	7m5HIq1l1Gf5EferIlZx4PZm2sARgrcZI2jSlAm3bkEs2q3LVUAK19Yb/btnc/OKeVpPfvseiYkTA
	nE4qcCHw==;
Received: from localhost ([::1]:59810 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hslWB-001EQ5-8f; Wed, 31 Jul 2019 10:07:35 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:62484) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hslW6-001EPy-Hk
 for samba-technical@lists.samba.org; Wed, 31 Jul 2019 10:07:33 +0000
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6VA706R038030
 for <samba-technical@lists.samba.org>; Wed, 31 Jul 2019 06:07:25 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2u37j2m5ah-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <samba-technical@lists.samba.org>; Wed, 31 Jul 2019 06:07:25 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <samba-technical@lists.samba.org> from <swen@linux.ibm.com>;
 Wed, 31 Jul 2019 11:07:23 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 31 Jul 2019 11:07:19 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6VA7IZP20119786
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <samba-technical@lists.samba.org>; Wed, 31 Jul 2019 10:07:18 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E61E11C04C
 for <samba-technical@lists.samba.org>; Wed, 31 Jul 2019 10:07:18 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 830A411C058
 for <samba-technical@lists.samba.org>; Wed, 31 Jul 2019 10:07:18 +0000 (GMT)
Received: from sig-9-145-21-34.uk.ibm.com (unknown [9.145.21.34])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <samba-technical@lists.samba.org>; Wed, 31 Jul 2019 10:07:18 +0000 (GMT)
Subject: [PATCH] registry: Free memory at the end of each loop run to
 prevent mem leak
To: samba-technical <samba-technical@lists.samba.org>
Date: Wed, 31 Jul 2019 12:07:18 +0200
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-uxiBZNmhPiFHh96HS+VI"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19073110-0008-0000-0000-000003028C09
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19073110-0009-0000-0000-0000227030ED
Message-Id: <a3fffe5bb10a74e4cdbf3815e99c9ebbe9cee1b0.camel@linux.ibm.com>
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


--=-uxiBZNmhPiFHh96HS+VI
Content-Type: multipart/mixed; boundary="=-hbtVe8IbcX6D1i/RzMau"


--=-hbtVe8IbcX6D1i/RzMau
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Small patch preventing a memleak.

Passed all gitlab-ci tests and a merge request is created.

https://gitlab.com/samba-team/samba/merge_requests/678

Please review and push if happy.

Thanks for your support in advance.

Cheers Swen


--=-hbtVe8IbcX6D1i/RzMau
Content-Disposition: attachment; filename="patch.txt"
Content-Transfer-Encoding: base64
Content-Type: text/plain; name="patch.txt"; charset="UTF-8"

RnJvbSBkYWZmZmI1NThhZmRmNWMyZTJkZWZiZTVjZWUxZGE1NWE4YjU2N2ExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTd2VuIFNjaGlsbGlnIDxzd2VuQGxpbnV4LmlibS5jb20+CkRh
dGU6IE1vbiwgMjkgSnVsIDIwMTkgMTU6Mjc6NTggKzAyMDAKU3ViamVjdDogW1BBVENIXSByZWdp
c3RyeTogRnJlZSBtZW1vcnkgYXQgdGhlIGVuZCBvZiBlYWNoIGxvb3AgcnVuIHRvIHByZXZlbnQK
IG1lbSBsZWFrCgpGb3VuZCBkdXJpbmcgdG9ydHVyZSB0ZXN0IHJ1bnMgd2l0aCBlbmFibGUgYWRk
cmVzcy1zYW5pdGl6ZXIuCgpTaWduZWQtb2ZmLWJ5OiBTd2VuIFNjaGlsbGlnIDxzd2VuQGxpbnV4
LmlibS5jb20+Ci0tLQogc291cmNlNC9saWIvcmVnaXN0cnkvcGF0Y2hmaWxlX3ByZWcuYyB8IDEw
ICsrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvc291cmNlNC9saWIvcmVnaXN0cnkvcGF0Y2hmaWxlX3ByZWcuYyBi
L3NvdXJjZTQvbGliL3JlZ2lzdHJ5L3BhdGNoZmlsZV9wcmVnLmMKaW5kZXggYmE4YWMzYTVjMzgu
LmZkNjI2NjNkMzJiIDEwMDY0NAotLS0gYS9zb3VyY2U0L2xpYi9yZWdpc3RyeS9wYXRjaGZpbGVf
cHJlZy5jCisrKyBiL3NvdXJjZTQvbGliL3JlZ2lzdHJ5L3BhdGNoZmlsZV9wcmVnLmMKQEAgLTM3
MiwxMyArMzcyLDEzIEBAIF9QVUJMSUNfIFdFUlJPUiByZWdfcHJlZ19kaWZmX2xvYWQoaW50IGZk
LAogCQkJY2FsbGJhY2tzLT5hZGRfa2V5KGNhbGxiYWNrX2RhdGEsIGtleSk7CiAJCQljYWxsYmFj
a3MtPnNldF92YWx1ZShjYWxsYmFja19kYXRhLCBrZXksIHZhbHVlX25hbWUsCiAJCQkJCSAgICAg
dmFsdWVfdHlwZSwgZGF0YSk7Ci0gCQl9CisJCX0KKwkJVEFMTE9DX0ZSRUUoa2V5KTsKKwkJVEFM
TE9DX0ZSRUUodmFsdWVfbmFtZSk7CisJCWRhdGFfYmxvYl9mcmVlKCZkYXRhKTsKIAl9CiBjbGVh
bnVwOgogCWNsb3NlKGZkKTsKLQl0YWxsb2NfZnJlZShkYXRhLmRhdGEpOwotCXRhbGxvY19mcmVl
KGtleSk7Ci0JdGFsbG9jX2ZyZWUodmFsdWVfbmFtZSk7Ci0JdGFsbG9jX2ZyZWUoYnVmKTsKKwlU
QUxMT0NfRlJFRShtZW1fY3R4KTsKIAlyZXR1cm4gcmV0OwogfQotLSAKMi4yMC4xCgo=


--=-hbtVe8IbcX6D1i/RzMau--

--=-uxiBZNmhPiFHh96HS+VI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErGbWt5PHCTgy2J0tug2knLYPYasFAl1BaFYACgkQug2knLYP
Yat3iQ/+MRzn4iQj7mJX+kMrcLkwx40/oBJS4muyZc0v8RUPZghHw/WZ3mlyhyNI
p4M11HIX8v0BVw9d9haPxWXBIV64gr9lgp84VsjFRZIs8fPWWtrK8JYl6yugRYRL
VMd3SnOw1n8XZapN1tmZ0y42FwODB9JbeaiZJYFxzB/vZNwRg7F3H72928dFqE7C
lS11Hyj6OHKIWX7FvOz3i6r46c5vZwkqTAY6ReCpXgFxr2q6tyhuG6Sif6i6VaWS
KLN6KnKLZhY+jBQ3dvWLFVy0qWp/fGBI6GA5J8oiv+nkcxRWBuu2R4sqUaqNbPCg
dAs+UZVYsYSlnl9xQzmc4UZr1vbFXHvaCvYKfIp6y8J4jZ7PSQMjYwiKZRgU7enY
Mpcexzd9U2vOzBgS5hHfj6RWy80mf/7LzehHIA678ml/2c0gDWC/6Mu/+yD2yAQE
s4w446qFhEshO0ZenSr9WsTWIR/oUob0nQzcERWdDM57sRDqUszwfV+afaodRtfW
Ke27dT/cmdv91TGebnWX9Uu0+i1DVRn1DH16yedf+uSJqpvFTxPoEIbkmQB/v9gh
tQNgYh0Gp0jgVTHiaSdo27kP+fm086sKliHvRJ96Iv6caEpRdEeJ07/L24XN2j43
bkTPQH+83PwVp9T+lrs82pNyYTs2O304WrX3B7Bc3pVEi8FIFbo=
=ug6L
-----END PGP SIGNATURE-----

--=-uxiBZNmhPiFHh96HS+VI--


