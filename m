Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8562D7DCDCD
	for <lists+samba-technical@lfdr.de>; Tue, 31 Oct 2023 14:28:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=gBVowLa4aZA2GloddMymXV9H4XGYV8K4dj7wmO5ToS0=; b=TysPaLRHmkU2iNf+htc1DfKTZy
	5RWenyp5/PkOWJvsXGucxCQAWwJzlX5G3p8lnOTGMtbkOkVXqBZdJ24pktH7mtft/PSYNejQPa0kU
	47gBOQcn92cWQ1JUGO+H1SdcqlpDZAgksBVa1VcNrHyjvErDJRka6z/aU0x69GhslxaWalmmOcAf7
	4P02ey8d1tBtp4HcTA6KqmNJVedPxjsHLHRiY2zAsG2lRzfz/O+yRhh0VeeT9/C9l8nnO/wcHq57o
	0ydkbSZdba5d2Q2V5wkuJV765lNeiBiVxCXE7lkFPe7ySEc0C95tn+Uxu6x1gTIPXl43kJyZfs7r5
	u26gIb4A==;
Received: from ip6-localhost ([::1]:56648 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qxomz-003h4D-MU; Tue, 31 Oct 2023 13:28:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57952) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qxomv-003h44-8w
 for samba-technical@lists.samba.org; Tue, 31 Oct 2023 13:28:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=gBVowLa4aZA2GloddMymXV9H4XGYV8K4dj7wmO5ToS0=; b=DK0B5wQ74lJodz5EwJHHYk/z4T
 q3owRh8y9BBmCozRKZUMBvPbqYbtwZJsVJRzgAiM8bioTE0qH4Hmf9BZMTulJFyVs8VZGnawB2Src
 o2TZME9Qs6fqi84yMwUJ7r38j68DIXNNJo4tvLzfiDMzXcWIUr5XdFzrBUhY47hJFrIWjjq6y9ugw
 4EhAHmk1FgQdmdbOsQsLmxRlVlxm26qB0/0LDlR9pPaMxldhCDwrNID9uLwa4TSCc/oNCpJqgKm+9
 uUzMTfwFWV/m2UliC8btSpWYrx3hJwo6HvONsJQQ8Hjl6l+JEiLj/HbMp2+B8uwiGtcLUYl+G5C9O
 q7nTJQMb8KxpZEs3P3OvggPx7nCjkpKEWx74eZ2HSz/zFv5lGlTwa98TR1DWxk2nZEBODHX6K7r8l
 PfGa2apAdVWm2ezkud0hEEX6gg/gkwFgTXFaIpW6bPmivfUQq1aLReodX4/ZDvOVuutCQUc0buNEp
 pqJNUwrISk9FoiqFi1bX7RIq;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qxoms-003Vqj-27; Tue, 31 Oct 2023 13:28:06 +0000
Message-ID: <4b0104db-9a80-4288-96b9-fdcd6a37fd1e@samba.org>
Date: Tue, 31 Oct 2023 14:28:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [SMB3 POSIX] POSIX client creates a file, set the ARCHIVE bit or
 not
Content-Language: en-US, de-DE
To: Tom Talpey <tom@talpey.com>, Jeremy Allison <jra@samba.org>
References: <3b2fa1bd-2eae-482a-a9d9-543ebb921046@samba.org>
 <ZT/ZoUmdarteCey4@jeremy-HP-Z840-Workstation>
 <18abc825-a35d-441b-9476-32c6c368275f@samba.org>
 <ZT/tY0fVsAaaqpZE@jeremy-HP-Z840-Workstation>
 <a92a20ea-5e03-4f0c-9129-db4c62043dd1@samba.org>
 <2c4005f6-e5f0-43b1-bc96-0d497e547934@talpey.com>
 <64ddbbd2-9499-4f6d-ae64-19fccd924220@samba.org>
 <6b020b4b-9c7d-431a-86d7-fe4ee01a0df6@talpey.com>
In-Reply-To: <6b020b4b-9c7d-431a-86d7-fe4ee01a0df6@talpey.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mjsLBnWtp0y51Xadgwn1Ss4H"
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
 Steven French <Steven.French@microsoft.com>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mjsLBnWtp0y51Xadgwn1Ss4H
Content-Type: multipart/mixed; boundary="------------0tpbHcz0fm9fnab6E56Xzapi";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Tom Talpey <tom@talpey.com>, Jeremy Allison <jra@samba.org>
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>,
 Volker Lendecke <vl@samba.org>, Stefan Metzmacher <metze@samba.org>,
 Steven French <Steven.French@microsoft.com>
