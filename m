Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE7A3D9CEF
	for <lists+samba-technical@lfdr.de>; Thu, 29 Jul 2021 06:56:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=N6ljk0ccFtBUZV/P2Cc7VzoXZxNPlgenhBE15ayh0EU=; b=Wl6MiHi4JrUZ87GhjdbPGJ9HWw
	W3KJlMCvPLsZnAJgIbMtgW3sfMagOWXVJXNIED4huSf8SPAKZyIvROYThaDs2gUznZdef4d/+1P4C
	R3Ob6PpHUTOtMgIU36+uSV8kstz+Ze9wALUMqT1+jG8WMj953Sue85N3b49gkCwqrixXm44PVSkIf
	ji4JwL4xsI3FyofcOyj5bw/YD6z30hpDIxHRyRKKkN6ZsLxt9ilS+3DsFiOYIPEOsy+tt3ts/59AE
	0sjWhOdS3dJMChR93JHeAFepb8a6yGSX8nz85NTdSBw7UPzQSpjriNCznfJQPna63ni8LAqj8adKi
	WNopHieQ==;
Received: from ip6-localhost ([::1]:21100 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m8y4x-001Q1X-7q; Thu, 29 Jul 2021 04:55:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63682) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m8y4p-001Q1O-Ne
 for samba-technical@lists.samba.org; Thu, 29 Jul 2021 04:55:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=N6ljk0ccFtBUZV/P2Cc7VzoXZxNPlgenhBE15ayh0EU=; b=tAZOmwg5zzQdoli85Boh9MNdZG
 h6VN8BfbVqsWuRaoEVQ7dVsjEoa/Nqe0/igahBd5FBWVYBlSv3K9lVEcjdOCKs8ZSMpphOVyJe88k
 AE1GNUMVfPfmmg+EhDdWUQA9Qqx+1kaIut6AAR8WHgS0HmpJiXL1V3hWNpn+XcW50NKcmoeM6kCuQ
 oICwfsJLMBhssKdUPnJFJP2OuyQTnVKo03COGR5NzJ5bGbT3cGqMG8fgOXwbs2iBwEpU/Pu5mY4CZ
 T1G+phXC3HUtVjpA4kpb3d1MwL3xaKIkpWI94P0K72qITp1WsGeCuuJA7oBlIKfy+iSJTy7LD9ALu
 M5vzvOhuOjLCOnBcCbMveCKGNQS61gGzOonUDprYviXEo0XxPb04qwFYP0UXJZwpKZ4u45MpcEXYp
 83LJ0uKHMXc62ost1XCO8Qj4Fj12Eewlj/FdpTckBowZChksbXA3pbsTiRL6Ogv/3nzo9QIIk6kNw
 OC7ha9Eivn44uJHfnz1+BQjO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m8y4h-0002hU-Db; Thu, 29 Jul 2021 04:55:16 +0000
Message-ID: <65519d99cd00ac11172919bb8ac99280e7fdc04c.camel@samba.org>
Subject: Re: PAC Ticket signature in Heimdal
To: Isaac Boukris <iboukris@samba.org>, metze@samba.org
Date: Thu, 29 Jul 2021 16:55:10 +1200
In-Reply-To: <3114701225467154473e2ad34c5ffa4b943cfc86.camel@samba.org>
References: <3114701225467154473e2ad34c5ffa4b943cfc86.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, 2021-07-11 at 16:20 +0300, Isaac Boukris via samba-technical
wrote:
> Hi Metze,
> 
> > > We most likely also need to change some apis in order to generate
> PAC Ticket checksums
> > > (Wireshark support is being added by Isaac and me, see
> https://gitlab.com/wireshark/wireshark/-/merge_requests/3570)
> > > and also for compound identity PACs when offering FAST.
> > > "wip: rework PAC and AD-SIGNTICKET for S4U2Proxy support"
> > > https://github.com/heimdal/heimdal/pull/767
> > > might also be related here.
> > 
> > I took a look at PR 767 (which is related to bug 14642), I managed
> > to
> > get a poc working, that is the kdc is now able to issue a minimal
> > PAC
> > with all signatures even without hdb support, this would allow the
> > removal of KRB5SignedPath while keeping S4U2Proxy and its upstream
> > test working (we don't need delegation-info for that, and we can
> > live
> > on the NDR boundary), I've updated the PR.
> 
> Looking at '_kdc_pac_verify' (aka 'samba_wdc_reget_pac'), which is
> called after the kdc checked the server signature, I think it
> currently
> does three things, first it checks if the krbtgt is in db to know
> whether we can check the kdc signature, if so it then (second)
> fetches
> the right key by the checksum-type to check the signature, and then
> (third) it update PAC buffers  such as logon-info and delegation-info
> (at which point the server signature can no longer be verified..).

Thanks for asking about this.  I look with a bit of horror on some of
my code there, a little of it makes no sense.  If we have been given a
HDB entry in 'krbtgt' for example, we know it is in the DB and we did
just use that to decrypt the ticket, I hope!

> I wonder if we can implement one and two in the KDC and change
> '_kdc_pac_verify' to something like '_kdc_update_pac', see the PR
> changes how I'm trying to implement it.

I think so.  At the time of initial development verifying the PAC was
out of scope for Heimdal, now it very much looks like we are doing
double-work.  The main extra thing gained seems to be that we verify
the krbtgt signature, not the server one (which matters if you are
checking an evidence ticket against a 'bronze bit' attack).

> For one, that is checking if a kdc from our realm issued the ticket,
> I
> compare the header realm with the requested server realm, and given
> samba should virtually always canonicalize the realm, I think this
> check is good enough (this is similar to what we did in MIT with
> KRB5_KDB_FLAG_CROSS_REALM), and I think this test helps my case:
> https://gitlab.com/samba-team/devel/samba/-/commits/iboukris_test_cross_realm_logic
> 
> Implementing two is simple enough, we fetch the right krbtgt key by
> the
> checksum type, like samba does (note that this doesn't solve the kvno
> problem..).

The main thing is to allow Samba to get to the krbtgt DB entry in the
update_pac to allow it to know it needs to do a PAC rebuild when
upgrading from an RODC.   I don't think it should be doing crypto on
the PAC, leave that to Heimdal now.

The check would be with the key read from the KVNO (the RODC one) and
the re-sign would be with the current krbtgt key.  This is the
difference between krbtgt_check_key and krbtgt_sign_key.  I think you
get this right.

> Do you think this can work? Any further thoughts on this matter?

I've looked over the branch a few times and I think it is OK, but we
should work on a combined patch for Samba and Heimdal and think how the
two should best interact.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions






