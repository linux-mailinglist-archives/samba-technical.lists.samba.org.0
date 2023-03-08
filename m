Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC296B0BE5
	for <lists+samba-technical@lfdr.de>; Wed,  8 Mar 2023 15:53:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=zUJMn6iLeLKzNhP5fItnMlrIgqWPRWXavzZC1C7J0Hs=; b=UrDMd3f4PfnNmRwAxYVd6Qe4IB
	oAhN+IWtKzIp47H3HNR8YIr/u7OpjsauUbJGve/HTrfa72TOHYHArtsmDQ+Z/H21DijGV9u1dSsgb
	GNHDlosJ3dopMz4Vd+Qcwqn9UXVagZc0KIVMRbvv0FMzYvudAU3JtFYkI0QcUmvEiXS61ccqPRiH9
	kzip++5pd8FDvcZ4kBLC+FIynGW2WVOPLWh+k+6KeluYBvfjz1Z1XyR01qlAYS/7lravsgJvqCPOi
	CpRKaVMEwRtPy3qIYP/qe3tAzay4K1Qj2Lke+wQRGZ7rkj81xhXqC5xTCGgLo+lEXnIoqSmR/4ncI
	OjVENB/A==;
Received: from ip6-localhost ([::1]:61572 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pZvAh-000ISk-Tg; Wed, 08 Mar 2023 14:53:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49664) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pZvAb-000ISb-7l
 for samba-technical@lists.samba.org; Wed, 08 Mar 2023 14:53:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Cc:From:To:Date:Message-ID;
 bh=zUJMn6iLeLKzNhP5fItnMlrIgqWPRWXavzZC1C7J0Hs=; b=C9Mkz268ZoDqL/gNdBBzYgVzxT
 npd5kuZyBR+Hok6uHrS1AyRMvZZPJFAvzfkpl6ucnCN6YRkjQQRvp9+DszZZ031dhUSMv+Ot9PZ9p
 YlnZHydIZE9vRppDLR8UA2HWANdTpOIJsgvDMFCWXaafLfqdK2Pdxnvb0+k3fURo+BzZfdbY+Wx4n
 bccAect/zEAI77vJ3WOSwGJWIa9s4G4Z3M5h82IiJ0+H0abyYgeqdaBPOn7llwksLzBAl2QTk3Lh4
 ofGzOAoFU9RNDnyFKM5UBvlF4kpZAt4Mr6Bw+Q1XnNAnsuBbY19HIQW/WsXkyZhaGgSrUgXUto9pU
 cXCImoOkWYI/xqh2qCR8fe1uWCG0NLnZZM94+MUnbOsYsXJz+uOPBDjv8MYnnF9V10gdITFHk8ibd
 F7C6ps3C7JmEbgbb2SycJiaTWi1JJdEDeShaJbh6c0BbQy6yVcX/88SvYuVlCpUj/ArtubtAQ8Izg
 dbO9y7l2yFxvuzohAi0t/nUm;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pZvAZ-001U1i-UC; Wed, 08 Mar 2023 14:53:32 +0000
Message-ID: <7bc0c282-e9e6-ab70-6dca-227bb9802ef3@samba.org>
Date: Wed, 8 Mar 2023 15:53:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: David Disseldorp <ddiss@samba.org>
Subject: Ceph RADOS linearizable?
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------b6qIviG0MytPQAkW3gikCyux"
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
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------b6qIviG0MytPQAkW3gikCyux
Content-Type: multipart/mixed; boundary="------------Z1jOjXxVxl0Nu000NPvE7YtR";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: David Disseldorp <ddiss@samba.org>
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Message-ID: <7bc0c282-e9e6-ab70-6dca-227bb9802ef3@samba.org>
Subject: Ceph RADOS linearizable?

