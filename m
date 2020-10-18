Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1275F292067
	for <lists+samba-technical@lfdr.de>; Mon, 19 Oct 2020 00:00:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=NLvqDgbo75NIogOc6+U2XXEKFlUEkpSI3/iO0bn6ZaY=; b=geDDW0b2yIlLnO0/B3XpLCnLi7
	FaudR8L4YQzRJQmHrmjs6nItegODNWPNIbJgz6Wi49pi1LQrXis96erhHzngrIZdIGxCnJeXy14Sx
	0AqkfLBfAsZkzOodoMOYlObz5PFcYFLnkOMz4bxRf1ZllCKWRc2zATprtdt0aqXNkY7NZjLGV46hT
	yr0qPVWbsclNgnZ3GlUJCi05B1gbueMyWnGusTG5ifszQvX4BF5KGSOPGUs3khvvweVRA/6d3SYMM
	3XmX/xkvnQ4hfMqZsmh+Zp9f+HiZuDKfmEuQV4/Ck5pkzJkyYpLWupRyytY+L/dBLmBVIZpKlEtp0
	4/drMQMQ==;
Received: from ip6-localhost ([::1]:64530 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kUGj6-00CdPD-64; Sun, 18 Oct 2020 22:00:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58990) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUGiy-00CdP5-Pw
 for samba-technical@lists.samba.org; Sun, 18 Oct 2020 22:00:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=NLvqDgbo75NIogOc6+U2XXEKFlUEkpSI3/iO0bn6ZaY=; b=XA4M1XIBg/EQ0ZzX+z+9Mk5CZP
 ZEMj5oiRMQzpV5Kk2m6vcltYpFFIT/f64/R0Zc3zApuBVUbO5sQkuViTmqR5ej4CDZkX8D81NpsKc
 1gmxxTmj0fCWQeeNhM2MimxLOzwsyD6oIzwy+uZ5LPIy4ErkxBhZLOKCqA/mcElbxLvpbMFAImC+U
 6RDhu8ympt+jRjiQfYzsxthVlLQr4MGiw2qGFtVSujSksiE8NZ8a1m3KpPfu8JhjoqWwtLOSdmaQS
 B2IP1vRdyfbu6f3VXNLo9msjnm75krQWehscY0n1l5OZJaxaZwhuSssLFhsJSxpLcknhX1Nn58UN4
 rPC7LPAxBdIx8kaehzBSmzlouh95Y6YYc9jswjDgv8rZLZ27EOu2Gtb1Vp4c/IHCr2qDKuyhtrF4Z
 V51tnCaYO64oEEO4OtnhDd4ZdZnDz2jOgB6E8puuFLfMMVJ8F/Uxk29Qf8BgsiiTiBZxfL/akAG3r
 GasDCQ1Z2+t1gB5tCdE0syuY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUGip-0005Go-DJ; Sun, 18 Oct 2020 22:00:12 +0000
Message-ID: <2b13b0dee1ce4ef9b21825ee38feeca8855747dc.camel@samba.org>
Subject: Re: Clarification around the DCO
To: James Bottomley <James.Bottomley@HansenPartnership.com>, "Bradley M.
 Kuhn" <bkuhn@sfconservancy.org>, samba-technical@lists.samba.org
Date: Mon, 19 Oct 2020 11:00:07 +1300
In-Reply-To: <5e8a6736aafa2e4a593af2ee79451cc62a283818.camel@HansenPartnership.com>
References: <a4f34abf8b943b01e0f982e21fe1518009fcc556.camel@HansenPartnership.com>
 <20201017004357.GA360279@jeremy-acer> <20201017005611.GB360279@jeremy-acer>
 <20201017023840.GA344206@ebb.org>
 <5e8a6736aafa2e4a593af2ee79451cc62a283818.camel@HansenPartnership.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, 2020-10-18 at 13:38 -0700, James Bottomley via samba-technical
wrote:
> On Fri, 2020-10-16 at 19:38 -0700, Bradley M. Kuhn via samba-
> technical
> 
> wrote:
> 
> > Jeremy Allison via samba-technical wrote:
> > > Ah, I've just remembered *why* we have a difference from your
> > > "standard" DCO text.
> > Yes, a tremendous amount of time and effort went into figuring out
> > the right policy for Samba with regard to contributor
> > licensing.  Some of those details were reported publicly, and some
> > were reported privately to the key folks in Samba.  I myself put in
> > many hours of work on this, as did many other Conservancy staff,
> > lawyers and Samba volunteers.  Nothing has changed with regard to
> > the
> > analysis.  We also had a private discussion at a developers'
> > meeting
> > at a Samba XP about the reasoning, IIRC.
> 
> 
> In legal terms you usually really, really don't want to be special
> 
> because it causes all sorts of complications if there's any
> litigation.
> 
> This reasoning lies at the heart of our desire to move the DCO beyond
> 
> the kernel, because if we keep it to the kernel it becomes our legal
> 
> specialness problem in the same way.

That is all well and good, but the way this is playing out here is
really awful.

It would be one thing if somebody, perhaps you, came to our project
politely suggesting 'have you considered the benefits of'...

The process here is just rubbing everyone up the wrong way.

Samba was one of the earliest projects to take up the DCO, at a time
well before it was claimed to be the semi-proprietary special thing -
it was (and still is) just a lump of text from SubmittingPatches (now
another file, but the point remains) in the kernel, modified to our
needs.  

Is our DCO perfect?  Certainly not!

Should we put a GPLv2 or other appropriate licence on it?  Sure that
would be proper and polite, but this thread feels like being bullied
around, which evokes responses like that seen from Rowland.

But right now this whole thing is getting everybody’s back up, which
isn't helping anything.

Andrew Bartlett

-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT - Expert Open Source
Solutions
https://catalyst.net.nz/services/samba







