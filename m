Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 909458BA1B6
	for <lists+samba-technical@lfdr.de>; Thu,  2 May 2024 22:52:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=MnJs7wr+Z+BQRdGAJh82DCoJfMiCHFJcUyIXgGPWScg=; b=VLOBZ31QXAHqmP3NdtV76mlAb/
	R49MmYOv87qbFgkPpej4Acy3s/upClOWOckz2mztZVv8j247J1EW7gw60uCBUnXYX+sc1mhM9vIQL
	VZHlnyFvcrAr614H1iEiT3pstuZiyUuLDSrpHiThIec3PHSyoIYmt6Goemf1agIfxECK74ylIWTqU
	z77FzD/PWthB2U2IPujjNSjppzVc0SlXq7RoeiVb/YIr09OsPQJLUFS9Y9zsd+i1+aTBqp27SbMYr
	kjv3wxU8cPxzh7zlxRQKn/7AL44vZdShkKnuOX3Bffs/7m0y8SQutIMZyFVUqqVjNVyry43sO/gDE
	QuI6c4xQ==;
Received: from ip6-localhost ([::1]:50658 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s2dP6-0087LI-K3; Thu, 02 May 2024 20:51:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38610) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s2dP1-0087LB-IP
 for samba-technical@lists.samba.org; Thu, 02 May 2024 20:51:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=6GKfAs3kXYfQhYwIQzkfq97FnqkpdU1DxvLmvJKns+0=; b=aAPw+XfLRjIETdOYp+Lvn53X+C
 nZwne+jUILijjGYjMpDmW8Itnh0T4vYcsr4oyYrlj84jFup6kMa3bLjoqRqmN/Mm3Mt7cH0KNV8Ay
 DV79DBVl8sJgRVeb/iY6sI0SvAmNCbP3apDjJLMs78zLkD8uySlWxuFWkP4dUfFrdRh1jv/GbCzFt
 yC3lwZIzVW9pL/X5rmg13S3jbbrVD6pFWipwmVQvk5MioWEsz32KNYODw//ss848MK7ZNy4v1swJL
 l3eMNKa77iwdka3fWwsvWG3VmxlftEmhJn+c/qqU7PU93jasexhf8nKhP7GEpABX7NNtjdJHVIZdY
 Zm1hM0tsBYZOXz3kdHHT6+QRKwJlXXvrBjjb2un3N/KI/X9b9MBInktveCZ44hDs2fbNpQIrm9Nd5
 SyPw9wCLQWXHyf6fMkvi3fI1F/JCt8MJGZzfj45oMPwtX9hllJv1PqnumkpmcqWuG2QewSJzM2ic5
 0AEMGxYlZF9XP0whZC/dzOdX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s2dP0-009VCP-0B; Thu, 02 May 2024 20:51:38 +0000
Message-ID: <52bc03e9ab383fff654a28a0f309ac02e3bb5b9e.camel@samba.org>
Subject: Re: Fwd: Regression: ldb performance with indexes
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Date: Fri, 03 May 2024 08:51:31 +1200
In-Reply-To: <2688204.lGaqSPkdTl@magrathea>
References: <4856178.OV4Wx5bFTl@magrathea>
 <44c7b6c9-519a-4b01-ae62-2d03b033c3d4@tranquil.it>
 <b7669c93-fb36-4949-bea0-c295836ebd27@tranquil.it>
 <2688204.lGaqSPkdTl@magrathea>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: yalemu@tranquil.it, Denis CARDON <dcardon@tranquil.it>,
 =?ISO-8859-1?Q?Andr=E9as?= LEROUX <aleroux@tranquil.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2024-05-02 at 14:49 +0200, Andreas Schneider via samba-
