Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BC41965D09D
	for <lists+samba-technical@lfdr.de>; Wed,  4 Jan 2023 11:26:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=uJ1tmuYBz4VFX69tpkjciTvPeygys2ut+sSgt6j8KkE=; b=ARrBH2lavh020MnozviclmBFui
	P6VnOR6au1xRM07Lu0CU3GvxzbKfsS3setNGNQ1nDub9nh3cc0JIt8u9kR/W1hGCdBPU5CEZ5NQF7
	1NGxF8k3y0noT+Fbz7Rh5Gvq4ZWVuXhKjyYjbYqQM+2mLJ8JyovvZgT033RdJGofsw1NuisM2kRc3
	9eOn+DcCnDfgDC58o54DwVqvK1cAtAbae7qg0sDqD6maDCFiApbVBdDjAf0/ynXs0EYnvY7GZGPng
	tvdgUaiSGLkcASgiM1PAHDtiXzkI7l0tRDnbCBRMqkvuqXzdP5R6sVFnGt1N1GjsGb2IHAI3RNh88
	/A5OhQ+g==;
Received: from ip6-localhost ([::1]:42360 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pD0yZ-00EXoF-Rx; Wed, 04 Jan 2023 10:26:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17392) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pD0yV-00EXo6-H7
 for samba-technical@lists.samba.org; Wed, 04 Jan 2023 10:26:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=uJ1tmuYBz4VFX69tpkjciTvPeygys2ut+sSgt6j8KkE=; b=YpgTz9kjhPD9SN0os03VYPB0kG
 tWNbyzNIB5643l6rIdZlzBdG8WxmWwOlWs+XsG2jsZ+pGsZHgOPIxL//F9HqQ0i0fPXU4KsiZwvQ+
 /Cr9ili8HIkp/6cTeu6Da+RgubLrKcXb3U/5oTqFD288B69twPpnT78okRniO2s+n+RGtcVkB7R4w
 n5gfB9gvcFFUXkYd8zzIP1hPJUgAT664NzFp3d6ZfyVmkVgo4RgF336DeGUpGWf3kcBr2vgJkFvfl
 xKH3sWJuCtfF2F3nxglOHZlJuv53pKj2yX5rLUXq9nQHzcaPBQ66H1ZwqAXv4U4oF+S0XKSA4Z8v2
 IGiTxSXaYGMEDxGTD8xwuqPKSI1awhxL+0vQXvRcD+FWJcHS2mP+/j5jdmsqcsS6re1UkRkeWxunF
 DTwjrprHzant0I1rb3+4pK1XCvt+znbtDFemivN0awxDwyH5bUathl9FhccXmZIhhaKW2jS27+mta
 q6wWLeyISE1Z5ZsZh/cX61Sn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pD0yU-006hic-Of; Wed, 04 Jan 2023 10:26:22 +0000
Message-ID: <ac050ea0-3d55-d376-8ff2-2a0e83d8e9f0@samba.org>
Date: Wed, 4 Jan 2023 11:26:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: Wiki: 64 bit printer drivers
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <f613dab1-cbb0-3846-6256-b492afb32c8c@samba.org>
 <87089e51-9b9b-6539-8c1b-0063d37c180e@samba.org>
 <01c42bcc-e066-b14b-9258-0378d74618df@samba.org>
 <a4c3c03e-7857-afea-36d9-ba4141f8b9f0@samba.org>
In-Reply-To: <a4c3c03e-7857-afea-36d9-ba4141f8b9f0@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0zAa9LOfUhAP6h8C9KhSud9K"
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
--------------0zAa9LOfUhAP6h8C9KhSud9K
Content-Type: multipart/mixed; boundary="------------iusZbLXjqpJTYQNEXnzaMgqF";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: samba-technical@lists.samba.org
Cc: Rowland Penny <rpenny@samba.org>
Message-ID: <ac050ea0-3d55-d376-8ff2-2a0e83d8e9f0@samba.org>
Subject: Re: Wiki: 64 bit printer drivers
References: <f613dab1-cbb0-3846-6256-b492afb32c8c@samba.org>
 <87089e51-9b9b-6539-8c1b-0063d37c180e@samba.org>
 <01c42bcc-e066-b14b-9258-0378d74618df@samba.org>
 <a4c3c03e-7857-afea-36d9-ba4141f8b9f0@samba.org>
