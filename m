Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCFE624B19
	for <lists+samba-technical@lfdr.de>; Thu, 10 Nov 2022 20:58:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=HZrgbKwq/Zv90fuyRQGa8KO1ffIc2cK2MUEJ6rWQ+Sk=; b=qzuO1FoXk1e+0sT8e62o6gM3wr
	vK0osPaSRP2jq5/2Z8OX7FBxigdBe7YqF+5qxJD3G4lUHNM+1GVWXO7X8hPXMHfo3y7NWmSTN2Qt9
	RpsNNtaz/eSwMhknhC9DCwc0XvYtustNXvoU5IffIaoIFS50VPOVGP/0EjCQ+KU3qTS0KDo2bAHAg
	q/g4fpMUZOZK9Y77zQqkBfQG0bvIWvU43WOuud98G70l0qmfZv7+Lb6iALEty2jxh/X+lozJRd9In
	cnFcd8sERkP2rDnFDZ2mMr/BqQyJTIEbgyBbDgBVCoUrhMiau2tI6oYg8xMMdAslOY89I3bQPb8/R
	tA58Gurg==;
Received: from ip6-localhost ([::1]:37086 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1otDgI-00C3Of-Nx; Thu, 10 Nov 2022 19:57:46 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:3::133]:36286) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1otDgC-00C3OU-LZ
 for samba-technical@lists.samba.org; Thu, 10 Nov 2022 19:57:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=HZrgbKwq/Zv90fuyRQGa8KO1ffIc2cK2MUEJ6rWQ+Sk=; b=ACCb2RAqTLt2zjn9qwHc6INnrN
 oUe83br+N3BC7/eBR2Iv3pKUNafrieTf+9c5cDqIFF9gjVmRScGcgrVNTE+jPXM6i9FkREiPJXAmG
 L6Wb9s0L4xxe256dSKrVaLaEmud/7MUtMX5dh92wvcZQuNU21B4rb8wQXeXWXGXZmA673Dt5dCNRM
 mksw5m1MbkdXeYq+Ura9lWxOoUCLcfahgoyQzUCwyXV6crOejg2ZuKXbgNeucPfO/Ubw4wxm18ZtD
 I94+zy9ESc0/M14daQChYTWY30XzzvN4YEPr3L8Eiy70qimMwFr6uG8HKOCn3CN3HE1pZIofWOGE/
 1Xwe7Ldw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1ot5w2-005RuC-Sa; Thu, 10 Nov 2022 11:41:30 +0000
Date: Thu, 10 Nov 2022 03:41:30 -0800
To: Jeremy Allison <jra@samba.org>
Subject: Re: reflink support and Samba running over XFS
Message-ID: <Y2zjaoiw0m/8b0t/@infradead.org>
References: <CAH2r5mtc6rHC=zfWCjmGMex0qJrYKeuAcryW95-ru0KyZsaqpA@mail.gmail.com>
 <Y2molp4pVGNO+kaw@jeremy-acer> <Y2n7lENy0jrUg7XD@infradead.org>
 <Y2qXLNM5xvxZHuLQ@jeremy-acer>
 <CAOQ4uxgyXtr6DU-eAP+kR1a7NsS-zDhXi5-0BJ7i=-erLa3-kg@mail.gmail.com>
 <Y2vzinRPFEBZyACg@jeremy-acer> <Y2v1zQbnPoqg+0aj@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2v1zQbnPoqg+0aj@jeremy-acer>
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
Cc: CIFS <linux-cifs@vger.kernel.org>, Amir Goldstein <amir73il@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>, metze@samba.org,
 Steve French <smfrench@gmail.com>, vl@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Nov 09, 2022 at 10:47:41AM -0800, Jeremy Allison via samba-technical wrote:
> So it *looks* like the copy_file_range() syscall will internally
> call the equivalent of FICLONERANGE if the underlying file
> system supports it.

Yes.  The separate clone interface exists for the cases where
applications only want to do the fast metadata only operation and
not fall back toan actual copy.  I'll leave it to people with more
SMB experience if and how that matters to the protocol.  For NFS
CLONE and COPY primitives exist on the wire with a similar distinction.

