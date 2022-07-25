Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A610B57F99B
	for <lists+samba-technical@lfdr.de>; Mon, 25 Jul 2022 08:49:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=IMDyRoKLAPg86x8EeWgV/2PrWRyB0cSQ9cAuFOMKwOQ=; b=YSP7Xq6opVQSXLEwcnOCICc46z
	0FpraRbH4XFgHZv867Ip/9YdQEIq7FvmpqxM85/LWv1bdlr4t3ynYkVL0e4Xoh53Cs7AAWEPesFdp
	GlCNG/GGWgmBTDHP3i5m6srJyp37A1dq2MArtv09UhzkIwZkBp0g4fud33QA/ukZE06lkWdTzHRux
	ZGrkSgasiDqXbLvHninY0AdrByp5EIXi4kDhXi2VDe6T2lqu8AEraXYeAJ6zo5m0DkSPx1ieLHEEY
	lU1fIOc1tFaB3VF4XeJZm6FuxWD2shZtEvfdTz7/BHfe2rRolhU2Z9RtdoyX4NIovRl/OLPJrowQL
	lmVMWeKQ==;
Received: from ip6-localhost ([::1]:40922 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oFruA-001uTG-AY; Mon, 25 Jul 2022 06:49:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55918) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oFru4-001uT7-TL
 for samba-technical@lists.samba.org; Mon, 25 Jul 2022 06:49:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=IMDyRoKLAPg86x8EeWgV/2PrWRyB0cSQ9cAuFOMKwOQ=; b=UZzn7+fmzwoOzp8QLTtr5KAzuV
 AHxyvRDoY4pGUpumjQIUVW//i0MmXOPAP6pxFpeIkilQaygqleaCRImkOasKV9HVHZuUt9s0U/8N6
 wikhdXSt18EOIweBbTZcAPCd4hdibL+55pxh7TRNmnLll0+KS5YKkNidgDStF1JeSskl0X7rfg16O
 gIpC+NrMDM1OGIToE3SULvXwbcI7PzRfPmwFLZ7rrGubG7dFrwNmHDapcU4MpSeNjVYYh7/84GBmM
 TIgjJLQIDe2yLGjyftuPlv7PL63IJFAHsRYvogISLtUM31cMw5VxrzjIfb9nfGQkWqNDUBO93ldiz
 CxKwqXJMpukbiYeaCBK1AowogYxjzCRpVa5hdji4bj0FWEHSABGYFBgEVTC0qN+pDWJB5SChwBNW0
 y1GWstwfdK41njmLdLWWoB7ZC1hViXKeMCRL8siUrMpzMSDFQ07Gy/JKaheg4kD5nTSysQXAZLDQq
 Kd2r1nTP3jZw0mC9OvNOOWfQ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oFru3-006L9U-Ux; Mon, 25 Jul 2022 06:49:20 +0000
Message-ID: <26efe5a8-2681-d357-abc9-1de9992cf43e@samba.org>
Date: Mon, 25 Jul 2022 08:49:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [Samba] Samba in Kubernetes (and Containers) - Release v0.2
Content-Language: en-US
To: Anoop C S <anoopcs@samba.org>
References: <3245098.9o76ZdvQCi@pretzel>
 <6fd92c53-4f64-ecff-6568-9a01908d958b@samba.org>
 <26648066.1r3eYUQgxm@pretzel>
 <c4611b9a-84c9-0a9c-2a6b-b8b30ea52ee1@samba.org>
 <32ca91c03708ad035e01ab768af6054927e2b2dd.camel@samba.org>
In-Reply-To: <32ca91c03708ad035e01ab768af6054927e2b2dd.camel@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kD8OE9IMunULJlTfPK72VBtS"
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: John Mulligan <phlogistonjohn@asynchrono.us>,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------kD8OE9IMunULJlTfPK72VBtS
Content-Type: multipart/mixed; boundary="------------mdJw2x0NfSahagos37Nd0RMG";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Anoop C S <anoopcs@samba.org>
Cc: John Mulligan <phlogistonjohn@asynchrono.us>,
 samba-technical@lists.samba.org
