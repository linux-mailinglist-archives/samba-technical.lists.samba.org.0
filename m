Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 548C1805F5D
	for <lists+samba-technical@lfdr.de>; Tue,  5 Dec 2023 21:23:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=GIZ3cCW2DH3bT2rS6O4sevryVhXXR1+YBStyvzPNps4=; b=C793ZasNQ8BvSX4px12hF+jYsZ
	ZQvODFlCV91u+uZo9qvg7GbdYPQakhwFo3njrD34YgjvhfETVKGC9iyqtTqiuMxPiRxCkYus2rdvJ
	wDXOPjvQpEoLxNtqYBII5R2qTvoQTH35mPVTv6fnLHvCkV27q2z2BnDukAIfYgnZTWNdfY7UDyRDY
	ihIV/4y0mlr6y7nuxm/FomDfMaAfzoByKt9EsvZ7SdYAcadnPfNLueGnveoQ+VfrHBASmC3g6uZko
	1GvBnYjtvZ2aAqlK5dw6Z2wk8A11JZD30qTHEIbjO/N0I3r55TgjAz6p+fKT4LxheByzriznTljSt
	EXsZtATg==;
Received: from ip6-localhost ([::1]:27566 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rAbwu-004Wwe-O6; Tue, 05 Dec 2023 20:23:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37900) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1rAbwr-004WwV-DX
 for samba-technical@lists.samba.org; Tue, 05 Dec 2023 20:23:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=GIZ3cCW2DH3bT2rS6O4sevryVhXXR1+YBStyvzPNps4=; b=ZPZGvTi6eS7FNWBpJgIihsObSB
 rx+eZKRVZtkBHS1Xt2B/8HGlf+xntl36grx07zaM8nL54kM7ZCMY7S9Vn8W4L1JIVG/SgcsdMllY6
 3qiOdKu29vAAa+sgDXXfOmmBusSSmZBqe7kcnz4CkYQntEqSI8rZwpSM5CUrjRZmScdDfx9sJKdlA
 T4oNjGFIEraiTgA5tguXHROUEXe8lfz/Fs/VM1kfCqOMkUgsgZgYhIrjBSuiuv5I3whWnX+yGsr2W
 9NIu3qsGrgQbn+moprtDMwCQmctgBDNqcKeD5kI4RLDgS3wIxisx+TpFvtbk4hf/E/Nsi/NUSTecE
 j8FxfvOVQE3vBNy0MePCONgbsUflVuD9oi8CsgVQlmhZrQFLqdy5AHq3EX+FCwkM7KGPGhz16mX49
 659SprqUYt9qDKCPdrb0HoJ9NkEcTOfUjaTJiDGObxcV0LbvtvaMhZien1zIneX3bo1b7K1FvwMJo
 A6wjry5CX136XRDZ2t75q9s6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rAbwq-0025Ax-1I; Tue, 05 Dec 2023 20:23:16 +0000
Message-ID: <1017032a-b5c9-4ee2-8f24-c113d5839bc0@samba.org>
Date: Tue, 5 Dec 2023 21:23:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Oplock Lease stress test?
Content-Language: en-US, de-DE
To: Gordon Ross <gordon.w.ross@gmail.com>,
 _samba-tech <samba-technical@lists.samba.org>
References: <CAD0Ztp3ZoJTyiEa_MYgvHHrivWW-KAgDTrjH0Yz-BGDPWUnozg@mail.gmail.com>
In-Reply-To: <CAD0Ztp3ZoJTyiEa_MYgvHHrivWW-KAgDTrjH0Yz-BGDPWUnozg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZHthX4bN0ax5HSk6AGIuUXIX"
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
--------------ZHthX4bN0ax5HSk6AGIuUXIX
Content-Type: multipart/mixed; boundary="------------VgkyScvTqQSlm4axVD0xvXjx";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Gordon Ross <gordon.w.ross@gmail.com>,
 _samba-tech <samba-technical@lists.samba.org>
Message-ID: <1017032a-b5c9-4ee2-8f24-c113d5839bc0@samba.org>
Subject: Re: Oplock Lease stress test?
References: <CAD0Ztp3ZoJTyiEa_MYgvHHrivWW-KAgDTrjH0Yz-BGDPWUnozg@mail.gmail.com>
In-Reply-To: <CAD0Ztp3ZoJTyiEa_MYgvHHrivWW-KAgDTrjH0Yz-BGDPWUnozg@mail.gmail.com>

--------------VgkyScvTqQSlm4axVD0xvXjx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgR29yZG9uDQoNCk9uIDEyLzUvMjMgMjA6MjAsIEdvcmRvbiBSb3NzIHZpYSBzYW1iYS10
ZWNobmljYWwgd3JvdGU6DQo+IENhbiBhbnlvbmUgc3VnZ2VzdCBhIHN0cmVzcyB0ZXN0IGZv
ciBleGVyY2lzaW5nIFNNQiBzZXJ2ZXIgb3Bsb2NrIGFuZA0KPiBsZWFzZSBhY3Rpdml0eT8N
Cg0Kc21idG9ydHVyZSBiZW5jaC5vcGxvY2sxLCBzbWIyLm9wbG9jaywgc21iMi5sZWFzZSA/
DQoNCkh0aCENCi1zbG93DQo=

--------------VgkyScvTqQSlm4axVD0xvXjx--

--------------ZHthX4bN0ax5HSk6AGIuUXIX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmVvhrMFAwAAAAAACgkQqh6bcSY5nkZA
uBAAtMgCTt/JXu5otkmRph8QMZ1aCWS6DgiVbuXo9givPyBq8Gxoog7xBPficcpmT0NjgyVulW3O
vL7iuWmaeLzudVfQ+nw+66gBHacWhD9zSc8v2X4NEAqBN4H9Q0ED+yt8ALQ1QkXR/xpV55xKacWl
4cxTrVtIVvyQsn6pugWCq156Agj/OPKvzD9f/AscL3xMNw5IDowYXjgQNf0BjLze8zWY6aVlSeA8
L/h4B8+2ytWHQjaHaohSqDPKaDe3K3nX9O4ju3a2wSbB94gUCyYsDfw5Cx1p+mc6PgYneCHf9kRw
v1ttf7u8DxzqIp1ndBJOCB4pdi2GIW6mf27KIhrZojtRpWdh0chGtxKNXWZzRi7PJ+l9c9hvrA1T
1TM2sOYLr2147Xd2KH8IJe4GtUu4PJIG8IXZVV1F4CNTqnPn0dYvs8SBXzjzcd+R6ih9+gYFAVBy
GRidwqX9eokwI/BRD1+DBu9opKV6EnwxvE7xFDn3OpTlkNX2nZKHJzJB802EepCBFHrqfoA971q0
5HEg2lLDxJYLBJOylsk+iMwS7R+uK+VPuJBrbTwcn8VpR7iVJF3/p26xkVG6uqKY65yL0YKBhuBv
kHH6X1GuxPMHYGJzfx7nvitz00oiE7OLZq6ffhxOnOKl4D6234PDoeiJZFe3bsaLKJnJ3lpnCRy1
D1U=
=1vxX
-----END PGP SIGNATURE-----

--------------ZHthX4bN0ax5HSk6AGIuUXIX--

