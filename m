Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 553A428F8B9
	for <lists+samba-technical@lfdr.de>; Thu, 15 Oct 2020 20:37:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=pc2IuFcJCmzWAtfzNenVf4lNn8HzPI8scvEe7Q6XBNQ=; b=b9BOtp1tDTU6Fmx/4II9z6cgPl
	LWMXDwl2/0+2y1Xq2tWZW69Re8ZggzyNrqXrq1oyiiPWZMAWCSKcIykNLQrYn5bo+uHtC68TBPJ34
	6slwq8wTLv2PlWXamX9RC/MMthK2FfPSF8QcnI45NMUY5VwvfvIhr2qUHl0dv4AJ9Lpjbzw8J5AhA
	1ZjUHgeUjOmMPOQbDvIIfMAs7b6kB43R1GRNeY6f7W1nzX3MXF++KegDzlizYXQXY3vU7HBX0j5pa
	88N1xvDEJjUNtb5LcB8IrFYHD9V/Qx/P5y3kVBE4/RXwl8lklXfkkji4cgM/fGyxYx0CC8iGuvma4
	tRFaa1bQ==;
Received: from ip6-localhost ([::1]:56556 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kT87G-00CIii-Qr; Thu, 15 Oct 2020 18:36:42 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33674) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT87A-00CIib-Mr
 for samba-technical@lists.samba.org; Thu, 15 Oct 2020 18:36:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=pc2IuFcJCmzWAtfzNenVf4lNn8HzPI8scvEe7Q6XBNQ=; b=YIvUsIh4Pg26Yf9z54tGi8BQzZ
 xLOKCg383GsKGJPjPylIARdk2yhCLHu0luoEZx2N3VgPOy0ujweFHXQivG052aw1+b7UdlmWwxUum
 QtcibCw/tnEktM0cNoqAlDe+x3oCplBqsM9W2sap6j5NXUbEBIc8c3tfam+vBMrPqMFHDmJ0+x2CR
 +EEWbCV8CqqITY5yfASTCkIJUXqzpialFg6TzgJovGD2mzILZR4zQ8RAOmuvyxQu9DblKM1h80XDW
 plGQ9Zq02LWzbrB606LqjH1wJbK3PtKlAGYgPdt1MEySXVJ2GURN9M/xrZd3cKBtPQsXQTB8DcXdj
 e/03TPLL/+4sA3J1x3XnswN2zdT8vKtWO9fQYaWNFFCPhlG9po3fMnpR+iPbCHxyOoAyYMv4FIWQ9
 ci4gSs+QJ6Fb0mFtK/vj1rRzVPj51q1El+GNtBDfpjvkhdmiw8pBYBEAr1WRBAGSu07kG0pXTEFmA
 Qf0dtPi1GAP1rL/iTYhShq4O;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT879-0002fs-9K; Thu, 15 Oct 2020 18:36:35 +0000
Date: Thu, 15 Oct 2020 11:36:32 -0700
To: Rowland penny <rpenny@samba.org>
Subject: Re: [PATCH] Documentation: Rename Samba's DCO to Samba Contributor
 Representation
