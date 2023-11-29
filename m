Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0909F7FCE87
	for <lists+samba-technical@lfdr.de>; Wed, 29 Nov 2023 06:51:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=0mSyvcP1dU057Wo8RnWjkwnG6wIvUOfbir2bD3xikqw=; b=grHvIKrvEeptvxuvpqcEr3rebn
	Nv26lj61KxUmGWpzkjTCW60idJrhBZv7xdkQbunUVvseUj6Mi++8I+scJo6jnVkReQJj4uk58GAn6
	5R6jZteOl6zmuHpi42kLs5bex/zcycrzGyhNKu4B4Xrrd0sG9kQO1/CG64P1qRHM/+SVjkZFl0Kdx
	j1kgEjToVrc7XHv1Rl2WFRdyloy996ENoHjufebD3nMwM2fiqY3oJYDx9+ajDoUM20y6o3tW6Kosr
	9ayosXj/yPFSxpnnEsjfR0oNZjYvAJC+dU2QedSnaPCG4dIEqKLqwvqC9/WdyCLnPxGUIz//hgqSW
	Q65/SI5Q==;
Received: from ip6-localhost ([::1]:51196 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r8DTF-001Iiu-Cx; Wed, 29 Nov 2023 05:50:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15616) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r8DTA-001Iil-E7
 for samba-technical@lists.samba.org; Wed, 29 Nov 2023 05:50:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=0mSyvcP1dU057Wo8RnWjkwnG6wIvUOfbir2bD3xikqw=; b=nGFzLr/gCUJbqR98+5BaDKRvvS
 CILKaUGYEYLCklP8SZdqG0FbEPNiUXNG5IpauRsk6yr/cknCbL/OcnrltDyrJr8v11zsxjPrW1+4X
 D4Fd67prQrUWJDWpYFKfe7VM23imVDuCz3NNlB06gw4FqDT5kyIdFdGm0io+LFcj/ykqSqS/NLkSN
 d/TWa4PMYyAEPpKCGlK7dz6w1mO+tXY2J4zJm2BTYhksTzLeABWMrpckiD4Te7ETx1Yr3/yIpE4JZ
 Z0k9GZ4MwyBK/kNT8SrCbpzmrWcRnhlG4Mge675lZlvV14AM44HjeocjoHQmQnCZTXnCkN3tWaj+M
 iHTHSe3CS+PuAmG+8BlfHikV/c+Z3RQaFAPOa57/r997RcFonC3fUQvH8qlnjF+WIf/TSKny/Owzc
 g+7FfIIlhbDXDolyct8aGr04Mckn+OuD6zDBcB3ksV/eddsK+prR9o6cMPkEolVWV7/E5qPHgk8tb
 hpJehH1NxbRa+OWW2BeRbJaL;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r8DT8-0011Ty-02; Wed, 29 Nov 2023 05:50:42 +0000
Message-ID: <2769bde9-925d-4c88-98f8-88ef98efb63d@samba.org>
Date: Wed, 29 Nov 2023 06:50:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [SMB3POSIX] File attributes
Content-Language: en-US, de-DE
To: Jeremy Allison <jra@samba.org>, Steve French <smfrench@gmail.com>
References: <e916bdea-4197-4372-a15b-cea41c8ebe03@samba.org>
 <ZVJh3X9GQ5L9mLS0@jeremy-HP-Z840-Workstation>
 <e6bd562a-296c-44f2-8164-8a90d98fa6e2@samba.org>
 <CAN05THS4H1+vHuPSnRQmiRtDDpnw3j0PUUJi6FwFZf_2zrAsRQ@mail.gmail.com>
 <CAH2r5mspC6iufincWMtHWrY=Le6nbsDEB3kpFxUFAhKSWR-2bg@mail.gmail.com>
 <ZWaKyLw/Q2uefb+i@jeremy-HP-Z840-Workstation>
