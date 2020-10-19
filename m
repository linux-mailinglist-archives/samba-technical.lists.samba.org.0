Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CD8292AB9
	for <lists+samba-technical@lfdr.de>; Mon, 19 Oct 2020 17:45:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=dz5cVkUZICeDNmILJA4MYIWwxCzQVERNUclCbp5AhaY=; b=NUcbj+sGn591CVfp7EGdKOz6+Z
	9VKcLyX+G/weZ1f+1W2FUbQhWbzqfntogTjHOgvIfwCAuMbW+fTZILfNc62tYD0QcAzNElj+/lijd
	FiQRjyAmARkO9m5wsFHIoD7x30Xh8PcYnctiQk860VWbksyucXddjo3BQuJuF+lHctUpqr5L3Eu2U
	dJ7dC4N6oVEE4TkWpnUCaxKsaE/p7cwcyBxiqTeLGEDzvzu96u4PAZBNapOxvDDWlxP95qyGBIHcp
	uRNk4wZAMLGp2i1fPXMBBphCphuuHcvL5Rn8msNj2ERziDYlR7P0U5yBCiHg43RMeBcEHlphj+WVe
	1J7FhI9A==;
Received: from ip6-localhost ([::1]:56652 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kUXLl-00CkNy-La; Mon, 19 Oct 2020 15:45:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41362) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUXLf-00CkNr-17
 for samba-technical@lists.samba.org; Mon, 19 Oct 2020 15:45:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=dz5cVkUZICeDNmILJA4MYIWwxCzQVERNUclCbp5AhaY=; b=zi/7CGTise5d+bcVW+HejXleEB
 /vMar0Xpv2Oi9ZtnXWBiLdOYiakR4WGxYu1YFiZk0+GqawwiTe7IhuGT7Urt5s4fyDjlsEJxkryQa
 m1w2aMoewF/my58tSFPmzXccCNQ4hJrteznuqknztRCGcxP7hnyrXpqqmET5dHi5+OEj2BTsZUdY6
 M9Dq9PkIQpKPcyJRh3qhkcjeDzgDQH/9pDrMSXcak5fxmq9VBk0ZZO7cQtCjxt9vP2zIeg1Gsrqiv
 kwLD44ZL1sNLj6M2Vsd1+3h/oDdDo6Ng32+3BU5w+IU1Z2w7E7Mj/bkX7Vcl0S9piGQrV8I699ncW
 qtyp8dralD2LXTTQcpoWIScAZWO0ae4I9PnISLsSe+5c0bxaAXS2AMt9TwW29QmGm+6q05RSVfli7
 +qCpV3vQnh3iwkPS5PT4YaUk8Hs3rZjHb+g1bFzeB9s1WktVei9n1mIJBqAqBQ7IYk7xZBl7E4J3B
 /Qa+xCsk/ICf0aqb3jg9jSpM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUXLd-0005NQ-8Y; Mon, 19 Oct 2020 15:45:21 +0000
Date: Mon, 19 Oct 2020 08:45:18 -0700
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Clarification around the DCO
Message-ID: <20201019154518.GB504635@jeremy-acer>
References: <a4f34abf8b943b01e0f982e21fe1518009fcc556.camel@HansenPartnership.com>
 <20201017004357.GA360279@jeremy-acer>
 <20201017005611.GB360279@jeremy-acer>
 <20201017023840.GA344206@ebb.org>
 <5e8a6736aafa2e4a593af2ee79451cc62a283818.camel@HansenPartnership.com>
 <2b13b0dee1ce4ef9b21825ee38feeca8855747dc.camel@samba.org>
 <daeb61f4f70d3e1a2c7f9b111e3ba3c2e247371a.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <daeb61f4f70d3e1a2c7f9b111e3ba3c2e247371a.camel@HansenPartnership.com>
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
Cc: "Bradley M. Kuhn" <bkuhn@sfconservancy.org>,
 samba-technical@lists.samba.org, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, Oct 18, 2020 at 04:19:56PM -0700, James Bottomley via samba-technical wrote:
> On Mon, 2020-10-19 at 11:00 +1300, Andrew Bartlett via samba-technical
> > That is all well and good, but the way this is playing out here is
> > really awful.
> > 
> > It would be one thing if somebody, perhaps you, came to our project
> > politely suggesting 'have you considered the benefits of'...
> > 
> > The process here is just rubbing everyone up the wrong way.
> 
> I understand, so let me try to explain why this all blew up.  The
> origin is a row on another list which is populated by a load of
> lawyers, a lot of whom are also Corporate Counsels.  This other list is
> governed by Chatham House Rules
> 
> https://www.chathamhouse.org/about-us/chatham-house-rule
> 
> Which forbids quoting what was said and who said it.  However, I'll try
> to describe what happened without violating this rule.
> 
> For background, a large number of corporations, through their counsels
> (who are mostly on this other list), have requested changes to the DCO
> over the years (a lot of which were trying to prevent patent capture). 
> All of which requests we've rejected on the grounds of not wanting to
> cause DCO fragmentation.  On this other lists, there was a discussion
> of the DCO which lead to the implication that we'd authorized Samba's
> change while refusing all of theirs'. We were forced to deny this
> implication robustly in case the other list members got the wrong idea.
> 
> Our robust denial got back to the SFC who engaged us privately on this
> topic.   What we actually said to the SFC was we'd obviously done
> nothing about the Samba issue in the past and had no plans do do
> anything now; however, if the SFC could help us engage in discussions
> with Samba, it could potentially lead to a a win-win outcome we could
> report back to the other list.  The SFC told us that actually they
> preferred to let the matter drop.  Thus it was rather a surprise to us
> to find Bradley's patch on the Samba list, but we figured that now the
> situation had been broached we may as well try engaging.  All the rest
> you've seen on the samba-technical list.
> 
> If there's no desire here to investigate DCO alignment at this time, we
> can let this aspect simply drop and you can resolve Bradley's patch in
> the way you see fit.

Thanks for the full explaination James. I was aware of some
of this, but not the full context of:

"the implication that we'd authorized Samba's
change while refusing all of theirs".

Everything now makes much more sense :-). I think we now
have a working plan !

