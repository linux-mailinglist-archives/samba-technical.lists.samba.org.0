Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B1D713B9
	for <lists+samba-technical@lfdr.de>; Tue, 23 Jul 2019 10:17:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=eeesW5jdQJ+I27NPfkr+lpeQ44vS8qbA5iVgdCXKDIU=; b=wbYGPR0NtBF09mchpR3y3UdHww
	UYobDDEY9lUazXL89nn87+HgSiY/WES8JIysRAV9SbQhYPldQJnJbHY6i59Vg78LPLVgL4EuXS4aR
	cD0/PZwmWw3xxk+8MHnbQ0b4Lio87jMNPcsesqyuNJ7UPqM5u988osolAN7U2J31BmjSj+YwIpg31
	6RMAMn6UZVQ4MhC9SkZG9NwH7dJrM0i+GGyInMIz0Wlo00hbTfykUfBfV97sfAy/yxASwCCTXoeS7
	Bzr89OfvcWvTpk7LLqzdRgwTwZA2Xs6d7MKOCjXPlPZ8cYoDyVIvrj6UCBjveZLkpkS++C64sopU3
	EhDezBwg==;
Received: from localhost ([::1]:37278 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hppyW-001uzp-40; Tue, 23 Jul 2019 08:16:44 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:12050
 helo=mx0a-001b2d01.pphosted.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hppyR-001uze-VX
 for samba-technical@lists.samba.org; Tue, 23 Jul 2019 08:16:42 +0000
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6N87tTF033734
 for <samba-technical@lists.samba.org>; Tue, 23 Jul 2019 04:16:31 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2twwuf1vfq-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <samba-technical@lists.samba.org>; Tue, 23 Jul 2019 04:16:31 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <samba-technical@lists.samba.org> from <swen@linux.ibm.com>;
 Tue, 23 Jul 2019 09:16:29 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 23 Jul 2019 09:16:28 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x6N8GR4Z31982068
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Jul 2019 08:16:27 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2547242045;
 Tue, 23 Jul 2019 08:16:27 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02C4942041;
 Tue, 23 Jul 2019 08:16:27 +0000 (GMT)
Received: from dhcp-9-244-58-142.kelsterbach.de.ibm.com (unknown
 [9.244.58.142])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 23 Jul 2019 08:16:26 +0000 (GMT)
Subject: Re: [PATCH] lib: prevent RTLD_DEEPBIND if run with libasan
To: samba-technical <samba-technical@lists.samba.org>
Date: Tue, 23 Jul 2019 10:16:23 +0200
In-Reply-To: <562181e6ae4073b8386dfbff1f284af7fc53858c.camel@linux.ibm.com>
References: <562181e6ae4073b8386dfbff1f284af7fc53858c.camel@linux.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-FZqtZJa9/e+0JIrnmwjQ"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19072308-0012-0000-0000-0000033560B5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19072308-0013-0000-0000-0000216EEFDE
Message-Id: <88d50ad99c2d838d5d665fbc57df09dcc8bd71d2.camel@linux.ibm.com>
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


--=-FZqtZJa9/e+0JIrnmwjQ
Content-Type: multipart/mixed; boundary="=-ElbWiLFQokKSOJZfIxo+"


--=-ElbWiLFQokKSOJZfIxo+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Updated patch

Please review and push if happy.

Cheers Swen
On Mon, 2019-07-22 at 15:41 +0200, swen via samba-technical wrote:
> While at it, prepare lib code to run with ASAN
> without the need to set the flag LDB_MODULES_DISABLE_DEEPBIND.
>=20
> Please review and push if happy.
>=20
> Cheers Swen

--=-ElbWiLFQokKSOJZfIxo+
Content-Disposition: attachment; filename="patch.txt"
Content-Transfer-Encoding: base64
Content-Type: text/plain; name="patch.txt"; charset="UTF-8"

RnJvbSBkYWZjZDQ4NzljYTU5NTkxNmRhNmEyZWNkNWU2YWMzMzRhYTZjNDkwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTd2VuIFNjaGlsbGlnIDxzd2VuQGxpbnV4LmlibS5jb20+CkRh
dGU6IE1vbiwgMjIgSnVsIDIwMTkgMTU6MzI6NDYgKzAyMDAKU3ViamVjdDogW1BBVENIXSBsaWI6
IHByZXZlbnQgUlRMRF9ERUVQQklORCBpZiBydW4gd2l0aCBsaWJhc2FuCgpJZiBydW4gd2l0aCBB
U0FOIHNhbml0aXplciB3ZSBjYW5ub3QgdXNlIFJUTERfREVFUEJJTkQgZmxhZyBmb3IgZGxvcGVu
LgoKU2lnbmVkLW9mZi1ieTogU3dlbiBTY2hpbGxpZyA8c3dlbkBsaW51eC5pYm0uY29tPgotLS0K
IGxpYi9sZGIvY29tbW9uL2xkYl9tb2R1bGVzLmMgfCA2MSArKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspLCAyNSBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9saWIvbGRiL2NvbW1vbi9sZGJfbW9kdWxlcy5jIGIvbGli
L2xkYi9jb21tb24vbGRiX21vZHVsZXMuYwppbmRleCBjYzA2N2FiZGZlMC4uMjUyMzNiYWY1NjQg
MTAwNjQ0Ci0tLSBhL2xpYi9sZGIvY29tbW9uL2xkYl9tb2R1bGVzLmMKKysrIGIvbGliL2xkYi9j
b21tb24vbGRiX21vZHVsZXMuYwpAQCAtOTM2LDEwICs5MzYsNDQgQEAgc3RhdGljIGludCBsZGJf
bW9kdWxlc19sb2FkX3BhdGgoY29uc3QgY2hhciAqcGF0aCwgY29uc3QgY2hhciAqdmVyc2lvbikK
IAkJZGV2X3Qgc3RfZGV2OwogCX0gKmxvYWRlZDsKIAlzdHJ1Y3QgbG9hZGVkICpsZTsKLQlpbnQg
ZGxvcGVuX2ZsYWdzOworCWludCBkbG9wZW5fZmxhZ3MgPSBSVExEX05PVzsKIAogI2lmZGVmIFJU
TERfREVFUEJJTkQKLQlib29sIGRlZXBiaW5kX2VuYWJsZWQgPSAoZ2V0ZW52KCJMREJfTU9EVUxF
U19ESVNBQkxFX0RFRVBCSU5EIikgPT0gTlVMTCk7CisJY29uc3QgY2hhciAqZW52X3ByZWxvYWQg
PSBnZXRlbnYoIkxEX1BSRUxPQUQiKTsKKwljb25zdCBjaGFyICplbnZfZGVlcGJpbmQgPSBnZXRl
bnYoIkxEQl9NT0RVTEVTX0RJU0FCTEVfREVFUEJJTkQiKTsKKwlib29sIGRlZXBiaW5kX2VuYWJs
ZWQgPSB0cnVlOworCS8qCisJICogdXNlIGRlZXBiaW5kIGlmIHBvc3NpYmxlLCB0byBhdm9pZCBp
c3N1ZXMgd2l0aCBkaWZmZXJlbnQKKwkgKiBzeXN0ZW0gbGlicmFyeSB2YXJpYW50cywgZm9yIGV4
YW1wbGUgbGRiIG1vZHVsZXMgbWF5IGJlIGxpbmtlZAorCSAqIGFnYWluc3QgSGVpbWRhbCB3aGls
ZSB0aGUgYXBwbGljYXRpb24gbWF5IHVzZSBNSVQga2VyYmVyb3MuCisJICoKKwkgKiBTZWUgdGhl
IGRsb3BlbiBtYW5wYWdlIGZvciBkZXRhaWxzLgorCSAqCisJICogT25lIHR5cGljYWwgdXNlciBp
cyB0aGUgYmluZF9kbHogbW9kdWxlIG9mIFNhbWJhLAorCSAqIGJ1dCBzeW1ib2wgdmVyc2lvbmlu
ZyBtaWdodCBiZSBlbm91Z2guLi4KKwkgKgorCSAqIFdlIG5lZWQgYSB3YXkgdG8gZGlzYWJsZSB0
aGlzIGluIG9yZGVyIHRvIGFsbG93IHRoZQorCSAqIGxkYl8qbGRhcCBtb2R1bGVzIHRvIHdvcmsg
d2l0aCBhIHByZWxvYWRlZCBzb2NrZXQgd3JhcHBlci4KKwkgKgorCSAqIFNvIGluIGZ1dHVyZSB3
ZSBtYXkgcmVtb3ZlIHRoaXMgY29tcGxldGVseQorCSAqIG9yIGF0IGxlYXN0IGludmVydCB0aGUg
ZGVmYXVsdCBiZWhhdmlvci4KKwkqLworCisJLyogRG9uJ3QgZG8gYSBkZWVwYmluZCBpZiB3ZSBy
dW4gd2l0aCBsaWJhc2FuICovCisJaWYgKGVudl9wcmVsb2FkICE9IE5VTEwgJiYgc3RybGVuKGVu
dl9wcmVsb2FkKSA8IDEwMjQpIHsKKwkJY29uc3QgY2hhciAqcCA9IHN0cnN0cihlbnZfcHJlbG9h
ZCwgImxpYmFzYW4uc28iKTsKKwkJaWYgKHAgIT0gTlVMTCkgeworCQkJZGVlcGJpbmRfZW5hYmxl
ZCA9IGZhbHNlOworCQl9CisJfQorCisJaWYgKGVudl9kZWVwYmluZCAhPSBOVUxMICYmIHN0cmxl
bihlbnZfZGVlcGJpbmQpID49IDEpIHsKKwkJZGVlcGJpbmRfZW5hYmxlZCA9IGZhbHNlOworCX0K
KworCWlmIChkZWVwYmluZF9lbmFibGVkKSB7CisJCWRsb3Blbl9mbGFncyB8PSBSVExEX0RFRVBC
SU5EOworCX0KICNlbmRpZgogCiAJcmV0ID0gc3RhdChwYXRoLCAmc3QpOwpAQCAtOTcyLDI5ICsx
MDA2LDYgQEAgc3RhdGljIGludCBsZGJfbW9kdWxlc19sb2FkX3BhdGgoY29uc3QgY2hhciAqcGF0
aCwgY29uc3QgY2hhciAqdmVyc2lvbikKIAkJcmV0dXJuIGxkYl9tb2R1bGVzX2xvYWRfZGlyKHBh
dGgsIHZlcnNpb24pOwogCX0KIAotCWRsb3Blbl9mbGFncyA9IFJUTERfTk9XOwotI2lmZGVmIFJU
TERfREVFUEJJTkQKLQkvKgotCSAqIHVzZSBkZWVwYmluZCBpZiBwb3NzaWJsZSwgdG8gYXZvaWQg
aXNzdWVzIHdpdGggZGlmZmVyZW50Ci0JICogc3lzdGVtIGxpYnJhcnkgdmFyaWFudHMsIGZvciBl
eGFtcGxlIGxkYiBtb2R1bGVzIG1heSBiZSBsaW5rZWQKLQkgKiBhZ2FpbnN0IEhlaW1kYWwgd2hp
bGUgdGhlIGFwcGxpY2F0aW9uIG1heSB1c2UgTUlUIGtlcmJlcm9zLgotCSAqCi0JICogU2VlIHRo
ZSBkbG9wZW4gbWFucGFnZSBmb3IgZGV0YWlscy4KLQkgKgotCSAqIE9uZSB0eXBpY2FsIHVzZXIg
aXMgdGhlIGJpbmRfZGx6IG1vZHVsZSBvZiBTYW1iYSwKLQkgKiBidXQgc3ltYm9sIHZlcnNpb25p
bmcgbWlnaHQgYmUgZW5vdWdoLi4uCi0JICoKLQkgKiBXZSBuZWVkIGEgd2F5IHRvIGRpc2FibGUg
dGhpcyBpbiBvcmRlciB0byBhbGxvdyB0aGUKLQkgKiBsZGJfKmxkYXAgbW9kdWxlcyB0byB3b3Jr
IHdpdGggYSBwcmVsb2FkZWQgc29ja2V0IHdyYXBwZXIuCi0JICoKLQkgKiBTbyBpbiBmdXR1cmUg
d2UgbWF5IHJlbW92ZSB0aGlzIGNvbXBsZXRlbHkKLQkgKiBvciBhdCBsZWFzdCBpbnZlcnQgdGhl
IGRlZmF1bHQgYmVoYXZpb3IuCi0JKi8KLQlpZiAoZGVlcGJpbmRfZW5hYmxlZCkgewotCQlkbG9w
ZW5fZmxhZ3MgfD0gUlRMRF9ERUVQQklORDsKLQl9Ci0jZW5kaWYKLQogCWhhbmRsZSA9IGRsb3Bl
bihwYXRoLCBkbG9wZW5fZmxhZ3MpOwogCWlmIChoYW5kbGUgPT0gTlVMTCkgewogCQlmcHJpbnRm
KHN0ZGVyciwgImxkYjogdW5hYmxlIHRvIGRsb3BlbiAlcyA6ICVzXG4iLCBwYXRoLCBkbGVycm9y
KCkpOwotLSAKMi4yMC4xCgo=


--=-ElbWiLFQokKSOJZfIxo+--

--=-FZqtZJa9/e+0JIrnmwjQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErGbWt5PHCTgy2J0tug2knLYPYasFAl02wlcACgkQug2knLYP
Yatj/A//Vu/AEPD2HES696asmQFdDVawGud5i7ow88ZOG7oWGuBI7geO9mJz92Aw
Me6xhuIbx5G81LrM3T5881QZQcACX7C7HC0M1fxrc1ePvy/APC7dSnC/2Vev/5+s
Dc8BCeo0E7jR3awX5vWlLRD9x1TXO3ZZhdhACQJN5V3lolEAkrCujvRXQK/BAH8j
bMXVJSFPPW+PbIlDR4h1fTtKWHyhjajOiWK5lV3dIt47+6tLkCo8kD0ysp7aQklS
3nYsEGtp/HtO5pJRAt2SbDFIYVPxVTbqgoiRWZgLEsq9gyT41ii92hxQvEUgcgG9
ahp0pgAUpaLvgk/i1ejXJJrFklV1p3xSjpw0x27J5bylj7WYW6Uc3PD7IzAUp1+O
M84c3EVulOA32Unf8gzO3kaMNqsDv0JB2Htm+SdzjnqU6wHxmAUDoDzsTh/qPouK
B54+zJSKI+Yl2RL36UQyIB+iam6JDhT/MX+VNI7M3CLqLcsAjeckr4XT+A/kPPxk
Mmze3ldsFiP6iI9162ewg2ReuGMWZZiS6ty1rRvY3jopLlBb04c7IQHT1w0h9+mV
AAf8b6rOesVKuTfrdzLM6gPPk10E3o+pjMDMGhY51NJ6Osxl0LLf28yjxGFGANxR
hzmIziGFX5T9YMJl6DsmyO395mxquA09eGmJj45eA+7YM46ppB8=
=Ev3Q
-----END PGP SIGNATURE-----

--=-FZqtZJa9/e+0JIrnmwjQ--


