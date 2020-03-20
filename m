Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE3618DC1C
	for <lists+samba-technical@lfdr.de>; Sat, 21 Mar 2020 00:36:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=/x3GyqXi6FnYUziGx2qdQtLPt5cshv2iVO1wpjZLxXw=; b=VXE1zn3Ea1pWwUDVz7rsTmg4di
	AfQynGEYS90p8r+AjE2nGbV63jeTUzPFzxE0BH1TTcH4+vuA4M5/W7CY9bVKPB5e9oat43duXwduy
	7mKXna6uiyjlsgXZLkgLdZ1qu3aVDFiqPe/SlEXJUeLhXxoQn3WRTBLTTnvS98zuMiw0/DctLTwn/
	iOARGdDLCILrNxyUt+sPn91IOkRBKHu0Bz1hfw3mH0mVr8mP+esuhrdxT5XyhZStc2gI6UdgdNa6t
	cL3rsPwrkM4+n+1LFUsGI27SeZmva8bwOZeMqxlvj9ImEnYOB3wOSIT4XBBPz4r/ywnv9Hlyh09hd
	2yBDPL+A==;
Received: from localhost ([::1]:19564 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jFRAL-000LJR-Km; Fri, 20 Mar 2020 23:35:01 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:40651 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jFRAF-000LJK-Rc
 for samba-technical@lists.samba.org; Fri, 20 Mar 2020 23:34:58 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48kg9F4lSsz9sPk;
 Sat, 21 Mar 2020 10:34:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1584747282; bh=K5+VqRNzuPESsR1qIoJH1hsObpU2fPhg9T4bI7EzZj0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Nq4DabRsSqZSRzAEz2ofVjoVSik0LbqfBwrySCwjmpF1Zni/WkNa71zfVzYQciQtF
 3UA15V38dserIVOru04osr0SW5Dn0EZwdAkKCzfnBcLV0Yrw3CtMDgmE8A6+OV2/05
 zpSDCYhtfktWJc1Y5Wg+HrPc0tzez7vkesrM4XgEcGcRIWlGrkiw2xt26l4eemcI7d
 m/RNQKe3Q2jvsy3Xuq7ULSwFNysFxGv0LYWwA4tcfYG3fmy8CcBrctGUm1CIDRD4rF
 Ro/xuL6TvdLhqAA86PgoJVimvY6/RWALTY1QUP98SDwZbTgo0G3/0p98rcC01OUO7m
 qDlDmI4Ydu7NQ==
Date: Sat, 21 Mar 2020 10:34:40 +1100
To: Karolin Seeger <kseeger@samba.org>
Subject: Re: [Release Planning 4.10] Last 4.10 bugfix release
Message-ID: <20200321103440.0ff4e538@martins.ozlabs.org>
In-Reply-To: <627df2fe-dfcb-68a6-9c1e-3bd1affc62be@samba.org>
References: <b416c744-ddb7-bbb9-807f-cae6b310513a@samba.org>
 <20200320205512.651c6196@martins.ozlabs.org>
 <627df2fe-dfcb-68a6-9c1e-3bd1affc62be@samba.org>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 20 Mar 2020 11:26:17 +0100, Karolin Seeger <kseeger@samba.org>
wrote:

> Am 20.03.20 um 10:55 schrieb Martin Schwenke:
> > Hi Karolin,
> > 
> > On Fri, 20 Mar 2020 09:07:54 +0100, Karolin Seeger via samba-technical
> > <samba-technical@lists.samba.org> wrote:
> >   
> >> for your convenience, there will be a last 4.10.14 bugfix release on
> >> Thursday, March 26 2020.
> >>
> >> https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.10
> >> has been updated accordingly.
> >>
> >> If there are any important fixes that should go in, please let me know asap.  
> > 
> > I think that this is a very good candidate:
> > 
> >   https://bugzilla.samba.org/show_bug.cgi?id=14295
> > 
> > Strangely, the v4-11 patch won't apply with "git am".  However, if I
> > cherry-pick the very same commits from v4-11, it works fine.  That is,
> > the following works:
> > 
> > $ git cherry-pick 46e19f9f402..783335f207d
> > 
> > Want me to attach a patch for v4-10?  
> 
> yes, please. :-)

Done!

Thanks...

peace & happiness,
martin

