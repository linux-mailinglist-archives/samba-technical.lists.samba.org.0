Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2122097C32E
	for <lists+samba-technical@lfdr.de>; Thu, 19 Sep 2024 05:34:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=ttCH+6bLlG0OGmG5FytRHaZdrMO/O7hOWPg0mtGuG1o=; b=Joy9CyVtWt6gzPE5pV4ubPOjXR
	3vLxMMxC2vVJZ4fsAXBvU0zPdFiFMyuawTcD39gNqqJWRY8QvER3EwA6g2tPtn6y2BHjYUPz9dQf7
	ciwwvEUf8FkaH6J+f/hwDLE16LOAyql6RtTTTmrlYvfZl3Wacju2K2uYqNGHi7aALow6s/RzVtAHj
	ysEufpkE2EvoLQ6nhucYA95h7FiB7QPa0CsyrXALqCHFRGMvBZUvQ9cGoNPY5xtz9Q51hlcT2Z8sw
	96l+g9qPHi29ivE63gU00MxunhBYV51075DvxrzrSETMwshhvuXDBk4ZpoxGQ0BHIY3AkTEUuVvKQ
	5cqwsSrA==;
Received: from ip6-localhost ([::1]:58028 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sr7vu-000JVd-N6; Thu, 19 Sep 2024 03:34:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36636) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sr7vr-000JVV-F4
 for samba-technical@lists.samba.org; Thu, 19 Sep 2024 03:34:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=ttCH+6bLlG0OGmG5FytRHaZdrMO/O7hOWPg0mtGuG1o=; b=uyGclpi2NQOPk3eaHJ2TwA2Sbz
 HQJV5ZpOwslFfN8mNyMIxcJFJiUOvQE4DYsv5a/AvVXg7nfabuX2C8FcNKQZi3n097gjYj4IeVTa7
 GtuwHUOOCln7lENHL7Thkt6uryBc1r8COmHzTpxhQBpmogiT2r15qMZqLlyuoMXzLe/W5XoAWdyeT
 2kpJj80Mek5AD262nYc9djE6tQ5ecCWzEq/yZr5HOjSVDFoGOXY1hvJmHUFfmJKCFjPrcmi2moGwg
 soclgmM9gxy8rccvuxtofrgv9p/5EnLqc18F1RTXyyWr89OIEMDkan2ZxsglBaj8gUEYtdPNmpJb8
 11Nrtnk9iBLTTTLjOXpcNiFyQO3ZQnzywE4+wkAwqXtnG3PM9/AnVZzeRwl2fC3GT94jj8pTMjyGB
 DjJJqXxbLbN4rBq8sPfYa0Ov5qEbn4Ll8D+iwWzBbpyXwdke0Rz24L48J+GpyyWpjSw1LXZG4Tn0X
 yK45VOby1i98CEJ0que+ykrd;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sr7vq-000q67-0g; Thu, 19 Sep 2024 03:34:14 +0000
Message-ID: <4d0749a2-17ee-4774-abed-c2d12d61cedf@samba.org>
Date: Thu, 19 Sep 2024 05:34:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Network discovery of nearby Samba servers
To: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
References: <CAH2r5muLs97YW12d1C4TWS4wHF-mbphVJCqzVe9LBNE6iYLPKQ@mail.gmail.com>
Content-Language: en-US, de-DE
In-Reply-To: <CAH2r5muLs97YW12d1C4TWS4wHF-mbphVJCqzVe9LBNE6iYLPKQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XuMVEsmwYnbiPwSl0psLs7LP"
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
--------------XuMVEsmwYnbiPwSl0psLs7LP
Content-Type: multipart/mixed; boundary="------------b2G5Ybgcopa6txoTWX0yXGmt";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Message-ID: <4d0749a2-17ee-4774-abed-c2d12d61cedf@samba.org>
Subject: Re: Network discovery of nearby Samba servers
References: <CAH2r5muLs97YW12d1C4TWS4wHF-mbphVJCqzVe9LBNE6iYLPKQ@mail.gmail.com>
In-Reply-To: <CAH2r5muLs97YW12d1C4TWS4wHF-mbphVJCqzVe9LBNE6iYLPKQ@mail.gmail.com>

