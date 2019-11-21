Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 117C1105D09
	for <lists+samba-technical@lfdr.de>; Fri, 22 Nov 2019 00:07:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=nP5rv5Kv6eqcgVK0vMpCEZWLIB7Mi/9qmDP+Nl73cJc=; b=UIM/iHEvXw83dTTySDekh39HxJ
	hSd4NGpAPudcT9ZzYkLXqABPcOJ3lWWATwHdJR0PkpbSBk/IPYj3dvMArvhIOb0PDuvCZtDVztZtM
	ok0cGtIUkaTQJar2W9dXJMFF17m3tdHoVxsnYaveSr4BKcK2jNWykgyiU9FEYDqLJ/271s/h4shCo
	ptODpI3ageXcl5UMeYrTWRNM8tE/HN9m6mBQPAtCJJTf2DMGgV5pBFGdYIQkN7NAMMVtA+RguJPdo
	c1WvbaOTpaielxZVQd2qDcwGjH/8PChSLV6pvg8QBDBBtJffpKR6x17rs/3Bdf+4H6ToVq0Gdmley
	y1FNJTHA==;
Received: from localhost ([::1]:45116 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iXvXW-001yvy-UR; Thu, 21 Nov 2019 23:07:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17898) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iXvXS-001yvr-PM
 for samba-technical@lists.samba.org; Thu, 21 Nov 2019 23:07:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=nP5rv5Kv6eqcgVK0vMpCEZWLIB7Mi/9qmDP+Nl73cJc=; b=knYqt4Y86HuPkp5LxE3HuS4Rb5
 /stkxAHscn9whEtGsyQl22c0N6osELh3vusvI3lq7RqAQw2UxHtUTUWV2jFdQK1mul59YnwnCGoQ4
 Iu0bI+hMaPp/aFx0i87dk2RNYzQDMX0cGFuxcDuEYnN0d1KhV8UaAz1MA/p4gVH3JJTyMKxWKI0uC
 MDuOaQiZcoBPkNjoYlS/NYfyRprLdBsMsMJMIITIJMTRvX+liRDFaFotYKv/9venHvx4GRmN7K2DO
 jQ9jy0T+68a/GBgSjveDaMkX2rKZ/HwEbmCIL5DRs5cqSFOiwdO0s39lyHEsad7OzPJA9DFygv1kr
 V6HQDdy8jqTjgSQm0MXE9o4QSZXy+SLMgXK9g3QbXvgYZrCU0yxJ6uPmEaRUaSNFnrt2izaPoeNp1
 bTDmSwrXZn690+HeW4Wq5zi/bVkO8348wbvjIXZse5VQ/uHqSAJLIXx8csf8NXJ/AewfSeAo0PASD
 t2nQFU6qvyEWTfsi9jJ28xMC;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iXvXP-0007Hc-Nu; Thu, 21 Nov 2019 23:07:00 +0000
Message-ID: <c982637749a9629cf45b2481242d809532cfe8c1.camel@samba.org>
Subject: Re: building source3 subsystems and libs
To: moore chestnut <moore.43132@gmail.com>
Date: Fri, 22 Nov 2019 12:06:56 +1300
In-Reply-To: <CAGYhc9nN1cf3KD52mJG0ROmNYXDGXuA7c-KML33W+Qec0jOkrw@mail.gmail.com>
References: <CAGYhc9=AZmkOjHAGx7rWd=iM6h5BaVohym+oWMWqfNEfNtju3Q@mail.gmail.com>
 <20d3f005503d82862b0ba8856010ae7a8831d577.camel@samba.org>
 <CAGYhc9nN1cf3KD52mJG0ROmNYXDGXuA7c-KML33W+Qec0jOkrw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Is there a reason why you first want to untangle our build system?

I would suggest first just creating a new binary, which links against
whatever it needs to (and we have great helper libraries for the things
you need for the below).

rpcclient has a samlogon command that does what you need, I would just
cut that down.

But why not just use winbind via ntlm_auth or libwbclient?  That has
everything setup and ready to go, manages the connection and
everything. 

Perhaps it would help to explain your use case first.

Thanks!

Andrew Bartlett 

On Thu, 2019-11-21 at 22:52 +0000, moore chestnut wrote:
> Hello Andrew,
> 
> thank you for reply.
> 
> so would it be bad a idea to try hack a build together based on the
> source files of msrpc3 and the deps?
> 
> essentially I would like to hack a client together to do dcerpc bind,
> epm mapper request, followed by bind and schannel setup (
> NetrServerReqChallenge and NetRServerReqAuthenticate3) followed by
> bind and NetrLogonSamLogonWithFlags. 
> 
> Any suggestions on best approach?
> 
> 
> 
> 
> 
> 
> 
> On Thu, 21 Nov 2019 at 18:18, Andrew Bartlett <abartlet@samba.org>
> wrote:
> > On Thu, 2019-11-21 at 18:09 +0000, moore chestnut via samba-
> > technical
> > wrote:
> > >   hello,
> > > 
> > > is there any way to individually build subsystems and libraries?
> > > 
> > > for example:
> > > 
> > > the msrpc3 library in  source3/wscript_build
> > > bld.SAMBA3_LIBRARY('msrpc3',
> > > 
> > > or
> > > bld.SAMBA3_SUBSYSTEM('samba3util',
> > > 
> > > when I try waf or waf msrpc3 in the source3 dir, it does not
> > work.
> > > 
> > > currently trying on a 4.11.0 source tree.
> > > 
> > > I have read through the https://wiki.samba.org/index.php/Waf
> > > and tried the samples with no success.
> > > 
> > > Does this work for source3 libs/subsystems?
> > 
> > No, you can't really build bits of Samba in general.  Some binary
> > targets can be specified with the --targets option, and a few of
> > these
> > work correctly, nothing beyond that has been tested.  So where it
> > works
> > it works, but nobody is really working to have this be a general
> > feature.
> > 
> > Andrew Bartlett
> > 
-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba






