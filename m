Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5D828F98E
	for <lists+samba-technical@lfdr.de>; Thu, 15 Oct 2020 21:34:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Eta94b2s7ObW2qxlwsCHHiRXTmIgG+FyK4bYq9NGsLo=; b=5pvi2aFwoyqRCt5d9NXkW72Typ
	u9LTA8jMJ1wzruf5gvBPm7nsW+VDQbn3CQYb9FeVWL8XZOo8XPcbgRcycZI8MlVtBAARG0qQn3Ynq
	YCnei+O+xc6oOkZPbegUrIMz4Yjx/BA5LhWCz3FMwJ47F5id5ZBSr+QN4j/Hc7DbwolDtP8xt7dv8
	nhjeYLL1C0nPz6BmOm7M790bU8RQxaMVdtjHJ7ZTlc20ZipM/4xVEqR3ZWhSKzK1fok2VEXY/4JK4
	562AiyCdF7iOy/nHE1ny6IIdPE69cyOuFsiS1wQ9nQKnseSqo88W1SKejoU3a5OuShCoZlczUp6ZD
	V+/HTzlA==;
Received: from ip6-localhost ([::1]:63112 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kT91I-00CJi8-DT; Thu, 15 Oct 2020 19:34:36 +0000
Received: from pine.sfconservancy.org ([162.242.171.33]:33254) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT91B-00CJhz-Ke
 for samba-technical@lists.samba.org; Thu, 15 Oct 2020 19:34:32 +0000
Received: from localhost (unknown [216.161.86.19])
 (Authenticated sender: bkuhn)
 by pine.sfconservancy.org (Postfix) with ESMTPSA id 32BEBE9C1;
 Thu, 15 Oct 2020 19:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=sfconservancy.org;
 s=pine; t=1602790465;
 bh=HZC+6hbQnnw+QUxdqwbJK8YkyMeBZPn8aDfmWxoDs5M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UycJOL49ZAYOEKEwBQtorF5y5/WiLmmi3eux2q96GfAbB2aa85J/JK3HwsAWff2lB
 TBXxFCGJ8gHlBntCtfgZsXCnrkNCqZRdqF2YLXe6qsaiXGqOXH0aqnPAs/mYOrryYY
 OzD5RvBYwafpPes5PckqekK7/bcGH+aR6A3cVvNPUFW1Tk4lx4o45EIk6usrgCb1j0
 Lin04gVrqE/oIFY+/sC/5d+kevHviPimQytcKyQUugHnKFAhOdT2uBWwY7K/7VHrTd
 fGBX0VRSgurtrg2JtSAD4GxLtfDm61IJ3CtYwfUhOZL0/hDehn3KUmn+AGqUwzLwH6
 aOVkGW3u6AG5Q==
Date: Thu, 15 Oct 2020 12:30:48 -0700
To: Rowland penny <rpenny@samba.org>
Subject: Re: [PATCH] Documentation: Rename Samba's DCO to Samba Contributor
 Representation
Message-ID: <20201015193048.GA61199@ebb.org>
References: <87mu0nidll.fsf@ebb.org> <20201015180510.GE3769001@jeremy-acer>
 <2231b5de-fa06-db61-feb0-08ad0374673e@samba.org>
 <f70291dc95eb0eae98e23c2897cbcfa9376e90e9.camel@samba.org>
 <f488fa4d-4b8f-3323-ec1b-d3cf54819fac@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f488fa4d-4b8f-3323-ec1b-d3cf54819fac@samba.org>
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
From: "Bradley M. Kuhn via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "Bradley M. Kuhn" <bkuhn@sfconservancy.org>
Cc: samba-technical@lists.samba.org, Simo Sorce <idra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Rowland penny via samba-technical wrote:
> > https://web.archive.org/web/20060524185355/http://www.osdlab.org/newsroom/press_releases/2004/2004_05_24_dco.htm
>
> I will accept your non working link

I *think* you have to hit archive.org links for non-HTTPS archives with their
version of non-HTTPS as well.  This link *does* work but takes a bit to load
(presumably while archive.org figures out why you're hitting an http://
link):
  http://web.archive.org/web/20070306195036/http://osdlab.org/newsroom/press_releases/2004/2004_05_24_dco.html

That clearly states the the copyrights in question are all licensed CC-BY-SA.
As discussed elsewhere in this thread, some changes are needed for proper
compliance with that copyright license, and why I just separated these
changes out into a different merge request:

https://gitlab.com/bkuhn/samba/-/commit/8f0c8ee5fd6a91dc113e876dd98e29c1b3549c00
https://gitlab.com/samba-team/samba/-/merge_requests/1610

That fully fixes the problem of copyright license compliance with regard to
the text; the name change is a different issue of course that still seems to
need more discussion.

> and raise you a working one: [OTHER_LINK]

The other link that you provided really is moot; Samba did *not* base its DCO
off of the contents of that other link.  Indeed, Samba's DCO was already published
before that new link even existed.  (i.e., The copyrighted text of the DCO was
changed from a Free license to a proprietary one after Samba's DCO was published,
but that wouldn't matter any way, as CC-BY-SA, like all copyleft licenses, is
irrevocable.  IANAL and TINLA.)
--
Bradley M. Kuhn - he/him
Policy Fellow & Hacker-in-Residence at Software Freedom Conservancy
========================================================================
Become a Conservancy Supporter today: https://sfconservancy.org/supporter

