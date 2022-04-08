Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 515704F90BD
	for <lists+samba-technical@lfdr.de>; Fri,  8 Apr 2022 10:26:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=39x5nQ6l92K7OYXIdfEQMQeI7YDmOdOggmF01pE9sM8=; b=t4un6FxkHXd6DVAdo3GejcQIRz
	m5eq9W8W39IKs9ZIF8YYYVZ+Pg/QFZLsVz5EiNh5gTubxqytNVeOAPr1yLZnRx6wKxXEUKlZCb3p7
	FoKPX0o/s6RnWkFQGLJUWcjJ4NoazyrjdvUyLFAwAMs7JtJXELg8V33OUENtB/Sf2XO0st71A/rjG
	d6SrG0buFOwDdxK+UPI5ZH8jxeW8vy8NivpBK5wpRLBzi7YOCXnT2B6d2UNDQbvkvKOUVHXx0venc
	jrD2nXnjj5P7oAImV6krhN7LE69C2kJm2nrzC3Rz6TjeAqxVA7PBd8WIW/ygzOREBXEJfMApZlr0c
	nPNoq7og==;
Received: from ip6-localhost ([::1]:58024 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ncjwB-00B4aU-GQ; Fri, 08 Apr 2022 08:25:47 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:37037) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ncjw5-00B4aL-TX
 for samba-technical@lists.samba.org; Fri, 08 Apr 2022 08:25:45 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id F33E540150
 for <samba-technical@lists.samba.org>; Fri,  8 Apr 2022 11:25:37 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 83FD0352
 for <samba-technical@lists.samba.org>; Fri,  8 Apr 2022 11:21:52 +0300 (MSK)
Message-ID: <237b5bea-9cf2-6f77-211d-908810d97953@msgid.tls.msk.ru>
Date: Fri, 8 Apr 2022 11:25:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
Subject: downstream packaging of smbtorture and other testing tools
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

In Debian, for a long time we ship samba-testsuite package which includes
smbtorture binary (the main part) and a few other similar tools, --
gentest locktest masktest ndrdump.  Apparently fedora/redhat also ships
a similar package.

I found no good usage examples for these (smbtorture manpage does not
make it clearly), so I asked a (seemingly simple) question about what
it is and how to use it.

Is this tool set useful for a linux distribution somehow?  Or maybe it
should be built in -enable-selftest mode only, for internal usage?

Thanks,

/mjt

