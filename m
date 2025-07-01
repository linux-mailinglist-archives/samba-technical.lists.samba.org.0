Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 01131AEEF52
	for <lists+samba-technical@lfdr.de>; Tue,  1 Jul 2025 09:01:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=f8zabb+VlR2pImrcDBd0rUSmWqJPdDJ6oK4+zf2E0UA=; b=KKfnZ489Nov1dGSDMDumCJ1IsN
	qdugpx9WOT9PZ4MmlM3BHUgRdtQJUdKwYo3Frlueal/mW8+71/IETrM+TWOthxwUs5Rw+bnjrjzPq
	ofhFo/tyhOUXgdy2qXYqJBWLOYduH0Aafpg3lhFLKelsi9tXncqcINhpSzeDCDhPZW1TuWzB/K26E
	oJXiGKPM9Q9wyoEzQxDCzxOI2hOF59U11lazeeGHDOy3TL6J6Dw+Adv6NGe868Vd0QnQV9LlNs9rq
	ATovx6xtTDdQpo3nDKXwqsm+asNj5ZcYzvXlx+M+Mp3gLYX5erLIMKxdIytWilYpV+tI0KWKwT9A9
	gIlXNh2A==;
Received: from ip6-localhost ([::1]:42814 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uWUya-00AACV-Gj; Tue, 01 Jul 2025 07:00:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47848) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uWUyT-00AACO-3j
 for samba-technical@lists.samba.org; Tue, 01 Jul 2025 07:00:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=f8zabb+VlR2pImrcDBd0rUSmWqJPdDJ6oK4+zf2E0UA=; b=1ugfY5UzD6br6hqjWuvu17W2Bw
 0nFTTT6h5yW+Ogt+zslpHaQBoaIp4/DrpyKIX0tBI/0yJVWkaCpPHEN4mY26a6UQtHqHaQ/X5DQn3
 1csJt79ydZSLFCw9NLMRxUZxvlQBZEg80ARh6OfdyhHfrxL+Tv3mNaif0z/SzXa4w7C/feTzhzH27
 ZsHWtyNlEu2XgtVvQZinRuVpj+lKnke6XzXJMM//1Q1I1XZV+UYhDJ7DeZews/m0he0TRiwMWkPmK
 GdOgY3EwExpqb0lYKFa7yIL2WrVQp9ZEC80TqQW19cZw789Vq/bRbGQsZ64i3mZgO0MbBebzSKgep
 cWoCABskraBBa07K4MIt1hxfW0V4lNASdqbOkqIhdcQjHilrC3MCo+gvWuVD58ywb4tYGF/h3gUHf
 Vk2TOyGkc2N3Ku0hexVQf+/jcVqOYZNuBY7FBio5mjKz9NTWGx1169h9jZajo2CjR/T3aiF4m5gBb
 HbJiugvj+nGn8+gKXSQpSZMU;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uWUyR-00DIrz-15; Tue, 01 Jul 2025 07:00:12 +0000
Message-ID: <bd559f39-44ab-4bbf-9495-d6a8a6a97d6e@samba.org>
Date: Tue, 1 Jul 2025 09:00:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Samba current master branch server crash
To: Steve French <smfrench@gmail.com>
References: <CAH2r5mt70hsY_i6xBNX27p5EEHnJEnfUi2Sk2mZmhvchxepcxg@mail.gmail.com>
 <c2493bdc-bd2b-4c17-afd0-4aaf87b1b85f@samba.org>
 <CAH2r5mut=m6U72P8TiTNp=7uCxMEDqw3BbhLJc9NWsk-iPqhng@mail.gmail.com>
Content-Language: en-US, de-DE
In-Reply-To: <CAH2r5mut=m6U72P8TiTNp=7uCxMEDqw3BbhLJc9NWsk-iPqhng@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------O8gIAKyH7hKtHe4hN1VawauD"
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------O8gIAKyH7hKtHe4hN1VawauD
Content-Type: multipart/mixed; boundary="------------q1l76mtzD3boih0zor0hW3kA";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Steve French <smfrench@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Message-ID: <bd559f39-44ab-4bbf-9495-d6a8a6a97d6e@samba.org>
Subject: Re: Samba current master branch server crash
References: <CAH2r5mt70hsY_i6xBNX27p5EEHnJEnfUi2Sk2mZmhvchxepcxg@mail.gmail.com>
 <c2493bdc-bd2b-4c17-afd0-4aaf87b1b85f@samba.org>
 <CAH2r5mut=m6U72P8TiTNp=7uCxMEDqw3BbhLJc9NWsk-iPqhng@mail.gmail.com>
