Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B38C63755F7
	for <lists+samba-technical@lfdr.de>; Thu,  6 May 2021 16:53:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=yrN0aJUSzd/5Apz6/POOSWuOyoDRk86AwwqjqkaeiY4=; b=UktQ0YbDqJ9laSrg7R5pgB2dvf
	1kTR5NpWJx3SYmu2zgPGrde0hVwuRJINM6PMK5RXvtdBdhpHEvDFTk20nGCLZIUk04AzUprFDYyX7
	+/kCFRsOYSs6MUH4Zw5IYQnTrJ9+181S2jRwud/Uu8mPKFyWiWPsX2yuPXle9sGQNFNsNc0NHTo1+
	U2ZNif5uf8nGkvdxpNVhIBgJ34hFVg5iQdQySXepPs/7aOoFhOhQ8u+K4CpwAjzTFXF/gAHyeXKER
	F8AxSp4NyZnqFrwXXXw16xXE8jP7CZgSeXhXQ6xmtVTROpX53pucJ1gd5gb2ckgA80sxYlPn3Uzav
	fUySMxaQ==;
Received: from ip6-localhost ([::1]:64996 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lefMw-00FpY7-3x; Thu, 06 May 2021 14:52:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13280) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lefMq-00FpXt-DU; Thu, 06 May 2021 14:52:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=yrN0aJUSzd/5Apz6/POOSWuOyoDRk86AwwqjqkaeiY4=; b=dx6+7cYzRyRZmyA1LTcclFqnCt
 32E4wsrot+X/uajPtJhLd6ei9xpT4cd5b+oT2hjl978jH0b9pLoUNbUmnKUntka7RH7YKPKyvGzik
 ueQBZZ4utRIgLto3PYGxc4AVYE29Jk9M5uPUChUi2ECpCqdwAz8iVaNeBLVCiH2rmKd1gIBUv6j3A
 M58yH9N0e4PBxqc4+GdVsFDJGBDNVw8EZBLls0XzPiwItX+DcRmMpTiquAOUGpUBgA7dPCukUg357
 UmQb8kBg/dFjeVRRuakdDFF0218IpH5GbTcvlu+hi/A6vlPjgyyBRTzvn2ZX8DgkxKYecc73QlH5D
 SAxDddvj7Uwo4k/paHmbJiVodUq9HxiwMMLi/V+RTAlUhHIoZUOHwGxmeUB59Ph8ObKc8SAN085Z0
 04vfxfeJrKoPzdX2D6X+JpNWZ/UymDBOGHAGGN0z0iu6qPnqrpXDn/F9vQ3RKG85lZhJ5FhkgM02Y
 F4SvaUnx1gG45MCb4L7ZGF8D;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lefMp-0008Gd-6s; Thu, 06 May 2021 14:52:43 +0000
Message-ID: <62459cb15926f2990dc36d68c36d209c2d5a2296.camel@samba.org>
Subject: Samba Security process: My SambaXP talk
To: samba-technical <samba-technical@lists.samba.org>
Date: Fri, 07 May 2021 02:52:36 +1200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: samba@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

If you care about Samba security, please come to my SambaXP talk
(virtually) in about two and a half hours.

I'll be talking about what really goes into a Samba Security release
(much more work than you might imagine) but also what we need to do to
keep Samba security support going long-term in an increasingly hostile
world.

https://sambaxp.org

Thanks!

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


