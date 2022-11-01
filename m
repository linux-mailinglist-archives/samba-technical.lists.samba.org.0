Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 055ED614689
	for <lists+samba-technical@lfdr.de>; Tue,  1 Nov 2022 10:22:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=eV8VgFHOgnTgOq2+DnThpZljppD726cFn2jbpHkz0Zw=; b=lGNiHV7UM8JymtSrYirMHCPl65
	6s0RfrV36qkSGJrZAZjehB0zGzbVwb6/rvrMppU5qkaVku/TBM9RMshlZ0yXYm3jAGXeiuNT8thq6
	xLT+rhJRKjJOw9Y9PRnPm5dwwUEsQT4hBBL8p06PClLVieuCV1INGnvrQiUzzvmcO8+Cx5n3pMK3a
	WlHWXjNx2eyCMKKNYJzKfji1om7PVz4ZaixS9X/r7tRHsIPs1MhQdGHCT2KXecOLPNhELYNUQ83BP
	4xHuuFaHRMoYUsRIr5+PJKEEN4Jw1mXlKjuS5zN1xrZAdP4VMZ7/6DLuZYwsB+OfCZcar/XWe/cRi
	4HkuOB5g==;
Received: from ip6-localhost ([::1]:18536 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1opnSq-009m0G-7O; Tue, 01 Nov 2022 09:21:44 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:54795) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1opnSi-009m04-2B
 for samba-technical@lists.samba.org; Tue, 01 Nov 2022 09:21:40 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 542A640175;
 Tue,  1 Nov 2022 12:21:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 70B0D3D3;
 Tue,  1 Nov 2022 12:21:35 +0300 (MSK)
Received: (nullmailer pid 2695199 invoked by uid 1000);
 Tue, 01 Nov 2022 09:21:30 -0000
To: samba-technical@lists.samba.org
Subject: [PATCH 1/2] ndr: restore libndr.so.2 ABI compatibility:
 ndr_print_debug
Date: Tue,  1 Nov 2022 12:21:12 +0300
Message-Id: <20221101092113.2691975-1-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Andreas Schneider <asn@samba.org>,
 =?UTF-8?q?Pavel=20Filipensk=C3=BD?= <pfilipen@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Commit 7b9f87b877bd385e8cec893cd282d4b3fc00206d changed signature of
ndr_print_debug function and for this very purpose, incremented an
soname of whole library, instead of providing a trivial compatibility
symbol. Do this now to restore the damage for a bit.

Rename the newly introduced function to ndr_print_debug_level(), modify
it to accept NULL for the new "location" arguments, and introduce old
ndr_print_debug() function with the old signature, making it a trivial
wrapper around the new ndr_print_debug_level().

Include this symbol change directly into ndr-3.0.0.sigs, since the next
patch will rename this file into ndr-2.0.1.sigs.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 librpc/ABI/ndr-3.0.0.sigs |  3 ++-
 librpc/ndr/libndr.h       |  6 +++---
 librpc/ndr/ndr.c          | 28 +++++++++++++++++++++-------
 3 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/librpc/ABI/ndr-3.0.0.sigs b/librpc/ABI/ndr-3.0.0.sigs
