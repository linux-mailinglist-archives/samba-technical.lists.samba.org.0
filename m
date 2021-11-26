Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C5545E6FD
	for <lists+samba-technical@lfdr.de>; Fri, 26 Nov 2021 05:57:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=qcFugw1yqZy6uUvlriO+EjvhO35FvTnDEKLXGUIgYeM=; b=WDl6hqSR0fVjK2RDjDBWmRFrfG
	hnNi54L/At3iUrpLOr4E76aKtoENDILd8mJ+DsFrqC1nGSLSbxJPXfiFHxaV2FVcZ0st6xRXVlykQ
	GkjLwxwvHobTUr3lWQp3s80lysPlFprWguEwXsIz9FFFTRZEvYqt50wiCQNR3L3hHrFuVi23nbDxO
	LOQrxFA+itjw6BP8ZNnTwJ109tgt15r8oWetL1kNgmqN5bw7OKcswpzAiw4/PUIrgRzgBZ3gopMIJ
	YvgDVzZEsbWASNiJvBknVEwRiymjM8lo8jmHKJSgKsAn+pd2hAj1A8ijLeOoFPPaQLXVgHo/7N7ei
	RBVOdhtA==;
Received: from ip6-localhost ([::1]:31958 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mqTJ1-004mgF-3L; Fri, 26 Nov 2021 04:57:51 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76]:34505) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mqTIv-004mg6-7d
 for samba-technical@lists.samba.org; Fri, 26 Nov 2021 04:57:48 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J0hpt57PHz4xYy;
 Fri, 26 Nov 2021 15:39:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meltin.net;
 s=202004; t=1637901559;
 bh=qcFugw1yqZy6uUvlriO+EjvhO35FvTnDEKLXGUIgYeM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aaYg3S2virPKnMzsM8NvxoLLv+terAdUOTEzPuanK3IWNWFcDV2Xq2/XPyIBBPzPq
 tR+mqLwR1RSXUlRhABHfbuKKXAziR5WN5x8xziFWBB2RbUwb7vJ4TnVPckngrU1vq4
 ppXlW++elAcw4/IWnOuV3AQ0+X7T10NbbQNpuG+n+N1kFRP/4lR9XnsT5v2F8nFgLp
 TxEGZnJ4/kcaqI/2LmAE8MJ53UGIe5ejNDrx+9WU8JsDjDRlIEfGzZ76GCKSoVc1Y1
 Yfy6iJZntRzEJ++u76D0dMWZBewnV6mSMuDqIBMbpOyhU1xa/+0O9qr7HxYqgwbELi
 pe99F2bzaceFA==
Date: Fri, 26 Nov 2021 15:39:15 +1100
To: Matt Grant <matt@mattgrant.net.nz>
Subject: Re: Failing pipeline build,
 https://gitlab.com/samba-team/samba/-/merge_requests/2271/pipelines
Message-ID: <20211126153915.1a8bbf3a@martins.ozlabs.org>
In-Reply-To: <CAHA-KoMZENMX2U3vMVYUro_trOAU0qBtQYPqYtfPw7cJ8Sj7YQ@mail.gmail.com>
References: <CAHA-KoMZENMX2U3vMVYUro_trOAU0qBtQYPqYtfPw7cJ8Sj7YQ@mail.gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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

Hi Matt,

On Fri, 26 Nov 2021 16:31:11 +1300, Matt Grant via samba-technical
<samba-technical@lists.samba.org> wrote:

> Have a failing pipeline build for a patch set which I would like RFCed for
> work on for merging.  This builds cleanly on my set up at home, and
> there don't appear to be any build logs that tell me where gitlab-ci is
> going wrong for merge request 2271....
> 
> Thank you for your patience!  I am a bit of a green horn when it comes to
> this...

When on the page in the subject line, click on the pipeline number to
go to:

  https://gitlab.com/samba-team/devel/samba/-/pipelines/416690068

Under "Build_first" you'll see a couple of red Xs for failed jobs.
Click on the first one and you'll get a build log at:

  https://gitlab.com/samba-team/devel/samba/-/jobs/1821378056

If you scroll back a bit, before the clean-up, then you'll see the build
error...  ;-)

peace & happiness,
martin

