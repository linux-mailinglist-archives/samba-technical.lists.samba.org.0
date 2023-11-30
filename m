Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C037FF717
	for <lists+samba-technical@lfdr.de>; Thu, 30 Nov 2023 17:52:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=jbNXWp+9zR9hiu2h9TsRLgdN4tLO9EK5RiT3hxdTuA8=; b=gnHeJhei8aw4WFl9UBjzKOdpXY
	tZfOzPpUw27UljAkbXsyTXWBZdcJu1Qj1v7ybFjwoycosDCvGvZUBK5th++1AnOzzt1Mzxi0Y/Fv2
	sxFn8e57wl9kYcg5wWg/42K4n1VwNQKlPXbOnZC0jrcXXaq4fLzN/coongWcbNT6cdDGRHHSAxs5y
	QFaBH+mljn4NdAc139P+drWaBAqL5C8nIopV2BCIq360Mb2gQxEMUGnbPJ9m87rdUX1IRSv3ay1Li
	M9nE7Etp4pMP/vM2NKcsHpWWgxdXTiB/HrGh+yln+4KViY6AzCLuPUixTnr22TXf69TOM3ad9gz06
	aLk78XDw==;
Received: from ip6-localhost ([::1]:37804 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r8kGF-001kQf-NH; Thu, 30 Nov 2023 16:51:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44256) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r8kGA-001kQW-MC
 for samba-technical@lists.samba.org; Thu, 30 Nov 2023 16:51:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=jbNXWp+9zR9hiu2h9TsRLgdN4tLO9EK5RiT3hxdTuA8=; b=Mp3D789h8B6BNINHMTK/Rk16uo
 lofr6OUETNUtBzpq3q0X06N9u2JRiGeuQhgDr7S3NxK0gnb/LaCS41tDLWF9cjwkZXgTnN/fjvrB/
 AXgo2Z/GhTrOIEjLj9K8t9AmSMdcr55OWmpNFwW8Mj+kJs59ACRiiChjlY2V5pSH05UYY9IKOpIDm
 dvkcCPiASpQkN46zvMni92yt6pPL6q6QmxB1bgQ1KTbT6BcZEeLxlYDSXXCJ6gRFmf3dW0vcdOo1n
 tEUIjOJrQwJg1sTVqSq0YIPCRuffrx7N2RONeK4L/5pZlMSdUW23KcsTytjb77uLTLqJxeWM8mHjx
 XTmaniLyl71rGHUvUV7WSSuUPJFWD9lMsKCt63lOkVU6zQRENruByV1t1gp1YOMB/pUqV9kBgdJDZ
 wyJLX8NPTqaXsufIHV4y5lhgrBKARplYOBEuEzAhJJhs8DIU+NGQZhMAp0cLQLx20O71sDygSUNBZ
 gLGRLg+DEoOdso2IvO2K0UEE;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r8kG9-001Ji0-27; Thu, 30 Nov 2023 16:51:29 +0000
Message-ID: <95f29b05-f994-464f-9b2d-639c78eed650@samba.org>
Date: Thu, 30 Nov 2023 17:51:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Samba in Kubernetes (and Containers) - Release v0.4
Content-Language: en-US, de-DE
To: John Mulligan <phlogistonjohn@asynchrono.us>,
 samba-technical@lists.samba.org
References: <5903408.31r3eYUQgx@li-241d88cc-27c5-11b2-a85c-c640472b3c85.ibm.com>
In-Reply-To: <5903408.31r3eYUQgx@li-241d88cc-27c5-11b2-a85c-c640472b3c85.ibm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vD01SusAiS1HQFdmkdrlIgde"
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
--------------vD01SusAiS1HQFdmkdrlIgde
Content-Type: multipart/mixed; boundary="------------pIO9STQI16rB0NDqDXYqpB3t";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: John Mulligan <phlogistonjohn@asynchrono.us>,
 samba-technical@lists.samba.org
