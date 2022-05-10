Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1DE52233E
	for <lists+samba-technical@lfdr.de>; Tue, 10 May 2022 20:03:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=kbHId0O6/KpvEc/oztPoEXORCKetKiOzilYu3Ked9TU=; b=Q/8UEqnK/p0w3PVK2k64PC3spy
	3LBOsDQCE7+eR1m/qfxg4LI5tPYksfZa7XdakyAapmFoCgVvhuOqHFC0YAFn7F1cYEQIt627CAZ0c
	sY/JixPhfpU0wJqz3/N82FMPoTxF3tLkkmXzaPmoAPQX13t7Pr+V7l5ipCY88m20jykRGiiDay2eb
	ILLK/CTXV2cr7u+VTaZ+XagcXztZny6kKw1/ZLsWAkxjpLUuh1bPsk2IGLDhHMhtv42G5vqQiltMx
	UrDWwP+zpXjvTQ2Q/pM8/yQnqyktox0DXt6RxUHVKQbyPmhFWo1X25hBnNbj/8ypb96ZAi98GJopW
	UdmxAt8Q==;
Received: from ip6-localhost ([::1]:61634 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1noUBy-000QlW-9s; Tue, 10 May 2022 18:02:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61456) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1noUBt-000QlM-JJ
 for samba-technical@lists.samba.org; Tue, 10 May 2022 18:02:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=kbHId0O6/KpvEc/oztPoEXORCKetKiOzilYu3Ked9TU=; b=m56oXgDgInfn8Kk40d3RMpJPUo
 IQ9q8QQSZa2srWsCb1iCTg6cjIv7WAc2E1My9hc+cVfAB2dURUX7AC/1ymDG+d9Buia+WALvvgQj4
 n+9d8D2L4guKn41XYR56rLisFtXFBoUwlnOcjkwFq38AM8BJq8kt4Uoj7dcmninZuIKfzSdwv1gTg
 GVvHwv6QYiJ6RqjQmi15k/18WTQ1Y89yix7oyC+a4F9Tt0/yhtYrCUtHj5KwJDyrkjfwijVrDDzr5
 Km9uM73TrmrYcjvJehZeN6eBXgqy9ECAXin+oJUh3UckJoKuQsdDIx9+0UUWshwPqpTqllq1Va+ir
 759ZWh71nDguPUCFVYJHnbzRMyEdI40bPjVcyhLRMhichoAKSn+Axa2fgcw102NsDR06P2cXSygKr
 V0jrBQJaYw+ueMz4fCVfi/5fhDi7iHLfxNTdwIF1HZeAFrw29JdULCFy7isgoy4xZRSJRBVJ0Q1fJ
 n1n0SR4wd3SFWHwxUmf3sJM7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1noUBs-000DCK-IQ; Tue, 10 May 2022 18:02:32 +0000
Message-ID: <004187c0-a4ee-8457-a1a3-8264efa56dc8@samba.org>
Date: Tue, 10 May 2022 20:02:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Can someone try buildar for building our bootstrap CI images?
Content-Language: en-US
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <cce05b792f8377095d010cedf715bdefdcc580cf.camel@samba.org>
In-Reply-To: <cce05b792f8377095d010cedf715bdefdcc580cf.camel@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CS5vudhZo8ME91FimFcJnIgL"
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
--------------CS5vudhZo8ME91FimFcJnIgL
Content-Type: multipart/mixed; boundary="------------ifCua0YXcnKexSKAoyQuUP98";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Message-ID: <004187c0-a4ee-8457-a1a3-8264efa56dc8@samba.org>
Subject: Re: Can someone try buildar for building our bootstrap CI images?
References: <cce05b792f8377095d010cedf715bdefdcc580cf.camel@samba.org>
In-Reply-To: <cce05b792f8377095d010cedf715bdefdcc580cf.camel@samba.org>

--------------ifCua0YXcnKexSKAoyQuUP98
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNS82LzIyIDA0OjU3LCBBbmRyZXcgQmFydGxldHQgdmlhIHNhbWJhLXRlY2huaWNhbCB3
cm90ZToNCj4gSSdtIG1vcmUgdGhhbiBoYXBweSB0byBhbnN3ZXIgYW55IHF1ZXN0aW9ucy4N
Cg0KYWZhaXQgdGhpcyBzaG91bGRuJ3QgYmUgbmVlZGVkIGdpdmVuIHBvZG1hbiBjYW4gYmUg
dXNlZCB0byBidWlsZCANCmNvbnRhaW5lcnMgaW4gcm9vdGxlc3MgbW9kZSBhbmQgZ2l0bGFi
IHBsYW5zIHRvIHN1cHBvcnQgcG9kbWFuIGluIHRoZSANCmZ1dHVyZSBhcyBwb2ludGVkIG91
dCBieSBBbmRyZWFzLCByaWdodD8NCg0KSnVzdCB0cnlpbmcgdG8gY29ubmVjdCB0aGUgZG90
cyBvZiB0aGUgdmFyaW91cyBnaXRsYWIgcmVsYXRlZCB0aHJlYWRzIA0Kd2UncmUgc3Bpbm5p
bmcuLi4NCg0KLXNsb3cNCg0KLS0gDQpSYWxwaCBCb2VobWUsIFNhbWJhIFRlYW0gICAgICAg
ICAgICAgICAgIGh0dHBzOi8vc2FtYmEub3JnLw0KU2VyTmV0IFNhbWJhIFRlYW0gTGVhZCAg
ICAgIGh0dHBzOi8vc2VybmV0LmRlL2VuL3RlYW0tc2FtYmENCg==

--------------ifCua0YXcnKexSKAoyQuUP98--

--------------CS5vudhZo8ME91FimFcJnIgL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmJ6qLcFAwAAAAAACgkQqh6bcSY5nkZL
vg//eOcn4eDQ/6biIApkX9elS1otB59xezWGNlIMaVYplYAWcsG51OauNSF6ZsJDEbz0TnOXWa6l
sV9LsyxajIxBcaevovnhTCx7ctbIJmjnmH1lQhYblXAtHL+E0NIPnJAZOVHjacAeBvHJuJBLDP66
pok94dw/R3mBBs4GJdmYkK0BdgGzfftBGn7EcIY6OIfzddkwZ2eXMcL3m5nMRocuMsQOFTbsa8I9
5zVAuSNV2vGNo9LyyhUM2BSvMy7CtQrUopDMlpQxaJl7IU6U8EkM3nDWKHqUv6dW/WXm0kyaent3
XQ7Xd7e9aVqkILxQ3yzKm5uVkQ+aG0fLFv6MUnb8wRaAtbVMNxY354Hvd5n/t9vGzK8NmXuN0v0K
isiB5upmUopBB9lj6gb9IealqSxJLCESkYbnUYfEjfk3Q5CQS6gr9s+WEsEyQS3BNypa/QSEZZ+d
WYKKiRxnOuNKXlcqhgZ6zN2CTKOFz35m9XSKnhjaAikxmQdpZ/K2C2Fsm3UUg/DyZiCZpIgDFv5T
JUBibRmFBXOGl3DgBE9kpKbG3/pnPYkqTEHCQw7XPA/O1fV9+9Cjf4TsfaWbZOQHiS1jDSntPAC7
UN4m30LySdolmyqAg4H4hAowr9sZ7kxToJid3mSgsFiTfFGiu3eBw393gCPIerYf2S7caIJj0D06
uys=
=9q0N
-----END PGP SIGNATURE-----

--------------CS5vudhZo8ME91FimFcJnIgL--

