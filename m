Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5702932EF
	for <lists+samba-technical@lfdr.de>; Tue, 20 Oct 2020 04:04:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=MXsFUIodRKbzsjB0JKjWrlAlSYZXBt/Q8v9ZJZLgY1o=; b=ucdtlN+kGPl0ZAxX/Cu4DYk7CI
	urDqQvUt9IKuFtNHnBwgh92FSdKvAKZfiBUZYcuchYDMM+UWq4duGPakTdIDOr42D8BeUdQG6kGZm
	bNNvDqSazahsKeMYbnWLApq7PqMywHdtDLYc1JFx2vUyzO6Y1NX6bLrUAD8HvWjvONrz6HTJMi2LH
	pyf75IXNY17zzO9e8KQamPZjolZLqANQ3eDDhpSVO6d3MI12FaBvrznZWpIVfDyY4TJ3bSabPBQC8
	wPQjVk4K794cCyf/5lpUs1ttxavXU33SlmWrPOCZWsXvjNxDcGfgoSHJPF9lBUEvqbQ0Sc/eAoHw7
	Y9WhAI+Q==;
Received: from ip6-localhost ([::1]:21706 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kUgzR-00Cmoi-Fp; Tue, 20 Oct 2020 02:03:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10558) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUgzH-00Cmoa-5e
 for samba-technical@lists.samba.org; Tue, 20 Oct 2020 02:03:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=MXsFUIodRKbzsjB0JKjWrlAlSYZXBt/Q8v9ZJZLgY1o=; b=yR2RDt9KGT9t4rGP7jXNlTEJ2S
 0EopcbwnGBfqr7dVBNc9kwEjEQkJbfOy6jvx1Vu36xCqPDewxpMGE9l5pUcsaTxJSIvQ8qgkwG9/6
 K3xtV5DPiu3ypq61+KKv0e22rxIOJ5Ncj6pp4xV19unuezUlTgzndwwNzh0LSEz6w9BGubZmpYsjg
 d+Xqxwxw6VK9XyEdKBl5hkwOQaSsocmrDMcaJAj5Z9ZyR9oBimysH2eFGV9fhULEsQ694r0UTU2Bc
 m/nCONw1qtSZ75kPZZLwm4H5NzjloxEgQWLZAFbjr37R8CU9dk/j1ajuTUYdqRO2ROCkQRpeaX62e
 uda10FKEZxMjnHCAb3zljncUvkitcxTUMH3AgXgFlhqsCM9JtbQ2v7XXgJcmuQJlvR/3Hq9dLLi7M
 CbbqVlWTKpqP3u8vRoQ+G0mpuGrYuFqdGitMMBFukYVTxf+g8ZMqDPqoDe0CbqsFt2GHHfhlttyMU
 BeJ5KKW4PmS7/GmMMb/zB5j8;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUgzA-000197-QB; Tue, 20 Oct 2020 02:02:49 +0000
Date: Mon, 19 Oct 2020 19:02:46 -0700
To: Arran Cudbard-Bell <a.cudbardb@freeradius.org>
Subject: Re: talloc: talloc_set_memlimit causes all reallocs to fail when
 used on pools.   talloc_set_memlimit not enforced correctly on pools.
Message-ID: <20201020020246.GB564927@jeremy-acer>
References: <DA0D6B87-BA18-41EA-8ACE-E431841902FE@freeradius.org>
 <20201016194436.GD67086@jeremy-acer>
 <2B2DBDAF-26F4-4FF4-A2A6-A194F507A352@freeradius.org>
 <E2A6FEEF-3C46-43A6-818C-D226924EB9F7@freeradius.org>
 <20201016202528.GF67086@jeremy-acer>
 <E75C5FB4-2800-498A-868B-7F3A3CB4E802@freeradius.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="FL5UXtIhxfXey3p5"
Content-Disposition: inline
In-Reply-To: <E75C5FB4-2800-498A-868B-7F3A3CB4E802@freeradius.org>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 16, 2020 at 07:52:48PM -0500, Arran Cudbard-Bell via samba-technical wrote:
> 
> >> An alternative that'd still satisfy our immediate need would be to have talloc_set_memlimit simply fail when someone tried to apply it to a pool (as you suggested), and add an optional flag that'd prevent allocations from occurring outside of the pool.
> > 
> > Please wrap your responses to 80 columns :-). Makes
> > quoting your replies really hard :-).
> 
> Will do :)
> 
> > 
> > What you're asking for is more complexity in an
> > already overly complex part of the code (which
> > to be honest I wasn't even sure people were
> > using :-).
> > 
> > I think you can do what you need by allocating
> > a pool as a talloc child of a context, and setting
> > the memlimit on the that context.
> 
> I just tried this and it didn't work, the reallocs still fail.
> 
> This is likely because the limit needs to be the size of the pool plus 
> headers.  I don't believe there's any way for the caller to know the size
> of these headers, but maybe you know better :)
> 
> talloc_get_size() returns 0 when called on the ctx or the pool as the
> docs suggest it should.
> 
> Do you have any idea how I could determine the correct value to
> pass to talloc_set_memlimit?
> 
> -Arran