Message-ID: <95f29b05-f994-464f-9b2d-639c78eed650@samba.org>
Subject: Re: Samba in Kubernetes (and Containers) - Release v0.4
References: <5903408.31r3eYUQgx@li-241d88cc-27c5-11b2-a85c-c640472b3c85.ibm.com>
In-Reply-To: <5903408.31r3eYUQgx@li-241d88cc-27c5-11b2-a85c-c640472b3c85.ibm.com>

--------------pIO9STQI16rB0NDqDXYqpB3t
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSm9obiwNCg0KdGhhbmtzIHRvIHlvdSBhbmQgYW55b25lIGVsc2Ugd29ya2luZyBvbiB0
aGlzIQ0KDQpBbnkgaGlnaGxpZ2h0cyBvZiB3aGF0J3MgbmV3IGluIDAuND8NCg0KVGhhbmtz
IQ0KLXNsb3cNCg0KDQpPbiAxMS8zMC8yMyAxNjowMywgSm9obiBNdWxsaWdhbiB2aWEgc2Ft
YmEtdGVjaG5pY2FsIHdyb3RlOg0KPiBUaGUgdGVhbSBiZWhpbmQgdGhlICJTYW1iYSBpbiBL
dWJlcm5ldGVzIiBvcmdhbml6YXRpb24gaXMgaGFwcHkgdG8gYW5ub3VuY2UNCj4gb3VyIHRo
aXJkIGJhdGNoIG9mIHJlbGVhc2VzLiBSZWxlYXNlIHYwLjQgaW5jbHVkZXMgYm90aCBmZWF0
dXJlcyBhbmQgZml4ZXMNCj4gYWNyb3NzIHRocmVlIG9mIG91ciBmaXZlIHB1YmxpY2x5LWNv
bnN1bWFibGUgcHJvamVjdHMuIFRoZXNlIGFyZSB0aGUgc2FtYmEtDQo+IG9wZXJhdG9yLCBz
YW1iYS1jb250YWluZXIsIGFuZCBzYW1iYWNjIHByb2plY3RzLiBUaGVzZSByZWxlYXNlcyBh
cmUgcGFydCBvZg0KPiBvdXIgcGxhbiB0byBtYWtlIHJlbGVhc2VzIHR3aWNlIGEgeWVhciwg
b3IgYXBwcm94aW1hdGVseSBldmVyeSA2IG1vbnRocy4NCj4gDQo+IE91ciBsaXR0bGUgb3Jn
YW5pemF0aW9uIG1heSBiZSBjYWxsZWQgIlNhbWJhIGluIEt1YmVybmV0ZXMiIGJ1dCB0aGUg
cHJvamVjdHMNCj4gZ28gYmV5b25kIGp1c3QgS3ViZXJuZXRlcy4gVGhlIGltYWdlcyBidWls
dCB1c2luZyB0aGUgc2FtYmEtY29udGFpbmVyIHByb2plY3QNCj4gYXJlIHN0YW5kYXJkIE9D
SSBjb250YWluZXIgaW1hZ2VzLCBzbyB0aGV5IGNhbiB3b3JrIGp1c3QgYXMgd2VsbCBvbiBE
b2NrZXIgb3INCj4gUG9kbWFuIGFzIG9uIEt1YmVybmV0ZXMgb3IgYW5vdGhlciBjb21wYXRp
YmxlIGNvbnRhaW5lciBvcmNoZXN0cmF0aW9uIHN5c3RlbS4NCj4gVGhlIHNtYm1ldHJpY3Mg
cHJvamVjdCBjYW4gZXhwb3J0IFNhbWJhIG1ldHJpY3MgYXMgYSBQcm9tZXRoZXVzDQo+IGVu
ZHBvaW50IGV2ZW4gaWYgeW91IGRvbid0IGhhdmUgYSBjb250YWluZXIgaW4gc2lnaHQuDQo+
IA0KPiBBcyBwcmV2aW91c2x5IG1lbnRpb25lZCwgdGhpcyBpcyBhIGJhdGNoIG9mIHJlbGF0
ZWQgcHJvamVjdHMuIFVSTHMgZm9yIGVhY2gNCj4gbmV3IHJlbGVhc2UgYXJlIGF2YWlsYWJs
ZSBiZWxvdzoNCj4gDQo+ICogaHR0cHM6Ly9naXRodWIuY29tL3NhbWJhLWluLWt1YmVybmV0
ZXMvc2FtYmEtb3BlcmF0b3IvcmVsZWFzZXMvdGFnL3YwLjQNCj4gKiBodHRwczovL2dpdGh1
Yi5jb20vc2FtYmEtaW4ta3ViZXJuZXRlcy9zYW1iYS1jb250YWluZXIvcmVsZWFzZXMvdGFn
L3YwLjQNCj4gKiBodHRwczovL2dpdGh1Yi5jb20vc2FtYmEtaW4ta3ViZXJuZXRlcy9zYW1i
YWNjL3JlbGVhc2VzL3RhZy92MC40DQo+IA0KPiBPdGhlciBwcm9qZWN0cyBpbiBvdXIgb3Jn
YW5pemF0aW9uIGVpdGhlciBoYWQgbm8gY2hhbmdlcyBzaW5jZSB0aGUgbGFzdA0KPiByZWxl
YXNlIG9yIGFyZSBub3QgcmVhZHkvaW50ZW5kZWQgZm9yIHdpZGUgY29uc3VtcHRpb24uDQo+
IA0KPiBXZSdkIGxvdmUgdG8gaGVhciB5b3VyIGZlZWRiYWNrLiBXZSBoYXZlIHRoZSBnaXRo
dWIgZGlzY3Vzc2lvbnMgKHdlYi1mb3J1bQ0KPiBzdHlsZSkgZmVhdHVyZSBlbmFibGVkIG9u
IG1hbnkgb2YgdGhlIHJlcG9zLiBXZSBhbHNvIHJvdXRpbmVseSByZWFkIHRoZSBzYW1iYQ0K
PiBwcm9qZWN0IG1haWxpbmcgbGlzdHMsIHNvIGZlZWwgZnJlZSB0byByZXBseSBoZXJlIGFz
IHdlbGwuDQo+IA0KPiANCj4gVGhhbmsgeW91IGZvciB5b3VyIHRpbWUuDQo+IA0KPiANCj4g
DQo+IA0KDQo=

