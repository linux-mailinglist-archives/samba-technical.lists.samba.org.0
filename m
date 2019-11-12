Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D22A2F9798
	for <lists+samba-technical@lfdr.de>; Tue, 12 Nov 2019 18:50:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=ACUdikuY9uOe1VwqNezuXT3YBCZ8QoMd++Fan7YAFKA=; b=dQxAHx9+rZaH4uaL1+HUL2QpEv
	cxX6sEeD2v8Lw/FQ+adsoduPllv0QMgzSLgnuw+FgRwD5Jv+obK4TCraKf0uXTTDk66OIZuSn2evd
	gBvuy3xW4AbOr365DDUM7mPDoZTlsG+QB7awfd6RIVAHut8FbYXcRpEPajKVrHpUonnqNGtuL0Rys
	KMSl9xIWSEh2LXxciysX+40AgPoYNH25irNOe3XW7MmNSUhp48dmuLv+pVrAjShgl3JXDB6hKjcKO
	FxD1keaDABjKENIjQtPtWKPDllwCnJPEdy+vOeajRJTRmH7eJlgmZNEJrz1J8bOIublaG+xGR3xI1
	edUZTYhA==;
Received: from localhost ([::1]:24270 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iUaJI-009KmJ-If; Tue, 12 Nov 2019 17:50:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56402) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iUaJB-009Klh-Ud
 for samba-technical@lists.samba.org; Tue, 12 Nov 2019 17:50:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=ACUdikuY9uOe1VwqNezuXT3YBCZ8QoMd++Fan7YAFKA=; b=pMKdil6rLo70tzx5xSBaQLCHAh
 xiaYEQD9akeMi4hEptzv6WymSoo/PpqRnX1BH2LSN6zOLaK1VLNgP2MGMN6+qur37meYfQOVEALSr
 0mJP4qcdvlGOtbVQp73nBy14pdiQoC/8lcc7aodtRmihU9cOl37sdeehbVylPZcYP7L9f9C5ZC8jL
 I3lG4QLVRdT0llzjx+Qp63y/2XgmsBMaILnn1IIUYyD3nfEGIRxzFR+iYMg1eNjLg6c1ahVefIAmv
 ZlV7csMMgvzDP+nCO+DvEbWIaA6uvtq6oBQJ01mzIIrI6qBgAIigPIHQoyTJ2si6Phdq2FKjFLFPC
 MwUS7kFl3zkx9sh7pgqp+k8IRQ3QGJwsCvI4srgTue4A1505wjUmcV2no0ZOUYaxoedqy7KtO26DZ
 /UhrfUn7UspEHZBXZSzlBlbz2TcFInx6lfJa7niDfxwOh+V4+/AmEHzFKNSnN1QJiStiMTs12mUOY
 oGSXBI8pgKPNR/DMHyDwaiLj;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iUaJA-0008HH-Rn; Tue, 12 Nov 2019 17:50:29 +0000
Date: Tue, 12 Nov 2019 10:50:24 -0700
To: Andreas Schneider <asn@samba.org>
Subject: Re: bootstrap: Fix centos7 image creation
Message-ID: <20191112175023.GA3048@samba.org>
References: <20191106133603.2F5431404C0@sn.samba.org>
 <343cb710c4bb9936e0d6c75f82c81ab0f3d35bf9.camel@samba.org>
 <20191106234619.GA21747@samba.org> <24991601.T20UtDr9EF@magrathea>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24991601.T20UtDr9EF@magrathea>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
From: Christof Schmitt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christof Schmitt <cs@samba.org>
Cc: samba-technical@lists.samba.org, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Nov 07, 2019 at 09:55:43AM +0100, Andreas Schneider wrote:
> On Thursday, 7 November 2019 00:46:19 CET Christof Schmitt wrote:
> > On Thu, Nov 07, 2019 at 06:34:38AM +1300, Andrew Bartlett wrote:
> > > On Wed, 2019-11-06 at 14:36 +0100, Andreas Schneider wrote:
> > > > The branch, master has been updated
> > > > 
> > > >        via  35bb734d638 bootstrap: Fix centos7 image creation
> > > >        via  6a3b19fb170 bootstrap: Add Fedora 31
> > > >        via  1ba0a32e707 bootstrap: Remove Fedora 28 which is already EOL
> > > >       
> > > >       from  bf99f820778 ctdb-tests: Make process exists test more
> > > >       resilient
> > > > 
> > > > https://git.samba.org/?p=samba.git;a=shortlog;h=master
> > > > 
> > > > 
> > > > - Log -----------------------------------------------------------------
> > > > commit 35bb734d638e273f2fd1a19220db5f200d3e7489
> > > > Author: Andreas Schneider <asn@samba.org>
> > > > Date:   Wed Nov 6 08:43:05 2019 +0100
> > > > 
> > > >     bootstrap: Fix centos7 image creation
> > > >     
> > > >     Signed-off-by: Andreas Schneider <asn@samba.org>
> > > >     Reviewed-by: Alexander Bokovoy <ab@samba.org>
> > > >     
> > > >     Autobuild-User(master): Andreas Schneider <asn@cryptomilk.org>
> > > >     Autobuild-Date(master): Wed Nov  6 13:35:17 UTC 2019 on sn-devel-184
> > > 
> > > G'Day Andreas,
> > > 
> > > I actually think we should remove nettle entirely, it is incorrectly
> > > listed as a dependency.  It came about due to some work we did for the
> > > encrypted passwords support (which metze then changed to use our
> > > internal AES, now removed in favour of pure GnuTLS).
> > > 
> > > I picked this this when Christof proposed the same patch here:
> > > https://gitlab.com/samba-team/samba/merge_requests/875#note_239077036
> > > 
> > > He was able to successfully drop the nettle dep.
> > > 
> > > Sadly he had trouble with the ktest environment I also asked him to add
> > > so it hasn't merged yet.
> > 
> > Yes, i can confirm that nettle-dev can be removed, as it will be pulled
> > in as a gnutls dependency. I just got distracted by customer work and
> > still need to debug the ktest issue.
> 
> I'm fine with removing it, I've just wanted to fix CentOS7 quickly.

FYI,

i updated the nettle patch in
https://gitlab.com/samba-team/samba/merge_requests/875#note_242391478 to
remove nettle-dev.

Christof

