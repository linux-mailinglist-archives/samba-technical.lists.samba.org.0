Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 873D1A6B5A
	for <lists+samba-technical@lfdr.de>; Tue,  3 Sep 2019 16:26:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=X96Gi+u5EzTP6i4CQi9GEwxZ7ezqNqQemg8S+KayzeU=; b=o4ko9MAU3pgK7le3iALipKFGCP
	4Dd8BC9YrU/JydOeIsbHWKEPppPV23MszUfOahEA/epsqlgxCI4wFbOGGWUrB8Kh8ASVEklOro7cz
	4eUOjmNmzCy3MEMrDO9rPT/TVmBKOvf96JEnbYx8jnJ+WCtQgYM7loFaZPdkbhZwsAYQ8JCcIKmEi
	cidZvnKMNJto2p/ierioWUmq/k511sHKiO1UOB7xsksNRAL3bfs3/z6GNPD5demeFLh1zRjcvMeNq
	tRAtpBGu9vhGmCm44+XwrNiDw1JX335FF9HdKCNcdY3UeW8Ekf13zsYwemCefqM4Eq577aEuGbbEm
	f3thJpbw==;
Received: from localhost ([::1]:51360 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i59lN-003DVl-Kf; Tue, 03 Sep 2019 14:26:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20836) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i59lJ-003DVe-In
 for samba-technical@lists.samba.org; Tue, 03 Sep 2019 14:26:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:Cc:To:From;
 bh=X96Gi+u5EzTP6i4CQi9GEwxZ7ezqNqQemg8S+KayzeU=; b=CR5rRa5H7B19PVk+B+THKsQmpP
 pgDSijcroYurjeJExS+ks/sWr2K69P3wT6wK2lajKj7NuGNg7UEBtL/LGqdjNtB6Elzt12EiSRDRT
 lTIR0OeE4POQ/vELWUATmCtPu4WldY6Zn2P7Slya5yOml1L4xXmectZXY+gKjDZwYGOE=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1i59lI-0002YI-T0; Tue, 03 Sep 2019 14:26:24 +0000
To: <samba-technical@lists.samba.org>
References: <20190903111941.GA15245@carrie2>
 <20190903141225.GA2122626@10.4.128.1>
In-Reply-To: <20190903141225.GA2122626@10.4.128.1>
Subject: RE: [Announce] Samba 4.11.0rc3 Available for Download
Date: Tue, 3 Sep 2019 16:26:24 +0200
Message-ID: <E99FB72BA8824B0FAB212FAE35B48FCC@rotterdam.bazuin.nl>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Office Outlook 11
X-MimeOLE: Produced By Microsoft MimeOLE
Thread-Index: AdViY5CZrQfHj6QlQ8i+2pjk09578w==
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
From: "L. van Belle via samba-technical" <samba-technical@lists.samba.org>
Reply-To: belle@samba.org
Cc: 'Lukas Slebodnik' <lslebodn@fedoraproject.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hai, 

Have you looked on the ftp? 
The others are also there, see: 

https://ftp.samba.org/pub/talloc/?C=M;O=D 
https://ftp.samba.org/pub/tevent/?C=M;O=D 
https://ftp.samba.org/pub/cwrap/?C=M;O=D
https://ftp.samba.org/pub/tdb/?C=M;O=D
https://ftp.samba.org/pub/ldb/?C=M;O=D


Greetz, 

Louis


> -----Oorspronkelijk bericht-----
> Van: samba-technical 
> [mailto:samba-technical-bounces@lists.samba.org] Namens Lukas 
> Slebodnik via samba-technical
> Verzonden: dinsdag 3 september 2019 16:12
> Aan: kseeger@samba.org
> CC: Lukas Slebodnik; samba-technical@lists.samba.org
> Onderwerp: Re: [Announce] Samba 4.11.0rc3 Available for Download
> 
> On (03/09/19 13:19), Karolin Seeger via samba-technical wrote:
> >Release Announcements
> >=====================
> >
> >This is the third release candidate of Samba 4.11.  This is *not*
> >intended for production environments and is designed for testing
> >purposes only.  Please report any defects via the Samba bug reporting
> >system at https://bugzilla.samba.org/.
> >
> >Samba 4.11 will be the next version of the Samba suite.
> >
> 
> I can see that ldb-2.0.6 was released which is required by 
> this version
> But I cannot see new release of litalloc and libtevent.
> 
> They fail to build with python3.8 and necessary paches are already
> in the v4-11-stable branch.
> And latest releases of libtdb and libldb already contains these fixes.
> 
> Could you do a release of before next release candidate (or 
> at least before
>         4.11.0 ) ?
> 
> LS
> 
> 


