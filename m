Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (unknown [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8575124670
	for <lists+samba-technical@lfdr.de>; Tue, 21 May 2019 05:46:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=/7kyLjAjKp3vO3YkTwAqVjD4O5RgumF0HJqr2yogXL4=; b=WQrqGT9hP1VK7gt+i/imz9UZrt
	D7blDvdCjtWVtsAGa0C2Zvx3wLYjjFTTvIbcOOhPCtZylcgk15FMx25IFgzTcpbKooADQpONxTudY
	PcaBqy3EvkwWMKGo1AyTtVB0+WIw3n+bISUKVly8L30/8Gfbp1mLDVE0NmqC9/10GUebgMUJeND1P
	xtaZplZiexGe+7tZDmUyUf2hS2tDCxZ/enkdn519uChw2NGg+9MaPP8z6YimeXgUB6aoeGM6BgamM
	QNVCsPiLOVVr4o6ndr+juqZj7dC/Y9ofjqVbUZdG5lpVHQQz2lLb8BiIO6WowA+feQqrkScGyRFEO
	U91/dvXA==;
Received: from localhost ([::1]:29188 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hSvjD-000tL7-Co; Tue, 21 May 2019 03:46:15 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz ([202.78.240.226]:43156) 
 by hr1.samba.org with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim) id 1hSvj8-000tL0-EZ
 for samba-technical@lists.samba.org; Tue, 21 May 2019 03:46:13 +0000
Received: from [IPv6:2404:130:0:1000:ed06:1c1d:e56c:b595] (unknown
 [IPv6:2404:130:0:1000:ed06:1c1d:e56c:b595])
 (Authenticated sender: timbeale@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 7719C810D0; 
 Tue, 21 May 2019 15:45:51 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=catalyst; t=1558410351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:openpgp:openpgp;
 bh=/7kyLjAjKp3vO3YkTwAqVjD4O5RgumF0HJqr2yogXL4=;
 b=S86dq8lfsn0m5liwud9keNxkgq2f8XqGU7aU6V1gz4f/BN1pDIUAXYwGgE9XrrE0j2w+og
 SsFbBv/OyA+yG9ZGw4vTejN8VLnTPHwDzp4xoqs6pBmSwYgfZn+VLxrhtqQddDmlMc8EcY
 ntMkHQT2N/RQ62zgqCPAHTYyxTI8Mbk=
Subject: dcerpc.bare test is a bit flappy
Openpgp: preference=signencrypt
To: Gary Lockyer <gary@catalyst.net.nz>
Message-ID: <e538c255-9698-0464-f4c1-4116c2ed8c6d@catalyst.net.nz>
Date: Tue, 21 May 2019 15:45:50 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=catalyst; t=1558410351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:openpgp:openpgp;
 bh=/7kyLjAjKp3vO3YkTwAqVjD4O5RgumF0HJqr2yogXL4=;
 b=Y7TWJIhh1cvek1gRbdXzU6l7nta1CgBlqyqzgDg6YfF/wKTBHSKTpbbg0L7xdf8MNznhij
 SV3CHCaWWjQcIbBqGP2o6C/XzDRQ9/kOu/Dqp+MML17mFTYXdppkZRpgtDjKCYJV3+xNDa
 GMgPGAy8g4BAlf1nYwkAM8S2Dyw+5wU=
ARC-Seal: i=1; s=catalyst; d=catalyst.net.nz; t=1558410351; a=rsa-sha256;
 cv=none;
 b=kRyxjczlZbC0aPx5DQKvdGALieHo/w7K6sS7HgSB7No1yjYJpteYtd5nhVsZf1pzMUuIiz
 t5cq6QpLYkwmb4QVR1R0IGxNzSg6v2lC4QkikTBYVEAPDi9ZvZTEFHGmLtdCswSSD4E6M2
 Ra6p4lU/z23DrQ1k4kIhbRvra9tDee4=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=timbeale@catalyst.net.nz
 smtp.mailfrom=timbeale@catalyst.net.nz
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
From: Tim Beale via samba-technical <samba-technical@lists.samba.org>
Reply-To: Tim Beale <timbeale@catalyst.net.nz>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Gary,

I noticed the dcerpc.bare test is a bit flappy. I've seen it fail both
in gitlab CI and running it locally. Usually it just gives me an error like:

error:
samba.tests.dcerpc.bare.samba.tests.dcerpc.bare.BareTestCase.test_two_contexts_tcp
(samba.subunit.RemotedTestCase)(ad_dc_default:local) [
Exception: was started but never finished!
]

Sometimes the python test itself produces a segmentation fault.

It seems like it might be related to commit d65b7641c84976c543d 's4
librpc rpc pyrpc: Ensure tevent_context deleted last'. On master, the
test fails maybe 1 in 4 times I run it. I reverted this commit and ran
it 20+ times without problem.

To run the test locally, use:
SELFTEST_TESTENV=ad_dc_default:local make testenv
python3 -m samba.subunit.run  $LOADLIST samba.tests.dcerpc.bare 2>&1  |
python3 /home/timbeale/code/samba/selftest/filter-subunit
--fail-on-empty --prefix="samba.tests.dcerpc.bare."
--suffix="(ad_dc_default:local)"

Cheers,
Tim


