Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D864E1020C2
	for <lists+samba-technical@lfdr.de>; Tue, 19 Nov 2019 10:36:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=5yK1lB1UdqKZnNnu8dVrXTPuYpYdyUDLz88xoWr9NpM=; b=VGE9tHZm0ptTBM2PNAEOXIjXm4
	yt4EUTt+nTzY9gg8yOPZbj2Sp0a3o7nWYeN5lHFUw1c0gWpjFhZx2ILGfh/4L/zbgG/Bjz2XVNX4X
	6Zk30liy1i5x+/i/uQocXLeGynxENdJqXIzEcBH+31EL69ofE+CLk6fSanPph/kKLCRfcx0nHdVbv
	z3gkgp7QMKcULRU0k2Cu77wPat/TGJRlAv88IGkg7vivrahjbRTpr27p5/GQRWx8s/PIEnLL+jHHS
	4f4Fng/NKMrW1J3n1WuIdlZWzoS0id+HDO9svnAWpUWzU1Ta1TLOJb7dDtrHosKhU+dkYQTxNqWvJ
	5ravsPMw==;
Received: from localhost ([::1]:63396 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iWzue-001cki-RI; Tue, 19 Nov 2019 09:35:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61930) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iWzuQ-001ckX-Ot
 for samba-technical@lists.samba.org; Tue, 19 Nov 2019 09:35:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=5yK1lB1UdqKZnNnu8dVrXTPuYpYdyUDLz88xoWr9NpM=; b=dwXzwm6PQem0njOIFB+yyqWpA8
 by1+OmLthVyVJT55rsvq3M5FdhmNbunTfKdBhMt7g0zSAVfKiOZuYWO2oPtp4j2wae0ID1HnqCQG0
 88+8gYRb4m+ja1ybaF4TX+PCCAk/uNDWeuv4IjSvW1hDfEUacQss0npzBoAZlCu8uPrykMn/Bt6tV
 u0mAKMDviCwiCTdRv0zBvC3OepC1xKk81XnPmuM141ZC1R+pg1i4EYDXs2jHF7PFFkE174hnwusJM
 GdhsIL/vT7MzhxLTltLefoKBw7KNUP6RZGhaEQAPEKyiq8kEj2gdixYmA0Z7Y/ekI/dVDiHSbhRR+
 t37DdbAnm8/BR59aIe+KLwGM8Ecn9YaARuZXawiKmjFel7522lm6V29IgN8E7IU6RXj9Vxk4ZI9I8
 V767KGLQxLxVp9OS6XZ23LGxSgZ03ru+zrjAgb4A+BZXQFUuoY7sB208kMeCYMbTzad8hYpUkqhBt
 Ufti/MPXaNKdJrvpS9oq/WSJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iWzuE-0003Ig-UA; Tue, 19 Nov 2019 09:34:43 +0000
Message-ID: <07de3a12a09f74c14e5f4328fb751ce251d31294.camel@samba.org>
Subject: ldb versioning (was: Re: library versioning)
To: Stefan Metzmacher <metze@samba.org>, Uri Simchoni <uri@samba.org>, 
 samba-technical <samba-technical@lists.samba.org>
Date: Tue, 19 Nov 2019 22:34:36 +1300
In-Reply-To: <50203bef-dce2-39a5-0b1d-7e47a10a6a8a@samba.org>
References: <4008ac5d-ec0c-c184-f5c9-731987718f8a@samba.org>
 <50203bef-dce2-39a5-0b1d-7e47a10a6a8a@samba.org>
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

On Mon, 2019-11-18 at 16:01 +0100, Stefan Metzmacher wrote:
> Hi Uri,

> > Now trying to apply same logic to ldb:> - v4-11 branch has ldb
> > v2.0.7 and master has unreleased v2.1.0
> > (additions to ABI)
> > - In the same way, I suppose that we need to release ldb 2.1.0 and
> > upgrade v4-11's ldb to 2.1.0. But in ldb, we have 2.0.6 and 2.0.7
> > which
> > are bugfix versions off v4-11 branch - why did we publish bugfix
> > versions off v4-11 instead of releasing 2.1.x and moving v4-11 to
> > use that?
> 
> ldb is the exception as there's a strong interaction between samba's
> ldb
> modules and the library, that's why we can no longer use the same
> scheme
> and need one ldb release stream per samba minor version.

Can I ask again if we can progress 
https://gitlab.com/samba-team/samba/merge_requests/374
"ldb: Remove independent version logic"?

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




