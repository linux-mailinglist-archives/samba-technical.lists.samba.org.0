Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FB85293DE
	for <lists+samba-technical@lfdr.de>; Tue, 17 May 2022 00:56:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=oJA2b/cwYk+dUeNb2ChROR636DF99MpzjGPtbbaCkCo=; b=cyv8RlNfYiJyN9BIMgwUMbUszU
	RWzoq2m6a1nObeAzh0Ed26ZSz0bEleXjy+8BoUneaW3m1WmRHzteDBAJpgUIzSC9hZyMEIYHPD5bg
	Z48U9CNIKvfUGhYXHK11koTTrVDh5MEB8LKR2DNK08rZffqqBVZLy8klulv6CVavK31E/nBId55cv
	Wa4XGtRChY3bKgUrvkbnLY0ACYS7tweYW96bW4x8gr9olkw5euEl8PvLmDHae2p9cHXhfUVsgrGxb
	ODCtAArdnoei9kGcEZNzI7Au5dIqW1gKT6V7hbyCu2A+Jbm5Eb6Zgkykz/esqtzXOFwvbO4edhcP1
	V2Aqo9iQ==;
Received: from ip6-localhost ([::1]:51878 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nqjcu-001fIa-RH; Mon, 16 May 2022 22:55:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61618) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nqjcq-001fIR-Jc
 for samba-technical@lists.samba.org; Mon, 16 May 2022 22:55:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=oJA2b/cwYk+dUeNb2ChROR636DF99MpzjGPtbbaCkCo=; b=mw8bF6J4oNyNxjI6FH+hL446Rl
 jMhveJ516RCMYii0WfZElQwdbW1y6RIVkVjW9v5igqaZe/NWCb9M3aiymcowZtJ9PcSisK9LeSW4S
 6yV19JROKVC7SHruxVAA+rXlzwEiR2/wu2g78F18LkUm7a9SMO7NQtZcejYR9xSl84ijqsLqfPNvK
 oT2SEOXh2+DNv9B/5Jgy0zX1xnERpNUNN6GglBcLlRqBMRdQ2zCKTCV5c9L/OmYR/gme9EMp8eDcP
 E++/3ho8OKxSLuEZfFKB6qnc8s0y65dZ+hD65nVuVEuoW735BJxkYWRQuIQNz3WCXUGQZY68j5iy1
 Sw2lnLjTTRk7QkNmbFbI896iv05nIbC7KpW5/6FjlXgMCOpR0viSKV+6KfhndP/UIXymDDH42SDdI
 G6jHljH4PW/wbhqB4InFVfynVGFMd+0izgrO9rcpERUR1ubNO4+33rqvYv2+7CNYxm3wkSkNQKofn
 4aVo0EEk3kgUPXUHoLM519bf;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nqjco-001DWk-S6; Mon, 16 May 2022 22:55:39 +0000
Message-ID: <eb8c4f632adbea7eaab7edc87115ae6143092c88.camel@samba.org>
Subject: Re: A blog about my "Dollar Ticket" attack (Nov 2021 security issue)
To: Nadezhda Ivanova <nivanova@samba.org>, samba-technical@lists.samba.org
Date: Tue, 17 May 2022 10:55:32 +1200
In-Reply-To: <7f196939-bd37-7dcf-8a5e-54c567175642@samba.org>
References: <527f79427e6de47e8e367596ebf4795dcbb16e36.camel@samba.org>
 <7f196939-bd37-7dcf-8a5e-54c567175642@samba.org>
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

Thanks.  It is only looking back at it now, with a bit of distance, can
I really appreciate it. 

So Thank You, and thanks for your support along the way, it was great
to have you on this journey!

Andrew,

On Mon, 2022-05-16 at 15:08 +0300, Nadezhda Ivanova via samba-technical 
wrote:
> Great article, Andrew, thank you for sharing it!
> 
> You and the Catalyst team deserve a medal for your immense effort
> and 
> your technical brilliance on this issue!
> 
> On 13/05/2022 09:22, Andrew Bartlett via samba-technical wrote:
> > I wrote up
> > https://www.catalyst.net.nz/blog/stay-curious-lessons-doller-ticket-security-issue
> > to explain a bit of how we got to the big Nov 2021 security issue.
> > 
> > I do want to say again a really big thanks to everyone who stepped
> > up
> > to help us in the rush up to November last year.
> > 
> > Also, here is the puff-piece we wrote up regarding finding the
> > issue
> > https://www.catalyst.net.nz/blog/catalyst-samba-team-fixes-critical-microsoft-security-issue
> > 
> > Oh, and one last thing:
> > 
> > https://msrc.microsoft.com/update-guide/vulnerability/CVE-2022-26931
> > 
> > is credited to me.  Fun times!  MS hasn't put as much detail out on
> > that one, but I'll talk more once that is public.
> > 
> > Andrew,
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


