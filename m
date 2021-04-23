Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E97D3690BD
	for <lists+samba-technical@lfdr.de>; Fri, 23 Apr 2021 13:01:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=LjJDnDbeoEtQ6XVyoKzhlNkPBqU01PirZhOmL4E4fms=; b=r1iQ1aWuhzeFtE0R4+HwPDly2t
	869/Ds+wEat8Pkqqlp+mr5F0q9JfVZ7b44ptRcr9Rsn87CcjoiRJ6+sSQ/s8uOOaqmRqCp33S1XBB
	4JnzzJtsc5P665A55nkhrg1gMhH0yLcNdNXyB/lOqRE5NaLJJVWNatpBNhQiR6b52YnAwN7reIRyx
	3uQ4wpsEAQ+tYucZF2gBffsMGVuHOQ3CNTiuvIfIk8wXc0KvkJJsxMQXP3iUdxrk17p8h1CnKRLoB
	kxggKT7j4VcdbkLR5NnfGBIjBbEh0jpGNn8aI1CJZgQzB4yFl4teYC5r2QgUFl6+VwL6aD7zwp7dd
	ooQfhFFQ==;
Received: from ip6-localhost ([::1]:51346 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lZtY6-00CCko-01; Fri, 23 Apr 2021 11:00:38 +0000
Received: from ozlabs.org ([2401:3900:2:1::2]:55871) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lZtXx-00CCkb-Ud
 for samba-technical@lists.samba.org; Fri, 23 Apr 2021 11:00:34 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FRWXK5PYcz9sVq;
 Fri, 23 Apr 2021 21:00:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=202004;
 t=1619175603; bh=Bqld7bebvvHiUUe+pleAthR2chR/JFJAsjZsUrW26Nc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gddnZw0h4Z2ycFFXa0qIo5CfXIvFMnEa8J+Jkn11/kE0RyQPJKt/hMkON7G+adGVD
 4gCu1PLkv+6RWQ6/V5v4AejZVjq5jpG3fZOWqhEnbFuI+hxkayKvqc4Sl0eGPFT1lx
 XBcoGdT2nWe8/es0lRSqnb8M+k4rDA6gHSB9PUjf+SRbN3vbF+QSRCefP3nx11z7mN
 wHFY74q7f1/qW4HCnrEDOfB2hXG6pQ0mEda/zLNvSsAXLnqrqoem0tY2ysF3WxA3tQ
 S7CgBsTOy5jMmOxoMjdR6hMxkH9DalC48cXDzb36Fo4hWC/W4qOUnanQMinCYvcvh0
 2HYWw9oTDbVRQ==
Date: Fri, 23 Apr 2021 20:59:58 +1000
To: "L.P.H. van Belle" <belle@bazuin.nl>
Subject: Re: ctdb/utils/etcd/ctdb_etcd_lock python => python3
Message-ID: <20210423205958.369ab466@martins.ozlabs.org>
In-Reply-To: <vmime.60816792.20dc.4140e8fec807bb2@ms249-lin-003.rotterdam.bazuin.nl>
References: <vmime.60816792.20dc.4140e8fec807bb2@ms249-lin-003.rotterdam.bazuin.nl>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

On Thu, 22 Apr 2021 14:09:54 +0200, "L.P.H. van Belle via
samba-technical" <samba-technical@lists.samba.org> wrote:

> Latest samba build failed on ctdb. 

How exactly does the build fail?

> I dont know if its really needed but all python references are used
> with /usr/bin/env python3. 
> 
> Just to besure im not breaking something in ctdb here. 
> Can someone confirm this? 
> 
> My fix.
> 
> --- a/ctdb/utils/etcd/ctdb_etcd_lock
> +++ b/ctdb/utils/etcd/ctdb_etcd_lock
> @@ -1,4 +1,4 @@
> -#!/usr/bin/python
> +#!/usr/bin/env python3

I'd like to be able to give a better answer but I'm not entirely sure
that the script works with python3 without any other changes.  It looks
like it should but I don't have a trivial way of testing it (or time to
setup a test environment).

Given that /usr/bin/python isn't supported anymore, we might as well
change it as above see what bug reports get generated.

If you're keen to improve the script then you could try to clean it up
and get rid of warnings from pylint and flake8.  getting rid of the
obvious whitespace issues might make any python3 issues more obvious.
Perhaps yapf3 would be useful?

peace & happiness,
martin

