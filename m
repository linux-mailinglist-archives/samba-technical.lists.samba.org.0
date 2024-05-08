Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 348DE8BFF9A
	for <lists+samba-technical@lfdr.de>; Wed,  8 May 2024 15:57:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=tL2pMOGjVsZCbdMFBYjby4jSFWPDPl5dUqU71+SyNtw=; b=ZxDVFAMV9k/gBU49/AjkX/GfpP
	8ytJNjbaNblNTswHfMNNqQQdGlx1ZKJjsao8NRO6q0ZFJ2asQk4xrvEAvZFzvM33X//RRtCCSRMmj
	Gu6Vrax+/Ov0DUIktKvNiBIzeNBkqwrZ5a6ePu2i3oTuWoHubxDMRppnxoG5onUI4Lo7aZm6DXEEP
	LAoO0YMIzHl9ioykkuNIgfw8BOB1PKcxrq5xbtXsz0XAeMRmHFOhsLHmvSrhzoMrJATyELPfGDShp
	ZAzguqangqydpwkFKECRumGHKCmNtZAQbYePRbVjUBYd+PvVnjmCGdCxDbpqPsxKrtaQzRWMf/V3f
	lxcSBUkw==;
Received: from ip6-localhost ([::1]:22388 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s4hnQ-008XTZ-Qx; Wed, 08 May 2024 13:57:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29408) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s4hnM-008XTS-JB
 for samba-technical@lists.samba.org; Wed, 08 May 2024 13:57:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=tL2pMOGjVsZCbdMFBYjby4jSFWPDPl5dUqU71+SyNtw=; b=i3RtDlb6yRpcaQlHvuzSyKftGl
 sbIz2npoG6Jbbz2wLEqsG5qsEHGda/CJmI3wjlq0G4L6xnyiz+RbbHy9EZVIuc+4e1hGIU1n6Y7Fo
 wPe6D6A7UzcSU8xcJ/NoKJwjxbiHf25nkFiHpJSNUGaXFisZTh9yMmQYxYlwDcF+cuf/lRrRZbWXo
 MGBdZ35Df688XOruzAkSSinK2G7iqSJB9uRFkptpkCe1iAqwpDFuFxXVJNe/GI1pocxPHYD0k4pze
 o+ruxvF8iOu5fvXgLZ8h3xVASn+dVLUJkbuDCIvXtlEy5IhF02cu1nTGuz1Wa0+FPAFOVbsbUFiS7
 CIiuiJC2HMF0BHX9G8jJWNxnw/04TGQq1ziAqvlNZS3EEQ9oC3OF/nTJRbybiZamSpwVt1P2kwqpS
 es3Y0u1l+1O6aZeI/3SXhQp3NKeOoyBbtawvQlayyCv+SabFXY+gmY84m5YCUDUPRy9RbyZXlXuyo
 NenjG6WZJV0sdgGQ/qCku7Y+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s4hnL-00ARn3-2i; Wed, 08 May 2024 13:57:19 +0000
To: samba-technical@lists.samba.org
Subject: Re: Fwd: Regression: ldb performance with indexes
Date: Wed, 08 May 2024 15:57:19 +0200
Message-ID: <2262962.t9SDvczpPo@magrathea>
In-Reply-To: <2221646.h6RI2rZIcs@magrathea>
References: <4856178.OV4Wx5bFTl@magrathea>
 <52bc03e9ab383fff654a28a0f309ac02e3bb5b9e.camel@samba.org>
 <2221646.h6RI2rZIcs@magrathea>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Andreas Schneider <asn@samba.org>, yalemu@tranquil.it,
 Denis CARDON <dcardon@tranquil.it>,
 =?ISO-8859-1?Q?Andr=E9as?= LEROUX <aleroux@tranquil.it>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Friday, 3 May 2024 19:20:28 GMT+2 Andreas Schneider via samba-technical=
