Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 735363A8D83
	for <lists+samba-technical@lfdr.de>; Wed, 16 Jun 2021 02:33:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Cruu71LP4ej0Gh1DvNoZmTGZw7v+4hEL0/l/JuVik3U=; b=iEO6KOS1Jq2P5aQdKhTzbM0pG/
	tBDYNU76MsOUSGMpf/nwrMuhLwxrFT9cm07MXWeSzMJJLJfpo3DWjN3kPbLXTrTM8QEsZUL/GYvXZ
	8tNY1NzGkBkQdywzjlR1lpf1pIN8joMhNgJ2mPDpMk5+4fYAnFnW0gHhosSAVBfuKIUcoxfzpMnlZ
	FjApEPdEw79LbrTRHEPUQldDYwvJSnNVTW+aZQZOkUaAro+rdf34KW9WkKAR8vzjJcUM5Sl5/btrb
	j7Hqv8LQYPTgzNI+TOGWNkE3yplU1feoi79WcUaAP3R88JO3nRKeT/wJCcAj3TdesLAKkbgqFnkGw
	95i8OV2A==;
Received: from ip6-localhost ([::1]:23466 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ltJU6-0065fs-0j; Wed, 16 Jun 2021 00:32:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15040) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ltJU0-0065fj-Fm
 for samba-technical@lists.samba.org; Wed, 16 Jun 2021 00:32:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=Cruu71LP4ej0Gh1DvNoZmTGZw7v+4hEL0/l/JuVik3U=; b=AdkXgwbwRO3J0wibhuRXQ/Rowq
 aF6issBN1mvbHyaq30HvjOOsnuSgZsNyzDJCpDcMDT0szV3CvaFYqiYLbSLXji0Kn57ifdvnaJVNd
 HO0m0i/NOdhkpahC1p1Iw2Nz8w7oqYpd9O0TUQO8XmmRbPUHoB8LK9ZfjU/UTioBeG47pRHg+FKec
 xPN8jzCT2QY5dXDJ/dPWa/u7aFmpeqcXOmJtmd455NNuvL0w/hddtH19CYyBOffDdziRmkjaELTvc
 5o6F//bLob6KA6cEOpWU6bbh/RSDbhVJmHZXH5Ei6hy7OnlUXeF8ABuzm+jbNYQEVmZufyLz3TCo7
 crfNSJHzX8/vX7zINncbS/b8AiEXk13qx5iyOtfg2WcblbkA31LyLFk/qloqQlnxqbal3sil9Zlp6
 E817rmgEZ8U55ioeTgrTrSncjA5xuRGI/t1sbuBR3NGX9G7PZQc3NTIgDi/fpqjyJQ9niq/2h+m3v
 kvm+o6A6I/YzUv+QltSAd4QX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ltJTy-0006cN-Ug
 for samba-technical@lists.samba.org; Wed, 16 Jun 2021 00:32:39 +0000
Message-ID: <7fdef57a108e8e66815585104955417523e43e4e.camel@samba.org>
Subject: Compile errors in Heimdal: re-configure
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Wed, 16 Jun 2021 12:32:33 +1200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

If you see:

source4/heimdal/lib/com_err/parse.tab.c: In function ‘yyparse’:
source4/heimdal/lib/com_err/parse.tab.c:1487:20: error: passing
argument 1 of ‘yyerror’ discards ‘const’ qualifier from pointer target
type [-Werror=discarded-qualifiers]
 1487 |       yyerror (YY_("syntax error"));
      |                    ^~~~~~~~~~~~~~

Just re-configure or blow away bin/ as I've updated our build system
and the old configure results are not what you need to keep building.

eg

 rm -rf bin && CC="ccache gcc" ./configure.developer && make -j 

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


