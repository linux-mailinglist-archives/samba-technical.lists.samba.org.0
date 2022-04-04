Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E63F04F1F1C
	for <lists+samba-technical@lfdr.de>; Tue,  5 Apr 2022 00:31:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=uQmZYLR9goyVK4NTvAiz4FxQSxtTxOZK1NrmiM2IpSc=; b=EMnv5zcECX/6LDTAM2TpC6mIML
	D2ORB/1vnrjw1f9BYRKuHDf9o2W9hKzNY+rsjRkYBZcN8uzkGe0692t1aafjyinqasP20aUt/MUBf
	SYTFa4VONKgK32fritd7sfCjrjJVV/+RQ+26dLjRt/Phu4fU1phURAJA3y55beYOFeaRXsr+GKlVQ
	KMugstClWAcmLDpn6zt7mZdBFxgAGSa/wwd7i/x4SNoR5+x8+47Vur1O7FSQNKTMnyWLfElXc4mK2
	QHD/BJNnT/IVt3PRMeGortnD9zBLYDaxsFfr3U4gvIIzguYWzXIzcF3p1L34dhDVdPAAI7tickwC5
	lSzFdyNA==;
Received: from ip6-localhost ([::1]:48376 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nbVEV-009u5o-KG; Mon, 04 Apr 2022 22:31:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38130) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nbVEQ-009u5f-S5
 for samba-technical@lists.samba.org; Mon, 04 Apr 2022 22:31:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=uQmZYLR9goyVK4NTvAiz4FxQSxtTxOZK1NrmiM2IpSc=; b=zilO8gi+vYM65/jW4QFaXi1wEG
 9tRq52gn3yiHody8qO3Gcg30FQ1oN5te4iS7wZEIamzxFl9Ihn60AgJxRrQmMXchUbZGho8BqXAr9
 IyoZAzy4hcPP2cc3kjYGE7eycAOWAqY8FeAyQceWjGH9LwWjgXWNYmQz765gijPiEAgX/KMCPmdbU
 AfVoYdcUgIcHCboKQcBwtoNbBGaVeqx34yhx33X0GTAZEBO5HPVKCIvWSX74jz7qon6YVWwtkc7Wn
 DXpdWwVBHK1lIpiY0aRNnDpHAipDw/t7H8Eh796Y6+gvS7kJoBmqweNAjGu/qsLG3499ziTIVtD9U
 n0bbEVANhJ+uRZCTS66pFAKjtiqMGkBYrC1d+jBjg8BkLiM4ILpXS4OQNZRQkUEf6RXgIqDFS76eF
 5xtkFBAg5XA3s4gVPZ1h4c53ijtYqchgJMDA781ka0NnjDHSK6J9LNaWciOcxxZpgjdiGw5J5yG5m
 FKj4cBRXIGNJPoiSYG7yvpqv;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nbVEP-005JZy-1D; Mon, 04 Apr 2022 22:31:29 +0000
Message-ID: <5f048c2b3b9a93b653f19e2573b2f60ad4688af3.camel@samba.org>
Subject: Re: doing a test build of samba
To: Michael Tokarev <mjt@tls.msk.ru>, samba-technical
 <samba-technical@lists.samba.org>
Date: Tue, 05 Apr 2022 10:31:24 +1200
In-Reply-To: <81341b54-feea-514f-a2b0-3d0b4b5ffa60@msgid.tls.msk.ru>
References: <245e18ba-a620-6a19-33d5-8794f010a617@msgid.tls.msk.ru>
 <942d4519-909a-22d6-6e45-75b976a9f29b@msgid.tls.msk.ru>
 <2165e797b4fab04bd8b625b7b182bf2d9982d2d3.camel@samba.org>
 <81341b54-feea-514f-a2b0-3d0b4b5ffa60@msgid.tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: Mathieu Parent <math.parent@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2022-04-05 at 00:58 +0300, Michael Tokarev wrote:
> 05.04.2022 00:51, Andrew Bartlett wrote:
> 
> > > build enables -D WITH_NTVFS_FILESERVER=1.
> > > This one, in turn does this:
> > 
> > This MUST NOT be enabled in production, as Samba upstream provides
> > no
> > security support for this code, which remains because it is hard
> > work
> > to remove due to the support it provides to some of our tests.
> 
> How about just removing $libdir/samba/service/smb.so for production
> package?
> 
> It is not enabled by default in "server services" anyway, so in order
> to trigger any issues in that code (security or not), one have to
> enable
> it in the config first (server services = +smb).
> 
> But it is still not a big deal to just remove it on install, is it?
> 
> I especially looked at what's being enabled. I found this very
> module,
> plus a few unrelated goodies.
> 
> > If you want to do a selftest build, do a selftest build but don't
> > put
> > it into the production binaries.
> 
> What else, besides smb.so, is wrong?
> 
> > If Debian can't handle that, talk to Debian :-)
> 
> Debian can, but why?

Samba really doesn't want to make security support promises for code
compiled with --enable-developer or --enable-selftest.  There are other
#ifdef things, like fault injection (root-only I think) and in the past
we would honour more environment variables for unsafe things.

We try not do make it horribly unsafe, but I would be disturbed if a
major packager distributed binaries compiled that way.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


