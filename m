Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 957D920ED99
	for <lists+samba-technical@lfdr.de>; Tue, 30 Jun 2020 07:35:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=vVYgKmsSATQJTjFDnOL3FuygbYG6ASorahPSRqLJerM=; b=g7Q5iYZ7Levf6FOfjxLZWZpJa/
	4VqQgC9gf0tZHGxqPO5JDqdQK+O5m7y62/+N9cRw35qVGXV4wluaLIS9Y9fRASygeKF+FesJsm1dS
	XT0+UDqVSS5lAV5biJ6Ss8HWRrALEqz7UVFPaJEKV4fRuzlEl6k90T09Bckm/p5tGv5hMHQQMmoRS
	Dir4XXdLr3MaeB82Nbn1gDsKqdK9Kq2nOhk80Q420WHFGg2tM/DHEcJIpy8Od9Oihhy9WgbX1Occz
	OQwt+Rw/rwzleV0mCZoFO3EpNw/rlO2RtEJ8xdtZGoUbKkP0hsjhhRmC3rDkr4D02kKulGSemGgOP
	+9KYnLQg==;
Received: from localhost ([::1]:23864 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jq8u1-002c7x-Cd; Tue, 30 Jun 2020 05:33:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25692) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jq8tu-002c7q-MR
 for samba-technical@lists.samba.org; Tue, 30 Jun 2020 05:33:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=vVYgKmsSATQJTjFDnOL3FuygbYG6ASorahPSRqLJerM=; b=1Ee8n3BJ6A2eyuAuFk3CBM78x9
 MVkZ+hXbMOBcvAc+ArzNEOXd9mV987vWzEWoP61qgHWBgLfW5FKDaQaxmTZ2Yr309/QThdnHB04fA
 TTUwJXH8ZO7yF/sfWTiOuFFl3G3Qc+Mcd1QizdTx4b+ZQ7sWS0dkElt6TmoqDtTLXCY8+8cnLnIoX
 4MI5u/5rgLH34iDTxBAX5r9tkbRgy8+T/ijM15M87SmYMpnUURbiBTZ7kRR4291Mi7Iha3gjP6wRI
 ZGVMhck1Ah/+48ZCnTZb2CpKcD3B3af4BsA/FrmQkPtQpSLZVwpQgizymrKy+DS5IQSw4CJbno+Gd
 imApOc3jXD7AH0w5FdODvLqWck8IWyj4BCr2p1dA8pUc0WiMexTxK5R4ljnJ+0kUGOACZOynHmYVm
 Lnml0qhixIAvKICk446o3wuIjwhIwgWPCwvEMJl0G50EOEOMluieQvgaME84M8B4VachDcePrDgOR
 8A+/jSRlmlb0U0uj6obP58Ho;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jq8tt-0003PE-1e; Tue, 30 Jun 2020 05:33:45 +0000
To: Anoop C S <anoopcs@samba.org>
References: <35bfe7ee-5c75-c785-8648-4c8191a9974a@samba.org>
 <86481a324b2b5068dfa438bedd6b7205fbe0ccf5.camel@samba.org>
 <56f956ce-98f4-6f51-960b-91ba7af19da3@samba.org>
Subject: Re: socket-wrapper fd-passing
Message-ID: <a5d29d28-c692-e9bc-f7a7-b3a0d2070849@samba.org>
Date: Tue, 30 Jun 2020 07:33:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <56f956ce-98f4-6f51-960b-91ba7af19da3@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="SytKXQnPafrNFMlD4OYS9J0tDPCtClKXT"
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
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--SytKXQnPafrNFMlD4OYS9J0tDPCtClKXT
Content-Type: multipart/mixed; boundary="ZG7jDuDtCZKHLDy493fURopSKIy0ppLSZ";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Anoop C S <anoopcs@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>
Message-ID: <a5d29d28-c692-e9bc-f7a7-b3a0d2070849@samba.org>
Subject: Re: socket-wrapper fd-passing
References: <35bfe7ee-5c75-c785-8648-4c8191a9974a@samba.org>
 <86481a324b2b5068dfa438bedd6b7205fbe0ccf5.camel@samba.org>
 <56f956ce-98f4-6f51-960b-91ba7af19da3@samba.org>
In-Reply-To: <56f956ce-98f4-6f51-960b-91ba7af19da3@samba.org>

--ZG7jDuDtCZKHLDy493fURopSKIy0ppLSZ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Anoop,

