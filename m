Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 823D3182BDB
	for <lists+samba-technical@lfdr.de>; Thu, 12 Mar 2020 10:05:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=5SuoESAXIjb76PEn5WRpZtUgyJOPdqAPcSfx/4tD7X8=; b=no7Oy1nOQLQYqQIZLPL17/KKWQ
	av9qI80NFhhGvfLsIMq5fZ/MWYakSYNFMzZi9mkkL82CUKbQa3CuB6yB/90MUCZNZAUK47Of2HGvD
	D19mJboyabGrDMargCAPSLf1MeCDhGDTs2vJIvNdZrN4BIIwWgO2xeKIETlN5hnhTjjnLAvQVHVqG
	XQJniA7vsUn6YzF3AhOnImat0jww7qXrEZdZ4p9YNnKtWc6h8mz/5Ia7lM/SUwKHMpixH2mxsg1J6
	NmXjDLjGpToCw63ndkINqBBuW67vkSPZd0sWBLkckkMov+WRhrnoRT4GsuOK9bqRipbdNbYO9yRkq
	DXRFWubA==;
Received: from ip6-localhost ([::1]:38878 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jCJmB-00Fu2d-Ao; Thu, 12 Mar 2020 09:05:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11924) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jCJm6-00Fu2W-6S
 for samba-technical@lists.samba.org; Thu, 12 Mar 2020 09:05:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=5SuoESAXIjb76PEn5WRpZtUgyJOPdqAPcSfx/4tD7X8=; b=IDxK3HAw9pOasanAeM8nocreGH
 jUMnyPUlf71KGR1fyKEltikLIJl43sXWE1+TFKdYaPfW5y7Qh2NSuxatlTbfEuKHHbWNwrwu94bOS
 KR0OvAhmr88jrvoyDhPd6cBAZBjmP/4LzwHhIkCp6bASBbtkVBCrRjG+UY/GL0GMISgdSBZ4VW/rM
 4+NXWNwvGlliJ7AFgQRPCHEBsdVddLMV7ku8THkqSR99ZBJ4ghMLyZATNPXaP3wsI0B0f4xvV+K65
 n/n2zKzKktTPw6KKMJAnFzqOpSYFIUim/ooV1vBKcuB7U6jUxuOlV6Nnclg1sGZhjRgp0DGS5eaOp
 gnTU1ZQ5BdtZFd1nmNpBYc6XdeOTpFkIVAdMdxMR6jbKyAdWnMtx6wYa7ubX5jZD89B1mQ/PbR08N
 vtHnct8p7WKbEYMugAtaU9UpIdIvL3nZ5gn1tUMmw9seIa1Czji33cqkgBwJhu6qMYGW7ZBFvTZRt
 TqK/YB1yzCYdqRYJnTEKhN1K;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jCJm5-0004DU-9E; Thu, 12 Mar 2020 09:05:05 +0000
Date: Thu, 12 Mar 2020 11:05:03 +0200
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Retire Fedora 29 / OpenSUSE 15.0 from CI?
Message-ID: <20200312090503.GO2735275@onega.vda.li>
References: <7999f917f76d922dfd725d185903fdf47e1a7e9b.camel@samba.org>
 <E8F6741C-BEC9-43A6-B683-E21BD9F61372@suse.de>
 <38643263.Z8vMgeSRLk@magrathea>
 <20200312065506.GN2735275@onega.vda.li>
 <939198702b7086a3194077b8ef1b6b244a99fcf6.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <939198702b7086a3194077b8ef1b6b244a99fcf6.camel@samba.org>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: Andreas Schneider <asn@samba.org>, William Brown <wbrown@suse.de>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On to, 12 maalis 2020, Andrew Bartlett wrote:
> On Thu, 2020-03-12 at 08:55 +0200, Alexander Bokovoy wrote:
> > On to, 12 maalis 2020, Andreas Schneider wrote:
> > > 
> > > Yes, we can drop them.
> > > 
> > > I think we can also just run the latest Fedora version (two versions when a 
> > > new release comes out for a few days). We have CentOS which provide old enough 
> > > distros to show we still run on that stuff.
> > > 
> > > 
> > > Alexander, what do you think?
> > 
> > F31 and F32 would be perfect. They differ enough (different gcc,
> > different Python versions) to catch bugs.
> 
> That makes a lot of sense.  I've got what I proposed up in a MR, but it
> would be awesome to build on that and move to F31 and F32, because by
> the time master is released, Fedora 30 will also be EOL, so no point
> wasting CPU it keep it building.
> 
> Can you have a go at it?

F32 beta is out next week, hopefully, then we'll do it. There are
typically bunch of updates right before the release.

I'll plan something for next week.

-- 
/ Alexander Bokovoy

