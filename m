Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9322A381772
	for <lists+samba-technical@lfdr.de>; Sat, 15 May 2021 12:02:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=vkWAWo9SK7oLtkypj7hNnJO6ww9JD5wGAMYRxxnmg2c=; b=JXGX63AYK6guVUg02jm9iKA/Be
	JSU0xMn/nCR+twfaU5g5/SEiAbl1gqmV42BoF+p764/kaoswE2rLY/8cOFAVWzWAysaZX+ijjKMZj
	AShb9mLQ3xRqVCtPHfpfIJOH7eLRaGNqFyZOX0VWpBG+aWl7ovZoGSUomoqQ/cGVaoIITR0KXxz/Y
	ZJFt2POYgRczRdqlDSuT6/dUGRYdg1IwqL7ct0kZSfKGKVPlupJouXc2mTVoFkbbtA1Vpx52mvPCC
	BwGcRAZ2sMVIFa0PJHYrWNI721PVhjAVY5yngK3E7rO/mlHqe7U5D4TminUMQyiLiB+lDcjsCDs2x
	DNX6TUlw==;
Received: from ip6-localhost ([::1]:24348 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lhr6c-000XDA-TN; Sat, 15 May 2021 10:01:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42504) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lhr6V-000XD1-6H
 for samba-technical@lists.samba.org; Sat, 15 May 2021 10:01:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=vkWAWo9SK7oLtkypj7hNnJO6ww9JD5wGAMYRxxnmg2c=; b=ZDqN8AOoYwbr7kZ9qoQ3y3kIGN
 oMEf92b0Pd7Qog0lM/FVP1P8xhLklDaseEB1cxgPHabxB0V2DCBznppaIZU+WgBuXrnrT0FITAlle
 vWGQaxgqisi08zcFEBCgP6FgI2yY//b2LGnVuhoRqVREipHqFkoBdntQmpJ9qWFzjeqkc4+gGoE16
 PXfdc/J84D1hOWfZYdihKN5Djeo1XmqDPNsDxkv0cERF4MxdNqDPibB/3ML6YiYFK4b6k0qgFs7Pv
 F0MfLmKTrpd4kKFkcCMJ4PnZCCa5h4Lw2s/0e5fJAU8abzgY48eaXgSNX/Js5QaAFx5Z5+OKwIiyf
 n5Jz58Nu4UQ9uGEB+vmSzkTseLCuFw0hUkc+FrRi/Y020gcXZXq0WNufyKU+kcjam8NsonUzoWhwY
 hNCXoC79qWtzUCnD/3wl8oDiDRLXlPW0/Ua8+S0ZMZtZAAj80Uib/V+ClADBxoo4BHsd3/fYowbqb
 5skA5QrcK7cy4pFrX3n3x00b;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lhr6S-0008DT-Fy; Sat, 15 May 2021 10:01:01 +0000
Message-ID: <05617af410b2b25e8db84ad05ad5790362672a47.camel@samba.org>
Subject: Re: Kerberos raw prototol testing
To: Stefan Metzmacher <metze@samba.org>
Date: Sat, 15 May 2021 22:00:53 +1200
In-Reply-To: <9d6213a6-3163-fb45-d443-e8ecd6abd9b5@samba.org>
References: <3663e2d45ad7855b807286d4d45bba7ef450d9a3.camel@samba.org>
 <a377c5a5-225e-9fc4-a70a-c52145732121@samba.org>
 <30ab21963ccb18678de20e7814e97e8e4b13f3f3.camel@samba.org>
 <b08f1fca-9a92-ba28-5515-7918522dc5ff@samba.org>
 <a2a22a8f0c59a86f0ad7f659b1e4d6201a6d7601.camel@samba.org>
 <0085446689a4dbeb12d45ee692fdfb1b52ddfdb6.camel@samba.org>
 <9d6213a6-3163-fb45-d443-e8ecd6abd9b5@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 gary@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, 2021-05-15 at 10:46 +0200, Stefan Metzmacher wrote:
> Am 14.05.21 um 23:37 schrieb Andrew Bartlett:
> > On Mon, 2021-05-03 at 12:33 +1200, Andrew Bartlett via samba-technical
> > wrote:
> > > 
> > > In this case in particular I've checked the diff and other than of
> > > course the pycredentials fix (thanks, obviously good!) this really is
> > > quite fine squashed. 
> > > 
> > > I'm also happy if you keep some of the early preparation patches
> > > distinct, eg "python/samba/tests/krb5/rfc4120: better etype
> > > dissection"
> > > but I wouldn't spend much time beyond that. 
> > > 
> > > Please propose it squashed down and lets work to get it into master. 
> > 
> > I've done the squash down here:
> > 
> > https://gitlab.com/samba-team/samba/-/merge_requests/1953
> > 
> > Is this OK?
> > 
> > I can fix up the MIT knownfails if that is the only blocker, but I also
> > need your sign-off, particularly as I've written a pile of the commit
> > messages for you. 
> 
> Thanks I saw that, I'm in progress to go through them, I'll hopefully post the result early next week.

Awesome, thanks!

Andrew Bartlett

-- 
Andrew Bartlett (he/him)        https://samba.org/~abartlet/
Samba Team Member (since 2001)  https://samba.org
Samba Developer, Catalyst IT    https://catalyst.net.nz/services/samba



