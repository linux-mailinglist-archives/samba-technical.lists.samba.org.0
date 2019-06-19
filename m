Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 431814B502
	for <lists+samba-technical@lfdr.de>; Wed, 19 Jun 2019 11:36:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=8LGP5PkRH1vh2Umy9QB2wCCZVASmHwYOC95K6MJEV1A=; b=vt+VWxFu0RrBe0ZeKXZKf2HXmC
	mT67xOKcOONnf/idl/xUuMFkIiSJRpV2qjHzNYaLu5ywyBmZmburV9kHjihe+84c6BDmymvJLPecv
	kXWhEDEMs2vDCofn28j88R/GmJRCYTFkGVOKCuD3uTRlIwM80/Iea6Nb+RLBOZDpma0wLbbNEG+ql
	ha6mVmzx+pxca8GIiGEPYuRdxk7XwwTb/+XJEHOgoNJKFDMUyZNEgNwc4+U5ozwEMeh1VzyvQoYOv
	j9cywNYmDyDs2EroyFcsqyGZrDkTTnvoP+TaYmFbPQLWZElPTuScs9eJ9KfZz9qBUgub59Fpx3WsT
	N61fZzNw==;
Received: from localhost ([::1]:48754 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hdX0L-000KlK-Ij; Wed, 19 Jun 2019 09:35:45 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:55789) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hdX0G-000KlD-J5
 for samba-technical@lists.samba.org; Wed, 19 Jun 2019 09:35:42 +0000
Received: from intern.SerNet.DE by mail.SerNet.DE with esmtps (Exim 4.92 #3)
 id 1hdX0F-0004y5-Uw; Wed, 19 Jun 2019 11:35:39 +0200
Received: by intern.sernet.de
 id 1hdX0F-0003lB-Q4; Wed, 19 Jun 2019 11:35:39 +0200
Received: from bjacke by pell.sernet.de with local (Exim 4.90_1)
 (envelope-from <bjacke@sernet.de>)
 id 1hdX0F-00014F-JW; Wed, 19 Jun 2019 11:35:39 +0200
Date: Wed, 19 Jun 2019 11:35:39 +0200
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: WANTED: bugzilla help (automated and semi-automated) closing bugs
Message-ID: <20190619093539.GB1757@sernet.de>
Mail-Followup-To: Andrew Bartlett <abartlet@samba.org>,
 Anoop C S <anoopcs@cryptolab.net>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <c976289f207aa7ab941cb368e38e806201eff36c.camel@samba.org>
 <f916dfd9c395ea1589daddefaa31f8ef4615cd8e.camel@cryptolab.net>
 <9c4fa2da0d467c72a822f0151a08b006daf332bd.camel@samba.org>
 <20190612135627.GA24651@sernet.de>
 <e5622276b22de37212b27b908ee9dc065519fa72.camel@samba.org>
 <79b47f9c34a9154ce94c0129c37b77410d33f15c.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79b47f9c34a9154ce94c0129c37b77410d33f15c.camel@samba.org>
X-Q: Die Schriftsteller koennen nicht so schnell schreiben, wie die
 Regierungen Kriege machen; denn das Schreiben verlangt Denkarbeit. - Brecht
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
From: =?utf-8?q?Bj=C3=B6rn_JACKE_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?iso-8859-1?Q?Bj=F6rn?= JACKE <bj@SerNet.DE>
Cc: Anoop C S <anoopcs@cryptolab.net>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 2019-06-19 at 17:18 +1200 Andrew Bartlett sent off:
> Currently these bugs have a BUG: tag in master yet are open[1]:
> 
> https://bugzilla.samba.org/buglist.cgi?bug_id=8630%2C9976%2C10066%2C10286%2C10440%2C10803%2C10812%2C10882%2C11012%2C11198%2C11592%2C11600%2C11628%2C11665%2C11823%2C11836%2C11894%2C12155%2C12292%2C12293%2C12297%2C12385%2C12399%2C12402%2C12416%2C12423%2C12451%2C12468%2C12739%2C12761%2C12841%2C12845%2C12851%2C12876%2C12881%2C12921%2C12926%2C13004%2C13039%2C13059%2C13093%2C13151%2C13159%2C13178%2C13213%2C13214%2C13223%2C13225%2C13229%2C13247%2C13307%2C13309%2C13311%2C13343%2C13350%2C13353%2C13365%2C13378%2C13379%2C13381%2C13415%2C13442%2C13448%2C13452%2C13458%2C13461%2C13462%2C13466%2C13469%2C13471%2C13475%2C13525%2C13564%2C13565%2C13573%2C13591%2C13604%2C13612%2C13627%2C13630%2C13655%2C13658%2C13680%2C13698%2C13699%2C13723%2C13761%2C13771%2C13772%2C13806%2C13822%2C13825%2C13843%2C13852%2C13864%2C13880%2C13915%2C13932%2C13939%2C13948%2C13949%2C13952%2C13959%2C13967%2C13973&bug_id_type=anyexact&list_id=22103&query_format=advanced
> 
> What do folks think of closing those as fixed?  Would someone be
> willing to write a script to find the git hash from the BUG number and
> close the bug with that and the version it was found in?  
> 
> Or should we just close them all in bulk (perhaps a more refined list)?

I see the danger, that there can be bugs, which are referenced because they are
partly fixed or the referenced fix went upstream already but wasn't the final
solution or the bug got reopened because the fix was not okay. There are many
reasons why this could go wrong. But the list is great in any way, just that I
think it needs manual work if we want to be on the safe site with this.

What we would need is that all of us take care of our own bugs, own bugs
includes bugs that we reported ourself. If I file a bug report that I fixed, I
need to take care that the bug report gets closed also or correctly assigned to
Karolin for merging. I should also not file bug reports that have no descriptive
body text but only a more or less cryptic summary line. What I want to say is
that we all need to change the way we use bugzilla and we should all give it
more love and attention.

peace & happyness™
Björn

