Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADD8950F33
	for <lists+samba-technical@lfdr.de>; Tue, 13 Aug 2024 23:38:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=9U+I54SwPVJXB+py4BVc91ybLyHJiQD7M7YZMAgg1oY=; b=U9kXW56OO3prFh8/QsxAfCwrCt
	ZPkv4NE7KMbubz78fFhXQfbewbsTiwRLThODX8RUGy/o9SShWHr8uZIbuYcB0rL3QXx1NXO9M+G0L
	gElVr2IQL4i4FReoK+AU591shjielGHqDwy0HhnKsh88Zapo5f/yQgG294qKYwcCPBh/C8sHM5EHs
	d0ga08OK383vEREbRX6Ci09CjEHJ4Lhn9Gv/mGbTd+VDo7yhDK1SaQPnLFEwxC6D4fQ2Sf6pSw8O9
	wgYb27rRwrkBiaPuQpmhzYvrxT6eYGhLt7lyVKAQyW4KrqgUHglf7KQY6JA54F2y7ILJbS2YIyFu9
	OVbASCdg==;
Received: from ip6-localhost ([::1]:37518 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sdzCX-004XW2-Ez; Tue, 13 Aug 2024 21:37:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50132) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sdzCR-004XVv-QF
 for samba-technical@lists.samba.org; Tue, 13 Aug 2024 21:37:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=9U+I54SwPVJXB+py4BVc91ybLyHJiQD7M7YZMAgg1oY=; b=i+Ps+FbgEn19wvUXlgsWZ1PAwR
 T9xQNuG7Fn+wz5i6XMezDC/LUR04G9UszNekqPjXrudtbMRogylOK7mtxQ+p/AerNRFUk909NY1i8
 R0jff8SqPGY0xv+zIaKwB3BgDe2ApopOIEkK9tsekWJ2KfyrGdsjz+DJGfRTFyXovrnTNkLJ+DTu7
 NkzNj4An8c1bxWSMUGyFdPTHb0IeZQYkOATR2lZwXBf9RpOBDV2vAEk0KKrmrwLJtFgqzA+Y6ZnRd
 KSmSNYSN8+slm3Q6vIOBlmPZoTVlkigdzE7Fd3a11h4xOcg3PoO0+ngQtawMPNFPG9SAguwbyywAb
 AwZlvoj3nMldD8BZ9ysv7MHvGcFWJl5LTJtD5P4QBFv9Mqs21NMu7ro+Y0f+V8caEwO2LjKMBMp0d
 8gHbMQSkycpt7LxozWKKlxYxsPfSeCiIIrb3rO56TR2JbarkOgDs8KqkGSXkhYkh9AjNZF16QEMhv
 fnUYJRJEpj7/pQA5jd3VydfM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sdzCP-006IVC-2P; Tue, 13 Aug 2024 21:37:02 +0000
Message-ID: <152c8c281bbc91a0a2eb6152c107be055bc553d2.camel@samba.org>
Subject: Re: CI can't reach internet to fetch rust packages
To: David Disseldorp <ddiss@samba.org>, Andrew Bartlett via samba-technical
 <samba-technical@lists.samba.org>, David Mulder <dmulder@samba.org>
Date: Wed, 14 Aug 2024 09:36:56 +1200
In-Reply-To: <20240813012257.4efbe77b.ddiss@samba.org>
References: <37323893-503b-455c-beb6-fede11a44eb9@samba.org>
 <0ef42b0d9fda725ae617220b19abdfbcc416ee55.camel@samba.org>
 <20240813012257.4efbe77b.ddiss@samba.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2024-08-13 at 01:22 +0000, David Disseldorp via samba-technical 
wrote:
> On Tue, 13 Aug 2024 09:37:59 +1200, Andrew Bartlett via samba-
> technical wrote:
> ...
> > If you want access to the real internet, remove the socket wrapper
> > environment variables or otherwise disable it. 
> > But also, don't do that.
> 
> Indeed.
> 
> > At least in the past, the autobuild host does
> > not permit outbound access, so you will need to work with the
> > sysadmins. 
> > The preferred pattern from our C model of software development is
> > to
> > encode dependencies at image generation time, and manually install
> > on
> > the autobuild host.
> 
> "cargo vendor" should allow you to dump your (hopefully audited and
> trusted) dependencies in a directory somewhere and build from that.
> Would that be an option here, David?

This is also critical for reproducing historical builds and providing
long term support.  The upstream URLs make break.

This is why we keep all the old GitLab CI container images around from
the bootstrap system, while they should be able to be rebuilt, we have
had issues as you might expect. 

(I would love it if someone would implement a backup system for those
BTW). 

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


