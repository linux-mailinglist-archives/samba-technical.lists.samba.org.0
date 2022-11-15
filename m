Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB21629E74
	for <lists+samba-technical@lfdr.de>; Tue, 15 Nov 2022 17:07:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=iyQh1FnLApgtdnwpa4GAKVzCS/K/mFcqmGWyttc3XpE=; b=fF2lPiJIbQ/vTE3UGgH+R7yTgN
	uSP4g6JKIJB3zDphdEWYYY6IzE3v6BNQs0GhiQvQsyGCi8dIYVD6KefJ6a1DSTC60EvfrsNNwuJlu
	kHRp1Pqc4jtiSS2+7LeOrASH2sRVPSD6tLpf7I7xwzmPsYJVxgQv/i/b9XlQ8PzYxvO0dc7eJulRn
	SPnZURPwWa2RZ3u3rBS9oYZHBvwCQAYrWJqzthjCJXmOCJ5K0k9r8t5b5KSe1XpaiPJ2cbVkrHF18
	q36H9FgxeI21XtEqdE0gt3zxnIfdx6oLIdtqaJeoFBn6s+eQU+TDYDh0cVnSq1G1MnwbXQbQdGHIJ
	EVX+YAzw==;
Received: from ip6-localhost ([::1]:42876 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ouySO-00Dtwp-CQ; Tue, 15 Nov 2022 16:06:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60510) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ouySK-00Dtwg-4R
 for samba-technical@lists.samba.org; Tue, 15 Nov 2022 16:06:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=iyQh1FnLApgtdnwpa4GAKVzCS/K/mFcqmGWyttc3XpE=; b=ArybLe0lN5RtIgFBxcn4rUzLPH
 ucvRyOkt0ZUH23Dg3GAwy6antGUtzWZ5JYll5/ONUMUqRfsnvLgR+MUItNlWV7Mtmdbsif3xBJ01R
 hzdBfXp0s/Q1NS7NkQMMt583Nj0wH6xKpZob7T3wnF/1P71gODZc6ja4AGbUj3UbRNHXBD0MnuZpK
 qMIPuP7mcyA9kLcqbxYh6Dd4Sy4dyD1f5JyUOxNqrRhRga4rltvFBpjH/cg0XK8P7r8UsStbvCfmM
 jjxJ4/W3Qla5QDKH2azyZjEuqMjVx3Bq3G/dkYWru9H2m3f3Jj6Ua5GJUM0NOrD7sQ9XxKd/s2WMi
 CmKpga2H7/QyPGy67e0wE79LGt0qfhCP4rlgdyIUxnhjb1yw/DYfChUwtlXMSRXpMw7T2W+xreivG
 Cwqit/yTS2qrdwBE3gaOpGJIV45bG2iYvv4hUY+tOlCRlzfDwrGJspAAx7rJk9zMMa+1lCeBNjOrq
 O8a38WFYCj7eAJmrTv6LVm0c;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ouySJ-008jen-Ni; Tue, 15 Nov 2022 16:06:35 +0000
Message-ID: <de202ee9-9380-a728-b8a5-74491115b508@samba.org>
Date: Tue, 15 Nov 2022 17:06:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: failing tests in the testsuite on debian
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, samba-technical@lists.samba.org
References: <4197c161-ef1e-3710-f50e-7631ddaf5f3f@msgid.tls.msk.ru>
 <de87d255-95d0-ac34-1544-fa0aac441f4b@msgid.tls.msk.ru>
 <dccabfb1-bc92-6c95-b45d-8cc69f650fb9@samba.org>
 <6b2c8e12-d888-9230-2d18-aa73080c6967@msgid.tls.msk.ru>
