Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DA944629C85
	for <lists+samba-technical@lfdr.de>; Tue, 15 Nov 2022 15:46:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=nOwxZcwiJ6vWn3YcN/MTGVRmXhKI+Ql6/df92DO0+5o=; b=EYf6Z6ZEqHVOCNnGg6px6TW95W
	9ehqUlrCZ1ygLSw+Hem1lUzSYoOH2RnQeweEbG0ziiK1SBTEn5agPfubq1ji8g+2Tv0XeSivzSU+S
	dcKJROi06F1YBa2JbQKoKJN/RLbjxQkIcDZvz4Rw5ofU7AhwXIrefTNZNQso6GA6Jcnh1B10MmT2D
	8nA3bSx7FvfBm2bR0DnomzTyUuXl90AV+BQU6qmI3I/oY5MUKIS0CSFffvKn+gF7lQ6xy8CktMKa8
	xgfB0clT+g9DMzy6oWRMGs7IlbGmKwriJnMNTolosSzwksqmstYA9Ag6PXdAG8jm9kkr7kCY3qTUo
	s+GaxxGA==;
Received: from ip6-localhost ([::1]:44554 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ouxCK-00DoDt-He; Tue, 15 Nov 2022 14:46:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57240) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ouxCF-00DoDk-Ur
 for samba-technical@lists.samba.org; Tue, 15 Nov 2022 14:45:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=nOwxZcwiJ6vWn3YcN/MTGVRmXhKI+Ql6/df92DO0+5o=; b=s3EkokgFEeh2+0XW5OOroH64XA
 lskk4QegpbVy4+lbEOMlAC6c3LraubFMZxwZNRetKkNsGZvrEP6ra0HrbKTIuW5f8yzmiIGoUZmnj
 hQKVnr0JqgnYwdrP659Hh77O941S/M+VASTVWLMaupTy3Cccc6iNGZZr9qsEBJibH6ej0Z7fv6i9J
 usJK+1FyB1f+CwN2Ytu1s33UUudMox5e2FiGLvGM8RaeZUxJP+WcZAq1Sk3McEWl92KFvYai7GOpH
 yfFmy2dW1KndhBzA2NjFhNDQPvbrH+aPaH/TIJuTpQyRa+UUgEiCtTnx4KqeF4KVa2rp2qdCY8mcx
 QU4+7MT0EEmjY6vu62TXUZpT3rVDxyWHzL4eo3sQGuandFAG02N3QKJlv8e3+SOoEW2MKcKNnfh67
 fidMx6VNC0XAREU5yklqTl4LKSpWlOwvVp+cfnr79IEdLokKtoLo5A1w1xjaYbDlvoW499Qrq+zr0
 OMhIzVUuGYIdiObMQeHEvaed;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ouxCE-008iKq-VW; Tue, 15 Nov 2022 14:45:55 +0000
Message-ID: <dccabfb1-bc92-6c95-b45d-8cc69f650fb9@samba.org>
Date: Tue, 15 Nov 2022 15:45:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: failing tests in the testsuite on debian
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, samba-technical@lists.samba.org
References: <4197c161-ef1e-3710-f50e-7631ddaf5f3f@msgid.tls.msk.ru>
 <de87d255-95d0-ac34-1544-fa0aac441f4b@msgid.tls.msk.ru>
In-Reply-To: <de87d255-95d0-ac34-1544-fa0aac441f4b@msgid.tls.msk.ru>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------aNo0e78wLPnMiQ95j730nTTX"
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
--------------aNo0e78wLPnMiQ95j730nTTX
Content-Type: multipart/mixed; boundary="------------GLGTEbBECOP0bMn59tDlPxZZ";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Michael Tokarev <mjt@tls.msk.ru>, samba-technical@lists.samba.org
Message-ID: <dccabfb1-bc92-6c95-b45d-8cc69f650fb9@samba.org>
Subject: Re: failing tests in the testsuite on debian
References: <4197c161-ef1e-3710-f50e-7631ddaf5f3f@msgid.tls.msk.ru>
 <de87d255-95d0-ac34-1544-fa0aac441f4b@msgid.tls.msk.ru>
