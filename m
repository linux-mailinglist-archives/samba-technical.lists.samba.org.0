Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B6B2BA624
	for <lists+samba-technical@lfdr.de>; Fri, 20 Nov 2020 10:30:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=5v+SPGz2KTIXnjijsjXIfmpdgPKKuzdODaJmO8RaZr8=; b=doKoQya3wLqJ7Ca4gNudOfgFHl
	+Vu2PH6EZluUJ0Iz4tQL0eWTNzY25bjTAwuKOoM+oUrbq9VYT4lJyRf6VCJ7RciSuj4Jj2FeidlIc
	Vlxr8b4QNUaJZPb/TTXNS/u0X9RcYcyJ/rXQVB5Aq1/uKXIW0bIs77pGnwMHc5tg+q/HHTmcZxYuO
	AHhBjbwybIaEvHQcwdBKjWoqHXG63aSuSdtWAFezO3WnQoyqSVNrBN7J/YKLdV2Z6Dcsiib3oZXoN
	nTBf3l1JLy2eo4IBwPf82EZtJcWaySj+avKxdFznNEm525mrB2m4qcWfj2919EELsy2A9NOLXW6t7
	Lnz6st1w==;
Received: from ip6-localhost ([::1]:24966 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kg2jm-0026Ra-9H; Fri, 20 Nov 2020 09:29:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34078) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kg2jd-0026RT-Hj
 for samba-technical@lists.samba.org; Fri, 20 Nov 2020 09:29:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=5v+SPGz2KTIXnjijsjXIfmpdgPKKuzdODaJmO8RaZr8=; b=DjyRXCTP0KqE3RaVBT9SgVu9VI
 ZKpiRnW3SLoAWzXWk+sk6vNjCI0v8ZDb5a/QRkP+aqkM12/6r2YsLsJr2A67gzobg70H0IBcBWfXR
 jX7ZWY0akgEzCburo6rnaVjlaNa62B69WkhD3LjvGX7tOGt/XmptZynjqmiFG7inj5RJjXhL3zzK+
 05PCjdVrwsQJ4wpVTgu447VAuqZC2qYqA0nOTbUGpVJwtYnhjiVZXbGYiaPbZQWy6lCTXKe4+gQbG
 NCCI1fnA8t9pL6ZO3oTsaBznKmnyTcwp3n71LSlFotJeRv2U1ycNad89EbVxIn/mgFboeUHBv0x7N
 /1JmExfK0nAHrIFvC3RvI5cHEn6KlM2ufoQqnyn7I/C167TIUi6S7LNnuYQE8FmmEozqJxePHA8EF
 qd9zWpxyH7t1plyEPDQH+exrp2Yp6X68Q6KzcC/0tr//8RMyY+S7UzhWHsNbarXPyqMLCdNYFkRlo
 ZpsPT10OG3qCl+Z4N+SEu8Rf;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kg2jc-0001RB-7A; Fri, 20 Nov 2020 09:29:40 +0000
To: Andrew Bartlett <abartlet@samba.org>, Andreas Schneider <asn@samba.org>
References: <d113270e79b2efd610eae0df5619cdd6155d7109.camel@samba.org>
Subject: Re: SOCKET_WRAPPER_PCAP_FILE
Message-ID: <30e8ddb7-5e3b-889e-5086-9c19ed0110c2@samba.org>
Date: Fri, 20 Nov 2020 10:29:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d113270e79b2efd610eae0df5619cdd6155d7109.camel@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="6ClL3sNVs2mvUckIjZW3f65LH0xG0Hmzc"
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6ClL3sNVs2mvUckIjZW3f65LH0xG0Hmzc
Content-Type: multipart/mixed; boundary="AunF8jvS0kJ3xVJ2atCmMZI7lBvQsfnys";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Andrew Bartlett <abartlet@samba.org>, Andreas Schneider <asn@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Message-ID: <30e8ddb7-5e3b-889e-5086-9c19ed0110c2@samba.org>
Subject: Re: SOCKET_WRAPPER_PCAP_FILE
References: <d113270e79b2efd610eae0df5619cdd6155d7109.camel@samba.org>
In-Reply-To: <d113270e79b2efd610eae0df5619cdd6155d7109.camel@samba.org>

