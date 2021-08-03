Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 187833DE61D
	for <lists+samba-technical@lfdr.de>; Tue,  3 Aug 2021 07:21:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=qh+IrZu8B7X7ZfR/jkiCM/6ApmFY5/fOD3Bi0mZWSoA=; b=Vjfaa+hKnh3NINXGjsEW1dmWdG
	xb5lh1bLPO4gHwgZKWq28hcU90R536kFpnyBuf4B/CwRc6FNuclneQkPz1Sbk9usOYczcrAk4WMhN
	cR/FJcD7QTJdlGzywgjHgJMgAu1Qaq/BltIYO41H/PrZcbGv+Ncs+88nW3hIKqJmIek8/016JC9gh
	shvW9i/FB/fcjwZW7of4e7EFex88mLYssT0SgasVd4GLoyy/nVsCpUdg8mwO8m1faNBLiRSAg78k8
	cgGmBCAMEHevlVyOXtOF07c6801/JJ1mylf85ToN6prLtoj4t7CONBmgOaBUz5vidjs7ZAwm6mT/+
	MoBJ/v+g==;
Received: from ip6-localhost ([::1]:48066 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mAmrw-0049z0-3m; Tue, 03 Aug 2021 05:21:36 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:45351 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mAmro-0049yq-BZ
 for samba-technical@lists.samba.org; Tue, 03 Aug 2021 05:21:33 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gf2nj1tJLz9sS8;
 Tue,  3 Aug 2021 15:03:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meltin.net;
 s=202004; t=1627967001;
 bh=qh+IrZu8B7X7ZfR/jkiCM/6ApmFY5/fOD3Bi0mZWSoA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=j/EwsoArmQadI7zaG+gqFTAgicrk7BzBf/kuI8SvkEL5KOZKWJ8ALQrXAakPKpPQQ
 3P+vppCPsNaJk7y3no+yCXkSxT2Ae5e1y9iDxmkQ4CjvNP2hmTn0LDmliXJw2FoKx8
 HJ2w2QVv3LrV2f/pqR4ApnnkM5iYSsxre/o/iS9uatdXsEo7Gy4O8IK7GAmSxzpLCT
 gQdroLv2+zFrQKUJuBOqToPOdsgBehkoyiwXpHh91PQ2aL83fSUGEsnFbgWK2Hir6E
 OZgy68FyUW+SAmvrGK1eNV60+MFiFe14BVxSzeWSZUpsZ0VjolazkvsrFKKT7chX2Q
 6H+G/YWt1ogiw==
Date: Tue, 3 Aug 2021 15:03:19 +1000
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Autobuild paths too long again
Message-ID: <20210803150319.1cab1e0c@martins.ozlabs.org>
In-Reply-To: <f3d35fd592abf06db2277ad15bf22f3a9804b7ba.camel@samba.org>
References: <f3d35fd592abf06db2277ad15bf22f3a9804b7ba.camel@samba.org>
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

On Tue, 03 Aug 2021 16:52:09 +1200, Andrew Bartlett via samba-technical
<samba-technical@lists.samba.org> wrote:

> Since (I'm pretty sure) this commit:
> 
> commit 7e9c97ba1cd960df2688718561c4a117b79b259b
> Author:     Isaac Boukris <iboukris@samba.org>
> AuthorDate: Thu Oct 8 14:00:44 2020 +0200
> Commit:     Andreas Schneider <asn@cryptomilk.org>
> CommitDate: Wed Jul 7 15:01:22 2021 +0000
> 
>     selftest: Add test for one-way trust wbinfo auth
>     
>     Signed-off-by: Isaac Boukris <iboukris@samba.org>
>     Reviewed-by: Andreas Schneider <asn@samba.org>
>     Reviewed-by: Andrew Bartlett <abartlet@samba.org>
>     
>     Autobuild-User(master): Andreas Schneider <asn@cryptomilk.org>
>     Autobuild-Date(master): Wed Jul  7 15:01:22 UTC 2021 on sn-devel-
> 184
> 
> I've not been able to push. 
> 
> Can someone please fix this up again.  The issue is that winbind socket
> path is too long, which gives:
> 
> [...]

Given that this is ongoing pain, socket wrapper is in use here and we're
testing...

I wonder if an additional socket wrapper hack might be useful.  Could
we make socket wrapper optionally put all Unix domain sockets in some
top-level (i.e. short) socket wrapper directory and then name the
sockets by hashing the path?

peace & happiness,
martin

