Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEA15F0239
	for <lists+samba-technical@lfdr.de>; Fri, 30 Sep 2022 03:27:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=SP8jJLLlaKR9hndDi9YL/EE69w52mNu6cWG+4rtsvag=; b=N3VEqH+SKaA1jf24BJHkSocJYC
	Msz87tcSL2UWJujKW4eB3PjKrXeGNaG4nDliFQjlI0Mmk4bnu4qeX4HP8jPLOhbxOF4k+LVSSBCnt
	B07gsLkBizoKvRSPEOTaXgYJR0faXMN9iqj136ALSVWcKwIndpKD/1Uhgp728ExYOsPA7hEOZFPzB
	j6zpiVSDm+FVghEEdOYsySUyxNyxW0fxgEOiY5k8wWjFcURdm53yh96+qc9UcykudL4DdVhtQYsQH
	+FJSakUNObyHvhgpfBbrnSVRkKKbs1K+N/MxrQ7U+vkavh2eBsM/j4l2knr5ZY0ysW1iTngK727og
	WuUoT0BQ==;
Received: from ip6-localhost ([::1]:42048 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oe4ng-004uDG-SF; Fri, 30 Sep 2022 01:26:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29230) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oe4nZ-004uD6-68
 for samba-technical@lists.samba.org; Fri, 30 Sep 2022 01:26:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=SP8jJLLlaKR9hndDi9YL/EE69w52mNu6cWG+4rtsvag=; b=IGyS2S7/z1rYeDx03ByN3gDoZy
 Iw5mvtehe7NLBsaPHJgn9r4re0s7CT0QdQdtxyONL/g1lUBxK0zATRZtX7o1ObeRFTPyrax2w/bv3
 Fftx4Q4geLBFxWtl2OQsKvy2xXRchmSe/frCH6ed/8xYuPQ7I8hQNiRHd9+s82vvp5LnF6x8OqpPR
 5gc1mMIWDP02jPw12srFc4aI7mxModQ2GHEFwmLLGSopH6Aj7Qds2bU4/QIaPPv8ZlecXypEYSnth
 syGkiy4SxxeJ+rCcLbXLWGkeYc8NedTPK/po3CeZI/b7VkgP7I8jp5eJPhrI/oQF3kIyZN/1UVIAQ
 3AVC25gjUjnPFfuNveSNMAO0blppgtHby26pSq1QqUzxD9iltx8NoGSrB5dUCAH4Ko992SQrABO47
 Ttc66QwCRt7SB7P4POzFqbN/6IJmR/fm2aTAfGB/c9dFz1m+V6wG8K1hksUtoz1QUOrww1ZLvO5qk
 DUJI6AzVe/2F8sQpHvuFyIxy;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oe4nP-002QRk-Nx
 for samba-technical@lists.samba.org; Fri, 30 Sep 2022 01:26:32 +0000
Message-ID: <d0c713564b3c9f848bab99ba74f3ce79a5add2f6.camel@samba.org>
Subject: How to detect a client-closed connection during a write from our
 LDAP server?
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Fri, 30 Sep 2022 14:26:28 +1300
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

I've been trying to chase down the CPU spins reported by our users in
the writev() codepath from our LDAP server.

A private mail the the strace output shows the sockets are in
CLOSE_WAIT state, returning EAGAIN over and over (after a call to
epoll() each time).  That alone would be enough to keep things
spinning.

But they are being shut down, however our LDAP server won't be
triggering a read any time soon, it is waiting to flush the response
out.

Technically even after our server OS has got the FIN, there is
potentially data in the read buffer (so a read() might not return 0
anyway), but perhaps most of the time that would be 0.

So how can we detect this?  Can we at least put a timeout on a writev()
call via tsocket et al?  If so, how do we do that?

Mailing list threads: 

https://lists.samba.org/archive/samba/2022-September/241869.html
https://lists.samba.org/archive/samba/2022-September/241873.html

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


