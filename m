Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B26628F9AA
	for <lists+samba-technical@lfdr.de>; Thu, 15 Oct 2020 21:45:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Gjk+VUYbVO2QR/3SA04fBGzW0tao0GeXQCYsuWY/5qo=; b=mbrP2h67vKTgOsbPqAhOUSg9sy
	TYFwQkHSL+LhISiuzFVEwFnBBwo+kTY4pgOK5yJX0BMZ0lSbbH7ZKlQz6ITXjl47hZXIS/qjum5Pi
	SqEqrLhAG4HunWcZ0b10pmR4QCVX+QddyrcYAXvJtK+WFYbOHUIXprRgoilTYX2L5Hq839RlLs+zJ
	5yBgSQmE95To9dsE/UcQmB9llM997s7QZAOMayxREuUgGSB2Hp8RsOOWEAjNnMVdw2zkiRPiwJ1Bo
	Y7xjodkpTT7QqjcDr77eu25vmJYKxKkaHf+epVXHyeAutbrQcY8w7GkW+MYU2Q8Babmp7cMbyrBhs
	r9Gqj2fw==;
Received: from ip6-localhost ([::1]:64584 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kT9Bp-00CJv2-FE; Thu, 15 Oct 2020 19:45:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54928) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT9Bk-00CJuv-8y
 for samba-technical@lists.samba.org; Thu, 15 Oct 2020 19:45:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=Gjk+VUYbVO2QR/3SA04fBGzW0tao0GeXQCYsuWY/5qo=; b=klsWx7HCm8ZH4PUSYfnOrjPxVj
 rutI+pSNgGCmUgI0C7eVLJ8/GjQ/rVsNptS/zVkkmlNXzZsGAskCkUA+kwv8cPmFanfUEyEUTWxuu
 67kRylqDIJ2/Ezo/N6K28iB9Oy7+Q53hhOurRh/DOMX/YX8+tiSeq8aN8bLEa2s7b2OR52Yb7O7Qr
 QYlhBz+js5XfRZ2zhSiHKZH9kwBKx3q1WGkG/3FaoISSNBYUNSF6VwCbWk0rGA3HeIzU1JS2WdPp7
 gAx4zBIsD81poSsvwVk9R8/DRlGc09pj6tpkUw5iFCW4S7GaQRSkODSH8Chm8+YMbaonwLQ65tlX9
 PzMrgeSnEv85bMYpxf7vekv4SlSKs0FpK0CEYNmv3DhJe2vnH8Z16fBTV37QGe5Qp/H3+uzZPIGtf
 xxhTLuzrWYf1xJj7Ko/QcD7glf4rrer8X8/FKlqmsYFwaU6fwUgkeF0im0JoyNMVY8qTMVv2b6STo
 5SLp+aNw6ONRlTAEkaakhLty;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT9Bj-0003qq-PF
 for samba-technical@lists.samba.org; Thu, 15 Oct 2020 19:45:24 +0000
Message-ID: <d6681d5c508524dd97b093f332e8cea818cf1a3c.camel@samba.org>
Subject: Re: [PATCH] Documentation: Rename Samba's DCO to Samba Contributor
 Representation
To: samba-technical@lists.samba.org
Date: Thu, 15 Oct 2020 15:45:22 -0400
In-Reply-To: <20201015193751.GJ3840862@jeremy-acer>
References: <87mu0nidll.fsf@ebb.org> <20201015180510.GE3769001@jeremy-acer>
 <2231b5de-fa06-db61-feb0-08ad0374673e@samba.org>
 <f70291dc95eb0eae98e23c2897cbcfa9376e90e9.camel@samba.org>
 <20201015192330.GI3840862@jeremy-acer>
 <09b466404b11983f992ac2f89c369b33d3a1a135.camel@samba.org>
 <20201015193751.GJ3840862@jeremy-acer>
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

On Thu, 2020-10-15 at 12:37 -0700, Jeremy Allison via samba-technical
wrote:
> On Thu, Oct 15, 2020 at 03:33:22PM -0400, Simo Sorce via samba-
> technical wrote:
> > On Thu, 2020-10-15 at 12:23 -0700, Jeremy Allison via samba-
> > technical
> > > Well it's not just Samba that uses DCO. Look here:
> > > 
> > > https://probot.github.io/apps/dco/
> > > https://www.dita-ot.org/dco
> > > http://www.gearvrf.org/about/certificate/
> > > https://www.docker.com/blog/docker-code-contributions-require-developer-certificate-of-origin/
> > > 
> > > for just a few of the other projects that use "DCO"
> > > to do exactly what we do.
> > > 
> > > Right now it looks like the term "DCO" has become
> > > synonymous with what we're doing here.
> > > 
> > > Even Linux kernel developers use it in this way:
> > > 
> > > https://blog.hansenpartnership.com/a-modest-proposal-on-the-dco/
> > > 
> > > "When one of our developers posts a patch to a project under
> > > an OSI approved licence with a DCO Signed-off-by: from our
> > > corporate email domain, we authorise that developer to be our
> > > agent in the minimum set of patent and copyright grants that
> > > are required to satisfy the terms of the OSI approved licence
> > > for the contribution."
> > > 
> > > Note that the above text doesn't say "to the Linux kernel
> > > project" here - only "to a project".
> > 
> > Yes I am aware, and I do not think we have any strong obligation to
> > change the Samba DCO name, but if we do not want to change the name
> > I
> > think we should have a new document drafted from scratch so that we
> > do
> > not violate the license of the original DCO text, unless you argue
> > that
> > "Samba DCO" is not a "similar name" enough.
> 
> Changing to a new document is like a license change - what
> happens to all the existing signers of the old document ?

The old document is not a license, nor would be the new document.
It is a statement about their standing wrt the code they submit.
Their statement does not change just because we reword or rename what
we call it for future submission.

> Keeping the name and modifying the underlying text IMHO
> is the worst of both worlds.

Ok, I do not understand why that would be, but I accept your position.

> Personally I think we should just add the CC-By-SA
> attribution and be done with it.

I'll let you argue with our counsel on that :-)

Simo.



