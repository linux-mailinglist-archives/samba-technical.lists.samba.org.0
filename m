Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA3C9D95EB
	for <lists+samba-technical@lfdr.de>; Tue, 26 Nov 2024 12:01:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=TeM3lZhnfYIhwuiYW+7WcbmTjr16RK1nshp/+toGSZU=; b=WWubRSTSApoO/K1Q3r3ZjI6NcD
	w750ktA/UbZE30sjBYuVKr8fnJxIRRydcNSRJo9s1QUv9cLxTL5SlzWil1oZ2ya8zz7HeYLVBDroV
	oO+gZ7aV7uSkKlJcpqQxZl+KfvXB24CeIES20B7shCJBFCX7t6YwOd0e4cLGNGL1+gvCvyNuKXEK5
	J0DS4FmPuGxTWiP7ydvFoANJJSnW8Ivq+28xBwWnjwjzwVs0mtpLqH4TBgX34do4QpwF+6jV5bULz
	/3/BDm7a0R5fHyvJYQ2PQjG4qh/1cK4umhXjcoPORkPtgxdOh7nnnRZqbyHnbjUYc/H6UByYxIJSo
	JkBCswPQ==;
Received: from ip6-localhost ([::1]:22338 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tFtJu-000raU-6M; Tue, 26 Nov 2024 11:01:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48304) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tFtJp-000raN-Fz
 for samba-technical@lists.samba.org; Tue, 26 Nov 2024 11:01:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=TeM3lZhnfYIhwuiYW+7WcbmTjr16RK1nshp/+toGSZU=; b=ZQCVNeCH+SpE03xZuSiFoYfFm3
 NJOXQAPKop5jkIIiHz/gs1OJyOEftaH/sZgHz37yjVgO4GWQQ3KPOEqk0LxYn/FeCjBzXSWTtdCXt
 Sy4RZp6hA5d5m9UOW8Y6C5gpez8um64VsddIlxj5nSJqFfHf0107yuYXJeVIZ5Ux35maea91HFY2S
 yM8PDhwM9BDsSwgpb/Hm3xp++jfEdyu/CDd57YizfKJvZN3AE85PEDIOtB17aG52ZGnZBXmZIw7T1
 zkkxKdaWXpefuWOWtYGHood5/J+6/80Emd0Ym+NIH5+AB0/RpC9XMGaxPVl/Jsr62QlW1eguG56GX
 itnYHEeXB1xUm3AAeU0ULz0WlkrtwaEAOJ2NxgKxiuxbtYjSnKcooEzg1uNT/gOqeCbU2cJyZ3FS9
 ZIyslI9FGWLfiCtMRDqQ/mZXuxHEXs2GWwuZD89y45V+sSSUVEe/kjio5CPRbkqBBQO0W7fDhalOZ
 Ji6jPGP06CPj1IwtkI9DZj57;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tFtJp-001WqU-0B; Tue, 26 Nov 2024 11:01:21 +0000
Message-ID: <e9d93df3-b31d-473a-bd22-e5b81df1ccc1@samba.org>
Date: Tue, 26 Nov 2024 12:01:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Status query: SMB Direct in Samba
To: "Christopher R. Hertel" <crh@samba.org>,
 Samba Technical <samba-technical@lists.samba.org>
References: <9365ea2b-762f-3523-69e5-a1aba8be1c54@samba.org>
Content-Language: en-US, de-DE
In-Reply-To: <9365ea2b-762f-3523-69e5-a1aba8be1c54@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jxHxKm2Zfeaoq1ZSPDrHu0z0"
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
--------------jxHxKm2Zfeaoq1ZSPDrHu0z0
Content-Type: multipart/mixed; boundary="------------eq10X6ecEsBNk982Pmlqw9tF";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: "Christopher R. Hertel" <crh@samba.org>,
 Samba Technical <samba-technical@lists.samba.org>
Message-ID: <e9d93df3-b31d-473a-bd22-e5b81df1ccc1@samba.org>
Subject: Re: Status query: SMB Direct in Samba
References: <9365ea2b-762f-3523-69e5-a1aba8be1c54@samba.org>
In-Reply-To: <9365ea2b-762f-3523-69e5-a1aba8be1c54@samba.org>

