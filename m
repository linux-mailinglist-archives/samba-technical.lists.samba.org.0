Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0BF13D789
	for <lists+samba-technical@lfdr.de>; Thu, 16 Jan 2020 11:09:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=T6C4V4RnG6MtCfpLIHGj+HKyh49YgnGvRvwNdeulrlM=; b=BpgFHSrT+vH6G9w2nUfkBd6FAW
	tracCNlGrw1NOUS7EXCFqcWfkAewrdH4Ov6LSKF37EO9TwhR5KWHpCpeOdj33aEYlcmcmFuKJKYdW
	0IEv9T8fsXgzL13JJx3CD893PoHv3wKEambSFsV2AZMg+4fP/NNw53mE2J7hi6+5nj9KRgljibQ1T
	WwRG3yyAO4QdAw3w76JHvQ83Nhy0TND8VTbGQBILCxBr6XKO9WvFFVdlAL/i+/Kc8JbkCCQyAqD10
	NW8842428JcVxCC7qZfhwsl7NPMWKnxgBDJjGP3Wvid3PKB8OWLvlqdBX+Gw7LCNYVSRaevt7ErRz
	wyE+3BPA==;
Received: from localhost ([::1]:27188 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1is257-003cdv-Td; Thu, 16 Jan 2020 10:08:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64062) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1is251-003cdo-Fx
 for samba-technical@lists.samba.org; Thu, 16 Jan 2020 10:08:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=T6C4V4RnG6MtCfpLIHGj+HKyh49YgnGvRvwNdeulrlM=; b=rE4vLeWaRcnAc0dIww+lAt1IJm
 AkQs35xqMej9LYJnWMnbNnRU5zSrxsK/+4iYt8YWGHSpXniB+p7TTZFXf1lqU+q06GvWb4tKwbrFE
 9cLLgSSj99JuQ7VIMfkVT/x84k5n+0IMTnR1PdvgK6gmTxeMsd52OAcAupApMY+ch9bezFxY3fIk3
 8qZBRTOEqJCwa//PjMh1EY9CWkAq9wE2khX7ikR9IeumuHwY2xbknoCEUv5E4SeOvj8v+mT5eorgx
 x7Wz8nOY8NBFlgNNCOeHCFx/NR0i0OKebta2CBOKPQ0espLVYRpmqTzma/gH7xOnohgPAM0gpXuFR
 c3RIYiEXP4w/Rt+f56/awQVpQ3IiKDvjbxEuInVKJq/fWYnAvnRjxmVRX1pRrR+1YnDO3Tgx1fFL3
 lo0v1YB/WQynEgoe664Xrb9i0ntvWMgz0POEkP2MazD1Ygf/YxAb0LiqJQjRLY5PYT+XyXln9P6Wi
 jiKiRoSIYJh/NikRaNj5+MGu;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1is250-0006tQ-MS; Thu, 16 Jan 2020 10:08:46 +0000
To: samba-technical@lists.samba.org
Subject: Re: fuzzers
Date: Thu, 16 Jan 2020 11:08:46 +0100
Message-ID: <2725858.Fi8pKjZunP@magrathea>
In-Reply-To: <2546695.cijFyKqbAK@magrathea>
References: <2546695.cijFyKqbAK@magrathea>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart3859471.eFG98M6fKr"
Content-Transfer-Encoding: 7Bit
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.

--nextPart3859471.eFG98M6fKr
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, 16 January 2020 10:58:24 CET Andreas Schneider via samba-
technical wrote:
> Hello,
> 
> thanks to all people who worked on fuzzing Samba. This is a great addition.
> 
> However before we add *more* fuzzers, it might be a good idea to first fix
> the bugs found by the fuzzers ;-)

Also the build is failing since weeks:

Step #3: /src/samba/lib/fuzzing/oss-fuzz/build_samba.sh: 42: /src/samba/lib/
fuzzing/oss-fuzz/build_samba.sh: SANITIZER_ARG: parameter not set


The attached patch should fix it.


	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
--nextPart3859471.eFG98M6fKr
Content-Disposition: attachment; filename="0001-fuzzing-Fix-the-oss-fuzz-build.patch"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="UTF-8"; name="0001-fuzzing-Fix-the-oss-fuzz-build.patch"

From f970df6e4f532046b8491b88df6f868a7fc201e9 Mon Sep 17 00:00:00 2001
From: Andreas Schneider <asn@samba.org>
Date: Thu, 16 Jan 2020 11:06:28 +0100
Subject: [PATCH] fuzzing: Fix the oss-fuzz build

Step #3: /src/samba/lib/fuzzing/oss-fuzz/build_samba.sh: 42:
/src/samba/lib/fuzzing/oss-fuzz/build_samba.sh: SANITIZER_ARG: parameter
not set

BUG: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=19495

Signed-off-by: Andreas Schneider <asn@samba.org>
---
 lib/fuzzing/oss-fuzz/build_samba.sh | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/lib/fuzzing/oss-fuzz/build_samba.sh b/lib/fuzzing/oss-fuzz/build_samba.sh
index 93039e4dbe0..d20125a191a 100755
--- a/lib/fuzzing/oss-fuzz/build_samba.sh
+++ b/lib/fuzzing/oss-fuzz/build_samba.sh
@@ -27,16 +27,14 @@ export LD
 # get (eg) -fsanitize=address via the CFLAGS we will fail to link
 # correctly
 
+SANITIZER_ARG=""
 case "$SANITIZER" in
     address)
-	SANITIZER_ARG='--address-sanitizer'
-	;;
+        SANITIZER_ARG="--address-sanitizer"
+        ;;
     undefined)
-	SANITIZER_ARG='--undefined-sanitizer'
-	;;
-    coverage)
-       SANITIZER_ARG=''
-       ;;
+        SANITIZER_ARG="--undefined-sanitizer"
+        ;;
 esac
 
 # $LIB_FUZZING_ENGINE is provided by the oss-fuzz "compile" command
-- 
2.24.1


--nextPart3859471.eFG98M6fKr--




