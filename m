Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8A08ACAA6
	for <lists+samba-technical@lfdr.de>; Mon, 22 Apr 2024 12:31:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=hFioqICmwv3yqn517W9aw9dRC88OqGwnLPcB6lW1J0s=; b=g/flacY9fy8dlepyzaXr62yUh9
	s04u8YPuPWg9cnJt7ghuc32KJP+Xqf/Qf/o9ThB+eyP/HCD2eshOkawJILWgUMfJYrzOm/zZzgh8O
	xcxFI9ERgJncMTRXBw7BiTCVlGqq1Gbub/ytIHVWA9N3kSCGxKWYnmXbxczkE5ybLO7e9Xz25/72I
	dbcLJ9e+n9MSk+wsUo1SfvA3SlWGJiYwaS+niFoXbYea/LzTd2I0j84jmolwUIshQvCU2hj0zjqym
	ugDU+s9eXqxaoZbXQQjnYRVJ02emMcw6vLfbI5V9eu24vX/tcB7RTrgxn3pOsuHMTkyLRC/pqtoqL
	TBERsXeA==;
Received: from ip6-localhost ([::1]:47554 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ryqwT-005MLo-Qe; Mon, 22 Apr 2024 10:30:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36028) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ryqwO-005MLh-7B
 for samba-technical@lists.samba.org; Mon, 22 Apr 2024 10:30:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Cc:From:To:Date:Message-ID;
 bh=hFioqICmwv3yqn517W9aw9dRC88OqGwnLPcB6lW1J0s=; b=wUhzrGBiPODd7kFYlnfOl+eki1
 lygSpeOtFNsAh6DVLqwW5riK0svgRXsaodJRoyw3v3KRJAPyRVqEo7hSkePlqf1uSijhAxQA2QepO
 A9JCGtrplwsjfOJj5S9e2J6s9xUwRN7iEpZSCdxGa0v7w5+Fj3Li4MsIC23t3fAKCsgCGBmgoaqEX
 BKNLSU4Ts5xEl8xXPA97WZ36ZaqtGS3NbVxcgqGwwRZijVAdueH0+UPmnEr9Na1zan7YWQDrO2LIc
 wYUlW9v1fg9Ml6zY/1N61WXE/Q7U+eH8e/6l0rFS6wnnCPShP5LoM5Qklw7a1RM+M/MtgW2Ms0b79
 q1ITOJHjIdePcsy7E5YPFWfHi6Y+wikbboFGGQuJKN4JxPcULCpuZRT9N1NAcmrsFtRQbP3sbU767
 qkD66IKuO3HsnSmxES+p1xU/cNF2H379CvRSjRNVn/XJvD6kWh1C7ax62Z9jGCmCb1CzRUeMboO//
 kPBy1+rbRTNU0efRp0HQlR8A;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ryqwD-007ghd-2f; Mon, 22 Apr 2024 10:30:18 +0000
Message-ID: <4249c3b6-3b4e-4bd3-95e5-864158e5797f@samba.org>
Date: Mon, 22 Apr 2024 12:30:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Proposal for changes in become root
To: Xavi Hernandez <xhernandez@gmail.com>
References: <CAO9H7P_oqwoJoC_8mWNZVYZ-pxrYt9TrEt3t0LJsEvS32EorEg@mail.gmail.com>
Content-Language: en-US, de-DE
In-Reply-To: <CAO9H7P_oqwoJoC_8mWNZVYZ-pxrYt9TrEt3t0LJsEvS32EorEg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CM8Z1wSom84Vd6TdKpKHj0Ti"
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------CM8Z1wSom84Vd6TdKpKHj0Ti
Content-Type: multipart/mixed; boundary="------------Po8nYahwFRuAcnRQsLPrrOC3";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Xavi Hernandez <xhernandez@gmail.com>
Cc: samba-technical@lists.samba.org
Message-ID: <4249c3b6-3b4e-4bd3-95e5-864158e5797f@samba.org>
Subject: Re: Proposal for changes in become root
References: <CAO9H7P_oqwoJoC_8mWNZVYZ-pxrYt9TrEt3t0LJsEvS32EorEg@mail.gmail.com>
In-Reply-To: <CAO9H7P_oqwoJoC_8mWNZVYZ-pxrYt9TrEt3t0LJsEvS32EorEg@mail.gmail.com>

