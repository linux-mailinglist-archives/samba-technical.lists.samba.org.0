Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8816929437F
	for <lists+samba-technical@lfdr.de>; Tue, 20 Oct 2020 21:50:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=VR8HPLsr0aaltuQhvBFgphYmqNXhpZRc8kDVaHbdPEM=; b=oMLPSVezZ1TqcjNeB1MiY38T8q
	db4ZfHzZk1Q+1yN06ZpFXEMS+MBWFOodQWoLJhU6pUbuqObblqit5wAqAMtv4vfaNCRxRCzo+6VOi
	PQEv9LqkUCPtG88mJrue9yNaZxvKhguNlJBitFlj7/0y+yu/Og9iQLKaDrsCUycFStZKFqC5XFDjo
	6QHOh3JOlCHf7RzQGiiRJw0w7HuoKX6hplWbA7OLlx1OfgPT8vLcIa4kvtdVWoMaRbroIBWlq3RzR
	wpj8lQkKcVrvrTQCXCLBT2GTTRgOF2pOY6cZzvZM1BkPwH33m7KGunE97wPncx8EWII0RZOCmNgL/
	ibqkrfOw==;
Received: from ip6-localhost ([::1]:30296 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kUxdQ-00CxHI-Jm; Tue, 20 Oct 2020 19:49:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44558) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUxdK-00CxHA-9Z
 for samba-technical@lists.samba.org; Tue, 20 Oct 2020 19:49:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=VR8HPLsr0aaltuQhvBFgphYmqNXhpZRc8kDVaHbdPEM=; b=aC/+386MVoaHuYoBwqcJXap3Q9
 jr3mxaawY5ZFONwNo70qI5RYd1n9Cb1Qm4QB88T3VjwnDPuSjETYYSkWgg7gK5bWRx1Mo9e1SkPnk
 hZ6CGutUuovd+y5fI80683geYNW8uPgo4ra21iUFXGLEB+Q7Ktav7V4loQnY3o81jdZ7Eqb3HG8ey
 iCkZT+UnmEfJXMxLz3MJ5LGgjwO289YlIqQlWd8H29/DXH0EvBu1r2g5+9Kp6P3gfca9wIc+aoh5B
 xwYsI4ZVjv68XW2NvGGz7L8ABwb7YAdhGSJ7ukQ+QuKzpLEnZj8JE7Ou23NI5vGaK6nTUbfJmkl9g
 SyUssKhlDYzycNu1MVPKUKdrxJnZ48iNTGb0qfChqye4G9THW+4S8Sxa/PqOtPNINF8GONnHOzndi
 xPVx514nrYTV67wzeYK7SlIX5dhjQFfMmLWlGI3VAZkAq5b/TzLfbKW/8g7jntsClh8GY2GgTu+Yc
 780tn1eLykvrICRjDDcm+wtp;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUxdI-00044y-OB; Tue, 20 Oct 2020 19:49:21 +0000
Date: Tue, 20 Oct 2020 12:49:17 -0700
To: Arran Cudbard-Bell <a.cudbardb@freeradius.org>,
 samba-technical@lists.samba.org
Subject: Re: talloc: talloc_set_memlimit causes all reallocs to fail when
 used on pools.   talloc_set_memlimit not enforced correctly on pools.
Message-ID: <20201020194917.GG642265@jeremy-acer>
References: <20201016202528.GF67086@jeremy-acer>
 <E75C5FB4-2800-498A-868B-7F3A3CB4E802@freeradius.org>
 <20201020020246.GB564927@jeremy-acer>
 <20201020035308.GA601524@jeremy-acer>
 <2F0B2708-7AC6-4FF5-99FA-8D4B8F1BAB2E@freeradius.org>
 <20201020055023.GA606244@jeremy-acer>
 <D37CFB0F-61FE-43C4-A161-DB949FF9F175@freeradius.org>
 <20201020183336.GB642265@jeremy-acer>
 <69C11FCA-3EF2-4E1F-9835-5D3FFB80D883@freeradius.org>
 <20201020191654.GF642265@jeremy-acer>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="VrqPEDrXMn8OVzN4"
