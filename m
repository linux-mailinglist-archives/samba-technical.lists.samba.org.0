Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E20A1102D0A
	for <lists+samba-technical@lfdr.de>; Tue, 19 Nov 2019 20:53:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=uwa1rOpcKuOGKEJYaHKlKop8ekP9FEefee742LoVSY4=; b=cWDtzWMMoQqNDgRH1BHoWMSkvv
	SD4TWhC0Pn7SgF1xk0RMByCgbNkebinVsZW10WzrJonB8jRROituMZ0wDf1HX3OCBFqHr5+5rPh7K
	rl8+5aLwOt/0bbijiIQYbhK8AEh42AfcHjUTBYduA2jOBgdwSXlRhgAmSBwwo3+74bHHwYSv7+SBA
	p7jxesIIdIZezv+7DgmfJpQHe/hI556iTknGt7f3ed9FWmrBRBAkqN3qY2inL2Y18p6UKg0sazf+1
	qnIVoCKtRBHTX69TeTeT5875OdqReRwXn21WKz3vwac29aUwC5OamiwJvR0IfF7+7S8HD+FCcUb0X
	lFS3NttA==;
Received: from localhost ([::1]:21568 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iX9Yn-001efs-Tc; Tue, 19 Nov 2019 19:53:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13940) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iX9Yk-001efl-7m
 for samba-technical@lists.samba.org; Tue, 19 Nov 2019 19:53:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=uwa1rOpcKuOGKEJYaHKlKop8ekP9FEefee742LoVSY4=; b=oyWn4LD0LOUXAzpCIBhIqZ13dj
 XpN+NTTU6FB/v4XAMImlQJOpi9m7ykLSgr3Be98//DNuuJKGWY2Gn0Jvs3zI8D9qkQN0Ges4G25j/
 kBtTss4zm43vfQIjUeOtRVRhrWlucqfq7yflaNjvdbaNz+xKc3sfvy2hTKtF5NQUh2cr4Aul+nY0v
 3yS1KUQhYuS0L1x7PyAKlPP8ZSPQ0bemfYWcmymYxyTFmEYCuGaVODh6F27uEyshHUKL1AWjCCml+
 1VZwWy8o4AUT0I1dCoDsErkWJz6VNS9k1OHtnKHqH+cBhR1ib/NOl/icjfNj816CTAiU3hiBb9Okt
 3j+FfOTdxV8fDz0ZgALe0tzhh/BqPRV1pPgJ1v9r6ES6DofT8pKVp4mHdc980A5jH6Ub35NotZZEZ
 kirisAbKAZGlUTM+ZzoDjrWHt5UpIeFFylxFTWLxC9GbuV50/v7phcdtBiHdwn31u7n8YsbMV3Gsp
 kwS1CAbq+tX5F3sGodB1M3w/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iX9Yj-0008Qv-AI; Tue, 19 Nov 2019 19:53:09 +0000
Message-ID: <9dc8dc485f6bdf08823c5a86043c459c51ffd173.camel@samba.org>
Subject: Re: feedback on ldap improvement in samba 4.11
To: Denis Cardon <dcardon@tranquil.it>, Samba Technical
 <samba-technical@lists.samba.org>
Date: Wed, 20 Nov 2019 08:53:04 +1300
In-Reply-To: <4ac9eeeb-211b-ca35-d234-6648c612ce3d@tranquil.it>
References: <4ac9eeeb-211b-ca35-d234-6648c612ce3d@tranquil.it>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2019-11-13 at 11:24 +0100, Denis Cardon via samba-technical
wrote:
> Hi everyone,
> 
> I just wanted to say how impressed I was with the improvement in
> memory 
> handling in ldap server in samba 4.11 that were announced in the
> changelog.
> 
> I was doing some debug on OOMKiller issues on a Samba-AD 4.9 with a 
> large database in production. There are some buggy softwares that
> make 
> queries for all users (the most peculiar one I have seen is a print 
> driver...) and Samba 4.9 properly handles the query but allocate
> around 
> 2GiB RAM for the query while the client downloads the result. With a 
> handfull of such queries piling up it can quickly run the server out
> of 
> memory.
> 
> On the other hand with Samba-4.11 memory is allocated in a much more 
> frugal way and it can handle hundred of such buggy queries without 
> crashing (it may be slow but it does not crash). So kudos the
> Catalyst 
> dev team for that great piece of work!

Thank you so much!  This work started long, long ago when Simo (at the
time controversially) made ldb async, so it was really nice to be able
to finish the job and see the end result finally show in something so
valuable. 

When we did it, we were not sure that it would help outside our
synthetic benchmarks, so to hear the difference it makes in the real
world is wonderful!

> About the prefork model, the master ldap process is properly
> restarting 
> the child process after a SIGTERM but it is not restarting after a 
> SIGKILL. Is it normal?

I get Gary's view about a manual kill -9 respawing perhaps being
unwanted, but I agree, a re-spawn system that doesn't cope with the OOM
killer is less than ideal, I would have expected such a process to be
restarted (perhaps after a bit longer wait). 

Andrew Bartlett

-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba






