Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F09913953E5
	for <lists+samba-technical@lfdr.de>; Mon, 31 May 2021 04:30:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=P0bNX/VhZoMMPPUziGJKI/0dghVE+WTDJZsYDk/YuUA=; b=M5ux4J0wbapN0EY0ItZyJ+jPOn
	NsMewXkdo9XTFJ2UK+89qojK3ZUaii3HMi8ITfO10Y44qu8WxPMEDEY4aG7eVuIgCru9KkbANHkhC
	+hWjsR4oi6h1kkD8oGr52wMcv1FJcEoPnw92wdfq5i8BSPEVfC3xB8zEXww4CGkJoDvAUAWRz6xhz
	D6cFEKezWjRXsgh7ihcLy20f+wlbVcVEXaf/szI5fB4aW538y/BKm6FsD0Ef7AzobSTWNEn2mwZJb
	liI0yiHiHpJLV3TEmQLfFZqixsFprTGKkIog32prUssWBWVUXDlKPxLbZpCj8G8ee9mStdKQCGm49
	WiVY4rWg==;
Received: from ip6-localhost ([::1]:44102 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lnXgI-00020Q-O2; Mon, 31 May 2021 02:29:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29298) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lnXgD-00020H-OM
 for samba-technical@lists.samba.org; Mon, 31 May 2021 02:29:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=P0bNX/VhZoMMPPUziGJKI/0dghVE+WTDJZsYDk/YuUA=; b=yDZxMaucKn69zBv4yxOfhIirFC
 5E3GV4fcXG41vLO2KkT4uTyKMc7JCXbaaIg7xuZrXYSw7q04hiM8BDVFQFWxXZz1Olgeu6pNGb0vJ
 +ADe/w7ULX/34nSVKfmkgc1zzVpw29l4PWRSTNnJFU6VorhOzAE6zi86iIZwXLCVazHv4a+K9avvd
 TroD7AuKFBzZSa9I5+U1Lg7eUdi0QD+9grWv/DE5KepH29mx8zKMzpUIEuLQePTCa/Flw2CPKUXjz
 w1gRG6NUe1oMQMxpxQC/sOusbi9em3kL5mWCA87Pa3h6q2QtKjQL/vngHuR3YRKFXsZ3b+zDTpjxh
 91WmG7NgAjoVGJdXZllAzJgGE90JYDLzLPq5kizFD2gMDMQs585CUG/wA2Am8j0/PwGJTiSYKaUHA
 W+PEQNyeYFSNEh3VLPs4UQX5az8wn9dxcQtwETZQivlFPC3HhtWRLOv3DbioFRsQ+979N2P9HBw5F
 6+5GWBhRf2uAmQhTkX+iecz4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lnXgC-00051N-8N; Mon, 31 May 2021 02:29:24 +0000
Message-ID: <54a0103bb925ebc76a6dd94829349adff7d94863.camel@samba.org>
Subject: Re: JSON input / output for CLI utilities
To: Andrew Walker <awalker@ixsystems.com>, Ralph Boehme <slow@samba.org>
Date: Mon, 31 May 2021 14:29:20 +1200
In-Reply-To: <CAB5c7xqZ3OAB4YJDsU5tj9GAh+j4KiYUz_5wwOG1xeAkFcFH9g@mail.gmail.com>
References: <CAB5c7xqUC9mZ8-VFDmM44b=EL49yBiWkMikf8BWgU0FjC+25MA@mail.gmail.com>
 <562c85d7-c1d8-c978-6136-3ca538d12857@samba.org>
 <CAB5c7xqZ3OAB4YJDsU5tj9GAh+j4KiYUz_5wwOG1xeAkFcFH9g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, 2021-05-30 at 21:14 -0400, Andrew Walker via samba-technical
wrote:
> On Fri, May 28, 2021 at 11:15 AM Ralph Boehme <slow@samba.org> wrote:
> 
> > Am 27.05.21 um 23:42 schrieb Andrew Walker via samba-technical:
> > > I know we've added JSON output to a few of the CLI utils. Over
> > > the past
> > > year or so I've added this to various utils in FreeNAS (using
> > libjansson).
> > > Is there an overall strategy for this? I'd be happy to upstream
> > > what I
> > have.
> > 
> > I guess as what you have worked for FreeNAS/TrueNAS and unless it's
> > somehow tailored to specific usecases, it should be good as is. :)
> > 
> > > Also is there an effort to add support for JSON input to them?
> > 
> > Not that I know of, but that sounds like a nice addition for some
> > tools.
> > For which tools do you have JSON input support?
> > 
> 
> I'm in the process of adding support for pdbedit, net groupmap, and
> net
> conf. I see one of major advantages of JSON input support for some of
> these
> is we can trivially add support for batch operations. Libjansson is
> quite
> easy to work with for doing json input via json_loads().

Cool.  I'm really excited to see this expanded.  It is awesome when an
idea spreads beyond the original developer's narrow use case like this!

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