Content-Disposition: inline
In-Reply-To: <20201020191654.GF642265@jeremy-acer>
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
Cc: jra@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--VrqPEDrXMn8OVzN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 20, 2020 at 12:16:54PM -0700, Jeremy Allison via samba-technical wrote:
> On Tue, Oct 20, 2020 at 01:42:00PM -0500, Arran Cudbard-Bell wrote:
> > 
> > 
> > > On Oct 20, 2020, at 1:33 PM, Jeremy Allison <jra@samba.org> wrote:
> > > 
> > > On Tue, Oct 20, 2020 at 01:03:14PM -0500, Arran Cudbard-Bell wrote:
> > >> 
> > >> Then there's another issue with object_count ending
> > >> up off by one, which means talloc_free_children doesn't
> > >> actually return memory to the pool, and that messes up
> > >> some of the other tests I'm adding.  Just tracking down
> > >> when and why this happens now.... It might have been a
> > >> pre-existing issue and not related to this patch, I'm just
> > >> seeing it because of using talloc_free_children to reset
> > >> the pool between some tests.
> > 
> > Apologies, there was a steal I didn't spot in the tests.
> > One of the chunks was moved out of the pool into the root ctx.
> > 
> > Explicitly freeing the chunk or stealing it back into the pool
> > means talloc_free_children works as expected.
> 
> FYI, once you've gotten everything working can you
> send your test cases to me so I can add them into
> the regression test suite for talloc ?
> 
> Then we'll add a new bug in bugzilla, update the minor library
> version number and create a gitlab MR.

OK, here's what I've got so far in terms of bugfixes/cleanups.

Let me know when you're happy with your tests.

Jeremy.

--VrqPEDrXMn8OVzN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=look
Content-Transfer-Encoding: quoted-printable

=46rom e192bf70a2492f5239b6ed0f4baeabb60f13e848 Mon Sep 17 00:00:00 2001
=46rom: Jeremy Allison <jra@samba.org>
Date: Tue, 20 Oct 2020 10:52:55 -0700
Subject: [PATCH 1/3] WIP: Fix memlimit on pool realloc.

Signed-off-by: Jeremy Allison <jra@samba.org>
Signed-off-by: Arran Cudbard-Bell <a.cudbardb@freeradius.org>
---
 lib/talloc/talloc.c | 69 ++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 62 insertions(+), 7 deletions(-)

diff --git a/lib/talloc/talloc.c b/lib/talloc/talloc.c
index e476f3e2d05..accc859f77e 100644
--- a/lib/talloc/talloc.c
+++ b/lib/talloc/talloc.c
@@ -1833,13 +1833,6 @@ _PUBLIC_ void *_talloc_realloc(const void *context, =
void *ptr, size_t size, cons
 		return NULL;
 	}
