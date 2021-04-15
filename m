Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CCD36032C
	for <lists+samba-technical@lfdr.de>; Thu, 15 Apr 2021 09:21:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=YKvSfVNcP4bE3IITEZU8BI3BF3nyNVNqCzuvQYtboSE=; b=xkkUPu2FZlHOWm54Eb3y5S5huP
	Lx0i7hyA4xhRuFnbX7EyrRtTvkGTXYGT8wSQ4PFuMajvp7uLAWA40wsE9JfOEGXuRE27r2TjFYhb0
	mdrvKRlh81SUBWNkUc2T3mdNDu2HocNasERorBclnAlQq1k7ST9VwVwPgZnyedIddicM7eH9yPoW8
	hCGy5qSf7OaZf0PCQcBWY+MC6koeR0rH4lYzH+rU4k5VELFRmSfCKqJtNdMJU/6H8ovXbwH6GOvz1
	VL2kJwgsM8mWv4qlFmJvwdcoejiJUAPp+FzEB5ohgLC0slqM+x31dViG5cuCZfmqh2Zkp+LvwiarX
	XPc1aWnA==;
Received: from ip6-localhost ([::1]:22258 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lWwI8-00BPvg-Oi; Thu, 15 Apr 2021 07:19:56 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:39527) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lWwHw-00BPvX-1m
 for samba-technical@lists.samba.org; Thu, 15 Apr 2021 07:19:50 +0000
Received: from intern.sernet.de by mail.sernet.de
 with esmtps (Exim Mail Transfer Agent)
 id 1lWwHu-0003MK-I5; Thu, 15 Apr 2021 09:19:42 +0200
Received: by intern.sernet.de
 id 1lWwHu-0000Wr-FD; Thu, 15 Apr 2021 09:19:42 +0200
Received: from bjacke by pell.sernet.de with local (Exim 4.93)
 (envelope-from <bjacke@sernet.de>)
 id 1lWwHu-001hvw-9x; Thu, 15 Apr 2021 09:19:42 +0200
Date: Thu, 15 Apr 2021 09:19:42 +0200
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Drop LM password support?
Message-ID: <20210415071942.GA406861@sernet.de>
Mail-Followup-To: Andrew Bartlett <abartlet@samba.org>,
 samba-technical@lists.samba.org
References: <167d230b2584e0fbcd7bfdf8e6e4314154ef4ec4.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <167d230b2584e0fbcd7bfdf8e6e4314154ef4ec4.camel@samba.org>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Andrew,
On 2021-03-25 at 13:51 +1300 Andrew Bartlett via samba-technical sent off:
> Thinking of things to drop from Samba, I would like to drop LM password
> support, at least from the AD DC.
> 
> We have already deprecated the option, and LanMan authentication on the
> AD DC just makes no sense at all, but I've seen configurations with it
> enabled (where folks turn everything on hoping things might start
> working).
> 
> For the file server it is a bit less clear-cut, but I wonder if it is
> better for DOS/Win9X clients (without the NTLMv2 upgrade) to do IP
> based authentication and guest access rather than this.

I'm fine with dropping it in AD DC but for the file server we should not drop
it. This is still required for many enterprise users with legacy industry
machines. For the fileserver we should let LM passwords die when we also
decide to let smb1 finally die.

Björn

