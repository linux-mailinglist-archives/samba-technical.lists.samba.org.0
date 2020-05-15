Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4937C1D526B
	for <lists+samba-technical@lfdr.de>; Fri, 15 May 2020 16:50:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=OF6ukuIfzkh5J+GDFsGc7RpH3l8XJisWfsWxVDvNyWk=; b=PPpAVv7i1rfv4bFWFUp9uJn5d1
	P52Gg7h2okYdzobeynuDIIrNQqkXDz0Dyo0yOnWKT0TlEbURKsZ6+YktprbC9yC6s3S+DvpMLCh0t
	cPIleozz6cCDsVwV6KlMdWEBSY0VJFa8yyWxFdCsh8J3nFfRXR4hgcb2cQTm1KtbSV5AEsMWbu+dw
	62je6wYrTw/SDB1dufVnV6F/Pwa6mHPu+g1X3qYVKZPPGvro2WTIThNmE1owrEPnAy9Z/nLCC40m5
	SHGkx9CNYd8601e8/aTyFPS18sIQc3Ps5RFBz/G7viAkx1mw7ni0zEYhbQbkkF11HbRoundGkFAAl
	ZBpCmVWw==;
Received: from localhost ([::1]:59644 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jZbeX-004YGp-Qs; Fri, 15 May 2020 14:49:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33752) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jZbeP-004YGi-6r
 for samba-technical@lists.samba.org; Fri, 15 May 2020 14:49:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=OF6ukuIfzkh5J+GDFsGc7RpH3l8XJisWfsWxVDvNyWk=; b=FBeVNbPxBeBzEBZHWI2hxaYZ4U
 FyS4d4QN3YXLZYUz7SFevmOP23Bce64lCV7ZG/HJ0C3Ea2utVLIGgS7zwLv1WGSDoMfdvXbxHeuH5
 sItq+s/Q36fdelunpnZpZXyrwvlqcwPXKYpzEFAMQpp6cYsMtP9HZ5cIw5KDWTaACTGIH7TJGq8ZZ
 zlMpbuh7KLcMdlvyKYVo4By7/vcchW2fyKiNq5eLOm8wa50SA9m8ItW5xtN7vvSV1vJw8stoCxZTo
 MVtcbg7gB2/Q8wTlQOSYRTfqdFlOP1umkKAkpTP9iHPynu1HIhBuyiMAD6enKk+6L154SK4qx8ODK
 x1uewaBh4SeoffTDS2y3ux8drM86/jLOW6PGXn68qXg4w3vtggVSQU/v4wrDF4cb7ec0qkeXNaqLo
 RBlae0p6n3HgFSVHsv/Qz/qFjEmdFm8072DxKmqHcuAN4k3LYwAinljgvcI0OLa1QCWjHXrW70Y7a
 7C+i4Xdh9xjVQ2iGKz0e3Wld;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jZbeO-00081y-LA; Fri, 15 May 2020 14:49:24 +0000
To: Andrew Bartlett <abartlet@samba.org>
References: <e245b5e81ba6066da467f371bc917d6a052ccb8b.camel@samba.org>
Subject: Re: Heimdal upgrade tasks
Message-ID: <02c579f8-1021-52c7-0671-a85645e2f353@samba.org>
Date: Fri, 15 May 2020 16:49:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e245b5e81ba6066da467f371bc917d6a052ccb8b.camel@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="YhA1pEAyhvAqNyjQqTnJVAjkZA6lCLs3Q"
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
--YhA1pEAyhvAqNyjQqTnJVAjkZA6lCLs3Q
Content-Type: multipart/mixed; boundary="uO9iHLnhV9LYlEP1fr4ImSudsYxWKJzmM";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Andrew Bartlett <abartlet@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Message-ID: <02c579f8-1021-52c7-0671-a85645e2f353@samba.org>
Subject: Re: Heimdal upgrade tasks
References: <e245b5e81ba6066da467f371bc917d6a052ccb8b.camel@samba.org>
In-Reply-To: <e245b5e81ba6066da467f371bc917d6a052ccb8b.camel@samba.org>

--uO9iHLnhV9LYlEP1fr4ImSudsYxWKJzmM
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

> I've had a customer offer to commission some of the work towards Samba
> being a 2012 FL DC, and I've suggested that the Heimdal work you are
> doing might be something I could help out with.

Great!

> Do you have any suggestions about how I can best help you?  I don't
> have a big budget, but if you have some ideas on what I could do in a
> week or so effort that would be awesome.
>=20
> I'm well aware of your tree at
> https://git.samba.org/?p=3Dmetze/samba/wip.git;a=3Dshortlog;h=3Drefs/he=
ads/master4-heimdal
>=20
> What is and isn't working with that so far?

Try to find the pipeline with the related commit or run a new one.

I think most of it was related to the test cases which rely on the
internals.

I guess it would be good to work on top of
https://git.samba.org/?p=3Dmetze/samba/wip.git;a=3Dshortlog;h=3Drefs/head=
s/master-auth

For a start make a copy of python/samba/tests/krb5/as_req_tests.py
and try to add the canon tests.

That would be great.

Thanks!
metze


--uO9iHLnhV9LYlEP1fr4ImSudsYxWKJzmM--

--YhA1pEAyhvAqNyjQqTnJVAjkZA6lCLs3Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl6+q+gACgkQDbX1YShp
vVaoXRAAn/mJvoLKnAEUSCdml4x/0fvxVYYQIVW5XWkgYlIHw18FhUfIYom5wbkV
xABvlBLgA6PvuKbDDIcK/+iIp7VVaDcfXKJWQYQikbGvHhKJKavTDRffe6u82k5/
C/7CnxCpOFqMYdKmXkM0cw1NbfDVlm9b1ioxXeSQVhisU9tFsQOXdEQeCee63XNV
gmTS/Tyc8uQIkOizZ98u1IU7p8zDsJQl9c97j9jnpFVv+tMLhg8SXNvN3GL9MPI3
yhYvtMgW4tzgeQS8vKGLpeBjhEiWXbjpIFfPOVLhtYdyFulhpzEckuK8LsOsZVph
lYFN25Xpwefaly/tFSCy1doa5o3AVI+H2JQ5VXH7XY5phYgNbkTXUuvvUXagPGHQ
CatCAdAcw+M+M5Ei24Id8Oau6Cvkt2rfk2LtW8DI7OkHBQcjwSW2JIgHQA3POEJi
9BLZ0MTN50WEGEsTDUG5T08fNE78wTa88c8h5a/b/Zj0R2GgGF7INksF4UQ3UVZQ
8Jn3xlQNsfhY8tHX1Fkp25qcYJ4nbqC3zfsvxHik+FPsarLND/ZymbUFVny1OXYu
A4t4n7CHv40CkUSCxj9Rowmo1ECb5DH0lDXRCvNL6hE48BMqpEJ+tGi+EE/+2Nbc
pO1beGftSD7+qIcXOJkntHVTxosvinr2ObtTqzCxOC+v9ghyVHc=
=fNm8
-----END PGP SIGNATURE-----

--YhA1pEAyhvAqNyjQqTnJVAjkZA6lCLs3Q--

