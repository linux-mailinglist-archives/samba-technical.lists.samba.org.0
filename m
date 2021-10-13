Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0B542C651
	for <lists+samba-technical@lfdr.de>; Wed, 13 Oct 2021 18:26:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=yqSkHt+Rfgw7brO403gXM431Zr4SrPiCdZhzFGTNYQA=; b=cpmTBg6H6j8OZIEuAHTG9lgi8p
	mGcFsMg6cN9qfjJRywpBIRol3r2/4M21xeXJbO9Kz7e+pB/fk8mKUYOCioQZFufUqj6iew+30hLwd
	HMgzvJlv2q0tYsJlAwNaRDxhdWKygKziBj/MEiaYU6GKMd8J4/rHxIbSTFTZt9AO+aBqXS3ueGDxI
	nWC2aaLY8ZBd3Z1hCcTFVm1rehcwJCR1R24X4zmgLatv9tooQ9NCfFWaDnlH/uCTnJay0DGoAKiu8
	9QAfskMz/rWgNV8JsIdAnijuVaW4O3EnAmq7sBOsSk1WHSUwU968ebQ6aS6tn/fdHAWSuq2NKH9HJ
	Ko6OJTIg==;
Received: from ip6-localhost ([::1]:46622 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mah4w-007N2J-J6; Wed, 13 Oct 2021 16:26:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56388) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mah4q-007N2A-P6
 for samba-technical@lists.samba.org; Wed, 13 Oct 2021 16:26:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=yqSkHt+Rfgw7brO403gXM431Zr4SrPiCdZhzFGTNYQA=; b=Y61owXX6UmojmKr8oFHwZ+aX8r
 hgdnwJdy5X/9YJmvrMzRbHRUGVXzWWAsRBzmDtEiqCer3vkWo3YRiioCsckP6bMAot5CjoiPyCrqW
 2Ml4Vf6Q2Nu7F9IO1Bg+egG/2Gfl7ylMVc2+j35ShyujI3MJF+IhDAcExlGx4anANakVZwXRU4CFM
 DEr62RNhkSVjh+4ScWPu17QIqse/tGohLTZG5aJ1lE7pDWSSruYB+VXnYwkZE14b+sRSmqfi3Zev0
 Kb8jSj6S4pwyzA/Of3SOBXuUIdJ9RHT8e4sD2+uho6Wiv9OSpAACdEzFufhxOgoJlmZihuTBA4e8o
 yqhU/FKqxmSoW3Y3bpRrYL0tlOolr0pD9UkE70VP4BU1fSbL4PsstBE9+dCxaq8/VugBc1OBYELMD
 wzbNpQVNWX0eYTmsaOhNyb0D1Ci1WzZvNfPGqam2UQUZlV/PwTJPBlQ1kodrv1jPpDjW2ZEcZbxue
 vN5/HjdHI6db2AZzfhWI6Ojx;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mah4p-001BV3-AE; Wed, 13 Oct 2021 16:25:59 +0000
Message-ID: <646fa34b-9a2a-84e2-b948-1c960049b4c7@samba.org>
Date: Wed, 13 Oct 2021 18:25:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [SCM] Samba Shared Repository - branch master updated
Content-Language: en-US
To: Andreas Schneider <asn@samba.org>, abartlet@samba.org
References: <E1macwQ-003K2q-0I@hrx0.samba.org> <7009830.Vje2UjyrXt@magrathea>
In-Reply-To: <7009830.Vje2UjyrXt@magrathea>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------nN0rd16qsCD7wH0E70AfZEDW"
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
--------------nN0rd16qsCD7wH0E70AfZEDW
Content-Type: multipart/mixed; boundary="------------AVdZmFrxSTq15JL8N0xoT0Pp";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Andreas Schneider <asn@samba.org>, abartlet@samba.org
Cc: samba-technical@lists.samba.org
Message-ID: <646fa34b-9a2a-84e2-b948-1c960049b4c7@samba.org>
Subject: Re: [SCM] Samba Shared Repository - branch master updated
References: <E1macwQ-003K2q-0I@hrx0.samba.org> <7009830.Vje2UjyrXt@magrathea>
In-Reply-To: <7009830.Vje2UjyrXt@magrathea>

--------------AVdZmFrxSTq15JL8N0xoT0Pp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

