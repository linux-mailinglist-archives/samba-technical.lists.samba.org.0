Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4776320CF22
	for <lists+samba-technical@lfdr.de>; Mon, 29 Jun 2020 16:20:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Gt2XERILVfsyqxOeTwi+dXJcqm+YjpNyfQeRo0qLTx4=; b=f9n/tndTKlk4T7ZLCjMi0jzttK
	RVsXxg7n5nNjdeOCTbdfVl5vG/un/orLdhQeUtatiAqGgH9wgRwHmmzzb1w66MuzZmQhpAOjO86mj
	0K9CvBR/CTLZontHQDEEjQWm8TL+bb06BvXPPOf0i4Ljfwb7xZ8mMy21XnsiSf1gElgjLN5F8gpob
	WEnR6OxG17RpbJst4ojjcUHENhjrskk+aJnit49+aUOhiqppzRJxJEwpfjdlcLuXjhq/3oAlDPpl5
	O8cMUHGFW9WH5yNpoaNBa2kHpTC9PbtWrlEPnDdUDJMZHsFA8W7EToxS3MQ7ukpMAz2MrNFuyDnIA
	0MhMzXoQ==;
Received: from localhost ([::1]:55362 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jpudt-002Ymd-Is; Mon, 29 Jun 2020 14:20:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12150) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jpudm-002YmW-TX
 for samba-technical@lists.samba.org; Mon, 29 Jun 2020 14:20:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=Gt2XERILVfsyqxOeTwi+dXJcqm+YjpNyfQeRo0qLTx4=; b=KMCqO0vdrMEfcdAL2E1PLeiCf3
 rF2K6fwtZviCPCPD+u6+Z7OIlceSDK0xjdsEjtkCS/akTz9YrV1dji0M00vrf6ov9Kk9f+5EFX0IQ
 1MNdo3igj7jOlttVzAcRFGIZ3MhsQWGpTvYd3sE6bJAlld1hcUs+LuQO8oI59AMfSfwMF87L+mv3J
 JldTYGXIRKH0ZKSwJlvieJaSOnaLMh1mAXBStJ6bvZHCicDMoFRtJIxrb4KdUR5nFTehKR28Cz8V5
 9582QVCkgg63YVThJPAavaPw6EJDMMx5PL0I/oXQS+z1rLjfjO1As1t7c5GI+Xh5HaQ9J7mgnlvu3
 P2SxwFSKHbYklheGXRpXlIGIwZJrg5Ipi0291KxpwfNV15pkd2qPr3fEqwvd7fn/zs32xxjm6rIkQ
 qr28weyL78abdU47xu/Ns0rCzmSbux5YT0XgJvkDvSCTO+1miBZdxKR4ttlLwzeNgzGsz8j0wmRAC
 9kqei2ReJII3vzt94pBbaJGH;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jpudm-0004qK-63; Mon, 29 Jun 2020 14:20:10 +0000
To: Anoop C S <anoopcs@samba.org>
References: <35bfe7ee-5c75-c785-8648-4c8191a9974a@samba.org>
 <86481a324b2b5068dfa438bedd6b7205fbe0ccf5.camel@samba.org>
Subject: Re: socket-wrapper fd-passing
Message-ID: <56f956ce-98f4-6f51-960b-91ba7af19da3@samba.org>
Date: Mon, 29 Jun 2020 16:20:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <86481a324b2b5068dfa438bedd6b7205fbe0ccf5.camel@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="0vBZprqnS87UBi8xVscryMMrBp0d8m5hp"
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
--0vBZprqnS87UBi8xVscryMMrBp0d8m5hp
Content-Type: multipart/mixed; boundary="E1KtJjDL3TEcbdCNXc3HSJBBikkmIA4SF";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Anoop C S <anoopcs@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>
Message-ID: <56f956ce-98f4-6f51-960b-91ba7af19da3@samba.org>
Subject: Re: socket-wrapper fd-passing
References: <35bfe7ee-5c75-c785-8648-4c8191a9974a@samba.org>
 <86481a324b2b5068dfa438bedd6b7205fbe0ccf5.camel@samba.org>