--------------eq10X6ecEsBNk982Pmlqw9tF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgQ2hyaXMsDQoNCmNmIGh0dHBzOi8vc2FtYmEucGx1cy9zdGYtcHJvamVjdA0KDQpDaGVl
cnMhDQotc2xvdw0KDQpPbiAxMS8yNS8yNCA5OjI0IFBNLCBDaHJpc3RvcGhlciBSLiBIZXJ0
ZWwgdmlhIHNhbWJhLXRlY2huaWNhbCB3cm90ZToNCj4gSGksIGFsbC4NCj4gDQo+IEkgcmVj
ZWl2ZWQgYW4gaW5xdWlyeSBmcm9tIGEgY29tbWVyY2lhbCB2ZW5kb3IgcmVnYXJkaW5nIFNN
QiBEaXJlY3QgaW4NCj4gU2FtYmEsIHNvIEkgd2VudCBkaWdnaW5nIHRocm91Z2ggdGhlIG1v
c3QgcmVjZW50IGRvY3VtZW50YXRpb24ganVzdCB0byBzZWUNCj4gd2hlcmUgdGhpbmdzIHN0
YW5kLg0KPiANCj4gSSBrbm93IHRoYXQgTXVsdGljaGFubmVsIHdhcyBtb3ZlZCBmcm9tIEV4
cGVyaW1lbnRhbCB0byBFbmFibGVkLWJ5LWRlZmF1bHQNCj4gYmFjayBpbiAyMDIxICg0LjE1
IHJlbGVhc2UpLCBhbmQgdGhhdCBTTUIgRGlyZWN0IHJlcXVpcmVzIE11bHRpY2hhbm5lbC4g
IEkNCj4gYWxzbyBmb3VuZCBwcmVzZW50YXRpb25zIGZyb20gMjAxOCB0aHJvdWdoIDIwMjAs
IGFsbCBhYm91dCBpbXBsZW1lbnRhdGlvbg0KPiBwbGFucy4gIEkgZGlkbid0IGZpbmQgYSBk
ZWZpbml0aXZlICJpdCB3b3JrcyBub3ciIHN0YXRlbWVudCByZWdhcmRpbmcgU01CDQo+IERp
cmVjdCwgdGhvdWdoIEkgc2VlIHRoYXQgd2UgZGV0ZWN0L3N1cHBvcnQgUkRNQSBpbiB0aGUg
aW50ZXJmYWNlIGNvZGUuDQo+IA0KPiBJIHBva2VkIHRocm91Z2ggdGhlIHdpa2kuLi4NCj4g
DQo+IERvIHdlIGhhdmUgYW4gYXV0aG9yaXRhdGl2ZSBzdGF0ZW1lbnQgYWJvdXQgc3VwcG9y
dCBmb3IgU01CIERpcmVjdCBhbmQgaG93DQo+IGl0IGlzIGltcGxlbWVudGVkPyAgSWYgd2Ug
ZG8sIHBsZWFzZSBoaXQgbWUgd2l0aCB0aGUgY2x1ZS1iYXQgYW5kIHBvaW50IG1lDQo+IGlu
IHRoZSByaWdodCBkaXJlY3Rpb24uICBJJ2QgbGlrZSB0byB3cml0ZSBpdCB1cCBpZiBpdCBo
YXNuJ3QgYmVlbiBkb25lIGFscmVhZHkuDQo+IA0KPiBUaGFua3MhDQo+IA0KPiBDaHJpcyAt
KS0tLS0tDQo+IA0KDQo=

--------------eq10X6ecEsBNk982Pmlqw9tF--

--------------jxHxKm2Zfeaoq1ZSPDrHu0z0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmdFqn4FAwAAAAAACgkQqh6bcSY5nkYk
Qw/6Av+G41n3jgK5bXdq3iQglwQYByK5ZwTc80NLIzmqEUrzcph5ZTQPXGnsDeNEK71O3ulFR9Bx
96JsqPLX/MBmR+vQQk6RQ+7rrQ0LJJGvhuvKS7KUu1qwJRTc8DyluLancGOimcvBepWo3VKucJQU
1Aku8LLYlf/dxZ/7eXngvOZ60sg5H99eyac3gs8Ss6H8YkJcWK31W5+HPyO/scCDaGIeku/FXsPT
6sZB3Hh98PnSz7mW2qGZyLSLcd12AQQiJyFsRuCytJRyoxwQUbvW20LlrXosEh4J7xw0YEnmQFFy
x3TYCTQ8xfwGKodrtQaX7Hta4RsRMG8Ur2pwgr3VB/bOLS0MRRrE/IvJIjoDQtuAxwjSFBEqyn+4
TnYHLk1GUgiT3ttOrer21K9HD8LVUDQcaU6mDXo+ATZmb8tEmkcTYbuMG+HFATe8OqTiDF7GrE2j
tszH/SxQ3tRRmUBdBstfymw3kt45OfO565ua2gyDdpAUqksa2ew4kshhfoNU3rT82gPFZiBNmmRk
XkJfklVDAN9ImaXZ1qBoyH+54E8eI8YJtyHSLdnpwO9lBtYzZKHy5GiDVdtOHWMTWSFvkYBQ+P3R
91RGDsTHwW6s9gwTQhxKspHdYzPEA5C6/6a1g5yGj2n0ndOHMbVTX2kQKZoC8g9Adv4gXJKQUnln
CIg=
=/Lvq
-----END PGP SIGNATURE-----

--------------jxHxKm2Zfeaoq1ZSPDrHu0z0--

