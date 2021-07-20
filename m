Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD9A3CF4CD
	for <lists+samba-technical@lfdr.de>; Tue, 20 Jul 2021 08:51:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=rEu0H3fBxVIO/KZvVMEt7jFBl3OqPrAYt+vKvZ+RNUA=; b=2yVzjc25WfKfVU8geC39pyPN6s
	r78G5FUi6l61ZzuTz2CVydLwfrT+RPUb6JfdnoT6bYWs0+FfUUppMvdrJfE3RoRtOkZ0MmMTpWf/f
	vA12mN2zAm78ImXj3TKk1ymngmtTZiNmRLCibru0QK6E4X79cVZiVCL21SgavMo2XuUbtVYffudj7
	NUIdXXZ0RGvo2nqECnKaCqqdNaAMSb3FVCIvBQp2UVCivl205SF9MhTxYUoTusTRv0En+0q+DDoOT
	hXw8O0jiarApQmZ+vZoYjUjlw38WlfLA2qs8otdvf3ZkCtE1rG9G1wBtNSt1DEneh/nEH7n0KJGhj
	dXMhBj6A==;
Received: from ip6-localhost ([::1]:28652 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m5jb1-00FH5Z-7W; Tue, 20 Jul 2021 06:51:15 +0000
Received: from mailhopper2.bazuin.nl ([195.134.173.123]:43936) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m5jao-00FH5Q-Pq
 for samba-technical@lists.samba.org; Tue, 20 Jul 2021 06:51:05 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1627368050.5226@adh5ClMoPnZGHL5R/tsQqg
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: 72EB21213F8.A6773
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id 72EB21213F8
 for <samba-technical@lists.samba.org>; Tue, 20 Jul 2021 08:40:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20180308; t=1626763249;
 bh=1Fb0ME1K+wdU/zc/wCsay0v+Gc0lNXJoFaUwHN2lfH0=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=LBjPOONjKAQ88QpbVyNsdeN/1/dgD/W8sfFLlc7x9fUaw5DIIETtWh1RGuuvmv/d1
 kaYM7uPC3o41FgG9prOJ89LTqWIdwZtaPquU0kPqaMaYZ8vPfs9Oo6LNpeaDEPRwGm
 b/oUbN0m1yGG/Ltu8Rh2ixjPVb4MHqnY0uUGZJyvF8sU4DVmNqNVrkgvoNJyAT5e+r
 7Zolvz5aagCLjEwL8KgJFDk55igwJRIVHpTC8cN03Zm5n6CGsCPNZPI+w7vC3C9ucc
 5jVssCNGwlZuJVIiEVZlEl/Sny7uJzEFzsbYWR4bvKjXzBv7tJLV/q2L1e1Kzd5Avf
 GmNjZKT/QFpyw==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id F2F0518C2239
 for <samba-technical@lists.samba.org>; Tue, 20 Jul 2021 08:40:51 +0200 (CEST)
Subject: RE: [Samba] Has anyone checked ceph with 4.15.rc1 ?
To: =?windows-1252?Q?samba-technical=40lists.samba.org?=
 <samba-technical@lists.samba.org>
Date: Tue, 20 Jul 2021 08:40:51 +0200
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210719161147.GA2806846@jeremy-acer>
References: <20210719161147.GA2806846@jeremy-acer>
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: Add9MixM+dxTdTDPS/WVCRO+gNPupw==
Message-Id: <vmime.60f66ff3.3736.797a1da540303ba3@ms249-lin-003.rotterdam.bazuin.nl>
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
From: "L.P.H. van Belle via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "=?windows-1252?Q?L.P.H._van_Belle?=" <belle@bazuin.nl>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Good Morning Jeremy,=20

Im building 4.15rc0 today if everything goes as it should here.=20
Already started on it's build depends...

I'll include it in the build.=20
Do you have a bug nr so i can add it to the changelog.=20


Greetz,=20

Louis



> -----Oorspronkelijk bericht-----
> Van: samba [mailto:samba-bounces@lists.samba.org] Namens=20
> Jeremy Allison via samba
> Verzonden: maandag 19 juli 2021 18:12
> Aan: samba-technical@lists.samba.org; samba@lists.samba.org
> Onderwerp: [Samba] Has anyone checked ceph with 4.15.rc1 =3F
>=20
> I'm guessing enumerating directories will
> fail due to me forgetting to remove a
>=20
>          SMB_ASSERT(fsp_get_pathref_fd(dirfsp) =3D=3D AT_FDCWD);
>=20
> inside cephwrap_openat().
>=20
> Can someone confirm, and I'll log a bug and
> add the fix (attached below - the same as
> we used from glusterfs).
>=20
> If the same person can confirm the attached
> patch fixes it I'd also be grateful :-).
>=20
> Cheers,
>=20
> Jeremy.
> --=20
> To unsubscribe from this list go to the following URL and read the
> instructions:  https://lists.samba.org/mailman/options/samba
>=20
>=20


