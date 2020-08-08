Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B54223F7AD
	for <lists+samba-technical@lfdr.de>; Sat,  8 Aug 2020 14:58:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Rx8vULWgEwzJyGP4AFEwapZbOM4JvB8UohJUvdAKtf8=; b=D1R9b0sBqeuWzs5He61LzWbNcI
	zgpFVLTQPYtulRvkT4osYIo3vGy2VJJ+WefAcWdPcmUiGF3Sg8bRHSCKcBBiQAS7e2HmwD9JcIi5r
	5QllN0iFjZecp/2jreZbW9kHKXTJcRO6CbR0jkRt2hTNtKIsAHMxXUDf/m5Y1cPVM9vRCNugv53wH
	uozWHpAwgTsH1XaoVvAcolpO9S73p2AKVy7JbF/8uFzxgfxsAIYULENjHUjo8tHx3X2gxjSEPAMKO
	gh3ZPWpZaQocP1PG/iSbi9FMjbBx7ZEM4f6MTeRzwSpnSgqM/9LkohWUcLLmBmsWMcSUMeFFR6vd3
	PRN0i/CQ==;
Received: from localhost ([::1]:60702 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k4OPT-00CwHE-4T; Sat, 08 Aug 2020 12:57:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11744) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k4OPM-00CwH7-K1
 for samba-technical@lists.samba.org; Sat, 08 Aug 2020 12:57:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=Rx8vULWgEwzJyGP4AFEwapZbOM4JvB8UohJUvdAKtf8=; b=ZP7mbmAnCAkU4LHDeqe5UuQCA2
 3zX792Iend9lE0W7cyRZjxOWQtC2HLgdOFHq+qXJsLbLN6p+ohJSSx+nKLPz0X2yKPPdIvWsV22l3
 AwoiZxpM2cnTLJP+5/bhjKEUbQLom7NItpuI0G9FKi0b7+CJJCrDHJBHxQi8YdZlm/dCxCiuCRQtJ
 6+RMICy/Xut68S8L79u1XrULBfDLnz3/qvsVGYLwlfkaDGXOeflbG9a0FxApbh2bhOUHQAFPJb8QT
 tT4rlASyYeRoGgSs15ePxO3+hh4Fitkj+VAVnoz+9sUPUUHyAL8nQyfhxtNEC2s1axpxyDWe82LYJ
 zgDiNvgukyFVSukAeK++wC+YhhLui8YwjGHF98JgNo4kaK4ByQ8RuW/qLSNQqyBX/Kx8O2CenNd32
 LGRh0M4/t6C0w6q9USbhGDVvrHBlODI/PTibfBneJ6Y/yG3uY/FCRKDOay+wT+UBj54zDFYjt77DX
 if+MmhJ7NaB5h7xv5832wPJn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k4OPG-0006Ls-R8; Sat, 08 Aug 2020 12:57:02 +0000
Date: Sat, 8 Aug 2020 15:57:00 +0300
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Deprecate SMBv1 options and NT4-like domains for Samba 4.13?
Message-ID: <20200808125700.GA1200244@pinega.vda.li>
References: <efd53968d989fa5b909d5b23df58b171410970db.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <efd53968d989fa5b909d5b23df58b171410970db.camel@samba.org>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On ke, 01 heinä 2020, Andrew Bartlett via samba-technical wrote:
> Samba 4.13 freezes soon, so I wanted to again propose adding things to
> the deprecated list.
> 
> Yes, we add things to this list far faster then we remove the options,
> but the job for anyone wishing to remove features starts with this
> point, marking and announcing to our users that we are not going to
> keep every Samba option and feature forever.
> 
> So I present to you this MR:
> 
> https://gitlab.com/samba-team/samba/-/merge_requests/1398
> 
> No code is removed of course, and of course we are not going to remove
> code that FreeIPA needs, but even in between all that I think this is
> worth doing.
> 
> (pdb_ldap is not impacted, I've dropped those references compared to my
> earlier MR)
> 
> Parameter Name                     Description                Default
> --------------                     -----------                ------
> domain logons                      Deprecated                 no

Removing this setting affects FreeIPA. The logic for 'security = <user|auto>'
triggers PDC definition only in case 'domain logons = yes'. FreeIPA
depends on NT4 domains mode functionality to provide its hybrid AD
forest setup.

I guess, looking at lp_find_server_role() and
lp_is_security_and_server_role_valid(), I'd need to define 

 server role = CLASSIC PRIMARY DOMAIN CONTROLLER
 security = user

explicitly. Right now we have 

 security = user
 domain master = yes
 domain logons = yes

and no 'server role', so it defaults to AUTO and will require an update
of the configuration to set server role explicitly.

Given we are deprecating not removing it altogether, it is more of a
task to me rather than a blocker. I filed
https://pagure.io/freeipa/issue/8452 to update FreeIPA configuration.

-- 
/ Alexander Bokovoy

