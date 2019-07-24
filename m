Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA6F7297E
	for <lists+samba-technical@lfdr.de>; Wed, 24 Jul 2019 10:05:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=1Xa50e3c+n/XgLreEXAZzM1/Dusmqf3jal/tdBSMEUY=; b=Xh6NwJM9P1otdpXgDebbGtJWKs
	3FI0m2utAPVhRYh8S8wy/aNTt47RsbmW9vem6NrzMivJmaTpLTyKH6Am+g5/YZpv6mXfrE1R1fhgT
	Ss9Uecan3zIVa2PJdswOxJUXgq+7MuESGBKgelwmIFiHeAYNzfJzkJOKBAXXXdjPW8LJTIM2hPtoe
	ClY2vhGb8Zj4NyBBT14DTokwRKArJSoTzMaSj1xxrExf9x3g2uqI1xf+bU5OSjS4F05uGUM5OAdOu
	f+dQvTmhhP6Vj22Ahcv7IHoIDhGPwVyLVgCPT1mVmXUhp9TIn+VyYJEiVtL7J8Pf/UsTm/SpGLGHr
	+nS/JquQ==;
Received: from localhost ([::1]:39588 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hqCGV-002Cmh-M8; Wed, 24 Jul 2019 08:04:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133]:47824) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hqAbC-002CTx-FV
 for samba-technical@lists.samba.org; Wed, 24 Jul 2019 06:18:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1Xa50e3c+n/XgLreEXAZzM1/Dusmqf3jal/tdBSMEUY=; b=gGQOCJFzwPHRaT0Y5VpwBtWJoQ
 7N90/JQMzvZNdlZpfiJ/+4M5wIFkAFW6SLRu80CqjgQtsuC25Bn72Ra55U98FUrqDgFJii1g2Pk+v
 XPvWZXVP7/4TvQIWdHMJJsTBcEyaiNbtoPg+JOyeFN2/iHN+j8DiH//YTyjVYst2eZdJNW8GDmmaH
 1tpuC3lNNf/w0GceJkPRPaBB6JdiZZSZVJOlr+inma1SfS2sXWO/g3eKnofUKFN7B7pQL3769+3TW
 jCOEK61cTU+A0p4axGitNuC4cMeg/ZDpW3Ry+2Ff0HYkYs0+KxmpPcvICLo1Gula2Bgy/8Zw4ackm
 7GUAhyFw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hqAb0-0007QP-TP; Wed, 24 Jul 2019 06:17:50 +0000
Date: Tue, 23 Jul 2019 23:17:50 -0700
To: john.hubbard@gmail.com
Subject: Re: [PATCH 00/12] block/bio, fs: convert put_page() to
 put_user_page*()
Message-ID: <20190724061750.GA19397@infradead.org>
References: <20190724042518.14363-1-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190724042518.14363-1-jhubbard@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 24 Jul 2019 08:04:44 +0000
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Dominique Martinet <asmadeus@codewreck.org>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Christoph Hellwig <hch@lst.de>, linux-cifs@vger.kernel.org,
 Miklos Szeredi <miklos@szeredi.hu>, linux-rdma@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 v9fs-developer@lists.sourceforge.net, Jason Wang <jasowang@redhat.com>,
 Eric Van Hensbergen <ericvh@gmail.com>, John Hubbard <jhubbard@nvidia.com>,
 linux-block@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 ceph-devel@vger.kernel.org, Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, samba-technical@lists.samba.org,
 LKML <linux-kernel@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Anna Schumaker <anna.schumaker@netapp.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jul 23, 2019 at 09:25:06PM -0700, john.hubbard@gmail.com wrote:
> * Store, in the iov_iter, a "came from gup (get_user_pages)" parameter.
>   Then, use the new iov_iter_get_pages_use_gup() to retrieve it when
>   it is time to release the pages. That allows choosing between put_page()
>   and put_user_page*().
> 
> * Pass in one more piece of information to bio_release_pages: a "from_gup"
>   parameter. Similar use as above.
> 
> * Change the block layer, and several file systems, to use
>   put_user_page*().

I think we can do this in a simple and better way.  We have 5 ITER_*
types.  Of those ITER_DISCARD as the name suggests never uses pages, so
we can skip handling it.  ITER_PIPE is rejected іn the direct I/O path,
which leaves us with three.

Out of those ITER_BVEC needs a user page reference, so we want to call
put_user_page* on it.  ITER_BVEC always already has page reference,
which means in the block direct I/O path path we alread don't take
a page reference.  We should extent that handling to all other calls
of iov_iter_get_pages / iov_iter_get_pages_alloc.  I think we should
just reject ITER_KVEC for direct I/O as well as we have no users and
it is rather pointless.  Alternatively if we see a use for it the
callers should always have a life page reference anyway (or might
be on kmalloc memory), so we really should not take a reference either.

In other words:  the only time we should ever have to put a page in
this patch is when they are user pages.  We'll need to clean up
various bits of code for that, but that can be done gradually before
even getting to the actual put_user_pages conversion.