--------------Po8nYahwFRuAcnRQsLPrrOC3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgWGF2aQ0KDQpPbiA0LzIyLzI0IDExOjExLCBYYXZpIEhlcm5hbmRleiB2aWEgc2FtYmEt
dGVjaG5pY2FsIHdyb3RlOg0KPiBXaGF0IGRvIHlvdSB0aGluayA/DQp0aGUgZnV0dXJlIHBs
YW4gaXMgdG8gbW92ZSB0aGUgaW1wZXJzb25hdGlvbiB0byB0aGUgVkZTIGJ5IHBhc3Npbmcg
YW4gDQphYnN0cmFjdCBpbXBlcnNvbmF0aW9uIG9iamVjdCB0byBhbGwgVkZTIGZ1bmN0aW9u
cyBhbmQgdGhlbiBsZXQgdGhlIFZGUyANCm1vZHVsZXMgZG8gdGhlIGltcGVyc29uYXRpb24u
DQoNCm1ldHplIGFuZCBJIGhhdmUgZGVzaWduZWQgYW5kIGltcGxlbWVudGVkIDc1JSBvZiB3
aGF0IHdvdWxkIGJlIG5lZWRlZCBoZXJlOg0KDQo8aHR0cHM6Ly9naXQuc2FtYmEub3JnLz9w
PXNsb3cvc2FtYmEuZ2l0O2E9c2hvcnRsb2c7aD1yZWZzL2hlYWRzL2ltcGVyc29uYXRpb24+
DQoNClRoZSB0b3AgY29tbWl0IGhhcyBhIGZldyBub3RlcyBhbmQgVE9ETy4NCg0KPGh0dHBz
Oi8vZ2l0LnNhbWJhLm9yZy8/cD1zbG93L3NhbWJhLmdpdDthPWJsb2I7Zj1JbXBlcnNvbmF0
aW9uX1BsYW4ub3JnO2g9ZWE2ZmUwNDgyNWVjNTdiYTRjMGE3ZTY0NzYyNTUxMjllM2YzMTMz
YTtoYj1mNGNhOWViZmMxMjY5YmJlN2MzMzE5ZWI5OTFlMWQwZWE0NGEwOGE5Pg0KDQpUaGlz
IGlzIHByb2JhYmx5IG5vdCB3aGF0IHlvdSB3ZXJlIGFza2luZyBmb3IsIGJ1dCBJJ20gYWZy
YWlkIHR1bm5lbGluZyANCmJlY29tZV9yb290KCkgdGhyb3VnaCB0aGUgVkZTIHdvdWxkIGZ1
cnRoZXIgY29tcGxpY2F0ZSB0aGUgY3VycmVudCBsb2dpYyANCmFuZCBhbHNvIGRvZXNuJ3Qg
YWxsb3cgYXZvaWRpbmcgYWxsIGltcGVyc29uYXRpb24gY2hhbmdlcywgZWcgdGhlIGxvZ2lj
IA0KYXJvdW5kIGNoYW5nZV90b191c2VyX2FuZF9zZXJ2aWNlX2J5X2ZzcCgpIGFuZCANCmJl
Y29tZV91c2VyX3dpdGhvdXRfc2VydmljZV9ieV9mc3AoKS4NCg0KU2VlIGFsc28gdGhlIHJl
Y2VudCBwcm9ibGVtcyBjYXVzZWQgYnkgdHJ5aW5nIHRvIHVzZSBjYXBhYmlsaXRpZXMgDQpp
bnN0ZWFkIG9mIGJlY29tZV9yb290KCkuIEFkZGluZyBtb3JlIGxvZ2ljIHRvIHRoaXMgaXMg
Z29pbmcgdG8gDQptYXNzaXZlbHkgaHVydCB1cyBpbiB0aGUgbG9uZyBydW4uDQoNCkp1c3Qg
dGhyb3dpbmcgdGhpcyBvdXQgcXVpY2tseSBoZXJlLCB3ZSBjYW4gcHJvdmlkZSBtb3JlIGRl
dGFpbHMgYW5kIA0KaGVscCB3aXRoIHRoZSBkZXNpZ24sIHJlYmFzZSBvciBhbnN3ZXIgYW55
IHF1ZXN0aW9ucyB5b3UgbWF5IGhhdmUuDQoNCi1zbG93DQo=

--------------Po8nYahwFRuAcnRQsLPrrOC3--

--------------CM8Z1wSom84Vd6TdKpKHj0Ti
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmYmPDkFAwAAAAAACgkQqh6bcSY5nkbU
yw/8DgJLF/f7KivDhboF/wKWWR87umRE26Bh/gjTAYxyIJdC3HeY/MZLNbcWcdaatXeFNzjVIjON
UPGopcA6LscdRxSYFG3QIZ0M8KuBjOUD96p2TmIrPZkG9ScHyjxEPdYRv9RFl6tRN+gZqtXcCGl1
to9Bk14F+4dLyESet79LCgZC/5Z0k8HSyFi2AV7rUxjOmQbfYFklC6GVfQg47l46bt1Spo2B5kLI
JBZ8JutjqPpnOxKgsGXNL8hm+1+alZ9qSaZkozMrCfQE4D5rqIJ4W4K7XQo0rsX473FNvn14jU1l
e0P7pKo9UYvv/qJhozsfvYUAX6CS6rEJEmtH/n02W0vyGmqNP+c74DD3j+eqBTNWAjb39l6n/7WU
CHrns62jUEmaFx/ddfuc6xb8abOJzcFuZewRn43W/+qqKy+lBNRh2xC2rpQj6aAPp8BdyyG6q2e6
+hkYJu6KCIDAcgeJhInThrNbPL5TZBt6PsSMspsXdskYDRzpyNI6LPSJviNHKoEDnbBzLNwBDhs1
1O2yZSFNGiQw/ysB3XTT/02t7DGdIJ2qQuF0glBIcD8qbfAbMTYd1pGRJU7zhb0jdoSjv/eUuj5L
WHyQO9uRkTcIhGnEMOVzVJX/32tJQ/CmJ8a33JLN3j+iwgKUQdPwTS7S5bd3c/Vl5vv/lo58LzVh
9HQ=
=H/ra
-----END PGP SIGNATURE-----

--------------CM8Z1wSom84Vd6TdKpKHj0Ti--