In-Reply-To: <a4c3c03e-7857-afea-36d9-ba4141f8b9f0@samba.org>

--------------iusZbLXjqpJTYQNEXnzaMgqF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMS80LzIzIDExOjAzLCBSb3dsYW5kIFBlbm55IHZpYSBzYW1iYS10ZWNobmljYWwgd3Jv
dGU6PiBPSywgc28ganVzdCANCnRoZSBkZWZhdWx0IGNoYW5nZWQsIGJ1dCB3aGVyZSBpcyB0
aGlzIGRvY3VtZW50ZWQgPw0KbWFuIHNtYi5jb25mICJzcG9vbHNzOiBhcmNoaXRlY3R1cmUi
LiBTZWUgYWxzbyANCmM1ODc2ODVkZGUyNDQ4ZDFmNjhhZGE0N2NlNWFkNDJiMDJhMTE4Y2Uu
DQoNCkNoZWVycyENCi1zbG93DQoNCi0tIA0KUmFscGggQm9laG1lLCBTYW1iYSBUZWFtICAg
ICAgICAgICAgICAgICBodHRwczovL3NhbWJhLm9yZy8NClNlck5ldCBTYW1iYSBUZWFtIExl
YWQgICAgICBodHRwczovL3Nlcm5ldC5kZS9lbi90ZWFtLXNhbWJhDQoNCg==

--------------iusZbLXjqpJTYQNEXnzaMgqF--

--------------0zAa9LOfUhAP6h8C9KhSud9K
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmO1VE4FAwAAAAAACgkQqh6bcSY5nkbN
6A//cTEi0KaDRav4AxJ3kDc7MfF8z/LnIls82tkdfgNgnUDPzTp21P2XtHVUiJMtmqQeX6bL1+2C
Z8qE5rlL2eRN4WTN7P36k9gl3+FOmHLRKh0cQDPMoDWNXbn5TCnPMGVVspXDLFS8R3r/8yerbsLb
v9hY5I+t45weedli9ELFuDdktvtFrM9+++/Eu6R7dsVmSGpksgGhTYm/a1xJbVG2S2i8dC7UjZQA
rrHqVsZmcMyZW1V56GuUIBbm7uWsyGngjXrjUHYQWPmlWZJdrWCH++BaqYxOFILp8TofttWF84pq
CLdTMMHSbw6A/t2L/ll7p5Tm+jrtsg5wnj32/wuOIR5X+keWKSc3p9+e+vT56TW1G5dn0pVQA7Rq
nhuQYgwaB5cMXN/4yZLQSMVdjX7hiphGWG7fJ0IRPZKW5QrhYkKLbTvxEuEUiLSs+dccuQ/MSsyZ
nrcrk7S3r/XK2MjOqU8zIinw8k4LFBzzTw1XkI3vOSbJk85n99/TtF1L/QxH6iWYBZr2S1vJdiFe
WQWQ5yQhkWLqf79B2xU3RlTc3k+xRaegL49rz4RmjmLFbW+0aV+bbYbhbEOl+/gim0hBocwW6c8H
n+OUxg8ivIXFmohHtNsahmPNxkXdjtVdGOrNt2qdhPB9WDT3pBuqAoAOpVpvNA01ep68ED+cnfSM
Ilo=
=Z9Qk
-----END PGP SIGNATURE-----

--------------0zAa9LOfUhAP6h8C9KhSud9K--

