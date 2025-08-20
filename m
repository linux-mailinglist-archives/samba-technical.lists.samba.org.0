Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 409D5B2E309
	for <lists+samba-technical@lfdr.de>; Wed, 20 Aug 2025 19:11:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=WEZkXEJg+hGB+jnpYbUZvIYD5Hy2rCcX9Uf7esTs+7U=; b=NpRf1sQqerL2L27GONbvM8VypZ
	GvKJ3o57lHkLvc6K6Mz0cuSoQsIVYwBsQ5Vi8vxweIyQIB3Qt8mQyQNyAL2hMi2WYUw/XqrDRn4HO
	7/F9U5y76TTi0FdrAdeji5U1D/dqevrtPbspfWMCUfqGQSOJTMxdCIupl3y8q1SJzHGnR8OWAQdEj
	luR0zt2MgFCs0YzFGzmtGBmFypvHZB+G2ynCw7X2hu6aoA1nw3UTBZjxbTFssQTZDIQSe+L75MGkw
	m6EGX6wrXnrzBwQhDD1i2QIAm273lvxSMXjgah7WhnzUxDSnFizojQ3dS/JMd0zAn6tkjoMC8VF5J
	Ftmv0vVQ==;
Received: from ip6-localhost ([::1]:45514 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uomKy-00FNQy-7B; Wed, 20 Aug 2025 17:11:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20782) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uomKu-00FNQq-9n
 for samba-technical@lists.samba.org; Wed, 20 Aug 2025 17:10:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=WEZkXEJg+hGB+jnpYbUZvIYD5Hy2rCcX9Uf7esTs+7U=; b=nfDaDrZh274HL8YnoJmE79dM29
 o4seJKqfy/B8NXkEdT/5+CTofbyvhPgi82JwMSWunSEN+/LCaYMdS4mMAlasrlG79jWj8Ba9gSZvm
 PsCY3yqAw47LIc1en7Tf0qGR9Xi2A/jhWnQjblNuGGYPSuKIqjBFyT+PTy/tGOJu+P4tR8FxChrZP
 9BoS2ODUM2E1/j20am127r60gvPnPadc2pE9Uhtzx3h/x2ZhlfU5gJQQImU6WDmwBbmd5Vv+9TnH/
 ThfzJcV8bnT2KzXu2uSo5yGLSHycJLnxIz3t4qQn296pyKrJF04aWYgI9/w76sMSHttlQO7nWvG0w
 RCFB80838gqstDw6Q7j5cJtP1WlUz47SHruD/CFwgb6B6f4OY88K1BxBGnqu9ZefZU8ipW/chtrTu
 TqaHJz6LtFD0ClLArjwh0WAzFvIE+sfkv3jRwbL6KkiUcyJu955Ky7LhZeZZ/MWy9YIfg7Cr6SgS4
 WndwWP+wCFXvurwOmAEcwm1L;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uomKt-003szc-2J; Wed, 20 Aug 2025 17:10:55 +0000
Message-ID: <b5349366-04ee-48cd-8126-9af10c2404ea@samba.org>
Date: Wed, 20 Aug 2025 19:10:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: [PATCH] ksmbd: allow a filename to contain colons on
 SMB3.1.1 posix extensions
To: Steve French <smfrench@gmail.com>
References: <20250820142413.920482-1-pkerling@rx2.rx-server.de>
 <CAH2r5mupCJs6K3Y9N=oUp6oEAMV2S5=_d0nxirk74ZQ24gH7Eg@mail.gmail.com>
 <CAH2r5muNhfk-CHLYLcKMU+yXGqfiQtrZZ5ogf0PJcTsGTiBAJQ@mail.gmail.com>
 <CAH2r5mtB0aNQMYzUhgu0_xRzkWL1xYoRa6b5a5CiKUhV+WU_QQ@mail.gmail.com>
