Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADD957103
	for <lists+samba-technical@lfdr.de>; Wed, 26 Jun 2019 20:52:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=BaLdeZ4U/eu467ao3mblVQ3hyjuieW2ihA/AWLidb+Y=; b=ZWtPTGKqVvmBIFy1Hbtwz+9KbM
	N0QKuQxlysGxcnfjj4LpOFoe8AFzxU2zo2UBGxC7BND2SMv9Z9KwFVlFLsOCLKHeLK4DYg93UMywX
	gyX71givaEE0hU4pfulgYY9flzToRQJCuKtQgSwHxkz+UUoStmNvUerL8iKKuyQnk31/rNrcjtA4f
	raLS1qvm9b5SOGu2JCvNyUzq3dDAD1KOagk/SD/eo+su8JxwWQf8MoLrkuFSrO31Rf9vtpt/gJWmW
	4LYnfczKA+z+l6mBe1qlTB3s+jKrdHPk89cpgmT2olRakzZt48ogzydW8kZRvdpRaqWbED6AGK5Zg
	8KiRS80g==;
Received: from localhost ([::1]:24766 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgD0u-0020kx-SV; Wed, 26 Jun 2019 18:51:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10426) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgD0r-0020kp-28
 for samba-technical@lists.samba.org; Wed, 26 Jun 2019 18:51:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=BaLdeZ4U/eu467ao3mblVQ3hyjuieW2ihA/AWLidb+Y=; b=AEH7QtG2wTfzi8S0EQBASFo4cK
 QOSu7Ke1hmr2JWGW/ZuRxxqK0U6nXBXiFMEGD8nxxHdDs6n62aV9oViUW78O7JKO9K12p2hCVZJgL
 qtlIBj9cpta1F6hLXWZpu53xeKqRWyg+c8/wdP/CNZPUMdP7I4zc1M0wlBPqqmBDzCaE=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hgD0n-0003sO-NJ; Wed, 26 Jun 2019 18:51:18 +0000
Date: Wed, 26 Jun 2019 11:51:14 -0700
To: Ralph Boehme <slow@samba.org>
Subject: Re: [HEADS-UP] Using stored immutable file birth time for SMB File-ID
Message-ID: <20190626185113.GA2768@samba.org>
References: <20190626135745.lk7757wmy26pgy26@inti>
 <20190626181233.4fc61c42@samba.org>
 <c37b59f5-8a89-eeb2-8f92-7db2c7524efd@samba.org>
 <f01ce57c-6336-02c3-f80b-c8fa7e1187e0@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f01ce57c-6336-02c3-f80b-c8fa7e1187e0@samba.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
From: Christof Schmitt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christof Schmitt <cs@samba.org>
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>,
 David Disseldorp <ddiss@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jun 26, 2019 at 08:08:37PM +0200, Ralph Boehme via samba-technical wrote:
> On 6/26/19 7:59 PM, Ralph Boehme via samba-technical wrote:
> > On 6/26/19 6:12 PM, David Disseldorp wrote:
> >> - given that this issue is Apple client specific, is there a need for
> >>   this new logic to be implemented outside of vfs_fruit?
> > 
> > yes, I think our current semantics based on inodes is dumb and we need a
> > general fix.
> 
> an additional note: from an implementation perspective it would be ideal
> to store the additional state in an existing xattr, instead of an
> additional one.
> 
> We need to fetch the state for directory enumerations and getxattr can
> be slow, especially with fuse based filesytems which many of our
> consumers love these days. So piggypacking this onto the existing DOS
> xattr seemed like a clever idea.

Have you considered file systems that store the birthtime in metadata
(no xattr)? It sounds like for that case we would need to add a new
xattr for the new metadata. I guess we have to pay for this somewhere...

Christof

