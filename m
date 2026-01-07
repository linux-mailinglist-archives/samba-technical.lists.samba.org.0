Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDF9D01CA0
	for <lists+samba-technical@lfdr.de>; Thu, 08 Jan 2026 10:19:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=WLCNgvyKZoXQQuDrcbanc8yb4Q1uRHJ/yANy7e6VaJk=; b=TytG2mi3ja+NK+fduEF5t1FVDq
	q09rKfyDsHzOqs6iq+np662p6AGd/sL2Y6X/Px/iqU7id1BoIrNsGhmJUwmb4NmoFxGJhI1XWUp8j
	GLTlD7G7u+IuCAsvW+4KkCN9WhRyj0wQAuyNm+k7+W7a1uHj61LxFarelqNDQa+GRNJOqF/7fwMJ7
	bsVSSfWcNc63IhaWykpP+l/rsM+pKGMgutm7BDE2TIxhVkzM4mt/U5VBiAf2NK4gdERMS9clcIcwL
	hKjl4kMiZm5ep6fDufUTMDN4Nf5u6FfIElH4fi1r1u8gljrBtey2mgepRd5W02EUoi6PJDDqMDFmh
	IEjPO68w==;
Received: from ip6-localhost ([::1]:59836 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vdm9s-001dpq-52; Thu, 08 Jan 2026 09:18:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:3::133]:45688) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vdWI7-001bX1-8R
 for samba-technical@lists.samba.org; Wed, 07 Jan 2026 16:21:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=WLCNgvyKZoXQQuDrcbanc8yb4Q1uRHJ/yANy7e6VaJk=; b=ALmo4XpInvUDXmNDzFfYS3DA1T
 UT8t4JKHDCrC20DJK7A7ZFgQ+htYB7V3v1IbOFzYjGrUFsk2hUMZ/rQOQbD+UJq8LF95kQMVRLOfQ
 KYkvj16k833hhUglawi0vzOH5zmaLOJuYaYWZHncpSWg9mpeoCQlhfVCjrEIvuQvbpAHF5hAmMKhN
 Fa1W7hNojDl8s5giyFl4DROryf36opwZCv97r7hosXwzDHkwDxZ6bhH7bXR2r3mU5lq2cO9FVt3MD
 xHMHglD1hksFbATlegUfImo9P6vFewRpvdNpHwokf8bOokgPns4l9nmPqw6vxz4y7CddZCdwd3d4L
 omDEzK9w==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vdVWU-0000000FB4y-1TwP;
 Wed, 07 Jan 2026 15:32:34 +0000
Date: Wed, 7 Jan 2026 07:32:34 -0800
To: Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH 0/6] vfs: properly deny directory leases on filesystems
 with special lease handling
Message-ID: <aV58kmCAicqTpFhK@infradead.org>
References: <20260107-setlease-6-19-v1-0-85f034abcc57@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-setlease-6-19-v1-0-85f034abcc57@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Thu, 08 Jan 2026 09:18:18 +0000
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, gfs2@lists.linux.dev,
 linux-cifs@vger.kernel.org, Eric Van Hensbergen <ericvh@kernel.org>,
 Andreas Gruenbacher <agruenba@redhat.com>, NeilBrown <neil@brown.name>,
 Ilya Dryomov <idryomov@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>,
 linux-nfs@vger.kernel.org, Tom Talpey <tom@talpey.com>,
 Bharath SM <bharathsm@microsoft.com>, Al Viro <viro@zeniv.linux.org.uk>,
 ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
 Christian Brauner <brauner@kernel.org>, v9fs@lists.linux.dev,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 Steve French <sfrench@samba.org>, Trond Myklebust <trondmy@kernel.org>,
 Anna Schumaker <anna@kernel.org>, linux-fsdevel@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jan 07, 2026 at 09:20:08AM -0500, Jeff Layton wrote:
> Long term, I think it would be best to change leases/delegations to be
> an opt-in thing, such that leases are always denied by default if the
> method isn't set.

Agreed.

> That's a larger patchset though as we'd need to audit
> all of the file_operations that currently have ->setlease() as NULL.

Initially you can just wire them up everywhere.  But I guess that would
be overkill. 