index d3f3eca26ae..347f278fae7 100644
--- a/librpc/ABI/ndr-3.0.0.sigs
+++ b/librpc/ABI/ndr-3.0.0.sigs
@@ -42,7 +42,8 @@ ndr_print_array_uint8: void (struct ndr_print *, const char *, const uint8_t *,
 ndr_print_bad_level: void (struct ndr_print *, const char *, uint16_t)
 ndr_print_bitmap_flag: void (struct ndr_print *, size_t, const char *, uint32_t, uint32_t)
 ndr_print_bool: void (struct ndr_print *, const char *, const bool)
-ndr_print_debug: bool (int, ndr_print_fn_t, const char *, void *, const char *, const char *)
+ndr_print_debug: void (ndr_print_fn_t, const char *, void *)
+ndr_print_debug_level: bool (int, ndr_print_fn_t, const char *, void *, const char *, const char *)
 ndr_print_debug_helper: void (struct ndr_print *, const char *, ...)
 ndr_print_debugc: void (int, ndr_print_fn_t, const char *, void *)
 ndr_print_debugc_helper: void (struct ndr_print *, const char *, ...)
diff --git a/librpc/ndr/libndr.h b/librpc/ndr/libndr.h
index 98f8ff870d2..bfabd3a8b73 100644
--- a/librpc/ndr/libndr.h
+++ b/librpc/ndr/libndr.h
@@ -214,7 +214,7 @@ struct ndr_print {
 #define LIBNDR_FLAG_NO_NDR_SIZE		(1U<<31)
 
 /* useful macro for debugging */
-#define NDR_PRINT_DEBUG(type, p) (void)ndr_print_debug(1, (ndr_print_fn_t)ndr_print_ ##type, #p, p, __location__, __func__)
+#define NDR_PRINT_DEBUG(type, p) (void)ndr_print_debug_level(1, (ndr_print_fn_t)ndr_print_ ##type, #p, p, __location__, __func__)
 #define NDR_PRINT_DEBUGC(dbgc_class, type, p) ndr_print_debugc(dbgc_class, (ndr_print_fn_t)ndr_print_ ##type, #p, p)
 #define NDR_PRINT_UNION_DEBUG(type, level, p) ndr_print_union_debug((ndr_print_fn_t)ndr_print_ ##type, #p, level, p)
 #define NDR_PRINT_FUNCTION_DEBUG(type, flags, p) ndr_print_function_debug((ndr_print_function_t)ndr_print_ ##type, #type, flags, p)
@@ -239,7 +239,7 @@ struct ndr_print {
  */
 #define NDR_PRINT_DEBUG_LEVEL(l, type, p) \
 	(void) ( CHECK_DEBUGLVL(l) \
-		&& ndr_print_debug(l, (ndr_print_fn_t)ndr_print_ ##type, #p, p, __location__, __func__) )
+		&& ndr_print_debug_level(l, (ndr_print_fn_t)ndr_print_ ##type, #p, p, __location__, __func__) )
 
 /* useful macro for debugging in strings */
 #define NDR_PRINT_STRUCT_STRING(ctx, type, p) ndr_print_struct_string(ctx, (ndr_print_fn_t)ndr_print_ ##type, #p, p)
@@ -617,7 +617,7 @@ void ndr_print_debug_helper(struct ndr_print *ndr, const char *format, ...) PRIN
 void ndr_print_debugc_helper(struct ndr_print *ndr, const char *format, ...) PRINTF_ATTRIBUTE(2,3);
 void ndr_print_printf_helper(struct ndr_print *ndr, const char *format, ...) PRINTF_ATTRIBUTE(2,3);
 void ndr_print_string_helper(struct ndr_print *ndr, const char *format, ...) PRINTF_ATTRIBUTE(2,3);
-bool ndr_print_debug(int level, ndr_print_fn_t fn, const char *name, void *ptr, const char *location, const char *function);
+bool ndr_print_debug_level(int level, ndr_print_fn_t fn, const char *name, void *ptr, const char *location, const char *function);
 void ndr_print_debugc(int dbgc_class, ndr_print_fn_t fn, const char *name, void *ptr);
 void ndr_print_union_debug(ndr_print_fn_t fn, const char *name, uint32_t level, void *ptr);
 void ndr_print_function_debug(ndr_print_function_t fn, const char *name, int flags, void *ptr);
diff --git a/librpc/ndr/ndr.c b/librpc/ndr/ndr.c
index 25765880d8b..c9d6fb1de0a 100644
--- a/librpc/ndr/ndr.c
+++ b/librpc/ndr/ndr.c
@@ -428,16 +428,21 @@ _PUBLIC_ void ndr_print_debugc(int dbgc_class, ndr_print_fn_t fn, const char *na
 /*
   a useful helper function for printing idl structures via DEBUG()
 */
-_PUBLIC_ bool ndr_print_debug(int level,
-			      ndr_print_fn_t fn,
-			      const char *name,
-			      void *ptr,
-			      const char *location,
-			      const char *function)
+_PUBLIC_ bool ndr_print_debug_level(int level,
+			            ndr_print_fn_t fn,
+			            const char *name,
+			            void *ptr,
+			            const char *location,
+			            const char *function)
 {
 	struct ndr_print *ndr;
 
-	DEBUGLF(level, (" "), location, function);
+	if (location) {
+		DEBUGLF(level, (" "), location, function);
+	} else {
+		/* called from ndr_print_debug() compatibility wrapper below */
+		DEBUG(1,(" "));
+	}
 
 	ndr = talloc_zero(NULL, struct ndr_print);
 	if (!ndr) return false;
@@ -455,6 +460,15 @@ _PUBLIC_ bool ndr_print_debug(int level,
 	return true;
 }
 
+/*
+  old compatibility wrapper without location information for libndr before 4.17
+  (do not change the signature!)
+*/
+_PUBLIC_ void ndr_print_debug(ndr_print_fn_t fn, const char *name, void *ptr)
+{
+	ndr_print_debug_level(1, fn, name, ptr, NULL, NULL);
+}
+
 /*
   a useful helper function for printing idl unions via DEBUG()
 */
-- 
2.30.2


