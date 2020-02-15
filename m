Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B23E15FD2E
	for <lists+samba-technical@lfdr.de>; Sat, 15 Feb 2020 07:54:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=e0Qn1SPolaoiYelVB/vjm5yX+sfPaFB/B5dDJvpRMUE=; b=ta8svk/k5J6s+CwV7EBsQJCG2k
	czDQdeMbNkiUQVhqGijNRd3ALn3cZDofN39CxvbS/i9x5Fb4qGD3++F/3u/ViQzARloxx7CmUs+I5
	kZW93HtCMv85X5kLbjqtAGODY9ansLv1R0FAL0iEenw7ASBTIKO0l4tbSgoroautU4+PjuisbisGy
	9G+klvFX5kgZ7TO7AWpRhUayYM49YA1xGn2yXzTY92EbDvRPbwwsKYZuiGkz8GG0FpgqYCXX4QNf8
	EQvOVh196q6SMPonz4oJSYAlMB0eCYOT26qXewIAUhiUyx2l91ncbNJmG/awYbTUwXnzlVpfx482I
	8hp79DFA==;
Received: from localhost ([::1]:18184 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j2rKd-00A0Fb-Ti; Sat, 15 Feb 2020 06:53:39 +0000
Received: from ozlabs.org ([2401:3900:2:1::2]:42209) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j2rKR-00A0FU-Se
 for samba-technical@lists.samba.org; Sat, 15 Feb 2020 06:53:30 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48KLYS62H2z9sRG;
 Sat, 15 Feb 2020 17:53:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1581749596; bh=FKClNtlddhglaOH23gmFeevmjmS8LS19d+hRY6nDE8o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=khi41FJSqDp/ylCoxkSL6sVzjgKyWw3ucMP7PGzQOIsNL2ngilDxZHbRjNozvHJ8f
 0w3GoSwsX3/Hofnukx5x4Ouu3dPxKBVzHKmAhvIgqO/iRC1vtAPbKfttGp6prwla0l
 LuWB29lYiUeVqV48uZV7Oy1cWT1t25l0ckWDj4DThoBaNQVG+BakQmiejNkOB++aYP
 A8mHLX4g90meqG1zq0CsT3ASNubHnDu7wbjDyMBtBuroMTqwe9ynRkLsXJUCIv2/Az
 XDpZw+GsyypZ0Nps4/yZv2Nn+sMqXZleSatMZr9TFHBVYO+n70rM3HoS8LoNdmj0kf
 2PSHwQ1CWwGjg==
Date: Sat, 15 Feb 2020 17:53:15 +1100
To: =?UTF-8?B?6aOO5peg5ZCN?= <wuming_81@163.com>
Subject: Re: about ctdb deployment  without clustered file system
Message-ID: <20200215175315.2086f01a@martins.ozlabs.org>
In-Reply-To: <3dd860da.2394.17047084308.Coremail.wuming_81@163.com>
References: <3dd860da.2394.17047084308.Coremail.wuming_81@163.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

On Sat, 15 Feb 2020 12:08:08 +0800 (CST), =E9=A3=8E=E6=97=A0=E5=90=8D via s=
amba-technical
<samba-technical@lists.samba.org> wrote:

> evryone.I'm sorry to bother you guys. I want to ask  a question about ctd=
b.
>=20
> In ordinary config, we need a clustered file syste, such as
> glusterfs/ceph to provide a sharing volume for ctdb.
>=20
> If I do not deploy any clutered file system,  use
> samba/ctdb/utils/etcd/ctdb_etcd_lock (maybe it needs
> rewritten/modified)  instead of the file lock, and place every config
> file in local servers instead of the sharing volume, will ctdb work
> well ?
>=20
> I have tested some situations and not found anything abnormal.I am
> afraid that the tests are not enough.

CTDB will work in this mode, as a replicated and distributed database
without any problems.

However, CTDB's main job is to provide a distributed (and, depending on
the database, replicated) database for Samba file metadata. If you have
smbd instances running on multiple nodes but do not have a cluster
filesystem then the different smbd instances can not service the same
files.  This means you don't get either the scale-out offered by
Clustered Samba or the redundancy.

So it will work, but I wonder why you would do it...  :-)

peace & happiness,
martin

