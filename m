Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BE91F3446
	for <lists+samba-technical@lfdr.de>; Tue,  9 Jun 2020 08:47:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=QKWzwijrehDeTQp2Jrz1xRSYSLDhZqhWeC6WvlTsCtM=; b=Z2jXjBzBM/Uma/j2A1DhKt/exc
	7UO11qTtrlkmTH30B+9yQahprXR4llFEFYvjGUBZMu7O6SEP5Nr4TdCDkRHdfkXT6iyfXOGz7HEY0
	Nlt961zewJ85ssX4v4nxxHTx1BsFBPLEdDr75b9QnfqhKqeoUIwtF2U58ez+JAymSwmlRtN2/PyGI
	L0s/Q44DIHv45ivpjCNC2BVAcca2eg34b44TAYm8qlhvD6th90kjMr+OyhjvhD7YQYSCMqljtOtEk
	bdy3LtRO9+SS5O7V6fRy3qhU4UAfBSmEpNoc6OnVudO71e8SyJ3g5LTdtGdmoAA8p6hEyxp1k6h85
	wm4bIXzA==;
Received: from localhost ([::1]:21870 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jiY1N-009Z1w-74; Tue, 09 Jun 2020 06:46:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61680) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jiY0z-009Z1p-V5
 for samba-technical@lists.samba.org; Tue, 09 Jun 2020 06:45:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=QKWzwijrehDeTQp2Jrz1xRSYSLDhZqhWeC6WvlTsCtM=; b=bsa3ZboBsoHPun7Xn0t4S3Fs3q
 DXmjy4bZ0uQa/jZLH035TDvgKh4Q+J35pX3f66Y11EiAZtqWg8bvGgrmKBLID+ZGHRo7LwS9RgFxG
 PcM7beLN2KdYIAvxbap6pXOGfxh3KjSZpRo10nSombhIPEIOXCvFE2SsqIIVaCgs9b5ei4Plez8iZ
 YYGkcKoSKKgxeFFxu4OZkXScNwzYTWzW5c+4/2DJwiCWa/otZmHdE3lTwrjy63dx/F/SzZOlbUXVG
 S1S9qTHMALkkkeYw4Y41cdnCa8B/nKAbUoixsUq5F8WbvOySsjAupilyNvoUO7W4EBhPKF5gZcMIS
 e3XPpYVaxctCG7GZ3yx4BESAHCmOUyPEhSduUWeu7mikKz6BKJLWvJ/QJkMekhl/iBc6iQZthFaE7
 KcBRLQvESmupgpnb0mFiw8AhBPwOt9v4ecdX3Z+xnUdDvd4pMu6+hh7iiBhjCdR2Jkn4lk8sZtbS1
 DLf9J5UwcHpKrswRrUwLuSuU;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jiY0x-0008Gd-6V
 for samba-technical@lists.samba.org; Tue, 09 Jun 2020 06:45:39 +0000
Subject: Re: Avoiding further (LDAP) stack proliferation in Samba
To: samba-technical@lists.samba.org
References: <7f08ecb52a4a94d95e39af436e94ab852cf0da55.camel@samba.org>
 <20200521012158.GB10353@jeremy-acer>
 <4ce022a6c65422e40e1a583f95cefbbc7585393c.camel@samba.org>
 <20200521021959.GB12847@jeremy-acer> <20200521214312.GA12586@samba.org>
 <854ac3b5d75279a13ebf3c5a6e9f4fd5b9eb8943.camel@samba.org>
 <437a7ad7-5158-9124-9ba3-939a3bfcee53@samba.org>
 <b20bcf09b119aa0d0585d27b24076bdd17157caa.camel@samba.org>
 <20200608231733.GA839@samba.org>
Organization: Samba Team
Message-ID: <6caef0c2-7b6f-4665-8ae4-6ba9c2f565da@samba.org>
Date: Tue, 9 Jun 2020 08:45:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200608231733.GA839@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Am 09.06.20 um 01:17 schrieb Christof Schmitt via samba-technical:
> Hi Andrew,
> 
> as Metze wrote, there is still work to be done across tldap and ldb, and
> probably more questions will come up, which libraries to re-use, how to
> handle dependencies to those, etc.
> 
> For winbindd, the long-tem goal is to improve failover to different
> domain controllers, in case of network problems or DC outages. The
> current problem today is that winbindd uses libads, which encapsulates
> DC selection, LDAP queries and retries in a way that is completely
> outside of the control of winbindd. So the idea is to move winbindd to
> tldap first, and then later on move winbindd to be fully async, avoid
> the child processes and keep the connection state in one place.
> 
> The goals to unify the LDAP stacks are worthwhile, but i do not see
> those as necessary for the winbindd changes. I suspect that would also
> trigger a wider discussion, e.g. which ASN.1 library to use, how to
> reprent common data structures, where to put these to handle
> dependencies.

I do fully agree on this! Why can't we go ahead with tldap now (which is
used in other places also) to fix the bug and do the re-design later?

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