In-Reply-To: <ZWaKyLw/Q2uefb+i@jeremy-HP-Z840-Workstation>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vSO0j5wie1uEEYSGm9ezhhEk"
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
Cc: Tom Talpey <tom@talpey.com>, Volker Lendecke <vl@samba.org>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------vSO0j5wie1uEEYSGm9ezhhEk
Content-Type: multipart/mixed; boundary="------------XcSBwV0C4AUL8ThMT3N0WTOe";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Jeremy Allison <jra@samba.org>, Steve French <smfrench@gmail.com>
Cc: ronnie sahlberg <ronniesahlberg@gmail.com>, Tom Talpey <tom@talpey.com>,
 Volker Lendecke <vl@samba.org>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Message-ID: <2769bde9-925d-4c88-98f8-88ef98efb63d@samba.org>
Subject: Re: [SMB3POSIX] File attributes
References: <e916bdea-4197-4372-a15b-cea41c8ebe03@samba.org>
 <ZVJh3X9GQ5L9mLS0@jeremy-HP-Z840-Workstation>
 <e6bd562a-296c-44f2-8164-8a90d98fa6e2@samba.org>
 <CAN05THS4H1+vHuPSnRQmiRtDDpnw3j0PUUJi6FwFZf_2zrAsRQ@mail.gmail.com>
 <CAH2r5mspC6iufincWMtHWrY=Le6nbsDEB3kpFxUFAhKSWR-2bg@mail.gmail.com>
 <ZWaKyLw/Q2uefb+i@jeremy-HP-Z840-Workstation>
In-Reply-To: <ZWaKyLw/Q2uefb+i@jeremy-HP-Z840-Workstation>

--------------XcSBwV0C4AUL8ThMT3N0WTOe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEvMjkvMjMgMDE6NTAsIEplcmVteSBBbGxpc29uIHdyb3RlOg0KPiBMZXQncyBzdGFy
dCB3aXRoIGEgbWluaW11bSB1c2FibGUgZmVhdHVyZSBzZXQgdGhhdA0KPiBwZW9wbGUgYWN0
dWFsbHkgdXNlLCBhbmQgb25jZSB3ZSBoYXZlIG1vcmUgZXhwZXJpZW5jZQ0KPiB3aXRoIHRo
YXQgdGhlbiBsZXQncyAqY2FyZWZ1bGx5KiBkZWNpZGUgaWYgd2Ugd2FudC9uZWVkDQo+IHRv
IGV4cGFuZCBpdC4NCg0Kc291bmRzIHJlYXNvbmFibGUuDQoNCi1zbG93DQo=

--------------XcSBwV0C4AUL8ThMT3N0WTOe--

--------------vSO0j5wie1uEEYSGm9ezhhEk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmVm0TEFAwAAAAAACgkQqh6bcSY5nkZ+
7BAArW5jcdvYeloSlxj1miifWhPT4P9dixcYU40SpxwBDNUCFiGJiaHmn8SZybDP7+7TzEQKOyqw
WXf9OPyKVoWOwiOw3gElCro/Zkxt6mpxMKQI6QcHtTNQ5ruarthIp+FY8LTTBJCl79Yt9EX+iGPA
up6cQPeVttm7RBhaBuG9L4/lxKJ6SqaJ9KMi7CEwHuXNqohN77DcjZ3yo00YujVOc5rjuw/JgO5K
8AJ6CUpTzM8ECp2CJzFbiDP1IULFAD+tcc8lChSBKq2z2byK5Fypt9fMhO1/iJ31XEHaqpcHUNwZ
3X00pPht6cOECdlgp9lYNKShjbFTQQLySuDxub9urHzg2k/If6Ncn4hsd+dZrO9IlxNINr5mxqSt
xWUypTL9bVh34wibuUPy5i8Azvu86mAnnMKITgkKYXsG5Xfsf74oVuzcW8FOhSEQj26d/KAvZFhJ
rVCQFL4gJ7ESFlWaCZ1s4P4LyGiaUveZIW4G/iZ25fl6TMfulgMqEJU3rmBug8+ee0fb4vSmuM8+
maUezi0JzmYF4V84/XCchIO1a1qmbuiqZoN/jzaQNtzKUs88m7BgEjwXdxKWTnp4dLqmRx5MnnxN
RBwcZbzyHiP4A4TSJU7xh13Ikpqlw9DB9jC7NcU1dpGoht5a9tAZFVxfIVOrCARE9hKbYfgkuujF
mf4=
=Ov+U
-----END PGP SIGNATURE-----

--------------vSO0j5wie1uEEYSGm9ezhhEk--