In-Reply-To: <6b2c8e12-d888-9230-2d18-aa73080c6967@msgid.tls.msk.ru>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gqfD7vbGwpoWKWuPv5SGXq82"
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------gqfD7vbGwpoWKWuPv5SGXq82
Content-Type: multipart/mixed; boundary="------------oYydwhSMEmpw0IZDKqE8Ynvq";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Michael Tokarev <mjt@tls.msk.ru>, samba-technical@lists.samba.org
Message-ID: <de202ee9-9380-a728-b8a5-74491115b508@samba.org>
Subject: Re: failing tests in the testsuite on debian
References: <4197c161-ef1e-3710-f50e-7631ddaf5f3f@msgid.tls.msk.ru>
 <de87d255-95d0-ac34-1544-fa0aac441f4b@msgid.tls.msk.ru>
 <dccabfb1-bc92-6c95-b45d-8cc69f650fb9@samba.org>
 <6b2c8e12-d888-9230-2d18-aa73080c6967@msgid.tls.msk.ru>
In-Reply-To: <6b2c8e12-d888-9230-2d18-aa73080c6967@msgid.tls.msk.ru>

--------------oYydwhSMEmpw0IZDKqE8Ynvq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMTUvMjIgMTY6MDksIE1pY2hhZWwgVG9rYXJldiB3cm90ZToNCj4gQWxzbyBJJ2Qg
bG92ZSB0byBrbm93IHdoaWNoIHRoaW5ncyBkbyBleGlzdCB0aGVyZSAtIHZlcnkgYmFzaWMg
b3ZlcnZpZXcuDQoNCm1heWJlIHRoaXMgaXMgYSBzdGFydDoNCg0KaHR0cHM6Ly93aWtpLnNh
bWJhLm9yZy9pbmRleC5waHAvVGhlX1NhbWJhX1NlbGZ0ZXN0X1N5c3RlbQ0KDQotc2xvdw0K
DQotLSANClJhbHBoIEJvZWhtZSwgU2FtYmEgVGVhbSAgICAgICAgICAgICAgICAgaHR0cHM6
Ly9zYW1iYS5vcmcvDQpTZXJOZXQgU2FtYmEgVGVhbSBMZWFkICAgICAgaHR0cHM6Ly9zZXJu
ZXQuZGUvZW4vdGVhbS1zYW1iYQ0KDQo=

--------------oYydwhSMEmpw0IZDKqE8Ynvq--

--------------gqfD7vbGwpoWKWuPv5SGXq82
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmNzuQsFAwAAAAAACgkQqh6bcSY5nkYH
2xAAnms219xoJMJB9clsS7jp2svfKpewmunsdJ/nPsQURq/DKru67HJj/o7tzgcSDN3BdIDE1Vh0
Jtx6kU0MUYmdrLFeh6Vnt50aORebfLN/cep+ZrVHUa6lcaYnGHnl396NJBmEVCVJNGsFipWcyVk9
CCvzIoavxQxcYPo2wJGibiUaCh66MlMpVm1LktpxxHqNbeJ2qtjhnnaQJ3XCvc7WsVx2aGljLa8B
WwLonZQkPffD4OneWxjjrnPhM9jkGIrJ0WCEJ4HFLwWihCuerGzsN4zCAvvR3EnBLuIe3oUua92/
l0jx4uAD34wxgi4CtMj+gUThXlGiArPq8ZhC4IMFVYqOrdYqbHDqq6REqY93No45wMCWQcNXzRpA
U0y/BzcpucdIY0MTQhJ5eCigMWMi/wC7QfCta2p75GJS/s6JuG1vIz4up9Hb7ZCqtMcsxN+AJq+l
8omkb9hhRpp7JVCNUgHGv+OKh36rVPUuBRQ/+RJYhSz5VweLHOestmx3oFLZ4NNWf8KkT1LKLXxA
q8kuZOi4u3qKxRoabPEHABSZtiTGZGYUzDQ3dRzQS1jfY9ZwXOGS1HVQgP7JUL6ctTkAfanGYvLG
C8Xj8mishsCQTIvq6SyDWiWWSo+ZgM6BqIZhX+kxCTkHdP/ARPhiLlGSvgimnYrQEVH9dUZKILVr
5V8=
=uUKd
-----END PGP SIGNATURE-----

--------------gqfD7vbGwpoWKWuPv5SGXq82--

