Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A79B757A420
	for <lists+samba-technical@lfdr.de>; Tue, 19 Jul 2022 18:22:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=i+L/oMUeNgKBvLA80lMVogvDvR94eyMVbDZqCTd40CI=; b=z+ODJs7Ivo8WfPkBH4owot464L
	2MWTGPm+qpbD7BTX4SbNXoXHPyGLv92tWsGCr8I2fDU0VvyHfmDBnm7AOyMG2ssAF3vMYOb9tzGky
	0frbdyxUOLvzdsSv3m5ZjhumE8nIbK28njmFv/b1h2ok7PPHM9rmKKwcj3oq001EiOSK0kuzyaNcp
	CcNlteBECGIbcPbLt1fwuWlApwAumbmXHXzQ0zYralTqnRZT0S5t5IyVgS9ifTn3ywhKX10Y+cDUe
	Lf56apWQI77aDY+12kMA/OV+LAILB+KFPTtNjZqO6oWa49CBdJ5j0nCCA6c+j6VnQhcfw2q8f2XvP
	lsf0UV2w==;
Received: from ip6-localhost ([::1]:57422 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oDpyZ-000tPl-Sz; Tue, 19 Jul 2022 16:21:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61888) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oDpyV-000tPc-4R
 for samba-technical@lists.samba.org; Tue, 19 Jul 2022 16:21:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=i+L/oMUeNgKBvLA80lMVogvDvR94eyMVbDZqCTd40CI=; b=E4EUgZtL+4M42NrpwVHqjFOCaw
 FnsMQg91RKe2KyD50y0uSakWibhmkaqMGfWUxM0E6Fwld9p4Ukyv+A0o2iuh3WRC2P3Z5DweWNMUX
 mcSvjN37y0EX68IlZcUC1tFl+ZVHtvs6iqLQKCLahItZFkDw7X0D9NiQCQXe7Ox5SgScBpNeG/8jo
 o9ocx/2yFx76fXJZEX5H4USTa7liQvdQ5urbDH6PElSwtIR6eu3GYgjlcuUhuVHgKbXUpUj9th50z
 aaUNCQYkVJZLTiMyPQDqUAzhTWUTeLfFDyu+fELzjFQtPSrV8sZ5mID6U9ORWtpSuTdAF29g0+Zzs
 X0PN4ojtuXhlaHdRVgkJbluchesjG5NC65xhifxd7Q/S9X8F1+eW8PKUG+kuhQwuYJJ5lCt+GBRF2
 zsWg2uLJrHVCXGH/aBvYQAn/YHTvBkwYls/qyrYSvL3zxqUAV7TtJL4Kpi35NxPTO9B5fwVaubf+/
 DrGl7Tx4lo6dGupM5BBz21Yl;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oDpyT-005Ubp-NA; Tue, 19 Jul 2022 16:21:29 +0000
Message-ID: <2c1bdb62-8bdc-a80e-3a22-609c3150c883@samba.org>
Date: Tue, 19 Jul 2022 18:21:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Issue if SearchResEntry and SearchResDone CLDAP responses are in
 2 packets
Content-Language: en-US
To: Shilpa K <shilpa.krishnareddy@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>
References: <CAHbM3qimf=1xi0+UMZa5QFKDr0_JdHz2MF=T-bMBO8ZAhuzP8A@mail.gmail.com>
In-Reply-To: <CAHbM3qimf=1xi0+UMZa5QFKDr0_JdHz2MF=T-bMBO8ZAhuzP8A@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SMFFcCR45xosqqlSvRdZNqTy"
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
--------------SMFFcCR45xosqqlSvRdZNqTy
Content-Type: multipart/mixed; boundary="------------wbtgryoYPmW4OxrZLumqGUMg";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Shilpa K <shilpa.krishnareddy@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>
Message-ID: <2c1bdb62-8bdc-a80e-3a22-609c3150c883@samba.org>
Subject: Re: Issue if SearchResEntry and SearchResDone CLDAP responses are in
 2 packets
References: <CAHbM3qimf=1xi0+UMZa5QFKDr0_JdHz2MF=T-bMBO8ZAhuzP8A@mail.gmail.com>
In-Reply-To: <CAHbM3qimf=1xi0+UMZa5QFKDr0_JdHz2MF=T-bMBO8ZAhuzP8A@mail.gmail.com>

--------------wbtgryoYPmW4OxrZLumqGUMg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU2hpbHBhLA0KDQpPbiA3LzE5LzIyIDE3OjUwLCBTaGlscGEgSyB2aWEgc2FtYmEtdGVj
aG5pY2FsIHdyb3RlOg0KPiBXZSB0aGluayB0aGUgaXNzdWUgaXMgYmVjYXVzZSBTZWFyY2hS
ZXNFbnRyeSBhbmQgU2VhcmNoUmVzRG9uZSByZXNwb25zZXMNCj4gYXJlIGluIDIgZGlmZmVy
ZW50IHBhY2tldHMuIENvdWxkIHlvdSBwbGVhc2UgY29uZmlybSBpZiB0aGlzIGlzIHNvPw0K
DQpjYW4geW91IHNoYXJlIGxvZ3MgYW5kIHRyYWNlcz8NCg0KQ2hlZXJzIQ0KLXNsb3cNCg0K
LS0gDQpSYWxwaCBCb2VobWUsIFNhbWJhIFRlYW0gICAgICAgICAgICAgICAgIGh0dHBzOi8v
c2FtYmEub3JnLw0KU2VyTmV0IFNhbWJhIFRlYW0gTGVhZCAgICAgIGh0dHBzOi8vc2VybmV0
LmRlL2VuL3RlYW0tc2FtYmENCg==

--------------wbtgryoYPmW4OxrZLumqGUMg--

--------------SMFFcCR45xosqqlSvRdZNqTy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmLW2ggFAwAAAAAACgkQqh6bcSY5nkbS
DQ//emY+4YAWdfj90zvlGJNyidTu/vZP+OpA6+E3AH4Wu6L3n9ZReFECaV1cAWbTiGCiVERkM2g4
tuUrCImZUyTGELPuhoxqOT1cGdzr0Q4Kh1AdMZ0xlX8PC56vKX85sfrVgK9MLAdwDtBEE2ull05C
OAt4MQROkC9I1iR4ZDREBdKu3kQHvdsg5V32/AcaSMxBC7QQ4O4esahhboaMqAcCBgMVEzpkQL1A
mX8MdAXxyBUsD4/gUyBdzIg6rnhEDJhe3hgVKFGICVx85RbFQv/m2o7qcLJyyV+1rQIuDGVrM4Wb
p4fKigULHdffam/NYDKRPkjtvxF771bJvblr1+4SaMmMAk0ZVBZq4eqiTIdV2jOikVxVePKCGz3I
muiPcRptUFb6OlKExRHSCM+/8BqmCRe+g6B7GchqSUwIysltP+Led7zcNi96LIb3xqyfxuBRfeY9
ljYR0j7lK14o8pHo1G45Th83kO1ggyzwO+O4Wvp0UxVP0xVAmrLdyADb8+UFxhSoPut0Efe0ubz6
Dv1+nnihQc26HAzL8zsNlDXTgiBRUXNo/EYa/UndEP9GWnab5mJ4EgVmYqHrdFB/6VDnEvaYFWio
Ef+ejAstyOFM/ilMuh4Brmmg/d3tiyYaAXdOz+bMXFIOgKnxsVb8nvs+XmTDIRMq9Efv28wVbTfF
hNo=
=8Y1M
-----END PGP SIGNATURE-----

--------------SMFFcCR45xosqqlSvRdZNqTy--

