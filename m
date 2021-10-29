Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DB73B43FA4D
	for <lists+samba-technical@lfdr.de>; Fri, 29 Oct 2021 11:55:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=go1WWUQXD3YeQPypt+Rylq7YM7eUSRHfr0qDN5wg9J0=; b=a21QnhnBI2v2UgZJI+RSjUUSia
	SuCBMFZYdD/bW8qSWIhnFVbmshctkDH0UMK3pRWlzOpNDCuam6faMp7PvbQ16pni1AYaYEY4mg1AD
	K7BNNrc1YBgjb0CFI2/V1uPKI4cxFMsZvJryL8cIldXh6OAsREalpcOOSkfhjHp7+VjMXIAUwey0M
	0HHGr9AA2AmixBx2Bh/hBoNYapXYi7u6rpSM2v8a+xUaj4RAHJ0DDG2ba524d5k+H8JxiOXW4wgw8
	K1iNxPXmMuqH+VGWg8ebMUFn2tCIX9ZXWbIzHsMNsfwfB4ljTIChyqkJ8OyqujEHPZ6wBL3qSQsQF
	dbzfzd6Q==;
Received: from ip6-localhost ([::1]:60182 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mgObR-001lGQ-Te; Fri, 29 Oct 2021 09:55:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56914) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mgObM-001lGH-Aa
 for samba-technical@lists.samba.org; Fri, 29 Oct 2021 09:55:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=go1WWUQXD3YeQPypt+Rylq7YM7eUSRHfr0qDN5wg9J0=; b=0YJTeZkPnLmMKssWFnfTAIS3Xr
 rMT8bst0Mx2CShSgpg3LmqDTce/OrZY671ecssKDVqIC9iLk14QDgkBwlxSEK0SnFV/wS/7hOnRVd
 QCyL1i/rFdu/Os1FxU5APEFEX6vnQ3H9bVhLmVwyWZaO7zq+Unq2Rctpi4eDHOHzw6zqbmZYDzwos
 xlcr2EiWusmm/yeoPHGLPJcBhd+ysKhTFEb0uVBzef9mH1brKq8Rcvy2AeylrMvY+ulI7tXiN0kgW
 vUdNJKj8PfD3Nr5JTzIC2BQ+ImpdNZuQVGuj8AkecT+ftCzMDu5K+AV3cjAVvsWjwiMaCYnEuacmv
 luLI5ZPwjUnGplQULQhMm/wgC0amCkzabazHvua5kH1kzyNSZXLdt1HMQfWnBVAess+fsrQtIrLdv
 nrcQaBC7EpFkWtMoz/iIBkf+cvacSKb/jy2gyrrFviIX/y2ml4AIGpQQAjWixVPzoqNIA3++QiWDX
 3td6L+RWcZfnT00qmvPtNyM0;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mgObJ-0040B6-RL; Fri, 29 Oct 2021 09:55:05 +0000
Message-ID: <34e64bc4-39a0-db4d-4474-820801cb7f0e@samba.org>
Date: Fri, 29 Oct 2021 11:55:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: git worktrees
Content-Language: en-US
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
References: <1878168.t9pZBThubR@magrathea>
In-Reply-To: <1878168.t9pZBThubR@magrathea>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------eS845JwOBjPxGqLWl60aJi02"
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
--------------eS845JwOBjPxGqLWl60aJi02
Content-Type: multipart/mixed; boundary="------------2nFPgkKK63MNK6gK0Z0bUmtN";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Message-ID: <34e64bc4-39a0-db4d-4474-820801cb7f0e@samba.org>
Subject: Re: git worktrees
References: <1878168.t9pZBThubR@magrathea>
In-Reply-To: <1878168.t9pZBThubR@magrathea>

--------------2nFPgkKK63MNK6gK0Z0bUmtN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAvMjkvMjEgMTE6MzEsIEFuZHJlYXMgU2NobmVpZGVyIHZpYSBzYW1iYS10ZWNobmlj
YWwgd3JvdGU6DQo+IEhvcGUgdGhpcyBpcyB1c2VmdWwgZm9yIG90aGVycyB0b28sIG1ldHpl
IGFscmVhZHkgdXNlcyBpdCA7LSkNCg0KeWVhaCwgbWUgdG9vIHNpbmNlIG1ldHplIHBvaW50
ZWQgbWUgYXQgaXQgYSBmZXcgeWVhcnMgYWdvLiBUaGVzZSBkYXlzIA0KaXQncyBsaXRlcmFs
bHkgd29ya3RyZWVzIGV2ZXJ5d2hlcmUuIDopDQoNCkNoZWVycyENCi1zbG93DQoNCi0tIA0K
UmFscGggQm9laG1lLCBTYW1iYSBUZWFtICAgICAgICAgICAgICAgICBodHRwczovL3NhbWJh
Lm9yZy8NClNlck5ldCBTYW1iYSBUZWFtIExlYWQgICAgICBodHRwczovL3Nlcm5ldC5kZS9l
bi90ZWFtLXNhbWJhDQo=

--------------2nFPgkKK63MNK6gK0Z0bUmtN--

--------------eS845JwOBjPxGqLWl60aJi02
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmF7xPgFAwAAAAAACgkQqh6bcSY5nkYs
FhAAl0lvXSYo2iDB1WOGsttPC9c2+V4iUSq+On3R9MHzuli/SjoGZAjYrlA8KqIFqDa1ORk0AW3x
VUwVZGqY4VEeLiQYhokGtLy0lEUXA512hOCcO/2Ts4dy6effghfWszHKjMbSjs0aY5+SXNEmwc36
sgJtaev7drMlOQbV8omD+3zNRmKzz7zUypZ4P686GyMgd9hX/Ief/9PVuP4TuvbFUPwu4pR+5NDM
upyyJ6YzWHAkhkFmNG1SYPRV8kEQt+U4fXHsPl4vnWcmdNOX8+OSyAqRVdbMI0H5DleGEvq+A9h6
n21rfU6QNS9ME9BSwhwOu0e8dIHQyZEyVqgzCiFCypXlMDgNlDHySNw90+GM/MccFFMmr05JRrw2
3I5LOjRRJ/eqlDxqm4QEAI8Rb8xa5wkN12bS7i/s9OVN9hvR/Mp6dosUpjQXpPUwAWwh8MkEI0Su
BpkKm4PttsoqUYvsLEcRzt0jxNX0Ua+0xR6MAbhcSyUuZbUi622Hoex8K4zZc9cCgTHjap4HknPB
uCoLIeIXGjR5+JJ099setfQt1rln+7EvjDYoifzJr/LSb9TFSF19vJoQiToaEnceF/piN0puVba2
ExrgxvkjM408UHVpnAg9qQ4jZbt3F5RFRRqrYxoOEe599b96E2cUVywuhaeq/77KNLR+mbEwaupU
jwk=
=e4Ko
-----END PGP SIGNATURE-----

--------------eS845JwOBjPxGqLWl60aJi02--

