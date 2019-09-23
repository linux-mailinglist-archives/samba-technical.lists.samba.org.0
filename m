Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D50BBE17
	for <lists+samba-technical@lfdr.de>; Mon, 23 Sep 2019 23:44:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=yRbRCPMrbYyAdpVbGgSiy0ipAN5jhbtsesmk9gCzTVw=; b=X/aYA28a9tYsgvqt6sRQMorNd6
	V/gsrgvt8IKjF9/7KxE80Yqfevk3alQk9P1E8IGzfooJMkrSkN+W+O7em22JaF7U3x5XjsYMRmez0
	v5bGZvoQzeW/3dFYZor8/eRjJVO+5a1uDRdx/Y8FvZvjq4xgF5c26o0u6Mu05hrmFT0+BCH/lgj9Q
	d0kQWdHuBvTtvxxB+mIwdwfH321GiJLqE/seTbr/8X5HEHhAMLhtpzVUtLaTNHuP7WQE5tw5LWBQa
	Ib+2I+yY4QYyNUjLlgXI+BhT4sTA5ZI1zXrPxWHNVsp5dlUZ0LJB0ioH0E+lUrCLDDke0W+z+Qw7I
	MugqmbiQ==;
Received: from localhost ([::1]:65188 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iCW7Y-0084UV-8E; Mon, 23 Sep 2019 21:43:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55336) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iCW7T-0084UO-KG
 for samba-technical@lists.samba.org; Mon, 23 Sep 2019 21:43:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=yRbRCPMrbYyAdpVbGgSiy0ipAN5jhbtsesmk9gCzTVw=; b=fZA4LQgvjium4HsVp98kJs4iBo
 ya1emldkhLtHbZWgVlUCTl/I94QOpeMX3Z5U8lfuUzPe24ojw+UR7bqM11POAyyD7C4MsG37WuC/f
 od6lorbT0G0GrzlXSz99Bp6v35NN+fqROy+f1t4no+PRi1GE9yF96b72KL5lGuF6wacw=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iCW7R-0006vp-B4; Mon, 23 Sep 2019 21:43:41 +0000
To: Christof Schmitt <cs@samba.org>, samba-technical@lists.samba.org
References: <20190923193911.GA9762@samba.org>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Subject: Re: getpwnam/uid for group with ID_TYPE_BOTH
Message-ID: <09e4ae20-3d89-bc2f-3997-306387644207@samba.org>
Date: Mon, 23 Sep 2019 23:43:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190923193911.GA9762@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="8xW03huizIPvFgjjuETUjgfsAZlGm50l9"
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8xW03huizIPvFgjjuETUjgfsAZlGm50l9
Content-Type: multipart/mixed; boundary="dlGtgFrsz7I157fGpMezKcX96CFxZNLUY";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Christof Schmitt <cs@samba.org>, samba-technical@lists.samba.org
Message-ID: <09e4ae20-3d89-bc2f-3997-306387644207@samba.org>
Subject: Re: getpwnam/uid for group with ID_TYPE_BOTH
References: <20190923193911.GA9762@samba.org>
In-Reply-To: <20190923193911.GA9762@samba.org>

--dlGtgFrsz7I157fGpMezKcX96CFxZNLUY
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Christof,

> The behavior of winbindd changed in regards to whether a group with
> ID_TYPE_BOTH returns a fake user structure. This surfaced during a test=

