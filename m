Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4192EA25F98
	for <lists+samba-technical@lfdr.de>; Mon,  3 Feb 2025 17:15:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=9F5ji3J7/rJL9sYK3gbA2sWyXTdvgk7rGTP+SqbNlgY=; b=NrWXXgW8M9n6mVtbX7N70Q9c5O
	Zm4FXnUTToJEIfu5uRgvV2BuLoqCns8xh3KQF7htBTbrsrbkUKU/uQJFzd39ELksmm6LS20hjHzBv
	THqYYQcOZildLd1d8eit2eXzOw1wbhw1YyC5k5XXIx8Ah92RqqzM0VQW7k5+y2zHr/HyyRcYS7Qka
	mdfP1LD2nZ/cvdXmsiTFOqmqeN3gh3sKU/474YiAUfxzaPzy4D3xWhvGES4wrDjyF6zHOzAYid7gV
	7Al2bjvxqDh2fEOdVM/1SBEgKpy6wyyYuILCP367G7cMXNypHDHSMRh328j68LPBjTRMDnpjmg8vG
	EG65yCsw==;
Received: from ip6-localhost ([::1]:32030 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tez6f-00Bkvv-Rk; Mon, 03 Feb 2025 16:15:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25674) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tez6Z-00BkvT-6q; Mon, 03 Feb 2025 16:15:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=9F5ji3J7/rJL9sYK3gbA2sWyXTdvgk7rGTP+SqbNlgY=; b=gAYePULW/8oU2zeKzh269R95f0
 NSdjTqE6UrRIJ7gGjBe4/oxQRgZxg6lFLH4o/+2KlSACpEyoRpKYuL5a5UVeTW4vuP36bNphcJOYe
 ycOqOEikPeeTFyuNZuDvBDK6tY3+YR2dwtUlwF/9ibz3l6pR3uY3ZHpla6HhLj/Hx7fngxjpcTx1L
 ApGeuJzFuGZaSl+AWoaHWmX8j1kIsgvIIcZtZINHgnBb5fVQwycB00eKXmTvUAhDQCacDXCub2gJl
 nGn1C3wafCCQhM/0cvWYJh+8PhEYXv4Ij70EXdWoytXvpMM1ETkVY1qS66DV61j8tqO8WKQsHyzsL
 o2CrEg4u5hGe+QilNWDF5VffsZTE/IIR0JkQ+oGk7Jb2rgzGgAlAleJ2EoNJWn5TW9RVOe+bKku6e
 TQywgGbptsWOsqulLhZ6jMmwRL+A/CRLhY6Jbe4DJSqspF7wzdumE6uOPntsAWQsM4vwgpCBQlKDm
 3eCafQ/93UoRSnWx4nvjU4hK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tez6Y-000wES-1H; Mon, 03 Feb 2025 16:15:22 +0000
Message-ID: <1cfa5062-2572-44bf-b6e0-046f2567f671@samba.org>
Date: Mon, 3 Feb 2025 17:15:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
To: "samba@lists.samba.org" <samba@lists.samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Subject: SambaXP 2025 and CfP final call
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yvYCkD52tQ6KzZUwSq0i0qcn"
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
--------------yvYCkD52tQ6KzZUwSq0i0qcn
Content-Type: multipart/mixed; boundary="------------QW6gwEM0f0M0VPH9WdmrT0NU";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: "samba@lists.samba.org" <samba@lists.samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Message-ID: <1cfa5062-2572-44bf-b6e0-046f2567f671@samba.org>
Subject: SambaXP 2025 and CfP final call

--------------QW6gwEM0f0M0VPH9WdmrT0NU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

