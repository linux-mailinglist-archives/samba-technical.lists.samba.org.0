Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F03622631
	for <lists+samba-technical@lfdr.de>; Wed,  9 Nov 2022 10:04:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=APKcTa1hR/RmW8NS4QKqvByff55KXcVdtHfa0tZTJ14=; b=XwdDHnm/2Ppu6Y2Mo1qlS/qXzj
	jehglLqu/AKiQc89Kg83FJmpVDNo3wfPBVwZR4Bym7mJRKbjiun2Ak8xHptLX2d9OXpUWrke5t0zO
	ZkYl4oV7bk9wUGeiBJBZ5yi65PL9RCliBTLgsT8lmjBCU+8HCh3zE4xBkngHpQuwkQJW05ZhysnvN
	4e+HY6W9llc5HiSYNMv9UQcPc4ernyR9M2ODTh+uGyVfJT2VSLAbukXnrzC/4QmdQlVQrW8GRWM4a
	1FdqRV7AjBR5sbubxXlnRPCaGuNTZ3Mei/cWL2qaqfaiYNQ0NjlM8StxaK1ysjYt05Vz9WpMLrrX2
	NVMT0AJg==;
Received: from ip6-localhost ([::1]:28324 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1osgzx-00BjVz-EY; Wed, 09 Nov 2022 09:03:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:3::133]:56018) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1osgzs-00BjVp-KC
 for samba-technical@lists.samba.org; Wed, 09 Nov 2022 09:03:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=APKcTa1hR/RmW8NS4QKqvByff55KXcVdtHfa0tZTJ14=; b=ngO4vTXkz7fYj2rFDkQh1BtzXY
 b4KuCiolqd90OYoEZeJDfuNZQT1RQDCFN9OldY9MznOTpLu2hNnhRjPLA37ms7revHLmYHK/4mB7Y
 IChmq1fqQb9oAAXvr9CZUYLEYVXYUIa7ps96oywHhR0ZMYzfB6llOTkNpKLmI2z//aOVppjknsbBu
 s1u6xgH1+Mxo5Y13ebTcZS7N1np8PwevFUULCNFxryGjAWRsH+yjl5LCbJ/nAhUnVzwCOiY+P0nRW
 9psS1s1rH6vh+/9nrrRRQibK2+7rIhvHPJYGdbH6RJrwxmFAeKr0X1cmbC15H8NJKCNegfk+CxOxa
 khP8NWPA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1osfkU-00Bic8-0y; Wed, 09 Nov 2022 07:43:50 +0000
Date: Tue, 8 Nov 2022 23:43:50 -0800
To: Jeremy Allison <jra@samba.org>
Subject: Re: reflink support and Samba running over XFS
Message-ID: <Y2taNrM8GfOBEDA/@infradead.org>
References: <CAH2r5mtc6rHC=zfWCjmGMex0qJrYKeuAcryW95-ru0KyZsaqpA@mail.gmail.com>
 <Y2molp4pVGNO+kaw@jeremy-acer> <Y2n7lENy0jrUg7XD@infradead.org>
 <Y2qXLNM5xvxZHuLQ@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2qXLNM5xvxZHuLQ@jeremy-acer>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
From: Christoph Hellwig via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christoph Hellwig <hch@infradead.org>
Cc: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Nov 08, 2022 at 09:51:40AM -0800, Jeremy Allison wrote:
> I'm assuming it's this:
> 
> https://man7.org/linux/man-pages/man2/ioctl_ficlonerange.2.html

Yes.