Content-Language: en-US, de-DE
In-Reply-To: <CAH2r5mtB0aNQMYzUhgu0_xRzkWL1xYoRa6b5a5CiKUhV+WU_QQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tt0ffR1Ov6DmzMfCq6rK3r2G"
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------tt0ffR1Ov6DmzMfCq6rK3r2G
Content-Type: multipart/mixed; boundary="------------RrmNcCiGURyy7E02kAtUKq9M";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Steve French <smfrench@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Message-ID: <b5349366-04ee-48cd-8126-9af10c2404ea@samba.org>
Subject: Re: Fwd: [PATCH] ksmbd: allow a filename to contain colons on
 SMB3.1.1 posix extensions
References: <20250820142413.920482-1-pkerling@rx2.rx-server.de>
 <CAH2r5mupCJs6K3Y9N=oUp6oEAMV2S5=_d0nxirk74ZQ24gH7Eg@mail.gmail.com>
 <CAH2r5muNhfk-CHLYLcKMU+yXGqfiQtrZZ5ogf0PJcTsGTiBAJQ@mail.gmail.com>
 <CAH2r5mtB0aNQMYzUhgu0_xRzkWL1xYoRa6b5a5CiKUhV+WU_QQ@mail.gmail.com>
In-Reply-To: <CAH2r5mtB0aNQMYzUhgu0_xRzkWL1xYoRa6b5a5CiKUhV+WU_QQ@mail.gmail.com>

--------------RrmNcCiGURyy7E02kAtUKq9M
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gOC8yMC8yNSA2OjQzIFBNLCBTdGV2ZSBGcmVuY2ggd3JvdGU6DQo+IEFkZGluZyBzYW1i
YS10ZWNobmljYWwgaW4gY2FzZSBvcGluaW9ucyBvbiB0aGlzDQoNCnllcy4gOikNCg0KTm8g
cmVtYXBwaW5nIGZvciBQT1NJWCBwbGVhc2UuIFRoYXQgbWVhbnMgbm8gc3RyZWFtcyBzdXBw
b3J0IGZvciBQT1NJWCANCmFuZCB0aGF0J3MgZ29vZC4NCg==

--------------RrmNcCiGURyy7E02kAtUKq9M--

--------------tt0ffR1Ov6DmzMfCq6rK3r2G
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmimAZ8FAwAAAAAACgkQqh6bcSY5nkah
1Q//Rvcp08uAkwJsMOTdK7xev+Qdvv8Z2WV0U5CcgNoCvae1c02INfFlzuqqEKnf6vInuCbqVl6L
dDscyzHxEfF/wGj34ZhC0oAsxRAGrUeFUEApMANjUvMD5dvGDOPSDgY4dVIjPZcatAfjPoVokKKc
364vvCysje06xc4YAk7kPpc0cRKL19G4K60x2osXaRYSxJNF2kab7H3CVpfOWYcYUmc1oDMNPB/k
hJM3SXklCkeD46cyne7gIzioLZZqbXByx3/DcKhHGbAbC8g1mgb8FBIFN8nmz1VfQ4ZyrCoLiRSH
floSJD2a4hxuhvZp9IRi8/PGcalOWuBaGR85XE6CIbSMfeJmq/BLYG4bkpL6V2gPKUUTgn6uof+L
0WvA0mm1f91Vmry9sQpJzF14T+Re0+m7DHPsGQ4jIdSmr2mIaEo4ZQC7T4O+VNbMv8RbaeK5wlQt
GSKijgpn9FllpxeyPWr1KGHqdPvwc5Ekcy+tOfmCpmSS3X4kRLqK7bXECWTKoMFBveGpG+S6dHj4
893WllPNji1pFwU0ByXz+4cf/P7ftj53sfkysuainmD046/uJY2SiSCGyHJYbfzjHbnthgykU92B
HCql5k7LYLEhqbJUqYnBcJhPP4xI707G87mS4bLgSGwG4iJ8wTUdu3FxE4AEJL96invWrMnzVg9H
Xx4=
=J49c
-----END PGP SIGNATURE-----

--------------tt0ffR1Ov6DmzMfCq6rK3r2G--