> of creating files from a SMB client and then checking the ownership
> directly on the file system.
>=20
> make testenv SELFTEST_TESTENV=3Dad_member_idmap_rid
> is an environment that provides ID_TYPE_BOTH for testing.
>=20
> 4-5-test returns fake passwd information for the group:
>=20
> $ getent passwd "$DOMAIN/Domain Users"
> ADDOMAIN/domain users:*:2000513:2000513::/home/ADDOMAIN/domain
> users:/bin/false
> $ echo $?
> 0
>=20
> $ getent passwd 2000513
> ADDOMAIN/domain users:*:2000513:2000513::/home/ADDOMAIN/domain
> users:/bin/false
> $ echo $?
> 0
>=20
> $ ls -l testfile
> -rw-rw-r--. 1 ADDOMAIN/domain users ADDOMAIN/domain admins 0 Sep 23
> 12:24 testfile
>=20
>=20
> 4-6-test no longer does this:
>=20
> $ getent passwd "$DOMAIN/Domain Users"
> $ echo $?
> 2
>=20
> $ getent passwd 2000513
> $ echo $?
> 2
>=20
> $ ls -l testfile
> -rw-r--r--. 1 2000513 ADDOMAIN/domain admins 0 Sep 23 12:30 testfile
>=20
> It looks like the behavior was introduced for Samba 4.5 through commit
> 394622ef8c916cf361f8596dba4664dc8d6bfc9e
>     s3:winbindd: change getpwsid() to return a passwd struct for a grou=
p
> sid id-mapped with ID_TYPE_BOTH
>=20
> and then changed for Samba 4.6 through the patches around
> bce19a6efe11980933531f0349c8f5212419366a
>     winbind: Restructure wb_getpwsid
>=20
> What is the intended behavior here? Returning a fake passwd for the
> group makes the "ls -l" output nicer as no manual lookup of the uid to
> the group is required. On the other hand, creating fake user informatio=
n
> might cause problems elsewhere.
>=20
> What are other's opinions around this? I am planning to add a testcase
> to ensure that this does not change again, but i would like to
> understand first whether winbindd should behave as in Samba 4.5 or in
> the newer releases.

The 4.5 behavior is what we want,
see also https://gitlab.com/samba-team/samba/merge_requests/621

We should fix merge that, could you come up with a simple testcase
to that we don't regress on this again?

Then we need a bug report for backports.

Thanks
metze


--dlGtgFrsz7I157fGpMezKcX96CFxZNLUY--

--8xW03huizIPvFgjjuETUjgfsAZlGm50l9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl2JPIcACgkQDbX1YShp
vVaVWw//dMa3UcKRPRBLsZBVODIxTTUjtfKVKtzPEXyPrQ4GkU6kcHpMsm5fxZw1
oKI9tnhu6gE2uJ0/GIyOdPyvyoppi/GCxARAbZ1ZQOynlZZcCGKT7h65dey8JhwW
ylQTn0RatYTV634KIUd4r22MDnJ9qxvoaxxg2ri6sVE6orpA6IOI3dXxTpwROT9Q
7K22KrTccyreRhSlikdDlviEz01Tbi15L6IrZFN2QIHM6B0rEMU7deLOWtrb2y+f
Loa9s2c6VueiOah67ypCdIPf2Izw4S1r13x4GMY21DDu+P+GaEycSUa6vDxwF0pC
YTgKuO+23BsPPrmY/TX6uf9CqhQ00POvkoO/jYAvAmtGcSfJfxFxD3haP34TRAw7
CerBNEzeA14NKv9MsWkjKsWfoI+qkOLiA9bdSrJkVPRwK8LQFDgkUkCa4Ci7ldkI
pS1+e0oot4bhdWLpSYBxDajsE+Pa6dD8z+lR6IRtMVkPaWhrmou+1MParwSGwxzo
HV1Imzt1NS4RPgxrU2RF1lD3TK91F5rs9FkeYbN5PmGqME90xW6DsXrCJ8if1YDE
mSzGYFCRdGHCC/MQZUMb73evucpsf2XGw7pz5/ZZpS32QnONF+63Xilhuvux+xFD
nJ6dr4FHQ/zjs/cCswJqLme9uE3KRuosjjExxo+E3o06XYXhKbE=
=rE3i
-----END PGP SIGNATURE-----

--8xW03huizIPvFgjjuETUjgfsAZlGm50l9--

