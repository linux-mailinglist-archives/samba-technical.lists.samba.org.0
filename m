Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E910BAB1C7
	for <lists+samba-technical@lfdr.de>; Fri,  6 Sep 2019 06:46:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=LHh3Zc7w5NHOu/ivVI+JuXjQ/UktiosRlzeYy/y3U2o=; b=5k0LzgX6VKnZLUPJdzkXTjWxtm
	mFtQnBZyc4No1Z5wDfhk2ts2KfV1pzHK4IE5MkGoIbwK4fXnSI/t9yy8cb4Q2p8HWonJOFaJHBAQ3
	ScMXY2SPJ+oc8tPuSx6rwK7zhgnzadLbv25KhA3SaGqSm3wjN6/fPhPGQ29QVU/zL52xJlZ5HTvsU
	gcqd68nrqfI+Go8rGw0ZWxZ8tqPE3IA0Ut1OlAtsIsTKNdPK6HZhG/XumRLSHbaROHww3+sekgkCV
	O+si0X2/vvlOPaN28nQUlVTP4A5h7yFAwkw+A4gyQt3SalESFa29x96Yxh/sO3siOyzaOWBYMPDYs
	W4BQCUKA==;
Received: from localhost ([::1]:33204 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i667d-003rCt-Mf; Fri, 06 Sep 2019 04:45:21 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:33252) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i667U-003rCW-3x
 for samba-technical@lists.samba.org; Fri, 06 Sep 2019 04:45:16 +0000
Received: by mail-pf1-x441.google.com with SMTP id q10so3510078pfl.0
 for <samba-technical@lists.samba.org>; Thu, 05 Sep 2019 21:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LHh3Zc7w5NHOu/ivVI+JuXjQ/UktiosRlzeYy/y3U2o=;
 b=uQrbHWNasUNvV5McSjuwsyvlYRCSc1BvB8pWiK8Jr89pjFlxWrZ0ZlKLURXAdad2oL
 nSr60231OzLhD/IK/G1XtKQ5iaYpwnO9Jc1YV7OCjamTe1M3QW7h7hLWYeFYTtGOGKjI
 GSWwOCeFUcUXGCt5IA4abQBSMWAMBzG9fd5poYNklW3hemD1O5k/QC2Je2PWeqy1m+z5
 DxFZFZHgCkSKs0QtUe4/GqhFqzhTQzCBXZ4my0+YijGZsahpvC/P65PN77BCbGxQ3vQZ
 iRibjTJrS1WOsZGBFpejAk7dFI4ISsi2jIlWBkcgMNuch40GJgOdLQcnfTROB+dVPDfm
 MKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LHh3Zc7w5NHOu/ivVI+JuXjQ/UktiosRlzeYy/y3U2o=;
 b=pvN1FpkGhyf3juVCGz7C2Iv25WOGjLO7zYZlo2gPnUXpREPh7nCZRGJ8dMchttIJ2U
 jZZzF/iTDE29pvKPOVpHj/8JXLJ5nyPD9a2jsmXyQR6SrQJKPAoLyV9pUZ/G+WXIo5kP
 VCDxPuF9+U/wPdTj8bl5ibhw+mhJuz7ePJhMhP1TyEScYURe0KMpm7+/4cZnNEPlMaP5
 tRhhT3To3pqT6PpLWTn5WpBZYyvLvw6I1mK3YHTEEGQ+54d98lc6HjNNYkZrG4TVazgf
 i+puIOFb0OM0upM9UcMqk4JvVGpI+DMXBahacy31bjtUxoFVupy0txdnhnDAkA9XxdaM
 RFKA==
X-Gm-Message-State: APjAAAXc3Y44XyT4qACCIA+hDMsT1xbo4pOWqzYKBkC58OhCIsht7++y
 zF7KggRR4WDN3H7oQ5SyIsrcgArybPM=
X-Google-Smtp-Source: APXvYqw0H/J2q2BgoB01FRWQTecJF6kXJst3CRrO+IVru/IlVzadmHGfjpJRh8xfuR4pH1ZjUNYlrQ==
X-Received: by 2002:a17:90a:e292:: with SMTP id
 d18mr7875461pjz.100.1567745107291; 
 Thu, 05 Sep 2019 21:45:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
 [73.71.176.3])
 by smtp.gmail.com with ESMTPSA id v12sm4109060pff.40.2019.09.05.21.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 21:45:06 -0700 (PDT)
To: samba-technical@lists.samba.org
Subject: [PATCH 2/2] util_sec.c: Move __thread variable to global scope
Date: Thu,  5 Sep 2019 21:44:47 -0700
Message-Id: <20190906044447.41266-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190906044447.41266-1-raj.khem@gmail.com>
References: <20190906044447.41266-1-raj.khem@gmail.com>
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
From: Khem Raj via samba-technical <samba-technical@lists.samba.org>
Reply-To: Khem Raj <raj.khem@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Make clang happy otherwise it complains about variable scope

fixes

source3/./lib/util_sec.c:470:4: error: '__thread' variables must have global storage
        } __thread cache;
          ^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 source3/lib/util_sec.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/source3/lib/util_sec.c b/source3/lib/util_sec.c
index 9408269..7390318 100644
--- a/source3/lib/util_sec.c
+++ b/source3/lib/util_sec.c
@@ -444,6 +444,17 @@ void become_user_permanently(uid_t uid, gid_t gid)
 	assert_gid(gid, gid);
 }
 
+#ifdef HAVE___THREAD
+	struct cache_t {
+		bool active;
+		uid_t uid;
+		gid_t gid;
+		size_t setlen;
+		uintptr_t gidset;
+	};
+
+static __thread struct cache_t cache;
+#endif
 /**********************************************************
  Function to set thread specific credentials. Leave
  saved-set uid/gid alone.Must be thread-safe code.
@@ -461,14 +472,6 @@ int set_thread_credentials(uid_t uid,
 	 * available.
 	 */
 #ifdef HAVE___THREAD
-	static struct {
-		bool active;
-		uid_t uid;
-		gid_t gid;
-		size_t setlen;
-		uintptr_t gidset;
-	} __thread cache;
-
 	if (cache.active &&
 	    cache.uid == uid &&
 	    cache.gid == gid &&
-- 
2.23.0


