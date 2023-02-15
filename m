Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 314DF6977D7
	for <lists+samba-technical@lfdr.de>; Wed, 15 Feb 2023 09:15:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=2PN0yJoiB4Lq92e0P1rxYK1Buo8SpIj0+maUxxjxu1o=; b=6WsZRcof8/THxUrELe4VIF2S5k
	3VFU9CuaNp1Qbq4A7tNGaIcxiHxdZj8D6HObjCmlOhRVBT7605UpCd3EiPPtx0Ns/8NIAr6s4lwzA
	HbjxV1w9tSfsrEbwZTSytP2c0Ufbvz+21gEiYmjp+cY/tvmSuTgY2+OgCp3yjFkaQyiDi5/dnQsDW
	MLOdXnQ3SdnVzEy5QQ0nKGLEky+Hpb010X3YSVhznI1UeTT80rx29cx8z6u96m1C2USuCxHaK2djM
	eX8WZ8C3txWXRoqErs7PVXavSGRhtW6n9joEVOdixni7MRlm6SbdhV1VohZyKFZdFCcng8XnARdny
	4iqyBodw==;
Received: from ip6-localhost ([::1]:46932 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pSCw8-00CIis-UN; Wed, 15 Feb 2023 08:14:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20224) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pSCw4-00CIij-02
 for samba-technical@lists.samba.org; Wed, 15 Feb 2023 08:14:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=2PN0yJoiB4Lq92e0P1rxYK1Buo8SpIj0+maUxxjxu1o=; b=aq2kuP/WMXGGh4frQhOUG3Q/Bn
 oeFRFSFaFYFXC+4idZc4kH+yrCwdtxccGSmqkehkjNfQZy6QSw/9ELzzUTpq/DmVNcoUxIWwnl1KK
 7NqZXGdWJvAZMCeuwt1tLZ7iYGksjDZDAUXZV4cShPlOYj6924/qb2zACaJLuM3QeWJsEYP6vU+ov
 qEKnAPo9zhlpI45orUwYIf1xTnt5Hn/CPcVazDsLoCECMNmXHzteXJIfoHt8NnUksNmYhTJFOjuIW
 NgHrPPkZbbK5ynRT4MeBnTV5CzTmEQ9bIuvIBO93XZDjIs11Wzlwm5Shfjdem9uEFLXc3VcvuxClh
 +m6eYVs/jRlTzJ3on5gVLbuAshQORHMpNFR8D/l8tN+6t6eZe0IfiYteuYIGX6bKS9QOWAgXdBvZB
 0Fc3RIbFaZ8/ZdkYAnKGOmL9twi0IrtWr72wFiaSGyMlNNu1Q6yDqLdO5leRhaffSxhuKebyMCVRC
 Xx754zCrAlk68H5e36FTSFbJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pSCw0-00DoVh-Pd; Wed, 15 Feb 2023 08:14:37 +0000
To: Jeremy Allison <jra@samba.org>
Subject: Re: samba-tool domain backup with lmdb on btrfs fails
Date: Wed, 15 Feb 2023 09:14:35 +0100
Message-ID: <2672310.mvXUDI8C0e@magrathea>
In-Reply-To: <Y+w68GDJqgXRTnKU@jeremy-acer>
References: <1944992.usQuhbGJ8B@magrathea> <12155582.O9o76ZdvQC@magrathea>
 <Y+w68GDJqgXRTnKU@jeremy-acer>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: samba-technical@lists.samba.org, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wednesday, 15 February 2023 02:52:48 CET Jeremy Allison wrote:
> On Tue, Feb 14, 2023 at 09:13:51PM +0100, Andreas Schneider via samba-
technical wrote:
> >I think I found it:
> >
> >The issue is the lmdb mdb_copy command on btrfs
> >
> >     def offline_mdb_copy(self, path):
> >+        mdb_chksum = create_file_checksum(path)
> >
> >         mdb_copy(path, path + self.backup_ext)
> >
> >+        mdb_copy_chksum = create_file_checksum(path + self.backup_ext)
> >+        if mdb_chksum != mdb_copy_chksum:
> >+            raise CommandError("FATAL: MDB checksums don't match!")
> >
> >
> >This triggers on btrfs and works on ext4!
> >
> >
> >I will prepare a reproducer tomorrow.
> 
> Fantasic debugging Andreas ! That narrows it down perfectly.

I've created

https://bugzilla.redhat.com/show_bug.cgi?id=2169947



-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