In-Reply-To: <de87d255-95d0-ac34-1544-fa0aac441f4b@msgid.tls.msk.ru>

--------------GLGTEbBECOP0bMn59tDlPxZZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMTUvMjIgMTQ6MzUsIE1pY2hhZWwgVG9rYXJldiB2aWEgc2FtYmEtdGVjaG5pY2Fs
IHdyb3RlOg0KPiBJIGV4cGVyaW1lbnRlZCB3aXRoIHRoZSB0ZXN0cyBzb21lIG1vcmUuIFRo
YW5rIHlvdSBKZXJlbXkgZm9yIHRoZQ0KPiB0aXAgYWJvdXQgZXNjYXBpbmcgc3BhY2VzIGlu
IHRoZSBrbm93bmZhaWwgZmlsZXMsIC0gc29tZWhvdyBJIG5vdGljZWQNCj4gdGhpcyBpcyB0
aGUgY2FzZSBpbiBvdGhlciBwbGFjZXMgYnV0IGRpZG50JyB0aGluayBhYm91dCB1c2luZyBl
c2NhcGVzDQo+IGluIG15ICJrbm93bmZhaWxzIi4NCj4gDQo+IEJ1dCB0aGUgdGhpbmcsIG9y
IGEgcmVxdWVzdCBmb3IgaGVscCBhY3R1YWxseSwgaXMgc3RpbGwgaGVyZS7CoCBJIGZvdW5k
DQo+IG91dCB0aGF0IHNhbWJhIHRlc3RzdWl0ZSBpcyB1bnJlbGlhYmxlLg0KDQpzb3J0IG9m
LiBJdCBpcyBqdXN0IHBpY2t5IGFib3V0IGNob29zaW5nIGl0J3MgZGlzdHJvIGZyaWVuZHMu
IDopIEEgZnVsbCANCnBhc3MgY2FuIGJhc2ljYWxseSBvbmx5IGJlIGV4cGVjdGVkIG9uIHRo
ZSBzcGVjaWZpYyBkaXN0cmlidXRpb24gdGhhdCBpcyANCnVzZWQgb24gZ2l0bGFiIENJIGFu
ZCBvdXIgZmluYWwgZ2l0IGdhdGVrZWVwZXIgKHRoYXQgcnVucyBhIGZpbmFsIG1ha2UgDQp0
ZXN0IGJlZm9yZSBkb2luZyBhIGdpdCBmZiBwdXNoKS4gSWlyYyB3ZSdyZSBzdGlsbCB1c2lu
ZyBVYnVudHUgMTguMDQgb24gDQp0aGUgZ2l0IGdhdGVrZWVwZXIgYW5kIHRoZSBDSSBjb250
YWluZXJzLCBjZjoNCg0KPGh0dHBzOi8vZ2l0bGFiLmNvbS9zYW1iYS10ZWFtL2RldmVsL3Nh
bWJhLy0vam9icy8zMzI0Mzg4Mzg1Pg0KDQpBbm90aGVyIHRoaW5nIHRoYXQgbWlnaHQgY2F1
c2UgaXNzdWVzIGlzIHRoYXQgeW91IHNlZW0gdG8gYmUgcnVubmluZyB3YWYgDQpkaXJlY3Rs
eSB3aGlsZSB5b3Ugc2hvdWxkIHVzZSB0aGUgbWFrZSB3cmFwcGVyIGFzIHRoYXQgc2V0cyBz
b21lIA0KaW1wb3J0YW50IGVudmlyb25tZW50IHZhcmlhYmxlcy4NCg0KSXQgc2VlbXMgeW91
ciBnb2FsIGlzIHJ1bm5pbmcgdGhlIGZ1bGwgdGVzdHN1aXRlIGFzIHBhcnQgb2YgcGFja2Fn
aW5nIA0KYW5kIEkgY2FuIG9ubHkgd2FybiB5b3UgdGhhdCB0aGlzIGxpa2VseSBhIGh1Z2Ug
dGltZXNpbmsuIEVnIHNvbWUgdGVzdHMgDQpleHBlY3QgY2VydGFpbiBmaWxlc3lzdGVtcywg
bWF5YmUgaXQncyBhIG1vcmUgcmVhc29uYWJsZSBhcHByb2FjaCB0byANCm9ubHkgcnVuIGEg
c3Vic2V0IG9mIHRlc3RzIHRoYXQgd2UgcnVuIGluIG91ciAtbzMgcnVubmVycywgZWc6DQoN
Cmh0dHBzOi8vZ2l0bGFiLmNvbS9zYW1iYS10ZWFtL2RldmVsL3NhbWJhLy0vam9icy8zMzI0
Mzg4MzU3DQoNCm1ha2UgdGVzdCBGQUlMX0lNTUVESUFURUxZPTEgVEVTVFM9Jy0tZXhjbHVk
ZT1zZWxmdGVzdC9zbG93LW5vbmUgDQotLWluY2x1ZGUtZW52PW5vbmUnDQoNCm9yIHRoaXMg
b25lDQoNCmh0dHBzOi8vZ2l0bGFiLmNvbS9zYW1iYS10ZWFtL2RldmVsL3NhbWJhLy0vam9i
cy8zMzI0Mzg4Mzg1DQoNCndoaWNoIGluY2x1ZGVzIG1vcmUgZW52czoNCg0KbWFrZSB0ZXN0
b25seSBGQUlMX0lNTUVESUFURUxZPTEgVEVTVFM9Jy0taW5jbHVkZS1lbnY9ZmlsZXNlcnZl
ciANCi0taW5jbHVkZS1lbnY9ZmlsZXNlcnZlcl9zbWIxIC0taW5jbHVkZS1lbnY9ZmlsZXNl
cnZlcl9zbWIxX2RvbmUgDQotLWluY2x1ZGUtZW52PW1hcHRvZ3Vlc3QgLS1pbmNsdWRlLWVu
dj1rdGVzdCcNCg0KLXNsb3cNCg0KLS0gDQpSYWxwaCBCb2VobWUsIFNhbWJhIFRlYW0gICAg
ICAgICAgICAgICAgIGh0dHBzOi8vc2FtYmEub3JnLw0KU2VyTmV0IFNhbWJhIFRlYW0gTGVh
ZCAgICAgIGh0dHBzOi8vc2VybmV0LmRlL2VuL3RlYW0tc2FtYmENCg0K

--------------GLGTEbBECOP0bMn59tDlPxZZ--

--------------aNo0e78wLPnMiQ95j730nTTX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmNzpiIFAwAAAAAACgkQqh6bcSY5nkZs
FQ//frSzTGEfpvSdQnsOsIGOqwyvw+MbA4fPDR7PjFDUOhx9ahFuReuiqgF0AlppW+6MqucZLkMi
Y5UKL8eRS1RYZaN2LVk5CQJEBb6mYtruzUXyBqkCa5wGo7ce+fySr5gk/If+DXSBiw46Apq2PsuU
hnuyieLANAwnB7eCRR7zca+h5Zy00DGMPUpsh4QBkzS3Gd8L+dlXDC9rx93TLT1aTcvsGOvPWZvo
rVdkH2mmd4uoT1omHJDIr6FkVBp/nXbNWQ2fW3ebT2VIX+o81qH1OpQlEubfxLHPRExvWoBr0ODM
YCK0c08OwStnFbQRJkVC8Jofgap4AHfB4VMLIKSXuszbd6MqkKuVWb+NjMAgwmg9KsoPuoOCyH1o
MlHkfRhaCuS1AsKE8akkAV3Fd++FYteVVAo31zPQzdep1s2Gey12GWmefQoVq9OODiuSHxHu1Vwa
Eitrb2oZxbWuEB72006U5TReuO3YRWtiuBFchqEuexsypXbcLyD9fDg4EK377VWwOX7VePtFKwtD
NHU0ZdsyXaMLMWCjvKoKtP9HYwAMu8p5UmLVVV8M3JsC9HQG07L1oeiDChmfOmrjgLtWp5exwoxp
wzrGPjsQRry8iIav/eJCbM2xv8JPoNB6a80IsIxUa8Q/tFLjKmjAXVz6dD9pcvtHpF9QoL22BUtQ
lgI=
=0Aec
-----END PGP SIGNATURE-----

--------------aNo0e78wLPnMiQ95j730nTTX--

