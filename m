Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4509E38D
	for <lists+samba-technical@lfdr.de>; Tue, 27 Aug 2019 11:02:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=7hAvHPXFsqeTBvgi9n+tpitfZzoeJTqkiK/kUjLixv0=; b=hOGNhVGEIDAYE2Yx5UF/AMXE5k
	J72QWEx8cpuK4ucKCELL2ZMh0W+qW7CVeixbn9iTrUmXDPn6Aqnf1Gm2CvVsNISnBj5SdXsvrF42C
	WIUnAgwuEIBXs26xwVS2ZLtHAK2GbzeqZEnFck5ehKGWu5VH/LMxHDZY2GVkReUZMiXn6+Vm8vE+M
	MG6RBOk+5tOavX90N29X1SJNUGFGkdWH/K6dQ7/eImhFqULYFNczhdIzrsQpuW2aZFeIObokMNf98
	I1hgeyXuNVVjLdcbU16yTAuN2m9BFZk+PBRWGCrXXYLIz9dizewBKTCmFlKwa10N4wK7BmsQKPgch
	/ZAOPWYw==;
Received: from localhost ([::1]:28750 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i2XMa-008eor-8e; Tue, 27 Aug 2019 09:02:04 +0000
Received: from latitanza.investici.org ([82.94.249.234]:32353) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i2XMV-008eok-KC
 for samba-technical@lists.samba.org; Tue, 27 Aug 2019 09:02:02 +0000
Received: from mx3.investici.org (localhost [127.0.0.1])
 by latitanza.investici.org (Postfix) with ESMTP id D56DB12049D;
 Tue, 27 Aug 2019 09:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cryptolab.net;
 s=stigmate; t=1566896508;
 bh=7hAvHPXFsqeTBvgi9n+tpitfZzoeJTqkiK/kUjLixv0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Resent-From:Resent-To:
 Resent-Cc:Date:From;
 b=e2GjH0XtiBP8nqLCcXv1YRJAggRB4jZLjQQ96QDyXRipbMrhhNtOZ8xtpGL2c73do
 +IDxgkd+14671578TUFI9Z8wgEfpe/JgKKpIKWHUpFg1G5lFoK7a4a/yXuoO5jvGd2
 Ce99Ru1TMsa/jfC+Zmm5eeFX6LOpI4zZBCYLWA7c=
Received: from [82.94.249.234] (mx3.investici.org [82.94.249.234])
 (Authenticated sender: anoopcs@autistici.org) by localhost (Postfix) with
 ESMTPSA id 17D3E120145; Tue, 27 Aug 2019 09:01:46 +0000 (UTC)
Message-ID: <5b898b9f283f59da6ede16ca748e18ad4c02f518.camel@cryptolab.net>
To: samba-technical <samba-technical@lists.samba.org>
In-Reply-To: <b271e08ddfa327529a3579d5d2fbefe269a8de64.camel@cryptolab.net>
References: <e3886f8fcb0ed4aae2965099bcdb0b4ff35a581a.camel@cryptolab.net>
 <b271e08ddfa327529a3579d5d2fbefe269a8de64.camel@cryptolab.net>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Subject: Re: NT_STATUS_INVALID_HANDLE during file open with  vfs_glusterfs
Resent-From: Anoop C S <anoopcs@cryptolab.net>
Resent-To: samba-technical <samba-technical@lists.samba.org>
Resent-Cc: Jeremy Allison <jra@samba.org>
Date: Tue, 27 Aug 2019 14:31:41 +0530
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
Content-Transfer-Encoding: quoted-printable
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
From: Anoop C S via samba-technical <samba-technical@lists.samba.org>
Reply-To: Anoop C S <anoopcs@cryptolab.net>
Cc: "Volker.Lendecke" <Volker.Lendecke@SerNet.DE>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2019-08-21 at 08:43 +0530, Anoop C S via samba-technical wrote:
> On Mon, 2019-08-05 at 19:52 +0530, Anoop C S via samba-technical
> wrote:
> > Hi all,
> >=20
> > The following commit changed the way in which O_NONBLOCK is
> > added/removed from file status flags during open.
> >=20
> > https://git.samba.org/?p=3Dsamba.git;a=3Dcommit;h=3Def582ffcf3a220b73f6=
78d9bce0fd37800f76c54
> > smbd: Always open files with O_NONBLOCK
> >=20
> > Since O_NONBLOCK is now internally getting added unconditionally,
> > storage backed by GlusterFS volumes using vfs_glusterfs produces
> > *Invalid file handle* error while opening files(I tested from
> > Windows).
> > set_blocking() from open_file() is now being invoked due to the
> > presence of O_NONBLOCK flag and fails at fcntl() call operating on
> > fsp-
> > > fh->fd which is obviously bad and returns EBADF.
> >=20
> > Thus when open file descriptors are handled as fsp_extensions we
> > may
> > have to rely on VFS itself to get the job done.
>=20
> Based on follow-up offline discussions proposing the attached patch
> for
> review. Since this is not supposed to be land in release branches I
> hope we are good with not adding the BUG in commit message.
>=20
> Pipeline:
> https://gitlab.com/samba-team/devel/samba/pipelines/77444128

Pipeline after recent VFS changes:
https://gitlab.com/samba-team/devel/samba/pipelines/78439007

> Thanks,
> Anoop C S.=20


