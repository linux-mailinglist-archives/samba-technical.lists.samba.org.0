Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 403DB4C62A9
	for <lists+samba-technical@lfdr.de>; Mon, 28 Feb 2022 06:44:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ZarKmxo+ugXggNHBorwehSX+5pGd4hCfQ7JY95+wXEI=; b=ZdNirNsbcntFQicFacs5WaXNt8
	upw32LgKShS/vdG5Dq6FVjSs5PXYRw7JVIZxkbVD/Vy0nQbT2UEJU5FCf5g7JsRja9xaw9zMhrOGi
	CuOSs0bHSiASg0jWyQmnkV+a9P5NGYKSZI9bvBs2cjVdj4VEW+XWMTizy/8bKIk4XgyTUdfO/+xUQ
	BP3BSrnudZ35qUWYuFCupe66x4DXm/X2zFO+JzRiSkOtbn6pLdrQX0gYWRoBrYGQfyRaBHDSEmZa7
	01rukcFTc6xs1QrE3CoH4e89dQRfwv63Bhmd6mjReptL5/T/bwSFu1TJpRDyT5ehLhI1BGKT0c0H2
	T1C39R+w==;
Received: from ip6-localhost ([::1]:57312 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nOYo4-00CP5i-3Q; Mon, 28 Feb 2022 05:42:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49258) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nOYnz-00CP5Z-Bv
 for samba-technical@lists.samba.org; Mon, 28 Feb 2022 05:42:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=ZarKmxo+ugXggNHBorwehSX+5pGd4hCfQ7JY95+wXEI=; b=ocZgmVNRz4UhLSI31zBjGwrXff
 FRXuCbcpR0g7OPLOwncqvBKP7FxOzrZL1qaDfC9xrwevGV4bqR0e8YWLWG776CvMaRUX2fdkPS4m9
 HmL+pXxZN6imPx9Z6cEvkez7rrTSEOsRoMml8anMQuU3GEt05TIFyXw3mRSD0OxD8APS8B/qGZF5w
 467T943XGoz4BCHAwan9360I3F/njMd+yQowFAUKrdYb83a38lAO7/E6RIZp73gekd9qCN/J1sJ2F
 nWkQy7fhKOdaNv251AHA3reQiRzwYEDGfKSPWOVSbbIVqHSKYUugw9myc6FbSEurM3T3/LPVkxVo8
 8nyV0hY3OHccr2Kmu/KrVgtX0ENX77tfspFEGUqBCTPGutZVgUOEVw9sVkgn6ymzk7KgBMYvBSOTZ
 JAyqLigrFFobqpFWSk2o7SNvUDujk6ZR3FKTQUEx7r57kG5VTnJRHmaMhTkDbwnGJ7gBBlwZq8uzG
 EMAiL7hP9uP4VosbEaPMxXNS;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nOYnu-005nxf-3y; Mon, 28 Feb 2022 05:42:38 +0000
Message-ID: <d1b3419e-886c-d479-0c43-b4e64e5465a8@samba.org>
Date: Mon, 28 Feb 2022 06:42:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Lsf-pc] [LSF/MM/BPF TOPIC] Enabling change notification for
 network and cluster fs
Content-Language: en-US
To: Amir Goldstein <amir73il@gmail.com>, Steve French <smfrench@gmail.com>
References: <CAH2r5mt9OfU+8PoKsmv_7aszhbw-dOuDCL6BOxb_2yRwc4HHCw@mail.gmail.com>
 <Yhf+FemcQQToB5x+@redhat.com>
 <CAH2r5mt6Sh7qorfCHWnZzc6LUDd-s_NzGB=sa-UDM2-ivzpmAQ@mail.gmail.com>
 <YhjYSMIE2NBZ/dGr@redhat.com> <YhjeX0HvXbED65IM@casper.infradead.org>
 <CAH2r5mt9EtTEJCKsHkvRctfhMv7LnT6XT_JEvAb7ji6-oYnTPg@mail.gmail.com>
 <YhkFZE8wUWhycwX2@redhat.com>
 <CAH2r5msPz1JZK4OWX_=+2HTzKTZE07ACxbEv3xM-1T0HTnVWMw@mail.gmail.com>
 <CAOQ4uxi+VJG56TPvcpOqoVAGgbb8gZQJEfvhXyGyB5VboRE2wA@mail.gmail.com>
In-Reply-To: <CAOQ4uxi+VJG56TPvcpOqoVAGgbb8gZQJEfvhXyGyB5VboRE2wA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JEWlc3Q4btmHvqWa9vlw3Pbv"
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
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Ioannis Angelakopoulos <jaggel@bu.edu>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 lsf-pc <lsf-pc@lists.linux-foundation.org>, Vivek Goyal <vgoyal@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JEWlc3Q4btmHvqWa9vlw3Pbv
Content-Type: multipart/mixed; boundary="------------L1f0AmtwKPzAH3rid24m0PNl";
 protected-headers="v1"
