Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AC0143AD
	for <lists+samba-technical@lfdr.de>; Mon,  6 May 2019 05:03:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=x9bzpMwHLtLtbNmcso/EjYWs4Fq0pLIS+Ay8BRUgAY4=; b=OWb4+1PUKG6GWZ6TifiDqbS2kk
	41DPz2Sq7tB3/yTkrQ6UVryazxV58hYri4HKg+PeFYY2PIZTj9pR2EzBiyDdNtEN9ARnDSVbn3zRo
	WvD+F0HSQQIhUxLakS39laCHroK1cxw2wWZcBfIB0dwhl3CLwgZfJ45OSpeNofuAOn7Po+A8rQto1
	h90FOcgNVMZL9EF4UVMOqlXArSZfLCaF3NZXSzShb4A8eumKlIdceNd6MDo+rdSVz5nsjh5Bjwh3r
	RqPu+fGZ4Y1TVv6VTfA401LqT/sUUG3oZm4WhOOZG2qfBX1YyCqe6OISD35cBu6xk78QUKTn4wZBR
	gSro6a8g==;
Received: from localhost ([::1]:54386 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hNTue-002Vhi-Fl; Mon, 06 May 2019 03:03:32 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:41124) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hNTuZ-002Vhb-9O
 for samba-technical@lists.samba.org; Mon, 06 May 2019 03:03:30 +0000
