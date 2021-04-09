Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECB035A657
	for <lists+samba-technical@lfdr.de>; Fri,  9 Apr 2021 20:55:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=rgaS/Y9rH3XyYBXHeV4Ad5oHtD6QbBhjbgpOlojbgEo=; b=XVlTCfHrQvRVq/rLncZ02UOnp8
	jfi0uUnrrFNYCulueFWotTU4tzgK4ZGIwzzimrVVZUyN/zX5fiqDIP+d+0ZXylYDxvo3SGKU5UJO7
	PG1OhJP0wii+BsuWn+BjkQDogF2W3V6OM/mt000stygymZ+WNbihaHwGIoidvy2JeqAwyjF1FD43H
	/WzrlR7qpjHLvKzJPLwVbn81LpJgyBD+36R2bWktsZhYXjf7BYGafwDNTd2nkzew5piDL/KX+KV7i
	G+L31P0h2XNv/M3T73vRkjc63xRA0mJJywM4R6O2hB/hLMK4nzB+JAIbef+JkU7Nb0GTSBgQz/ihP
	yZ254GEw==;
Received: from ip6-localhost ([::1]:43124 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lUwGz-00AiUG-EO; Fri, 09 Apr 2021 18:54:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17522) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lUwGs-00AiU9-RL
 for samba-technical@lists.samba.org; Fri, 09 Apr 2021 18:54:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=rgaS/Y9rH3XyYBXHeV4Ad5oHtD6QbBhjbgpOlojbgEo=; b=PwSuy7Kb/jlVJa1aZobMfATDgg
 cOfYSKn303Fud/aXhK2fVXHdu4gQl37EQ56K1xASEQ5OmXzcawRTbB+L31Avy2xw9igBAIa6bPEkY
 C2rj2/9pgZ3qRGlXeC1St7edKomfDA22Ka+xb5w7YfEk3ldt5A5IB8uQEqj3lXwOFA8qckt5lBWq+
 KtbQHNB2cod2tlcKyaaQ2ry0qRQDffUJg8gpQ6w2IC8OJAVbQpDOadgJ8cN651ndtXItICDAogHth
 FEAlglakeByGW2CEsg0vaRfZFQcL2Ki1vGRuCLxMfmeF61N12JjGWETOVedPSOBd3NgPFerNFGx5C
 hjlVHFMz6lfnOEH3pGBq6nA7ucRmsNJdUQw7x1iM2shnyO9flAVEfmDGH3nnRmNXaVY2t1b505BMj
 vJFwWuMloXmCifTeexv0wmq1ZqoT0bG48xiO8X/8s/OhRh2T6wmwxEQfaM4i9X5X5/WXN84J2nfmp
 vjjc6sCQ6LS4QH7/8aaHbOUQ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lUwGq-0005uR-23; Fri, 09 Apr 2021 18:54:20 +0000
Message-ID: <16c88278e8ce9e8dd43eab767e633f5f4b0a221c.camel@samba.org>
Subject: Re: Setting up QtCreator for Samba development
To: Ralph Boehme <slow@samba.org>, =?ISO-8859-1?Q?Aur=E9lien?= Aptel
 <aaptel@suse.com>, Igor Chudov <nir@basealt.ru>, 
 samba-technical@lists.samba.org
Date: Sat, 10 Apr 2021 06:54:09 +1200
In-Reply-To: <732d6001-c29e-5df8-77a3-df8d8b46b4d2@samba.org>
References: <502aedfa-7290-7e9b-11fe-06d2cfe59bb5@basealt.ru>
 <bc0db8d3-f6c5-103d-3193-9f687f94c434@samba.org> <874kgf4xku.fsf@suse.com>
 <732d6001-c29e-5df8-77a3-df8d8b46b4d2@samba.org>
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

On Fri, 2021-04-09 at 11:54 +0200, Ralph Boehme via samba-technical
wrote:
> Am 4/9/21 um 11:27 AM schrieb Aurélien Aptel:
> > Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
> > writes:
> > > if you're open for other IDEs, I've recently looked at Visual
> > > Studio
> > > Code on Linux and that looked amazing. I was just about to dump
> > > my Emacs
> > > setup and switch but then mehhhh! :)
> > 
> > You have to resist the lure of the dark side ralph :)
> 
> it was tempting, especially after installing
> 
> <
> https://marketplace.visualstudio.com/items?itemName=tuttieee.emacs-mcx
> >
> 
> > But seriously, what did you find particularly amazing? Does it come
> > builtin with good C parsing/analysis/xref?
> 
> YES, YES, YES! Out-of-the-box usable code completion in the Samba
> code 
> base. Functions, structs, macros, everything just worked what in my 
> Emacs setup works for a few weeks and then breaks again for some
> reason 
> after updating one component or another.
> 
> The biggest showstopper was: it's just BIG and offers A LOT, so
> getting 
> to know it would take me too much time. But this is really the first
> IDE 
> that looks capabable of rivaling Emacs.

Is there anything that would be useful for us to put in-tree to make
this work better?  

I know some of our other IDEs have worked better with a little
integration from the build system, and sometimes we have included the
hooks to help get folks going with Samba development faster.

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


