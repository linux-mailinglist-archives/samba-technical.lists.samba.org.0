Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E049627FE
	for <lists+samba-technical@lfdr.de>; Wed, 28 Aug 2024 14:58:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=t362KoSVHN+14HfBOdRHpi5lglTk1PVsvtayPae34Lw=; b=RPoHTRO63/epJNuprM1nIjdrF1
	Op2b/5C4+2yXO+s3iVt7uv2afbqK5+oMQqlOUKk4TWK8ogy40sA/LIzeTGBI9/9kKSLqopjj8AXpj
	1DasaHwVp58aNmxDlWvR2J6dWtdhidjAaPRku1x4J83fi1nbc6f43YFlQbOfxrqMFKQluv4NwF5Na
	RKJ3RXCZQGeishg/LmtxjAd6qOYSZDVeQ5SjUP7MwOgBrRaBDNhNGcqQpI9KGvxBo7RgOd7RhZriO
	ZP95SxhkMr4exxMFf9Nmh4UvohE83tpYUhBhSqAwaLOn1FKUjuAhfDaqE8nYR2MZXj0soK8ESrlzh
	+1n06HlA==;
Received: from ip6-localhost ([::1]:29838 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sjIFD-005ijt-Mr; Wed, 28 Aug 2024 12:57:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33242) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sjIF9-005ijm-Oo
 for samba-technical@lists.samba.org; Wed, 28 Aug 2024 12:57:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=t362KoSVHN+14HfBOdRHpi5lglTk1PVsvtayPae34Lw=; b=Wy2zE7j512ySnYR+2daQQmrPZB
 xixEsA5ftefyixs6uXzK50quNxeWi5wix3fuCR6ED34jNY0iCAWY1V5RVXA1/lF3yx7DShXDsqFeu
 cOjqej0nowavcm1tPhFsc7vV5MQAWhv5vIYuX66gT2/vYHLLObAFkvyjkgv8XYOVjFCKiVdybr68A
 IfIYWO2LrhCe3zcLwF8RCJFGkVS/2YMChYseHvwCxSAIFF0OfQHzo3O7PTbbsYkC9dnuW58cYV1Z5
 r9uxh+hJd6tDi/J3N8u8p79NlE0RY8vwnINqY8D3OEIGSZgSk0k8ndAaeSHEb9T+m9+4TIDiigu2t
 w4NSFosRxhlqundHEPkR9+RKJ8sg3lzKa/41eg2GuNyZWRi3fKiHQu22l9OEgdLdgfKKCVCctJPUW
 s/mp8Nuz15dt6o5p4wSB9Icsq9dJjKQVTfs3na0clsODnQhDTlBSTmv6W5oLR60gWQy38LUvZwLgg
 oFIgqLcTydDIYI1oDHgMSOhn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sjIF7-008nbS-0z; Wed, 28 Aug 2024 12:57:45 +0000
Date: Wed, 28 Aug 2024 12:57:38 +0000
To: David Howells via samba-technical <samba-technical@lists.samba.org>
Subject: Re: Bug in Samba's implementation of FSCTL_QUERY_ALLOCATED_RANGES?
Message-ID: <20240828125738.0e409cff.ddiss@samba.org>
In-Reply-To: <965293.1724845945@warthog.procyon.org.uk>
References: <20240828105536.1e6226df.ddiss@samba.org>
 <20240823132052.3f591f2f.ddiss@samba.org>
 <Zk/ID+Ma3rlbCM1e@jeremy-HP-Z840-Workstation>
 <CAN05THTB+7B0W8fbe_KPkF0C1eKfi_sPWYyuBVDrjQVbufN8Jg@mail.gmail.com>
 <20240522185305.69e04dab@echidna>
 <349671.1716335639@warthog.procyon.org.uk>
 <370800.1716374185@warthog.procyon.org.uk>
 <20240523145420.5bf49110@echidna>
 <CAN05THRuP4_7FvOOrTxHcZXC4dWjjqStRLqS7G_iCAwU5MUNwQ@mail.gmail.com>
 <476489.1716445261@warthog.procyon.org.uk>
 <477167.1716446208@warthog.procyon.org.uk>
 <6ea739f6-640a-4f13-a9a9-d41538be9111@talpey.com>
 <af49124840aa5960107772673f807f88@manguebit.com>
 <319947.1724365560@warthog.procyon.org.uk>
 <951877.1724840740@warthog.procyon.org.uk>
 <965293.1724845945@warthog.procyon.org.uk>
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: Paulo Alcantara <pc@manguebit.com>, Steve French <sfrench@samba.org>,
 linux-cifs@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Tom Talpey <tom@talpey.com>, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 28 Aug 2024 12:52:25 +0100, David Howells via samba-technical wrote:

> Okay, that fixes the problem.
> 
> For reference, the file can be prepared thusly:
> 
> 	xfs_io -c "pwrite 0 16M" -c "fpunch 0 1M" -c "fpunch 2M 1M" -c "fpunch 4M 1M" -c "fpunch 6M 1M" -c "fpunch 8M 1M" /xfstest.test/foo
> 
> and then the test run:
> 
> 	xfs_io -c "seek -h 1" /xfstest.test/foo
> 
> Something like punch-hole is needed to set the sparse flag - otherwise QAR
> isn't used by llseek().
> 
> So:
> 
> 	Tested-by: David Howells <dhowells@redhat.com>
> 
> if you need it.

I appreciate the test feedback. The change has already been committed
(with you referenced in Reported-by).

> The Fedora samba version I applied this to was:
> 
> 	samba-4.19.7-1.fc39.x86_64
> 
> though I had to drop the testing bits as they didn't build.

Yes, as mentioned, samba >= 4.20 is needed for the test's
torture_assert_size_equal() calls.

Cheers, David

