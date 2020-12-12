Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AED752D8362
	for <lists+samba-technical@lfdr.de>; Sat, 12 Dec 2020 01:26:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=z3RrlziF+gGlpaiBrAYtdbSb50+c2ixRFTJHPIsYWSk=; b=R1vb0bTWi3K+JNz1eJFCNbNoeH
	z9ZG3p/StlYb8Nq/on8QJ9bza2FGjiQSwMXDNx71+GcoTgDapII7fD1aWhsEQYuI5i5vShh9iowfM
	lAvrtMfbIuxAJL0n7i7aHxNxifH7mSy19RiK1xIWHhW3GsPzN1u/Z5zgtO4cXgP4HnE63320eEVrY
	J4mi93nGoqxAO9WFgI6Vlij96ftJmni78nLPy/2ezCO+uolG67r6t8css0+JtzLXZuVWvgzU8VQnc
	yy7t5pHUwdTvJKE5eV8JhyU1VKRzlPxZmw2K9XtMAZxh7DVn8LDjkGkWxgyi9ZO9lmOehwpkyJ9Fx
	KrsVinog==;
Received: from ip6-localhost ([::1]:39358 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1knsjm-000glw-3h; Sat, 12 Dec 2020 00:26:14 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:56677 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1knsjf-000glo-LS
 for samba-technical@lists.samba.org; Sat, 12 Dec 2020 00:26:11 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ct7jF2tMGz9sSs;
 Sat, 12 Dec 2020 11:25:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=202004;
 t=1607732737; bh=81TazJAWzKc37/OrlzDGE/dBl6js1XIhB1jMjj9Hw8Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=X69C771NhIeC0zi4rNj5Rz0eBg6oT1D9a1HB0u78TVRaEQDEEsSHrgMm6yy0rKHnq
 yCIcyZOANSoUsmL7NIhj8S8y+bMlbYwG9FD0G80omyLaVLUfsM2t5bR2PMu4P0x88Z
 gymt1SkbNOYzI17mRS222/39vpGI0kZuyFPe/h2+TiXol+wxevkasxIdsTSK0HBRgh
 1iqrnfxzik9jXLeCMQ8EMjd5p2K1OH3UCgXsmkJMrcWgTJqcMlmyo2vvlKpqwR5fWC
 P8GbK+/RLvUbN7qw6Ig6Kw+gVC3gdPu2k0m1FdlWuF9MHyAAeYFBSYyg56pE+uzwxB
 HHhejEI3Bn0iQ==
Date: Sat, 12 Dec 2020 11:25:35 +1100
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Samba testing on CentOS 8
Message-ID: <20201212112535.48699809@martins.ozlabs.org>
In-Reply-To: <380efeccd76b37a958da2a49656a5c1c959a0173.camel@samba.org>
References: <20201208231746.3c15f5b0@martins.ozlabs.org>
 <20201208124406.GF5029@pinega.vda.li>
 <20201209003132.328ca229@martins.ozlabs.org>
 <df4952fb-87d9-6cc8-e55c-a08487ff34aa@samba.org>
 <20201210142744.398a7e75@martins.ozlabs.org>
 <380efeccd76b37a958da2a49656a5c1c959a0173.camel@samba.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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

Hi Andrew,

On Sat, 12 Dec 2020 09:45:44 +1300, Andrew Bartlett
<abartlet@samba.org> wrote:

> One advantage of the current bootstrap system is that as long as nobody
> deletes the CI images that are built, the existing images remain a
> stable snapshot.  It is 'just' the bootstrap scripts that break for
> others, and of course building a new image now becomes more difficult.

Thanks for hammering that observation home!  I found it slightly
annoying when I had to build new images to test my branch on GitLab but
I now realise that the stability is a core feature.

I guess I could make autocluster create VM images for all cluster nodes
by taking a snapshot of all cluster nodes after they have been built 
(sans Samba/CTDB).  However, this is a change that requires significant
work.  At the moment I lazily unpack a Samba binary tarball on all
nodes and run the bootstrap script extracted from the tarball.  Hmmm...
the sanest way would seem to be to build a base image containing
everything except Samba/CTDB and the cluster filesystem.  However,
that's what we've moved away from because building your own VM images
eventually drives you crazy (yes, that's what happened).

Requires more thought...

> It is particularly sad that the end-user use of the bootstrap script
> could become less reproducible, that was a really nice feature.

A small hack fixes it.

If you're still removing Bugzilla review requests and are bored of that, please
consider reviewing and pushing this:

  https://gitlab.com/samba-team/samba/-/merge_requests/1727

:-)

peace & happiness,
martin

