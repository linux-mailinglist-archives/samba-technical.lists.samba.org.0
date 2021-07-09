Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DB13C2594
	for <lists+samba-technical@lfdr.de>; Fri,  9 Jul 2021 16:10:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=CvI08S7Cr9wYot+mDYrX0dqEGKhR66ul6HAQR4SUw8I=; b=yNiwhJIQb1ymnKL0uJl5YCH4lB
	iHb/6VdsE9XImu0l6TFt6NhIzVHVgg5r3Bam6fdVSklxOOSeDcnWkdyr1UyyEpfFCaqz+2DNRw3eU
	St5UHPEykf0bVs2zRVN1xaPBIO2nOXWPZS8HXIYoczkbwnz1W71obbYlLxy8Iakm2iGGo/8g0Kdvc
	Dp5c4CAq3yWYCWxPQqRk7wpabMmKjwFyUi5KAOnYztYh4NT27Yy95GJFNvrgtc6WknVBb4KtsMxK2
	Y0Cvmc2pIEOuiWSpuUArUiaoiG3JaHKcL2tRvj05tmLl1QxBwFoGBeJ4SvejDDptP/QOHgWwRvcxm
	LDG+dYTA==;
Received: from ip6-localhost ([::1]:49308 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m1rCS-00Cqzr-NF; Fri, 09 Jul 2021 14:09:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31756) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m1rCL-00Cqzi-SX
 for samba-technical@lists.samba.org; Fri, 09 Jul 2021 14:09:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=CvI08S7Cr9wYot+mDYrX0dqEGKhR66ul6HAQR4SUw8I=; b=dVpdCDKQ3El9J79iyVesBTN61S
 jQVJuHd/EHUu3L/2aYhkwmD6DIUGjXwAjX+7sK3LHitH04KDtZIby/uXBjp7fMhuSar12l0spcUt7
 4RL2xkBetrNCoUqLHAsJ3rEznXC5Xus6nEtLgkBPgA/XidAWhMHsDvAWYCYchobNBfR1RjtKNmcQb
 y+TpNxZF6dhbLPAfp9HXfEFFZ+QPuxkEln8GvAkrqOwGVRKzABaEE/dR4V7WA4SOvKu0Ki7NVH0oD
 aOoJQhy+nMB5eLER1sogCAD/DHUxi4abSCIFgRrJ2NhpGlJIaJ0ABoBk4dcXxvvdKfbeU1KdrFeYn
 LLSLex9hnqnOdHS19ESTvBEy6+jxWS+Ld9bA0SNNcmm0U0dI1ANWVINeYbj9xIH5Vdf0j1VO/WJy0
 d0jvEzRofHv7Kc3bbomDK9BHZVSJkCIp6nGY7OScUxVk+mckEUsB5WDKQpVIXWFX6OrnWIlycopPN
 mxzUslHnPhttLlpnFeP4phg4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m1rCJ-0002gI-Rm; Fri, 09 Jul 2021 14:09:43 +0000
To: Uri Simchoni <uri@samba.org>, samba-technical@lists.samba.org,
 Andrew Bartlett <abartlet@samba.org>
Subject: Re: git signoff+ and review+
Date: Fri, 09 Jul 2021 16:09:43 +0200
Message-ID: <6555830.MvbtekTJVG@magrathea>
In-Reply-To: <51a3669329b66c91d4306b9e6ba6024d08ea59be.camel@samba.org>
References: <2070261.IvKQ8U6GgO@magrathea>
 <25b13c121d4005bb7c2ea0b3666b83c2fc58cb9e.camel@samba.org>
 <51a3669329b66c91d4306b9e6ba6024d08ea59be.camel@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wednesday, 7 July 2021 07:17:31 CEST Andrew Bartlett wrote:
> On Wed, 2020-06-10 at 19:20 +1200, Andrew Bartlett wrote:
> > On Wed, 2020-06-10 at 09:28 +0300, Uri Simchoni wrote:
> > > On 6/10/20 8:27 AM, Andreas Schneider via samba-technical wrote:
> > > > I'm not sure how you exactly want to achieve that. Please educate
> > > > me and then
> > > > I can help you :-)
> > > 
> > > How about adding those scripts to Samba, and adding a "samba-git-
> > > config"
> > > script that would set them up (and then the honorable mentions in
> > > the
> > > wiki and/or README.Coding)?
> > 
> > When we run ./configure we already set up the
> > .git/hooks/pre-commit for the whitespace check.  What I'm suggesting
> > is
> > that we get a good agreed set of commands and install them on a per-
> > repo basis using git config as aliases.
> > 
> > Then we can document them (of course) but even more helpfully
> > reference
> > them without major qualification from our wiki, README.Coding, etc,
> > because they will always be ready to use.
> 
> Andreas,
> 
> You have been doing aweseme work making our repo 'just work' for new
> developers with things like the editorconfig file and the
> compile_commands.json.  Is there any chance you could look into this?
> 
> We should be able to set these into git with 'git config' of an alias
> or three during configure.

I'm not exactly sure, what you want. However we have some nice stuff for 
libssh in the pipeline:

https://gitlab.com/libssh/libssh-mirror/-/merge_requests/152

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



