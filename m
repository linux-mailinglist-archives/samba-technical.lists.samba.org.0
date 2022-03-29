Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D4C4EA7DA
	for <lists+samba-technical@lfdr.de>; Tue, 29 Mar 2022 08:28:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=Or83GhCN40AnioXwB1yzcDd5ajWi5dZ1JOBrYkckQYo=; b=gQawcdBPCfKh2zXzCVkNPOCZl4
	u4QacQvXTWIHSKzc7TEl9NDqV1SZrk7tZDSxu51NAyr4181Td4NTFHA3Y3F9ci0lXd3qknsRUlS9e
	MwWeJ4WhXc/C9+lKsg5TTGT8TWk7nHSkBnKUZY3UohZaWfaTUSFBfxXR2K9R5jV60+tW4fNAAVWzE
	sq/asd7Gqiu9HsrjBp+Qhb8q45qS1AhOuHyQQzIA+kEG14cPQDkXPMcMfVqTSm9W3p1PXyZyGNb0X
	ZucrIfJjILjrin1CzV9VN4syS+DA/LTYptQJ6+v4MedlVCPe/PKcAz283OMA2eh+mgwkAXzuaKq+A
	bIuAhwMg==;
Received: from ip6-localhost ([::1]:31976 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nZ5JT-006FZj-V9; Tue, 29 Mar 2022 06:26:44 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:50317) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nZ5JO-006FYl-El
 for samba-technical@lists.samba.org; Tue, 29 Mar 2022 06:26:41 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 866BD40A01;
 Tue, 29 Mar 2022 09:26:34 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 6D00A352;
 Tue, 29 Mar 2022 09:22:46 +0300 (MSK)
Message-ID: <f129265e-17cd-c6e9-2ef5-8bd6d68b91f2@msgid.tls.msk.ru>
Date: Tue, 29 Mar 2022 09:26:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Samba 4.16 build failures
Content-Language: en-US
To: Matt Grant <matt@mattgrant.net.nz>,
 samba-technical <samba-technical@lists.samba.org>
References: <CAHA-KoOSMkK=CsqE5Z8uaTYpK0tDNPAmXyLiF6yoh7r0hFkiEg@mail.gmail.com>
In-Reply-To: <CAHA-KoOSMkK=CsqE5Z8uaTYpK0tDNPAmXyLiF6yoh7r0hFkiEg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

29.03.2022 04:41, Matt Grant via samba-technical write:
> Hi!
> 
> Just trying to compile 4.16.0 for my debian servers as a Debian package,
> from debian/rules based on actual Debian packaging.
> 
> Keep getting lots of errors about GSSAPI_LIB_FUNCTION not being defined....
> 4.15.x compiles.

I prepared the 4.16 verson of the debian samba package set. It took quite
significant amount of resources to complete, the amount of changes is also
quite significant. See
https://salsa.debian.org/samba-team/samba/-/tree/mjt-4.16
for the result so far.  It also includes a relatively large change - it
builds ldb packages out of samba source too, instead of using separate
package.

This is pending some review, some testing, maybe bug triaging, and I'm
also waiting for the ongoing python transition in debian to settle down
before uploading it.

The plan is to upload it to experimental first.

Thanks,

/mjt

