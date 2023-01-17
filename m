Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EFA66E0D2
	for <lists+samba-technical@lfdr.de>; Tue, 17 Jan 2023 15:34:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=aKb+/Kn/cq6AmU/LMwOWFI32+E8X0oYjvpnooRDiXwM=; b=SK74GcMwEbtKdbDrYEDjEie+gA
	Gb30OKTzLJ/sTNyGtSMAKoQc+5P/oPd11tdy0Li75sDR/fDU6YziF5YdzvHGEwG1dVQFOvMcWOKLl
	qAU6qbLX1hNJoJ9rkvaejZanN+gbzyEvfWFNVlrLdLW9odoikZa6zfI6FNenoeKmAgobQW4uFwRWg
	1fdrU2Co1O2oaExKSax7qQ3J5Er0guUwWVJFT+N8om1UKJFXU+gvis9+/rGaVIUfSP2/5drreaHA3
	z+S4FjUH3D/rT775WpSYAbwaojx70mesPebInVMivcGjz1hXERh1BIncivJ6j6rpsS5rtR5A9ZRio
	RQ+6L7Jw==;
Received: from ip6-localhost ([::1]:62404 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pHn26-000F6r-H5; Tue, 17 Jan 2023 14:33:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44734) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pHn21-000F6i-Ho
 for samba-technical@lists.samba.org; Tue, 17 Jan 2023 14:33:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Cc:To:From:Date:Message-ID;
 bh=aKb+/Kn/cq6AmU/LMwOWFI32+E8X0oYjvpnooRDiXwM=; b=QiPXLUKK7CxdCBmxRO8LBrmnyZ
 P+EVi6ZHVJrIEXfz/gXvCoALA4UT9hHG1qURMmEfe99/4golIRMHDrKWLb284QGN2KA3lN4c7iUyJ
 xIW5+DV/64+pTI3rMEbRuMib4pYtDOqOdWrAvgOiUzC4QKjP0gj47phIASiWI3e9R7IZxK6WzoBJZ
 HpXGR5dSm6dtjZ/1YHTbZziFFQ6KqaCEBRA/1o/D/lCkxwxWoTyM95VyjNiajLxoseTmKxyNjX3KY
 88wuzsk57pS4tN5iAM3yseLwDWzvTsdVFSLx3XlcVqF8i4t3vOZEH9b+r3JeX62EvccSWapWjb4jv
 NhJB2QksawKWcady2VZT2oJOMyuyEus9SigBhi6t/EZ5IElhGpefiumgLznKeRwY6lnBzn2s7/xKf
 /sMLrdKXbYVdc05Mfr3jl5BTl9UFzmlWOyqb3apbypHRgjp0NJdOP4XHc1fcr6pD+sM2oswyPMzvG
 Pom+06Qf+Hfta6CKTf50hYug;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pHn1z-008lgD-Jl; Tue, 17 Jan 2023 14:33:43 +0000
Message-ID: <1f68b352-130d-8a6d-52b6-2f7689fe92b6@samba.org>
Date: Tue, 17 Jan 2023 15:33:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
Subject: dbwrap_py: rapid dbwrap backend prototyping and FoundationDB
To: Samba-Technical <samba-technical@lists.samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mVCC3wKMCzEhXZ9h5QDfFjvm"
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
Cc: Volker Lendecke <vl@samba.org>, Stefan Metzmacher <metze@samba.org>,
 gd <gd@samba.org>, Samuel Cabrero <scabrero@samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mVCC3wKMCzEhXZ9h5QDfFjvm
Content-Type: multipart/mixed; boundary="------------3BABB09YE5wYkgy1Zq9DcWE5";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Samba-Technical <samba-technical@lists.samba.org>
Cc: Samuel Cabrero <scabrero@samba.org>, Jeremy Allison <jra@samba.org>,
 Volker Lendecke <vl@samba.org>, Stefan Metzmacher <metze@samba.org>,
 gd <gd@samba.org>
