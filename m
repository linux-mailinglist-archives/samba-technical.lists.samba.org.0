Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C03A597584
	for <lists+samba-technical@lfdr.de>; Wed, 17 Aug 2022 20:13:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=xtrg4fjO9WvEJK3hlTMCHJh8OEjI653Vp+WuTVsPjDg=; b=hy71NQJMP0lrli5xBKpL2K+E+d
	oids23eTWhijpnQXzravHj+YvUVR3STdDIFviFzu9P0qqxlAw+UsvzkiaoAPibuVfqC09MojPtNn4
	Bpl8aeFMCui7ouL0xsOTuFHUIKnAlw8CDEAb0q/h1OWm+7QlK9hiAzZigURrD3mXAoP4Z25Gsfyk+
	H4Jb4mTX4BBceLi0cyo+z8yYbgeXvAJBVE3VlQOtAbXM+2zoIII3RRlxGzgc2rli+EaLZPYsynGuU
	qNBHqmhbduTb0QecjVtiXes96cA/auPe9lm6cPshSLep5d9U9wTTabXi1BVn5CP2kQ3a0w46EUaNC
	B0p5vFnw==;
Received: from ip6-localhost ([::1]:25884 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oONX2-000h4v-5g; Wed, 17 Aug 2022 18:12:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38830) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oONWx-000h4m-Nf
 for samba-technical@lists.samba.org; Wed, 17 Aug 2022 18:12:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=xtrg4fjO9WvEJK3hlTMCHJh8OEjI653Vp+WuTVsPjDg=; b=JwwtvDnBe32tt+qdya4XSSyjI2
 Q5SoApVQ100FrGmG4pbxPJT+VIScm0OjTn42nUtDuAOm8VnjhJp7hX3tRT8YCninGva3cU5Ba8f4r
 3uJGWtS93cFLbT0s3DhOO42HhAFnw5jbUIjjgvCb+WO1C9tPd47w5YkuthaxsedHg0S2m1SdlO0sJ
 EfmHY8AZdd8RIkeOhb+QVBf3Miad7VWnabyENuDkrkn2C4vqg+8fkQeaouMjY+lD9mhEt5UZXR6Te
 4hhpWWoomHhatGdsaypKVTStL7d+fEmUg32acjYgBbPHvNcb1sQBRkNEkwciqmoYjpF819P4OBGOy
 n7awo6Vdxj+hnXC+EiKVHwlvfsd6rULrlhjaSZ1MO9DMN1m2q4enkZVq4UubChr9cBnOE2tGFGLz1
 skuJBajd+RjGgbmPQh/FgGSBdPV3J/TXPD7kxtM+rKB6dvfS9L8k4AdH0czh7wED7n4A4xdQiuHyS
 IfPG85xt97tEVZ+MoXjtrsJX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oONWw-000aH7-Bv; Wed, 17 Aug 2022 18:12:38 +0000
Date: Wed, 17 Aug 2022 11:12:33 -0700
To: Christian Ambach <ambi@samba.org>
Subject: Re: [PATCH] WHATSNEW: document new volume serial number smb.conf,
 parameter
Message-ID: <Yv0vkWopKBzdKlEq@jeremy-acer>
References: <686f397f-223c-d7d9-64ad-86f63f2f810f@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <686f397f-223c-d7d9-64ad-86f63f2f810f@samba.org>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Aug 17, 2022 at 01:56:05PM +0200, Christian Ambach via samba-technical wrote:
>Sorry, forgot to add the new parameter to WHATSNEW while working on it.
>
>
>Regards,
>Christian

Christian, if you want this in 4.17 you'll need to log
a bug - required for all backports for 4.17.rcXXX releases.

Sorry,

Jeremy.

>From 50280ad4f4da3a62c465897cde37c5d772b1af88 Mon Sep 17 00:00:00 2001
>From: Christian Ambach <ambi@samba.org>
>Date: Wed, 17 Aug 2022 13:17:29 +0200
>Subject: [PATCH] WHATSNEW: document new volume serial number smb.conf
> parameter
>
>Signed-off-by: Christian Ambach <ambi@samba.org>
>---
> WHATSNEW.txt | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/WHATSNEW.txt b/WHATSNEW.txt
>index 988c4c66ed8..60e71d4f79e 100644
>--- a/WHATSNEW.txt
>+++ b/WHATSNEW.txt
>@@ -204,6 +204,7 @@ smb.conf changes
>   --------------                          -----------     -------
>   dns port                                New default     53
>   nt hash store				  New parameter   always
>+  volume serial number			  New parameter   -1
>
> CHANGES SINCE 4.17.0rc1
> =======================
>-- 
>2.17.1
>


