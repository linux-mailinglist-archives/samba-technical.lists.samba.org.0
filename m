Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E4961E38A
	for <lists+samba-technical@lfdr.de>; Sun,  6 Nov 2022 17:54:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=p3X9LhQTSyo8sjp/5Q9rVlp3emmd3FZ42rF9VBNVJP4=; b=jdJp7QsRviUwyUNj9vDPuDNGXN
	lhUJpPcww4VJFUqYpyFGf7sZi6M2dvp1tLsycRzI2TBGNd7rJRpdYxF97aMgXdYVqtUNfapsim7g6
	1Y9rsRz3TiWwdqGwk26NQRkA/VwXTv/OQXsazRRpDplLdaRjrRD9VpFl+ymOjRbglhGERLK0tROTn
	8GrK1E8DjiJwQPwsYSLWE3S0iP/0tuTsW/VsDL580P0saaNZxhveSXjhpsir+srb70aILTMKOPQTn
	psGNTpYMKOskZvQIWxSgg1oNinthudg2wjulJVUX2H+eOXYZ6TQmrXQ4x9SpSY3yhiIN19Ml0jru2
	2ERYgoJA==;
Received: from ip6-localhost ([::1]:42218 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oritp-00B7tn-JT; Sun, 06 Nov 2022 16:53:33 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:50329) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oritk-00B7te-BX
 for samba-technical@lists.samba.org; Sun, 06 Nov 2022 16:53:30 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 09CCB406F7
 for <samba-technical@lists.samba.org>; Sun,  6 Nov 2022 19:53:20 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 3C4333D3
 for <samba-technical@lists.samba.org>; Sun,  6 Nov 2022 19:53:24 +0300 (MSK)
Message-ID: <0500bdbb-92ec-caf6-0097-b9a6ba22f675@msgid.tls.msk.ru>
Date: Sun, 6 Nov 2022 19:53:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: samba-technical@lists.samba.org
Subject: PYTHONHASHSEED, hashes, build failure on sparc and other fun gssapi.h
 stuff
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

So, I digged into the persistent build failure on sparc64,
https://bugzilla.samba.org/show_bug.cgi?id=15080

The problem here is - simplified - we have too deep gssapi/ directory.

third_party/heimdal/lib/gssapi/gssapi/gssapi.h

is the main header.  There's also a dummy header,

third_party/heimdal/lib/gssapi/gssapi.h

which just includes <gssapi/gssapi.h>.

But the thing is: samba build procedure has -Ithird_party/heimdal/lib/gssapi
*and* -Ithird_party/heimdal/lib in the compiler options (for the -I options,
I don't understand where they're set up in the wafsamba machinery).

So we can include either <gssapi.h> or <gssapi/gssapi.h> - *if* the lib/gssapi
include comes *after* lib include, both of these header files will be satisfied
by the same dummy third_party/heimdal/lib/gssapi/gssapi.h.  So this dummy
header just includes itself which gives us nothing.

But if -Ilib/gssapi comes *before* -Ilib, everything is fine.

But this is just too fragile.  Maybe heimdal folks should not use this directory
naming.  Or maybe - which is more appropriate it seems, since there are no include
files in there! - samba should not specify the -Ithird_party/heimdal/lib option.

For now, due to lack of understanding of wafsamba machinery with the include path,
with this (mutating) set of -I flags, we can just remove this dummy gssapi.h
header, - this way, <gssapi/gssapi.h> will resolve to the right one being included,
and everything builds fine.

Where the -Ithird_party/heimdal/lib option comes from?

Thanks,

/mjt

