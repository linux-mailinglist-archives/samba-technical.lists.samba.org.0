Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E37690B6E
	for <lists+samba-technical@lfdr.de>; Thu,  9 Feb 2023 15:12:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=OLfeb/1peUB0Uk6OCxp5bH/mik1H6dPr8FEIIkuL/QU=; b=o18evZk/U9GVPg0igejtMKEL3T
	RAYq7zKvCRamCrJFY11YH82cFKmjxttLFX2Wlc8bQ23HBTfNWSeiHVzUd+MX4dfg+q18g8g/pG9qu
	kItx374AkW/ouOubD59ojEj8Thry4YybKjEXXpVcuDK+e4g1OYooOzVc4yIAXQvRF9/2YaCz9sxdW
	NZOLHIoY1PAw9gM5U19CtiJE2kzl5DdZ3pM+0TNosRO3YBPp2X708tYjwAJ85xbSgiHLZvyU2j+mf
	puJpUkd/FNr4ZyLC18zb50OwYjkAzAp4vLRfiXuCSaISfEq0ji3/LIM6ncRuDyr9bxf0KBBUXMgEp
	9xyUaLoA==;
Received: from ip6-localhost ([::1]:24640 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQ7eW-00AOCT-7C; Thu, 09 Feb 2023 14:11:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1]:50584) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQ7eR-00AOCI-LI
 for samba-technical@lists.samba.org; Thu, 09 Feb 2023 14:11:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=OLfeb/1peUB0Uk6OCxp5bH/mik1H6dPr8FEIIkuL/QU=; b=JbYEsNAVDN51UJgX9qx6k2eWsB
 07OxOMxmQRAsKV4YCUUrdkihKeBBP+2v3yOzF5lMH2RU3uRzAPvxbFhjWsOGAZ5ej64w7YIiUOC/q
 CyqW+bPeytq1LKDKZNG8kHZ40wiRBsT+vZm0yzikNRVt+PamelOijN2LOAX/972YiI2nU3VMfcBwy
 DrNSYpn6HJBxJjd5YrKF++aI3VpeX5P/oiaE/kGnSypHx47JkJ7Bq57GujAobCyZgg+NWgy6XlEso
 32JWzqTYOr8NbgJAitEXC8RG1uA55A7/Tr6RfZ0VXSM4B8rbIOvpQBD9K6YWMJ/c21YD+BkFx2Kif
 EpsWohxw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pQ7eC-002Fh2-Uk; Thu, 09 Feb 2023 14:11:36 +0000
Date: Thu, 9 Feb 2023 14:11:36 +0000
To: Stefan Metzmacher <metze@samba.org>
Subject: Re: copy on write for splice() from file to pipe?
Message-ID: <Y+T/GE77AKzsPte9@casper.infradead.org>
References: <0cfd9f02-dea7-90e2-e932-c8129b6013c7@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0cfd9f02-dea7-90e2-e932-c8129b6013c7@samba.org>
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
From: Matthew Wilcox via samba-technical <samba-technical@lists.samba.org>
Reply-To: Matthew Wilcox <willy@infradead.org>
Cc: Linux API Mailing List <linux-api@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Feb 09, 2023 at 02:55:59PM +0100, Stefan Metzmacher wrote:
> Hi Linus and others,
> 
> as written in a private mail before, I'm currently trying to
> make use of IORING_OP_SPLICE in order to get zero copy support
> in Samba.

I have to ask why.  In a modern network, isn't all data encrypted?
So you have to encrypt into a different buffer, and then you checksum
that buffer.  So it doesn't matter if writes can change the page cache
after you called splice(), you just need to have the data be consistent
so the checksum doesn't change.

