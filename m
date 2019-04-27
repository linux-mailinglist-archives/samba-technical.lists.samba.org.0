Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFCBB22C
	for <lists+samba-technical@lfdr.de>; Sat, 27 Apr 2019 03:30:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=YeaGJAqn/XNgW5dCTKSHp8853+NGs0YqKBu8s6yj298=; b=DboXcpNWk3cCh/QEs4xIiMYg+j
	Tta90yAiJwETMICzshIdVUNNlA6F6gMdBOpTVenmLo5lf0mVZHGYpoJ44dVGBsqh24SRi0CGaSEeT
	o6Ppnr4Op420NIFqPgROlOjcir8l+GKG4D2z4wDiYlqcGOqZtdCexRip+1xz9hV4ksPtUQmw0coXT
	hKTOYgm/FiknGC756Es8M+9FFSIou48h8oUuugtFhCxyOQw523IOtyN3vp33btfRX7kP8bYOdCWHx
	90tquTahoOsUwBnt8t8DLkm4uMVjaJejv2b8U4bgBfELyf/f/gvPbsZHN5/yz2+2onp723rXUxe4I
	GvMLbCsQ==;
Received: from localhost ([::1]:39604 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hKC9q-0033GH-TH; Sat, 27 Apr 2019 01:29:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:40708) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hKC9e-0033G9-FK
 for samba-technical@lists.samba.org; Sat, 27 Apr 2019 01:29:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=YeaGJAqn/XNgW5dCTKSHp8853+NGs0YqKBu8s6yj298=; b=jfmdmJzTPVcduJeShP0o82vEuv
 JpsYPzR8Yp3iD5l+kd+XS/KZpsfY3Tt6lK7ZpxUnu4V876yvtIuxv/XUjxRGS834S5t3+WeVr+naA
 P8dIZvEQRYQGJWMmaTnCfkz9mcFWlFA0wWr0j202/ntOFhXfv1ZXx4SMRSC3hck/aDQ0=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hKC9c-0007ih-QV; Sat, 27 Apr 2019 01:29:25 +0000
Message-ID: <1556328560.2985.57.camel@samba.org>
Subject: Re: [PATCH] #ifdef code cleanup
To: Ralph =?ISO-8859-1?Q?B=F6hme?= <slow@samba.org>
Date: Sat, 27 Apr 2019 13:29:20 +1200
In-Reply-To: <20181124095806.hvptzkknvfh7ecuv@kazak>
References: <8298608.eBA8YLnQ1J@magrathea.fritz.box>
 <1542920795.1746.115.camel@samba.org>
 <c5db47bddd5123b4919b247035244abb948b5f1b.camel@samba.org>
 <1688127.r2BiaBJm2f@magrathea.fritz.box>
 <b49f5a1161cf4ab4efad16ad0e1b669fd3d79d90.camel@samba.org>
 <20181124095806.hvptzkknvfh7ecuv@kazak>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
Cc: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, 2018-11-24 at 10:58 +0100, Ralph Böhme via samba-technical
wrote:
> On Sat, Nov 24, 2018 at 10:42:05AM +1300, Andrew Bartlett via samba-
> technical wrote:
> > 
> > 
> > I did a test on my host with the script I suggested last night,
> > fixed
> > up to finally work.
> > 
> > I had to revert:
> > 
> > s3: Remove unsused MMAP_BLACKLIST ifdef checks
> > lib:replace: Check if HAVE_DECL_ENVIRON is defined first
> > 
> > (these can be reasoned about independently).
> > 
> > To make it give the (almost) identical results you see below.
> the gcc -E trick is really nice. Can we put that somewhere in the
> wiki? If you 
> have a suggestion where to put it, I'll happily volunteer to make the
> change. :)

I added it here:

https://wiki.samba.org/index.php/Testing_removal_of_ifdef_or_configure_checks

Also, I think Douglas has the knack for doing this with the ASM output
as well, which is less sensitive to line numbers.

Andrew Bartlett
-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba




