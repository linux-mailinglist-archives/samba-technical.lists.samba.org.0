Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1A82CA4E
	for <lists+samba-technical@lfdr.de>; Tue, 28 May 2019 17:25:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=7HGE9aVXw7DsWU8FtBbb5hFjs6zqm/TMQavTkg84AM0=; b=A5Dl/+eZYWgoU1yub4VBOT7+k1
	Kq4cbVb2ZSGxu6+LsC2mM0kOFAUQZFbSSEo0lARdlOsRiMHRgIKm6xDE3uYQSWE4qcX+xJK+Kq+hx
	JzYAHFf1ZNiY9JTcXf8eDszBVTJHvZxO818wHo4+VZUg9ZU/BogphoP1z8bHLg6VjvOCZCjpsSZKl
	l0JEf01AcF225JDwTBSufasZ4S9bwtyWCjYxQSfrVvbTuiZguK0tVVrjvD/93KPxXbFyP6o2gxHaE
	VS32LWOHKzcRRKXkq/OF6v4TH6y/0WK9aRvgWNqIDM/swgGhc4WfEc9mzZSjRZUXTChX9Qp+RflV8
	tM3VlY+w==;
Received: from localhost ([::1]:36680 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hVdxt-002Mly-QV; Tue, 28 May 2019 15:24:37 +0000
Received: from [2a01:4f8:192:486::147:1] (port=55250 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hVdxp-002Mlr-E4
 for samba-technical@lists.samba.org; Tue, 28 May 2019 15:24:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=7HGE9aVXw7DsWU8FtBbb5hFjs6zqm/TMQavTkg84AM0=; b=q0J7wTYCYDIuOtbrvMxATJZzs8
 CtHzyWVhP9Qg2Bwc8F+96ptN1YKTxI21f1mLxKZQXt/6eeYnT9IwV4adLDC2FQS6a2o30SzV63LkE
 j7AyXZ1gQRBLqOlwpdz+71POZrEJ7p7Zf5QaFladVtb800PkyiJcdxe9+JB2fJCxm4m8=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hVdxg-0000kS-My; Tue, 28 May 2019 15:24:24 +0000
To: d.dario76@gmail.com, Rowland penny <rpenny@samba.org>,
 Alexander Bokovoy <ab@samba.org>
References: <642f86fb-36b6-e647-ec52-e6e93bab2950@linagora.com>
 <b2b6f46b-c819-c917-37f7-ead663bf4cf4@samba.org>
 <1c97651b-c97b-6f38-249b-aff5a091b24e@linagora.com>
 <4f70f827-6b7d-ff57-beaa-6519a8d80633@samba.org>
 <c636364e-f0d9-5c50-4d8e-dddfdda43a67@catalyst.net.nz>
 <9e8c741c-e144-0cdf-2136-d72b8764f2a3@samba.org>
 <228e33ff-1224-fb1e-2f30-60d8934d5675@catalyst.net.nz>
 <1e16699e-5067-325a-ba19-eb05013ffd5d@samba.org>
 <20190527082719.GA4871@onega.vda.li>
 <aed6ac60-f128-6890-5ac3-8178e67cab06@samba.org>
 <133b8c68229553e9c273e1bcc5adeda0e3d28706.camel@gmail.com>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Subject: Re: [PATCH] Re: samba-tool fsmo transfer - uncaught exception
Message-ID: <4ae82f08-97b1-c474-3470-4a5429fdeb85@samba.org>
Date: Tue, 28 May 2019 17:24:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <133b8c68229553e9c273e1bcc5adeda0e3d28706.camel@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="IP1DbJfOWQTv1RpgokE6hzipSUtfw9fo9"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
Cc: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 =?UTF-8?Q?Julien_Rop=c3=a9?= <jrope@linagora.com>,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--IP1DbJfOWQTv1RpgokE6hzipSUtfw9fo9
Content-Type: multipart/mixed; boundary="M58XAWC3iSzkrSD9U5YSQ4bs1HVTsW8Nz";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: d.dario76@gmail.com, Rowland penny <rpenny@samba.org>,
 Alexander Bokovoy <ab@samba.org>
Cc: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 =?UTF-8?Q?Julien_Rop=c3=a9?= <jrope@linagora.com>,
 samba-technical@lists.samba.org
Message-ID: <4ae82f08-97b1-c474-3470-4a5429fdeb85@samba.org>
Subject: Re: [PATCH] Re: samba-tool fsmo transfer - uncaught exception
References: <642f86fb-36b6-e647-ec52-e6e93bab2950@linagora.com>
 <b2b6f46b-c819-c917-37f7-ead663bf4cf4@samba.org>
 <1c97651b-c97b-6f38-249b-aff5a091b24e@linagora.com>
 <4f70f827-6b7d-ff57-beaa-6519a8d80633@samba.org>
 <c636364e-f0d9-5c50-4d8e-dddfdda43a67@catalyst.net.nz>
 <9e8c741c-e144-0cdf-2136-d72b8764f2a3@samba.org>
 <228e33ff-1224-fb1e-2f30-60d8934d5675@catalyst.net.nz>
 <1e16699e-5067-325a-ba19-eb05013ffd5d@samba.org>
 <20190527082719.GA4871@onega.vda.li>
 <aed6ac60-f128-6890-5ac3-8178e67cab06@samba.org>
 <133b8c68229553e9c273e1bcc5adeda0e3d28706.camel@gmail.com>
In-Reply-To: <133b8c68229553e9c273e1bcc5adeda0e3d28706.camel@gmail.com>

--M58XAWC3iSzkrSD9U5YSQ4bs1HVTsW8Nz
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

I'm created a merge request which also contains the fix for this, see:

https://gitlab.com/samba-team/samba/merge_requests/505

The strange thing is that the tests (backported to v4-10-test)
work with python 2.7.15rc1 and python 3.6.7 with out the
'import samba.drs_utils' line, while an installation of
SAMBA+ 4.10.4 packages on debian 9.9 with python 2.7.13, require
that line.

metze


--M58XAWC3iSzkrSD9U5YSQ4bs1HVTsW8Nz--

--IP1DbJfOWQTv1RpgokE6hzipSUtfw9fo9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAlztUqQACgkQDbX1YShp
vVbwnA/7Bp4Rb8Pa3CfqnxtooI2yyWKwyBFuNCcP5JXfuQaT0JsvxbI1BRq9aIKo
vho1GVgF6ytZ2rBAVmtVaewdX0eTEbCJymNRP2JTro1Dc0sZiqApA2Flb8MPity8
Mdh6kKjLTe5OIcucsGEB3jHJ8aJ9dLtGNdiaQ3W0o4ENYCazabFxlraSlnxANV8C
Yn/N81NE3pEYakyw/v5DKoqwa8XoD/ISz2t5vI65vzibb9fK3+0B5n00gHISFDaF
n+qBMrLh3KX9z2BC3wABB5A6UzlYJAS++Fih0AavAd51bElH+eA+WOMIgroOAwq7
5HXwt7gmURKc0C3u6X2MmDQTppaUXSQRap3VV/uMUCdktMvX59NaUYdR6L31IloY
pjU88OeKJ+YzvxrXnuWZr/TVIXKgEWCle8L+daCIKHv3XMutRlBf+b+WCpbGDEQV
YsY2rhqQutKC3/PTV1m51g+aahPHRHMPzawvCuvVwyT2P8UpeVDODcD6W51yb42Q
saSGWcQQKRDNVg0agUn7DP7m+y/aBMxLJG0gcB5uciP4tDe3thyB4VI49/hMe6ug
Kmb+jcicCRxc8hqRgFabSxy70KTO8aj/AjZTKObw+feSMBnw0xM3VGFj5rCplOvW
meEcje07b8moEvx1x8edcMB9FoXKylg/7hQ3D2nGSpkb82S4igs=
=r7KQ
-----END PGP SIGNATURE-----

--IP1DbJfOWQTv1RpgokE6hzipSUtfw9fo9--

