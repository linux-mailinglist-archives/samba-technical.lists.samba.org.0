Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A91443B9A85
	for <lists+samba-technical@lfdr.de>; Fri,  2 Jul 2021 03:28:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=RuDZAvavN/OtIzkrpCeLDz6Ju/E3HPdz24TIegeFoT4=; b=zr6l5CpSQpAl07JxnbSL938RlG
	jbwsHyQdRRr699jI5pNJ3AMNoMY8kQ2uvwwicT8kUCgf9K6S8i09eyjfZG/QDZU5dh4qYnsiPYq5W
	ixlgsW9ePMuRR2is5wWaLTlGtfcH682wyNcHWdJdv43JXg7BoD6nW8XOLQ6MCHpYM2VZGCzz7JAwx
	nJvd35SpUj9SeVQe4haVNzljcohFCEiITIIU/flwkxC1vioYk8Ja1py5q/JdiUL7PilRDUQ3I13/a
	lJh2PttSVblzG16rI4ne9pNwi1isKQt54eqIyUYs/cNEXXSx8UHsNfP2eIbKeqN/oka0LtSsD6fc5
	2AHXWA5Q==;
Received: from ip6-localhost ([::1]:61608 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lz7xS-00Be7m-4n; Fri, 02 Jul 2021 01:27:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39748) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lz7xJ-00Be7d-PY
 for samba-technical@lists.samba.org; Fri, 02 Jul 2021 01:27:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=RuDZAvavN/OtIzkrpCeLDz6Ju/E3HPdz24TIegeFoT4=; b=CuzG3y/f9AE7ZIkLy5Gpxr+pPt
 KKGVFZow6so0JZ1msKxGO75KRzk+qjkw9t5KG59F+AnryWsxkJ4oskzpAm9l0j0HbvVb0e0LIT9Hi
 cL0g2rK82OmGaAPx2WHtssuzPFy057S33dcXAn4q8efvLW3ziEYtQ9FQJJvCiyzHzY7+Ec18/mEje
 jeNGjfipoCM/Es3SMGXfFYwpstycu+JA6Ha39iBeY0t7GDSe+PjhqDdepJ97Ebd2BAKkwrm1RMd1v
 idhpOS3JBpvGK3+XVYH5BEKSjdt4r/D+XkwwrgSLZm/O+tv+0z9/OVOhYacHSqqkF7fIX3TSEG9L1
 gqgb2iCZYnlwNumpThLGaTqNOqHwZB6AkP2FjPRlb1phde1lN7ExyI7BvqK/B1Y6NeMkvTa2J6/J6
 PGptaRmUrqSvcBbDyuen8xh/vMHhQCTbacfNQX1mqgcd5YHCDBA9+x8VKT5iDYKd+KD/JvtK/2Waq
 kcJ4P3gqrPKtQ3VEqPLcR/PM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lz7xH-0007mB-Vh; Fri, 02 Jul 2021 01:26:56 +0000
Message-ID: <d16ec56b50d93d52f39cfff40c4e42bc7b6f593c.camel@samba.org>
Subject: Re: Given PrintNightmare, should spoolss go the way of SMB1: off by
 default?
To: Andrew Walker <awalker@ixsystems.com>
Date: Fri, 02 Jul 2021 13:26:51 +1200
In-Reply-To: <CAB5c7xrm79T2A_bL2DNx+irnv1s95PNhVrf1ZPrmsH21nHkFHg@mail.gmail.com>
References: <e95c3ab28e222f9e5edc8eb6993cd34fd862a3ff.camel@samba.org>
 <CAN05THQbpJQbeRrt-rAF6K0tpnqRi9rRrg8xRxA34d=_Sy9EKQ@mail.gmail.com>
 <CAB5c7xrm79T2A_bL2DNx+irnv1s95PNhVrf1ZPrmsH21nHkFHg@mail.gmail.com>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2021-06-30 at 23:39 -0400, Andrew Walker wrote:
> 
> We've had it disabled in FreeNAS for ages. I think it's an easy /
> quick win to reduce default exposed attack surface. 

Any chance you could work on the patch to disable this for the next
release?

I can help advise, but just need to be careful what I promise to invest
my own time into.

We could add an alias with a easy to explain name, but I'll settle for
the default being changed, selftest still working and this all
documented etc.

We do need to double-check that it makes all printing code
inaccessible, via all methods.  (The manpage is a lie these days, as
everything should go via spoolss under the hood, but do check). 

I would love, later, if we could actually compile out the printing
code, like we can compile out the AD DC. 

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions






