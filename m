Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id E669113CCD
	for <lists+samba-technical@lfdr.de>; Sun,  5 May 2019 04:29:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=ZU8hl10+mLORgJ+yVFhK+JigP6mY8VsDmXuO1yJO750=; b=Q0vd/fGDUppLNv/91ks/eXllPT
	kpgl1JFpxXcLmP5DSBfiUcejlK12xDsklciJ0xDalUG1g8z6wcAEDN8DwQzuuf1VMBTsB5345Wure
	YSfKBwNZgAAtSsRYKkp82kkhjPUOfaJdu6P6go7aHLW8kBnaOwIAbMqb8ATDHlYGFrNZKsuA9ZJ3a
	dBKMu9QKT49lrIGV9/qzKBg5bEU9SDIKjBSdg6LrXcYN2nmrQrTACQxTGLqmh83Kcf10bBi3/nWkT
	EmUJ4xQX6MLLfOE1bop1a2MaVlj1MHG6deTWsWGCKV2P6tNTIaOq0MkzdRpS5D5EQuCvVrClkvULs
	owmhznLA==;
Received: from localhost ([::1]:64664 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hN6tJ-002PAo-2s; Sun, 05 May 2019 02:28:37 +0000
Received: from ozlabs.org ([203.11.71.1]:39911) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hN6tE-002PAh-JO
 for samba-technical@lists.samba.org; Sun, 05 May 2019 02:28:35 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 44xVCq0YRjz9s3l;
 Sun,  5 May 2019 12:28:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1557023303; bh=4Wd6CXWqBodGM+Q8OSpAfdAKWHQ5N5rXRebIVEIoLRE=;
 h=Date:From:To:Subject:In-Reply-To:References:From;
 b=Mghhg0H+Ck/ouRPRBD20utYrC6eW3T5zDsUJ5ppyl5UST2M8ggm4XhO742jJtQaZP
 CoxBFcCeV9hVcdM3idT3+b/8rcfe/ixlyj48/8a/rKz4IF+a790q4/C92luIbpGlqv
 7Ad5Sk2eZ3O1fRJTr0unFzZ2b+gi0g3jSIGuZEafMQles42+aNx94D1VjdREK3iSek
 +PLTOEtp7W76GxZLype5occfKkPOjUST3iw+uFpH7oc9/NmMgXIingv9yFnb9T09/q
 qhfG/Z7IEPF/uD82JszeciRDKipNo7XkZwJTrjYfA63CQy1gp6qT6qK6gbJw8uPo++
 hvctJ9RERn4uw==
Date: Sun, 5 May 2019 12:28:20 +1000
To: samba-technical@lists.samba.org
Subject: Re: [PATCH] CTDB test fixes (BZ13924)
Message-ID: <20190505122820.66c3c5ab@martins.ozlabs.org>
In-Reply-To: <20190502204929.58b02257@martins.ozlabs.org>
References: <20190502204929.58b02257@martins.ozlabs.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2 May 2019 20:49:29 +1000, Martin Schwenke via samba-technical
<samba-technical@lists.samba.org> wrote:

Please don't push this patch:

> [PATCH 4/6] ctdb-tests: Wait to allow database attach/detach to take
>  effect

While it seems to be the right thing to do, I'm still seeing unexpected
failures in the detach test.  :-(

The rest are still good to go...

peace & happiness,
martin