=20
-	if (tc->limit && (size > tc->size)) {
-		if (!talloc_memlimit_check(tc->limit, (size - tc->size))) {
-			errno =3D ENOMEM;
-			return NULL;
-		}
-	}
-
 	/* handle realloc inside a talloc_pool */
 	if (unlikely(tc->flags & TALLOC_FLAG_POOLMEM)) {
 		pool_hdr =3D tc->pool;
@@ -1904,6 +1897,25 @@ _PUBLIC_ void *_talloc_realloc(const void *context, =
void *ptr, size_t size, cons
 		pool_hdr->object_count--;
=20
 		if (new_ptr =3D=3D NULL) {
+			/*
+			 * Couldn't allocate from pool (pool size
+			 * counts as already allocated for memlimit
+			 * purposes). We must check memory limit
+			 * before any real malloc.
+			 */
+			if (tc->limit) {
+				/*
+				 * Note we're doing an extra malloc,
+				 * on top of the pool size, so account
+				 * for size only, not the difference
+				 * between old and new size.
+				 */
+				if (!talloc_memlimit_check(tc->limit, size)) {
+					_talloc_chunk_set_not_free(tc);
+					errno =3D ENOMEM;
+					return NULL;
+				}
+			}
 			new_ptr =3D malloc(TC_HDR_SIZE+size);
 			malloced =3D true;
 			new_size =3D size;
@@ -1917,6 +1929,18 @@ _PUBLIC_ void *_talloc_realloc(const void *context, =
void *ptr, size_t size, cons
 		/* We're doing malloc then free here, so record the difference. */
 		old_size =3D tc->size;
 		new_size =3D size;
+		/*
+		 * We must check memory limit
+		 * before any real malloc.
+		 */
+		if (tc->limit && (size > old_size)) {
+			if (!talloc_memlimit_check(tc->limit,
+					(size - old_size))) {
+				_talloc_chunk_set_not_free(tc);
+				errno =3D ENOMEM;
+				return NULL;
+			}
+		}
 		new_ptr =3D malloc(size + TC_HDR_SIZE);
 		if (new_ptr) {
 			memcpy(new_ptr, tc, MIN(tc->size, size) + TC_HDR_SIZE);
@@ -2020,6 +2044,25 @@ _PUBLIC_ void *_talloc_realloc(const void *context, =
void *ptr, size_t size, cons
 		new_ptr =3D tc_alloc_pool(tc, size + TC_HDR_SIZE, 0);
=20
 		if (new_ptr =3D=3D NULL) {
+			/*
+			 * Couldn't allocate from pool (pool size
+			 * counts as already allocated for memlimit
+			 * purposes). We must check memory limit
+			 * before any real malloc.
+			 */
+			if (tc->limit) {
+				/*
+				 * Note we're doing an extra malloc,
+				 * on top of the pool size, so account
+				 * for size only, not the difference
+				 * between old and new size.
+				 */
+				if (!talloc_memlimit_check(tc->limit, size)) {
+					_talloc_chunk_set_not_free(tc);
+					errno =3D ENOMEM;
+					return NULL;
+				}
+			}
 			new_ptr =3D malloc(TC_HDR_SIZE+size);
 			malloced =3D true;
 			new_size =3D size;
@@ -2035,6 +2078,18 @@ _PUBLIC_ void *_talloc_realloc(const void *context, =
void *ptr, size_t size, cons
 		/* We're doing realloc here, so record the difference. */
 		old_size =3D tc->size;
 		new_size =3D size;
+		/*
+		 * We must check memory limit
+		 * before any real realloc.
+		 */
+		if (tc->limit && (size > old_size)) {
+			if (!talloc_memlimit_check(tc->limit,
+					(size - old_size))) {
+				_talloc_chunk_set_not_free(tc);
+				errno =3D ENOMEM;
+				return NULL;
+			}
+		}
 		new_ptr =3D realloc(tc, size + TC_HDR_SIZE);
 	}
 got_new_ptr:
--=20
2.25.1


=46rom 1706bf30739f91bb8e1f529f2acfc45bdf342173 Mon Sep 17 00:00:00 2001
=46rom: Jeremy Allison <jra@samba.org>
Date: Tue, 20 Oct 2020 12:14:58 -0700
Subject: [PATCH 2/3] WIP: Fix pool object accounting when doing
 talloc_realloc() in the ALWAYS_REALLOC compiled case.

Signed-off-by: Jeremy Allison <jra@samba.org>
---
 lib/talloc/talloc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/lib/talloc/talloc.c b/lib/talloc/talloc.c
index accc859f77e..f28a22b799c 100644
--- a/lib/talloc/talloc.c
+++ b/lib/talloc/talloc.c
@@ -1894,8 +1894,6 @@ _PUBLIC_ void *_talloc_realloc(const void *context, v=
oid *ptr, size_t size, cons
 #if ALWAYS_REALLOC
 	if (pool_hdr) {
 		new_ptr =3D tc_alloc_pool(tc, size + TC_HDR_SIZE, 0);
-		pool_hdr->object_count--;
-
 		if (new_ptr =3D=3D NULL) {
 			/*
 			 * Couldn't allocate from pool (pool size
@@ -1924,6 +1922,11 @@ _PUBLIC_ void *_talloc_realloc(const void *context, =
void *ptr, size_t size, cons
 		if (new_ptr) {
 			memcpy(new_ptr, tc, MIN(tc->size,size) + TC_HDR_SIZE);
 			TC_INVALIDATE_FULL_CHUNK(tc);
+			/*
+			 * Only decrement the object count in the pool once
+			 * we know we're returning a valid new_ptr.
+			 */
+			pool_hdr->object_count--;
 		}
 	} else {
 		/* We're doing malloc then free here, so record the difference. */
--=20
2.25.1


=46rom 9f849ea792d3f7e32fd354b4218fff368bee1e10 Mon Sep 17 00:00:00 2001
=46rom: Jeremy Allison <jra@samba.org>
Date: Tue, 20 Oct 2020 12:18:10 -0700
Subject: [PATCH 3/3] lib: talloc: Cleanup. Use consistent preprocessor logic
 macros.

Match other use of ALWAYS_REALLOC.

Signed-off-by: Jeremy Allison <jra@samba.org>
---
 lib/talloc/talloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/talloc/talloc.c b/lib/talloc/talloc.c
index f28a22b799c..078e58ca352 100644
--- a/lib/talloc/talloc.c
+++ b/lib/talloc/talloc.c
@@ -1891,7 +1891,7 @@ _PUBLIC_ void *_talloc_realloc(const void *context, v=
oid *ptr, size_t size, cons
 	 */
 	_talloc_chunk_set_free(tc, NULL);
=20
-#if ALWAYS_REALLOC
+#if (ALWAYS_REALLOC !=3D 0)
 	if (pool_hdr) {
 		new_ptr =3D tc_alloc_pool(tc, size + TC_HDR_SIZE, 0);
 		if (new_ptr =3D=3D NULL) {
--=20
2.25.1


--VrqPEDrXMn8OVzN4--

