Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC1D9FA07C
	for <lists+samba-technical@lfdr.de>; Sat, 21 Dec 2024 12:54:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Vt4ipczDPX096XDmlV71f32hmQEh3Wkm5jcbS36r2LI=; b=Eoy41DXO7A89lI4RzyY5N3nWHu
	hxZR4E6OC7ZRIV8Ah1fBUDbAXGKONr4I8M9yzAbe52CVCwU7Jgw/QvvxFO755C084uMLJu793oUPJ
	wgyAx96K1PMzVjLjYDB99qlt2G1O36OkhpNGb/R4UWYIHGg38fr+uST/Z7q7CBGotAGF8AQLfjm/6
	9bDqIVUge6YI3IyVpVEElz7Uch/4lpGNfYD9XiKjLwTEXa6nSMwtd5A4QznBE2/XkZqT8KXl7f0BR
	rX7dcwErC9JeV6VgwQTsmTfSRzJ+YQOx9XaMedFgxY7+B8E9C4Cyd/x3krBRJEBp1yJZRKEUatSFj
	b3JGOq/A==;
Received: from ip6-localhost ([::1]:62608 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tOy3V-004hqQ-H8; Sat, 21 Dec 2024 11:54:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22576) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tOy3R-004hqI-C1
 for samba-technical@lists.samba.org; Sat, 21 Dec 2024 11:53:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=Vt4ipczDPX096XDmlV71f32hmQEh3Wkm5jcbS36r2LI=; b=honYvNYMLPdrHRE2cwA/maRWnj
 bh38aJrzJjJNtJgczD6Gti9D4mYl32VauHqfGfU7FtPxFdNOwYRYHjMI3xbcT61YphfRFVBwLa9gv
 kb3uLVlTa1il4I+vMQTC52HvpcpH/bbUGgyVVzenjIK64IM0Kc+AeJChKYP5UeFrIBYBQhHwhtWKD
 A1fE8VHCCebk6O4vcSRzSbnzgCxjDWHOooYJ6M2pSBIh/C3EgXa+1euohYZL6+mUY+d4WVSlMbI7i
 0Z5Utm33AfhrveREgAObthBOBaWOc4HIgyk+3fnQPNmTnZxsznMjscqfXHV/7A0dBBBQUYLMpQmDK
 TwmjflR1LmG24kSRaEIC3sPNwoq7T0HOjwQyTX9VynOsOWR/nxopdxHRko6M1jhnA1VTiY/YkXMNb
 YPmzF/9TelEsrOhufC5N2a9l8prl53y7N/ZQJSbQihEsEQ+RizC+P0sem0mdDSR0fAZLBzNrWBIpV
 SkwTMqKsy7m3APNUffclWN7K;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tOy3P-003bkp-1L; Sat, 21 Dec 2024 11:53:55 +0000
Message-ID: <e283dd4c-8fb9-4912-b5c9-2da171c92e1a@samba.org>
Date: Sat, 21 Dec 2024 12:53:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Open SSH kerberos auth not working with 4.21.x keytabs as server
 principals are in caps/mixed case - keytab breaks RFS 4120,
 section 6.2.1, fix for 4.21.3 please?
To: Matt Grant <matt@mattgrant.net.nz>,
 =?UTF-8?Q?Pavel_Filipensk=C3=BD?= <pfilipensky@samba.org>
References: <06ffa961-fc2f-4d22-9e47-e2c007e62b3e@mattgrant.net.nz>
Content-Language: en-US, de-DE
In-Reply-To: <06ffa961-fc2f-4d22-9e47-e2c007e62b3e@mattgrant.net.nz>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7q7I4lrT4GK7y4FNEQhd3ihq"
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------7q7I4lrT4GK7y4FNEQhd3ihq
Content-Type: multipart/mixed; boundary="------------KEUp62BOtDL88wFRqExZWbsr";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Matt Grant <matt@mattgrant.net.nz>,
 =?UTF-8?Q?Pavel_Filipensk=C3=BD?= <pfilipensky@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Message-ID: <e283dd4c-8fb9-4912-b5c9-2da171c92e1a@samba.org>
Subject: Re: Open SSH kerberos auth not working with 4.21.x keytabs as server
 principals are in caps/mixed case - keytab breaks RFS 4120, section 6.2.1,
 fix for 4.21.3 please?
References: <06ffa961-fc2f-4d22-9e47-e2c007e62b3e@mattgrant.net.nz>
In-Reply-To: <06ffa961-fc2f-4d22-9e47-e2c007e62b3e@mattgrant.net.nz>

--------------KEUp62BOtDL88wFRqExZWbsr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgTWF0dCwNCg0KdGhhbmtzIGZvciBicmluZ2luZyB0aGlzIHVwISBCZXNpZGVzIGEgYmVo
YXZpb3VyIGNoYW5nZSB3ZSdsbCBhbHNvIG5lZWQgDQp0ZXN0cyB0byBjb3ZlciB0aGlzLg0K
DQpAUGF2ZWw6IGlpcmMgeW91J3ZlIHdlZW4gd29ya2luZyBvbiB0aGUga2V5dGFiIGdlbmVy
YXRpb24gY29kZSByZWNlbnRseS4gDQpXb3VsZCB5b3UgYmUgYWJsZSB0byBsb29rIGludG8g
dGhpcz8NCg0KVGhhbmtzIQ0KLXNsb3cNCg0KT24gMTIvMjEvMjQgODowMyBBTSwgTWF0dCBH
cmFudCB2aWEgc2FtYmEtdGVjaG5pY2FsIHdyb3RlOg0KPiBIaSENCj4gDQo+IA0KPiBBbnkg
dGhvdWdodHMgb24gaW5jbHVkaW5nIGZpeCBmb3IgQnVnICMxNTc1OSBmb3IgNC4yMS4zIHBs
ZWFzZT8gJ3N5bmMgDQo+IG1hY2hpbmUgcGFzc3dvcmQgdG8ga2V5dGFiJyBzeW5jX3NwbnMg
aXMgcHJvZHVjaW5nIG5vbiBmdW5jdGlvbmFsIGtleSANCj4gdGFicyAtIHBhdGNoIGJlbG93
IHRvIGxvd2VyIGNhc2UgZGVmYXVsdCBnZW5lcmF0ZWQgcGFydHMgb2Ygc2VydmljZSANCj4g
cHJpbmNpcGFsIG5hbWVzIGluIFVuaXgga2V5dGFicw0KPiANCj4gDQo+IEl0cyBhIG1ham9y
IGZ1bmN0aW9uYWxpdHkgYnJlYWtlci4NCj4gDQo+IA0KPiBUaGFuayB5b3UhDQo+IA0KPiAN
Cj4gTWF0dCBHcmFudA0KPiANCj4gDQo+IA0KPiANCj4gDQoNCg==

--------------KEUp62BOtDL88wFRqExZWbsr--

--------------7q7I4lrT4GK7y4FNEQhd3ihq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmdmrFIFAwAAAAAACgkQqh6bcSY5nkYV
Cw/8DEuCcMGvvdyPm2PL/1EcYD5uNeCozwABVDPI4nfUE1p+yN9FwRa7593uhRYd+WkaUj6GWUrA
XZq/Y4pSa5NSNsuC4pmuu25EFatnyQWJaO6LZCbbvX5tGt7yIKPTzk3oNwjVJ4yHzD65YC9OIMDY
B/cFquQIjRscuB53tMLUqXqBkqCm31tOyxHnv+l5T16O76wSlXrlBp5LeTt5lCGpNSBIhCp0Qa83
yIUAev71nmFU8HSOpm5UaGCKlM+sLYmHuJcRURfi3WMZirAwvW8G7PndUddWzCQy5UEetbvUH1Wv
Nkge2c5M6ZQHN+VqRnUEm8QBZyrTpkkXk0o0/btsugZyLBUUxUZM1v7xSb8YAgvneoFKb0ZZeAQ+
VTwJFP2BFKLitS4Sn4B1FAoAauK23gzrbyA3X1qj27cv55gXpbq8fj75Kq3QTpvIJdHUYb92ZMpo
B0Gi2jVrRAX47gB3gG631TXXN3jpDwQWSW9vuD6NEzhNUwWndArZM5o9ngl1jiJOuXqhIbrDK+SZ
lZ2BoZ9DobfGo6lE/Zwsnom1mJeqaXh4nKtssZVshEbadHEzGaYIzqlDRjrFsWl3rIsdGCHEesIU
oE7ExdI1OO0l5zfgJ8YGk8Z4b88R71II3rPLPGPeykSdcFHD5qvLtQBbQOb6fH4nyPW41Qhzf6GJ
ku8=
=5XxM
-----END PGP SIGNATURE-----

--------------7q7I4lrT4GK7y4FNEQhd3ihq--