In-Reply-To: <CAH2r5mut=m6U72P8TiTNp=7uCxMEDqw3BbhLJc9NWsk-iPqhng@mail.gmail.com>

--------------q1l76mtzD3boih0zor0hW3kA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU3RldmUsDQoNCk9uIDcvMS8yNSA1OjQ5IEFNLCBTdGV2ZSBGcmVuY2ggd3JvdGU6DQo+
IEkgd2FzIGFibGUgdG8gcmVwcm9kdWNlIHRoaXMgKGFsYmVpdCByYW4gb3V0IG9mIGRpc2sg
c3BhY2Ugc28gc29tZQ0KPiBhZGRpdGlvbmFsIGVycm9ycyBsb2dnZWQpIC0gd2hlbiBJIHRy
aWVkIHRoaXMgKHdpdGgNCj4gY29uZmlndXJlLmRldmVsb3BlciBidWlsZCkgSSBvbmx5IHNh
dyBvbmUgc21iZCBwcm9jZXNzIHJ1bm5pbmcgYW5kDQo+ICJidCIgc2hvd2VkOg0KID4gLi4u
DQoNCnRoaXMgc2VlbXMgdG8gYmUgYSBkaWZmZXJlbnQgZXJyb3IgYW5kIEkgZG9uJ3QgcmVh
bGx5IHdhbnQgdG8gZ28gaW50byANCnRoZSAibm8gc3BhY2UgbGVmdCBvbiBkZXZpY2UiIHJh
YmJpdCBob2xlLi4uDQoNCkl0IGFsc28gbG9va3MgbGlrZSB5b3UgYXR0YWNoZWQgdG8gdGhl
IHdyb25nIHNtYmQgcHJvY2VzcywgdGhpcyBsb29rcyANCmxpa2UgdGhlIG1haW4gc21iZCBw
YXJlbnQsIG5vdCB0aGUgc2Vzc2lvbiBjaGlsZC4NCg0KLXNsb3cNCg0K

--------------q1l76mtzD3boih0zor0hW3kA--

--------------O8gIAKyH7hKtHe4hN1VawauD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmhjh3oFAwAAAAAACgkQqh6bcSY5nkYX
Cw//Z5Ri8q2ly9CSDhB0Zfht/amV7wepJDEibE0mB+wSYjsfEnVbZBNAjar5uZYZ9V7DbNbHvjfx
iczEiMxR0ZFySd/pMVPr4UhwEiyZIFERvMmqNiZxgdQJWni7chasrMufK0KpRi5oNQZrqdW69Tds
C1J2bENh/rWauK1HDS623r+CLCkoz7FO9iqmB2ZhoLMQfFdMETaClXXd7Tnx62cr2hSXr9X/iUCf
OnZSnTLFgO2zwhIdc9D8VBVcnYRJTDjA8k67zd07KTRK7kfpfsbek6abEHmkadRneJt634h2gdC0
I8KhOUyAtM36XNBxPgZsAVthCF8APc0gOMuZSVgyni8O47b/pDmBu32swjSumT0KA80RoNNOI21g
LsRtR4amXs0Veak7/0vfN53/RcB+jnNhPKfF7H38AkgWyMFv0f1cDeJNnmFZu0LcsQstkrc3jRHp
YU/r/neyh5Mtgis+BoLBbYZs0anPPOeX8lcpOEvPEXUAXkWlRLDsMov8VI6UWGbgqXT0ujo8JNZW
w02Inoq83rPtIfnStCQgMTdXrzd/K/2vY3/+zV/9cGtbjHfWxod4bfXZw6FMAt+NdESyG9OP2N3Z
Dikg0A5KBcBWuojLS3oguZfvnf66f37jGbmmsc7Ky6WZ3K3ROPoxSQJ/SkUZR6R3i0NzYnr/TOui
Q6M=
=/7zU
-----END PGP SIGNATURE-----

--------------O8gIAKyH7hKtHe4hN1VawauD--