Received: from [IPv6:2404:130:0:1000:cd33:6df5:c1f3:8bac] (unknown
 [IPv6:2404:130:0:1000:cd33:6df5:c1f3:8bac])
 (Authenticated sender: gary@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id B9E8D81059
 for <samba-technical@lists.samba.org>; Mon,  6 May 2019 15:03:20 +1200 (NZST)
To: Samba Technical <samba-technical@lists.samba.org>
Subject: [PATCH] nsswitch pam_winbind: Fix Asan use after free
Openpgp: preference=signencrypt
Message-ID: <e7bb904b-20fb-c879-1330-0a621877a060@catalyst.net.nz>
Date: Mon, 6 May 2019 15:03:14 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="h9oGSUsHCpUkdQVKXA9UpoQtZajp8xSjX"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Gary Lockyer via samba-technical <samba-technical@lists.samba.org>
Reply-To: Gary Lockyer <gary@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--h9oGSUsHCpUkdQVKXA9UpoQtZajp8xSjX
Content-Type: multipart/mixed; boundary="yPKsfMcuP6PChBpHuRadpXxIeIRmWNpu5";
 protected-headers="v1"
From: Gary Lockyer <gary@catalyst.net.nz>
To: Samba Technical <samba-technical@lists.samba.org>
Message-ID: <e7bb904b-20fb-c879-1330-0a621877a060@catalyst.net.nz>
Subject: [PATCH] nsswitch pam_winbind: Fix Asan use after free

--yPKsfMcuP6PChBpHuRadpXxIeIRmWNpu5
Content-Type: multipart/mixed;
 boundary="------------4634763198046D3C222B7438"
Content-Language: en-NZ

This is a multi-part message in MIME format.
--------------4634763198046D3C222B7438
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Fix use after free condition detected by Address Sanitizer triggered by
wbcLogonUserInfoDestructor, wbcFreeMemory has code to detect and prevent
a double free.  This patch prevents the Address Sanitizer error,
allowing tests to be run with Address Sanitizer enabled.

Bug: https://bugzilla.samba.org/show_bug.cgi?id=3D13927

MR: https://gitlab.com/samba-team/samba/merge_requests/420
CI: https://gitlab.com/samba-team/devel/samba/pipelines/59869301

Review appreciated

Ng=C4=81 mihi
Gary

--------------4634763198046D3C222B7438
Content-Type: text/plain; charset=UTF-8;
 name="420.patch.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="420.patch.txt"

RnJvbSBlNmY3ODljODk2NWRjNjc0NDE2MjQ1ODU2NmNmOTQ1ZmNkZTQzYmRlIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBHYXJ5IExvY2t5ZXIgPGdhcnlAY2F0YWx5c3QubmV0
Lm56PgpEYXRlOiBUaHUsIDE4IEFwciAyMDE5IDA5OjI5OjI4ICsxMjAwClN1YmplY3Q6IFtQ
QVRDSF0gbnNzd2l0Y2ggcGFtX3dpbmJpbmQ6IEZpeCBBc2FuIHVzZSBhZnRlciBmcmVlCgpG
aXggdXNlIGFmdGVyIGZyZWUgY29uZGl0aW9uIGRldGVjdGVkIGJ5IEFkZHJlc3MgU2FuaXRp
emVyIHRyaWdnZXJlZCBieQp3YmNMb2dvblVzZXJJbmZvRGVzdHJ1Y3Rvciwgd2JjRnJlZU1l
bW9yeSBoYXMgY29kZSB0byBkZXRlY3QgYW5kIHByZXZlbnQgYQpkb3VibGUgZnJlZS4gIFRo
aXMgcGF0Y2ggcHJldmVudHMgdGhlIEFkZHJlc3MgU2FuaXRpemVyIGVycm9yLCBhbGxvd2lu
Zwp0ZXN0cyB0byBiZSBydW4gd2l0aCBBZGRyZXNzIFNhbml0aXplciBlbmFibGVkLgoKQnVn
OiBodHRwczovL2J1Z3ppbGxhLnNhbWJhLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTM5MjcKClNp
Z25lZC1vZmYtYnk6IEdhcnkgTG9ja3llciA8Z2FyeUBjYXRhbHlzdC5uZXQubno+Ci0tLQog
bnNzd2l0Y2gvcGFtX3dpbmJpbmQuYyB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9uc3N3aXRjaC9wYW1fd2luYmluZC5jIGIvbnNz
d2l0Y2gvcGFtX3dpbmJpbmQuYwppbmRleCA3NTdmZGFlNmUzYy4uMGJhMTk1NWYwMDcgMTAw
NjQ0Ci0tLSBhL25zc3dpdGNoL3BhbV93aW5iaW5kLmMKKysrIGIvbnNzd2l0Y2gvcGFtX3dp
bmJpbmQuYwpAQCAtMTkzMSw2ICsxOTMxLDExIEBAIHN0YXRpYyBpbnQgd2luYmluZF9hdXRo
X3JlcXVlc3Qoc3RydWN0IHB3Yl9jb250ZXh0ICpjdHgsCiAJd2JjRnJlZU1lbW9yeShsb2dv
bi5ibG9icyk7CiAJaWYgKGluZm8gJiYgaW5mby0+YmxvYnMgJiYgIXBfaW5mbykgewogCQl3
YmNGcmVlTWVtb3J5KGluZm8tPmJsb2JzKTsKKwkJLyoKKwkJICogV2Ugc2V0IGJsb2JzIHRv
IE5VTEwgdG8gcHJldmVudCBhIHVzZSBhZnRlciBmcmVlIGluIHRoZQorCQkgKiBpbiB0aGUg
d2JjTG9nb25Vc2VySW5mb0Rlc3RydWN0b3IKKwkJICovCisJCWluZm8tPmJsb2JzID0gTlVM
TDsKIAl9CiAJaWYgKGVycm9yICYmICFwX2Vycm9yKSB7CiAJCXdiY0ZyZWVNZW1vcnkoZXJy
b3IpOwotLSAKMi4xOC4xCgo=
--------------4634763198046D3C222B7438--

--yPKsfMcuP6PChBpHuRadpXxIeIRmWNpu5--

--h9oGSUsHCpUkdQVKXA9UpoQtZajp8xSjX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEDO84T/PRptSsMEixei/9ZKIyR1MFAlzPo/IACgkQei/9ZKIy
R1NZKggAlF9u76m5Ek3WIppTZ4O+Q9u//03a19ZU/Bi08sQWll2tII2xEW98iENm
ZxeHTO6IbluCe7c3LfZ/xYseB0+gc5pyf/r7N5TNICiD8xGg5EpCzpOSVnoS1OND
v9ShrITMT5qmGI0ROjtwhHiLPj6U9XPcw0I5PCzYbjRXuCxu8wHcnC6BmSDemtD+
FOHApQJSI55kwvtF2CKDXd89RCgJFLIE1n1Pe2LESsjSmPCeuF+zY6mlh5S++Vnm
ecK0i4wIIgutu+JUvayWdzPklE2/kOHfSnykYcw2mbHOhuN6gzDNS2WOw77q+Xuz
77RDuJ1Y2rKHDJBWbvCupedONfok2g==
=ySHk
-----END PGP SIGNATURE-----

--h9oGSUsHCpUkdQVKXA9UpoQtZajp8xSjX--

