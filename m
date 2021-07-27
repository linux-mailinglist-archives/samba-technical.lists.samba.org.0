Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD973D6D7B
	for <lists+samba-technical@lfdr.de>; Tue, 27 Jul 2021 06:33:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=7isPE2D2xUM23UHZI5arb/TQySg/itjR6jN1GV5D5S0=; b=Gu1avkzI0LYhptjQKgW/bp0hua
	Zwv8TNHJLCJNyjPms8BeukubR2XGDr+dGMyQgzbMrGuYrfMo6dM/M6ewtfSWVDw2TCvndxP0r0U4R
	n9SPlaKD1Bd4ZbKsPXUqxxxSU1cc8cHJlp+Ru0CzCxpZwCDKwfDEDxAnbzBlg6yWp9BN0UrIN9ute
	OhGPNpodNcDp/UEqC1uMicmcBvD1fOy20QPezZHhqbpRSrBrPN8ItZJ9mLgsQNxMxVKRokza0fPOS
	pWRrgZ0HWoCUyddcrl9KgVlEA8LXZQFve6kCL3CNyZ2mRm+ex6rn1MBvmxQ0j70GwpI1z7RbH0FzV
	ZAUgWCag==;
Received: from ip6-localhost ([::1]:61068 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m8Elx-000z2w-9N; Tue, 27 Jul 2021 04:32:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29602) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m8Elr-000z2m-8f
 for samba-technical@lists.samba.org; Tue, 27 Jul 2021 04:32:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=7isPE2D2xUM23UHZI5arb/TQySg/itjR6jN1GV5D5S0=; b=ZG50sw1GTDH2ZBddYszyTNu4fd
 rn+q94H310u3rDpek2nuyBWafjOiJBCxMwjAUAJ+3G2PFwVuVb0H9LoZiTNY88zViUkuAN2Mn1R/w
 v0fqEo5MVWSpLt6vEtCGh3vI35k6CCCDFdBanUiZCwSGCpo15VkTwhtZKRA+rVNePpMJZ1acYHUFs
 I/D8flenU9LRxkROLKwlrCoE3Xg8ZhMQ2Vn09+J118vS2DbZ4RMTmgo0hlVKsSRM0gTGvzqyGr6Gi
 zVw0kJvQnW+4HkGowD1pZSVcpaQohat7q/SYXdmcZtgbOTJdxb2vhFMh4Swg9ANPkE4nD9en3h4k0
 ub4yFNeJrUrGBOk9RTfLVZtjkcJlyAzPt2vU0dUYV1BVkEQqiNVuI7ShOFdYj5y/IasGrv6qTNVCM
 RmF3SKo7TtCLfEbtFIr+Gf4NytLQR4wANb5OyLE5lo34Ua+TICWOl3NpprtNzEjlvKxlk2ecv6C8z
 PpxpPYtwHJ3GwV68QTFyIMOK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m8Eln-0003jr-Ca; Tue, 27 Jul 2021 04:32:44 +0000
Message-ID: <25b9a0f2d3563ec8d21465fe3aad11e00f4f50e1.camel@samba.org>
Subject: Re: PAC Ticket signature in Heimdal
To: Isaac Boukris <iboukris@samba.org>, metze@samba.org
Date: Tue, 27 Jul 2021 16:32:37 +1200
In-Reply-To: <1994c456624dc6a714a95b76151208abab432a73.camel@samba.org>
References: <3114701225467154473e2ad34c5ffa4b943cfc86.camel@samba.org>
 <1994c456624dc6a714a95b76151208abab432a73.camel@samba.org>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2021-07-23 at 17:34 +0300, Isaac Boukris via samba-technical
wrote:
> Hi Metze & Andrew,
> 
> On Sun, 2021-07-11 at 16:20 +0300, Isaac Boukris via samba-technical
> wrote:
> > > > https://github.com/heimdal/heimdal/pull/767
> 
> I got it working without changing the plugin api significantly,
> although it could be simplified as suggested. While it still needs
> a massive cleanup, if the logic is ok then I think it shouldn't be
> too hard to get ready.

Awesome work, thanks so much!

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


