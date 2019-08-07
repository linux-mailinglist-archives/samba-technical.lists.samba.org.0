Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ED16684841
	for <lists+samba-technical@lfdr.de>; Wed,  7 Aug 2019 10:54:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=h/YO9E7Kk2GlCfqzWsOaLMxcaYYFJaO+2uQZpeggUB0=; b=qpYnMaUuLCoWcSG6GPj+lJkicp
	DoD7EpgabgcouISXcFdXB5NWXqBVCeKAkkZvKA2sy88RAo+CI7aMtm5OqmbMgDceJ7KFTCVGNgOjx
	3e89puKChMIw43AJTVIbtga+GITSrdtDm3rkzJ0vTGHSd5A2OvUjAqC8Oi3NmGA8jeLpzdHVnFjJ+
	sWvQIoyRsl6ZMAoEjcYN5BOXknpZOAug9DFDEo7W/H+HKSHCTirayM6HGQn6hToWR0vPp4IEQgs9O
	gjfu64QSFIpZGEKIjsAm3afgoQdt9JCg8U4B9G+cezqBmWft664WphYvxiG4pECy6N/f5P5fdeBK5
	w9cOriHQ==;
Received: from localhost ([::1]:43510 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hvHiG-004qRo-8l; Wed, 07 Aug 2019 08:54:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133]:33358) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hvFte-004orw-Cq
 for samba-technical@lists.samba.org; Wed, 07 Aug 2019 06:58:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h/YO9E7Kk2GlCfqzWsOaLMxcaYYFJaO+2uQZpeggUB0=; b=otE89qYM9WmETe4AtaYSwZhaVp
 x2hWnzTkK/+H6YrywBw2CCvGkAGS0+cMqYBTGZ1bytkCsNKOywsxuaErRoaQPCJFZ74nyD+BaWD0D
 Fqio4bMq3iSkQd4EZDyn1AS+qiOZ+zvMv6fNRqFHw53t3ciAgH4Z1x8wvN/D7EYKreU7FK2EDXOVj
 PtXuttuf2InvZsTot7swxCxX4U2Gh/2vRud2yGtuCEvw7oeWsTGK9Fxhm2aMTINFjUbhDSIHyQW9d
 1InA9ls8uWP73McSrAt6icdTTX2iY22SDv4qsGs3F3dJNdqSF3NdiMXvEekNoqV5nkE99PNfKXpGY
 TVYojzfw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hvFX6-0004to-Ui; Wed, 07 Aug 2019 06:34:48 +0000
Date: Tue, 6 Aug 2019 23:34:48 -0700
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 00/12] block/bio, fs: convert put_page() to
 put_user_page*()
Message-ID: <20190807063448.GA6002@infradead.org>
References: <20190724042518.14363-1-jhubbard@nvidia.com>
 <20190724061750.GA19397@infradead.org>
 <c35aa2bf-c830-9e57-78ca-9ce6fb6cb53b@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c35aa2bf-c830-9e57-78ca-9ce6fb6cb53b@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 07 Aug 2019 08:54:26 +0000
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
 Eric Van Hensbergen <ericvh@gmail.com>, john.hubbard@gmail.com,
 linux-block@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 ceph-devel@vger.kernel.org, Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, samba-technical@lists.samba.org,
 LKML <linux-kernel@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Anna Schumaker <anna.schumaker@netapp.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Aug 05, 2019 at 03:54:35PM -0700, John Hubbard wrote:
> On 7/23/19 11:17 PM, Christoph Hellwig wrote:
> > On Tue, Jul 23, 2019 at 09:25:06PM -0700, john.hubbard@gmail.com wrote:
> >> * Store, in the iov_iter, a "came from gup (get_user_pages)" parameter.
> >>   Then, use the new iov_iter_get_pages_use_gup() to retrieve it when
> >>   it is time to release the pages. That allows choosing between put_page()
> >>   and put_user_page*().
> >>
> >> * Pass in one more piece of information to bio_release_pages: a "from_gup"
> >>   parameter. Similar use as above.
> >>
> >> * Change the block layer, and several file systems, to use
> >>   put_user_page*().
> > 
> > I think we can do this in a simple and better way.  We have 5 ITER_*
> > types.  Of those ITER_DISCARD as the name suggests never uses pages, so
> > we can skip handling it.  ITER_PIPE is rejected іn the direct I/O path,
> > which leaves us with three.
> > 
> 
> Hi Christoph,
> 
> Are you working on anything like this?

I was hoping I could steer you towards it.  But if you don't want to do
it yourself I'll add it to my ever growing todo list.

> Or on the put_user_bvec() idea?

I have a prototype from two month ago:

http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/gup-bvec

but that only survived the most basic testing, so it'll need more work,
which I'm not sure when I'll find time for.

