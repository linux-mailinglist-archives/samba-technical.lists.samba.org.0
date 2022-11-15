Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FEB62A41D
	for <lists+samba-technical@lfdr.de>; Tue, 15 Nov 2022 22:29:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=cmjxYgV/7TUkLgMfApGC62wRbFr8RodAlLl4qq6u6+E=; b=hDNUpKFqNl+eblLRuJ5xQq2q/s
	MpWDVa93BJopw7hFx2t6O/uMYe7i0r41XGxSEw46yzROyAsyeNIA4pQnVkC9Mel0qRkmF37Fsffr3
	xZIub2r0zJ0833K7O2USGAe9HyUnQQNEA/QNxz+t/SwWXRtIodKXyveBvcuSWqSIvQs5R4JN65E66
	YANr/P39Ci3Fk8KnlXL0yXCT6lVvpqyzv2BPvLsEX4vcKyn7rIx5KdnDR7DXuTenmzcuj4GghLtSm
	2XdugWfFCauSdlzfMFekGhs+M3vLtoQwm8omzuS5rTq+G1DVN/Kqx9JEWTOEEueL/CMHQcdVXocgF
	rU6DKvig==;
Received: from ip6-localhost ([::1]:49256 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ov3UC-00E21W-9d; Tue, 15 Nov 2022 21:28:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48596) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ov3U4-00E21N-QJ
 for samba-technical@lists.samba.org; Tue, 15 Nov 2022 21:28:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=cmjxYgV/7TUkLgMfApGC62wRbFr8RodAlLl4qq6u6+E=; b=TVrDJA32PI1LooE6IuuvRYq8uU
 VVoskcbb2NNYTEW/pXen8/UXQnDF+jBqPpKUv78iHgni2Lr5WTUa18or0emA0hhIH0xTdx3zEcmN4
 dx0qUlqlbXG462H2KT1tSTkSCtwZLJXOdEaVqG6ka6qwXcYltvDfT8qaT4F++3kXXJA9Mv5dxXLXz
 Gp8az5anM1IZJ5uPnFxQ1mNlfLQXuSqEabDo80a/8cYViS/KNenipep0r57zx2r1EMLu2NNcLHdHz
 Z9DmwvEEp8xgbvAILvG/6u+m3Q7ZleIYc/AdAarJguqkFadQpezJoLn7d8J45raQ/RdkPpGiJszJJ
 KmnkzI5fXiNAbKHOzfksdXV4+MmedL3sL7ZUb/7kOk2Q/gQDtElfErHozhigAtaakhBhmPvLSkh9f
 rpF+lLHAjnyYOzxUy3MdAHFYmZTW5gJrGh9NBbGaM4p4zznNxwA8djEkkinM/NrJahgBH32QHUI02
 sJQGcsuVt+lli3erjckr8DEu;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ov3U3-008lle-FK; Tue, 15 Nov 2022 21:28:43 +0000
Date: Tue, 15 Nov 2022 13:28:41 -0800
To: Michael Tokarev <mjt@tls.msk.ru>, samba-technical@lists.samba.org
Subject: Re: failing tests in the testsuite on debian
Message-ID: <Y3QEifrtj+5RHwjA@jeremy-acer>
References: <4197c161-ef1e-3710-f50e-7631ddaf5f3f@msgid.tls.msk.ru>
 <de87d255-95d0-ac34-1544-fa0aac441f4b@msgid.tls.msk.ru>
 <66781199-ab84-1c05-3224-ed65cb9b12bc@msgid.tls.msk.ru>
 <Y3PPjghJzwYBPlAN@jeremy-acer>
 <1f00b2cd-2368-b6a5-ef70-b917dd42794c@msgid.tls.msk.ru>
 <Y3P3m2FJToHADDcF@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Y3P3m2FJToHADDcF@jeremy-acer>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Nov 15, 2022 at 12:33:31PM -0800, Jeremy Allison via samba-technical wrote:
>>^samba4.rpc.echo\ against\ rpc\ proxy\ with\ domain\ creds\(rpc_proxy\)
>>
>>I found no way to exclude certain tests (but the previous email from Ralph
>>gives some clues).  None of the above tests seems to have reasons for failure.
>>
>>I'm pasting the output from the failing tests below.
>>
>>
>>[35(230)/370 at 58s] samba3.smb2.session enc(nt4_dc)
>>UNEXPECTED(failure): samba3.smb2.session enc.reauth1(nt4_dc)
>>REASON: Exception: Exception: ../../source4/torture/smb2/session.c:247: (&io1)->out.file_attr was 128 (0x80), expected 32 (0x20): out.file_attr incorrect
>>UNEXPECTED(failure): samba3.smb2.session enc.reauth2(nt4_dc)
>>REASON: Exception: Exception: ../../source4/torture/smb2/session.c:323: (&io1)->out.file_attr was 128 (0x80), expected 32 (0x20): out.file_attr incorrect
>>...(many of them)...
>>
>>this is ATTRIBUTE_ARCHIVE vs ATTRIBUTE_NORMAL. The test is
>>expecting the newly created files to have "a" attribute but
>>apparently there's none. Just a thought here - maybe it has
>>something to do with this user being unable to create extended
>>attributes, or maybe tmpfs (where I run the whole thing) does
>>not support it.
>
>Yes, the DOS attributes are stored in an EA.
>
>Tests that create EA's should be run against a share
>using vfs objects including vfs_xattr_tdb so they
>don't depend on the underlying filesystem for EA
>support.
>
>I see the bug. The definition of [tmpenc]
>has:
>
>vfs objects = dirsort
>
>It should be:
>
>vfs objects = dirsort xattr_tdb
>
>as you're running it against a filesystem
>(tmpfs) that doesn't support EAs.

Try this patch. Let me know if it fixes it and
I'll try it in a ci-build.

diff --git a/selftest/target/Samba3.pm b/selftest/target/Samba3.pm
index 4db74e4d86e..a23329c1a40 100755
--- a/selftest/target/Samba3.pm
+++ b/selftest/target/Samba3.pm
@@ -2917,7 +2917,7 @@ sub provision($$)
         path = $shrdir
         comment = encrypt smb username is [%U]
         server smb encrypt = required
-       vfs objects = dirsort
+       vfs objects = dirsort xattr_tdb
  [tmpguest]
         path = $shrdir
          guest ok = yes


