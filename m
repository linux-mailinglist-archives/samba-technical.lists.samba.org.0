Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 907446CA8B6
	for <lists+samba-technical@lfdr.de>; Mon, 27 Mar 2023 17:12:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=bkLasVM8gncW/lwbMRQUcz4MgLnQPS23VfX1eVpI9ps=; b=NfR5lgIhT3MZK6oEWo2Drp9Xce
	vKkQsQtE1KWRpghELG8VuLw3qACITqIWEwOAYAFdFGOwhZ2FwLJcl4nENSH2azvtDKtbmPDWpT5K+
	yo8pYhIM3luRXmejMQQ6U7CCP6YlJQV59pqi7uGpc7YB6KmJ7Khdb/VBGf/6vyGDDbxydi96BwEQ0
	UoM/4oQmPeybs/oIPuYRhWBFk0NEsZJaVVe2QubHfKTLygXdKn4ofDBpxOsLfahffXaxWazy45zWw
	So7G9W1g4Sdequ0of0vJeDSbhM1Vm2rGLNvZuXmOvvmBLb/eXZftV0k0P5YhsMs8jvVpVWzXh+hqv
	3+3Udo5A==;
Received: from ip6-localhost ([::1]:51652 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pgoW8-004eo9-OM; Mon, 27 Mar 2023 15:12:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62752) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pgoW1-004enb-44; Mon, 27 Mar 2023 15:12:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=bkLasVM8gncW/lwbMRQUcz4MgLnQPS23VfX1eVpI9ps=; b=ovKz34HAaKwVrYJ0Sj2y4W4VqP
 At7mIQNF+AGPSFfG5oEx039s5ic0ZnCVW3MxDRYa/tqqRrZup11EULOzFJVsj0kvMgbCKMhDl6+iZ
 p3C32n4CFE9q0TnCHxmqlzpmeYpy6DrHDdOdnAFRFxlOEDzqup3fdkGSHPxY3FT2AyavODhDPicYS
 uvfrwTetmWwyUW0L9CV8B4Jfga7bt5A9VeFDQ0exhOcLbcYm+cxKY3S8uANq+mNS/kI+kZdkR88rB
 MVlAE+XtnsCOxXCo47o68wrkg6OKGTUpC7BT0z73Sy8AFlqNeFtM7b4/0YMreXYi9cEAl5MaYajhs
 Cu7BQMDzYiLj+AS6JKqI91fSKoOAdyy3ItSDYQ8A4QoCOyOW7GSS5qf+nnQsUB+S710XuO7PJRX+6
 7943OzNV3o6YbLy7O8wxnjsb3kUP4eLuwBRSRcnmvIy1xS8ph24QiBU6GW/SVgFVswfQ0gF4GCgmR
 KGlmBoy28drUv7x99WXZ40fX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pgoW0-005fb1-5Z; Mon, 27 Mar 2023 15:12:08 +0000
Message-ID: <4065822a-bc92-4e79-8959-e0f71c68d100@samba.org>
Date: Mon, 27 Mar 2023 17:12:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: SambaXP '23
Content-Language: en-US
To: sambalist <samba@lists.samba.org>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
References: <049e77cb-5862-a8cc-0954-7eef43234bb0@samba.org>
In-Reply-To: <049e77cb-5862-a8cc-0954-7eef43234bb0@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------UhUVk8ZpCtoXUD5V40O8jj49"
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
--------------UhUVk8ZpCtoXUD5V40O8jj49
Content-Type: multipart/mixed; boundary="------------TWmiByIzhb4YjIzZ7ZhV1qrm";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: sambalist <samba@lists.samba.org>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Message-ID: <4065822a-bc92-4e79-8959-e0f71c68d100@samba.org>
Subject: Re: SambaXP '23
References: <049e77cb-5862-a8cc-0954-7eef43234bb0@samba.org>
In-Reply-To: <049e77cb-5862-a8cc-0954-7eef43234bb0@samba.org>

--------------TWmiByIzhb4YjIzZ7ZhV1qrm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMy8yNy8yMyAxNDoyOSwgUmFscGggQm9laG1lIHZpYSBzYW1iYSB3cm90ZToNCj4gVGhl
IDIybmQgSW50ZXJuYXRpb25hbCBVc2VyIGFuZCBEZXZlbG9wZXIgQ29uZmVyZW5jZSBzYW1i
YVhQIHdpbGwgdGFrZSANCj4gcGxhY2UgZnJvbSA5dGggLSAxMXRoIG9mIE1heSAyMDIwIGlu
IEfDtnR0aW5nZW4sIEdlcm1hbnkuDQoNCm9vcHMsIDl0aCAtIDExdGggb2YgTWF5IGlzIGNv
cnJlY3QsIDIwMjAgb2J2aW91c2x5IG5vdC4gOikNCg0KLXNsb3cNCg0KLS0gDQpSYWxwaCBC
b2VobWUsIFNhbWJhIFRlYW0gICAgICAgICAgICAgICAgIGh0dHBzOi8vc2FtYmEub3JnLw0K
U2VyTmV0IFNhbWJhIFRlYW0gTGVhZCAgICAgIGh0dHBzOi8vc2VybmV0LmRlL2VuL3RlYW0t
c2FtYmENClNBTUJBKywgU2FtYmEgcGFja2FnZXMgICAgICAgICAgICAgICAgICBodHRwczov
L3NhbWJhLnBsdXMvDQoNCg==

--------------TWmiByIzhb4YjIzZ7ZhV1qrm--

--------------UhUVk8ZpCtoXUD5V40O8jj49
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmQhskcFAwAAAAAACgkQqh6bcSY5nkbl
WBAAsut55U+LPs4SQ5q5+muoxaPtDXO3dEZYIrrPxgvG56f48nuch7hSVmwvyc/bFjYMN3Owe2HY
oxCSX+HXVMt5iCiAM8SveR6BZGzPxdsLL1PTqJCLnVUEWSNrWAsrpZeT7Z0TRzaKhKVSkMJ6jLSq
t8p6Em3UYv9SR5BeaxFt+dvCUZsbCqyVFNxCDgnACQqT0Tug7QkFMVURtlmA6aRDBtOjfOTeIFPZ
w5VkzAeeI2PsYjWwjAkH30rFGSnKQFul3Snul02sBQwdQKKc1jTwTT5/D7fCDF5hiIpsdrRYPOVd
PobhD3aZrfEBGFRxeakGkgw1C8DtR4n1MznMmkhqGUZJRyh2SQPDP3ncsLrzyAS6rou7hcVDmAxi
bW5ymJDNEsyoH4bEj7Z6cJMkRdHjPMJpD48DsaCkxaVow/nDTALn6CnYKHFLWqWwStlxU31ieLGj
0bc+5JvBB+AP6YnSlIK3zazT1KIsXYyU2aCaoBGLwraqpuYQfy19RJQDK7fpP3iYujPeoVT8aZw8
z2flgFp5G/J2QGo+2RZ6Fm+AWTNk+GdZktn9fc5BzSZu0lmOzEl33vAZUcKzxxALNOy/DlKBTEdQ
hPuu4Ucv6DprTEMm4Kx4euLnUsxGx6ntfz8JzXkUwsh2FFWULUxK6DOIIPt40B4UI+VGLz2tqCVZ
Ii8=
=QosF
-----END PGP SIGNATURE-----

--------------UhUVk8ZpCtoXUD5V40O8jj49--

