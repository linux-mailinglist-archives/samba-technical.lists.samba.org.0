Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D43D1DCF
	for <lists+samba-technical@lfdr.de>; Thu, 10 Oct 2019 03:04:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=pERcSIWVmw8LwUZSDSsHI5irTmVp2qyXU3PWdnTqpZQ=; b=zXdad6VELaGnOWuLLY3mfDzooM
	r61wpRRWsRLk7y1HBK6NdP1MHB6ukFwRiS7MlxMAdZHvw16JcBAf6zzEKwepaKTawhdkRxcZU2sJH
	XVoA7WVXB2uwFb9AugD0PK4HsUFJxm+FSNSubCEKoO8q2mukjTGIJsKzVTkwNhcsyF4ihOrushN+C
	a6uZQ7AtLNLdsn8OWrffWVbmgZB887utIVJhNirOG8gNnn/p5ps0qUXFSzgSjVI9bvSBbXnb+marQ
	YhcOiceZ4qerJ6wtIE/DIJ8vKSoUZuJBKzGXGB/D0ViK7z2T2IuE7BLudu30OtZiCZ0HDetqJF4zd
	4z/+77eQ==;
Received: from localhost ([::1]:51774 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iIMrZ-002WXB-Pj; Thu, 10 Oct 2019 01:03:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13622) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iIMrV-002WX4-Jx
 for samba-technical@lists.samba.org; Thu, 10 Oct 2019 01:03:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=pERcSIWVmw8LwUZSDSsHI5irTmVp2qyXU3PWdnTqpZQ=; b=Dkbv4uWyWBgx7XfWu2qJs3UHn6
 jgwv2iI7ZK9D2E4EaypOBC7M1bYcgeRGf6/WPulMh2egNpqp1FVla5AVtjjlApWeJ+v50D9ZD+f8e
 ZrfHTqyJVJAVlPcmhZe3YIc3FDu4K6Pcmsz6/StZCBRqp61oSimp7elXlpUS4mSUko09wU2mSMlTX
 /aTSgJpFui+HT4c6N7RgAzY4CbjTQUhi9a4AqvGlVnCp5US2fAPP8T5xgc9HK1o1UTcdjtNWMgfVG
 G/faEgs8kwSVbrOih+KEcaOi7vAgM3qM+Q8kJbmRiVqgtIlTvxaRGBH3cNCBes4RePAUtKXVGd9To
 7q20o9zMxUQyq0dvw5ApfsoXu5UBs8CqGUTd9a2pZDShE+OU19P334Bvko+GTeDEc5PsIv7WD9MRB
 1XW3Bqr8vK2hDZhCSqAl1xxEQQ++qqcNGrItfxUCt/Jz3Y4D+wvYr6iH2uvxG8X4HYa+ubs7nV5lS
 O96rVqPODZtUpwzF9AcHFo7A;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iIMrU-0004pt-D4; Thu, 10 Oct 2019 01:03:25 +0000
Message-ID: <23d332862da47ae0f58abc6f46f08da987047bd6.camel@samba.org>
Subject: gnutls requirements for samba 4.11 rpmbuild on CentOS7
To: Denis Cardon <dcardon@tranquil.it>, Andreas Schneider <asn@samba.org>, 
 samba-technical@lists.samba.org
Date: Thu, 10 Oct 2019 14:03:19 +1300
In-Reply-To: <ca548b9f-4664-1503-b6ec-f4b04e6e5267@tranquil.it>
References: <dcc2c49e-08cd-e077-6506-53020b3ffc58@tranquil.it>
 <d6e33d3f085cd509f2915cc0e50f50572416e169.camel@solinos.it>
 <0091979d-7696-5502-d34d-acd2725bfd36@tranquil.it>
 <5800371.XWyRSs5115@magrathea>
 <ca548b9f-4664-1503-b6ec-f4b04e6e5267@tranquil.it>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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
Cc: Dario Lesca <d.lesca@solinos.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2019-10-07 at 14:23 +0200, Denis Cardon via samba-technical
wrote:
> Hi Andreas,
> 
> Le 10/07/2019 à 12:56 PM, Andreas Schneider a écrit :
> > On Monday, 7 October 2019 11:32:15 CEST Denis Cardon via samba-
> > technical
> > wrote:
> > > It is built against Heimdal kerberos. The samba.spec is taken
> > > from
> > > Fedora (thanks Günter and Andreas for doing all the hard work!)
> > > and
> > > modified to switch from MIT to Heimdal. Actually the hard part
> > > for
> > > building 4.11 on CentOS7 is the requirement gnutls>=3.4.7.
> > 
> > Hi Denis!
> > 
> > 
> > Samba 3.4.7 is only required for MIT Kerberos. If you build with
> > Heimdal
> > GnuTLS >= 3.2 is just fine. Just change the required version in the
> > spec file.
> > 
> > 
> > With Samba 4.12, GnuTLS >= 3.4.7 will be required!
> > 
> > https://blog.cryptomilk.org/2019/10/02/samba-and-gnutls/
> 
> Dear me! I misread the requirements and thought it was necessary
> from 
> 4.11 onward, whatever Kerberos implementation was being used...
> 
> I should have taken more time reading thoroughly your blog post! The 
> good side is that I learned a few more things on rpm packaging...
> 
> I does make building 4.11 definitely much easier on CentOS7... And
> by 
> next year CentOS8, which ships gnutls 3.6.5, will get traction when
> the 
> new and shiny samba 4.12 will be released!
> 
> Thanks for the input!

Yeah, that's why I only dared to do this for the 4.12 release.  That
said, I know there will still be demand for this to work on CentOS7
regardless so these learnings will be really helpful. 

We know we put folks packaging Samba in a difficult spot so seeing how
this plays out will help us understand what we can and can't reasonably
depend on in the future.  

Personally I'm hopeful that this goes well enough that we can bump the
version up again and remove some more #ifdef and AES code.

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




