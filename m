Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8BBA863B
	for <lists+samba-technical@lfdr.de>; Wed,  4 Sep 2019 17:55:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=XeJyi7bLpyZFNd33BPltjsMcJwuRjUiCIOfHrjEqMv8=; b=3bI1jcNLNP/0/nxU0wnAt3w20O
	jElBqkSrPaQItn9JEgVjxlrJL5foyp/1TRg/Niace0uSI2X68ivnOXjzJGiZfOaxEnswzMMFz5mLt
	/qujpU2Hr0U64GBGDlgi4ffQqA89d4HFwCzq7jPcNdYAA4n1Ajf6NJbNJjlioSvUL6r5SqGHhufJ1
	kufzewjjtgBpcI7GdYUTOmDKS6jm+1h5GtksWQEhPvVrAIgoykAnGICFMv84eETpGNKOjQC65SwZ3
	c7geX0sDocPfh5QcYCB3cMU0olr6fWFGalClDZUKT5AZR28AHPFrJCuSukG5l8UyqB4Tte8H+cwgc
	MLL+nZ/Q==;
Received: from localhost ([::1]:38964 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i5Xcb-003SDR-Sy; Wed, 04 Sep 2019 15:55:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12128) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5XcX-003SDK-RL
 for samba-technical@lists.samba.org; Wed, 04 Sep 2019 15:55:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=XeJyi7bLpyZFNd33BPltjsMcJwuRjUiCIOfHrjEqMv8=; b=QdofmGVPAWN/rzdAFbTpoNfiC7
 Tcqam3dXymmPSl6UMMLhvA/nEYmkpBO4rEmD8BzlAhjyHMRsipdXqRqJ01lIYVM720PCodWcjUoTC
 f7I/zqJUXVTdwcDa/ZCmS7a1WT14aG6edDMx2rPeu0fXRTcymFXnoJtb/DmTb5otJir4=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5XcV-0008Fr-BI; Wed, 04 Sep 2019 15:54:55 +0000
Date: Wed, 4 Sep 2019 08:54:50 -0700
To: Stefan Metzmacher <metze@samba.org>
Subject: Re: PROPOSAL: deprecate plaintext password support (in SMB1) for 4.11?
Message-ID: <20190904155450.GA162682@jra4>
References: <ad9719c06273cac4686726b293ce9e78fecd8ca4.camel@samba.org>
 <e5796781-277a-5e10-cd55-0322f42783d7@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5796781-277a-5e10-cd55-0322f42783d7@samba.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Sep 04, 2019 at 12:58:25PM +0200, Stefan Metzmacher via samba-technical wrote:
> Hi Andrew,
> 
> > It is quite late for Samba 4.11 but I wondered what folks would think
> > of marking 'encrypt passwords' as deprecated so we can consider to
> > remove this code in Samba 4.12 (eg master) later this year?
> > 
> > This would dovetail with the SMB1 deprecation effort and I hope also
> > help find users who can't live without this (because SMB2 doesn't have
> > this at all).  
> > 
> > I'm unclear if this even works, given bugs like:
> > https://bugzilla.samba.org/show_bug.cgi?id=9705
> > 
> > If this is supported I'll polish up the attached patch and then write a
> > WHATSNEW for 4.11.
> 
> I don't see an attached patch, but I like the idea of deprecating
> plaintext passwords,

+1 on removing the plaintext password code.

> maybe we should also deprecate lanman auth
> and ntlmv1, we may not go on and remove them before SMB1, but
> people should avoid them.
> 
> > It doesn't commit us to doing anything in master / 4.12 (and we might
> > want to wait till closer to the end of the year for feedback), but I
> > took a stab at seeing what it might allow us to remove and this was the
> > diffstat (and there is probably more if we tried):
> 
> For now just mark them as deprecated and defer the removal decision.

+1 on deprecate lanman auth and ntlmv1, but we can't
remove I think until SMB1 is removed.

Just my 2cents.

