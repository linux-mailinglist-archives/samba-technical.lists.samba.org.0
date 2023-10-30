Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B9C7DBC50
	for <lists+samba-technical@lfdr.de>; Mon, 30 Oct 2023 16:03:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=uq7DUWHFah2NQAq/07sVsBKjzUXKMqW/QD3Blx4IFPg=; b=og6iyF/WB2lOgJ7aUuBrG9qUZc
	HW87IB75X6RmwQAipck80oxPlF4VaVQ47/0Y8bznaoDneX2oQqonivkYZZU9kcSn9zLOzDouoN0DE
	ps9Kdtw1xslirTOj+9fg57AbfcQb9VPb9xopoxHBffoOpctXSswBPPS/z7LneY2pCp1JPhztUxf2C
	EH0Ag4WRkaPGas+PP2w+Pkk+5W8cvoEldcSFcxRspEU8XfRuPeoSHCfB7P+Y8B0Fa2qnjx6a6q5JK
	CWkrPUG1vQE0VBNwwxpTyYiSwjla04kvErs+QiUc2wCNUP5k2Mp5V4ZRXVkKtWFs5ylWwUONuafjW
	Zh7PgvtQ==;
Received: from ip6-localhost ([::1]:18016 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qxTnm-003ZPh-Lm; Mon, 30 Oct 2023 15:03:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42572) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qxTnh-003ZPY-9m
 for samba-technical@lists.samba.org; Mon, 30 Oct 2023 15:03:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=uq7DUWHFah2NQAq/07sVsBKjzUXKMqW/QD3Blx4IFPg=; b=a97jICgtEYtwRXUud+uPXwIxUw
 lT5v4i32qJwOgrel8STFKy74HONl+EIQJIjHH2J5ZAa96gNSADpcljMHM0uQbEfDbQ0ACSTgdVq7u
 1Q2pQLYZUZDlSZbWaVwM0JgEaMvWeu0EELZsFLfoRVcSvSEdQAFF2lzWLo1RR6Ix3V2E1uiwlUChB
 Ap8014s23uXsxRlRKXhhVEuePQJNgYn0LPDrZ1wX5WYvrs5dS5bge9cPmnICQkI5LCPWa72X0UdWX
 BI7DytqORQ8dHUMZDjfCWFa9I9S8pyPJBTpoK5JKD4OajSWFOPNNpGo/Max2VQm2rcX/gCkdcUJcH
 pw3YsZQvStMojZR/4ZYHkhfHAHOmi5VVtpTqMTqSb61ADG8cWLNn5ZLA27dwD1S7fqH4mRFvzYMlr
 mgikwwiEFWyQoywTjQIHnVKAjLw+sUpVk3hvW+nfrVK0DlV+/w3WYRavBrFPh6O0W5pdjk4etyuIJ
 luwAfYb4TE+F8CpERTjGZHXe;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qxTne-003L8u-28; Mon, 30 Oct 2023 15:03:30 +0000
Message-ID: <3b2fa1bd-2eae-482a-a9d9-543ebb921046@samba.org>
Date: Mon, 30 Oct 2023 16:03:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
To: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Subject: [SMB3 POSIX] POSIX client creates a file, set the ARCHIVE bit or not
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zcEMg01DWgJGkkjf8f2Boi6p"
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
 Steven French <Steven.French@microsoft.com>, Tom Talpey <tom@talpey.com>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------zcEMg01DWgJGkkjf8f2Boi6p
Content-Type: multipart/mixed; boundary="------------p91glEBcs9f2zhz7PggktU2u";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Cc: Jeremy Allison <jra@samba.org>, Volker Lendecke <vl@samba.org>,
 Stefan Metzmacher <metze@samba.org>, Tom Talpey <tom@talpey.com>,
 Steven French <Steven.French@microsoft.com>
Message-ID: <3b2fa1bd-2eae-482a-a9d9-543ebb921046@samba.org>
Subject: [SMB3 POSIX] POSIX client creates a file, set the ARCHIVE bit or not

--------------p91glEBcs9f2zhz7PggktU2u
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkhDQoNCkkganVzdCBzdHVtcGxlZCBvdmVyIG91ciBvbGQgU01CMSBVTklYIGV4dGVuc2lv
bnMgY29kZSBkZWFsaW5nIHdpdGggZmlsZSANCmNyZWF0aW9uIGluIFBPU0lYIGNvbnRleHQu
IFRoZXJlIHdlIGhhdmUgaW4gb3Blbl9maWxlX250Y3JlYXRlKCk6DQoNCiAgICAgICAgIGlm
IChuZXdfZG9zX2F0dHJpYnV0ZXMgJiBGSUxFX0ZMQUdfUE9TSVhfU0VNQU5USUNTKSB7DQog
ICAgICAgICAgICAgICAgIHBvc2l4X29wZW4gPSBUcnVlOw0KICAgICAgICAgICAgICAgICB1
bnhfbW9kZSA9IChtb2RlX3QpKG5ld19kb3NfYXR0cmlidXRlcyAmIA0KfkZJTEVfRkxBR19Q
T1NJWF9TRU1BTlRJQ1MpOw0KICAgICAgICAgICAgICAgICBuZXdfZG9zX2F0dHJpYnV0ZXMg
PSAwOw0KICAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICAgICAgICAgLi4uDQogICAgICAg
ICAgICAgICAgIG5ld19kb3NfYXR0cmlidXRlcyB8PSBGSUxFX0FUVFJJQlVURV9BUkNISVZF
Ow0KICAgICAgICAgICAgICAgICAuLi4NCiAgICAgICAgIH0NCg0KV2h5IGRvbid0IHdlIHNl
dCBBUkNISVZFIGZvciBmaWxlcyBjcmVhdGVkIGluIFBPU0lYIGNvbnRleHQ/IE1ha2VzIG5v
IA0Kc2Vuc2UgdG8gbWUuDQoNCkEgInB1cmUiIFBPU0lYIGNsaWVudCB3b3VsZG4ndCBsb29r
IGF0IHRoZSBET1MgYXR0cmlidXRlcyBhdCBhbGwsIGJ1dCANCnRoaXMgaW5mb3JtYXRpb24g
bWlnaHQgYmUgdXNlZnVsIHRvIG90aGVyIGNsaWVudHMgYW5kIGFwcGxpY2F0aW9ucy4NCg0K
KnNjcmF0Y2hlcyBoZWFkKg0KDQpUaGFua3MhDQotc2xvdw0K

--------------p91glEBcs9f2zhz7PggktU2u--

--------------zcEMg01DWgJGkkjf8f2Boi6p
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmU/xcEFAwAAAAAACgkQqh6bcSY5nkbz
YA//S871GSI+5aG2GQ4RTiIr+7N7qFLzoDeyRgkg5d6B8EbdZqo0HS/7vIbyl1//Ze2pSSYXuQq+
fmDM729+5FTs93TwZuF5D5VmKpSU8HzRGLiAUL5oRGs7ei10JHIMoVGfTz5DeZOCoIdomowTISW+
vbF6djuRIyfJGTf64qFp7LXbu78PN8fM5xdtutT83D4folxxR1FnRy9Pmt1IHvyaJyTe33KMNJQG
ApcNWRTQYWmO1pY0lh8cn1SMLmothx6ArLl3W2zp3VPLmvZ0GgjFJflswZdWwMj2Nb+lJAE4MHjE
XwMlOu3ErSTIHhahTzscM1mb2iNTsuRwyC8UzDGNzAZ2EB8g3cuvOXxVuHcmH+RSF5wcLlqnlSz9
0CmplEAupV2jxOStdcDqDztjs+0Gvs3HGnx0Sgg6aIGKeV8ePfHD1CHRZjhy0m2E0rSVpLFekrRC
8//4/g2CDOi3ZcD+GqkEeqCZAibdRSYid9J/AHR80nO66wmHTtO1n1b2YaG0gtiMq6qeh6C2j4Q3
rhfZO3oOZgZQ29fOqA0T+ByGhC4uuYhfUQc3ghPsbCcK17p3YkK0SFOSgoE1GsVjD77wzIZxuojM
9ws187pHjQoV1vx36HbQT3vw4SisauFeuY8RgakCgqeLo2xFqAJ3hEMmUSOyHrxTnGPH7B4sYo5V
h5M=
=1yHs
-----END PGP SIGNATURE-----

--------------zcEMg01DWgJGkkjf8f2Boi6p--