In-Reply-To: <86481a324b2b5068dfa438bedd6b7205fbe0ccf5.camel@samba.org>

--E1KtJjDL3TEcbdCNXc3HSJBBikkmIA4SF
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Anoop,

>> I rebased your fd-passing patches on top of socket_wrapper master.
>>
>> See https://gitlab.com/metze/socket_wrapper/-/commits/fd-passing/
>=20
> Thanks and sorry for my late reply.
>=20
> See my comments below:
> (WIP branch:=20
> https://git.samba.org/?p=3Danoopcs/socket_wrapper.git;a=3Dshortlog;h=3D=
refs/heads/fd-passing-final
> )
>=20
>> Please also notice my commit on top where I added some more hints
>> on a better design:
>>
>>   - We need to maintain a small file using mmap and protected
>>     by pthread robust mutexes. E.g. one file per local ip address.
>=20
> My current set of patches operate out of a single file(as db) shared
> using mmap() protected by pthread robust mutexes. Do you foresee any
> complications with just one file as common db?

I'm not sure if a single file would be good for all processes of
samba's autobuild.

>>   - The path specified in SOCKET_WRAPPER_FD_PASSING_DB will
>>     be used as the file name, if this is not specified we'll
>>     use malloc'ed and fd-passing is not enabled.
>=20
> As of now I have a hard coded db name SOCKET_INFO_DB defined as
> /tmp/socket-info.db to hold socket_info structures, free list pointers
> and mutex. But the fall back mechanism is not yet present.

At least we should not have a hard coded path under /tmp,
but first we need to make something that actually works.

>>   - The file contains a header (with magic, unique id, size and
>> free-list pointer)
>>     followed by an array of socket_info structures.
>=20
> More or less similar format has been used so far. But remember,
> version/magic, size etc are still marked as TODO.
>=20
>>   - The socket_info_fd structures will only maintain the index
>>     into the mmap'ed array.
>=20
> socket_info_fd is now an array of integer pointers containing indexes
> to mmaped area of socket_info structures.

Yes, maybe it's easier to keep it that way...

>>   - fd-passing is limited to fixed number (~ 127), this should be
>>     more than enough for typical caller (Samba would just use 1).
>=20
> Ok.
>=20
>>   - In order to do fd-passing of tcp/udp sockets, we'll create
>>     a pipe (or similar) where we write an array of with indexes
>>     into the mmap'ed array into the write end of the pipe.
>>     We would also pass the device/inode and a unique identifier
>>     for the file.
>>     The read end of the pipe is then passed as the last fd to
>>     the destination process. The destination process can rebuild
>>     the socket_info_fd structures by reading the array indexes.
>>     out of the read end of the pipe.
>>   - A tricky part will be the reference counting in the database
>>     entries. The sender needs to write the data into the pipe
>>     and increment the refcounts in the db file before calling
>>     sendmsg(). The sender may hold a mutex for each socket
>>     during sendmsg().
>=20
> I hope this is based on your suggestion to have one file per ip
> address. My WIP branch contains changes based on a similar design from =

> https://git.samba.org/?p=3Danoopcs/socket_wrapper.git;a=3Dblob;f=3DTODO=
=2Efd-passing;h=3D95f5107c0601720d9a6df81159976363adf7b52b;hb=3Drefs/head=
s/fd-passing-final
>=20
> final implementation of real fd-passing is still at an infant stage :-/=


I had a look at your branch, but it seems you tried to catch SCM_RIGHTS
at the wrong place (in the code that handles inet sockets).

We need to catch the if (si =3D=3D NULL) return libc_sendmsg() case that'=
s
used for unix domain sockets.

