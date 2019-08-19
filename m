Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BAE9243B
	for <lists+samba-technical@lfdr.de>; Mon, 19 Aug 2019 15:05:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=cnF/VnNC2jaw3MaUs6p6B2b/ufjtrJujZr3ZS85q81k=; b=uQa+P5cY2DGpKSXtsKXUEqeUTo
	btnsBis2fpcDXHZ2bk7ElOFHipUDtmOxhGl61ej4FxpgTNTXlq1t9lIEPKnfjhzoBakj0gZGarCHO
	PPFeh9TvB4b8/4jNcCLD7SvJIyDTo9kJcYLskZHWc3QCZUjQwVXcWQixwl+Cl9s3K9uLIXZ6LQl7N
	1GaPp7ZSl+z4BBUv7xlSlzt1pFcrcyptWtNxx7M0icwiZL0QL6HKr7bKoWb+pRFEXODdE4QyasMt1
	wk7rEdm9k4bJ8LCuc+OVbkEShB7zGPml0VMx5SnlzvGrBolLgnGzIQ/MyRTtcg8mz07Lu3DJLrTKB
	BHXvr+zw==;
Received: from localhost ([::1]:37574 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hzhLG-0071gc-VF; Mon, 19 Aug 2019 13:04:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25918) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hzhLC-0071gV-Rt
 for samba-technical@lists.samba.org; Mon, 19 Aug 2019 13:04:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=cnF/VnNC2jaw3MaUs6p6B2b/ufjtrJujZr3ZS85q81k=; b=jx0ePi7pYmN5YjEfAhirgjv/nj
 r6xRGAKZb2RbZ/goyCH5kAnVVe6r/sMpHumDKAniv/E0XiinCZWda5aZ8jUcFYISkZcWyscqju0jb
 bjhEObCu79brPCb4LsEkNDOmiuyqXiktZCSW/Ki+UP0xWdHpSLj/0NX0ROLGBZ8IWZq0=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hzhLB-00082i-Pf; Mon, 19 Aug 2019 13:04:53 +0000
Subject: Re: [PATCH] Add profiling to vfs_glusterfs
To: Anoop C S <anoopcs@cryptolab.net>,
 samba-technical <samba-technical@lists.samba.org>
References: <8d9bfc615b93514eeb14f9f5c028ee54f05b37d0.camel@cryptolab.net>
Openpgp: preference=signencrypt
Message-ID: <157d477c-295f-985b-eadd-06b8df3abaa4@samba.org>
Date: Mon, 19 Aug 2019 15:04:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8d9bfc615b93514eeb14f9f5c028ee54f05b37d0.camel@cryptolab.net>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="7TCVWQiCPvlQKDEVKNKD8tKgrVjJlRaxm"
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
From: =?utf-8?q?G=C3=BCnther_Deschner_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?G=c3=bcnther_Deschner?= <gd@samba.org>
Cc: obnox@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7TCVWQiCPvlQKDEVKNKD8tKgrVjJlRaxm
Content-Type: multipart/mixed; boundary="0TOsbeT9me9EacfnjP5Ej5fMb6TiB39VT";
 protected-headers="v1"
From: =?UTF-8?Q?G=c3=bcnther_Deschner?= <gd@samba.org>
To: Anoop C S <anoopcs@cryptolab.net>,
 samba-technical <samba-technical@lists.samba.org>
Cc: obnox@samba.org
Message-ID: <157d477c-295f-985b-eadd-06b8df3abaa4@samba.org>
Subject: Re: [PATCH] Add profiling to vfs_glusterfs
References: <8d9bfc615b93514eeb14f9f5c028ee54f05b37d0.camel@cryptolab.net>
In-Reply-To: <8d9bfc615b93514eeb14f9f5c028ee54f05b37d0.camel@cryptolab.net>

--0TOsbeT9me9EacfnjP5Ej5fMb6TiB39VT
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Thanks, Anoop,

please add my RB+, I also created a bug
https://bugzilla.samba.org/show_bug.cgi?id=3D14093 so we can track the
backports for the upcoming releases.

Another RB+ anyone please?

Thanks,
Guenther


On 19/08/2019 14:19, Anoop C S wrote:
> Hi,
>=20
> Please find the attached patch to retrieve profiling metrics from
> vfs_glusterfs.
>=20
> Reviews are appreciated.
>=20
> -Anoop C S
>=20


--=20
G=C3=BCnther Deschner                    GPG-ID: 8EE11688
Red Hat                         gdeschner@redhat.com
Samba Team                              gd@samba.org


--0TOsbeT9me9EacfnjP5Ej5fMb6TiB39VT--

--7TCVWQiCPvlQKDEVKNKD8tKgrVjJlRaxm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQQi7xTdNz0EbkNwwhJI6TdojuEWiAUCXVqedAAKCRBI6TdojuEW
iJajAKCXkl2y1s7hZlNaNyFni1WAsd+YlwCdHGEBqArYDM9eD+DcELksLWRnw0M=
=kDbf
-----END PGP SIGNATURE-----

--7TCVWQiCPvlQKDEVKNKD8tKgrVjJlRaxm--

