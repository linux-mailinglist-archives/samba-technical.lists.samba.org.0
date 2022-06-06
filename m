Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C059553F1DE
	for <lists+samba-technical@lfdr.de>; Mon,  6 Jun 2022 23:48:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=ufYOYg4oEy3bviIYK7QQSxUDAzF7im1PF6zlq60blZw=; b=gL0kwgQVdiGJ/AGSXNQt0aepq9
	IXU1+400T7qeY8+RC+n/C/KcjgcSApUXyDOREbdXKQuqI4O4+mCg0D05B+rCJzVHTbh7rHctdIjWZ
	etIVTbQIOjBoEaI5E7wpixeAX4VLZWcvPGCzKXy6H+xjUZ2j1FZ/VCSrwptytrEHCnK9q14EZDM4b
	BK/5Bs0a/lX6wgmUhp9ES6WC4CMuNxNT2wIbpiL9C6X+7VeGSsUD5Qhpe8YlUFihFWqnnXOk9byci
	TzWjOWo7ZyZvHwEcywwPcjWRMfagBlkVZ1cAndHxE+cIgVvO7NidioVFT1laVObKuinzZCnu8jtEE
	eKcqIdHQ==;
Received: from ip6-localhost ([::1]:46064 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nyKZk-007awk-BK; Mon, 06 Jun 2022 21:47:52 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:56341) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nyKZe-007awb-US
 for samba-technical@lists.samba.org; Mon, 06 Jun 2022 21:47:49 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 51E3940220;
 Tue,  7 Jun 2022 00:47:44 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id E2D3C13A;
 Tue,  7 Jun 2022 00:47:41 +0300 (MSK)
Message-ID: <3861233f-bf09-7124-30db-b61a71a924d8@msgid.tls.msk.ru>
Date: Tue, 7 Jun 2022 00:47:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>,
 Louis van Belle <louis@van-belle.nl>
Subject: move samba-specific libs from libwbclient0 to samba-libs
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

I just comitted a change to move libsamba-utils.so out of libwbclient0
into samba-libs, since libwbclient.so itself does not use this library
anymore:

https://salsa.debian.org/samba-team/samba/-/commit/59abd59e03a94a5410e95bf1ac156004288ba1ac

Please take a look :)

The thing works as expected, I verified it before pushing to salsa, -
I'm quite confident with it.  This is one more step to proper separation
of packages (as we already did with python bits in samba-libs).

Thanks,

/mjt

