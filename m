Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD155A4AAF
	for <lists+samba-technical@lfdr.de>; Mon, 29 Aug 2022 13:48:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=1HrZzmnSgLAlGTdBk3PmXSDo7PBqNscrRzXY2aAvWvo=; b=ASL165d4wqTaTV8ANT6OTodqt4
	VZlP2Hjo06fIS2uQ6tPnvJAxeU15m1wei9luIyGH3VEw82MQJ/oWPHaEu1MxRCiSMk77BnhSqwW3O
	E5dEY1O6uvQlCI4s6sB9+8FE5eTrG6t+Ni0XaMmskMv+pJBJ6G8tIw351kdaizD5azBHtCWETutAQ
	gF55HotZ8f10Uv0QrHJOstD5xQXDZ4Jt7G0UdMpru2rJqyVDSdBFOjUHSfTXQnRHChu9BPnEqcpV3
	PNNIs/OOZSTzY67CZrMyc4+bZPQkXRUERpoElqkXjhD2iFNjFQZ7W//pcq0QsRp6LTOZLAfm6dlVe
	Zv9SNB8Q==;
Received: from ip6-localhost ([::1]:38302 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oSdEr-002rJB-RK; Mon, 29 Aug 2022 11:47:33 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76]:50303) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oSdEm-002rJ2-Tx
 for samba-technical@lists.samba.org; Mon, 29 Aug 2022 11:47:31 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MGTFD0MLQz4xGK;
 Mon, 29 Aug 2022 21:47:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meltin.net;
 s=202004; t=1661773632;
 bh=1HrZzmnSgLAlGTdBk3PmXSDo7PBqNscrRzXY2aAvWvo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bs8q3fl+ZNVBB1t7aJQOAYCb1nBH3OuoEEeE0OC5Yx8HefHgkqEjxPC+hgHcbLMUa
 gA922A0bVM+oYTeaJTCgQFo4QKD/d9SDrs8FbQKaLmHE4buwbNx4WH03jMAAuQ7RoB
 8sf36CtxLUMfGIir62KFdgJTffjuoVNNWD8Coj0tkYngkAv2iDydTEng6Bhaizu+5j
 CeePcPtAr8r4uKbN4yC/HF6M5b55FIrrYO26+WjtjUY92RxG7hIHBYgge7HByoDB3k
 zrRCF3jo12dupHzOVELxee3TIcJvhtSTXTGNNdZkYb0t2WwkfZHIkzTh/7BZH3/r1y
 K4Lv4ZjeOaDDA==
Date: Mon, 29 Aug 2022 21:47:11 +1000
To: Andreas Schneider <asn@samba.org>
Subject: Re: Samba and ShellCheck
Message-ID: <20220829214711.03b3fe89@martins.ozlabs.org>
In-Reply-To: <5601373.DvuYhMxLoT@magrathea>
References: <4766256.31r3eYUQgx@magrathea>
 <20220823180243.565f35e2@martins.ozlabs.org>
 <5601373.DvuYhMxLoT@magrathea>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
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

On Mon, 29 Aug 2022 09:01:05 +0200, Andreas Schneider <asn@samba.org>
wrote:

> On Tuesday, 23 August 2022 10:02:43 CEST Martin Schwenke via samba-technical 
> wrote:

> > I use an "excellent" convention for local variables in /bin/sh scripts,
> > specially designed to reduce readability.  ;-)  I prefix any local
> > variable with '_'.  However, it makes no semantic difference, it just
> > acts as a hint.  
> 
> Either we convert everything to this convention or we disable the shellcheck 
> warning in those scripts. What do you prefer?

I wouldn't want to force that convention on anyone.  Out of those 2
choices, I would say disable the warning.

> ./script/check-shell-scripts.sh $(pwd) warning >shell.log 2>&1
> 
> 
> Example to disable the warning:
> 
> 
>  ctdb/tests/run_tests.sh | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/ctdb/tests/run_tests.sh b/ctdb/tests/run_tests.sh
> index ff431f8831f..12e495e3dc0 100755
> --- a/ctdb/tests/run_tests.sh
> +++ b/ctdb/tests/run_tests.sh
> @@ -1,4 +1,5 @@
>  #!/usr/bin/env bash
> +# shellcheck disable=SC3043
>  
>  usage() {
>      cat <<EOF

It looks like check-shell-scripts.sh is wrong.  It should not force
POSIX shell via --shell=sh.  shellcheck passes on
ctdb/tests/run_tests.sh with no options.  It is a bash script and
shellcheck can figure that out.  There are other shell scripts in ctdb/
historically named with a .sh suffix but which shellcheck can't figure
out the type of, and they would be a problem.

Note that in ctdb/ we already have ctdb/tests/UNIT/shellcheck/, which
contains tests to run shellcheck (with some exclusions) on all scripts
that are known to pass.  Try:

  ./ctdb/tests/run_tests.sh ./ctdb/tests/UNIT/shellcheck

I have WIP patches that add coverage for more scripts.

I think ctdb/ is relatively under control.  We have been improving
shellcheck compliance for quite a few years (since 2016, apparently).
:-)

peace & happiness,
martin