--------------pIO9STQI16rB0NDqDXYqpB3t--

--------------vD01SusAiS1HQFdmkdrlIgde
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmVovZAFAwAAAAAACgkQqh6bcSY5nkbd
+RAAlCeKaFqOO1XKem1jnh4BQtJRdbsMk9L89qvQ60EqJF6DNtCFOP+CN91cyXkCb54nILGGMvTq
NV6aBH7KA7yBEZhbWFArML3PCJV9qVk/pqCKXDig45XZ9fyPXlcUpPD2fB0hVNKwz51crX5bFYVh
TjKTivVrmfkNzIXyuwRNfn1pkjOpTd1E6uUg35UgqJRFjtMkpUsx1vyz+9nqV4q6XP+BT/3C9FGp
AUL8+3Hvm/jS8CGt2oHs0gMsv2VbKnHDKgY101wMkY/zQTjMaG14gJdaOKUtIYjY1oj3uvKBvq9q
ed4KHWNhxUbGIvLLfjXpa6oFA3+Or/CjEdmDvULUlW76wG9CTr704pipfzyGuinF+u+ANoUgAmXc
aWdZcH871SOO/kHd4OZsY7GFWxC9ev6OclEHGwyuRk42dawz8E12cWQfkaZm3YbULWRJ8wvlqUy1
M3B35iO9rwPrFiHeBdDMBgkVZXTd+M/ELCLeP25uHVXXxSLh5TGGPcb9nbZkhzJWQl5QOvBj9gEE
M78cwqB9PmisRnfeCAf/w3GbF5Uz0sGpebntcBMQnpgXjttbp3Am6/1W4Lzjjz+8dbokCcM7MbZb
x1b2gLF1tUVAfXIrut5lGIaplshDOrxYSZ0bKzvyg9cL7TwZzv7NFeV21WhVBwIzTsmFCUeRz2ZU
A8Q=
=kAdk
-----END PGP SIGNATURE-----

--------------vD01SusAiS1HQFdmkdrlIgde--

