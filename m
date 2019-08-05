Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3158279F
	for <lists+samba-technical@lfdr.de>; Tue,  6 Aug 2019 00:28:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=TOJ5/c6MMeYn++PQoW1NxD0BW1KzccOfS27Gj6dJqIo=; b=f73S6zRKcLQxBcwHi/QapK3tVr
	OTkH+IaHKGrJSZgxqDZJYPeFXg8yJIp8/uWgWbnG4lKgw2FVOaO8rxixTiSFV3ZCeE0MoTnKhcK29
	/FlKwLGLO0R3iB9ZxyuWdiQnJdIKai/mPvf6ZLfSTJ/vZOW57wdhbXdcnA0H5TcP7MK5AO1tmWpH4
	j6XHy3qgy0kFZCJL1sMuQ2dRjZnxypA29KMZvr9BeqiYJ6gfUaZJq0vhldG6lXdRviWEwaZOyGBqc
	96J5mHeAQYbkwFxtTfDaqHaH9RCXwRhRL+DKz65DShg2LRiOD++7BJSxMR9lt+4M0BsjJkdKn8pkb
	UYdlfKIw==;
Received: from localhost ([::1]:26482 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hulSJ-004LuR-G9; Mon, 05 Aug 2019 22:27:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33192) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hulSE-004LuK-VW
 for samba-technical@lists.samba.org; Mon, 05 Aug 2019 22:27:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=TOJ5/c6MMeYn++PQoW1NxD0BW1KzccOfS27Gj6dJqIo=; b=iPadAqirWgD1kJ5EfqHOSOOWlP
 HM8ga3Fvh1wT7fcasj54tBVBGZZaWTUYnCfpyOyn8UA9+nxA6v/ePRupM11bKbGsCnoXGzD4Et1/q
 lfD8fTewJP7WyE//WgrSP62UW8YMWfxSVJjZLCUZaP7PHVVEV/MAFT4JgY69gAsu0mpY=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hulSD-0006b7-2v; Mon, 05 Aug 2019 22:27:45 +0000
Message-ID: <1565044061.15865.25.camel@samba.org>
Subject: Re: ldb bug?
To: Andreas Schneider <asn@samba.org>, gary@catalyst.net.nz
Date: Tue, 06 Aug 2019 10:27:41 +1200
In-Reply-To: <42283926.1TdCr3XVcX@magrathea.fritz.box>
References: <42283926.1TdCr3XVcX@magrathea.fritz.box>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAIAAADYYG7QAAAAA3NCSVQICAjb4U/gAAACRklEQVRYw81YS67DIAwkVe8FPRm5menJeAu3lmUCbyBGKqsmRXjwb8Y5aq3hl9Yj/Nh6Tu0upZRS+EdKiV+e5+mJqMKLiHLORBRjzDmbc/hlvb1QD2k3sG84+dhhvF6vlzymlNY8dyBJzUdLjAwyvaeU8n6/2WHpu/xDRkREJI8cOBMgfuRQxhj58JzzbBwhQDFGA07M6/efE0MQxDHGFvpdQHy6MUxqtU4yezRcH0B4GfbM44BWGqOurF6Omz140a0ASimJvdbwZT32XrpRh5yuwY1d0vPrdNkv91+T8uBRG8l1uiX+JtsHxPNIWE27ugwTctTdHCIiYXvuy4P7IDl0CxAzl2xgZTJwgw+g3kGaHwYh5g2sljyrjIVEq4pYBg2Kq3yXZ5WxjfO7zF9jRdXrnLcEmlbTRnNpcT0gvpTScUC2HlOE2ipAvPuJanMT+Xc0PC4dFzu1DEO4HgczaS5kOnZ4vM7zxNU+mtRyRVPDgqyX3cdx8AQCCrQnfkV9VzMA9Ryg3ek8Sgsg3QX+nbz03Og5l10ytp6HusQUwpjd1rnsksbHlhjuVGdBAbWzIiJu5MvEFkA6OkiwBO4uQL3ADeQ9b57t74+FBo1s47IqpVxqBDcuQ66r94QQJOH2ctnAf9oZtdbZYejpi2bQEveO0sb2JXu09OJJrnpil4SV5G2N6Y+1QjL+gHSKDApHJoJWF3hW2fInh6lutGW216OPRBZtRZscwyQvI+KuTj3rp4VP1VsAcTobxgDngukqm3LPgmL8A4m377Y5OvTKAAAAAElFTkSuQmCC
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2019-07-29 at 19:05 +0200, Andreas Schneider via samba-
technical wrote:
> Hi Gary,
> 
> we got a bug report an issue with the ldb_lmdb_size_test. I'm able to 
> reproduce the issue:
> 
> $ ./bin/ldb_lmdb_size_test
> [==========] Running 1 test(s).
> [ RUN      ] test_db_size_gt_4GB
> A transaction is still active in ldb context [0x56317c9e5760] on mdb://
> apitest.ldb
> [  ERROR   ] --- 0x35 != 0
> [   LINE   ] --- ../../lib/ldb/tests/ldb_lmdb_size_test.c:186: error: Failure!
> [  FAILED  ] test_db_size_gt_4GB
> [==========] 1 test(s) run.
> [  PASSED  ] 0 test(s).
> [  FAILED  ] 1 test(s), listed below:
> [  FAILED  ] test_db_size_gt_4GB
> 
>  1 FAILED TEST(S)
> 
> 
> The apitest.ldb file is only 12KB ...

This test is not normally run, as if successful it would fill the CI
machines.

The test regressed when the default LMDB DB map size was return to the
LMDB default, with the 8GB default being specified in Samba only.

The test needs to be modified to pass a larger map size to the
ldb_connect() call as an option.

Andrew Bartlett

-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba





