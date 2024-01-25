Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B69683BEF6
	for <lists+samba-technical@lfdr.de>; Thu, 25 Jan 2024 11:34:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=d4dqZ5zCQR2dhyN28BBiOUfD/MqW2HG/AgQIX8Gd/Cg=; b=MA02Y48q/AUyHTYrVmB/NPPGw5
	uhjjDeOsPVg9/KWkIqcNQlAGwUcEoCdYRb4aZG88uweSEbRebbFEMIbVXu4qQm8KMfGWFUYxrb9hA
	WCe9HfSDJKYpDVfIGNFR42B9fdhjV7lzIOrV0aBBSPQMLO174p4QC53YRYFvThys4lyWNteo2oUEf
	eY4hKEGLd8exKCmMkWgk3LeRagxtQPr4kmgn2OFs/YZqRVKT1m6TiyO/XLJXmcNTQzknNp1P7FTv2
	6PVQx8IqUJRbz5QekechcMV6h186PLZYzrcGRsnl8JLhNc/kiwgns9lwFmtm3S5XlwMgpucABF2Er
	ncVHRtMQ==;
Received: from ip6-localhost ([::1]:33882 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rSx49-004PRg-9l; Thu, 25 Jan 2024 10:34:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44368) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rSx43-004PRZ-TV
 for samba-technical@lists.samba.org; Thu, 25 Jan 2024 10:34:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=d4dqZ5zCQR2dhyN28BBiOUfD/MqW2HG/AgQIX8Gd/Cg=; b=quUgViSRXUE71k9rhc5+CN2kxp
 qmwwZQ5oDEiv8Z6TdWbD1U+J3X3nvSuzdpVg/wmPVFPZOuj1RfESWxBiSaYFBkPsHDM5Lzqg27CB1
 1eJjbmex1MCpMLHavp0d22VKk+2oRWWQSffbo/uemKy3RNQd/G5GSHnJU8RVLmvZweMysKPAR/4k0
 f+2BhY7uUrpA5w/40V4q6n9wFPKuyF6hjyXXsTsACeCTx2lBOdu+4kbry1dHIpfS0nZvy06dT3GAq
 +N2wy0LBerc/p8y7HVQMdvpPOJ5aCuaWKDKH5vgHsub3kb0B2o9fuOacpDOke1Z6O4uJJYykVkFDH
 79hhbGh/3l509HW4cKGEdbVSZOFQrXs7Irm600pV3p/Xpj/MYAbBx0ODbGj2xtYo0nCfPrRE+enQm
 WmUz+PEYr+OFLZJAjrH83gYkfZ3oe3dD67vhUd/zT/Sz4eI0noRX38b3Rqh1HRJ/R51yVdtp79yp8
 mI+RGBc2ebDGpO5nI8khChCi;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rSx41-009hQn-1D; Thu, 25 Jan 2024 10:34:29 +0000
Message-ID: <c3229d40-484b-429d-bf9f-dd3424c866ae@samba.org>
Date: Thu, 25 Jan 2024 11:34:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: What is needed to get the patch in bug 15376 into the tree?
Content-Language: en-US, de-DE
To: Andrew Walker <awalker@ixsystems.com>
References: <C73B7A27-134A-4BA5-B7B4-AC88D98202C5@lysator.liu.se>
In-Reply-To: <C73B7A27-134A-4BA5-B7B4-AC88D98202C5@lysator.liu.se>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JA2EZmAXrb53L4tKnOxW0apI"
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
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Peter Eriksson <pen@lysator.liu.se>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JA2EZmAXrb53L4tKnOxW0apI
Content-Type: multipart/mixed; boundary="------------S0UKHAS0lsJLs4MRki3AdPXa";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Andrew Walker <awalker@ixsystems.com>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Peter Eriksson <pen@lysator.liu.se>
Message-ID: <c3229d40-484b-429d-bf9f-dd3424c866ae@samba.org>
Subject: Re: What is needed to get the patch in bug 15376 into the tree?
References: <C73B7A27-134A-4BA5-B7B4-AC88D98202C5@lysator.liu.se>
In-Reply-To: <C73B7A27-134A-4BA5-B7B4-AC88D98202C5@lysator.liu.se>

--------------S0UKHAS0lsJLs4MRki3AdPXa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkhDQoNCkBBbmRyZXc6IGNhbiB5b3UgdGFrZSBhIGxvb2s/DQoNClRoYW5rcyENCg0KLXNs
b3cNCg0KT24gMS8yNS8yNCAxMDozOCwgUGV0ZXIgRXJpa3Nzb24gdmlhIHNhbWJhLXRlY2hu
aWNhbCB3cm90ZToNCj4gSXQgd291bGQgYmUgbmljZSB0byBnZXQgdGhlIHN0dWZmIGluIHRo
ZSBwYXRjaCBpbiBidWcgMTUzNzYgaW50byB0aGUgdHJlZSBzb21laG934oCmDQo+IFdpdGhv
dXQgaXQgbW9kZXJuIFNhbWJhIHZlcnNpb25zIGlzIG9mIGxpbWl0ZWQgdXNlIGFzIGEgZmls
ZXNlcnZlciBvbiBGcmVlQlNEID49MTMgd2l0aCBaRlMgdXNpbmcgWkZTIEFDTHMgYW5kL29y
IGV4dGF0dHJzLg0KPiANCj4gDQo+IGh0dHBzOi8vYnVnemlsbGEuc2FtYmEub3JnL3Nob3df
YnVnLmNnaT9pZD0xNTM3Nu+/vA0KPiANCj4gDQo+IC0gUGV0ZXINCg0K

--------------S0UKHAS0lsJLs4MRki3AdPXa--

--------------JA2EZmAXrb53L4tKnOxW0apI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmWyOTQFAwAAAAAACgkQqh6bcSY5nkab
ChAAo3I+M+wSo9wICq2VABRuxt20KokOqJlyXOaNj295+F/ZzCbwggGgvcpJp4TWG/EA7ejbnns+
y0be83MSWavZFAbeStgvpcg0OAKN9T9AeYv7ePNqz/J9w7lb88nP2Ph/k4Js5P6WiEZ75Ih5E6Z0
ejYxOPM2CSYZn/kycL6RtlG+YUQ09eFcd3eH1awUtDtgyKQ99e0H+Q4nTEYoZoXn8gcvex39izx6
uM07wbEXfYzcpUtMYVog1J180ZotBNRRTimWMORTYfYlfYl1VeKM33REiLxp0Rn11z87+flgqq2w
zRxbGvl/WY4hxzSmsVQqFPiHaVrXcWCTd284onLraXcLZFxL7uRwHlhCA782eQs0NFO3gwDEdWSx
rN+UpwbjVdElFQNhZC8Uq9SsJAxKHbSiSP5HyNaDKqQbB4w67qmw8f4oPx6Ahh7M7rEUkfWXxAFq
ByzrL2XnIInJUO3/e6DLLVlvmMzlJimr0ija76ri5Zucv4B1/1Lc+ogWLeaEr1eoe4NqPXXpSHFZ
8C+azNVGp59s7qG4h3icqYNivpX1BYOxL2VURaYHotRGuk8wW4zRfuD+Qw1eyb/XzYtqDpuWpWP6
PJQ4iKh0Afrrh9OzsqRw/nEjiiiIzy4D7yc7uTp6JSWFuaU9Yw8jCVX5CB7FB//yWHJMfGgkIN9K
mlc=
=NkyL
-----END PGP SIGNATURE-----

--------------JA2EZmAXrb53L4tKnOxW0apI--

