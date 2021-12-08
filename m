Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2344B46DCA6
	for <lists+samba-technical@lfdr.de>; Wed,  8 Dec 2021 21:06:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=TRdAeqHebLjWpcXiECCtlobaXJ4RrhnkGUdjboco+NE=; b=5VO+b6/RXY2sqyWTBVE9NGrOsf
	Blfx94gXKZw4kZtcashUCqfnoWb0wvd2wWSRuzvB+X6ST+QralR7IzNomVItEluLHIGspazQ/tliG
	mshLk8fXYzuDsFl0LuEy1rw/R92xA3j+NPlB7vMs/PqZpV62v0lnh1e4KL8+01102eS35iyK6saWT
	GluG/hSH+mJl+QxCT1ToFqG3Blt1pqkJygoER2nLrQs9VKomJpx1551QLYxl6an0rqyB4+logFOts
	hlV3gujjYypslvQf6G//2rDLChKdYw8aVEAVCFZGjaPk8Sm2gXamNknaC3U8s6xmEwz5a/GDHuD6N
	5VCz6oMQ==;
Received: from ip6-localhost ([::1]:47350 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mv3Bu-004P6M-SC; Wed, 08 Dec 2021 20:05:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54360) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mv3Bh-004P6D-7A
 for samba-technical@lists.samba.org; Wed, 08 Dec 2021 20:05:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=TRdAeqHebLjWpcXiECCtlobaXJ4RrhnkGUdjboco+NE=; b=n2P7vE0KEobv0URnTypil5ccN8
 g7ELymxumgscSptuPrfNZXHG5PkFf688pDbVBo1bKH9A61R6wfSbXsLVEY2DCz7ot3yqorWd0b48k
 Dmf20yLx/vhBn6fZ49QzWknakE1X8mLmjcoEjYfZRMZJBdvs7LDB1WtCXYDCRtJ/lE0SraJpZj0in
 JRoyCv0+uXca2nkWik3RuyE8LrQ/Bds4RvEd1tNMOteRVlarXIWkzAY9+JWLacXVV6TYzkNa541UQ
 TdwjjLSLneCBktv/ZT4FE02qXElUnjkDt08hWqXb75bWVFIcN7P6y8+JEE5ph4Bnzew2iHHrTap3V
 fN9ZLdotNT5CSgWyhCL6he68neLzt7i69JorJprfKT/3CcYmUNuuVVRUfk10Zj3Gx55x5zHLDa/Qq
 7zJzkKP/j3zTbQlxBXgNpwGSv6UQVy+A6DAMo0BPF9LM3FWXiZaup1JDjvOiZ4rKuN9O3xm90w1bF
 qQpeobW2Xp07iYrFPmGA8s9B;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mv3Bd-001qqx-6D; Wed, 08 Dec 2021 20:05:09 +0000
Message-ID: <95c73e10-83c9-6107-58c4-527844a1c847@samba.org>
Date: Wed, 8 Dec 2021 21:05:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
Content-Language: en-US
To: Steven Engelhardt <steven.engelhardt@relativity.com>,
 Jeremy Allison <jra@samba.org>
References: <CH2PR12MB4152F65AF85E23297EB5146D9F6E9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <Ya/xevFuEmiugek+@jeremy-acer>
 <CH2PR12MB41528BA180EBB8C57C50F5E99F6F9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <CH2PR12MB41522ECF11B46232765D40FF9F6F9@CH2PR12MB4152.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB41522ECF11B46232765D40FF9F6F9@CH2PR12MB4152.namprd12.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6SUSAM4MDRodoutZLmP8R7DI"
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
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6SUSAM4MDRodoutZLmP8R7DI
Content-Type: multipart/mixed; boundary="------------ObT6Sk1hzmQUNgyT0Dqyzb52";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Steven Engelhardt <steven.engelhardt@relativity.com>,
 Jeremy Allison <jra@samba.org>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Message-ID: <95c73e10-83c9-6107-58c4-527844a1c847@samba.org>
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
References: <CH2PR12MB4152F65AF85E23297EB5146D9F6E9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <Ya/xevFuEmiugek+@jeremy-acer>
 <CH2PR12MB41528BA180EBB8C57C50F5E99F6F9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <CH2PR12MB41522ECF11B46232765D40FF9F6F9@CH2PR12MB4152.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB41522ECF11B46232765D40FF9F6F9@CH2PR12MB4152.namprd12.prod.outlook.com>

--------------ObT6Sk1hzmQUNgyT0Dqyzb52
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIvOC8yMSAyMDoxNywgU3RldmVuIEVuZ2VsaGFyZHQgd3JvdGU6DQo+IE9vcHMsIEkg
Zm9yZ290IG9uZS4uLiBoZXJlIGlzIHN0YXRyZXMsIHdoaWNoIHdlIHVzZSB0byBlc3RpbWF0
ZSB0aGUNCj4gcmVzb2x1dGlvbiBvZiB0aGUgc3lzdGVtJ3Mgc3RhdCgyKSB0aW1lc3RhbXBz
Lg0KDQpzbyB3aGF0IHdhcyB0aGUgcmVzdWx0PyBBbmQgd2hhdCBpcyB0aGUgZmlsZXN5c3Rl
bT8NCg0KLXNsb3cNCg0KLS0gDQpSYWxwaCBCb2VobWUsIFNhbWJhIFRlYW0gICAgICAgICAg
ICAgICAgIGh0dHBzOi8vc2FtYmEub3JnLw0KU2VyTmV0IFNhbWJhIFRlYW0gTGVhZCAgICAg
IGh0dHBzOi8vc2VybmV0LmRlL2VuL3RlYW0tc2FtYmENCg==

--------------ObT6Sk1hzmQUNgyT0Dqyzb52--

--------------6SUSAM4MDRodoutZLmP8R7DI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmGxD/QFAwAAAAAACgkQqh6bcSY5nkZM
rg//c/xeOFMPnKX1QDpdAT3Bm0WSyyyyxjcFWcQIZswSv2XECE5BJmBBjCBDSIyYFBTjyEgHXw/G
Zycf4xV6y+6ItvbXb2c/+yi5W6fQBMxDcsoAivtcUBO0VxcksVUW96sInA4OlNhTZPz95Po8JKxu
n/OhaGQmD+LYDBx/W9C5rP0K6Xde/ai6z3HWmctCLOGjn8mebX5ZQE7Fz+nWZyJbd4sOA5oumeqx
k37smO76Ub89IVl8zhCLNOZWsFWv0ixeM6ZIbiBbIZ+fa44Svay3ZnvWyhvEUzhhUBP9mkTjdceU
8X4a6X6/KBNwlOFGeYEcZMP6+DiH5owZNZoufUCImavXud6qA3fqj3GM/S22S55kAcXTM75Mm2Ai
glH9XT1Tq7jrO8Z5omtQIN2ZFp+o6SSS461KyC6t/29QWGsmH8T6D5aoUtNqnrjWY1EV8WPj+3W4
FTCBj4oiimpG/Fc1P3YSy70D1t1mCNV31EbT1q7C2DFt7P1JHjZbH8pOlI2/92JCDc7PGfExghI8
MyJ7RjrOKo25etu3ySQisGaY4gQqlN4lXBWF4CTRhiJYYBSFXB17nQROUcIiRQUD2YGJQaFti+Ek
UycvYagjqGdxm056jRLVrpklT1TwHCg4XOJUfLBlW8wrRNVB06OtIi9ufBQtTBuGlB1XwAcOwUQy
FuY=
=KUFO
-----END PGP SIGNATURE-----

--------------6SUSAM4MDRodoutZLmP8R7DI--

