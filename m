Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB91629D0D
	for <lists+samba-technical@lfdr.de>; Tue, 15 Nov 2022 16:12:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=4BVaDvLqbCYuKUbkU2mqD7MxWJJFS850z1UmkCdGv2M=; b=ZqgMmaAkjlcVUwZ2AMnaNZvunA
	5RVBROBdAYvqZjSmBicLUlGNvJM9ZZF3z+sfL/KnqY5p/EZ4ZFL3qTL74/5EV0pAtPVUE6wh6Guf2
	tp1JxYZegWzGyDR1f0ojirMKuQC7+SvCyNXm5H8F9bJQNSO1NIT/OKcIR00/YCkwuyhWS1nQuVTNG
	gomMv7lsD7lxaobObyUZuiO9+sEoXoPNK3FeMjnyzqPOnbiz8Rlp3Cj6JL/1EBN+4h0cW3HldGjzD
	dInev0cCoLQTJuomfWwO5gnT5mtUN4MUHognI4F0g+6ms5221UGD6kKSjRYUHZOU+6lHCtPJldUTI
	R3IVG/LQ==;
Received: from ip6-localhost ([::1]:39028 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ouxcK-00DpkJ-37; Tue, 15 Nov 2022 15:12:52 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:45287) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ouxcF-00DpkA-C3
 for samba-technical@lists.samba.org; Tue, 15 Nov 2022 15:12:49 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 8D397402B5
 for <samba-technical@lists.samba.org>; Tue, 15 Nov 2022 18:12:45 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 6873E10C
 for <samba-technical@lists.samba.org>; Tue, 15 Nov 2022 18:12:44 +0300 (MSK)
Message-ID: <66781199-ab84-1c05-3224-ed65cb9b12bc@msgid.tls.msk.ru>
Date: Tue, 15 Nov 2022 18:12:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: failing tests in the testsuite on debian
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <4197c161-ef1e-3710-f50e-7631ddaf5f3f@msgid.tls.msk.ru>
 <de87d255-95d0-ac34-1544-fa0aac441f4b@msgid.tls.msk.ru>
In-Reply-To: <de87d255-95d0-ac34-1544-fa0aac441f4b@msgid.tls.msk.ru>
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

15.11.2022 16:35, Michael Tokarev via samba-technical wrote:
...
> In particular, one can't re-run tests, because on subsequent runs, even
> if you `rm -rf st' in-between, the result will be different, and different
> tests will fail and the ones failed before will succeed

I figured this part out. It was my environment which was buggy. It turned
out I tried to run stuff in a separate pid namespace without a proper
process reaper, so zombies from the exited daemons weren't cleaned up
properly and certain resources had become busy and was never freed
before this namespace termination.  It was nothing to do with the
samba testsuite.

Certain tests do continue to fail though, and I still don't see how
to address this.

Thanks,

/mjt

