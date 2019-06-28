Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0545F5944F
	for <lists+samba-technical@lfdr.de>; Fri, 28 Jun 2019 08:40:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=cxqlUpcAIvvObKODuiBL4feeUb3PpQxdm7/b/9mlkHY=; b=z5mJ54KbcKeaZK0fW2TUhxw+RN
	7IAemLmAUid6sArNypsfqtCahboQ6ySEshBRzWWrvFBw75OngeOY5uUdO8GdxN+v2JknWtJkz4kaJ
	4Dj6RB8/MxDq4sZqBnu7uvEsmd7hlHGyQtTR9S3T3gIsZcKLxQ0vtxVk5KhgOQRxmlONl7+om/Aob
	+G28qxOMpIoI5HK9rY/ui9lRC3BoCEfbVxVc+gUKtRi4DeYybd8u97GWoLkF1C61ccYaGWb3bv3aH
	V9y2RSNZguGa6hDC+J9Vq8XFcobDmivPT9g/M4sG5QI3tWQgY52ifbTijWlDXzWDBAK9LCDC2eEBi
	WTZw2QoA==;
Received: from localhost ([::1]:61566 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgkYg-002Gwh-FF; Fri, 28 Jun 2019 06:40:30 +0000
Received: from ozlabs.org ([203.11.71.1]:33111) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgkYE-002Gwa-UN
 for samba-technical@lists.samba.org; Fri, 28 Jun 2019 06:40:07 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45ZnF71cZ5z9s7h;
 Fri, 28 Jun 2019 16:39:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1561703995; bh=J7qwHfocLM7/fnGt6Ft07gQwp975XVeOb2nSmke8psY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XQ/VnNuKzhxvW5NMAvp1JzdxzUXEAbpbgbDgWPoGlnsiQLkV16CdKo5pTBIRQLSab
 NnsDCoS3dmTda2f8E0hqOrGnmnIfQFYaXgprqzGlRSgPubT2aoJ/2RkhOca154h9TM
 vo9BUHwH4IduM2NR1MrjUryiQ3t6mHUAfTUDs/4lHAJSZkpcAvYQeZk9iv3CH59fhy
 12goXOVpBDbD2lqQlHiNQYD3joijERl0MI7sgmeEaTnac2ih1fb1GwoRVLqi/z3QKv
 RnsPqXTxfjCTyA29ZUlwSb/GS7lItUTB/hA9O+Stc/zhpZrRuiRsPKC15zjdODxQB8
 1uPdt4Tl6J5qw==
Date: Fri, 28 Jun 2019 16:39:54 +1000
To: "L.P.H. van Belle" <belle@bazuin.nl>
Subject: Re: Compiling Samba with system Heimdal?
Message-ID: <20190628163954.553b8115@martins.ozlabs.org>
In-Reply-To: <vmime.5d15b434.4582.3bcb7b652c1223e3@ms249-lin-003.rotterdam.bazuin.nl>
References: <20190628142946.7537edfd@martins.ozlabs.org>
 <vmime.5d15b434.4582.3bcb7b652c1223e3@ms249-lin-003.rotterdam.bazuin.nl>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Louis,

On Fri, 28 Jun 2019 08:31:16 +0200, "L.P.H. van Belle via
samba-technical" <samba-technical@lists.samba.org> wrote:

> > ../../source4/heimdal/lib/vers/print_version.c:39:  
> > > ../../source4/heimdal/lib/roken/roken.h.in:282:10: fatal   
> > error: roken-common.h: No such file or directory  
> > >  #include <roken-common.h>
> > >           ^~~~~~~~~~~~~~~~
> > > compilation terminated.
> > > 
> > > I don't see -I/usr/include/heimdal in there anywhere.  :-(
> > > 
> > > Can someone please tell me what I'm doing wrong?

> You tried, installing heimdal-multidev ? 
> https://packages.debian.org/search?suite=buster&arch=any&mode=path&searchon=contents&keywords=roken-common.h 

Yep:

dpkg -l heimdal-multidev 
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/Trig-pend
|/ Err?=(none)/Reinst-required (Status,Err: uppercase=bad)
||/ Name             Version      Architecture Description
+++-================-============-============-===================================================
ii  heimdal-multidev 7.5.0+dfsg-3 amd64        Heimdal Kerberos - Multi-implementation Development

:-(

But thanks for trying!  :-D

peace & happiness,
martin

