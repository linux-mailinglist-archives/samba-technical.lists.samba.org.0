Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F4A4F132B
	for <lists+samba-technical@lfdr.de>; Mon,  4 Apr 2022 12:31:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=D1OsY+aIfbuUf+2gHZWomjq2DFshoCu8W4Ns4Nh1880=; b=WOEfS6qyGqwr3NNv12uFeB44z5
	keKFk3ROuNLVQqpzFZjWQ6Ezg1rg04QFWLufp676OCF0sWR8zXM51jJ+W1i4Pv+RnG1bhywgQc2gf
	3QCJaORbK47GcvAzI7lTwd3DENiNCZA6iFO49vetVDJCIhzVPQAJCMHS8Y5ImsfvqIsqG09g45BBD
	Vp0xqjuffQdZaAVpyWI+6+dOZAn6k6dQ7VHusXy9n/Cn2NisJGX/njkj1ik7hrSdN+xfH2NSVY/yd
	/agFzJtVkt+I+bp7TAD3PIoIA4vl5UD1LCRE+HdA5a5duH+E/3MsLsJzcrdWgkTv06ND8avwshoV5
	OSTo50Og==;
Received: from ip6-localhost ([::1]:31696 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nbJzA-009luN-J4; Mon, 04 Apr 2022 10:31:00 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:41245) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nbJz5-009lty-D9
 for samba-technical@lists.samba.org; Mon, 04 Apr 2022 10:30:58 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id E62904016E
 for <samba-technical@lists.samba.org>; Mon,  4 Apr 2022 13:30:51 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 1478B30C
 for <samba-technical@lists.samba.org>; Mon,  4 Apr 2022 13:27:06 +0300 (MSK)
Message-ID: <245e18ba-a620-6a19-33d5-8794f010a617@msgid.tls.msk.ru>
Date: Mon, 4 Apr 2022 13:30:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
Subject: doing a test build of samba
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

Hi!

Not-too-long ago I discovered that samba build system has
at least 2 different "build modes" - one build for "this
directory" only, so it can be run directly from the build
dir, and another is an "install build", - the one it is
doing when told to install things (it recompiles quite
some objects and relinks almost everything).

Now I'm exploring the testsuite and how to use it.  But this
time, one has to configure it with  --enable-selftest.

I've been told that the --enable-selftest build should not be
used to install things for production.

Is it still the case today? Can one combine the two builds
somehow (say, one in bin/ and another in testbin/, or something
like that)?

Thank you!

/mjt

