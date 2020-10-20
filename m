Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A618294214
	for <lists+samba-technical@lfdr.de>; Tue, 20 Oct 2020 20:25:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=o3WD6lrADmxBgifs7lKVGgTMbaythwJ5d5TI0v7z1iU=; b=iMSI1l7178Ex59FKFk4smy/C4c
	oSQeiLZd/zLK9SYwmjVcpCQL0Uf+zuhZWrOozQpzZsopaxK/a/W8MtbW1TE5u5a/4unlfRQMPxXPj
	7la+PuMbNSnxcvxdr/W5FvJm1tOP4HhiODHOoscL0XV95P5l+0IWmzNIpDjNoCxRpSH0HxGkKIq3X
	Zr98qB8NwUF9m2ht2hv6dt4h5CsY1misSq02aiucAaWVFoM6VagiipQa4kHem/tJiYaLfMdJ1tRo8
	IWOtFgk+VZGpadYU4Tu9m6BCGjjGLcovUhNp3Osjw5Btz6IJpU2/Y39/OAcIs0OD4Wq3b4HLvpi9f
	Hc8cc5HQ==;
Received: from ip6-localhost ([::1]:65330 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kUwJX-00CvUc-LX; Tue, 20 Oct 2020 18:24:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16876) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUwJS-00CvUV-2F
 for samba-technical@lists.samba.org; Tue, 20 Oct 2020 18:24:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=o3WD6lrADmxBgifs7lKVGgTMbaythwJ5d5TI0v7z1iU=; b=j3Zmf50oKQLLdfagNL97fAgErx
 VRSjrlSlrN9vAtZSoWzoKwLznBkPeDGUplXvK/er7TyMLUC1jpHnNK/ztQQyiCVMYAAH3Jgvbu+/U
 WdY8Bob829BjkNvZ4kTKaVJ6mrevH25t2bAXZe+XuzFWzD/Q1idEV7wJJ6GM+nwt5KVLegK4y4oNq
 glLydPO2PJoZdjQhaXvCanVWFOq/A257lM7bFgoVWW+5j1CShOpWyVl8IYZ/z1iAnCktPs5XuCMfK
 kEgZhvdewPobGyfQo6tkzJ7IXN1lU9y0IPnPhfAqu3JzE0xQPr/I0q7WssRW7ZQHKSwQdMqVVwPzH
 hTHuM1UA/tS3jBQbrL8Y+JpvaEfw8EZc/NuFRGvUNvN99fAjBYqOa21Ko1C3I0cXTDHO7FuEuaTi+
 /fqQ6t9z9lVTchsIdvSRFylVJDYGIdTqosSwS7Md8JW6TVJnhG2Iwf0NhsApblMSijZWBfuQ8lGES
 Cczl1+ITxxr/MhuGsFRrK25j;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUwJR-0003FZ-0W; Tue, 20 Oct 2020 18:24:45 +0000
Date: Tue, 20 Oct 2020 11:24:42 -0700
To: Arran Cudbard-Bell <a.cudbardb@freeradius.org>
Subject: Re: talloc: talloc_set_memlimit causes all reallocs to fail when
 used on pools.   talloc_set_memlimit not enforced correctly on pools.
Message-ID: <20201020182442.GA642265@jeremy-acer>
References: <20201016194436.GD67086@jeremy-acer>
 <2B2DBDAF-26F4-4FF4-A2A6-A194F507A352@freeradius.org>
 <E2A6FEEF-3C46-43A6-818C-D226924EB9F7@freeradius.org>
 <20201016202528.GF67086@jeremy-acer>
 <E75C5FB4-2800-498A-868B-7F3A3CB4E802@freeradius.org>
 <20201020020246.GB564927@jeremy-acer>
 <20201020035308.GA601524@jeremy-acer>
 <2F0B2708-7AC6-4FF5-99FA-8D4B8F1BAB2E@freeradius.org>
 <20201020055023.GA606244@jeremy-acer>
 <D37CFB0F-61FE-43C4-A161-DB949FF9F175@freeradius.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline
In-Reply-To: <D37CFB0F-61FE-43C4-A161-DB949FF9F175@freeradius.org>
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
Cc: samba-technical@lists.samba.org, jra@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 20, 2020 at 01:03:14PM -0500, Arran Cudbard-Bell wrote:
> 
> OK.  That patch seems to mostly work but there are a few
> issues.
> 
> First is an easy one. After a realloc failure due to hitting the
> memlimit, the chunk remains marked as free, so when a
> report gets run later in the test suite, we get a use-after-free
> error.

Thanks for catching that. New version attached
with your changes squashed (but moved to before
we set errno, always do that last :-).

> Then there's another issue with object_count ending
> up off by one, which means talloc_free_children doesn't
> actually return memory to the pool, and that messes up
> some of the other tests I'm adding.  Just tracking down
> when and why this happens now.... It might have been a
> pre-existing issue and not related to this patch, I'm just
> seeing it because of using talloc_free_children to reset
> the pool between some tests.

OK, that I don't understand. I'll wait for your analysis...

Jeremy.

--AqsLC8rIMeq19msA
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-Fix-memlimit-on-pool-realloc.patch"
Content-Transfer-Encoding: quoted-printable

=46rom 92a4ef104c93942387914490f021f6634deda755 Mon Sep 17 00:00:00 2001
=46rom: Jeremy Allison <jra@samba.org>
Date: Tue, 20 Oct 2020 10:52:55 -0700
Subject: [PATCH] Fix memlimit on pool realloc.

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


--AqsLC8rIMeq19msA--

