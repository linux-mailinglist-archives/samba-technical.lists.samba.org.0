Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C2B1F4361
	for <lists+samba-technical@lfdr.de>; Tue,  9 Jun 2020 19:53:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=HN/oJG/FyUCORlc8SkJqt6wFKbOgIsge0neGfTr+zR8=; b=Jm4UzMwVnqkQUw9DCcfHJSM3Gw
	zmQvG6Mj++Qpg9zJZTXbALwo2rANAuhjZBml6Izn/TMCEvYebyWUP/aNI7Kt9kRmdTcLZ1h2YljQd
	yQZpvFIueNRtq8Ha2uln8NiFVdB+l5nxVcW38INAFEL12C8/7CUiLbvq7hkQ9PD+yXySQPaXRDBiq
	Kt9MMYBWdZrHxjZxhgXbI1LYAT2Gp8sUp7ut37f6h2f5AcRikTUeWXPru3QTs2KRBXWS6wu2tt3n0
	7qB2ujF9c2OzxQymLtZTrScEx+zjb4NtTb5F/ZUBbxHClH46gV0YA+CeATPsuHEhG9L6CzT/x78IO
	QBd1uC+w==;
Received: from localhost ([::1]:51858 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jiiQU-009djL-I7; Tue, 09 Jun 2020 17:52:42 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54406) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jiiQQ-009djC-PK
 for samba-technical@lists.samba.org; Tue, 09 Jun 2020 17:52:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=HN/oJG/FyUCORlc8SkJqt6wFKbOgIsge0neGfTr+zR8=; b=x7mf7vnVFW2ABeGuqTdKSxgyNF
 YVg/zwX6TP9E8NQnQf0zDb8sbPbuAssPBmK5wADYPxGG7oZagtwxMJ07/aYCZqX9btXANo3NAnZuv
 vffg/4bvQhhEqaRcH4/9uMMTgpw2D44vEGclB1GFRcMPTUdXrEJ7YgrMbn1wYB/OIEJXw6VyFlwYY
 eIqZPugfF8mH/FVcQxPaOag4Ub+cs8bNwBCgUpXGcYvFmWJrF3yghYOfz2WlxhMTYkoiq31AigK2t
 AkZN8sYwXg5Rj+t2Ov1dbhQJZcyx6KLWWiJBMrUddx1zIhJVrp12kunfmz9s0H6zR1qSOkc4g6Azp
 UnbH11gxh7Kl75uDsfdcmFDVkG0tYqI4pmw6msx4IF4wEKlzy74EBfOZkTDgXIidgSrdkGsCzzQc8
 Se2qaqu14NkTm8v6XWnqQxeOXFO2mfXEtDeAB2mV8/TMLp167iqVpQwIlZOeP9udApFKNZCta1EjP
 0/WKxkNPLcYrQ+YQTXwaHwfx;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jiiQP-0005sy-0s; Tue, 09 Jun 2020 17:52:37 +0000
Date: Tue, 9 Jun 2020 10:52:30 -0700
To: Rowland penny <rpenny@samba.org>
Subject: Re: Avoiding further (LDAP) stack proliferation in Samba
Message-ID: <20200609175230.GA8351@jeremy-acer>
References: <20200521021959.GB12847@jeremy-acer>
 <20200521214312.GA12586@samba.org>
 <854ac3b5d75279a13ebf3c5a6e9f4fd5b9eb8943.camel@samba.org>
 <437a7ad7-5158-9124-9ba3-939a3bfcee53@samba.org>
 <b20bcf09b119aa0d0585d27b24076bdd17157caa.camel@samba.org>
 <20200608231733.GA839@samba.org>
 <6caef0c2-7b6f-4665-8ae4-6ba9c2f565da@samba.org>
 <2096111bb99eef34a4dccb059ed6eac23ac4ef87.camel@samba.org>
 <6ec67eb9-96ab-3eac-faba-b50bff8656a8@samba.org>
 <6a8d2885-9db6-9187-6321-a3fdb554871b@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6a8d2885-9db6-9187-6321-a3fdb554871b@samba.org>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jun 09, 2020 at 11:03:18AM +0100, Rowland penny via samba-technical wrote:
> On 09/06/2020 10:53, Ralph Boehme via samba-technical wrote:
> > Am 6/9/20 um 11:15 AM schrieb Andrew Bartlett via samba-technical:
> > > I'm sorry, I still hold to my disagreement.
> > > 
> > > It is really important to understand that while this will fix bugs, I
> > > don't see this as a bug fix.  This is a lift-and-shift.  These
> > > operations are both delicate and risky.  They also often fix bugs and
> > > introduce important new features.
> > > 
> > > But this change needs to be evaluated at that, fully aware of the
> > > implications, not just passed in as a bug fix.
> > > 
> > > I've been involved in implementing and in particular reviewing a large
> > > number of lift-and-shift operations in Samba.  Rarely are they as
> > > simple as they appear, and this one has the added complexity in what
> > > I've raised about the target.
> > > 
> > > Therefore this cannot be simple regarded as a 'bug fix'.  I'm very
> > > sorry.
> > > 
> > > Furthermore I've been told that this is actually the culmination of a
> > > significant amount of work over a period of months or even a year.  I'm
> > > incredibly sad that this work got to this late stage before public
> > > discussions allowed these issues became apparent.
> > > 
> > > That is awful for everyone, and for that I'm sorry.
> > I'm sorry, but to me this looks like the better is the enemy of the
> > good. Replacing libads with the existing and already used tldap library
> > is a step in the right direction.
> > 
> > -slow
> > 
> Hi, can I ask a few questions here ? What, if anything,  will change from
> the users point of view if libads is changed for the tldap library ? Will a
> user notice, will everything work as before, will the user experience be
> better or worse ?

That's a *really* good question IMHO, and should be the driver
of everything we do (just my 2cents).

I *think* (this not being directly my area) that moving internally
to tldap allows winbindd to become much more async internally,
thus allowing improved responsiveness when under heavy load,
and preventing the "winbindd is hanging" reports from users.

Now how we get there from here is the $64000 (or should that
be £50,243.20 in your case :-) question..

