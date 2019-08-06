Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6E982ACD
	for <lists+samba-technical@lfdr.de>; Tue,  6 Aug 2019 07:18:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=SBr5j9H5hufr3cg9zCewUJkbganx7n7FFJM994NvLIc=; b=zGJHQdll83p+BVHzpAonYZCn+b
	rRIBSrPeG6okvivSAe7oMW/3dwUANizzfwJANY2iHIjAPsNBVgbpB3iBb2u4cS+fZRud3WOjgnMzq
	4vEBAvMckwOsWsSWuJMw8wNMANnMT+NYAvJf5SrJ9vRG61CyU18IvyU2e0sQ7NhPLIWAsgRB6N8mI
	19r1WcHWCVH4Q5F5YI0IeRRkYqzd9juvqHkk1TAvE5RCRFeaPjD0/lG4TU7TEK9vAVg+tZPBFoC2+
	cstPyq85eXBd+kEH1RPgVebPJ39lCaTaWRP9hG3hhJK3AuzuiwE/fbmOpNBnPogW1G6Fq4Jtmr6PZ
	CSgG8qfw==;
Received: from localhost ([::1]:35848 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hurqU-004Nnd-4T; Tue, 06 Aug 2019 05:17:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42056) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hurqQ-004NnW-9L
 for samba-technical@lists.samba.org; Tue, 06 Aug 2019 05:17:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=SBr5j9H5hufr3cg9zCewUJkbganx7n7FFJM994NvLIc=; b=RmricxJrrv2/JBwRlNIZQGRSzU
 K7UjhtYYSsYwe7Gg1cm/pGwSGGKJ/3N1kMlybg1Ng3qldy7kZTZgXq9bf3zEpWif7po1Jh15MS5sG
 nYOdsEle4hibm5QUHMSSN/7cSKnRU8yF2H54u+OUvLZveFNYBU++u3n4RFOn05MYtzuw=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hurqO-00012W-6p; Tue, 06 Aug 2019 05:17:08 +0000
Subject: Re: [MS-SMB2] 2.2.3.1.4 SMB2_NETNAME_NEGOTIATE_CONTEXT_ID
To: Steve French <smfrench@gmail.com>
References: <e51f32ff-ce54-d015-4ba0-572ec35f3e45@samba.org>
 <a8102b82-046b-c62a-29c9-a61ae563bf34@samba.org>
 <CAH2r5mvJzTmg+mPDeDcS7RJzdtYV4Coq76fKkVBu3oysU6ihkA@mail.gmail.com>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Message-ID: <442364df-1c26-4161-6a02-98417e8d6aa6@samba.org>
Date: Tue, 6 Aug 2019 07:17:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAH2r5mvJzTmg+mPDeDcS7RJzdtYV4Coq76fKkVBu3oysU6ihkA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="qr6eRBM9rEXYFWFvyAZgXk3LaRHx8llHC"
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qr6eRBM9rEXYFWFvyAZgXk3LaRHx8llHC
Content-Type: multipart/mixed; boundary="y0o7B7JcVgzZfeIl9jJubDAAyLCpp38fA";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Steve French <smfrench@gmail.com>
Cc: Steve French <stfrench@microsoft.com>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>
Message-ID: <442364df-1c26-4161-6a02-98417e8d6aa6@samba.org>
Subject: Re: [MS-SMB2] 2.2.3.1.4 SMB2_NETNAME_NEGOTIATE_CONTEXT_ID
References: <e51f32ff-ce54-d015-4ba0-572ec35f3e45@samba.org>
 <a8102b82-046b-c62a-29c9-a61ae563bf34@samba.org>
 <CAH2r5mvJzTmg+mPDeDcS7RJzdtYV4Coq76fKkVBu3oysU6ihkA@mail.gmail.com>
In-Reply-To: <CAH2r5mvJzTmg+mPDeDcS7RJzdtYV4Coq76fKkVBu3oysU6ihkA@mail.gmail.com>

--y0o7B7JcVgzZfeIl9jJubDAAyLCpp38fA
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 06.08.19 um 00:11 schrieb Steve French:
> How about this fix?

Looks good, if you have tested it :-)

metze

> On Fri, Jul 26, 2019 at 3:29 AM Stefan Metzmacher via samba-technical
> <samba-technical@lists.samba.org> wrote:
>>
>> Hi Steve,
>>
>> I just contacted dochelp for this and noticed (from reading the code)
>> that the kernel sends null-termination for the
>> SMB2_NETNAME_NEGOTIATE_CONTEXT_ID value.
>>
>> I think you should fix that and backport it to stable releases,
>> it would be good if all clients would implement it like windows.
>>
>> I implemented it for Samba here:
>> https://gitlab.com/samba-team/samba/merge_requests/666
>>
>> metze
>>
>> Am 26.07.19 um 10:22 schrieb Stefan Metzmacher via cifs-protocol:
>>> Hi DocHelp,
>>>
>>> I just noticed a documentation bug in
>>> [MS-SMB2] 2.2.3.1.4 SMB2_NETNAME_NEGOTIATE_CONTEXT_ID:
>>>
>>>    NetName (variable): A null-terminated Unicode string containing th=
e
>>>    server name and specified by the client application.
>>>
>>> Windows Server 1903 sends the name without null-termination, see the
>>> attached capture.
>>>
>>> metze
>>
>>
>=20
>=20



--y0o7B7JcVgzZfeIl9jJubDAAyLCpp38fA--

--qr6eRBM9rEXYFWFvyAZgXk3LaRHx8llHC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl1JDU0ACgkQDbX1YShp
vVZWTg//auz8bJEWfJpHTJhuV/UU9ChwOxn/UYDYUWtlzKmzVJb9T35f7NWmOgfA
iLEs21SKNjIZfSj1FNBkRFmu+wOjdxXz+6ObEQ0mueP7eT0SXhdidNwLOXJ0fszO
9PgMmN1I1XjQvvnM/p5Pm3SGXsUK6k4uIZN7lA2dhCag9WYek5XglKRZLAZ39PrF
UOJAtu7Js/ejvOgwlJ2KIO0rNYh066LauEui0Pgs4buGs+rYUc6LmxcXF7kmSvsz
Hv20SiVJjD/l5kc8ljNlB122otV3vQU2Q8ucluxMUGXzR11dsNjBG6oXqPprX46i
2I0dxASmD2g3Kgvy6u1tc0mkLPxsfLt/E+Vg/u1usVOtDxEIXVm4MR31nkN8F1Lh
WvRe9iuIMGLttkiMrVhrdDES0VnqfWgYTAzjwXPALrww5glb+ayyLPFGP8klVXvO
hcbBTJD9XsT06pU+80NX1cRJKfmuY5M01PGM2XkGIax4K4QzU2FhVzegK3Ccu0BN
0/qYVXkLlNOyRpiS60wx1rDyUUnAbNOgXxhkPY72vJsS9FvnF6pswTi2FsKCbJDq
7zphEY3OVCGWTvbu5BQuYpwNPBVxQiD49FwtUkA9BJ8EUICsmpN4L8pRGCEJ+XJR
hn8h84E+IcK0LyynJRkWIhIAl54AUB2vGMfQj2sdqFqBDmcW3Bg=
=b1LL
-----END PGP SIGNATURE-----

--qr6eRBM9rEXYFWFvyAZgXk3LaRHx8llHC--