Message-ID: <4b0104db-9a80-4288-96b9-fdcd6a37fd1e@samba.org>
Subject: Re: [SMB3 POSIX] POSIX client creates a file, set the ARCHIVE bit or
 not
References: <3b2fa1bd-2eae-482a-a9d9-543ebb921046@samba.org>
 <ZT/ZoUmdarteCey4@jeremy-HP-Z840-Workstation>
 <18abc825-a35d-441b-9476-32c6c368275f@samba.org>
 <ZT/tY0fVsAaaqpZE@jeremy-HP-Z840-Workstation>
 <a92a20ea-5e03-4f0c-9129-db4c62043dd1@samba.org>
 <2c4005f6-e5f0-43b1-bc96-0d497e547934@talpey.com>
 <64ddbbd2-9499-4f6d-ae64-19fccd924220@samba.org>
 <6b020b4b-9c7d-431a-86d7-fe4ee01a0df6@talpey.com>
In-Reply-To: <6b020b4b-9c7d-431a-86d7-fe4ee01a0df6@talpey.com>

--------------0tpbHcz0fm9fnab6E56Xzapi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgVG9tLA0KDQpPbiAxMC8zMS8yMyAxMzo0OCwgVG9tIFRhbHBleSB3cm90ZToNCj4gT24g
MTAvMzAvMjAyMyAyOjUzIFBNLCBSYWxwaCBCb2VobWUgd3JvdGU6DQo+PiBPdG9oLCBpbiB0
aGUgY2FzZSBvZiBTYW1iYSwgc3RvcmluZyB0aGUgRE9TIGF0dHJzIGluIGFuIHhhdHRyIGlu
IHRoZSANCj4+IGZpbGVzeXN0ZW0gaXMgYW4gZXh0cmEgSU8gc3lzY2FsbC4NCj4gDQo+IElz
bid0IGl0IGV2ZW4gaGlnaGVyIG92ZXJoZWFkIGZvciB0aGUgY2xpZW50IHRvIGJlIHNldHRp
bmcgdGhpcz8NCg0KaXQncyBub3QgYWJvdXQgY2xpZW50IGluaXRpYXRlZCBzZXR0aW5nIG9m
IERPUyBhdHRyaWJ1dGVzLCBidXQgDQppbXBsaWNpdGx5IHNldHRpbmcgdGhlbSBhcyBwYXJ0
IG9mIFNNQjItQ1JFQVRFIChhbmQgc2ltaWxhciBwcm90b2NvbCANCmVudHJ5IHBvaW50cykg
cHJvY2Vzc2luZy4NCg0KDQotc2xvdw0K

--------------0tpbHcz0fm9fnab6E56Xzapi--

--------------mjsLBnWtp0y51Xadgwn1Ss4H
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmVBAOUFAwAAAAAACgkQqh6bcSY5nkY6
Lg/9G/Twm73Dwe8B5QLRxmBiZwh5cYQMHFrbU3PmRwMf2vOyrQ5KBpqvxT8xMNbAIQb9zHld633D
mwQ8XxDmPrH0nAxJpI4nBCqd2ptrKUy2pzmEIVaUwpEZi7vUrlCG4gTIjWEfBtru5oCnei3d5Vyj
3OI0km358VZ4C32tBp9hAX+M/KVIZgTRa/kdCB0zyGMMZAkWoDjTPNtRAD7Hf3URUR7ama7z10a2
vHLf3pfkvowkvBJM7MTeWwqn3wK9Q1qEInbHb/B9uwuQs8UhszPptUTQ6SNC2N7JdapUz+188V1S
TS9D/GtFHw8X0RKly0IOPbMWDoSAjPebswIjOfqRMjwDQg3lqSe0YKztpiLXVzj/XQRl/NQF3e/Y
ytqykjmw6Qr3A+RWomfNmmM+A55eGQWRZY+b7hVGjKNHPN2WdB+WeWnNPWgftUAlWSzrio/kW0NY
3Bgp9fYXuEWevxq43TSg13ruKB7MZE5Zfu5q0aqq8vzmXmgGqgJteHVIF4TU7KbYm4JNyDabLSxT
mIs/YSVGo215Q/SFKricDF+bjL00B998D4NmKjMlBmLyjqPwJlr3VPLpAEtDiWtNKO2DkI17ZWH1
C5NLjg5mhvZ5FWu2mu6W6+PE1LgGd7vESGrtZUq8X/fnvE4AoItv9cAeErZ5B7OpuHBbiWCYXifO
ilY=
=j6Kb
-----END PGP SIGNATURE-----

--------------mjsLBnWtp0y51Xadgwn1Ss4H--

