Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E08F94F1F88
	for <lists+samba-technical@lfdr.de>; Tue,  5 Apr 2022 00:52:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=4efqXtLwss0c3wmFVXhXx0TRAlYJTtWfsyXwSjDfjp4=; b=VuRYvcONIjTwbpoth1RERQv4Z2
	j/BP10B5RQ5zyIDNvSvfUX29jbX/IDK751piaJ3T3N6sE6DMBjMvKSzYDXqujaS2GbVftKYThDR0L
	woYspblM7+lx/b1WQlWU4/CAEyzIp+AeW+F9PAprIVE8lXju6mmlYcix1vAhMNgM66xbe6OK8daZ8
	JwuOkdnQ3SevYLR1W1Gx006fzRUsf67XINCjxVsRF4/Fw/O5sTNYL0q6oUh2YwuV35VG9F5OOPvKQ
	OKU3tKl2EJHZ4jyoHpRXZzPtRY0Lg2BBI/LkYVKW3HRugZkk4SHNC9rSwAwfgR4NIm6c7B5LvVFAW
	qHaVb7Ig==;
Received: from ip6-localhost ([::1]:49046 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nbVYd-009uRL-EL; Mon, 04 Apr 2022 22:52:23 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:49159) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nbVYY-009uRC-A0
 for samba-technical@lists.samba.org; Mon, 04 Apr 2022 22:52:20 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id B077A40150;
 Tue,  5 Apr 2022 01:52:16 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id CCFE330C;
 Tue,  5 Apr 2022 01:48:29 +0300 (MSK)
Message-ID: <30f1d626-f8c4-ca8a-38d0-a2c7eb2ed03a@msgid.tls.msk.ru>
Date: Tue, 5 Apr 2022 01:52:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: doing a test build of samba
Content-Language: en-US
To: Andrew Bartlett <abartlet@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
References: <245e18ba-a620-6a19-33d5-8794f010a617@msgid.tls.msk.ru>
 <942d4519-909a-22d6-6e45-75b976a9f29b@msgid.tls.msk.ru>
 <2165e797b4fab04bd8b625b7b182bf2d9982d2d3.camel@samba.org>
 <81341b54-feea-514f-a2b0-3d0b4b5ffa60@msgid.tls.msk.ru>
 <5f048c2b3b9a93b653f19e2573b2f60ad4688af3.camel@samba.org>
In-Reply-To: <5f048c2b3b9a93b653f19e2573b2f60ad4688af3.camel@samba.org>
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
Cc: Mathieu Parent <math.parent@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

05.04.2022 01:31, Andrew Bartlett wrote:
[..]
> 
> Samba really doesn't want to make security support promises for code
> compiled with --enable-developer or --enable-selftest.  There are other
> #ifdef things, like fault injection (root-only I think) and in the past
> we would honour more environment variables for unsafe things.

Yeah, fault injection and sleep in smbcontrol, I mentioned that.

Now when I think about this, maybe it is not just "root only" it _might_
be more than that - say, different apparmor profiles or selinux contexts
or containers or whatnot, but you gain control over the socket and you can
do evil things. Probably still a moot point though, since other stuff is
possible already. But it is still something to think about.

Overall things definitely does not look as bad as you describe.
To *me*, - sure, I know right to nothing about it.  After all, maybe
one day there's some new code guarded by WITH_NTVFS_FILESERVER or
WITH_SELFTESTS by someone who didn't think some weird distribution
enables this on production...

> We try not do make it horribly unsafe, but I would be disturbed if a
> major packager distributed binaries compiled that way.

So I'm back to my other question, - is it possible to build it in a
different directory, not in ./bin[/default]/, so there's no need to
mess up with directory renaming?

There is --with-selftest-prefix= but not --with-build-prefix.

And there is, apparently, this:

wscript:out = 'bin'
ctdb/wscript:out = 'bin'
lib/ldb/wscript:out = 'bin'
...

So it looks like the answer is "no" :)

I just dislike the hacking around renames or duplicating the
source tree for different builds.. :)

Thanks,

/mjt

