Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF7A60120
	for <lists+samba-technical@lfdr.de>; Fri,  5 Jul 2019 08:45:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=rOgVoIymLaHT5ZqNgTvbL4C822R9A3KnX2RRH6J1nWM=; b=LZbPAYxLP2kblc3On1Tt7/ZAln
	9sdcDZGZonBMbMxWtj2BWbNCV5qSQOe6lkAHQsSgJSu6cQ3cFP8vV6o/htiLaxBdeWbEdlJHLX0ts
	AR2ljTncK+0Xwhvir82ZN5RXuvZa4gTN1A6KRHLza7RW0zuy8aargisPzEbImzikkDnl4AqeGTd8y
	iMg73XtWAO9ASmIovPnZCRe7/MKoc9ZgaWLBJm/0BWpptOHIAhZcJmzOQmcPamRr3gH55yyesfWVd
	4QCG44hGZk/IK2lfwXBoZQ86u7/BWWCilup/sRWogWrUgB8YCUwfxTJWVY7B+ORRHZM6w/pc7bX3f
	siO8WYeg==;
Received: from localhost ([::1]:24070 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hjHy1-005Hvg-CQ; Fri, 05 Jul 2019 06:45:09 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:50967 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hjHxr-005HvW-27
 for samba-technical@lists.samba.org; Fri, 05 Jul 2019 06:45:02 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45g51Y447rz9sNs;
 Fri,  5 Jul 2019 16:44:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1562309089; bh=cgZV4pG4QcsH4lm5yAhhy0B/Fp2Bm3jEK/fwCtUmfPg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QT2Sm0e2BDmMO57xVibxDFYPGygFUoy2RQOl7y4BFmXkJlLe56izxjqQ7Id1jhnw/
 fnRGAaHkSYyx3Dik9q9nFngbhHdCxppzAGyAJUTVtmNL2cx9567wUaTVqMn5i4qZgP
 i2Xzm2APD2UWyFuzXb7SjtIAo5yd0wU0htFoHfIel9IItEUAVqqzoi0sLYsZGWhbAj
 zjBpOOjLzjJf05EClh6nLfODYHKjTV858O8QrvD/qM4BzbQl5yGcZtA53XoHfa9Zn9
 Lcpw6aiHRIbKjBO1PXjj7+LCarBNv7v4SgGlIj647TMcRSp9mVzhvOgXcu0ThPXOWS
 R5084wmXISiOg==
Date: Fri, 5 Jul 2019 16:44:47 +1000
To: samba-technical@lists.samba.org
Subject: Re: [PATCH] ctdb-config: depend on /etc/default/nodes file
Message-ID: <20190705164447.4e684fcd@martins.ozlabs.org>
In-Reply-To: <20190704175355.24272-1-rafaeldtinoco@ubuntu.com>
References: <20190704175355.24272-1-rafaeldtinoco@ubuntu.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
Cc: Rafael David Tinoco <rafaeldtinoco@ubuntu.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu,  4 Jul 2019 17:53:55 +0000, Rafael David Tinoco via
samba-technical <samba-technical@lists.samba.org> wrote:

> CTDB should start as a disabled unit (systemd) in most of the
> distributions and, when trying to enable it for the first time, user
> should get an unconfigured, or similar, error.
> 
> Depending on /etc/ctdb/nodes file will give a clear direction to final
> user on what is needed in order to get cluster up and running. It should
> work like previous ENABLED=NO variables in SySV like initialization
> scripts.
> 
> BUG: https://bugzilla.samba.org/show_bug.cgi?id=14026
> 
> Signed-off-by: Rafael David Tinoco <rafaeldtinoco@ubuntu.com>
> ---
>  ctdb/config/ctdb.service | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/ctdb/config/ctdb.service b/ctdb/config/ctdb.service
> index 675b3147417..fd81c38e26d 100644
> --- a/ctdb/config/ctdb.service
> +++ b/ctdb/config/ctdb.service
> @@ -2,6 +2,7 @@
>  Description=CTDB
>  Documentation=man:ctdbd(1) man:ctdb(7)
>  After=network-online.target time-sync.target
> +ConditionFileNotEmpty=/etc/ctdb/nodes
>  
>  [Service]
>  Type=forking

Referencing bug 14017 in commit message instead of duplicate:

Signed-off-by: Martin Schwenke <martin@meltin.net>

peace & happiness,
martin

