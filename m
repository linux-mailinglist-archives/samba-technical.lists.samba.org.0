Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8333305BA
	for <lists+samba-technical@lfdr.de>; Mon,  8 Mar 2021 02:59:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=TsMHFM+rqoTz8RaLxV1XeJDfdO+Nb4+pqQqP7grkZ9M=; b=Asave0aVpm9OE0oU25Uy/TOBOs
	eo1tqBO4uCh0eaYeWeuxGCobPhvFIFMOXeAa8FmW7rVppXcS5/xchC6Ym6YIdBgvWzKhemmCU0KXR
	CWlk7j1QoXNIvER2BMmz2yMp/PiXASvTk1LKTN7QEWP2rRPYt3Rsj2A4MV3szpe2+GAjHiw3JtLL/
	1Io+wxjydOIHGVu3GAvVwzYR37VqKFQGQoQvX/lu7MWXKuqTsR6RZol5DxQ76Mm089nj7nbM0JIch
	n2jpZQdVVYzYpdHanZAOYnnPaFlbyXWXfbTRa6xbp0P9kmy7FH2vvbJeRuSOs+QhjVMZnFFJN6XD3
	eXQxbrVw==;
Received: from ip6-localhost ([::1]:27222 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lJ5BF-004SSX-SU; Mon, 08 Mar 2021 01:59:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61580) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lJ5B6-004SSQ-Nr
 for samba-technical@lists.samba.org; Mon, 08 Mar 2021 01:59:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=TsMHFM+rqoTz8RaLxV1XeJDfdO+Nb4+pqQqP7grkZ9M=; b=FYcJMeMemkJF5B977YR5XZ9BVg
 K0anhbr1yHeYzuVosvVVtLytVkjP7DP7thOtvcm58ybX3ABoJgui1tLZoLx6WdOdNbzq7xTlYunGH
 1nG4kPbREXuKJ7FLfl7BWnoUEgtz5YYeNElnS/JMQAeWCnu7+zQLDZerQEnjaBKpEUMm9cvp3xrJO
 0SPmgzDdZ1PG41zfCD8kqc2BkrjyqqGxBU1kAg02VpASnOM7youCOZ5PEI29iEwT9KLJt0onz2c3K
 yB7BDGi51zKA2/sQKCGCs0rDR49ldL4VDSEJrIlfv2B48ioTQ2wy7BdloofPQAanqBjgIhMqg6hue
 Nz0twH0XhbR1/1kX15LpquBiMuxyr2VS2/dUe/DFs+eDKmCXy3obqgRk8UFloxsQm0BgF2XIN2daK
 RGv0v7/yJHKMW/rSsiJ0ipMVYbdxk7J45mowgwimQEp6jVBBPqUVat4Zqc9zPp3JQPYR8w6Ss8UP8
 JDQf4JD+88IN99vUowW5BYar;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lJ5B2-0004HA-PF; Mon, 08 Mar 2021 01:59:21 +0000
Message-ID: <b6478095e3ece98b9cdbf1c7579dc1041d1fe4ee.camel@samba.org>
Subject: Re: Commit 996560191ac6bd603901dcd6c0de5d239e019ef4 causes strange
 regression
To: Martin Schwenke <martin@meltin.net>, =?ISO-8859-1?Q?Bj=F6rn?= Jacke
 <bj@sernet.de>, Karolin Seeger <kseeger@samba.org>
Date: Mon, 08 Mar 2021 14:59:14 +1300
In-Reply-To: <20210308123939.56c5db74@martins.ozlabs.org>
References: <20210308123939.56c5db74@martins.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
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
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2021-03-08 at 12:39 +1100, Martin Schwenke via samba-technical
wrote:
> I want to flag this regression as soon as possible (before I really
> understand it) because 4.12.12 is due for release on Thursday and
> this
> may be the last 4.12.x release, due to the imminent release of
> 4.14.0.

Thanks for looking at this.  Bother.

Can you see if --as-needed is being detected on your host?  Previously
it was being used only if we were compiling with GCC, now we test, but
it is possible the test is wrong.

In short, can you look into the config.log and such?

Andrew Bartlett

> This is the commit in question:
> 
> commit 996560191ac6bd603901dcd6c0de5d239e019ef4
> Author: Björn Jacke <bj@sernet.de>
> Date:   Tue Mar 2 22:47:35 2021 +0100
> 
>     wscript: use --as-needed only if tested successfully
>     
>     Some OSes like Solaris based OmiOS don't support this.
>     
>     BUG: https://bugzilla.samba.org/show_bug.cgi?id=14288
>     
>     Signed-off-by: Bjoern Jacke <bjacke@samba.org>
>     Reviewed-by: Andrew Bartlett <abartlet@samba.org>
> 
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


