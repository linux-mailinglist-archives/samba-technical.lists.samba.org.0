Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A10791C3
	for <lists+samba-technical@lfdr.de>; Mon, 29 Jul 2019 19:06:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=WpRNEcoy3muX29wZqDONXDv6xmFMfICE8D727l9eNeY=; b=ii42Tk5EWmlH8lmOo/NW6Kfj0o
	X+6A9auufetRsIahKV9ho1FZVxxLZaO6dmTW/L2+2SrjWw+oKwTVp4dhHiy5uO97zQ9uQ9kmwVxv4
	DhbapsHDyMocxjIt2cg/2aNdwZOhdjouMKk0yI0NhRTWpHNAqErC51qgxq52dCkCdt0ZW3Pc6DAXA
	IjUpOVIT8BxdCMvG50Hc3az0Ci113WNlQ+3iWSaMh6rtSCI1dgKcrbpMfrTO3QQ91wnxQNPwp/4+2
	roaWAsNG8OKQoPpDzAp7L08DApIln/+q5Gf27LQToxMOlJD62TLFbS/U/67//s7YqUKV8XcYFQPpv
	RRSsLU6Q==;
Received: from localhost ([::1]:37182 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hs95p-000ofp-Hl; Mon, 29 Jul 2019 17:05:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21106) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hs95l-000ofh-9B
 for samba-technical@lists.samba.org; Mon, 29 Jul 2019 17:05:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:Cc:To:From;
 bh=WpRNEcoy3muX29wZqDONXDv6xmFMfICE8D727l9eNeY=; b=m33dT8rYEXLRcOYhlZXRXiSBrn
 MFoP2hQT+Qb/zSekLV1BraUaqNtW9d0TJIzmyhict7PMdQn5rcvugIs3ggbaI1HUFG1ghO5yztWoI
 7uuiKqQB1jmJrS5Zcz8HRp29Sih2EXinUA4o4VSwQdc6o6D0yC9ytbnOj3pYZpwTcKJA=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hs95k-0001uJ-Lo; Mon, 29 Jul 2019 17:05:44 +0000
To: gary@catalyst.net.nz
Subject: ldb bug?
Date: Mon, 29 Jul 2019 19:05:43 +0200
Message-ID: <42283926.1TdCr3XVcX@magrathea.fritz.box>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Gary,

we got a bug report an issue with the ldb_lmdb_size_test. I'm able to 
reproduce the issue:

$ ./bin/ldb_lmdb_size_test
[==========] Running 1 test(s).
[ RUN      ] test_db_size_gt_4GB
A transaction is still active in ldb context [0x56317c9e5760] on mdb://
apitest.ldb
[  ERROR   ] --- 0x35 != 0
[   LINE   ] --- ../../lib/ldb/tests/ldb_lmdb_size_test.c:186: error: Failure!
[  FAILED  ] test_db_size_gt_4GB
[==========] 1 test(s) run.
[  PASSED  ] 0 test(s).
[  FAILED  ] 1 test(s), listed below:
[  FAILED  ] test_db_size_gt_4GB

 1 FAILED TEST(S)


The apitest.ldb file is only 12KB ...


Linux magrathea 5.2.1-1-default #1 SMP Mon Jul 15 05:32:47 UTC 2019 (bf5c01b) 
x86_64 x86_64 x86_64 GNU/Linux

Filesystem is XFS

lmdb-devel-0.9.23-1.4.x86_64


Can you reproduce this?


Cheers,


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



