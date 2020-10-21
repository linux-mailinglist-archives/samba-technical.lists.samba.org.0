Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FA72945CB
	for <lists+samba-technical@lfdr.de>; Wed, 21 Oct 2020 02:11:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=ktcsKACzhMpkwhMGePVSG43ih5NWAZw/e5AKe82IwLA=; b=HhmEtZrs8v01fb5NFtd2dRLD4I
	1DtFjN1gO45m8brdyLj0o5LHh0aoS3JA96O1YfeKcp/gSe5e04TdFl97p3MwjpEcI6HhhXipiglfg
	ACgbnwd6LVcQZQeMsUg3GFQ2+/P77P9jrqy32dLjdY7D2DZ0xnM/qs63KUq2WgW8/bLGs7oznL0pR
	aKcuidMhXc5mjCBSXX3EPpB5AAVeeCff9+4xe+hUVFmIGpX/vqvAlXJ89fSQTZw+o7KFtg69TnLkn
	309wI83/shtDUb+y3s2IJMnv01x6ZDmvYzJhfKkSy9CuXiMk8vwe8EPXzDP0nAJhf6x/KO/BZpamQ
	UNhFId9w==;
Received: from ip6-localhost ([::1]:48350 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kV1iq-00D04T-Tr; Wed, 21 Oct 2020 00:11:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16204) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kV1im-00D04M-JO
 for samba-technical@lists.samba.org; Wed, 21 Oct 2020 00:11:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=ktcsKACzhMpkwhMGePVSG43ih5NWAZw/e5AKe82IwLA=; b=wC+PGYU+nWNuGL32u/yGlJ+n3U
 Bxrkja1/qnZDtjN05HKBZrmoJ8elAQDQt6V2TFrWP4B4TIrYE3l+kx+KAdVWNqv+/+vSlbrcYTgt6
 PSmDQ256995Vx2u3S6456LsdpWVOlWtlvyvvWB4RxYBi5sfEsRQRXqid3cfgk0+ALgaDhtfJK2V+h
 /LoN7LkU1xZFT0gSUyWEXqNLuqH9TWe+2SmyAjUNJubsvaqM1730+KrbyzjL6YNFPdRbZZ9XfyggQ
 p0Rx9+XxaKbOdf7lPEm3YMc8DSKIM1nkMhzKAY1WlKSqGtRbzmeKK07DbYmv5gXzMcFcPzkCVQ6ZK
 jJZFtEb5smeYJWzmsfyJh5fARbrF8Z2huyOUTD6TFM9TFhB8Dwyk4sNviHG+keQD3sLpIUtvLBR3P
 e+4VGJBhC3kuFUO9oiFNITYGlglz56keSubuKZlDJinMqqxvWLSiZyzIn7ugYC2Y9xXNE7W8wNAGb
 Xxfuza4oRHmUwa03UrGxIutp;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kV1il-0005wP-Jr; Wed, 21 Oct 2020 00:11:16 +0000
Date: Tue, 20 Oct 2020 17:11:13 -0700
To: Arran Cudbard-Bell <a.cudbardb@freeradius.org>
Subject: Re: talloc: Other minor issues/queries
Message-ID: <20201021001113.GA754426@jeremy-acer>
References: <3A50457D-74F6-4C7B-BC2E-8EA68EE64C61@freeradius.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3A50457D-74F6-4C7B-BC2E-8EA68EE64C61@freeradius.org>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Oct 20, 2020 at 03:10:14PM -0500, Arran Cudbard-Bell via samba-technical wrote:
> Just to keep this separate from the memlimit/pools discussion.
> 
> - I've noticed talloc_realloc_size clears the name/type of the chunk be 
>  allocated.  This isn't mentioned in the documentation.  Is clearing the 
>  name/type of the chunk expected behaviour?

Doesn't it add the name of the program text that called the realloc ?

> - talloc_set_memlimit is marked as deprecated in the
>   current HEAD version of talloc, with a note to use cgroups.
>   cgroups wouldn't offer equivalent functionality for us.  Could I humbly
>   request memlimits not be deprecated? :)

OK, I think memlimits add horrible extra complexity to
save applications some bookkeeping.

I want to *reduce* complexity in talloc.

First fix I want to do after the memlimit changes and tests
have gone in is to remove the code paths around ALWAYS_REALLOC.
We never compile with it in test, and we have tests that
depend on it *not* being set, so it really needs to go.

Second, I'd like to remove the memlimit code. Can you be
*really* clear as to what you are using them for, and
can we find some other way to do this ?

If we can do that, then.....

> - Is there any appetite for functions which return chunks of a specific
>   alignment?  i.e. talloc_aligned, talloc_aligned_array,
>   talloc_aligned_pool.
>   I've had to fudge some horrible variants of the above for local use.
>   We use aligned memory for the following purposes:
>   - Page aligned pools for protecting memory areas with mprotect
>     to prevent runtime modifications.
>   - 8 byte aligned buffers that can have the start and end regions
>     easily poisoned with ASAN.
>   - Cache line aligned ring buffers, with the cache line 
>     alignment done to reduce contention where the producer and
>     consumer are close.

Adding this, more interesting functionality becomes
a lot easier to handle and manage complexity wise.

Just my 2cents :-).