Message-ID: <1f68b352-130d-8a6d-52b6-2f7689fe92b6@samba.org>
Subject: dbwrap_py: rapid dbwrap backend prototyping and FoundationDB

--------------3BABB09YE5wYkgy1Zq9DcWE5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkhDQoNCkkndmUgaGFja2VkIGEgbmV3IGRid3JhcCBiYWNrZW5kIGNhbGxlZCBkYndyYXBf
cHkgdGhhdCBjYWxscyBpbnRvIFB5dGhvbiANCmZvciB0aGUgZGF0YWJhc2Ugb3BlcmF0aW9u
cy4gVGhpcyBjYW1lIG91dCBvZiB0aGUgZGVzaXJlIHRvIHBsYXkgYXJvdW5kIA0Kd2l0aCB0
aGUgbWFueSBhdmFpbGFibGUgZGlzdHJpYnV0ZWQgZGF0YWJhc2UgdGhhdCBhcmUgYXZhaWxh
YmxlIHRoZXNlIA0KZGF5cywgZWcgQ2Fzc2FuZHJhLCBldGNkLCBGb3VuZGF0aW9uREIgYW5k
IHNvIG9uIFsxXS4gQWxsIG9mIHRoZW0gaGF2ZSANClB5dGhvbiBiaW5kaW5ncyBhbmQgaW1w
bGVtZW50aW5nIHRoZSByZXF1aXJlZCBwcmltaXRpdmVzIGluIFB5dGhvbiBpcyANCm11Y2gg
c2ltcGxlciB0aGVuIGRvaW5nIGl0IGluIEMuDQoNCkkndmUgZGV2ZWxvcGVkIGRid3JhcF9w
eSBoYW5kIGluIGhhbmQgd2l0aCBhbiBpbml0aWFsIGJhY2tlbmQgdGFyZ2V0dGluZyANCkZv
dW5kYXRpb25EQiB3aGljaCBpcyBhIHNjYWxhYmxlLCBoaWdoLXBlcmZvcm1hbmNlIGtleS12
YWx1ZSBzdG9yZSB3aXRoIA0Kc3Ryb25nIGNvbnNpc3RlbmN5IGFuZCB0cmFuc2FjdGlvbiBz
dXBwb3J0DQoNClRoYW5rcyB0byB0aGUgdHJhbnNhY3Rpb24gc3VwcG9ydCBpbiBGb3VuZGF0
aW9uREIgaXQgaXMgcG9zc2libGUgdG8gDQppbXBsZW1lbnQgbG9ja2luZyB1c2luZyBhIGRl
ZGljYXRlZCBsb2NraW5nIHJlY29yZCBwZXIgcmVjb3JkIGNvbWJpbmVkIA0Kd2l0aCBhIGZl
bmNpbmcgdG9rZW4gdGhhdCBndWFyZHMgbW9kZnlpbmcgZGF0YWJhc2Ugb3BlcmF0aW9ucy4g
T3RoZXIgDQpkYXRhYmFzZXMgbWF5IG9mZmVyIG90aGVyIHByaW1pdGl2ZXMgdG8gaW1wbGVt
ZW50IHJlY29yZCBsb2NraW5nLg0KDQpUaGUgd2hvbGUgdGhpbmcgaXMgbm93IGZ1bmN0aW9u
YWwgZW5vdWdoIHN1Y2ggdGhhdCBpdCBwYXNzZXMgY2VydGFpbiANCnRvcnR1cmUgdGVzdHMg
d2hlbiBjb25maWd1cmVkIHRvIHB1dCBsb2NraW5nLnRkYiBhbmQgDQpzbWJYc3J2X29wZW5f
Z2xvYmFsLnRkYiBiZWhpbmQgZGJ3cmFwX3B5Lg0KDQpDdXJyZW50bHkgdGhlIHdob2xlIGRi
d3JhcCBsYXllcmluZyBydW5zIHVuY2hhbmdlZCBvbiB0b3Agb2YgdGhlIA0KYmFja2VuZC4g
QXMgbG9ja2luZyBpcyBpbXBsZW1lbnRlZCBpbiB0aGUgYmFja2VuZCBhbmQgRm91bmRhdGlv
bkRCIA0Kc3VwcG9ydCB3YXRjaGVzLCBpdCB3b3VsZCBiZSBwb3NzaWJsZSB0byBub3QgdXNl
IHRoZSBjdXJyZW50IGdfbG9jayBhbmQgDQpkYndyYXBfd2F0Y2ggYmFja2VuZCBmb3IgZGJz
IGVuYWJsZWQgZm9yIEZvdW5kYXRpb25EQi4NCg0KV2l0aCBtZXR6ZSdzIG5ldyBzbWIyLmJl
bmNoLnBhdGgtY29udGVudGlvbi1zaGFyZWQgYmVuY2htYXJrIEknbSBnZXR0aW5nIA0KMjUg
b3BlbnMvY2xvc2VzIHBlciBzZWNvbmQgb24gbXkgbGFwdG9wIHdpdGggRm91bmRhdGlvbkRC
IGJlaW5nIGEgc2luZ2xlIA0Kbm9kZSBjbHVzdGVyIHJ1bm5pbmcgb24gdGhlIGxhcHRvcCBh
cyB3ZWxsOg0KDQokIGJpbi9zbWJ0b3J0dXJlIC8vbG9jYWxob3N0L3Rlc3QgLVUgc2xvdyVQ
YXNzdzByZCANCnNtYjIuYmVuY2gucGF0aC1jb250ZW50aW9uLXNoYXJlZA0KLi4uDQpPcGVu
ZWQgNCBjb25uZWN0aW9ucyB3aXRoIHFkZXB0aD0xID0+IDQgbG9vcHMNClJ1bm5pbmcgZm9y
IDEwIHNlY29uZHMNCi4uLg0Kb3BlbltudW0vcz0yNSxhdnNsYXQ9MC4wMTk2NjIsbWlubGF0
PTAuMDAwMDAwLG1heGxhdD0wLjAyODc2OF0gDQpjbG9zZVtudW0vcz0yNSxhdnNsYXQ9MC4w
MTk4NDUsbWlubGF0PTAuMDAwMDAwLG1heGxhdD0wLjAzNDQ2Ml0NCg0KJCBiaW4vc21idG9y
dHVyZTMgLy9sb2NhbGhvc3QvdGVzdCAtVSBzbG93JVBhc3N3MHJkIExPQ0FMLURCV1JBUC1Q
WQ0KLi4uDQpkYndyYXBfZmV0Y2hfbG9ja2VkKCkgdG9vazogMjc5OSB1cw0KZGJ3cmFwX3Jl
Y29yZF9zdG9yZSgpIHRvb2s6IDQyMDUgdXMNCmRid3JhcF9leGlzdHMoKSB0b29rOiAzNjQg
dXMNCmRid3JhcF9wYXJzZV9yZWNvcmQoKSB0b29rOiAzNTcxIHVzDQpkYndyYXBfZG9fbG9j
a2VkKCkgdG9vazogNTU1MiB1cw0KLi4uDQoNClRoZSBjb2RlIGlzIGhlcmU6DQo8aHR0cHM6
Ly9naXQuc2FtYmEub3JnLz9wPXNsb3cvc2FtYmEuZ2l0O2E9c2hvcnRsb2c7aD1yZWZzL2hl
YWRzL2Rid3JhcF9weT4NCg0KQ29uZmlnOg0KDQogICAgIGRid3JhcF9weTptb2R1bGUgPSBz
YW1iYS5zYW1iYTMuZGJ3cmFwX3B5X2ZkYg0KICAgICBkYndyYXBfcHk6bG9ja2luZy50ZGIg
PSB5ZXMNCiAgICAgZGJ3cmFwX3B5OnNtYlhzcnZfb3Blbl9nbG9iYWwudGRiID0geWVzDQog
ICAgIGRid3JhcF9weTp0ZXN0X2RiX3B5LnRkYiA9IHllcw0KDQpGb3VuZGF0aW9uREIgd291
bGQgYmUgYSBnb29kIGNhbmRpZGF0ZSBmb3IgYSBwdWJsaWMgY2xvdWQgU01CIGZyb250ZW5k
IA0KYWxhIEF6dXJlIFNNQiwgdGhpcyBpcyBub3QgYWltaW5nIGF0IHRoZSBjdGRiIGhpZ2gg
cGVyZm9ybWFuY2UgU01CIE5BUyANCnVzZWNhc2UuDQoNCkknbGwgdHJ5IHRvIGdldCBhIHNt
YWxsIEZvdW5kYXRpb25EQiBjbHVzdGVyIHNldHVwIGluIEs4IHRvIHNlZSBob3cgdGhhdCAN
CmZlZWxzIGxpa2UuIFN0YXkgdHVuZS4uLiA7KQ0KDQpDaGVlcnMhDQotc2xvdw0KDQpbMV0g
PGh0dHBzOi8vd2lraS5zYW1iYS5vcmcvaW5kZXgucGhwL1NhbWJhX29uX1NjYWxlPg0KDQot
LSANClJhbHBoIEJvZWhtZSwgU2FtYmEgVGVhbSAgICAgICAgICAgICAgICAgaHR0cHM6Ly9z
YW1iYS5vcmcvDQpTZXJOZXQgU2FtYmEgVGVhbSBMZWFkICAgICAgaHR0cHM6Ly9zZXJuZXQu
ZGUvZW4vdGVhbS1zYW1iYQ0K

