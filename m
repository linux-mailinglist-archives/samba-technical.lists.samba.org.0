Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF1A4E8781
	for <lists+samba-technical@lfdr.de>; Sun, 27 Mar 2022 13:40:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=UlUWAAuQionvIjaJy3SZ/9QoBu3Fsj7OSZe6NcWuV90=; b=4MRh58xYBVZt08x/MsSkDwmx2j
	Vgs8H4p1s8MMDsix9r3zBTga8JAr1+iNYn6h7roCEIqcZjj2HbVyqa9g1Oli/YgxEj0nQb4FNw+bZ
	cqbOZFr9EJK94/5P1NGwcqPVm5ompLMiFpymMWzbWqtX0Cz3MjZI9jx2+mbpxiGTz1H4+FIQLZSc6
	0riJiCUicgtJIa6TdewwAOlJDwagjxATOGRtMxh97YXk2C3f50GuscQUcLQTOUBV74TfUW4hnDdnS
	lw6uCyfYYuZfZeJRLypXKsfihYv7k4khFRybdA5Prc4ilPtqOA7Z4ISG9IYyWi1PRmpPakIPFKI6X
	RKC57ppQ==;
Received: from ip6-localhost ([::1]:61474 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nYRFG-005fAK-It; Sun, 27 Mar 2022 11:39:42 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:46149) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nYRFB-005fA9-Dq
 for samba-technical@lists.samba.org; Sun, 27 Mar 2022 11:39:39 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id B391E408C3
 for <samba-technical@lists.samba.org>; Sun, 27 Mar 2022 14:39:29 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 3835D36F
 for <samba-technical@lists.samba.org>; Sun, 27 Mar 2022 14:35:43 +0300 (MSK)
Message-ID: <5df3aaa3-0899-f0a8-dc63-dbebcaab6b17@msgid.tls.msk.ru>
Date: Sun, 27 Mar 2022 14:39:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: building 4.16 for debian (long)
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <006ec6d2-39be-80e9-94c5-946dfdd968d9@msgid.tls.msk.ru>
In-Reply-To: <006ec6d2-39be-80e9-94c5-946dfdd968d9@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

27.03.2022 10:50, Michael Tokarev via samba-technical wrote:
...
> Third, when linking smbd, I'm getting this error:
> 
> /usr/bin/ld: source3/smbd/server.c.147.o: in function `notifyd_req':
> ./bin/default/../../source3/smbd/server.c:366: undefined reference to `messaging_ctdb_connection'
> 
> apparently source3/lib/messages_ctdb.o is missing somewhere in the link
> line. Maybe this is related to usage of the bundled-libs above.

I fixed this one by the following change:

diff --git a/source3/wscript_build b/source3/wscript_build
index acfc0c56f03..bee623a7347 100644
--- a/source3/wscript_build
+++ b/source3/wscript_build
@@ -1103,6 +1103,7 @@ bld.SAMBA3_BINARY('smbd/smbd',
                        CMDLINE_S3
                        smbd_base
                        REG_FULL
+                      samba-cluster-support
                        ''',
                   install_path='${SBINDIR}')


> --------------------------------------------------
...
> Okay, I moved third_party/heimdal/lib/gssapi/gssapi.h out of the way for now
> to continue, it compiled okay, until failed elsewhere:
> 
> In file included from ../../third_party/heimdal/lib/krb5/krb5_locl.h:122,
>                   from ../../source4/kdc/wdc-samba4.c:31:
> ../../third_party/heimdal/include/crypto-headers.h:5:2: error: #error "need config.h"
> 
> Is it because heimdal in samba turned out to be somehow unconfigured
> before being built? Mmmm...  Can it be that the samba built system
> found a _system_ heimdal libs and decided it does not need to built it,
> but parts of heimdal sources are used during the build anyway?

..and fixed this one by removing the check for #ifndef PACKAGE_NAME in
third_party/heimdal/include/crypto-headers.h.

After fixing the 5 issues, the build finally finished successfully.

But I'd love to see some explanation as of what's going on there...

Thank you!

/mjt