QW0gMTMuMTAuMjEgdW0gMTg6MDQgc2NocmllYiBBbmRyZWFzIFNjaG5laWRlciB2aWEgc2Ft
YmEtdGVjaG5pY2FsOg0KPiBPbiBXZWRuZXNkYXksIE9jdG9iZXIgMTMsIDIwMjEgMjowMTow
MiBQTSBDRVNUIEFuZHJldyBCYXJ0bGV0dCB3cm90ZToNCj4+IGNvbW1pdCA3ODU3ZTEyNDli
NzJiZThjODg0MWI5OWNiMDgyMGM5YzU2MzE3OGY5DQo+PiBBdXRob3I6IEFuZHJldyBCYXJ0
bGV0dCA8YWJhcnRsZXRAc2FtYmEub3JnPg0KPj4gRGF0ZTogICBUdWUgT2N0IDEyIDA3OjU1
OjU0IDIwMjEgKzEzMDANCj4+DQo+PiAgICAgIC5naXRsYWItY2kueW1sOiBIb25vdXIgQVVU
T0JVSUxEX1NLSVBfU0FNQkFfTzMgaW4gR2l0TGFiIENJDQo+Pg0KPj4gICAgICBHaXRMYWIg
Q0kgcmVzb3VyY2VzIGFyZSBleHBlbnNpdmUgYW5kIG9mdGVuIHJhdGlvbmVkIHNvDQo+PiAg
ICAgIHByb3ZpZGUgYSB3YXkgdG8gdGVzdCBvdGhlciB0aGluZ3Mgd2l0aG91dCB0ZXN0aW5n
IGFuIC1PMw0KPj4gICAgICBidWlsZCBhbHNvLCBhcyB0aGlzIHdpbGwgc2F2ZSA5IGpvYnMu
DQo+IA0KPiBQbGVhc2UgZG9jdW1lbnRlZCBpdCBpbiBib290c3RyYXAvUkVBRE1FLm1kDQoN
CmlzIHRoYXQgcmVhbGx5IHRoZSByaWdodCBwbGFjZT8gSSB3b3VsZCB0aGluayBzb21ldGhp
bmcgbGlrZSB0aGUgd2lraSANCndoZXJlIHdlIGFscmVhZHkgaGF2ZSBhIHRvbiBvZiByZWxh
dGVkIGRvY3VtZW50YXRpb24gd291bGQgYmUgYSBiZXR0ZXIgDQpwbGFjZS4NCg0KLXNsb3cN
Cg0KLS0gDQpSYWxwaCBCb2VobWUsIFNhbWJhIFRlYW0gICAgICAgICAgICAgICAgIGh0dHBz
Oi8vc2FtYmEub3JnLw0KU2VyTmV0IFNhbWJhIFRlYW0gTGVhZCAgICAgIGh0dHBzOi8vc2Vy
bmV0LmRlL2VuL3RlYW0tc2FtYmENCg==

--------------AVdZmFrxSTq15JL8N0xoT0Pp--

--------------nN0rd16qsCD7wH0E70AfZEDW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmFnCJYFAwAAAAAACgkQqh6bcSY5nkbO
BQ/+NRoTPVHLH0AGNEOIx6mUPNxUnMt+Tbj00fq2Tfti51JHzBaDdXGOAWVsnhgdOAAzP5MjqYkk
Bx7wX/X6+ryga/h34s09ZYXmAJxZM6Lx6KhoOJFHFbDoL5K6S6g4FsI1QNTm5wh9lelpB96ebGhc
3KIdUr5c5lUqDLeBIgNcG5/ijaiHS94ptO8cAnYIRzd0DSJ9mcE7usFFTcJ50R0A/ZMOvdv8lCeX
xb2TqX6lpxl9fca73ZZdr2lMfMRGf8LcFwL4xr0nBYkVU2Q/EfXr8AcZflt+Aj0I1oKKAM086IJo
4tI0/6xKyfu9Vy1E5fIUWyY8su5mw7vDJ1KR19KivITcTDj0ZCTGNgOB7XPlK6t8UKiQR4uac0du
MCnuBruJW9PTnIonRxNszj5fU1bcvT1+aPm3oNW6KBEIy/ODqVM/VyHaq12FSUP6qYHV5TZx/iQQ
r1xCKHQy9RIydv+f4CottXSVR8Kc8YNHhUk4/DzoggX0vy2yFBLXdVBFGoYWFTxjzLVO2d9n2nD6
R4FwYKc6VK38txqtCiucPoFhUBU12G0ES3H1mq+Neolh0DGI64k0eBVBTgAjSK5Ctn+nBb08m6xU
EddmVoFo7DCZjeFwPPXSTj7j0FgS5wZ7mVyshD/8ZA/6+ovHVE+BSVfPMBfgO/ktKFYuZRm8UCSW
fAg=
=+tXh
-----END PGP SIGNATURE-----

--------------nN0rd16qsCD7wH0E70AfZEDW--

