Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0887678A34B
	for <lists+samba-technical@lfdr.de>; Mon, 28 Aug 2023 01:07:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=tykSuDPV40DpeTFDFs3ZJIuvC5bt8yl5Y5GMhzO2Tuc=; b=fO3IKjw7D/Z9fjHOCNfdbtgtuJ
	4hGQYlHiyiUjW2nHrMABvbkDE3Iwxl8C8iUu24r1/PIDC4v1O988EY5tJKV0Wxh7XQBgaMq3kclOm
	Y1uWb4m7I7KCy9E0FJqvJcf31mvgb510xhZTemIKqcZNhcQkQVEkgF631ySQGncOUCGO8f9Eeoglc
	HfwYGwvEMXDCKf1sok43e5nSJ85P7eX75mVRLIlmtsOjvPsGbZBtEwPYQOa5C+Ygi+8mtzmXrJ4AD
	yo7l6sNud0EQrEDZ5nAa5sdFDQX8yl+F0t4ZKitiHjm/KcOPl4TcF6bFIIEsZLjwG4xRA3cPlXOU/
	pLm7Ue8w==;
Received: from ip6-localhost ([::1]:28782 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qaOqR-00Evki-BV; Sun, 27 Aug 2023 23:06:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51240) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qaOqL-00EvkY-73
 for samba-technical@lists.samba.org; Sun, 27 Aug 2023 23:06:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=tykSuDPV40DpeTFDFs3ZJIuvC5bt8yl5Y5GMhzO2Tuc=; b=DYbwv2E5DRdGIT64H83EWh3sQQ
 8XbB0DeYjeOMpiENLNlYH8x30pmLZPKQSQWcKfaCPBvQNl1Ls5/7Hz5ZrS2iAOap1ZKNZB7SM3Waj
 LugdpHV8oY8VzY22s6EVEG82NpWzgWPuUFhihQKOWzNxzRx4K80g6HbY5UrtfkAoFWPLGniJ9ieuo
 RNhJ2uAQ3aRV8OonHWrjewCqSZiuyHQCeZVuPabBhwCr6AfwqBxbQG4euw1kTCfhyqSPKpKcnqsrk
 w82Uq+YkoHEStzF8bXLkZX0AkpE9yNiMsqFR1VkQCIwyHADZFt3Jd+LRoa443IjNTsoySe+BeYieP
 xEcd6MFDeLOETW2Zh9hCBDNUStHVEl79vknc9s85FEOQW0YKQbUL39P/8cCp1OtYjSGboZfYPArkY
 H8LygJkZrRtADHn0QFttT3RkFIPQ0pcDLYRdLE88uuL4hgY3j8eUpFyJkkb+0UoNwIXGYI4Ye8NB9
 JEfklMkBIp04JwVtLtXpfx9Z;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qaOqI-00AEqq-1O; Sun, 27 Aug 2023 23:06:52 +0000
Message-ID: <0e661725920d0ba58d5302d68354271cd5f929e8.camel@samba.org>
Subject: samba4repo for Amazon linux 2023: Any notes?
To: Nico Kadel-Garcia <nkadel@gmail.com>, samba-technical@lists.samba.org
Date: Mon, 28 Aug 2023 11:06:46 +1200
In-Reply-To: <44cfcdc452be42ee85a277c6ead6c7e06a59263a.camel@samba.org>
References: <1430d5ec-f2fb-7021-0aa2-2a759a0dbefc@samba.org>
 <CAOCN9rxbcN85rbz4YcP4815-YYLFDAmpsOjxwgspVHtHsjnzsg@mail.gmail.com>
 <44cfcdc452be42ee85a277c6ead6c7e06a59263a.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2023-08-14 at 08:43 +1200, Andrew Bartlett via samba-technical
wrote:
> On Sat, 2023-08-12 at 17:59 -0400, Nico Kadel-Garcia via samba-
> technical wrote:
> > On Mon, Jul 24, 2023 at 8:29 AM Jule Anger via samba-technical<
> > samba-technical@lists.samba.org
> > > wrote:
> > > Hi,
> > > Samba 4.19.0rc1 is scheduled for Friday, July 28 2023.
> > 
> > I've taken a shot at bringing this over to Amazon Linux 2023,
> > alongwith my RHEL 8 and 9 tools over at
> > https://github.com/nkadel/samba4repo/
> >  . Unfortunately, the bits
> > ofmissing dependency get out of hand *really* fast. so I'm going to
> > haveto set it aside until and unless Amazon decides to port a *lot*
> > moreof the Fedora release they branched from. It's not the first
> > time
> > I'verun into the problem. If anyone else wants to take a shot, I'm
> > happyto post my notes.
> 
> I have greatly appreciated your work here, thanks so much for your
> continuing attention to this packaging effort.
> Your notes on Amazon Linux 2023 would be very useful.
> Thanks!
> Andrew Bartlett

Nico,

Any chance you can post those Amazon Linux 2023 notes?

As you know I did some work in that area in the past. 

Amazon Linux keeps on being just on the outside of Samba's easily-
supported and CI-tested distribution set and it would be very useful to
keep track of the details and requirements there. 

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead                https://catalyst.net.nz/services/samba
Catalyst.Net Ltd

Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company

Samba Development and Support: https://catalyst.net.nz/services/samba

Catalyst IT - Expert Open Source Solutions


