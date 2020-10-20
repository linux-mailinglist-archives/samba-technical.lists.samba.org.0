Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E609A2943BB
	for <lists+samba-technical@lfdr.de>; Tue, 20 Oct 2020 22:10:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Date:Subject:cc;
	bh=a4r4DgBQzA+Oly9YTToxIgyMCk2iZMcz1tSKDdFwpRo=; b=eRRgETE9WMGM8CntIBQho0h0qs
	+Fpuy8fPZdpjETW3ZwPoSKVHMgucHbidpdwVt68vcIDQknYc2Rofs1X7/YVo7bvzLMBTL5GTsntQ+
	bgwXWilfm2NlSNJ3Fjb8apzBMZDM2YixAQvz3l+7BGEX0xf+oEXEU2oBxD4ldLcuSnsnxsIROup0n
	yJYxnoNbo4n6xqrE7U8ruWOB5JKHXCzdgU9UXx2nb35uGuIa/yAB0ba9Jo7+hBCiPa5UgyzTNt428
	YjGMugfwEgiwWooI1L9SGPqOWT4DYaVeL/x/m+vrpK9Tnd4qRJTrBWg7fgJANWrV2pZqMxGTZWcnT
	Zpy6BnmA==;
Received: from ip6-localhost ([::1]:31760 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kUxxi-00CxVq-N5; Tue, 20 Oct 2020 20:10:26 +0000
Received: from mail.networkradius.com ([62.210.147.122]:54898) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUxxe-00CxVj-H2
 for samba-technical@lists.samba.org; Tue, 20 Oct 2020 20:10:24 +0000
Received: from shinyhead.rga.ip (unknown [187.142.130.164])
 by mail.networkradius.com (Postfix) with ESMTPSA id 6150F46A
 for <samba-technical@lists.samba.org>; Tue, 20 Oct 2020 20:10:19 +0000 (UTC)
Authentication-Results: NetworkRADIUS; dmarc=none (p=none dis=none)
 header.from=freeradius.org
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: talloc: Other minor issues/queries
Message-Id: <3A50457D-74F6-4C7B-BC2E-8EA68EE64C61@freeradius.org>
Date: Tue, 20 Oct 2020 15:10:14 -0500
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

Just to keep this separate from the memlimit/pools discussion.

- I've noticed talloc_realloc_size clears the name/type of the chunk be 
 allocated.  This isn't mentioned in the documentation.  Is clearing the 
 name/type of the chunk expected behaviour?

- talloc_set_memlimit is marked as deprecated in the
  current HEAD version of talloc, with a note to use cgroups.
  cgroups wouldn't offer equivalent functionality for us.  Could I humbly
  request memlimits not be deprecated? :)

- Is there any appetite for functions which return chunks of a specific
  alignment?  i.e. talloc_aligned, talloc_aligned_array,
  talloc_aligned_pool.
  I've had to fudge some horrible variants of the above for local use.
  We use aligned memory for the following purposes:
  - Page aligned pools for protecting memory areas with mprotect
    to prevent runtime modifications.
  - 8 byte aligned buffers that can have the start and end regions
    easily poisoned with ASAN.
  - Cache line aligned ring buffers, with the cache line 
    alignment done to reduce contention where the producer and
    consumer are close.

Many Thanks,
-Arran