Message-ID: <20201015183632.GB3840862@jeremy-acer>
References: <87mu0nidll.fsf@ebb.org> <20201015180510.GE3769001@jeremy-acer>
 <2231b5de-fa06-db61-feb0-08ad0374673e@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2231b5de-fa06-db61-feb0-08ad0374673e@samba.org>
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
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Oct 15, 2020 at 07:14:07PM +0100, Rowland penny wrote:
> On 15/10/2020 19:05, Jeremy Allison via samba-technical wrote:
> > On Thu, Oct 15, 2020 at 10:49:26AM -0700, Bradley M. Kuhn via samba-technical wrote:
> > > Samba Developers,
> > > 
> > > As you know, it's rare that Conservancy offers specific patches upstream to
> > > our projects, but I've submitted a merge request here:
> > >          https://gitlab.com/samba-team/samba/-/merge_requests/1609
> > > and I've also attached the patch here.
> > > 
> > > As many of you may know, Jeremy Allison originally requested that the
> > > Samba's Contributor Representation be named DCO as a tribute to Linux and
> > > its DCO.
> > > 
> > > But, for a variety of reasons, I (with this patch) recommend to change the
> > > name.  Also included is some cleanup work regarding the copyright and
> > > license on the DCO text itself.
> > Sorry Bradley,
> > 
> > I guess I screwed up in calling our Samba contributor
> > agreement a "DCO" as that's what Linux uses, but ours
> > is different from theirs.
> > 
> > In my defense I just thought that's what such things
> > were supposed to be called.
> > 
> > Plus I didn't notice the original text was copyrighted
> > and under a CC-By-SA license, so we should certainly
> > fix that.
> > 
> > Sorry :-(.
> > 
> > RB+ from me.
> > 
> > Jeremy.
> > 
> > >  From 2f011583294626e9919db7d8ddc7961a2f177f4a Mon Sep 17 00:00:00 2001
> > > From: "Bradley M. Kuhn" <bkuhn@sfconservancy.org>
> > > Date: Thu, 15 Oct 2020 07:52:21 -0700
> > > Subject: [PATCH] Rename Samba's DCO to Samba Contributor Representation
> > > 
> > > In an effort to reduce perceived confusion about the quite necessary
> > > differences between the Samba DCO and the Linux DCO, and as a favor
> > > to the Linux community, rename the Samba DCO to the Samba Contributor
> > > Representation.
> > > 
> > > Additionally, note that the text is copyrighted and add notice for
> > > compliance with the text's license, CC-By-SA.
> > > 
> > > Signed-off-by: Bradley M. Kuhn <bkuhn@sfconservancy.org>
> > > ---
> > >   README.contributing | 13 +++++++++++--
> > >   1 file changed, 11 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/README.contributing b/README.contributing
> > > index 2a44e37f9e8..c4a0c7f4bc9 100644
> > > --- a/README.contributing
> > > +++ b/README.contributing
> > > @@ -48,7 +48,7 @@ your employer, simply email a copy of the following text
> > >   from your corporate email address to contributing@samba.org
> > >   ------------------------------------------------------------
> > > -Samba Developer's Certificate of Origin. Version 1.0
> > > +Samba Contributor Representation, Version 1.0
> > >   By making a contribution to this project, I certify that:
> > > @@ -95,7 +95,7 @@ above, add a line that states:
> > >   Signed-off-by: Random J Developer <random@developer.example.org>
> > >   using your real name and the email address you sent the original email
> > > -you used to send the Samba Developer's Certificate of Origin to us
> > > +you used to send the Samba Contributor Representation to us
> > >   (sorry, no pseudonyms or anonymous contributions.)
> > >   That's it ! Such code can then quite happily contain changes that have
> > > @@ -113,3 +113,12 @@ Have fun and happy Samba hacking !
> > >   The Samba Team.
> > > +
> > > +The "Samba Contributor Representation, Version 1.0" is:
> > > +  (C) 2013 Software Freedom Conservancy, Inc.
> > > +  (C) 2005 Open Source Development Labs, Inc.
> > > +
> > > +licensed under Creative Commons Attribution-ShareAlike 4.0 License as found
> > > +at https://creativecommons.org/licenses/by-sa/4.0/legalcode and based on
> > > +"Developer's Certificate of Origin 1.1" as found at
> > > +http://web.archive.org/web/20070306195036/http://osdlab.org/newsroom/press_releases/2004/2004_05_24_dco.html
> > > -- 
> > > 2.26.1
> > > 
> > > -- 
> > > Bradley M. Kuhn - he/him
> > > Policy Fellow & Hacker-in-Residence at Software Freedom Conservancy
> > > ========================================================================
> > > Become a Conservancy Supporter today: https://sfconservancy.org/supporter
> > 
> Hang on, what is wrong with calling it a 'DCO' ?
> 
> With 'DCO' (Developer's Certificate of Origin), even I (a total thicko) can
> understand what it means, I have no idea what 'Contributor Representation'
> means.

Well it's representing that you have the right to contribute,
so it seemed OK to me.

I wouldn't get too hung up about what we call it. The
issue is the Linux lot want to keep their name separate,
so we should really respect their wishes.

Let's discuss on the list if we want to change it,
and if so what we'd call it.

Rowland, do you have any good ideas on a new name ?

Bradley, do you have any alternative names you considered ?

Jeremy.