>> In short, I could successfully run `make test` with changes to work ou=
t
>> of a common shared file. Still there is one
>> test(test_thread_echo_tcp_sendmsg_recvmsg, which I added) failing
>> almost consistently on my local system and not on GitLab CI. I have
>> been trying to root cause this failure for quite sometime now(as and
>> when time allows me) without any luck in fixing it. I would love to se=
e
>> another pair of eyes reviewing the changes.
>=20
> I guess the problem I described above and the code that tries to
> construct the updated SCM_RIGHTS fd array, seems wrong, as far as I can=

> see it only tries to pass the tmp pipe read end, but not the actual fd
> array passed from the caller.
>=20
> I tried to get the SCM_RIGHTS passing working here:
> https://gitlab.com/metze/socket_wrapper/-/tree/fd-passing-unix
>=20
> Once I got this working I'll try to integrate this with the rest of you=
r
> patches.

I got the basics working. I took your shared space patches on top, but
that just fails immediately in Samba's make test.

>>> An additional idea would be using temporary anonymous files (maybe
>>> memfd_create() or an similation for it) for shared structures for
>>> passed
>>> sockets. In sendmsg() the sender would move the
>>> socket_info[_container]
>>> structures from malloc'ed memory to an temporary memory file.
>>> This will replace the pipe fd of the original design.
>>> If multiple fd's are passed, the memory file contains an array of
>>> socket_info[_container] structures.
>>> int *socket_fds_idx would be changed to an array of structures
>>> or we have an additional array to store possible fd for the temporary=

>>> files and have the destructing code lock at it and select between
>>> free() and munmap()/close().
>>> This design would not require a named file, like the one specified
>>> by SOCKET_WRAPPER_FD_PASSING_DB.
>>
>> Hm.. this is new to me. I will think about it.
>=20
> I guess it means we would need to undo some of the changes we made
> to one array of socket_info structures.
>=20
> I'll let you know if I get the basic passing of information via the tmp=

> pipe working...

As Samba does not require that the socket is usable from two processes
at the same time, I guess we can take a short cut and just pass
the socket_info structure (an array of them) through the pipe.
That would allow us to have multichannel tested in gitlab/autobuild.
I'll see if I can get this to work. Once we have these basics,
we can try to improve the design to be more generic with shared
structures, when we really need it.

metze


--ZG7jDuDtCZKHLDy493fURopSKIy0ppLSZ--

--SytKXQnPafrNFMlD4OYS9J0tDPCtClKXT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl76zrUACgkQDbX1YShp
vVb4oA/+I2d3968IrCrexnvEcp4LyznwHSoRKOdJ+BgOKZymGTY5AHiNOgANAr8p
dXvv/ZgmXDFQl8zXwkuRaFQtwF2T6sN8S/YGF1M2DnftP/eF933WL/BtwsX7K76f
zl7m0c1/h+fZiQw84sGrocIu/uFchIrDYlsfGmFdHPkY63pfiN+XZr8UPXhkFijm
lZCJLY3O6xH1SJTb2G+LNJmBlA1oDgObg2LDUCPJ4xHh/XcpBtXCRKBPpTAgqdY6
iyApnz8QazUPLlswarMdmqFj527CHqPRU0RZs/IPEvgLduTTUfXHbp0NQv8r3mjZ
XobdggpOowM0EwBdP9V+rAjj6YuK4ALPnVFN30kwEfP9MoC2RdGJuQBVBMn2or9S
PIdzh10HoIz13XNPFN7AF3RbQ2MnamYDcEJerw8t2jWBeJQMk5RM7Uel9EEhI0z/
tPRZMV+BYQcPH+ZLBwiyqJEnZET7pRZMWpwCh8agymGY7tv4mGB4ozagfTrOIDGZ
h8t6zv9ffRVxFKy3kOCrLXWFJ4M+T7Pq8eDTLQKEVClCc/qlkIV4+cfFBqPmqAWH
i5+XJdm924+MviV0ftnPD/7XGcROtp6KIr0GWEbTXYtMwU6C/rCHTb2BBjw5RDKO
piSuLp9F16vzA3dmHOsiJSwzWEJhsy+NyNqr01Abx16qssMc8+I=
=CgCt
-----END PGP SIGNATURE-----

--SytKXQnPafrNFMlD4OYS9J0tDPCtClKXT--

