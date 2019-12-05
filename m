Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 57132113C29
	for <lists+samba-technical@lfdr.de>; Thu,  5 Dec 2019 08:13:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=UjxHGhwCKaAEk1Bh6Khj7Ks44avRkoQ8+pamhRyoHEg=; b=v1JcY4VRJ4lbZPznGAyVACAcLh
	PbiKifXj3hquSW8Q3AOVcFRTg7J00NUTkjHl1SEXKjkCxNVsBolHCBBplX2Rzx0HETHjPjPsDmLKY
	dUnF79aC5P86zloPXakDt54uIWfWycdIwcfBQ4E/F/lpvMMn6p2OcgrHSmFFkRExeh8DUn5y6wwNM
	qtdBDcrPWsxIwi62lwIznrVCxskAKOz5N/l3ysCpA5a+1pFKn/35zxLW6FAaT561G0FlWFIszXcGY
	NiHX2eJQ6qBZmSnybXR7xxDWtCXC3LXPp1MQ757t1xZWNuqAJimF1Dr/l4fty+VK9vxc8ArfHobDL
	pbPBUoAQ==;
Received: from localhost ([::1]:19196 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iclJc-00683W-Tk; Thu, 05 Dec 2019 07:12:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34420) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iclJU-00683P-Tu
 for samba-technical@lists.samba.org; Thu, 05 Dec 2019 07:12:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=UjxHGhwCKaAEk1Bh6Khj7Ks44avRkoQ8+pamhRyoHEg=; b=eCGHBflp1HMyPJKgpUICzi7JWk
 ucOUrtkbrU0qH6xzStubODr841ZWiGsAGtkkUuwIl8UkdizhdBN0pyk30KvYH1wTF1RfFQgMNwbhI
 OrqtomWRWNLtCU6LyWMbEEAwqoj6TBU8IYOGQMAU4BVebDqtXAFSgDW46T2QnjViCyV+S+Rb+sqWW
 REj7gS0R/qGUgUjSuhyJ9e1gcNBjJ1oqGw7BA58HzAu/EDq4h6yGvvouRQ/6de2KuZQpo8ohZuy5L
 uAYdd/c515fOlKN3ut2l7+HqTjr9pOybhdfKq57l5QTCzXf/TTa2nBvicCT+n+WeZYwP0kpTjNh/Y
 d3rCupOKhXLVvL9sxvbKRL6Y/VqgxKWmdeoNil5HoYaYd4bvGClacXs77Rxd2sLHwvcFlDYCN/euj
 kSx1x9vx795s8C5tf69Q2lfvXgu6iohP9MJEw7gAERp9lds7maUHwTQcj9H+8EA+oev17CkeoCEWD
 qI2tiQT5V9cC8vVgIK19UQHe;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iclJS-0000X6-D0; Thu, 05 Dec 2019 07:12:34 +0000
Date: Thu, 5 Dec 2019 09:12:31 +0200
To: Richard Sharpe <realrichardsharpe@gmail.com>
Subject: Re: Just noticed a confusing piece of info in the Samba Developer's
 Guide in 4.11.2 and master
Message-ID: <20191205071231.GB1458792@onega.vda.li>
References: <CACyXjPzkNVZOHu0eOhYeXGaWXsas6ZRN9qO1YSEHPo5xV3OTEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACyXjPzkNVZOHu0eOhYeXGaWXsas6ZRN9qO1YSEHPo5xV3OTEQ@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On ke, 04 joulu 2019, Richard Sharpe via samba-technical wrote:
> Hi folks,
> 
> $ git grep SMB_VFS_WRITE
> docs-xml/Samba-Developers-Guide/vfs.xml:#define SMB_VFS_WRITE(fsp, fd, data, n)
> source3/include/vfs.h:/* Version 39 - Remove SMB_VFS_WRITE
> 
> It's dead Jim! Replaced by SMB_VFS_PWRITE.

Please submit a pull request that fixes it. ;)

-- 
/ Alexander Bokovoy