I think it's a bug. If you can rebuild talloc can you
check with this (not well tested yet :-) patch ?

I'm planning to add regression tests around this.

With this patch talloc_memlimits on pools should
work.

--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=look

diff --git a/lib/talloc/talloc.c b/lib/talloc/talloc.c
index e476f3e2d05..3fcdaefdc04 100644
--- a/lib/talloc/talloc.c
+++ b/lib/talloc/talloc.c
@@ -1833,13 +1833,6 @@ _PUBLIC_ void *_talloc_realloc(const void *context, void *ptr, size_t size, cons
 		return NULL;
 	}
 
-	if (tc->limit && (size > tc->size)) {
-		if (!talloc_memlimit_check(tc->limit, (size - tc->size))) {
-			errno = ENOMEM;
-			return NULL;
-		}
-	}
-
 	/* handle realloc inside a talloc_pool */
 	if (unlikely(tc->flags & TALLOC_FLAG_POOLMEM)) {
 		pool_hdr = tc->pool;
@@ -1904,6 +1897,19 @@ _PUBLIC_ void *_talloc_realloc(const void *context, void *ptr, size_t size, cons
 		pool_hdr->object_count--;
 
 		if (new_ptr == NULL) {
+			/*
+			 * Couldn't allocate from pool (pool size
+			 * counts as already allocated for memlimit
+			 * purposes). We must check memory limit
+			 * before any real malloc.
+			 */
+			if (tc->limit && (size > tc->size)) {
+				if (!talloc_memlimit_check(tc->limit,
+						(size - tc->size))) {
+					errno = ENOMEM;
+					return NULL;
+				}
+			}
 			new_ptr = malloc(TC_HDR_SIZE+size);
 			malloced = true;
 			new_size = size;
@@ -1917,6 +1923,17 @@ _PUBLIC_ void *_talloc_realloc(const void *context, void *ptr, size_t size, cons
 		/* We're doing malloc then free here, so record the difference. */
 		old_size = tc->size;
 		new_size = size;
+		/*
+		 * We must check memory limit
+		 * before any real malloc.
+		 */
+		if (tc->limit && (size > tc->size)) {
+			if (!talloc_memlimit_check(tc->limit,
+					(size - tc->size))) {
+				errno = ENOMEM;
+				return NULL;
+			}
+		}
 		new_ptr = malloc(size + TC_HDR_SIZE);
 		if (new_ptr) {
 			memcpy(new_ptr, tc, MIN(tc->size, size) + TC_HDR_SIZE);
@@ -2020,6 +2037,19 @@ _PUBLIC_ void *_talloc_realloc(const void *context, void *ptr, size_t size, cons
 		new_ptr = tc_alloc_pool(tc, size + TC_HDR_SIZE, 0);
 
 		if (new_ptr == NULL) {
+			/*
+			 * Couldn't allocate from pool (pool size
+			 * counts as already allocated for memlimit
+			 * purposes). We must check memory limit
+			 * before any real malloc.
+			 */
+			if (tc->limit && (size > tc->size)) {
+				if (!talloc_memlimit_check(tc->limit,
+						(size - tc->size))) {
+					errno = ENOMEM;
+					return NULL;
+				}
+			}
 			new_ptr = malloc(TC_HDR_SIZE+size);
 			malloced = true;
 			new_size = size;
@@ -2035,6 +2065,17 @@ _PUBLIC_ void *_talloc_realloc(const void *context, void *ptr, size_t size, cons
 		/* We're doing realloc here, so record the difference. */
 		old_size = tc->size;
 		new_size = size;
+		/*
+		 * We must check memory limit
+		 * before any real realloc.
+		 */
+		if (tc->limit && (size > tc->size)) {
+			if (!talloc_memlimit_check(tc->limit,
+					(size - tc->size))) {
+				errno = ENOMEM;
+				return NULL;
+			}
+		}
 		new_ptr = realloc(tc, size + TC_HDR_SIZE);
 	}
 got_new_ptr:

--FL5UXtIhxfXey3p5--

