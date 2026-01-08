Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6FFD0806F
	for <lists+samba-technical@lfdr.de>; Fri, 09 Jan 2026 09:58:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=yttrd/eJ2yxcEzFLZWXppW/kffU28ZPHb/N3HOkJVzM=; b=qIoxD0eKELnylM788c8zuhlsyh
	YRfa5jK89ScnK2IhQArwZ+hOBJe3kn45D3v1Z28iZfuhrdIgsrMvq0D6thMY9MR/h/LFnw9IgWrNn
	29ZMuY7KDnSA/uR3J2DJoJUH5Ykge6sOzHe2hUDrlxzwUCns/ykheMaYi/nopaXG0XKmtil+z/vVF
	Sjfqaw8OgjGyy0ooTuhZSbQpd57BsU6amF72/xSpfsanWN9/nD295ZH9LrSpeSkuONxzdCuQ7hdAU
	b0+MNKHgIr7rJ0Eb1wCzYNE1rsa8MPuFyoUf84fuvpvc+V2bMf9nmQaiKmHxHOTOljPhywTZwZ5JO
	M9bljiNQ==;
Received: from ip6-localhost ([::1]:33666 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ve8Hi-001iaM-4I; Fri, 09 Jan 2026 08:55:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:3::133]:54552) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vdn6s-001e10-50
 for samba-technical@lists.samba.org; Thu, 08 Jan 2026 10:19:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=yttrd/eJ2yxcEzFLZWXppW/kffU28ZPHb/N3HOkJVzM=; b=FjlRmM8nkIwznD5H8n7jrbipqI
 ZYom57ErGnVY32s1Pzlqojdoqe7yrdCalIPZaWZ8mfSSjNB8Bpdi0n79Fjlf+9inNnE6WBBJTEdyI
 OujX7VFQfwvvJONFqmhQFwGXWo4WIdJH0jQjXBHieogaMpw059F/4F5BtCqGqnmK9bTpLZh8E9NhP
 txe1+QTBUDOWB54/iyTd8UJoQL1w8KDjUazbCnMg+Jm3s8rKVMZolJCIrc3uO5WEkGB58dsSQyGGU
 MLTOpha3+UqbxXRZzeJWM1f2rEh+j3+Oq6Syf/ooyF6Tzk8kfvLzJUfz6i7w+jvJIYPzmuukYIjZr
 IzaJW7sQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vdmFn-0000000GRiW-1B3x;
 Thu, 08 Jan 2026 09:24:27 +0000
Date: Thu, 8 Jan 2026 01:24:27 -0800
To: Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH 1/6] nfs: properly disallow delegation requests on
 directories
Message-ID: <aV93y-xeWk16s48r@infradead.org>
References: <20260107-setlease-6-19-v1-0-85f034abcc57@kernel.org>
 <20260107-setlease-6-19-v1-1-85f034abcc57@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-setlease-6-19-v1-1-85f034abcc57@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Fri, 09 Jan 2026 08:55:52 +0000
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

On Wed, Jan 07, 2026 at 09:20:09AM -0500, Jeff Layton wrote:
> Checking for S_ISREG() in nfs4_setlease() is incorrect, since that op is
> never called for directories. The right way to deny lease requests on
> directories is to set the ->setlease() operation to simple_nosetlease()
> in the directory file_operations.

This fixes generic/786 on NFSv4.2 for me, so:

Tested-by: Christoph Hellwig <hch@lst.de>

