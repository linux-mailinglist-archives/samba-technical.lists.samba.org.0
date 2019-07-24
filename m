Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B6C7297D
	for <lists+samba-technical@lfdr.de>; Wed, 24 Jul 2019 10:05:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=QMaeodYE6xPawroosfuLAM7Isuyd6msaiuu7WIzXJNg=; b=Lu8ebCNbandfEbl6omjNqB7IOG
	wIbOOFtlUzNSmCdFJWn7bvwqUlblDG7qajTMpWrjCVngf1ux3dPBeGnUCs+l3ecJFNPgLCAuRoqhu
	O5b19cGn4pz0/3Q9ijLuv+upzM9TJlhCYmD8TitBkdQV8051Q2PvsLoq+/Afj7IJ2SDMgIlitYbhl
	hPDGJ470sWsZ4pPbSbvnm203LiEFTfnaWaXoDs/IALmt9WVoHXtnASJkdbp2biepifIatDcKgotf4
	h3wY5a/ICxfIx26TM8o1PTGN+W0vtYfoyjQDJWjAsMJQqMwkKR0Y2FNRpcp8HEKEudbsawBHs4JfH
	51g7ZdJA==;
Received: from localhost ([::1]:39522 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hqCGP-002Cly-72; Wed, 24 Jul 2019 08:04:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133]:50458) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hqAHD-002C3i-Pl
 for samba-technical@lists.samba.org; Wed, 24 Jul 2019 05:57:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QMaeodYE6xPawroosfuLAM7Isuyd6msaiuu7WIzXJNg=; b=oW2+1uEt0qJRsZ3rIR+o/XGwJ
 IpJYdIAzmbpSGeQXXd0w7hFDdorld2bWWW2oiCVa9bfBdmqzQ8VzYAS+3VpPpYND1enTUT3LXM1SV
 CwbH89SUpW2WcPCY1lNCr1Q9WWq6hrUjLEGXr0uuup16IdlyJWTjkk54FwGggAAJ6/K2n0CpTScov
 6bsInH3E0/xFvQn6gl70zra+lZBETmvjV0nc1ECTcsc2eePjN7LRDKmPqETKEgRYUFXsRBdhR/R8v
 o2dvpNjC4kqeW2Xy7IKsHBsPaIMTNnKrfPXCCv6MAnnK2HeXtxBGaSw/R+BXARy62cABx/L38sQl7
 Pi0QmIdOw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hq9rZ-0006FA-JW; Wed, 24 Jul 2019 05:30:53 +0000
Date: Tue, 23 Jul 2019 22:30:53 -0700
To: john.hubbard@gmail.com
Subject: Re: [PATCH 03/12] block: bio_release_pages: use flags arg instead of
 bool
Message-ID: <20190724053053.GA18330@infradead.org>
References: <20190724042518.14363-1-jhubbard@nvidia.com>
 <20190724042518.14363-4-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190724042518.14363-4-jhubbard@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 24 Jul 2019 08:04:37 +0000
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
 Minwoo Im <minwoo.im.dev@gmail.com>, v9fs-developer@lists.sourceforge.net,
 Jason Wang <jasowang@redhat.com>, Eric Van Hensbergen <ericvh@gmail.com>,
 John Hubbard <jhubbard@nvidia.com>, linux-block@vger.kernel.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, ceph-devel@vger.kernel.org,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, samba-technical@lists.samba.org,
 LKML <linux-kernel@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Anna Schumaker <anna.schumaker@netapp.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jul 23, 2019 at 09:25:09PM -0700, john.hubbard@gmail.com wrote:
> From: John Hubbard <jhubbard@nvidia.com>
> 
> In commit d241a95f3514 ("block: optionally mark pages dirty in
> bio_release_pages"), new "bool mark_dirty" argument was added to
> bio_release_pages.
> 
> In upcoming work, another bool argument (to indicate that the pages came
> from get_user_pages) is going to be added. That's one bool too many,
> because it's not desirable have calls of the form:

All pages releases by bio_release_pages should come from
get_get_user_pages, so I don't really see the point here.

