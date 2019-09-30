Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DABC1A7B
	for <lists+samba-technical@lfdr.de>; Mon, 30 Sep 2019 06:24:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=+k+7Ada/pIcrbt8S5+phdXhH7RCow4nxEMGvjXKSmdc=; b=EMKg28OVmbBSbAQkmvXV/uyjzs
	3D6Pp2Bk07NinlYotNcpLBMRSroXYTgR8QIXQqFTLG5xnRvVbT9cs6HgFr31nUDcL1OWFI+YpdUi7
	kYWZK0qDi54ZNHqcLl0ahyCDU8QlqQ5NdNwjqTT1QOExpTfXDKYzWqOdUhqbEgIBjTusvTWlp5giy
	sOaexXU9jpGreHRJf8aCF8gC7e4KH0gcFKKIWkv3BWMV2FqI2klAeVPLyAA9rtMm9l4D8GUJvH8Iq
	8RRW9NxZ8efwt9Egvpgju7ZQ8xSBYW1qb0UnisMLinQVh/ebComaNNAR9C9NhQAZ9LwK4SdbDcQDY
	9q80MxNA==;
Received: from localhost ([::1]:64712 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iEnDP-009lk5-PB; Mon, 30 Sep 2019 04:23:15 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:45031 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iEnDJ-009ljx-Np
 for samba-technical@lists.samba.org; Mon, 30 Sep 2019 04:23:13 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46hTlj13CNz9sDB;
 Mon, 30 Sep 2019 14:22:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1569817377; bh=/CpFoK3mc3E2tPj/7LC53aSk9GWHrAYzth0Wdu+7J5g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FQs/ywDujNKQsWHQ50Vs/70VC1yCb0CM1wgwUkWM0hWUuY2LmUJN+Y+m7fvGEiMBp
 A74eBtFWcCcgHHhNiT3A6skC/N/geVF9SbfLuWD3eRrvMiWAeH62yypUYVRKhgmuus
 xn9mFLKOqenhBgbbNEGG6JGly5bTvVxMMJnjQWCsWcnq9/WliurAcYksVQLbNMglqI
 q34MYhEyoClj0EDk7Sggp4xKpEVrpIiJrG1DFyg0tfOMZLbn0szwYebgAGibxKYRgz
 wXLdxt6o8BTmwB77lU8IhqkkSwmX+7OyAlz+4OqOf6F2XJXJre/AQdy/NPeG9jOrUO
 J1IFRHGeC+WNA==
Date: Mon, 30 Sep 2019 14:22:56 +1000
To: Max DiOrio <Max.DiOrio@ieeeglobalspec.com>
Subject: Re: CTDB Assigned IP not on an interface
Message-ID: <20190930142256.27914465@martins.ozlabs.org>
In-Reply-To: <65195A0F-90EB-4298-AF6E-4218C14E855D@ieeeglobalspec.com>
References: <848DA573-7DDC-4B8B-BECE-A0C5B15E704F@ieeeglobalspec.com>
 <F637268B-A385-4A24-92A4-7CAB5754CCC1@ieeeglobalspec.com>
 <20190927091634.5adcce10@martins.ozlabs.org>
 <65195A0F-90EB-4298-AF6E-4218C14E855D@ieeeglobalspec.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Max,

On Thu, 26 Sep 2019 23:55:07 +0000, Max DiOrio
<Max.DiOrio@ieeeglobalspec.com> wrote:

> Thank you Martin!  I spent hours trying to get this working today.
> My google-fu was weak today.  I didn't find anything about the format
> change or the disabling of the legacy 10.interface

"legacy" here is a bit of a misnomer.  This was a change made before
4.9 that was meant to be temporary.  The scripts were supposed to be
split from there to service/ and failover/ subdirectories but we still
haven't got there.

I'm glad it sounds like you have it working...

> [...]

> =EF=BB=BFOn 9/26/19, 7:16 PM, "Martin Schwenke" <martin@meltin.net> wrote:

> >    p.s. As a user level question, this would have been more
> >         appropriate on the "samba" list, rather than
> >         samba-technical.   :-)

> Sorry about posting here.  I googled ctdb mailing list and this is
> the only one I came up with.  Again, google-fu failing me today.

No need to apologise.  samba-technical was actually what the CTDB web
site recommended.  Now updated, along with the "samba" list description
at https://lists.samba.org/  :-)

peace & happiness,
martin