RGVhciBTYW1iYSB1c2VycyBhbmQgaGFja2VycywNCg0KSSdkIGxpa2UgdG8gcmVtaW5kIGV2
ZXJ5b25lIHRoYXQgU2FtYmFYUCAyMDI1IGlzIGdldHRpbmcgY2xvc2VyLiBTYW1iYVhQIA0K
d2lsbCB0YWtlIHBsYWNlIG9uIEFwcmlsIDd0aCBhbmQgOHRoIG9uLXNpdGUgaW4gR8O2dHRp
bmdlbiwgR2VybWFueSBvbmNlIA0KYWdhaW4uIFRoaXMgYW5udWFsIGV2ZW50IHByb21pc2Vz
IHRvIGJyaW5nIHRvZ2V0aGVyIFNhbWJhIGVudGh1c2lhc3RzIA0KYW5kIGV4cGVydHMgZm9y
IGFuIGludGVyZXN0aW5nIGFuZCBlbmpveWFibGUgdHdvLWRheSBjb25mZXJlbmNlLg0KDQpo
dHRwczovL3NhbWJheHAub3JnLw0KDQpUaGUgY2FsbCBmb3IgcGFwZXJzIGlzIHN0aWxsIG9w
ZW4uIElmIHlvdSB3YW50ZWQgdG8gc3VibWl0IGEgcHJvcG9zYWwsIA0Kbm93IGl0J3MgdGlt
ZSB0byBhY3QhIDopIChtYWtlcyBub3QgdG8gc2VsZi4uLiA6KSApDQoNCkknbSBleGNpdGVk
IHRoYXQgYWxvbmdzaWRlL2FmdGVyIFNhbWJhWFAsIFNOSUEgaW52aXRlcyB0byB0aGUgU05J
QSBTTUIzIA0KSU8gTGFiIEVNRUEgYXQgdGhlIHNhbWUgdmVudWUuDQoNCmh0dHBzOi8vd3d3
LnNuaWEub3JnL3NtYjNpb2xhYmVtZWENCg0KUGxlYXNlIGNoZWNrIG15IGVhcmxpZXIgbWFp
bCBmb3IgbW9yZSBkZXRhaWxzIG9yIHBsZWFzZSBjaGVjayB0aGUgd2Vic2l0ZS4NCg0KSWYg
eW91IGhhdmUgaWRlYXMsIHF1ZXN0aW9ucywgb3IgYW55IGlzc3VlcyByZWxhdGVkIHRvIHlv
dXIgU2FtYmF4UCANCnBhcnRpY2lwYXRpb24sIHBsZWFzZSBkbyBub3QgaGVzaXRhdGUgdG8g
cmVhY2ggb3V0IHRvIHRoZSBMb2NhbCANCk9yZ2FuaXppbmcgQ29tbWl0dGVlIChsb2NAc2Ft
YmF4cC5vcmcpLiBXZSBhcmUgcmVhZHkgdG8gYXNzaXN0IGFuZCBtYWtlIA0KeW91ciBTYW1i
YSBlWFBlcmllbmNlIGFzIHNtb290aCBhcyBwb3NzaWJsZS4NCg0KTG9va2luZyBmb3J3YXJk
IHRvIHNlZSB5b3UgaW4gR8O2dHRpbmdlbiENCi1SYWxwaA0KDQotLSANClNlck5ldCBTYW1i
YSBUZWFtIExlYWQgaHR0cHM6Ly9zZXJuZXQuZGUvDQpTYW1iYSBUZWFtIE1lbWJlciAgICAg
IGh0dHBzOi8vc2FtYmEub3JnLw0K

--------------QW6gwEM0f0M0VPH9WdmrT0NU--

--------------yvYCkD52tQ6KzZUwSq0i0qcn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmeg65kFAwAAAAAACgkQqh6bcSY5nkbj
tA//bOdcLUurANuBj3N1U9KritSF4zykBvktZs9ey54z4geodX/+LnZb7JSyvovkmTaXr5a/215a
UhlpyBqakr5azdHyCM/bevW8s6n2vUBVfoy0Nw4ySNT0ClhZqA6YYslwv2xTfUgS/ZcR04N44sFF
XMTCODa6eKtbVk0BQ+rS+PMbmCElRaK6yS/wdxv8UUh/xy1Zn8KSOonawM8VuYtNbyfTc4kzsXBg
sVlvSfoGdGmEhwFt1yy+2d/svnetrTt9tc4V/FJ8s0m16jUPfh1tzP2Cs7/gfyqyYR7G/TuK31A8
sOmdrrl6fWy+kCluhcC5LFGMdQGTYkx0Yw88qK+okjFRYmM78OhSi1OsRW76Yf7pBy6eiOGY4p7n
JEhSFc2qe5wdSqjhtySTK8DVfAsbLUUsFabM9vi9+9ponr2+5JheaMqNFrjdJHvyydBnpk/fhDge
B7IZ/Hc6qAq55MVF+OctbM+vT/ibn6ymJq9EQMq6Ci9QyHjJEd23X7D9AGvqfadm6600tpmXkmnH
42kLtz3UCrltomT9rUKGzSRxMBE9jaf2Li2VfmkDJlQI5R5/GA3kKekYY4rcfUaqJ3fUslSAxhmm
s3zPLos7hjzpRYddzLTzH2ya4zyGaSaDxDQ6743fsnnwl8bPtAXIdhEYze0V6HKV4cenlJT68MW7
Nqs=
=8/5y
-----END PGP SIGNATURE-----

--------------yvYCkD52tQ6KzZUwSq0i0qcn--

