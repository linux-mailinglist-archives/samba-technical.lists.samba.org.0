Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC8025AA67
	for <lists+samba-technical@lfdr.de>; Wed,  2 Sep 2020 13:35:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=l/lNFDJle566fNzuiqzYWtu9k3fbcxx03b/n9tqtTPs=; b=vF0jRcH9exa6gID/kivLDTNuxa
	0pSD9gT/6svw3cqWBuUCIHRBQ/xf3KMSv2k8Ka3iWKKNdeLq58hB4ybO3yb/v1fmwIF8QjtkgQEGX
	cDzXUeFj0IC6wfH9aFZXMQERIZKDRN4RE2vqx49pjEMx58iQ8uRu2erVfvP2aBDNTHQyI8QvPx5yA
	nbgQ7DO8jjBztzH8nJbg/RNIyAGCVx/oZyIu5r8ZipeInCGhQ0iiZS0Vov8Aez3ot/tPpWsaLeiPY
	YJvCXE7e9uVh6WSBpwTfAfvjdIVz+EABjhaeVWQkFKUz54yvJImG84Cq1BEe39HiBjE8cmf1cwNXg
	H7mPtWAg==;
Received: from localhost ([::1]:48444 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kDR1x-003VKy-Cw; Wed, 02 Sep 2020 11:34:21 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:59101) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kDR1s-003VKr-Ps
 for samba-technical@lists.samba.org; Wed, 02 Sep 2020 11:34:19 +0000
Received: from intern.sernet.de by mail.sernet.de with esmtps (Exim 4.92 #3)
 id 1kDR1r-00081l-Sc; Wed, 02 Sep 2020 13:34:15 +0200
Received: by intern.sernet.de
 id 1kDR1r-0006UF-Ow; Wed, 02 Sep 2020 13:34:15 +0200
Received: from bjacke by pell.sernet.de with local (Exim 4.93)
 (envelope-from <bjacke@sernet.de>)
 id 1kDR1r-003O1n-Jp; Wed, 02 Sep 2020 13:34:15 +0200
Date: Wed, 2 Sep 2020 13:34:15 +0200
To: David Disseldorp <ddiss@samba.org>
Subject: Re: PATCH: make disabling of vfs_snapper consistent with our
 configure/build system
Message-ID: <20200902113415.GC800820@sernet.de>
Mail-Followup-To: David Disseldorp <ddiss@samba.org>,
 =?iso-8859-1?Q?Bj=F6rn?= JACKE via samba-technical
 <samba-technical@lists.samba.org>, 
 Karolin Seeger <kseeger@samba.org>,
 Andrew Bartlett <abartlet@samba.org>,
 Matt Taylor <liverbugg@rinux.org>
References: <20200720170142.1583649f@samba.org>
 <15eadeabe4d9fc23e9a311a51a007fa020781ccc.camel@samba.org>
 <20200812115841.GD272474@sernet.de>
 <38124182-985f-8a79-aa9a-1cbb2241dc3f@samba.org>
 <951676ca1d57de76f0a5494140ebdc985b607731.camel@samba.org>
 <aa86e306-0c2e-763c-bb4c-3ba9fc4a9d52@samba.org>
 <20200901104311.GB760902@sernet.de>
 <20200902112132.1f7f4c79@samba.org>
 <20200902095042.GA800820@sernet.de>
 <20200902123648.6d8aa3a9@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200902123648.6d8aa3a9@samba.org>
X-Q: Die Schriftsteller koennen nicht so schnell schreiben, wie die
 Regierungen Kriege machen; denn das Schreiben verlangt Denkarbeit. - Brecht
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
From: =?utf-8?q?Bj=C3=B6rn_JACKE_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?iso-8859-1?Q?Bj=F6rn?= JACKE <bj@SerNet.DE>
Cc: Matt Taylor <liverbugg@rinux.org>,
 =?iso-8859-1?Q?Bj=F6rn?= JACKE via samba-technical
 <samba-technical@lists.samba.org>, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi David,
On 2020-09-02 at 12:36 +0200 David Disseldorp sent off:
> > I mentioned before that I object that we introduce more enabled-by-default
> > options, which need to be explicitly disabled on all other non-Linux platforms.
> > See by mail from August 12 for more details on this.
> 
> Please see the gitlab patch discussion. The new patch disables the
> module by default on non-Linux platforms.

thanks, that looks fine to me to solve this for 4.13. I also just tested that
patch also with 4.13 on AIX.

RB+ from me :-)

Björn

