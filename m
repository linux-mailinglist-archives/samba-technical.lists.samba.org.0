Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D9A9E5ED4
	for <lists+samba-technical@lfdr.de>; Thu,  5 Dec 2024 20:35:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=JL9cP1C0PtmOAm61cOgZ3AttE8JMwrWxnHgDcGq/aSY=; b=0n9NXLDZBQD9CZijHqLBSotC2t
	OgARgu2uoRsrZKZxroIwMylJS8iPtTqaCsr73mey/NeN8PI7J0I0JADccpkd+eO/FBqkrg+D70qKX
	4GMqkb3+ih9p66M5R1skrLCQ6FAf5/CymO6npWRUg6ErRYnYRdB2oMCBPRWJbSYnqWhD80mUNmq3Y
	9UUTlkqw5I8XZFdwIhpXvBEICl4rf5Dk+xazr7vquI/SpPKz1GfQfC7usR/H1up2OpdALb4PUshrJ
	U+QTJrhTyAcIY7+STQfYrmy6+Wlj63a9PvSdwHXVBoXpAKe/ywgoPHIw/hZorVyq5WdLJ2d2dr92P
	ZY1/IVGA==;
Received: from ip6-localhost ([::1]:61412 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tJHcj-003Ycv-QC; Thu, 05 Dec 2024 19:34:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21286) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tJHcY-003Ycm-1F
 for samba-technical@lists.samba.org; Thu, 05 Dec 2024 19:34:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=KJR47U9isGq5R4s6GAsG+aXpDgB5J2BljsP2LS+ngAM=; b=PZb8jyUmThu+q3O25M67wZ1O66
 Bc1hwLBeF27A9/LDx/LXddZ5qWcvRszw2hOucgYMpsiV3GIkER1Fhhog5gl+pP6ac5/UnY+tFnmKU
 9sZ0BarH9TLot4wMTaQFlf2o21XsqoBywI7rsIRvoiOvahtY1BK0VQq32PjPsjnSRP17kR2suf6fl
 0JNNMzZkfjv4Mj34ilv7za5JLfbLAxFWWzPB2x5srXGQ69EZEhKSCsNargI1bt9zbcWE9QCHifxHJ
 W63Qo1jsap10oP+1h9yi8FqKqWs90WE/Io8jGMghUfXdmrC7YDhFlSDuuXtLFOdo9eAKjcse1ugY2
 aqVmEE2d4Vql6sG3N6vWp+H9qmmtpBH1kQPW7rSNM2gmjUEJUVxTPy/m6d8f1Lju4b+X/4/J2WaN4
 qLeMr2/lkY4BtMmG8ouC0phyqNzq7HEkWhj1DIBLKuQSdv3aUQ38KqMRtZv7PJWmKDiNxz8OoTO9L
 icyTTJcAbKHD+d8SAaItgw4T;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tJHcW-0010Sj-14; Thu, 05 Dec 2024 19:34:40 +0000
Message-ID: <3cd8d2c57173a78464568022d6fdc9907648b5c3.camel@samba.org>
Subject: Re: script enablerecyclebin
To: Stefan Kania <stefan@kania-online.de>, samba-technical@lists.samba.org
Date: Fri, 06 Dec 2024 08:34:36 +1300
In-Reply-To: <0d73fa11-3e41-4125-99c3-b84bc07e527f@kania-online.de>
References: <da0dbae1-2fde-45ad-97b7-3b92a48dd9f3@kania-online.de>
 <20241205110511.13446bae@devstation.samdom.example.com>
 <0d73fa11-3e41-4125-99c3-b84bc07e527f@kania-online.de>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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

On Thu, 2024-12-05 at 16:46 +0100, Stefan Kania via samba-technical
wrote:
> Am 05.12.24 um 12:05 schrieb Rowland Penny via samba-technical:
> > On Thu, 5 Dec 2024 11:19:02 +0100Stefan Kania via samba-technical <
> > samba-technical@lists.samba.org>wrote:
> > > Hi,
> > > after enabling recyclebin with the script enablerecyclebin from
> > > thesources, there are no more deleted object in "cn=deleted
> > > objects" itlook like the objects will be deleted immediately.I'm
> > > using Samba 4.21.1 from the Debian bookworm-backports and
> > > thescript from the sources of Samba 4.21.1.
> > > Any known issue?
> > > Stefan
> > 
> > Unless something has changed and I missed it, the recycle bin in
> > SambaAD does not work, there is a bug about it here:
> > https://bugzilla.samba.org/show_bug.cgi?id=10403
> > 
> > Rowland
> 
> That's bad. After trying to activate the recyclebin, deleted objects
> are no longer stored in "cn=deleted objects" that's very bad. So
> either it should be fixed very  quick, or the script should be
> removed.For me it's just a test, so I don't care to reinstall my AD.
> Is there a way to remove it? So that could help.

An MR to remove/neuter the script would be a sensible thing to propose.
 https://wiki.samba.org/index.php/Contribute has the process.
Funding to implement the functionality correctly would be awesome as
well, if you know an organisation/sovereign nation with budget.  
Your friendly local Samba commercial support provider could be worth a
call in that case.
(To be clear, given the spectacular failure mode, it won't be a quick
fix due to the tests needed and proper tooling required for it to be a
production-ready feature). 
Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead                https://catalyst.net.nz/services/sambaCatalyst.Net Ltd
Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company
Samba Development and Support: https://catalyst.net.nz/services/samba
Catalyst IT - Expert Open Source Solutions
