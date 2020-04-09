Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB061A38E2
	for <lists+samba-technical@lfdr.de>; Thu,  9 Apr 2020 19:29:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=SkgkdedU9o4nCMVwJFVOwvurdQlaw3CYN1eObS5TPHU=; b=KsFwZ463pb1fl/rxS2N7lcK1O/
	1d8cMVSc9C15Y6y8riBr/+naAviWETB8ksPJOYMBoIu+mbGw5OW2YOtTa9f5Ht3cYLg4TdCtQ3gsM
	ahWabid3kGrVeYLk2zo0L6lq2FKBChJVDx9p930I2Do6nJ9U0tvxsjMlo5jKX5WO+CIM+8qzRHWeV
	O8aLkKhQP1zRoGowzy64m+fYxoLFuEJ9aULN+N1mhZHwXo12HeK682IyXPWNWim6wBiZJvuPBt4sz
	8tkKp8Jywlx9CugqmlLBqW2aw7RRA3R3VOVpxoWB1Vp7RwVtSI4HyuUsBooYC4NwNXAs0vD0EDCwz
	umPDWT0w==;
Received: from localhost ([::1]:63748 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jMaz2-000Keq-MY; Thu, 09 Apr 2020 17:28:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39292) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jMayy-000Kej-60
 for samba-technical@lists.samba.org; Thu, 09 Apr 2020 17:28:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=SkgkdedU9o4nCMVwJFVOwvurdQlaw3CYN1eObS5TPHU=; b=MWOXtV5iEJ3DKZHOkxVFgf1YdY
 1ffB0e4Mcjz9DW1uP588A+ArzIIueeKpQixDB0o8N/MDUVN6rASUucunHciQ6uCeJy7LbCZCoAkgh
 hawWco2FilrxWOIX0GSGG50YWYOEaLPWCeCS21qsRQcXhdzTNXkE9Va38XXT4XMAmQvkqTZUweSWT
 Aq6yOIFi5MXYz48Ls0GJx3JAAV5sSKxVd3/NB879Nwecr8h3HOHSUmXNnAvtLaakfryySv3YFr6jq
 RXIwSPD8uYFqv69jas38nI091zixr5y0mCe5cwMyWAzey33EBLaQo/W4rUtuQ1Clu5JN6hhl3566q
 kPJKIZtmKcsMT/ywfSXP5AH8GAg3GzDrdMo5tuCp+i7uw6HIf8ugk4PaZG3cDyoNi3/mSDo7hn5wz
 nTF+HOFWL4OzVZRbIfIE3ujKElBzvW75k4tQUwQrmovN8f507eRIxEeLSleRpqnz67EK+87smCXGu
 DowdOUSxEX0DuCO8MpKCXafV;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jMayv-0003LF-R3; Thu, 09 Apr 2020 17:28:50 +0000
Date: Thu, 9 Apr 2020 10:28:45 -0700
To: swen@linux.ibm.com
Subject: Re: tldap search paged
Message-ID: <20200409172845.GA7638@samba.org>
References: <9ee1108dab93f774bb1be3eef0dceb711d2f1221.camel@linux.ibm.com>
 <20200408160707.GA8347@jeremy-acer>
 <697ec73e9ff11f54648f4e2519c3316031b53027.camel@linux.ibm.com>
 <20200408171948.GA13874@jeremy-acer>
 <45c482f7a6047743ba129bbbc585066d01899aaf.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45c482f7a6047743ba129bbbc585066d01899aaf.camel@linux.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
From: Christof Schmitt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christof Schmitt <cs@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>, metze@samba.org,
 Volker Lendecke <vl@samba.org>, Simo <simo@samba.org>, uri@samba.org,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Apr 09, 2020 at 06:05:06PM +0200, swen via samba-technical wrote:
> On Wed, 2020-04-08 at 10:19 -0700, Jeremy Allison wrote:
> > On Wed, Apr 08, 2020 at 07:07:57PM +0200, swen wrote:
> > > On Wed, 2020-04-08 at 09:07 -0700, Jeremy Allison wrote:
> > > > You haven't explained *why* you need this code.
> > > Hmm sorry, I thought I did say that I'm in the process of creating
> > > a
> > > winbindd_ldap which is supposed to replace winbindd_ads.
> > 
> > Can you start with explaining your overall design
> > for this, rather than diving into low-level coding.
> > 
> The base goal is to lay the foundation for a series
> of winbind improvements.
> The replacement of the ADS-API in winbindd by the tldap library
> is just
> the first step.
> 
> Further goals in this area are:
> 
> - Improve the failover times for disappeared DC
> 
> - optimize the kerberos ticket handling in such a way that 
>   existing
> tickets are used instead of triggering a new auth request
> 
> - centralize the DC connection management to support a reliable and 
>  
> fast detection of connection loss and reconnection process
> 
> - integrate and condense the required code and functionality to
>   a minimum number of layers and remove APIs and layers not required.
> 
> As a first step we decided to align the ldap libraries and
> move the
> functionality, included in winbindd_ads.c,
> to use the tldap library.
> 
> Since we didn't want to reinvent the wheel we started using the 
> functio
> nality offered by the tldap-/tldap_util-library which does offer
> already a few of the required features.
> 
> As a starting point of this first step, we replace each externally 
> trig
> gered function (callbacks) from the winbindd_ads.c 
> by pure-ldap
> versions.
> Not only that this is the least invasive approach but it eases the 
> test
> ing as the results and timings are easy to compare.
> 
> I hope this explains things and motivates you all to support the small
> modifications suggested by my patch-set.

Since the proposed merge request is only one piece, it probably does not
make much sense to just merge this individually. Gitlab has the
convention of tagging "work in progress" as WIP. What about the idea of
marking the merge request as "WIP", and you continue working on the MR.
If more patches are ready for review, you can update the WIP merge
request, ask for feedback and then adjust. Once individual patches look
good, they can be tagged with "Reviewed-by". When the rework is complete
and we see the proposed API changes, the API usage and ideally test
coverage, we can do a final review and merge. Does that sound like a
possible way forward?

Christof

