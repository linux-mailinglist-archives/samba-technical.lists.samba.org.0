Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B61E56D50F
	for <lists+samba-technical@lfdr.de>; Mon, 11 Jul 2022 09:00:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=ZfNBbD3rszKts1jsCT48f8ZYp9n/bYNBcX2m5MjdWpg=; b=q2LPAPi0ik8fEXQ8mK8DYwOVbk
	ry7wlr1xO86nmfOGmyK1QVaaNl29RyG82UbLhDVB3VXvV0N9CLM9jViYEI96hPAgSU+zA5F5kJ6Vw
	0fGSlsTS2wD/wJvWtd1nUY4+0A69wfoLM3L1vaoZIWHq4ANSfG9vy9jWUoUYZnm5oPSKy3xc/qhXX
	taDUeMkjJ8GmqybOuZyzsenqkv05oDy8wHJbFuiIQgsvwmWop8MzhvD4FMxNNU7kloFuChiqjSugb
	34B6E2hKuEvkTJEdiDe/osgMdPUuhvnM/iDxcl07ungSE1+92mA48DckMDjf3xnHmcjXFmC3mm4/1
	sfpvK9ug==;
Received: from ip6-localhost ([::1]:59108 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oAnOo-00GwYV-UN; Mon, 11 Jul 2022 07:00:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44342) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oAnOZ-00GwX6-UH
 for samba-technical@lists.samba.org; Mon, 11 Jul 2022 06:59:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=ZfNBbD3rszKts1jsCT48f8ZYp9n/bYNBcX2m5MjdWpg=; b=rjCAFV2+3gUJEk5c9brXV7BIJZ
 5wYxRVdPng3C2D32DX16Cw+EABptxVB9sQPfjTuGQA/Bwm7l5gDz+l87aBrTYuSokug9ame/rvPiw
 1RcU43QLrdr9oLAVOv14/dQzP6vGf9pwdoeSIP/MrJw68CCTLfYFrGprftwook139xUl91ZyKHqZm
 AdDgMJmI/CtXmWNK0uXg0Khj/ER/m+kclzUI977uPQbo8jya68450x+f8PiwrQNY/Hla6MqdMKBMW
 C8QhN9CTPyzc8x3ntLHq0QiLqdJXIMEt8dJq3jEW2bjg9WGCxE2xbblS65voCSkOHGvbRIhEDNAa/
 Em/AF+tJnDhKRVeVTkrcjPa2z69MkcqNAQbwqRceU1XnDgPNjko2VwiICv3nSz+Hmsvk1fN5F6mW/
 z9EiE2V4TVRfiXYhN2p4nkat0KpWar1XfcKrG62NsF1aQywIIp/fbFY4AgD/kvBf4PIg+Va7QJ1N/
 TMjuGYj76e2arma2RyEWimHv;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oAnOQ-0047o9-OK; Mon, 11 Jul 2022 06:59:42 +0000
Date: Mon, 11 Jul 2022 09:59:40 +0300
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Video of my Kawaiicon talk: The "Dollar Ticket Attack" on AD and
 Linux Kerberos clients
Message-ID: <YsvKXKQjxqLUviJ4@pinega.vda.li>
References: <04cd9526caa11ac094fe6b276113639e46177aa4.camel@samba.org>
 <ace59e5ae596201e0626cda0fd96fa264f8ddebe.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ace59e5ae596201e0626cda0fd96fa264f8ddebe.camel@samba.org>
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
Cc: samba-technical@lists.samba.org, krbdev@mit.edu
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On ma, 11 heinä 2022, Andrew Bartlett via samba-technical wrote:
> On Sat, 2022-07-09 at 18:46 +1200, Andrew Bartlett via krbdev wrote:
> > I was going to wait until a per-talk video was hosted by the organisers
> > of the conference, but in the meantime this link into the live stream
> > works.
> > 
> > I'm sharing this as I wanted to share the video as folks have been
> > interested. 
> > 
> > https://youtu.be/4hBLf2vQc8k?t=30560
> > 
> > It would be great if the linux side could become harder to exploit at
> > some point, I have some suggestions at the end of the talk, and Sumit
> > has had some suggestions around disabling an 'a2ln' plugin. 
> > 
> > It would be good if someone could write up some good guidance for users
> > on how best to defend against it on the Linux side, both with a 'simple
> > keytab on server', or 'samba publishing keytab' or other similar
> > configurations.
> > 
> > I also tell the tale of how I broke into Windows AD last November,
> > similar to but more punchy than SambaXP talk, which I think was pretty
> > cool. 
> > 
> > Anyway, enjoy and be worried!
> 
> I've started to put together a wiki page mostly with links.  It is
> probably still at the stage of being confusing even to this audience
> (and is totally missing a 'how do I protect myself' section), but
> perhaps someone can help fill that out.  
> 
> In the meantime at least it links some of the various documents, talks,
> exploit steps etc:
> https://wiki.samba.org/index.php/Security/Dollar_Ticket_Attack
> 
> I would appreciate it being extended.  (Please don't be put off by
> needing to get an account, it just a spam prevention barrier). 

Thank you, Andrew. I added suggestions we had been discussing with you
and Sumit on how to address it in pure AD environment with SSSD
configuration and MIT config snippets.

I'd like to point out that this problem does not affect FreeIPA
environment as there are no user machine quota support there and you
have to be an administrator to add resources like that. Also, Kerberos
principal alias support is enforcing uniqueness accross all principals
in FreeIPA, so taking over other's name is not possible.


-- 
/ Alexander Bokovoy

