Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8AC7EBB2B
	for <lists+samba-technical@lfdr.de>; Wed, 15 Nov 2023 03:27:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=NSQCRybPXGRNNfYdM/wm0jm6eQtWIWoDegyUneo0tR4=; b=4QEXRLDBQP9yG7narEKuu10bCB
	niD3++HeucxwIwEdo/LVEioiN749nz2Uyu6th8GnwvWITRcjrM68HD1SwucC6tPls6oXu5RRnIrIP
	waD5yiXfYDl8F4ggorMVqZONampl5yRSgfmx/p8KfTATXeDy7RdqETBd7jlAM1uMY3t5KUhfFPG00
	gHAKbiExJ2F8jdZ0KmSekiuhlRVCTx7ax2Ep3yYXLYyIV/PE+wIESKZy7AqVxkrHm+VFwwloJagqo
	LPXXcCIel+jGeZ6r1PAdIEXpdnv3bX0FQ5/V9/fy0wCqEBVPVvm/Nkn4rGu0qtlDOrhMMGGuqObtn
	2Dkfm20A==;
Received: from ip6-localhost ([::1]:31978 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r35bx-008Non-C1; Wed, 15 Nov 2023 02:26:37 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76]:51947) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r35bs-008Noe-By
 for samba-technical@lists.samba.org; Wed, 15 Nov 2023 02:26:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meltin.net;
 s=202004; t=1700015184;
 bh=NSQCRybPXGRNNfYdM/wm0jm6eQtWIWoDegyUneo0tR4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EhzCyq6Bo/j73K7YaRcVNOR0sHtLDO5D4XfS//2YYLN0SAjsMRg3Gxe2+KxU1K9hA
 L1cvbFFeVS4AZYkAVHu00finlF7SW07+VS1C4MQKZo9b/woq6C7nsWenQKJa2gs9xt
 Qg6wtPoJU5Y2gsSOgrHxJznyTG8+N4Zi4aTYm4E6rxiGoHmrM/Of9zREW5tq5gR8C/
 sL3x9Edckxk/zUsgNMuvasNkFTc7y3pu6pyQH80g4G3IOz+ohaU7sim0voZwG8ufJU
 ovQaImygWeskGCeyHi/B4Mg0gO5BkWf39ScxkNZ3iQZiMDYG01YPlneXLB4kcB2Hlf
 jqGHVY3MjREPw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SVRqh3lN6z4xS9;
 Wed, 15 Nov 2023 13:26:22 +1100 (AEDT)
Date: Wed, 15 Nov 2023 13:26:21 +1100
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Subject: Re: autobuild, CI broken by unix epoch > 1700000000
Message-ID: <20231115132621.1fe62355@martins.ozlabs.org>
In-Reply-To: <ab80dc2f-2af8-4384-a42e-d605d5e0cbe2@catalyst.net.nz>
References: <eca883c1-c232-499c-b290-fec0978401ae@catalyst.net.nz>
 <20231115113105.535e2ca3@martins.ozlabs.org>
 <ab80dc2f-2af8-4384-a42e-d605d5e0cbe2@catalyst.net.nz>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
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

On Wed, 15 Nov 2023 14:00:02 +1300, Douglas Bagnall
<douglas.bagnall@catalyst.net.nz> wrote:

> It certainly helped that someone had pointed the change out earlier in 
> the day.
> 
> https://bugzilla.samba.org/show_bug.cgi?id=15520
> https://gitlab.com/samba-team/samba/-/merge_requests/3389
> 
> I haven't done a CI build for the whole 4.19, but it passes locally.

It has passed a pipeline so, as per the MR:

  Reviewed-by: Martin Schwenke <mschwenke@ddn.com>

I just re-read what I wrote previously (and possibly what you wrote
too).  Of course, the epoch is unchanged... I obviously meant the number
of seconds since... :-)

peace & happiness,
martin

