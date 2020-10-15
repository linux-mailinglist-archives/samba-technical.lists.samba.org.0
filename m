Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4461C28F951
	for <lists+samba-technical@lfdr.de>; Thu, 15 Oct 2020 21:14:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=IB1rALBz1DCtgc1/6dcPAlRqpM3fIaWDnUNQ4DCX+RY=; b=0s+TUtl9Ex5BE1Y2sR83SNN+S4
	OYKhjG6fENCsk/GBNmuk6c9FTzkXAdwE7xHyd7iAmfvpvq+VAqYYhP1vAOUmSZBX0ZyQLSJT/8mm+
	Fee2dC8SbMndGVVWJdzOoQg6JlFAnRHn+9FtiD2bAi29YlE/g1nRdZyMIyS6e5dRFyD4nUdyC4rNz
	bWGYVmijGRvFolW6YEqwGnIYZuhm+ibG9xurnANh9s1hpbmzjxbVyh9LF5UHnEcdg/n4MbQCDHnpO
	hDVxB+kz5NshV9LNc/hjoTp+oZ0NX3jXcPiR62ZJ0NH+VZ3BojFA1YnO8DtOWnRa4WRP5vf6M9Uln
	K2U+KVzg==;
Received: from ip6-localhost ([::1]:60188 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kT8hk-00CJGY-Og; Thu, 15 Oct 2020 19:14:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45328) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT8hf-00CJGB-My
 for samba-technical@lists.samba.org; Thu, 15 Oct 2020 19:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=IB1rALBz1DCtgc1/6dcPAlRqpM3fIaWDnUNQ4DCX+RY=; b=D7zt6pjidixpZuh3/GhbOySrVR
 wIQExsZOP6klwgaM+FAqUltRzQyGWN8htVOKmu4F8lrQ2ZNDLfWRXbw0mUsoM+EVaTNBkEpAsJmIY
 HgUP4C1CPFXMo9k4zs0/pZau8AKy04VEOzo5+riFKQ3TmsU2C/7xomHpi0bHgG59yRRUR7YAMJyIh
 wFnMoIvChQNgSrc9j/CqslcyFa/4Z4FyTflKfgYixBLSTz8tZ2CdoUZ3k+R+vdBlQts+RfkcL94cT
 C8gYdvmFbF7S/XFFgFYWwL3M3XeyD630eOMIuCp7YHmiRhoiyl1W7TELfDPFua/RigbwHLYkVdEXF
 9QQLnsohs9S8P4qAoemh9YbbOuBJ9cngeJELKRF7hsqml6b8BqEGZY+OHEtLSWHUdHfumD69XX9CJ
 po6qcyPCUzNHszKGucJpPGjWrJ1XVUTxA2XTm/T3i120pK7DeZq11dbeZVQfmxyzd3TIFmycZ6+je
 IkD8WJdsQYik7PHayvg9+xjq;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT8hc-00039E-EN
 for samba-technical@lists.samba.org; Thu, 15 Oct 2020 19:14:16 +0000
Message-ID: <f70291dc95eb0eae98e23c2897cbcfa9376e90e9.camel@samba.org>
Subject: Re: [PATCH] Documentation: Rename Samba's DCO to Samba Contributor
 Representation
To: samba-technical@lists.samba.org
Date: Thu, 15 Oct 2020 15:14:13 -0400
In-Reply-To: <2231b5de-fa06-db61-feb0-08ad0374673e@samba.org>
References: <87mu0nidll.fsf@ebb.org> <20201015180510.GE3769001@jeremy-acer>
 <2231b5de-fa06-db61-feb0-08ad0374673e@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
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
From: Simo Sorce via samba-technical <samba-technical@lists.samba.org>
Reply-To: Simo Sorce <idra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

[Resending as originally sent from wrong address and bounced]