--------------Z1jOjXxVxl0Nu000NPvE7YtR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGV5IERhdmlkLA0KDQpJJ20gY3VycmVudGx5IGRvaW5nIHNvbWUgcmVzZWFyY2ggaW50byBk
aXN0cmlidXRlZCBkYXRhYmFzZXMuIEknbSANCnRyYWNraW5nIGNhbmRpZGF0ZXMgaGVyZToN
Cg0KaHR0cHM6Ly93aWtpLnNhbWJhLm9yZy9pbmRleC5waHAvU2FtYmFfb25fU2NhbGUNCg0K
T25lIG9mIHRoZSB0cmlja3kgdGhpbmdzIGlzIGZpZ3VyaW5nIG91dCB0aGUgY29uc2lzdGVu
Y3kgbGV2ZWwgWzFdIA0KcHJvdmlkZWQgYnkgdGhlIGRhdGFiYXNlLiBUaGVyZSdzIG5vIHB1
YmxpYyBSQURPUyBkb2N1bWVudGF0aW9uIHRoYXQgDQpjbGVhcmx5IGRlc2NyaWJlcyB0aGUg
Y29uc2lzdGVuY3kgcHJvdmlkZWQgaW4gaW5kdXN0cnkgc3RhbmRhcmQgdGVybXMsIA0KSSdt
IHByZXR0eSBzdXJlIGl0J3MgbGluZWFyaXphYmlsZSwgYnV0IHRoZSBvbmx5IHJlYWwgcmVm
ZXJlbmNlIA0KbWVudGlvbmluZyBsaW5lYXJpemFiaWxpdHkgSSBjb3VsZCBmaW5kIGlzIGZy
b20gYSBSQURPUyByZWxhdGVkIHJlc2VhcmNoIA0KcGFwZXIgdGhhdCB0YWxrcyBhYm91dCBh
ZGRpbmcgc3VwcG9ydCBmb3Igd2Vha2VyIGNvbnNpc3RlbmN5IGxldmVsczoNCg0KaHR0cDov
L3d3dy5jcy5udGh1LmVkdS50dy9+eWNodW5nL2NvbmZlcmVuY2UvMjAxNl9JQ1BBRFMucGRm
DQoNCkNhbiB5b3UgY29uZmlybSB3aGV0aGVyIFJBRE9TIGlzIGluZGVlZCBMaW5lYXJpemFi
aWxlPyBJJ20gcHJldHR5IHN1cmUgDQppdCBpcywgYnV0IHdvdWxkIGxpa2UgdG8gYmUgc3Vy
ZS4gOikNCg0KVGhhbmtzIQ0KLXNsb3cNCg0KWzFdIDxodHRwczovL2plcHNlbi5pby9jb25z
aXN0ZW5jeT4NCg0KLS0gDQpSYWxwaCBCb2VobWUsIFNhbWJhIFRlYW0gICAgICAgICAgICAg
ICAgIGh0dHBzOi8vc2FtYmEub3JnLw0KU2VyTmV0IFNhbWJhIFRlYW0gTGVhZCAgICAgIGh0
dHBzOi8vc2VybmV0LmRlL2VuL3RlYW0tc2FtYmENCg==

--------------Z1jOjXxVxl0Nu000NPvE7YtR--

--------------b6qIviG0MytPQAkW3gikCyux
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmQIoWsFAwAAAAAACgkQqh6bcSY5nkY3
nhAAhlJxVOxoZAwvh4GN+BzKfYBUJPPUnPtm3ZC+Ja3pbltzZM6WOqk4J1vQiAfm2hmERjKCEhBb
toZWxrCLNc/+MBtOFNo6c9QJVXOfxrPPKmkGpnmVhpg2ABeXPlH/AiTYgfNLwmwG0vdD5t/50+4Q
MwPr79p2Mw+eb/YlzUoSP5DbhQL9IwEdudlEMJ+7aHCkxJye3EWFzQYWBeOxq57Y/x6GSzlDan0U
1RbxV3KzR/cq3gOz2nk8EEl3/w9HbI3Hjxcw1noM6oIwcDC6savOZ+iT2kmRbKOQIXrYaoVmw2ba
qrtK+lWqLlW41fMOX23QO0n0j2KwU5qWm9LSNoO/e80WhiJLnZYvA5PFU5DDoEpIkeCI20BHd/a0
phFKyofjSW+2jTEMvywkiPes4n8q7FQjM6vUYt2mV+rRWYu5jNpGch2Q0iFcezvaBgsiSk5lz5Xv
q/2YDv8CHWYyUJVhHXj988Ig5F/zE9dETZpSK4+B9NwBBY+5+5oWjnGsFb9NU1lnFt3nBwmzKtmN
kqPjXZ//5KroR+7CiYjyqeRkKKdMcYIkrfoTyYk+vw7NuWgYlHfKW7Rym3ZqD1qZweRW5CyEgKdT
RJaHvz59aR2yiJSFFIGxvsN1P7R4eHhmRgorzeVEQElVdC5Mu6f0whYBe1jBgZDDSzgJKXtylt41
BCg=
=Soue
-----END PGP SIGNATURE-----

--------------b6qIviG0MytPQAkW3gikCyux--

