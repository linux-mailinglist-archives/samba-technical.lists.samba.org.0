Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7411025A8F2
	for <lists+samba-technical@lfdr.de>; Wed,  2 Sep 2020 11:51:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=SY3YUGemPZxzsTHgwpscY34fjijW/PogMT3wKxIt0Js=; b=VuTRd9sCil+8S38/TXhLM7OT+3
	gLPq202Fml9bribIDmdht70wdzHZPJAQvXytEO0bQ6W2KVnfyHx54SPJ18w5fu6KBBBnPWjCfr8FY
	Z+K0iLiy5Ce5+gvQvqLDMSPAbt4LbXp1md5nS3l76yZmqLpPVCwfQ7C7LsFzaZVn57/Q9SHOQ/m6+
	YRZePBY8RkzXBIM/dCtHIjacVQmCzIFMd66ihvZNeu1C7VLS2vyiVnJxVmmf9DqnI0/0mURV5WvP1
	qrkQvrDNkgqwnufq4gPy3cggjg1EkOpoOQ8GhvI0SFC4eEZIeSVYl8aMG/kGMeA7gx4rT3gViJ751
	+teWVbuA==;
Received: from localhost ([::1]:42450 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kDPPo-003UPc-D1; Wed, 02 Sep 2020 09:50:52 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:38681) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kDPPf-003UPU-PY
 for samba-technical@lists.samba.org; Wed, 02 Sep 2020 09:50:50 +0000
Received: from intern.sernet.de by mail.sernet.de with esmtps (Exim 4.92 #3)
 id 1kDPPe-000688-Cp; Wed, 02 Sep 2020 11:50:42 +0200
Received: by intern.sernet.de
 id 1kDPPe-00054a-8h; Wed, 02 Sep 2020 11:50:42 +0200
Received: from bjacke by pell.sernet.de with local (Exim 4.93)
 (envelope-from <bjacke@sernet.de>)
 id 1kDPPe-003MrW-39; Wed, 02 Sep 2020 11:50:42 +0200
Date: Wed, 2 Sep 2020 11:50:42 +0200
To: David Disseldorp <ddiss@samba.org>
Subject: Re: PATCH: make disabling of vfs_snapper consistent with our
 configure/build system
Message-ID: <20200902095042.GA800820@sernet.de>
Mail-Followup-To: David Disseldorp <ddiss@samba.org>,
 =?iso-8859-1?Q?Bj=F6rn?= JACKE via samba-technical
 <samba-technical@lists.samba.org>, 
 Karolin Seeger <kseeger@samba.org>,
 Andrew Bartlett <abartlet@samba.org>,
 Matt Taylor <liverbugg@rinux.org>
References: <20200710194428.GA1596727@sernet.de>
 <63044415-9473-1572-2cd5-fa1fa5e012e1@samba.org>
 <20200720170142.1583649f@samba.org>
 <15eadeabe4d9fc23e9a311a51a007fa020781ccc.camel@samba.org>
 <20200812115841.GD272474@sernet.de>
 <38124182-985f-8a79-aa9a-1cbb2241dc3f@samba.org>
 <951676ca1d57de76f0a5494140ebdc985b607731.camel@samba.org>
 <aa86e306-0c2e-763c-bb4c-3ba9fc4a9d52@samba.org>
 <20200901104311.GB760902@sernet.de>
 <20200902112132.1f7f4c79@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200902112132.1f7f4c79@samba.org>
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

On 2020-09-02 at 11:21 +0200 David Disseldorp sent off:
> > reverting the mentioned patch is the most simple and straight forward solution
> > as the newly introduced option is not required and the generic module
> > activate/deactive mechanism can be used. Any other solution with redundant new
> > options adds more complexity or and possibly conflicts.
> > 
> > RB+ from me for the revert of 7ae03a19b3ca895ba5f97a6bd4f9539d8daa6e0a
> 
> I've submitted https://gitlab.com/samba-team/samba/-/merge_requests/1547
> It fixes --with-shared-modules=!vfs_snapper while keeping explicit
> disable / enable (default) behaviour.

the topic of enabled or disabled or auto by default should actually be a split
off discussion, as this discussion cannot be finished before 4.13.

I mentioned before that I object that we introduce more enabled-by-default
options, which need to be explicitly disabled on all other non-Linux platforms.
See by mail from August 12 for more details on this.

Björn

