Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BA88776098C
	for <lists+samba-technical@lfdr.de>; Tue, 25 Jul 2023 07:43:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=FpHxaqeJhCEuXwMwu59byZ6LVSgvz86LhT6RTuqjgCg=; b=jR1EHzRwA5CAlyC47npZH7J5te
	p1y6IhMTGcV5lXRxrtwM8TZuqFCFEmmyJSTSilGAQUZNwRm7Oj/T2cCl1+swJc0v2h0Vg9MPuRs4s
	Ar9/mgx/pq+BiDBKpvJwf1GIEJPb/alqd23KbkwLBeZ4oSZpofqDm/sJ4xUMppfvyCyONE3mgi/Vf
	HP/FtN1j2Bew7O2C1pyKf0riWTWJcugRQu30c9UfAoYe+MURVObEYs1cGcScBzRjW2fF8MkIA4Bb8
	6V5q18bejpcaTBbxSCsOz5JAMJuczw0tTKPHgi3lUe+XFEtScEiDOsKqXEvukdqL4vRfi/KJmVEVP
	uEkgTYtA==;
Received: from ip6-localhost ([::1]:64150 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qOAp0-0051Oj-Jo; Tue, 25 Jul 2023 05:42:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38472) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qOAou-0051Oa-Vs
 for samba-technical@lists.samba.org; Tue, 25 Jul 2023 05:42:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=FpHxaqeJhCEuXwMwu59byZ6LVSgvz86LhT6RTuqjgCg=; b=nJrZk2SkSf5+1JBMPWwWEnOcaU
 kmZnxjZJJn+2V9notM1QQTbNc3PsSSVeWo6WPlGza/N7qGcxd5X8SDkMmqhCk1/hpwQ6cAOyTFbnn
 XY9z0xBb+7tC513DoMGQwLzUvYHx1QGGsO91h5JHVDCcglFW7xJPyi4bSBJfQM2LnWCyFk7AWzgPU
 aSyZkO96RRJQ5YhT0fNXiVucWo4PGbpQ8zWyn6cRyym9tMDBDZHFNx5Dqqc9MP4Hik/3Epw1lgPGL
 CiR+IhFT9tCtB0bXHD5Od6FzvSGlPkucBgQFUTzIORoRtsiXc3e1H2cLMy6w0LQxh0VigXg3Loyq/
 9Amly51Ejbnq3JBkAsv7zcPTIAxJsuQaj5Faa0KMfsc7qmroGtPQ6FIA9CppexR0bJ8NrQUXbllmn
 SMxlpEquxYn6VwB2r8fBPfUQptBZMH7VlodkyJnINgmxIXn92n8Jkt7BaWAPD3GU1n0GpWZk7HAB6
 Gx5vJR0PwRrvFyjyab+MIqye;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qOAot-003wYO-0C; Tue, 25 Jul 2023 05:42:51 +0000
Message-ID: <d37fb34bffdc0ef6f3bae57eef17a399f46d37f6.camel@samba.org>
Subject: Re: increased `make test` logging in syslog with "debug syslog
 format = always"
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>, samba-technical
 <samba-technical@lists.samba.org>
Date: Tue, 25 Jul 2023 17:42:45 +1200
In-Reply-To: <6a0d3223-321a-624d-111e-1c1a67ef4396@catalyst.net.nz>
References: <6a0d3223-321a-624d-111e-1c1a67ef4396@catalyst.net.nz>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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

On Tue, 2023-07-25 at 17:19 +1200, Douglas Bagnall via samba-technical
wrote:
> Since 83fe7a0316d3e5867a56cfdc51ec17f36ea03889 and 
> ca7b7bde3915a821b1b9911abf18d2d441665382, aka
> https://gitlab.com/samba-team/samba/-/merge_requests/3034
>  ('Add and use in 
> selftest "debug syslog format = always", which logs to stdout in
> syslog style'),
> I see marked increase in the number of samba lines in /var/log/syslog
> (or 
> journalctl for the newfangled).
> 
> Now, those commits ARE doing something useful, but what I can't quite
> work out 
> is whether the leakage is a necessary part of the usefulness, a
> regrettable but 
> difficult to avoid side-effect, or something we could fix in a flash.
> 
> Does someone now?

My intention was only to change the output format, not the destination,
so as to get more information (time and host etc) in the logs as the
previous logging to 'stdout' lost a lot of information.

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead                https://catalyst.net.nz/services/samba
Catalyst.Net Ltd

Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company

Samba Development and Support: https://catalyst.net.nz/services/samba

Catalyst IT - Expert Open Source Solutions


