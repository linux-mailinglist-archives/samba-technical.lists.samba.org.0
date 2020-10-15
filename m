Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6E528F98D
	for <lists+samba-technical@lfdr.de>; Thu, 15 Oct 2020 21:33:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Fid/jyoMJ1tDj3r7Yh2E9Qe8IXOaFDEYGAln728DUbo=; b=Bt8nLmHNReuCgT60md6LDwYM22
	44upueyeuGvh77VBu78DKjz0Uvjm9C8ntcj4qenoDczMkqlQBfhItAIuCvC2RkqmtgsKDVLrG+GIP
	qgqqJ6yVUn6YLWOHdbbxRzZ+svi7xgEz1nh3cf6BujjYOz4fMWjlpGFEw0wTkPY/hrS+HZztXlKOV
	VHs0xrpMnwpWdQQ61l5DfpJGBWweSzEsor2FjmM9Ln+QG9u51ltFgIznz7mdaphRJPiu8H/4z9dOg
	CL8UdWB/LJm9hKUJgHfnwMJ38MTjZPiesecus6EG+dgyDjeGQOlh0M4fS7abopawdlTZgD+p2dwio
	mnACwbwg==;
Received: from ip6-localhost ([::1]:62400 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kT90D-00CJcA-E9; Thu, 15 Oct 2020 19:33:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51592) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT907-00CJc3-O0
 for samba-technical@lists.samba.org; Thu, 15 Oct 2020 19:33:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=Fid/jyoMJ1tDj3r7Yh2E9Qe8IXOaFDEYGAln728DUbo=; b=DcoRgJxSDboHeR1EAoVvNT8on5
 oddnuqb2YtcYpRRPiliJR4/Y1ZOnnutxJHcSg+u/3gHiep13ryEPCmKt84z8vBlMnUhB3+u5eLdZc
 LlZsKcPpLIiXIzYDPr+w/XZpNtrCg5oBpWW0TqL5/ay2vFBR1alyL7BMNBnRgXZpwGvALaSKHNQJX
 5m3PX9fhd73BT9b6Q7D3pnfpdj0Ny8p5hbyEzfdfwY5rJ4ntaMB10ddIRfB74ECeKZqoio2kiRnsF
 p95nT0VpdjSPrrpMmQeNTgUXc8znDRNdir4k849lXWxbCcjUsaO2E2FvjRUaF1wqGyJIQBUTn26YD
 ScWdRqobxtn2ekIei4pzH0Q5GDKuzv+PzEYoqXbXO2jmxu0uo4OyjtqGMBVpj0gYgKowqkEBMvsEB
 r+RyllcQH044/KPfnd8LIfLwXAsVKX/+ojXtDaLAdEB44AsDPqPdtAxWhahIhjdpcX0k0Nv8UqUvj
 1BZMwOoCganLHp9IUcHrCxsj;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT907-0003cX-9C
 for samba-technical@lists.samba.org; Thu, 15 Oct 2020 19:33:23 +0000
Message-ID: <09b466404b11983f992ac2f89c369b33d3a1a135.camel@samba.org>
Subject: Re: [PATCH] Documentation: Rename Samba's DCO to Samba Contributor
 Representation
To: samba-technical@lists.samba.org
Date: Thu, 15 Oct 2020 15:33:22 -0400
In-Reply-To: <20201015192330.GI3840862@jeremy-acer>
References: <87mu0nidll.fsf@ebb.org> <20201015180510.GE3769001@jeremy-acer>
 <2231b5de-fa06-db61-feb0-08ad0374673e@samba.org>
 <f70291dc95eb0eae98e23c2897cbcfa9376e90e9.camel@samba.org>
 <20201015192330.GI3840862@jeremy-acer>
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

On Thu, 2020-10-15 at 12:23 -0700, Jeremy Allison via samba-technical
wrote:
> On Thu, Oct 15, 2020 at 03:14:13PM -0400, Simo Sorce via samba-
> technical wrote:
> > [Resending as originally sent from wrong address and bounced]
> > On Thu, 2020-10-15 at 19:14 +0100, Rowland penny via samba-
> > technical
> > wrote:
> > > Hang on, what is wrong with calling it a 'DCO' ?
> > 
> > The original license for DCO 1.0 did not permit it, this[1] is the
> > only
> > reference I can still find.
> > 
> >       If you modify you must use a name or title distinguishable
> > from
> >       "Developer's Certificate of Origin" or "DCO" or any
> > confusingly
> >       similar name. 
> > 
> > 
> > The current DCO (1.1), in contrast, does not permit modifications
> > at
> > all.
> > 
> > > With 'DCO' (Developer's Certificate of Origin), even I (a total
> > > thicko) can understand what it means,
> > 
> > Maybe you really do, but to me it never meant anything until
> > explained
> > anyway. The first time I saw the name I wondered why they want to
> > know
> > where *I* am from.
> > 
> > >  I have no idea what 'Contributor Representation' means.
> > 
> > That's why you read the text and figure it out, it is just a name
> > and
> > is as good as the original in terms of clarity IMO.
> 
> Well it's not just Samba that uses DCO. Look here:
> 
> https://probot.github.io/apps/dco/
> https://www.dita-ot.org/dco
> http://www.gearvrf.org/about/certificate/
> https://www.docker.com/blog/docker-code-contributions-require-developer-certificate-of-origin/
> 
> for just a few of the other projects that use "DCO"
> to do exactly what we do.
> 
> Right now it looks like the term "DCO" has become
> synonymous with what we're doing here.
> 
> Even Linux kernel developers use it in this way:
> 
> https://blog.hansenpartnership.com/a-modest-proposal-on-the-dco/
> 
> "When one of our developers posts a patch to a project under
> an OSI approved licence with a DCO Signed-off-by: from our
> corporate email domain, we authorise that developer to be our
> agent in the minimum set of patent and copyright grants that
> are required to satisfy the terms of the OSI approved licence
> for the contribution."
> 
> Note that the above text doesn't say "to the Linux kernel
> project" here - only "to a project".

Yes I am aware, and I do not think we have any strong obligation to
change the Samba DCO name, but if we do not want to change the name I
think we should have a new document drafted from scratch so that we do
not violate the license of the original DCO text, unless you argue that
"Samba DCO" is not a "similar name" enough.

Simo.


