Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 37539305233
	for <lists+samba-technical@lfdr.de>; Wed, 27 Jan 2021 06:40:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=izMMquD5D2DTqiYD5yUlOT4KXzymjKTA+2QOlPlxNZA=; b=Sk4qZGq9dzG2TiAR7y0NdbmyRc
	XL+dfRu9UtTa/S2fhBOMBepnzm2+x8htmiFxMhn2W+wTx/goEZOJGP60pQL1GA58YHD9wo0TSORG1
	+hdo6xpb+6K9XZSjsMou9aAj6KBO72AVY20MYj+jeCUjSt/kFDeRfeD/b9XaeRHH9KwJfKro5hdhB
	p6ydCuNEBolBLhcKMq+tfFvHLNQlmVAWC0frAG67khaKbxRLhUFdITaKZ6hPiR0ZORNPXwxYVot70
	CJOoHku70Cf4txb8Q6an2PBeu7NfPGDbcyKa/MdEwJyt4uO8A8fYRB7h+GpfMvwG7efpJ5JoZJsQA
	R4YwK5nA==;
Received: from ip6-localhost ([::1]:63752 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l4dYF-007Kpg-Tz; Wed, 27 Jan 2021 05:39:36 +0000
Received: from ozlabs.org ([203.11.71.1]:57519) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l4dY6-007KpZ-MJ
 for samba-technical@lists.samba.org; Wed, 27 Jan 2021 05:39:33 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DQXTR5FzKz9sW8;
 Wed, 27 Jan 2021 16:38:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=202004;
 t=1611725932; bh=y6j0tmfvfdYvh/8+Eqd3LEYPj/NFNgrN/mwW90kNaFg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WHIyCWcOD0J7X+NIZlkRkQyGfbhvE1iL/KMi0GNhxJtoNdpmGaQkW97vEVt6sGC7m
 a7ShX9O1yEDZthAeeVBrO6GhpVff26fRMXkAPrLtaWKndf/y4yNC40J5jCgTX70joO
 RCkQ9RR57ROzBVY8zeN/7EUJ9v1hcsnUtpL+2vSMp/Pb79XtwcRuJ9tbYeNIG8kmDD
 Kk0Zr1nbTSqMVKbbmNjIvVbESi0K42sSgEf1kwtdNu+j67Ci9xxt5BThmYf4Cz6/Gx
 OtEf2DPjN19ZnBlGCGeutzOJdOafF6QayFUVa2zT62JeW4fhz/3EPVb3X1iuUNftvD
 87JUYcEMb/x1Q==
Date: Wed, 27 Jan 2021 16:38:50 +1100
To: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Subject: Re: Not sure how this slipped through
Message-ID: <20210127163850.327cd600@martins.ozlabs.org>
In-Reply-To: <02fae49b32bc297873eeb81426845343772f6b90.camel@samba.org>
References: <B93A6FFE-2D85-4503-BB15-D2AFC270028C@ibm.com>
 <20210126195556.2def02cb@samba.org>
 <02fae49b32bc297873eeb81426845343772f6b90.camel@samba.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: "Christopher O Cowan - Christopher.O.Cowan@ibm.com"
 <Christopher.O.Cowan@ibm.com>, Jim McDonough <jmcd@samba.org>,
 David Disseldorp <ddiss@samba.org>, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 27 Jan 2021 15:58:55 +1300, Andrew Bartlett via samba-technical
<samba-technical@lists.samba.org> wrote:

> On Tue, 2021-01-26 at 19:55 +0100, David Disseldorp via samba-technical 
> wrote:
> > On Tue, 26 Jan 2021 18:15:48 +0000, Christopher O Cowan -
> > Christopher.O.Cowan--- via samba-technical wrote:
> >   
> > > My builds on AIX have been failing because of this obvious
> > > error.  Can someone please apply it?  
> > 
> > Looks good, thanks for the patch.
> > Reviewed-by: David Disseldorp <ddiss@samba.org>
> > 
> > @Jim: looks like you wrote this module ~15 years ago :). Can you
> > review
> > and push?
> >   
> > > Just wondering, are AIX builds still part of the CI/CD system?  
> > 
> > I'm not aware of any AIX CI jobs.  
> 
> Yeah, there really isn't any good way currently to do CI on AIX,
> because we can only test, currently, things that can boot up under
> Docker on a Linux host.
> 
> Even FreeBSD is out of reach, which is annoying.  I keep hoping someone
> might show up with the boundless energy required to try and get it
> going via (say) qemu or some 'FreeBSD-like' userspace for linux, but no
> luck so far. 

We should at least do build testing via cross-compilers (probably in
containers) on platforms we think we support.  That would be better
than nothing.

Something like this seem like a promising starting point for FreeBSD:

  https://github.com/myfreeweb/docker-freebsd-cross

We could ask those with a stake in the relevant platforms if they could
sponsor or do the relevant work.  Perhaps Jeremy knows someone with a
stake in FreeBSD who might like to contribute?

Beyond that, running tests would be a bonus.

peace & happiness,
martin

