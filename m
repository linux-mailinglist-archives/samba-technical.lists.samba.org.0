Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB0F2259CA
	for <lists+samba-technical@lfdr.de>; Mon, 20 Jul 2020 10:15:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=xc6I6X9cfz6zWbGmMCA6O+JlpBvGpnPqnkSjJmM5OxQ=; b=3ll6IeO5zwPXUNgYlwIF/73m4/
	DmwHRh9mbxwWyHrTtjURZs8XRfPevetzJkJSGH9aO3z+dR5x4fKOJ7bJBEAHao6457CzUJLyI57TQ
	17Ai8MNcQ8yjBKjEGhR7NBziRzX/xySgu5eTzDzy2W/zUWhDc2SD+eHunRFMsh5apDQ6PPX9gTVng
	ECVLKpjE4Zv6Cec9zJVOVqhBnzrNdqA5UT5fbszRCAhAsg5GO23TOFqxgFwTYUj/aUtf0ZwR3znT1
	JGpEYzPeUfImR2JQ58UezxGh1OkEBSvTfDfeBIHS9DP4hoF7/R/Z/onSuh3Ec57XbKtLJUa4nK1gt
	O6uYTl6Q==;
Received: from localhost ([::1]:24960 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jxQxH-008lq6-20; Mon, 20 Jul 2020 08:15:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45124) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jxQx5-008lpz-Le
 for samba-technical@lists.samba.org; Mon, 20 Jul 2020 08:15:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=xc6I6X9cfz6zWbGmMCA6O+JlpBvGpnPqnkSjJmM5OxQ=; b=KhFgxXveltCfMhjKJwBMlaXxgD
 SkIC4G6vYq3M7yx4owyn0G+X6RnUNtN71x3cjOxmwnxL+Du1YgR8k3dSMmq6TpfVOqLgSGM6+13To
 6dZ/qTqtDoO0E3xsKsltfycuewM3b08gnnaPbMsqp2NjyT82nsa2o2+El8I7JKQhWyyRqpEGG/Pvb
 EjOVgW794P2utQgcukLAFqZRYPWnKx3btakCwpyh5dOAXrK2ihFasTmjBKJ4GLrwYQCKNpfGDksnj
 EEVWGjxO2teoUfeO+qimusE74eFcT914/P7vph1+cL55sxsnWezVpdOjJsQB71RWO27ViseQhzBme
 erb7GURwXpGzKI7/sDfRdH6UW74IYYy6xrpcynOIiuPd/MMisyp5SYPInUS4hjr2/DVjgcaB9TzmY
 Mym0ppFBx0EWR8wOdv6zhYyOzqr6EA8WUZT6MAUon/aYsnKK9VV3LVA+v0JzUz2yi9w4H9qZZqrZY
 hVI/BxfZry4vBem8IHbJpX5p;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jxQx5-0000Ui-3q; Mon, 20 Jul 2020 08:15:11 +0000
Subject: Re: Samba 4.10.4 - Error loading module nfs4acl_xattr due to
 dependent libraries
To: Sandeep Nashikkar <snashikkar@commvault.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
References: <BY5PR19MB3096D158005BDD10D2A4CF17DE7B0@BY5PR19MB3096.namprd19.prod.outlook.com>
Message-ID: <39d17620-cef7-7f45-a372-2a3a6d900591@samba.org>
Date: Mon, 20 Jul 2020 10:15:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <BY5PR19MB3096D158005BDD10D2A4CF17DE7B0@BY5PR19MB3096.namprd19.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="KR0C5X8T7Spu3QkaCy38hTKUmYQSsCD6O"
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
--KR0C5X8T7Spu3QkaCy38hTKUmYQSsCD6O
Content-Type: multipart/mixed; boundary="CNzkdcOGboKaPRn4AGmKM934YOHXXpsXd"

--CNzkdcOGboKaPRn4AGmKM934YOHXXpsXd
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 7/20/20 um 10:02 AM schrieb Sandeep Nashikkar via samba-technical:
> Hello
>=20
> I am trying to load VFS module nfs4acl_xattr which is compiled and link=
ed on Samba 4.10.4 as shared module.
> It fails to load with following error:
>=20
>   Error loading module '/usr/lib64/samba/vfs/nfs4acl_xattr.so': libgssa=
pi-samba4.so.2: cannot open shared object file: No such file or directory=

>=20
> I have been using the module compiled with source with samba installed =
from yum repo till Samba 4.8.3. I did not face this issue before.
> Can someone guide me why does it depend on this library and how can I t=
ackle this? Do we need to install another package to fulfill the deps?
>=20
> The libgssapi-samba4 library is not present in standard locations on a =
setup where we upgrade/install the samba-4.10.4 through yum repository.
> Its present in the ./bin/default/source4/heimdal_build/libgssapi-samba4=
=2Eso when we build the samba for the module itself.
> If we provide the LD_LIBRARY_PATH and use LD_DEBUG=3Dlibs, we see it lo=
ads many libraries with -samba4 suffix from that directory.
>=20
> Do I need to build samba module with a particular configure flag so tha=
t these dependencies are not required?
> Appreciate any help in advance.

whatever pulls in the depedency for libgssapi-samba4.so to
nfs4acl_xattr.so... why don't you just package them so they're available
at runtime?

-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--CNzkdcOGboKaPRn4AGmKM934YOHXXpsXd--

--KR0C5X8T7Spu3QkaCy38hTKUmYQSsCD6O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAl8VUo4ACgkQqh6bcSY5
nkYapA/9FyiEI7RMoLO2O00axANvm4accazRQneHRUe5817caBPmTrf/izuve8pH
6hgaauNQBoj40Fk4EmMRAfeSxVzG2p+ze8I3hPWd1PZxm0JoDndSa7vXqx5HlPwP
ZJdsavm7uBQh1zCBxJqz527E5k8tj0AC/OlhPQRxlk6cbXnM+S2cVdw7O8GkeZZu
amCvkX6Q4qhDsfz1iGeUYq/iD1Pj7PsJhyBX06Dlhr9KhvZyuXcU3jDUIWimB9BL
VIsU8cU5K2jIra9R2OaBkZmjArUbIRUlyJoHIwbrnds1fY+i0mW4zulPeagIUNsU
EifSn/rgvKOxKs4b4b+724EbJyW1wsMayuhMjvbv6/gT62CJ18vWGXow8ATsf8An
0dSfCDmuRtl8Im2eihp0mkrbjn5kT1aE8+WQdMYPBNCuNNRYhgtEOuRRFfY2QNOK
1ICTWtgGQ6CG081/RTn5mzX7kRdtuk8+FjplkMiefGO68Wr76VAnnI4tT1ufwaaW
cr8fkugwtZ9cWDtpwvS2ee5T2diMLeN5bsjvAtU7lMVPV621jsY7OqiNF8CoY+Eq
qXjC/DRtj3HATxuCwtgqV4Zh+NaedWpL8qonKMiG62sFw+1yBWeJQzAZUL9/dGK3
zUJjKpSc0IuxWj0w3F+SDwFeE/DBWHonGvrQ8oXBMc2AWfxi4vI=
=NG00
-----END PGP SIGNATURE-----

--KR0C5X8T7Spu3QkaCy38hTKUmYQSsCD6O--

