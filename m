Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAC654D251
	for <lists+samba-technical@lfdr.de>; Wed, 15 Jun 2022 22:09:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=mvnsElnBR7zsm+lSbvG9wJQfDWPUb2jPmP0mu0jMj1Y=; b=p0Zk33oP1+G+s70MRR1SQrciWk
	e+mrK9lgACGPHG9WMA7mzSZfNNpqPEwdMagDcYpPi+aD0T4AIjqFwamiREMOL/XVrP6nBLVAj5zEb
	KFsSm9byjT69sF3013wJtT+Q2JbllY4c4TVg0x6zRneogmW1wQLgsoegiQ/9Gis+wnH41WII8JQTU
	kdytvzqiJxVrzT4AGIZqg9x4zpS0Q/+ByWdHe6zRikKveia9pWMHOJn5J4DGekwxHS3DWgVSXAKTc
	Ftpkg4V+qsD8uB51VTdhgFEW0yVmlXMUM+qzXHdr8Y9/n1bRbT3NBFhYVTPU0SB+QNEaNS3oXqwBt
	9Iwtd01A==;
Received: from ip6-localhost ([::1]:40140 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1o1ZK2-00AXUp-CD; Wed, 15 Jun 2022 20:09:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62356) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1o1ZJk-00AXBr-Dq; Wed, 15 Jun 2022 20:08:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=mvnsElnBR7zsm+lSbvG9wJQfDWPUb2jPmP0mu0jMj1Y=; b=eB4JkV3JEtAg/dTpf4W+lSu5F6
 c5AnM7dgl9NBwRmE53EqLlS9FbIpbtxMKRlINYwR4CBE8DfaxEIvce3vILsSCrt/Mdw2qwq2JET/E
 Ge2cZXx5BTzrqpEaSd6ObMjg90XhN63j7hMTCwfFJxDaW6Ie/3ryT3f2e+ffdjYHyltvCrcK7uGHj
 N6afYkTO3BfKQZ1wkQ7YGds1scxqy+u6FWm7lhB0AcQ2O5gyWqxyx4q1FidW1YZoPXcLqEbOCObgL
 xLKJsvTjJufpE5OAj1oQkUM+arvePjHPPgmHXc2kqMaAcgPJwUK3qvvs14xD/xjus67JSNmgeRCh+
 tQ8mLLsdkcp1G+On//j438+DPFi3CtpM3J+u7/p/mZUNvF4WbK7GBj06C+LBXmAPrdupPgZ/9YW4I
 dm7TuK2xhK7XgnazTGfyqOQ+X3zNleALO+Uk/eBeWkLxvNmMxt1uCWqSz4D8ifmnEmJ66/vruXIEJ
 JK+W2d9k+COrgxiPnM2m078g;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1o1ZJj-005u7N-HM; Wed, 15 Jun 2022 20:08:43 +0000
Date: Wed, 15 Jun 2022 13:08:39 -0700
To: Ralph Boehme <slow@samba.org>
Subject: Re: [Samba] full_audit logs way too much
Message-ID: <Yqo8R+UkPmkqUeXg@jeremy-acer>
References: <327195e7-c757-622f-7d32-d6b9ba5ff7cf@gmail.com>
 <e26019c9f29601592b7d17966134fbd0f07f7a92.camel@samba.org>
 <YqorHg9IGj97L+vE@jeremy-acer>
 <29ff9d62-e5f8-56be-7b54-3347187f5fa3@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <29ff9d62-e5f8-56be-7b54-3347187f5fa3@samba.org>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Rowland Penny via samba <samba@lists.samba.org>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jun 15, 2022 at 09:48:28PM +0200, Ralph Boehme wrote:
>On 6/15/22 20:55, Jeremy Allison via samba wrote:
>>We should probably just log a debug message
>>about the unknown name and then ignore the
>>unknown name instead of going full "ALL"
>>on the audit.
>
>fwiw, as I've faced this issue before as well, my take is that we 
>should fail the connect if the config has wrong VFS names in the audit 
>config.

I can fix it like that also :-).

