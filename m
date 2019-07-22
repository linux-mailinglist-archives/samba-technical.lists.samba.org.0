Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF5870148
	for <lists+samba-technical@lfdr.de>; Mon, 22 Jul 2019 15:42:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=fIuMIzWcDfwa7DmynfpHBaQhW8EmvHJcb/4sNr5NVYg=; b=n7oXw3OwmDuNYuXAe5u/wcOzsB
	KYBg2lXuPE4BmX141K7yB4S0YlToU3w0nCHqN/587i4qLTJ+93MhuzzrcUN3fiTW8GEdnuNGNsAL+
	TVKuUyaJ0Gh94ipTSIjG+eVedDHB16sAD4rcDWjb61+rbXjfMNDiUvysdp+X1ZUiHqZm2VYX0O18G
	E3vCKF+O0cJsY8y8B4NTn/6f34Sy+1cfEwI3ilsmNUBnW7FSoXIkyzFS5cck46A2z04cfC1rNVUb5
	YGPoZNJn5Lm39pwaz9XTy7vE8fJNNI+NDTEdZv44oN2934mDiF1MSJE8CsuKucZcng+NcxzddQAM+
	RFCZXvKQ==;
Received: from localhost ([::1]:64094 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hpYZI-001gdU-Jq; Mon, 22 Jul 2019 13:41:32 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:4494
 helo=mx0a-001b2d01.pphosted.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hpYZC-001gdL-KW
 for samba-technical@lists.samba.org; Mon, 22 Jul 2019 13:41:29 +0000
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6MDctME047703
 for <samba-technical@lists.samba.org>; Mon, 22 Jul 2019 09:41:17 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2twc84x70e-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <samba-technical@lists.samba.org>; Mon, 22 Jul 2019 09:41:16 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <samba-technical@lists.samba.org> from <swen@linux.ibm.com>;
 Mon, 22 Jul 2019 14:41:15 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 22 Jul 2019 14:41:14 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x6MDewgH39256444
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Jul 2019 13:40:58 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F3D24C04A;
 Mon, 22 Jul 2019 13:41:13 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2CF074C040;
 Mon, 22 Jul 2019 13:41:13 +0000 (GMT)
Received: from dhcp-9-244-58-64.kelsterbach.de.ibm.com (unknown [9.244.58.64])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 22 Jul 2019 13:41:13 +0000 (GMT)
Subject: [PATCH] lib: prevent RTLD_DEEPBIND if run with libasan
To: samba-technical <samba-technical@lists.samba.org>
Date: Mon, 22 Jul 2019 15:41:08 +0200
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-RBgyfVo+pmq5v2qRDS4W"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19072213-0012-0000-0000-000003352CFB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19072213-0013-0000-0000-0000216EB96E
Message-Id: <562181e6ae4073b8386dfbff1f284af7fc53858c.camel@linux.ibm.com>
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
Cc: asn@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--=-RBgyfVo+pmq5v2qRDS4W
Content-Type: multipart/mixed; boundary="=-SZa2CYCIPhDXbBBA8ChG"


--=-SZa2CYCIPhDXbBBA8ChG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

While at it, prepare lib code to run with ASAN
without the need to set the flag LDB_MODULES_DISABLE_DEEPBIND.

Please review and push if happy.

Cheers Swen

--=-SZa2CYCIPhDXbBBA8ChG
Content-Disposition: attachment; filename="patch.txt"
Content-Transfer-Encoding: base64
Content-Type: text/plain; name="patch.txt"; charset="UTF-8"

RnJvbSA3NGFlZDYzMzNlNWM0Yjk3MGZmZTU1NzI4YmU4ODA4ZTk2MDc3ODhiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTd2VuIFNjaGlsbGlnIDxzd2VuQGxpbnV4LmlibS5jb20+CkRh
dGU6IE1vbiwgMjIgSnVsIDIwMTkgMTU6MzI6NDYgKzAyMDAKU3ViamVjdDogW1BBVENIXSBsaWI6
IHByZXZlbnQgUlRMRF9ERUVQQklORCBpZiBydW4gd2l0aCBsaWJhc2FuCgpJZiBydW4gd2l0aCBB
U0FOIHNhbml0aXplciB3ZSBjYW5ub3QgdXNlIFJUTERfREVFUEJJTkQgZmxhZyBmb3IgZGxvcGVu
LgoKU2lnbmVkLW9mZi1ieTogU3dlbiBTY2hpbGxpZyA8c3dlbkBsaW51eC5pYm0uY29tPgotLS0K
IGxpYi9sZGIvY29tbW9uL2xkYl9tb2R1bGVzLmMgfCAyMSArKysrKysrKysrKysrKysrKysrKy0K
IDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvbGliL2xkYi9jb21tb24vbGRiX21vZHVsZXMuYyBiL2xpYi9sZGIvY29tbW9uL2xkYl9t
b2R1bGVzLmMKaW5kZXggY2MwNjdhYmRmZTAuLmNlZjI5NzIzYjY4IDEwMDY0NAotLS0gYS9saWIv
bGRiL2NvbW1vbi9sZGJfbW9kdWxlcy5jCisrKyBiL2xpYi9sZGIvY29tbW9uL2xkYl9tb2R1bGVz
LmMKQEAgLTkzOSw3ICs5MzksMjYgQEAgc3RhdGljIGludCBsZGJfbW9kdWxlc19sb2FkX3BhdGgo
Y29uc3QgY2hhciAqcGF0aCwgY29uc3QgY2hhciAqdmVyc2lvbikKIAlpbnQgZGxvcGVuX2ZsYWdz
OwogCiAjaWZkZWYgUlRMRF9ERUVQQklORAotCWJvb2wgZGVlcGJpbmRfZW5hYmxlZCA9IChnZXRl
bnYoIkxEQl9NT0RVTEVTX0RJU0FCTEVfREVFUEJJTkQiKSA9PSBOVUxMKTsKKwljb25zdCBjaGFy
ICplbnZfcHJlbG9hZCA9IGdldGVudigiTERfUFJFTE9BRCIpOworCWNvbnN0IGNoYXIgKmVudl9k
ZWVwYmluZCA9IGdldGVudigiTERCX01PRFVMRVNfRElTQUJMRV9ERUVQQklORCIpOworCWJvb2wg
ZGVlcGJpbmRfZW5hYmxlZCA9IHRydWU7CisKKwkvKiBEb24ndCBkbyBhIGRlZXBiaW5kIGlmIHdl
IHJ1biB3aXRoIGxpYmFzYW4gKi8KKwlpZiAoZW52X3ByZWxvYWQgIT0gTlVMTCAmJiBzdHJsZW4o
ZW52X3ByZWxvYWQpIDwgMTAyNCkgeworCQljb25zdCBjaGFyICpwID0gc3Ryc3RyKGVudl9wcmVs
b2FkLCAibGliYXNhbi5zbyIpOworCQlpZiAocCAhPSBOVUxMKSB7CisJCQlkZWVwYmluZF9lbmFi
bGVkID0gZmFsc2U7CisJCX0KKwl9CisKKwlpZiAoZW52X2RlZXBiaW5kICE9IE5VTEwgJiYgc3Ry
bGVuKGVudl9kZWVwYmluZCkgPj0gMSkgeworCQlkZWVwYmluZF9lbmFibGVkID0gZmFsc2U7CisJ
fQorCisJaWYgKGRlZXBiaW5kX2VuYWJsZWQpIHsKKwkJZGxvcGVuX2ZsYWdzIHw9IFJUTERfREVF
UEJJTkQ7CisJfQorCiAjZW5kaWYKIAogCXJldCA9IHN0YXQocGF0aCwgJnN0KTsKLS0gCjIuMjAu
MQoK


--=-SZa2CYCIPhDXbBBA8ChG--

--=-RBgyfVo+pmq5v2qRDS4W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErGbWt5PHCTgy2J0tug2knLYPYasFAl01vPQACgkQug2knLYP
YatjSg/9FXMd5c4LEF2Tz9xJLHPU59Mgr489KEARSeLpuWcFVM5jlp0U0gttNg04
u90SzMa2cePUM0oja/U/2wiR1pe8MHxOsXLvimceNO7HDxrA0o/heyAT62T7ZXos
cPmOI06OBFtozgiRgb6vX1VS71VumwMcDGp7ZyiLCCuiUWAvl4BBSmg/kI6DftvB
KDT0DxzXrh9zMBYQbjqjFZ3Skz+z64mqWk2WPLoFCdk9kCTsh16scbcbiwiCWYNi
apZi1yDHzCqNNVRcCDeUCI+ppxhyDMd9Lvmogtzf3bp54bCDHpaXF57hoQG+0+Ln
wLsy4PLOLQNtDgNV9qw+YaqzIPrEpVRRMOesHr4ElinsBG4Pwdp3zBnvg9Lyp+CR
tQSA4ymnEfhDwqhUSVE+zdEoWabPVVFzJBN1ySWbVpkfNGyuDxNvZQxHLKVv4r1s
fYFxz4LCTG5DgR+okY0fAwVV6g1AgJmQH1EZTLQXRWL8HIAQP/h0hrw8ghTRMjKS
h7XTtXWGnPVh/4I/gSVHvACYmpLrRdvWjP4QzKKQjDidd4oFPIPYdFVoHh00Blix
uTjdol1BTu+v4fJHagLEnQyWTCiFddnMyZa+ZdLhKyRZzbt6UmGNVyK5lSlVZqcI
GT4My6aS5b6egHtGpyoch6N9PmDzPoPEXC9OZ+ynRqq5n2oS2+8=
=eGeF
-----END PGP SIGNATURE-----

--=-RBgyfVo+pmq5v2qRDS4W--