--AunF8jvS0kJ3xVJ2atCmMZI7lBvQsfnys
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 18.11.20 um 03:43 schrieb Andrew Bartlett:
> Since this commit (below), using SOCKET_WRAPPER_PCAP_FILE, which is
> still documented in our wiki, has stopped working for me (I bisected to=

> this).

The wiki says SOCKET_WRAPPER_PCAP_FILE can be used from *within* the test=
env
shell. I guess that's still the case, but that's only for the commands
you execute within that shell.

> All I get is DNS traffic, not the other protocols.=20
>=20
> Can I get some new explanation on how to use it now?
>=20
> I tried using what looks like the new method with
> SOCKET_WRAPPER_PCAP_DIR but I couldn't get that to work on a first try
> either.

That's only an internal helper variable.

SOCKET_WRAPPER_PCAP=3D1 and SOCKET_WRAPPER_KEEP_PCAP=3D1 are the controls=
 for make test

I typically use this:

TDB_NO_FSYNC=3D1 make -j test FAIL_IMMEDIATELY=3D1 SOCKET_WRAPPER_KEEP_PC=
AP=3D1 TESTS=3D'samba3.blackbox.smbclient.s3.SMB3.plain.member_creds.nt4_=
member'

Under the selftest prefix there's a 'w/pcap/' subdir, with files like the=
se:

env-nt4_dc-nmbd.pcap   env-nt4_dc-smbd.pcap      env-nt4_member-setup.pca=
p  env-nt4_member-winbindd.pcap
env-nt4_dc-setup.pcap  env-nt4_member-nmbd.pcap  env-nt4_member-smbd.pcap=

samba3_blackbox_smbclient_s3_SMB3_plain_member_creds_nt4_member_.pcap

metze


--AunF8jvS0kJ3xVJ2atCmMZI7lBvQsfnys--

--6ClL3sNVs2mvUckIjZW3f65LH0xG0Hmzc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl+3jHwACgkQDbX1YShp
vVaFhw/9G589IKujwUqbtQastN3dhHTQ6E6B8jxyzcI10uygN7MAg+gYOIrWKDnq
ok3/YN6DCRGlzV17tnTq82fySZMB9BIBfmOovZQukKxxiDophwIc3dvYUm5YaBX6
y60xsT8FkNmaWVf5usQGl7SLp/BXMWmtjtN6K7LyyfpzmOr1f4m4JaMhv9pwwgFE
/6THpv21TWglHDRGIQvymP9wchhRSl54j740TwQSb4Uzbr7jR6ngxyhINeEk4Eni
7Uw/SWjWRdEeik/lztV30scdo4m02BjU3WNHDHxPzXzN1lkgDQzFHLKkdv3XKpMf
4I0QzermKZCT19sTNLdMdNgClPbA05FDKFB4tbxZs06/kA91g0LnSH3Z+0Vod9tt
fk3mhXWg5sYAR49NDn8NTjYIWysxm1oeB0qBsjx97BIazGZvb+ioR8NoVKPY9cVi
XuxrG3EOWjjNeROtit9w6/GQzC2ZHovpOlDitc7BPNMcgeoh7kegdKlynR9rwl+j
ezvPpIdJ00dZ85lnnEXymUzskyQHtMPu5sIn3MkPut3mpfIcDxcnNW62Hk6wztIy
2noNQxhL8/6N0NwUeCAPknGr9wb7I03qk6UIHtXE8G8yG933P9XDCurV5Bwyz5pG
+v2Vlf2Znj1Puf05cxh2qKlgDEVfig6jnV3S+NzrbEXIJdtepHc=
=lCwv
-----END PGP SIGNATURE-----

--6ClL3sNVs2mvUckIjZW3f65LH0xG0Hmzc--

