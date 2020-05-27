Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 372131E377A
	for <lists+samba-technical@lfdr.de>; Wed, 27 May 2020 06:42:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=4zvPP+0hbAfj0TUZdnx6IovUSVOVPY/jia0S1P+yG0g=; b=ufq4cvcWAlXe7b3ycCEw7ra6k2
	BN74p3/4uqD/nSMWfBGG8s3KwEGfeawPlieNiX40mmWlWqLBg34g/d8UOytgwTDAK7KVoKnOXb1B8
	Vg/kdiSp4FVRsIdC6YsGxhjORaItK6PR9oV/AdbhVHA/sodctO+UN2HcPiDTWQSAZKjFaNkuuilUa
	PrInyojNL1LA9jzb5Erp47gCSeAgKgPBT0WIjUye3JU4wo3urBMk8B3L92TRHiDK6eXGVb5WLNc53
	vExCCYTQSt6Ehvn0n0VNGFm3SHPLy9v1k+C9SQMA2gmprdZWP+/AYBdJSpGPifwQhCqMC5F8fOZRe
	FDYf3qeQ==;
Received: from localhost ([::1]:46480 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jdnt3-0061ow-8S; Wed, 27 May 2020 04:41:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14268) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jdnsy-0061op-78
 for samba-technical@lists.samba.org; Wed, 27 May 2020 04:41:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=4zvPP+0hbAfj0TUZdnx6IovUSVOVPY/jia0S1P+yG0g=; b=cMtGU+xbgXd699sccMPGR20Mve
 qMhIvVvN36sFpAl7wASXNfNb46PFQmjG0yG/w0qY2igf3c8qKXdOvwt9RTDnkkDvFOcLuvfb9oaP2
 7j9mVv4u5dFuNtG87szZS28t0hy22P0yklJwq+64frOfQUulHejlmNrIfp3Om6a2vWHNFwEoKdpl4
 qA0yYaj5yvjFZLwqRSDHKZlKGnJFNgh0+NBxxIDutbFnnA75SyQFwgu8/Ao+LswKJ9+HK6XXgiQp4
 KUEWEc+odBuw3LgpdkxvPCB5IbXKoKEKeXuq5MMHsERjSXot3Ve0uBlCVofzJLYsKihUsgV6R/V6s
 V6QC4Q7khOT5w6in1hJR26bYDUaHCQaYOVA4WZdoTbpInvfpmg/20sRjxA3gYyb4cxPxzGuBAnSNn
 HNyfoo95cI/vBpl0XwdeLj/LplgWmqPs0Eq1qfd7Q+avjpuo0yu4Fn7IJk2p1sBLwMuEV+vyvei47
 sKBlMdbUnIKha28Gtz76Ibnf;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jdnsu-0001oO-Nv; Wed, 27 May 2020 04:41:45 +0000
Message-ID: <01157baedc07f140b5a253a1813137a4f16196e2.camel@samba.org>
Subject: Re: Schema updates and modern Samba AD
To: William Brown <wbrown@suse.de>
Date: Wed, 27 May 2020 16:41:40 +1200
In-Reply-To: <E89015B7-BFCD-4731-82F9-AE09FE73C52A@suse.de>
References: <6519f23f61695e09cc6c9aa9336f69bcd8010da6.camel@samba.org>
 <E89015B7-BFCD-4731-82F9-AE09FE73C52A@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
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

On Wed, 2020-05-27 at 13:53 +1000, William Brown via samba-technical
wrote:
> > 
> 
> 
https://docs.microsoft.com/en-us/windows/win32/ad/extending-the-schema
> 
> Generally, I'd say the biggest thing is that it's a one way street -
> you can add, but never remove, so that means your changes have to be
> very carefully considered, because a mistake can't easily be undone.
> 
> For example, if the ssh public key schema shipped in AD, the fact is
> has a "must" not "may" on the ldapPublicKey attribute makes it
> extremely hard to use in a self management scenario.
> 
> So my input (for what it's worth) is that schema changes should be
> considered carefully, and the consequences understood, as well as the
> ergonomics of how those changes will interface with access controls
> and that human interaction. 
> 
> Hope that helps,

G'Day William,

It is a wiki, feel free to craft some suitable guidance and add it!

Thanks,

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




