Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D98265EDC47
	for <lists+samba-technical@lfdr.de>; Wed, 28 Sep 2022 14:05:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=ObrA5ixW/QGiV7lH9PP/1yeNvu3sueDIa+LKMc7QNvU=; b=2xOzl1QoMMIGRDFCL/+f5TDfb7
	dvdDG3nAn11r6CtxQyGMmdCv4oLft3E7T9TosVoCtTcgPHy0gsFHHpv5SKwPR5Lv2cQMMYjDARG4w
	kfmW4GPYx2gJDn86j9i/AFZUnVjZGHODFlx3w/78eVXZTIx3iiedK8pPWo2K7E60MBqHOgqFJTIPT
	pFy5QhmYZ3eUbhKKWOh0sr4a/GeEP/+PgnAfHmm1mCcd0LUSL91QRt+TLaI66XIXwWoNqoCZeVhdz
	uZnnHnH3ru2bM3eKiuRvDfx2ZG8AO9NoTEkQWfP3FFazOdtBEkakkh355MVbQaQwuiCdYmibDNCR1
	aQLDFD1g==;
Received: from ip6-localhost ([::1]:65434 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1odVoo-004Zk0-Ib; Wed, 28 Sep 2022 12:05:38 +0000
Received: from hartley.uberspace.de ([185.26.156.169]:46856) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1odVoi-004Zjq-U2
 for samba-technical@lists.samba.org; Wed, 28 Sep 2022 12:05:35 +0000
Received: (qmail 17660 invoked by uid 990); 28 Sep 2022 12:04:29 -0000
Authentication-Results: hartley.uberspace.de;
	auth=pass (plain)
Message-ID: <adaa5aab-92d5-019d-f86e-969938cb5788@merten.dev>
Date: Wed, 28 Sep 2022 14:04:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: samba-technical@lists.samba.org
Subject: buggy krb5 ccache behavior and cmocka unit tests
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wPc8g4NIkYNKyCMFu70XYUmC"
X-Rspamd-Bar: ---
X-Rspamd-Report: BAYES_HAM(-2.612135) MIME_GOOD(-0.2)
 MIME_BASE64_TEXT_BOGUS(1) MIME_BASE64_TEXT(0.1) SIGNED_PGP(-2)
X-Rspamd-Score: -3.712135
Received: from unknown (HELO unkown) (::1)
 by hartley.uberspace.de (Haraka/2.8.28) with ESMTPSA;
 Wed, 28 Sep 2022 14:04:29 +0200
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
From: Christian Merten via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christian Merten <christian@merten.dev>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wPc8g4NIkYNKyCMFu70XYUmC
Content-Type: multipart/mixed; boundary="------------6LVfF8CANh5KjF00S2TzfXu6";
 protected-headers="v1"
From: Christian Merten <christian@merten.dev>
To: samba-technical@lists.samba.org
Message-ID: <adaa5aab-92d5-019d-f86e-969938cb5788@merten.dev>
Subject: buggy krb5 ccache behavior and cmocka unit tests

--------------6LVfF8CANh5KjF00S2TzfXu6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCjEuKSBJIGVuY291bnRlcmVkIGEgZmV3IGlzc3VlcyB3aGVuIHVzaW5nIG90
aGVyIGNjYWNoZSBuYW1lcyBpbiANCnNhbWJhLXRvb2wuIEZvciBleGFtcGxlOg0KDQpzYW1i
YS10b29sIHVzZXIgbGlzdCAtLXVzZS1rZXJiZXJvcz1yZXF1aXJlZCAtLXVzZS1rZXJiZXJv
cz1yZXF1aXJlZCANCi0tdXNlLWtyYjUtY2NhY2hlPUtFWVJJTkc6cGVyc2lzdGVudDoxMjM0
NToxMjM0NQ0KDQpnaXZlcyBOVF9TVEFUVVNfVU5TVUNDRVNTRlVMDQoNCmFsdGhvdWdoIGts
aXN0IGNvcnJlY3RseSBzaG93cyBhIHRpY2tldCB0aGF0IGlzIHdvcmtpbmcgd2l0aCBsZGFw
c2VhcmNoLg0KDQpBbHNvIHVzaW5nIC0tdXNlLWtyYjUtY2NhY2hlPURJUiBnaXZlcyBhIHNl
Z21lbnRhdGlvbiBmYXVsdC4gVGhlIA0Kc2VnbWVudGF0aW9uIGZhdWx0IGlzIHRocm93biBz
b21ld2hlcmUgaW4gdGhlIHB5dGhvbiBmdW5jdGlvbiANCnNldF9uYW1lZF9jY2FjaGUgcGF0
Y2hlZCBpbiBhdXRoL2NyZWRlbnRpYWxzL3B5Y3JlZGVudGlhbHMuYy4gSSB0cmllZCB0byAN
CnRyYWNrIGl0IGJhY2sgdG8gdGhlIGFjdHVhbCBjIGNvZGUsIGJ1dCBJIHN0dW1ibGVkIHVw
b24gY21vY2thIHRlc3RzLiANClRoaXMgbGVhZHMgbWUgdG8gbXkgc2Vjb25kIHF1ZXN0aW9u
Og0KDQoyLikgSG93IGRvIEkgcnVuIGNtb2NrYSB1bml0IHRlc3RzPyBJIHRyaWVkIG1ha2Ug
c3VidW5pdC10ZXN0cyANClRFU1RTPWF1dGguY3JlZGVudGlhbHMudGVzdHMudGVzdF9jcmVk
cyBidXQgSSBvbmx5IGdldDogc2tpcHBpbmcgc3VidW5pdCANCih0ZXN0c2NlbmFyaW9zIGFy
ZSBub3QgYXZhaWxhYmxlKS4NCg0KQmVzdCByZWdhcmRzDQpDaHJpc3RpYW4NCg0KLS0gDQpD
aHJpc3RpYW4gTWVydGVuDQpQR1AgS2V5OiBodHRwczovL2tleXMub3BlbnBncC5vcmcvdmtz
L3YxL2J5LWZpbmdlcnByaW50LzkwNEFCNzhBNzA0NjQzMUU0QjhFOTZEMkQ5NTNENjk3MjFC
OTQ4QjMNCg0K

--------------6LVfF8CANh5KjF00S2TzfXu6--

--------------wPc8g4NIkYNKyCMFu70XYUmC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEkEq3inBGQx5LjpbS2VPWlyG5SLMFAmM0OEwFAwAAAAAACgkQ2VPWlyG5SLPM
uRAAvTIOrTG9jX/hX/TO42HTZwlNH43EWDurL5OeIEl+e/3X6MBTcnrpnS7pUKred5/LwTLXS/XQ
UXUgzz4MZGTfMn5XmAEwPEqEOsOtS9RDgFp5NxVqEbolj3fNy/QU9EySaHWeR3e5bdVvsH1G79cq
kURoEJsLEsFwpUjOphuIGHf3JccLKcOx5JF+UaFu8WjU7LfW+12XW4RxN8vIMhGgooGSxfF/+FQJ
hfy3cCUO43zS9nKUtEdhdFsvEBh7NZJPci6vH8tSUvM+/MwDm/25UTYQ7EpPBKRbKFMIV4hicR2E
2WUK7V2HU1BQgD3LqfX1rEoJJrWdZo7/hnneETuXzqD69bej8KOY3zcQ76Q+BC+Oz9whOnwZXCcA
jakgaISLL7Y4GDuYDYHBuQjo1wze2pwvjWNqBIE0Wr8x3fsMIAjcus5KSLmovp6PkGCqQYa66hJu
fc2iOVR7Dhcj1XcAwOkOTtYMNNLOLa8rt4TFo7d7NsL5mkTnlQL3u2VTjW1PWOm2t1yYMDuORjM8
4t1/q7zmfdWdRkQuLd9420NIgVWYkZPWI3o+tPX0iFmfi1t5X5F5jqo3jashrEOXFWB/gcwY/M8J
cVp6tki6uDLuE+esJQzflux+aGa4byzXwKYo4dx9eiOgUgOaIlr9tEWTnl8LJ8d797qUvhAn8TnH
Ap0=
=tGiH
-----END PGP SIGNATURE-----

--------------wPc8g4NIkYNKyCMFu70XYUmC--