Message-ID: <26efe5a8-2681-d357-abc9-1de9992cf43e@samba.org>
Subject: Re: [Samba] Samba in Kubernetes (and Containers) - Release v0.2
References: <3245098.9o76ZdvQCi@pretzel>
 <6fd92c53-4f64-ecff-6568-9a01908d958b@samba.org>
 <26648066.1r3eYUQgxm@pretzel>
 <c4611b9a-84c9-0a9c-2a6b-b8b30ea52ee1@samba.org>
 <32ca91c03708ad035e01ab768af6054927e2b2dd.camel@samba.org>
In-Reply-To: <32ca91c03708ad035e01ab768af6054927e2b2dd.camel@samba.org>

--------------mdJw2x0NfSahagos37Nd0RMG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNy8yNS8yMiAwODo0MywgQW5vb3AgQyBTIHdyb3RlOg0KPiBGWUk6IE91ciBjb2xsZWFn
dWUgZmluYWxseSBnb3QgYXJvdW5kIHRvIHRyeSBhbmQgY29uc3VtZSB0aGVzZSBjaGFuZ2Vz
DQo+IGluIHNtYm1ldHJpY3NbMV0gYW5kIHdhcyBpbXByZXNzZWQgd2l0aCB0aGUgZGV0YWls
cyBpbmNsdWRlZCBhcyBwZXIgdGhlDQo+IGxhdGVzdCBwYXRjaHNldC4gVW5sZXNzIHRoZXJl
IGFyZSBhbnkgb2JqZWN0aW9ucyBsZXQncyBnZXQgdGhpcyBpbnRvDQo+IG1hc3RlciBzb29u
KG1heSBiZSBldmVuIGJlZm9yZSA0LjE3IGJyYW5jaCBpcyBjdXQgOi0pKS4NCg0Kb2gsIHRo
YXQncyBhIGdvb2QgcG9pbnQhIDopIEp1bGUsIGNhbiB3ZSBzb21laG93IGdldCB0aGlzIHJl
YWR5IHNvb25pc2g/DQoNCkFuZCB0aGFua3MgZm9yIHRlc3RpbmcgQW5vb3AhDQoNCkNoZWVy
cyENCi1zbG93DQoNCi0tIA0KUmFscGggQm9laG1lLCBTYW1iYSBUZWFtICAgICAgICAgICAg
ICAgICBodHRwczovL3NhbWJhLm9yZy8NClNlck5ldCBTYW1iYSBUZWFtIExlYWQgICAgICBo
dHRwczovL3Nlcm5ldC5kZS9lbi90ZWFtLXNhbWJhDQo=

--------------mdJw2x0NfSahagos37Nd0RMG--

--------------kD8OE9IMunULJlTfPK72VBtS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmLePO8FAwAAAAAACgkQqh6bcSY5nka0
vg/+I5tLNFJxRkX6blBVBDQIWgNtTCJKn1u+iRhk2cGgqAbkBR1Lg7/obkQqZ2AUqihFi05AiJK+
EGYgQcFS9y0xLCjscoCPyvVKj9rKNeq2UmqhU8dMl6W8DoqTUYNMPy1Luwu3aJfl70zQ30Mb63ML
a2hwBWRd0K8GJO6agASvdAsiaPFYAJ6TQnMJ1MFTEcdGA6e+8eAiM7wup0WNTUJuW4BS7mP4IWhV
cWwJYncK6yMySCrwW5gTeCZvAE2b+hD4b6B/ppwm4Fe6DfIgd3HCfzqwHeC5e8ANTND6p1/UpGtZ
LxFf7ssX2lJoU8BrE6OGBBABjJ0nOkS+N8zzlA9Jjthf2hIZejo8MVtnU6JEY9nWWm9IGI0ewZOH
FdtRVWbNfuW+wbd3y4A3eKFvishvYLCqNiBcXGFjie//yasjimfmeZBGL+hby2nO4g71Vhz7AUGj
eZIgwnGR87sXyIU4IhNneeCSphBuikaO7Y+iqJBkFWp6nHgyF8UEfhNb9+XSJM/C/obyuD0dHEJ+
IBj4qux6znyknsniGwSK7rjCTNcYqmcsc3H6CETyEyCAUuksxgVNoCpu6/6EkhqRFlAjLf2VUnyK
Dpj6HPSlQeflvOOfEp1qUHqASqIr+mktyN3ZZXR/2+KMxHrKpau+IwVWSz2Bd+Dy7NnBc5ThsKY8
bAU=
=1Ywh
-----END PGP SIGNATURE-----

--------------kD8OE9IMunULJlTfPK72VBtS--