--------------3BABB09YE5wYkgy1Zq9DcWE5--

--------------mVCC3wKMCzEhXZ9h5QDfFjvm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmPGscYFAwAAAAAACgkQqh6bcSY5nkaX
dhAAlarGViOeZvSLCf7p0Qxa/ODbZkXJcwKZ246HhFuCqQVWxivcQAAa6xbc2tHu9zGr3Amtjp2s
vwWU35KUshAFqdUyZs4k1u5WmHl5RakGYyrRPrGyyYfQZU6ooWP7oxlS5vM9V5LjTuz/pJttZk5T
gx5gGutL5aa6PKUTjoa40Pz8zgJHosU5gWg3poN51AAt61TOBUfQ5O9BNpNdKfymvxdQuUqX2VsW
Rtqn6xRMb9DjRcXZKRK8YZAfFgnJqsegPHeViSHPCCnAGWjPktzvqGHy4UZiy9hSrLpZvUppGuJM
1XRpz6q0FxcwGDZ+kVb8c4gu3Grg/Z9pwFINYk1ykJTeRpwPudFMj9RCH/GSVny9/f2nrwfcjBH3
LDNpyuIAGPrtgwmS82mjkVWTSeSKKskaKuqtMtrQVGA+SW+wY1m7yBST4qQwsoWt/2UbBg+UXkdz
JlQUlPqmUUcHF3M44Tgw4zLCT5JBuwCLqt6tvCAxfhRMWo62BGJAYQcN/UkbH0VT4iQ39/pKYzBH
0BOA7E8k8sjeRwsGgEsPCScirsfaLULc/8ZE7C6sAr6/cKCk/mxlNgKrBVPGrKRL7FJyImTkD/nN
DRSd13HjOAXOJOrTUdIG2uWReoI8/alVXLRy8xrntvBVLHzBbSZF0DrGDy4ctJiAAo/+fHBRN/Mw
UY4=
=I8HW
-----END PGP SIGNATURE-----

--------------mVCC3wKMCzEhXZ9h5QDfFjvm--