From: Ralph Boehme <slow@samba.org>
To: Amir Goldstein <amir73il@gmail.com>, Steve French <smfrench@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Ioannis Angelakopoulos <jaggel@bu.edu>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 lsf-pc <lsf-pc@lists.linux-foundation.org>, Vivek Goyal <vgoyal@redhat.com>
Message-ID: <d1b3419e-886c-d479-0c43-b4e64e5465a8@samba.org>
Subject: Re: [Lsf-pc] [LSF/MM/BPF TOPIC] Enabling change notification for
 network and cluster fs
References: <CAH2r5mt9OfU+8PoKsmv_7aszhbw-dOuDCL6BOxb_2yRwc4HHCw@mail.gmail.com>
 <Yhf+FemcQQToB5x+@redhat.com>
 <CAH2r5mt6Sh7qorfCHWnZzc6LUDd-s_NzGB=sa-UDM2-ivzpmAQ@mail.gmail.com>
 <YhjYSMIE2NBZ/dGr@redhat.com> <YhjeX0HvXbED65IM@casper.infradead.org>
 <CAH2r5mt9EtTEJCKsHkvRctfhMv7LnT6XT_JEvAb7ji6-oYnTPg@mail.gmail.com>
 <YhkFZE8wUWhycwX2@redhat.com>
 <CAH2r5msPz1JZK4OWX_=+2HTzKTZE07ACxbEv3xM-1T0HTnVWMw@mail.gmail.com>
 <CAOQ4uxi+VJG56TPvcpOqoVAGgbb8gZQJEfvhXyGyB5VboRE2wA@mail.gmail.com>
In-Reply-To: <CAOQ4uxi+VJG56TPvcpOqoVAGgbb8gZQJEfvhXyGyB5VboRE2wA@mail.gmail.com>

--------------L1f0AmtwKPzAH3rid24m0PNl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgQW1pciwNCg0KT24gMi8yNi8yMiAxMToyMiwgQW1pciBHb2xkc3RlaW4gd3JvdGU6DQo+
IEkgZ3Vlc3MgU01CIHByb3RvY29sIGRvZXMgbm90IGFsbG93IGNsaWVudCBCIHRvIHJlcXVl
c3QgYSBOT1RJRlkgb24gY2hhbmdlDQo+IHdoZW4gY2xpZW50IEEgaGFzIGEgZGlyZWN0b3J5
IGxlYXNlLCBiZWNhdXNlIHJlcXVlc3RpbmcgTk9USUZZIHJlcXVpcmVzDQo+IGdldHRpbmcg
YSByZWFkIGZpbGUgaGFuZGxlIG9uIHRoZSBkaXI/DQpmd2l3LCB5b3UgZG9uJ3QgZ2V0IGEg
IlciIFNNQjMgZGlyZWN0b3J5IGxlYXNlLCBzbyB0aGlzIGlzIG5vdCBhIHByb2JsZW0uDQoN
Ci1zbG93DQo=

--------------L1f0AmtwKPzAH3rid24m0PNl--

--------------JEWlc3Q4btmHvqWa9vlw3Pbv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAmIcYMwFAwAAAAAACgkQqh6bcSY5nkbN
khAAqRE+qx1Qbz8iS3db4Q568BEftRKDCQKnklyufG4iQ4ecGeIowtqJQpNNAgcdoV6OaMxB/+7j
89aZjdzC00Dis/xnC+bB13njUK2fEBb/XLq/UiHJSm0LQbeQRT7LAZiiXhaLsiOLSBY7rg/1J4kG
t4ewoM2sk4ynQO7hz7zxO3vZ4jS0gxZXtjBvjNmDJERsJ9mCPYmLFB9OfwfOyIf406xN7UHHhuou
x+95l0gA8CdulBXXqLuy/8tp08XLxNi2BC7M+JDR0Db1ak2vTEqQpBISkdEMBJt1g/dWceIv7tgs
MUGW/sCuEr2zDT7ipUYZiHg2B9p4RDxcin7CwsUx2/w/Ly8SOh9KRNH8GbNStOUTqBB7G0n7/mt9
WC1pMgcBsm+8VV0lhFmlt8/EwsXWhJuZdRl5yDmDdO2qM3jdpKuUcQvrb4SaYdE5F9l/ovhBfixe
WEl2Gk0sYwmShqYm3cHDBjv/wPKq9S0AteI8ngb33HH078w2YZIRUy3edK7KzaujPC/Cj2kY7kHK
KHQhp0Wg2eb4z5zSxRO6SJ+8zaMyhk5OYL+/9HSX5haCWdqQs+HRNB5w9tV7ayZo298e1AnP0zXB
fgl6bKibWJNz90gTQINFtQYBA4sIuH0QXvviX/In5aA+d1MBXEDdWiqW6vZ5X+gvn9AHATAGaOpu
/dw=
=ZJvZ
-----END PGP SIGNATURE-----

--------------JEWlc3Q4btmHvqWa9vlw3Pbv--

