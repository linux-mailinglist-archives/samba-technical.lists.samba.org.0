Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 038661C60ED
	for <lists+samba-technical@lfdr.de>; Tue,  5 May 2020 21:17:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=F1/2cO4zdGNji4kakQT3Gha4l9wN7MvIcrExw3KG4Vs=; b=uShO8SjRf1U4hm3XuoTVqVC684
	JviSENoEGehaS6fILOrSBzCF61RPf9OjZOA8nTOXsGIYOqMZgwsl6IreJ2IU12C+HesI0v7ZZgVzS
	ym0ujeSC376KzstSsTeD6LpU6jqL5XcRC0Xu1Syag/DRH/P+KMA96jX0n4sa1+chiabpA63xMuzl2
	RQQ4Ajy+4y+IyJ0UqsprwIGPzDoF7gEjio2k2zouW0RBGZ2z6C1gpEq4CK/NvMrKpIo1aMtqAtH4D
	Al1B6sMJUMkYhd+DzvuzRetsjgSXCCXPCJGKjM9EKWthNf9kX05eKSbQG9WZfDGyfy+J6qLS4xAVL
	vUGIFrPg==;
Received: from localhost ([::1]:60460 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jW33e-002tlN-Uc; Tue, 05 May 2020 19:16:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21482) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jW33Y-002tlG-LI
 for samba-technical@lists.samba.org; Tue, 05 May 2020 19:16:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=F1/2cO4zdGNji4kakQT3Gha4l9wN7MvIcrExw3KG4Vs=; b=l+qnWzS3n3DZ4iE6upiThRHcka
 35SPdpcttobIx9ar74etcOQ1KSn8bHy3ySrX+3w0oIPge0lMteiNG+XdJRsJoLlaCe8xJj3kzy/DH
 BNhjXTTPZyBbDEfipKzJaNk01binjpkF4iOvlPHXT6ZvJXwR5KHRXmbjwcCIkUpZlvgOxQqeoFU0i
 6L8GlwspmzedJmyJUgbjgpDBBhWOokJNDWuB9wps3au4mQJfvh0lPUELAZ8BJsMvLp+3xepd3slZA
 5B/rY+CkswgNcl+DCD9doUerAJ+yyEUoyOmY2uBGbcel85T9nnwoi67pRyAmFktwWyCqNDhcsRUeo
 xYr288nt0SDZzOGf2ok3PMe6c2u0cPnBbxp5EPo6rjGk9EvC21L8T6WEyrAULKPrVqQOgszrC1cjd
 Uya1IW0KI7Sqw3f9dxVHvWE8/X4nVPQ2sBIzlvg+02KhRCSdpUm09sSnLmWHH1ODdRiOnFhXGz8Sp
 bv5VyCIViNN1tSzg0jZZ8YM+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jW33X-000697-Ig; Tue, 05 May 2020 19:16:39 +0000
Date: Tue, 5 May 2020 12:16:33 -0700
To: hezekiah maina <hezekiahmaina3@gmail.com>
Subject: Re: GSoC 2020 Community Bonding Outline
Message-ID: <20200505191633.GA3821@jeremy-acer>
References: <CAH72RCX2B3z1Mv+R32yYA0GnpQY-WX7ustGtS3Npui1Dh_L+FQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH72RCX2B3z1Mv+R32yYA0GnpQY-WX7ustGtS3Npui1Dh_L+FQ@mail.gmail.com>
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

On Tue, May 05, 2020 at 01:30:25PM +0300, hezekiah maina via samba-technical wrote:
> Hello everyone, my name is Hezekiah. I have been selected to work with
> Samba during this year's GSoC. I'm excited to work with everyone in the
> community during the entire GSoC period and become an active committer
> after it's over. During the community bonding phase I'm hoping to engage
> with the community members, getting to know the history of Samba, how
> different people contribute, which projects the organisation works on and
> possibly contribute few patches before the coding phase begins. Any
> resources from the community aimed at onboarding new members would be
> greatly appreciated. Looking forward to working with you all.

Hi Hezekiah, it's great to (virtually) meet you !

As you may or may not know, Samba is an *old* Open Source
Project - I think we pre-date the Linux kernel (or at least
we hail from around the same time period at least :-).

Like Linux, some of the early committers are still around
and (hopefully :-) still friendly to new engineers !

Feel free to ask any questions you might have. If we
don't know (or can't remember more like :-) we'll do
our best to help you fit in with us.

Thanks very much for helping us with Samba !

Cheers,

	Jeremy.