--------------b2G5Ybgcopa6txoTWX0yXGmt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gOS8xOS8yNCAzOjUwIEFNLCBTdGV2ZSBGcmVuY2ggdmlhIHNhbWJhLXRlY2huaWNhbCB3
cm90ZToNCj4gVG9kYXkgZHVyaW5nIG9uZSBvZiB0aGUgcHJlc2VudGF0aW9ucyBhdCBTREMs
IHRoZSBBcHBsZSBkZXZlbG9wZXJzDQo+IG1lbnRpb25lZCBhIHRvb2wgY2FsbGVkICJCb25q
b3VyIiAoIkF2YWhpIiBpbiBMaW51eCkgdGhhdCBpcyB1c2VkIHRvDQo+IGZpbmQgbmVhcmJ5
IGZpbGUgc2VydmVycyB0byBtb3VudCB0by4gICBJcyB0aGlzIChBdmFoaSkgcG9zc2libGUg
Zm9yDQo+IHVzIHRvIHVzZSBmcm9tIExpbnV4IHRvIGZpbmQgbmVhcmJ5IFNhbWJhIHNlcnZl
cnMgdG8gbW91bnQgdG8/ICBJDQo+IGNvdWxkbid0IGZpbmQgaW5zdHJ1Y3Rpb25zIG9uIGhv
dyB0byBzZXR1cCBTYW1iYSBmb3IgdGhpcy4NCg0KdGhlIHByb3RvY29sIGlzIG1ETlMsIEF2
YWhpIGlzIHRoZSBtYWluIGltcGxlbWVudGF0aW9uIG9uIExpbnV4LiBTYW1iYSANCnN1cHBv
cnRzIGl0IGlzIHNpbmNlLCB3ZWxsLCBmb3JldmVyLiBNYWMgc2VydmVycyBhbmQgY2xpZW50
cyB3aWxsIGFsc28gDQp1c2UgaXQuIFVuZm9ydHVuYXRlbHkgTVMgaW52ZW50ZWQgdGhlaXIg
b3duIHNoaXQgZm9yIHRoZSBzYW1lIHB1cnBvc2UuDQoNCi1zbG93DQo=

--------------b2G5Ybgcopa6txoTWX0yXGmt--

--------------XuMVEsmwYnbiPwSl0psLs7LP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmbrm7MFAwAAAAAACgkQqh6bcSY5nkYw
BA/9F8VyLroJ2zu+6Z+0EMZ1j0dTIhdW/w0BKSaEySXdrgMh/uXFuIEDrMrE5162GDV+tfuyOJlw
epOTvJKblwP21+vN5xexhGvh+6u8X8YO9KPyzCOopTQondj+Thdn7wCZDcJhl7IA+JRtn2hyinFx
c5g/3Tb4sUVVTKlXFRX9b6Dm5SyBFbEueiDfEtfh33Kypy+jcSpYPdZa/+YIzWn8HdKg1jxUdvSO
DXah7UP5UTbf5F+1XY1lAJEi87uiaQtKQLyeBN7RPpmQglK3iOW1MImliOKb6XO8GSy42+0c36Dl
nJpXuegHdP0zDFms2UpwFJir2XMw3mHd71tCg73Rz2eI6TxDglJYzUvaRSDrKjHbTlas6spgqo4k
QPWQNjdu9oUO8HKUA1ftS2HtLx/0sAWn3kDPv/Bfxn/ks4XgpN7J99aVCkkUNgfYKuwGcCEsuFBO
Xv80lCyh2m+sLnwyD/BFEeIh2/24coAulXJwW1EI7sJqxjuRVFpdOs9s4uP0PstgHT+tYYjV9tZl
rNZrLNIbVBNaxhCChxcpBIcEG/ZLP68cXXyBV/BmRAbfB1baooWuDoXnWZQCuvFSS798sIqGAwjI
nmjeInjE0xI3oA5wdCjpOckdQUUvJw9f7scchT0annPoOJolRjk50hPEnEh1rNnERszcaEiDB/gz
kqM=
=8Svm
-----END PGP SIGNATURE-----

--------------XuMVEsmwYnbiPwSl0psLs7LP--