=20
wrote:
> On Thursday, 2 May 2024 22:51:31 GMT+2 Andrew Bartlett via samba-technical
>=20
> wrote:
> > On Thu, 2024-05-02 at 14:49 +0200, Andreas Schneider via samba-
> >=20
> > technical wrote:
> > > On Friday, 22 March 2024 17:55:23 GMT+2 Andr=C3=A9as LEROUX via samba-
> > >=20
> > > technical wrote:
> > > > Hi Andreas and Andrew,
> > > >=20
> > > >  >>>> > Hi,my colleagues discovered a performance issue in libldb:
> > > > >>>> > https://bugzilla.samba.org/show_bug.cgi?id=3D15590
> > > > >>>> >=20
> > > >  >>>> >  >>>> > > > > As soon as you use indexes, ldbadd will be
> > > >=20
> > > > magnitudes >>  >> slower than >>  >>>> > itwas before.Could some
> > > > ldb expert please look into it? >>>> >  >>>> > > Your subject says
> > > > a regression. What version is this a >>>>  >>>> regressionagainst?
> > > >=20
> > > > >>>> Isn't that obvious from the bug report? >>>  >>> Here is the
> > > >=20
> > > > short summary: >>> $ bash repro.sh 20000 indexesAdded 2 records
> > > > successfullyAdded >>  >> 20000 >>  >>> records successfully >>> On
> > > > Samba 4.10: 0m01.231sOn Samba 4.19: 1m30.924s (that's 90 times >>>
> > > > slower) >>>  >>>> > The very nature of a DB index is that it will
> > > > take time to >>>>  >>>> create,possibly a lot of time, but should
> > > > make reads faster. >>>> Either the DB index doesn't work at all in
> > > > Samba 4.10 or there >>  >> is a >>  >>> huge performance problem in
> > > > Samba 4.19. What is it? >>  >> Thanks, that wasn't written as
> > > > obviously on the bug, thanks for the >> clarification. >  > I used
> > > > our CentOS 8 Stream CI image for bisecting. You can't bisect >
> > > > easily on a modern Linux Distribution, as the included waf would
> > > > not > have support for newer Python versions like 3.12.
> > > >=20
> > > >  > In case you want to reproduce it, here is my run:I'm Andr=C3=A9as
> > > >=20
> > > > from Tranquil IT dev team. Denis and Yohann=C3=A8s asked me thiswee=
k to
> > > > take a look at the performance issues on large domains,
> > > > whichinclude this issue in the current thread along the mdb large
> > > > transactionissues.
> > > > The attached patchset goes through all the tdb and ldb make test.
> > > > * LMDB : increase MDB_IDL_LOGN from 16 to 18 to accomodate large
> > > > nestedtransactions* tdb : fail-fast when record hash doesn't match
> > > > expected hash to avoidto read/copy the entire record* ldb :
> > > > increase DEFAULT_INDEX_CACHE_SIZE from 491 to 8089 to increasethe
> > > > number of bucket to have smaller bucket to have faster iteration
> > > > ineach buckets in tdb_find
> > > > With this patchset we can upgrade large domains (>200k objects)
> > > > toFL2k16 level in approximatly 1 hour instead of 3 days :-)
> > > > [root@srvads1-bl1cw ~]# bash repro.sh 20000 indexes Added 2
> > > > recordssuccessfully Added 20000 records successfully real 0m0.536s
> > > > user0m0.798s sys 0m0.105s
> > >=20
> > > I'm sorry but I'm not able to reproduce this:
> > >=20
> > > tis-tdbfind.patch:
> > > bash repro_dev_ldb.sh 10000 indexesAdded 2 records successfullyAdded
> > > 10000 records successfully
> > > real    0m9.035suser    0m9.021ssys     0m0.283s
> > >=20
> > > tis-ldbfind.patch:
> > > bash repro_dev_ldb.sh 10000 indexesAdded 2 records successfullyAdded
> > > 10000 records successfully
> > > real    0m8.929suser    0m8.980ssys     0m0.219s
> > >=20
> > >=20
> > > I have a patch in the area to get rid of some malloc calls, but the
> > > only give a really small improvement.
> > >=20
> > > I don't know what workflow your patches exactly improve but it would
> > > be nice to have a reproducer :-)
> >=20
> > Just a quick note to connect some threads.  We have three discussions
> > on this same issue, we should probably centralise here as this is where
> > things started, but just so folks can follow, see:
> > https://bugzilla.samba.org/show_bug.cgi?id=3D15590https://gitlab.com/sa=
mba-t
> > ea m/samba/-/merge_requests/3616 In short, the emerging consensus is th=
at
> > we really need is a better data structure than an in-memory TDB for the
> > in-memory cache needed to keep the indexes lined up with the database in
> > this case.
>=20
> From https://gitlab.com/samba-team/samba/-/merge_requests/3616
>=20
> The in-memory TDB is probably the wrong usage here and a red-black tree
> might be the solution.
>=20
> There is lib/dbwrap/dbwrap_rbt.h. From the API it should be straight forw=
ard
> and quick to replace the tdb API in lib/ldb/ldb_key_value/ldb_kv_index.c
> with it just for testing.
> If it fixes it, we should try to make lib/util/rbtree.c a SUBSYSTEM and l=
ink
> it into libldb. As libldb is not standalone anymore, this should be doabl=
e.

Using a red black tree doesn't solve the issue:

$ bash repro_dev_ldb.sh 10000 indexes
RED BLACK TREE
RED BLACK TREE
RED BLACK TREE
Added 2 records successfully
RED BLACK TREE
Added 10000 records successfully

real    0m9.299s
user    0m9.212s
sys     0m0.263s

https://git.samba.org/?p=3Dasn/samba.git;a=3Dshortlog;h=3Drefs/heads/asn-ldb



=2D-=20
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



