Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E3C60CA56
	for <lists+samba-technical@lfdr.de>; Tue, 25 Oct 2022 12:50:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=TsJ/JzgerSpiPUizlwBT1Ww8EuGPuPDo5p6hQgSXwS0=; b=fjSxh+5CSsYjRTLR1TKMAGHX82
	Y4NJnvphJQZX4swGcpCG+QBu7lSv4DzbiPlTo5uOLVzWA5xjVxcLi28CqMnVakzR6s7V0tp2F9768
	SWfxxSPHSxQA8bL8zEo5PQkD98L3/kNEWwJEb96dsDaDEbQhHZlUnLPKW2I6bXhyDNGUmXvaNwwxm
	I+mGZhqn03bU+vHszVGyshTPO0WkZtBb1/6mW9nvnT/bvkRIfEcsLiCAXajGclT37d8z12w6oSPCY
	9XUMMCVeq/t7GbrGV+uXlJ6vbDkYsr9PwiAlzTsbJ5fvqTuFLCKQyCi4pNWbm3uWnEjXmwDB8UiU5
	vtEdE82A==;
Received: from ip6-localhost ([::1]:34938 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1onHVZ-005rLR-6f; Tue, 25 Oct 2022 10:50:09 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:47091) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1onHVS-005rLG-Ap
 for samba-technical@lists.samba.org; Tue, 25 Oct 2022 10:50:06 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 9017B40D93;
 Tue, 25 Oct 2022 13:49:51 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 9206513A;
 Tue, 25 Oct 2022 13:49:54 +0300 (MSK)
Message-ID: <afca8f8d-f9df-3489-902c-bc82ced76731@msgid.tls.msk.ru>
Date: Tue, 25 Oct 2022 13:49:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: running only selected tests in samba sources
Content-Language: en-US
To: Andreas Schneider <asn@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
References: <587ebe9d-3f91-7389-5ad1-c6d96e435b99@msgid.tls.msk.ru>
 <5854748.lOV4Wx5bFT@magrathea>
 <7fc71093-524a-2936-32c6-c41d83777569@msgid.tls.msk.ru>
 <2656048.mvXUDI8C0e@magrathea>
In-Reply-To: <2656048.mvXUDI8C0e@magrathea>
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

25.10.2022 13:15, Andreas Schneider wrote:
> On Tuesday, 25 October 2022 11:16:30 CEST Michael Tokarev via samba-technical
..
>>> https://wiki.samba.org/index.php/Writing_Torture_Tests#Running_tests
>>
>> All this applies to a build with --enable-selftest. My question was how
>> it is possible to run certain tests (like ldb selftests for example)
>> without building whole thing with --enable-selftest.
> 
> Run 'make test' in the ldb package. See the libldb spec file.

Um. What *is* ldb package? Do you mean the separate ldb-x.y.x.tar.gz tarball?
I was asking about the ldb bundled within samba tarball.

Does samba ship spec files? I don't see any?

Thanks!

/mjt

