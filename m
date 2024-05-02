Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DED8B9B1B
	for <lists+samba-technical@lfdr.de>; Thu,  2 May 2024 14:50:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=aQ0HYDcBi7EWO6SZAPn/YWq3NtF6iCrSdB2UaDMZzZQ=; b=TR2QLBmUI/GLRf/FTzRxhoyImz
	3FbVhhZ+oFFbpVcDDUFpQE2S5bPAsha+xGwtpQyYV02jPcmYx3RraZ0lO1sMfHwwZQjZRMIKcYvoE
	uhx9mutFWkOjDhiWzPVhK24RopiAmp68jNB3xHoiR+T6S1C+Oe0AsK4vC6dAsTE6zSLwk3Wpyx8Kz
	CJFI1PTUXzHMNYnj5Cb4s9sET2OLeD15jXaRnq/qLlhXr9FBysemS66a1g1LK4Inap+9m3xT9fkPs
	fl/2BgDSSwMzKyZm7PCI6ik0PoDiy5N0jyB1DYT5lK5QHG+T3CWX/mMRIEeqGFUwue3UgyVAwTIQi
	RAbeCbiA==;
Received: from ip6-localhost ([::1]:52618 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s2VsW-0085s0-K7; Thu, 02 May 2024 12:49:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45720) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s2VsS-0085rt-Cy
 for samba-technical@lists.samba.org; Thu, 02 May 2024 12:49:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=aQ0HYDcBi7EWO6SZAPn/YWq3NtF6iCrSdB2UaDMZzZQ=; b=QcyADDWYoCwImgoKUT2Cz1yMf3
 Zh65A1+yMfpO6k5+OuNJTKYyxKPiv7OneSnJ1fX36ydpDYSS5iQTk3Cy7vg3b9s5qzek31F4qLMEQ
 lYK1yRzDdE+4ns1mC8/CrSqeKENaD0T4sGe6j6ARI/+2g42Nuklwb6ZGZ8qY9VJhpc5GTMF1j53NA
 ThF9Z2og8uYJTKHu+lQVAFmrOgbIDSFTv85GVto6QvVWbRbn2Djqqya5+ZpQnJ+VkQACQoHlVyPc/
 S789cGjqF3NbfXN0ZMq1x1/7eXwz4MecQZNZeex7ZQ2MbaSGW9G0uHKH8/LUAgIhWyM3wYJAwe692
 H/Ifz1DzDdpux2vImFAmjCNrR8cKJzLDtpGhCqIEXl0A+dr7YY5sqRffVY7Z+ZukUX5ocPcHRQHDF
 NVCSGZqr+PvJMnBIGJLKSwwpLM3G/GSzYjbSO2PoPPoPvOhzrlH7bIKgvD0LqDbcyOOGAB4n7VHvJ
 FcUbtq6aWlxXrqhYSab+nvBj;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s2VsR-009RWb-1K; Thu, 02 May 2024 12:49:31 +0000
To: samba-technical@lists.samba.org
Subject: Re: Fwd: Regression: ldb performance with indexes
Date: Thu, 02 May 2024 14:49:29 +0200
Message-ID: <2688204.lGaqSPkdTl@magrathea>
In-Reply-To: <b7669c93-fb36-4949-bea0-c295836ebd27@tranquil.it>
References: <4856178.OV4Wx5bFTl@magrathea>
 <44c7b6c9-519a-4b01-ae62-2d03b033c3d4@tranquil.it>
 <b7669c93-fb36-4949-bea0-c295836ebd27@tranquil.it>
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
Cc: yalemu@tranquil.it, Denis CARDON <dcardon@tranquil.it>,
 =?ISO-8859-1?Q?Andr=E9as?= LEROUX <aleroux@tranquil.it>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Friday, 22 March 2024 17:55:23 GMT+2 Andr=C3=A9as LEROUX via samba-techn=
ical=20
wrote:
> Hi Andreas and Andrew,
>=20
>  >>>> > Hi,my colleagues discovered a performance issue in libldb:
>  >>>> > https://bugzilla.samba.org/show_bug.cgi?id=3D15590
>  >>>> >=20
>  >>>> > > > > As soon as you use indexes, ldbadd will be magnitudes
>  >>=20
>  >> slower than
>  >>=20
>  >>>> > itwas before.Could some ldb expert please look into it?
>  >>>> >=20
>  >>>> > > Your subject says a regression. What version is this a
>  >>>>=20
>  >>>> regressionagainst?
>  >>>> Isn't that obvious from the bug report?
>  >>>=20
>  >>> Here is the short summary:
>  >>> $ bash repro.sh 20000 indexesAdded 2 records successfullyAdded
>  >>=20
>  >> 20000
>  >>=20
>  >>> records successfully
>  >>> On Samba 4.10: 0m01.231sOn Samba 4.19: 1m30.924s (that's 90 times
>  >>> slower)
>  >>>=20
>  >>>> > The very nature of a DB index is that it will take time to
>  >>>>=20
>  >>>> create,possibly a lot of time, but should make reads faster.
>  >>>> Either the DB index doesn't work at all in Samba 4.10 or there
>  >>=20
>  >> is a
>  >>=20
>  >>> huge performance problem in Samba 4.19. What is it?
>  >>=20
>  >> Thanks, that wasn't written as obviously on the bug, thanks for the
>  >> clarification.
>  >=20
>  > I used our CentOS 8 Stream CI image for bisecting. You can't bisect
>  > easily on a modern Linux Distribution, as the included waf would not
>  > have support for newer Python versions like 3.12.
>=20
>  > In case you want to reproduce it, here is my run:
> I'm Andr=C3=A9as from Tranquil IT dev team. Denis and Yohann=C3=A8s asked=
 me this
> week to take a look at the performance issues on large domains, which
> include this issue in the current thread along the mdb large transaction
> issues.
>=20
> The attached patchset goes through all the tdb and ldb make test.
>=20
> * LMDB : increase MDB_IDL_LOGN from 16 to 18 to accomodate large nested
> transactions
> * tdb : fail-fast when record hash doesn't match expected hash to avoid
> to read/copy the entire record
> * ldb : increase DEFAULT_INDEX_CACHE_SIZE from 491 to 8089 to increase
> the number of bucket to have smaller bucket to have faster iteration in
> each buckets in tdb_find
>=20
> With this patchset we can upgrade large domains (>200k objects) to
> FL2k16 level in approximatly 1 hour instead of 3 days :-)
>=20
> [root@srvads1-bl1cw ~]# bash repro.sh 20000 indexes Added 2 records
> successfully Added 20000 records successfully real 0m0.536s user
> 0m0.798s sys 0m0.105s

I'm sorry but I'm not able to reproduce this:


tis-tdbfind.patch:

bash repro_dev_ldb.sh 10000 indexes
Added 2 records successfully
Added 10000 records successfully

real    0m9.035s
user    0m9.021s
sys     0m0.283s


tis-ldbfind.patch:

bash repro_dev_ldb.sh 10000 indexes
Added 2 records successfully
Added 10000 records successfully

real    0m8.929s
user    0m8.980s
sys     0m0.219s



I have a patch in the area to get rid of some malloc calls, but the only gi=
ve=20
a really small improvement.


I don't know what workflow your patches exactly improve but it would be nic=
e=20
to have a reproducer :-)


Best regards


	Andreas


=2D-=20
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



