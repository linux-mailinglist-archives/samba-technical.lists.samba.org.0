Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C55676209DF
	for <lists+samba-technical@lfdr.de>; Tue,  8 Nov 2022 08:13:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=6ZjC2Z9pJhd6LI9EDKmT/K7rAJbA5xGUE4Au2jRNhR4=; b=n69cYsATeRQJGdMnIZc697HMJ9
	Eqxqmts8wixhnmPbYw9mEZySMzlDoaqWWwtysTW0UmSr8j4DDoGTUlcHtjeW4uMQHhYE6ihWgzXwX
	vZ8nEpBh+bMvXsQS1lU/VuQAZG06C6z+LqqqgintO+lmwNImrI02K099urg+r2YiZ7q0yEpCZiEja
	jD/uRVh4u9oC5KKPoPTvRIL5Jp8wOTHX7LeaAlTl3NsPgWu7/xtq6AQzeov5EAq/3QT6o3f85z1O2
	uzD3QC2UL16lmbhEdq2CzmLtvaRPtldzOSL3L70ALxZ5cGUrF+mIs5z/pceZJqQMhLEyuGqKyC4il
	fAzUs08w==;
Received: from ip6-localhost ([::1]:53512 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1osImR-00BRHy-5q; Tue, 08 Nov 2022 07:12:19 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:3::133]:45842) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1osIm3-00BRHp-FF
 for samba-technical@lists.samba.org; Tue, 08 Nov 2022 07:12:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=6ZjC2Z9pJhd6LI9EDKmT/K7rAJbA5xGUE4Au2jRNhR4=; b=UcL8wKS+s0sQImYuafrsXbBNGl
 YMta9vrsUUNsLN/MoLu9VTwOofkrdmlABaamGFjK+Y0lyk1LZKOmw2VtyEIbDvWi3vJz0DG/2Bpww
 1Z3j315wmC0+8H95w2OmkOZFImFAKCJSmSdc7QoHq4SNB5G8h86fI1Ir4rd/iBlbpU5IpVeudQhWE
 elkPyp2ZJNSVoud1WL87ranb+Z0l4kFNlpgCb7IUZeG5xL0uG1XNcslAVye6+VHJ7vgwfD0TOgxXI
 fJXi93oRRghN7rie3bMaEAC4Lrnakr219K9/7yOPtkOws/25C1mNbKP13Rrg6IYcDeEbxhPswEBO/
 2twFbtXQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1osIOi-003FcT-JP; Tue, 08 Nov 2022 06:47:48 +0000
Date: Mon, 7 Nov 2022 22:47:48 -0800
To: Jeremy Allison <jra@samba.org>
Subject: Re: reflink support and Samba running over XFS
Message-ID: <Y2n7lENy0jrUg7XD@infradead.org>
References: <CAH2r5mtc6rHC=zfWCjmGMex0qJrYKeuAcryW95-ru0KyZsaqpA@mail.gmail.com>
 <Y2molp4pVGNO+kaw@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2molp4pVGNO+kaw@jeremy-acer>
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

On Mon, Nov 07, 2022 at 04:53:42PM -0800, Jeremy Allison via samba-technical wrote:
> ret = ioctl(fsp_get_io_fd(dest_fsp), BTRFS_IOC_CLONE_RANGE, &cr_args);
> 
> what ioctls are used for this in XFS ?
> 
> We'd need a VFS module that implements them for XFS.

That ioctl is now implemented in the Linux VFS and supported by btrfs,
ocfs2, xfs, nfs (v4.2), cifs and overlayfs.

