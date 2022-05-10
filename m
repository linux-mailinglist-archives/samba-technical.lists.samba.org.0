Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E8B5224B1
	for <lists+samba-technical@lfdr.de>; Tue, 10 May 2022 21:24:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=AXlhZwH6xcr75pL24WEvaDkHDe5DIkr4wueHUSHZ9iA=; b=AOdDAlWHkScF76nDiDcrw6RDIy
	YBI1rnTUNagxXiFWJOlg4LBdfEduOWd81URLgy3F0kwsaRHZiSkwoHF8trmxIJ1rOQoJ5MHLKYb+P
	aFkYavqXN7JVB5naToGx7dxE3MQv3qO7yUNuZC1awz8d3CMNUaAKh0U4UqsNDiw+9JP9TBrNKSEod
	qimEeJ3fbt3MgzFbRtEtub+gdG/5Xoy9DZrfi/jOlYXlpw5kkVPGLtaMMpzTJmOQkDpYOtTHlBPUC
	RySC52SPGZaklKuUsTa++TpT5d8qfrKyruuuA0i9wuOvKmDP6I3QGscPIlWoqtGcJnpSBs1asQuTb
	g/BG7xog==;
Received: from ip6-localhost ([::1]:20462 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1noVSZ-000Tcl-7W; Tue, 10 May 2022 19:23:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61478) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1noVST-000Tcc-L5
 for samba-technical@lists.samba.org; Tue, 10 May 2022 19:23:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=AXlhZwH6xcr75pL24WEvaDkHDe5DIkr4wueHUSHZ9iA=; b=On/HxaNEeRvebXxF1rDx9V5cmq
 ZhJf6f/LTbCRQePHrtab6b044vG+knJH9CrgqfQpH2B9Iry0BbzVwRg22Y1z6a0t2XbYtdXjS2bPD
 L4iRlww8slhv9cDj7RTcjFyQAny8UvB3ybHYqAPlaZORcRjxh8/venCv9MSW5zMewY842QPHlqrRp
 GFjcffvzK6zG4IUk0twydleowhGWC7znLmFur8NnBnm0CTnwy3baC52VKbdX9SFffZOhO9mQ1vjw3
 qCju6wAk2kllWwPDvnTaWPAcFqJZbStZFhJjywKdmtjie+kkZ0ss11D5Y22G6sBVmBDbf5juJlSbQ
 Ob2ZqVNWrWeXZPCUVCjowz7uJxORCTit21eGjZOYrP6Msvkxlau2zWyMpzdDZPqVvp6HnlKIHCIqR
 exsCOvYuVjRT/QQrDdQqStZlZaq8630d6wDUYNq/vfT8uctgiTMqUjT9xWhgkJOowWg3rLIyx/rK8
 lP3R9dCgtibCKctdidz2tdyI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1noVSS-000EEQ-Gc; Tue, 10 May 2022 19:23:44 +0000
Message-ID: <3bbc4681-be2b-8ba5-a04b-9d8ec997f436@samba.org>
Date: Tue, 10 May 2022 21:23:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Can someone try buildar for building our bootstrap CI images?
Content-Language: en-US
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <cce05b792f8377095d010cedf715bdefdcc580cf.camel@samba.org>
 <004187c0-a4ee-8457-a1a3-8264efa56dc8@samba.org>
 <6138f33dd48dce98b7a2f8cc93353db4b55ad6cf.camel@samba.org>
In-Reply-To: <6138f33dd48dce98b7a2f8cc93353db4b55ad6cf.camel@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ULco1eVQrS6T6ie9UJRDUSfR"
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
--------------ULco1eVQrS6T6ie9UJRDUSfR
Content-Type: multipart/mixed; boundary="------------T0IpVTFK09V5aTxiVCn0e3GU";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Message-ID: <3bbc4681-be2b-8ba5-a04b-9d8ec997f436@samba.org>
Subject: Re: Can someone try buildar for building our bootstrap CI images?
References: <cce05b792f8377095d010cedf715bdefdcc580cf.camel@samba.org>
 <004187c0-a4ee-8457-a1a3-8264efa56dc8@samba.org>
 <6138f33dd48dce98b7a2f8cc93353db4b55ad6cf.camel@samba.org>
In-Reply-To: <6138f33dd48dce98b7a2f8cc93353db4b55ad6cf.camel@samba.org>

--------------T0IpVTFK09V5aTxiVCn0e3GU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNS8xMC8yMiAyMTowNiwgQW5kcmV3IEJhcnRsZXR0IHdyb3RlOg0KPiBPbiBUdWUsIDIw
MjItMDUtMTAgYXQgMjA6MDIgKzAyMDAsIFJhbHBoIEJvZWhtZSB3cm90ZToNCj4+IE9uIDUv
Ni8yMiAwNDo1NywgQW5kcmV3IEJhcnRsZXR0IHZpYSBzYW1iYS10ZWNobmljYWwgd3JvdGU6
DQo+Pj4gSSdtIG1vcmUgdGhhbiBoYXBweSB0byBhbnN3ZXIgYW55IHF1ZXN0aW9ucy4NCj4+
DQo+PiBhZmFpdCB0aGlzIHNob3VsZG4ndCBiZSBuZWVkZWQgZ2l2ZW4gcG9kbWFuIGNhbiBi
ZSB1c2VkIHRvIGJ1aWxkDQo+PiBjb250YWluZXJzIGluIHJvb3RsZXNzIG1vZGUgYW5kIGdp
dGxhYiBwbGFucyB0byBzdXBwb3J0IHBvZG1hbiBpbg0KPj4gdGhlDQo+PiBmdXR1cmUgYXMg
cG9pbnRlZCBvdXQgYnkgQW5kcmVhcywgcmlnaHQ/DQo+IA0KPiBXZWxsIHdlIGNhbid0IHJl
YWxseSB3YWl0IGZvciB0aGUgZnV0dXJlLCB0aGUgbmVlZCBpcyBpbW1pbmVudCwgdW5sZXNz
DQo+IHdlIGRlZGljYXRlIG91ciBlbnRpcmUgR2l0TGFiLmNvbSBxdW90YSBqdXN0IHRvIGlt
YWdlIHJlYnVpbGRzDQo+IChwb3NzaWJsZSwganVzdCBjb3N0bHkpLg0KDQp3ZWxsLCB1bnRp
bCB0aGUgZnV0dXJlIGlzIGhlcmUgSSB3b3VsZCBiZSBvayBiZWluZyByZXN0cmljdGVkIHRv
IGJlIGFibGUgDQp0byByZWJ1aWxkIGltYWdlcyBvbmx5IGF0IHRoZSBiZWdpbm5pbmcgb2Yg
dGhlIG1vbnRoIHdoZW4gd2UncmUgc3RpbGwgDQp3aXRoaW4gdGhlIDUwayBsaW1pdC4gT3Ig
aXMgdGhpcyB0b28gb2RkPw0K

--------------T0IpVTFK09V5aTxiVCn0e3GU--

--------------ULco1eVQrS6T6ie9UJRDUSfR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmJ6u78FAwAAAAAACgkQqh6bcSY5nkY6
Ag/7BEu0p1L+uj6i7w/ZW5XZIANmlnnJQhFcDRTW0FlnMcmGgS5gllO1IEC4n6R/3Q561RNSlIrb
AWz+J2E3g54q/xqR3RfMDifa5HHZDHWdIDbLM5j4Wy0Y6FTcERj3xTc6a9Pt5dmLagersd48plug
Og4fKE+ow6zYxRpq3ReLdL70x82OeuOqaydFFkukZuii2Xj+frZZn+/1BZ5X2wlwv/BS1s/xRFel
6CidAimwTukS7KrpSmKonw7QxZXm3VAWZgWVg5BxsZkqMhOldKnRMyRdYNsAtPbmpjMcaUaGYLcK
TtHbVodT308UEu5f2L8rQjUfqsqug75Y780Cyikl+kpJBKEs6aSPs4lloxMq6I+YZcXp6mp2FYXU
gM3gUMFUO8iNAJM4FMUXCSbsXCDV+1MSsNkgQ1AazEStgx3RRRC/WKoR31xkyDiFdfZ6/i+ztlBK
gBlEGiSRPb2XH5ozt+yLNMWrZavZ4Ax26ayxPAtPzcD2Pm0IC9B53dEe1imOrRCDP9enmi3qjYDA
2ljY1/g1dyu+aEvgClBg6xDNcxDDd9Hu86TqAgxNPtqY+7ULlpvzj5UcOVr/fBZaTiW1X6D0GolB
mmd2J658RvutrYJB0IKXAto7JQ20hsrjwiCiqXbJ4jL5ZVbbN792ZkjNyh0jprwW6MVj0QHKUZVq
sjs=
=jMxl
-----END PGP SIGNATURE-----

--------------ULco1eVQrS6T6ie9UJRDUSfR--

