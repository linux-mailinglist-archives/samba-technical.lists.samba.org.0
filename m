Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFC35A628
	for <lists+samba-technical@lfdr.de>; Fri, 28 Jun 2019 23:10:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=3cijxsZ4DmbeGuRKbkbPU4N2vN8tq5eQ6zMvofHjIEo=; b=pN8CYMq9HpE+gXbCxh3MXy330j
	tA8tSApI4ehooZaJiDPaKnbEbhTqT4Z9SACKBse5Pv8U3pq8r2i+a9zZa+KZyzUPrFcybziTxvxLe
	8D3J6Bp3bxippssqc1ohgx9k+YE9r7wV2ZM6JSRpYspRPIlrKTE3wTtcSiBBmqCiVdKer9oq8OtZO
	LbOhcmgVxQW/ndHtZMF1O16NN7yNTiSSUydZN6ropP1kBEDN5R9alZwMlRDAo/dkf4QAgXqfE6tXS
	ZpwDCoppiljO13s0uvaXPkgX1A3rtlTnJKbEyqN37bHsz4b2hNNkRlw4x6iQmDJtZQFKPl26pjYkv
	M8JtOEXA==;
Received: from localhost ([::1]:20610 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgy8z-002PGf-Ok; Fri, 28 Jun 2019 21:10:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19258) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgy8v-002PGY-Na
 for samba-technical@lists.samba.org; Fri, 28 Jun 2019 21:10:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=3cijxsZ4DmbeGuRKbkbPU4N2vN8tq5eQ6zMvofHjIEo=; b=fFrL9iqIqj4AuCYnHPFfMgKxCY
 Y7Ffr7btSR+7qR6un+71nzyDgGoHCFTzKL3qxJsoiaHxaxs5cz2EjoXZLU2CBA6hxDBgVBpTHqN0N
 cukr/NKNtQqxmDSsnMDt6/d2Z1mp9EJyNPFbljOBzn2aP82M5bASnINeCLpnBXlk6ds0=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hgy8v-0006Ip-4X; Fri, 28 Jun 2019 21:10:49 +0000
Date: Fri, 28 Jun 2019 14:10:46 -0700
To: Martin Schwenke <martin@meltin.net>
Subject: Re: Compiling Samba with system Heimdal?
Message-ID: <20190628211045.GA16917@samba.org>
References: <20190628142946.7537edfd@martins.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190628142946.7537edfd@martins.ozlabs.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
From: Christof Schmitt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christof Schmitt <cs@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Jun 28, 2019 at 02:29:46PM +1000, Martin Schwenke via samba-technical wrote:
> I'm trying to build Samba with system Heimdal on Debian testing...
> 
> $ CFLAGS="-O3" ./configure --picky-developer --abi-check-disable \
>     --without-ad-dc  --without-json \
>     --with-system-heimdalkrb5
> ...
> 'configure' finished successfully (1m1.668s)
> 
> $ make
> [184/187] Compiling source4/heimdal_build/version.c
> [185/187] Compiling source4/heimdal/lib/vers/print_version.c
> In file included from ../../source4/heimdal_build/roken.h:156,
>                  from ../../source4/heimdal/lib/vers/print_version.c:39:
> ../../source4/heimdal/lib/roken/roken.h.in:282:10: fatal error: roken-common.h: No such file or directory
>  #include <roken-common.h>
>           ^~~~~~~~~~~~~~~~
> compilation terminated.
> 
> Waf: Leaving directory `/home/martins/samba/samba/bin/default'
> Build failed
>  -> task in 'HEIMDAL_VERS_HOSTCC' failed with exit status 1 (run with -v to display more information)
> make: *** [Makefile:7: all] Error 1

Hi Martin,

i see the same also on Ubuntu 18.04. Samba 4.10 has the same problem,
Samba 4.9 compiles. 4.10 started using Python3 for the build. Then i
came across this comment from metze, that there might be a problem with
parsing the output of krb5-config with Python3:

commit 8061983d4882f3ba3f12da71443b035d7b672eec
Author: Stefan Metzmacher <metze@samba.org>
Date:   Thu Jan 24 02:31:10 2019 +0100

    wscript: separate embedded_heimdal from system_heimdal
    
    This allows to default (embedded_heimdal) to build even with a
    broken krb5-config file from Heimdal.
    
    In the system_heimdal case we parse the content of krb5-config
    instead of just executing it. This fails on FreeBSD 12 as
    krb5-config contains iso-8859-1 characters, which can't be parsed
    as unicode python buffers when using python3.
    
    Fixing the system_heimdal case is a task for another day,
    I guess it will only work once we imported a current heimdal version
    and actually tested the system_heimdal case.
    
    Signed-off-by: Stefan Metzmacher <metze@samba.org>
    Reviewed-by: Andreas Schneider <asn@samba.org>

I am not sure if that is the exact problem, but it would seem worthwhile
to look closer in that area.

Christof