technical wrote:
> On Friday, 22 March 2024 17:55:23 GMT+2 Andréas LEROUX via samba-
> technical wrote:
> > Hi Andreas and Andrew,
> >  >>>> > Hi,my colleagues discovered a performance issue in libldb:
> > >>>> > https://bugzilla.samba.org/show_bug.cgi?id=15590
> >  >>>> >  >>>> > > > > As soon as you use indexes, ldbadd will be
> > magnitudes >>  >> slower than >>  >>>> > itwas before.Could some
> > ldb expert please look into it? >>>> >  >>>> > > Your subject says
> > a regression. What version is this a >>>>  >>>> regressionagainst?
> > >>>> Isn't that obvious from the bug report? >>>  >>> Here is the
> > short summary: >>> $ bash repro.sh 20000 indexesAdded 2 records
> > successfullyAdded >>  >> 20000 >>  >>> records successfully >>> On
> > Samba 4.10: 0m01.231sOn Samba 4.19: 1m30.924s (that's 90 times >>>
> > slower) >>>  >>>> > The very nature of a DB index is that it will
> > take time to >>>>  >>>> create,possibly a lot of time, but should
> > make reads faster. >>>> Either the DB index doesn't work at all in
> > Samba 4.10 or there >>  >> is a >>  >>> huge performance problem in
> > Samba 4.19. What is it? >>  >> Thanks, that wasn't written as
> > obviously on the bug, thanks for the >> clarification. >  > I used
> > our CentOS 8 Stream CI image for bisecting. You can't bisect >
> > easily on a modern Linux Distribution, as the included waf would
> > not > have support for newer Python versions like 3.12.
> >  > In case you want to reproduce it, here is my run:I'm Andréas
> > from Tranquil IT dev team. Denis and Yohannès asked me thisweek to
> > take a look at the performance issues on large domains,
> > whichinclude this issue in the current thread along the mdb large
> > transactionissues.
> > The attached patchset goes through all the tdb and ldb make test.
> > * LMDB : increase MDB_IDL_LOGN from 16 to 18 to accomodate large
> > nestedtransactions* tdb : fail-fast when record hash doesn't match
> > expected hash to avoidto read/copy the entire record* ldb :
> > increase DEFAULT_INDEX_CACHE_SIZE from 491 to 8089 to increasethe
> > number of bucket to have smaller bucket to have faster iteration
> > ineach buckets in tdb_find
> > With this patchset we can upgrade large domains (>200k objects)
> > toFL2k16 level in approximatly 1 hour instead of 3 days :-)
> > [root@srvads1-bl1cw ~]# bash repro.sh 20000 indexes Added 2
> > recordssuccessfully Added 20000 records successfully real 0m0.536s
> > user0m0.798s sys 0m0.105s
> 
> I'm sorry but I'm not able to reproduce this:
> 
> tis-tdbfind.patch:
> bash repro_dev_ldb.sh 10000 indexesAdded 2 records successfullyAdded
> 10000 records successfully
> real    0m9.035suser    0m9.021ssys     0m0.283s
> 
> tis-ldbfind.patch:
> bash repro_dev_ldb.sh 10000 indexesAdded 2 records successfullyAdded
> 10000 records successfully
> real    0m8.929suser    0m8.980ssys     0m0.219s
> 
> 
> I have a patch in the area to get rid of some malloc calls, but the
> only give a really small improvement.
> 
> I don't know what workflow your patches exactly improve but it would
> be nice to have a reproducer :-)

Just a quick note to connect some threads.  We have three discussions
on this same issue, we should probably centralise here as this is where
things started, but just so folks can follow, see:
https://bugzilla.samba.org/show_bug.cgi?id=15590https://gitlab.com/samba-team/samba/-/merge_requests/3616
In short, the emerging consensus is that we really need is a better
data structure than an in-memory TDB for the in-memory cache needed to
keep the indexes lined up with the database in this case.
Andrew Bartlett-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead                https://catalyst.net.nz/services/sambaCatalyst.Net Ltd
Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company
Samba Development and Support: https://catalyst.net.nz/services/samba
Catalyst IT - Expert Open Source Solutions
