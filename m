Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D06FA290C28
	for <lists+samba-technical@lfdr.de>; Fri, 16 Oct 2020 21:18:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Date:Subject:cc;
	bh=qIfh/oYPZDUiKupkJFKAJ29huLjHI3HZ4Yv9ZSzBK3c=; b=mQ+pcCBtUIb/l88SO+R5Y34Zn1
	orn5MbGjTSz6CUfRKlxp/jcAEI29ZDRtH1wqK35duk1XHjBrne4WHSQPlG9FnuCrSz2/2zeH79dnq
	QEFOWzi1qyqY7/CUFdae4kv/ZbORLF6H8NvLb2WEO85Qki/R0Sb0zH4Ki+xZLLPcpPxk3r9B9sYrH
	qBaNVAqGHqfuHW80BMgGJDpn5AA+FB4QgTh4lPUdfqfr5DsZp5pfOmSbE+ZS2ZYXGt/WvhzqnLxI+
	4gdn+LK4lwwxglXx6G6QovPs34JK/erbjJJgWZ4sEIOnrE0oJUqGj4mChuKxBAEmokAamXlUDGM6s
	hUyVZg2w==;
Received: from ip6-localhost ([::1]:55598 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kTVEo-00CR92-IP; Fri, 16 Oct 2020 19:18:02 +0000
Received: from mail.networkradius.com ([62.210.147.122]:52398) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTVEk-00CR8v-A4
 for samba-technical@lists.samba.org; Fri, 16 Oct 2020 19:18:00 +0000
Received: from [10.0.105.81] (unknown [189.195.128.226])
 by mail.networkradius.com (Postfix) with ESMTPSA id A68D14A2
 for <samba-technical@lists.samba.org>; Fri, 16 Oct 2020 18:59:13 +0000 (UTC)
Authentication-Results: NetworkRADIUS; dmarc=none (p=none dis=none)
 header.from=freeradius.org
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: talloc: talloc_set_memlimit causes all reallocs to fail when used on
 pools.   talloc_set_memlimit not enforced correctly on pools.
Message-Id: <DA0D6B87-BA18-41EA-8ACE-E431841902FE@freeradius.org>
Date: Fri, 16 Oct 2020 13:59:11 -0500
To: samba-technical@lists.samba.org
X-Mailer: Apple Mail (2.3608.120.23.2.4)
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
From: Arran Cudbard-Bell via samba-technical <samba-technical@lists.samba.org>
Reply-To: Arran Cudbard-Bell <a.cudbardb@freeradius.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Apologies if this is a repost.  The original message didn't make it into =
the archives, so I'm assuming it also didn't make it to mailing list =
subscribers.

First I'd like to thank the contributors to the Samba project.  We've =
been using talloc since ~2013 and it has made an immeasurably large =
contribution to code clarity and the general stability of FreeRADIUS.

-

Reviewing the talloc code shows provisions (and test cases) for applying =
memlimits to pools, unfortunately in practice, memlimit functionality on =
pools seems fairly broken.

1. Calling talloc_set_memlimit on a pool results in a limit structure =
being created with limit->cur_size being set to the size of the pool + =
chunk header + pool header.  This seems to effectively mark the entire =
pool as already in use.

2. Because of 1. calling talloc_realloc on a chunk allocated inside a =
pool always fails (unless the operation would be a noop).  Even if the =
chunk size is well within the pool limits.

3. Chunks allocated within a pool are never checked against the memlimit =
set on the pool.  This is actually the only reason why allocations =
within a pool work at all.  If the code path included a call to =
talloc_memlimit_check, normal allocations would fail the same as calls =
to talloc_realloc.

I've tried modifying the code so that only the children of the pool ctx =
are included in the the cur_size calculation, but this causes a "logic =
error in talloc_memlimit_shrink" error.

Happy to keep poking, but I figured someone more familiar with the =
spirit of the code would probably be able to make more rapid progress.

I've included some simple test cases at  the bottom of this email.

Many Thanks,
-Arran

Arran Cudbard-Bell <a.cudbardb@freeradius.org>
FreeRADIUS Development Team

FD31 3077 42EC 7FCD 32FE 5EE2 56CF 27F9 30A8 CAA2


#include <talloc.h>
#include <stdio.h>

int main(int argc, char **argv)
{
       TALLOC_CTX *pool =3D talloc_pool(NULL, 1024);
       TALLOC_CTX *chunk, *fail_chunk;

       if (pool) {
               printf("Pool allocated\n");
       } else {
               printf("Pool allocation failed\n");
       }

       if (talloc_set_memlimit(pool, 512) < 0) {
               printf("talloc_set_memlimit failed\n");
       } else {
              printf("talloc_set_memlimit success\n");
       }

       fail_chunk =3D talloc_size(pool, 929);
       if (fail_chunk) {
               printf("Chunk allocated (should have failed)\n");
       } else {
               printf("Chunk not allocated (success)\n");
       }
       talloc_free(fail_chunk);

       fail_chunk =3D talloc_size(pool, 928);
       if (fail_chunk) {
               printf("Chunk allocated (should have failed)\n");
       } else {
               printf("Chunk not allocated (success)\n");
       }
       talloc_free(fail_chunk);

       chunk =3D talloc_size(pool, 1);
       if (chunk) {
               printf("Chunk allocated\n");
       } else {
               printf("Chunk allocation failed\n");
       }

       chunk =3D talloc_realloc_size(pool, chunk, 2);
       if (chunk) {
               printf("Chunk realloced\n");
       } else {
               printf("Chunk realloc failed\n");
       }
}=