>>   - In order to allow multiple threads (or processes) to share a
>> single
>>     socket we need to add mutex protection in quite a few places.
>=20
> yes..yes, we have decent amount of pthread mutexes now :-)
>=20
>>     In the most common cases there won't be any contention on the
>> mutexes,
>>     but it will garantee correctness for the corner cases which
>> happens
>>     for fd-passing.
>=20
> Sure.
>=20
> In short, I could successfully run `make test` with changes to work out=

> of a common shared file. Still there is one
> test(test_thread_echo_tcp_sendmsg_recvmsg, which I added) failing
> almost consistently on my local system and not on GitLab CI. I have
> been trying to root cause this failure for quite sometime now(as and
> when time allows me) without any luck in fixing it. I would love to see=

> another pair of eyes reviewing the changes.

I guess the problem I described above and the code that tries to
construct the updated SCM_RIGHTS fd array, seems wrong, as far as I can
see it only tries to pass the tmp pipe read end, but not the actual fd
array passed from the caller.

I tried to get the SCM_RIGHTS passing working here:
https://gitlab.com/metze/socket_wrapper/-/tree/fd-passing-unix

Once I got this working I'll try to integrate this with the rest of your
patches.

>> An additional idea would be using temporary anonymous files (maybe
>> memfd_create() or an similation for it) for shared structures for
>> passed
>> sockets. In sendmsg() the sender would move the
>> socket_info[_container]
>> structures from malloc'ed memory to an temporary memory file.
>> This will replace the pipe fd of the original design.
>> If multiple fd's are passed, the memory file contains an array of
>> socket_info[_container] structures.
>> int *socket_fds_idx would be changed to an array of structures
>> or we have an additional array to store possible fd for the temporary
>> files and have the destructing code lock at it and select between
>> free() and munmap()/close().
>> This design would not require a named file, like the one specified
>> by SOCKET_WRAPPER_FD_PASSING_DB.
>=20
> Hm.. this is new to me. I will think about it.

I guess it means we would need to undo some of the changes we made
to one array of socket_info structures.

I'll let you know if I get the basic passing of information via the tmp
pipe working...

Thanks!
metze


--E1KtJjDL3TEcbdCNXc3HSJBBikkmIA4SF--

--0vBZprqnS87UBi8xVscryMMrBp0d8m5hp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl75+JYACgkQDbX1YShp
vVbjjhAAmX4AGhlY8VpltMDN0EWQBCIxAqL6OLkAWrDUdDY1Ls2nhhFiRgW6kEAJ
9YRhbP2DKuXnHZnDyVE0cSLOIX3IRMUR/DSQ7/esJWh4PO0fda1XIg9uAfOZnBzr
nXoR91qs1uYolEl0X/SzjuM1IvlXCUv4KtLQlY116n0TWcsxH3EJONCi/pgvhL4x
eTyt6roQL0keT9/fYJQVxrmmWr31LwpWuAEEAaecW97NPb5fo1BvNUcOTQn4CcIR
ByCQBTgCBWGHs0JbphglPTbpbkyiEAEfl4kgKLXqPIDqEdZHsoOyIt+In1y4X423
KGnXRl2A+Er5zsaDN2s9OBteNyLlNeQrHzBLcblrquDqkve0nUR8lD1AqELER13y
80FDRO+qOgzArE5lLHNa7hXw2Kb3vrUdTiv6AmoNENn2qP+Mm/fQKC71DOW4M6OT
WEUGFvi4X8k2xhmeSs1Oj9Oh5xxaVuAhP6lTJWYFbP0QyWRPrNNEq6FiUGFpkMQ5
HfHFlVds8qtVlt0dgpoS4rHC7ZGbBUroobJsrQof5yNC2yTUMccpm01HaVi8m/gV
aBSZqZ3g+K/+gdNkSYTftxabKLf4eU8dV3rP/UTjvFpHG99T+Ey+G3C62qrFS3WQ
qhzepI5EBQv2vIW1EkPtV/ZhWEVOEcS/blMv5l9HWOQvc398zCA=
=X19f
-----END PGP SIGNATURE-----

--0vBZprqnS87UBi8xVscryMMrBp0d8m5hp--