On Thu, 2020-10-15 at 19:14 +0100, Rowland penny via samba-technical
wrote:
> On 15/10/2020 19:05, Jeremy Allison via samba-technical wrote:
> > On Thu, Oct 15, 2020 at 10:49:26AM -0700, Bradley M. Kuhn via
> > samba-technical wrote:
> > > Samba Developers,
> > > 
> > > As you know, it's rare that Conservancy offers specific patches
> > > upstream to
> > > our projects, but I've submitted a merge request here:
> > >          
> > > https://gitlab.com/samba-team/samba/-/merge_requests/1609
> > > and I've also attached the patch here.
> > > 
> > > As many of you may know, Jeremy Allison originally requested that
> > > the
> > > Samba's Contributor Representation be named DCO as a tribute to
> > > Linux and
> > > its DCO.
> > > 
> > > But, for a variety of reasons, I (with this patch) recommend to
> > > change the
> > > name.  Also included is some cleanup work regarding the copyright
> > > and
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
> > >  From 2f011583294626e9919db7d8ddc7961a2f177f4a Mon Sep 17
> > > 00:00:00 2001
> > > From: "Bradley M. Kuhn" <bkuhn@sfconservancy.org>
> > > Date: Thu, 15 Oct 2020 07:52:21 -0700
> > > Subject: [PATCH] Rename Samba's DCO to Samba Contributor
> > > Representation
> > > 
> > > In an effort to reduce perceived confusion about the quite
> > > necessary
> > > differences between the Samba DCO and the Linux DCO, and as a
> > > favor
> > > to the Linux community, rename the Samba DCO to the Samba
> > > Contributor
> > > Representation.
> > > 
> > > Additionally, note that the text is copyrighted and add notice
> > > for
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
> > > @@ -48,7 +48,7 @@ your employer, simply email a copy of the
> > > following text
> > >   from your corporate email address to contributing@samba.org
> > >   
> > >   ------------------------------------------------------------
> > > -Samba Developer's Certificate of Origin. Version 1.0
> > > +Samba Contributor Representation, Version 1.0
> > >   
> > >   By making a contribution to this project, I certify that:
> > >   
> > > @@ -95,7 +95,7 @@ above, add a line that states:
> > >   Signed-off-by: Random J Developer <random@developer.example.org
> > >   
> > >   using your real name and the email address you sent the
> > > original email
> > > -you used to send the Samba Developer's Certificate of Origin to
> > > us
> > > +you used to send the Samba Contributor Representation to us
> > >   (sorry, no pseudonyms or anonymous contributions.)
> > >   
> > >   That's it ! Such code can then quite happily contain changes
> > > that have
> > > @@ -113,3 +113,12 @@ Have fun and happy Samba hacking !
> > >   
> > >   The Samba Team.
> > >   
> > > +
> > > +The "Samba Contributor Representation, Version 1.0" is:
> > > +  (C) 2013 Software Freedom Conservancy, Inc.
> > > +  (C) 2005 Open Source Development Labs, Inc.
> > > +
> > > +licensed under Creative Commons Attribution-ShareAlike 4.0
> > > License as found
> > > +at https://creativecommons.org/licenses/by-sa/4.0/legalcode and
> > > based on
> > > +"Developer's Certificate of Origin 1.1" as found at
> > > +
> > > http://web.archive.org/web/20070306195036/http://osdlab.org/newsroom/press_releases/2004/2004_05_24_dco.html
> > > -- 
> > > 2.26.1
> > > 
> > > -- 
> > > Bradley M. Kuhn - he/him
> > > Policy Fellow & Hacker-in-Residence at Software Freedom
> > > Conservancy
> > > =================================================================
> > > =======
> > > Become a Conservancy Supporter today: 
> > > https://sfconservancy.org/supporter
> Hang on, what is wrong with calling it a 'DCO' ?

The original license for DCO 1.0 did not permit it, this[1] is the only
reference I can still find.

      If you modify you must use a name or title distinguishable from
      "Developer's Certificate of Origin" or "DCO" or any confusingly
      similar name. 


The current DCO (1.1), in contrast, does not permit modifications at
all.

> With 'DCO' (Developer's Certificate of Origin), even I (a total
> thicko) can understand what it means,

Maybe you really do, but to me it never meant anything until explained
anyway. The first time I saw the name I wondered why they want to know
where *I* am from.

>  I have no idea what 'Contributor Representation' means.

That's why you read the text and figure it out, it is just a name and
is as good as the original in terms of clarity IMO.

HTH,
Simo.

[1] 
https://web.archive.org/web/20060524185355/http://www.osdlab.org/newsroom/press_releases/2004/2004_05_24_dco.htm


