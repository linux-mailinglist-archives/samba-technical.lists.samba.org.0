Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D132D1731
	for <lists+samba-technical@lfdr.de>; Mon,  7 Dec 2020 18:11:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=yiTQ6/a43PaPMe3dbNCo/61WkEnqAIR1upl49SaYgP8=; b=5r+0s1gAiQa3KpL9gKGArdI7gG
	OoyUoOE3swpe2ffKcK1CWy1iQZEsMa7PUSV2FFOH43FJwv7sWwpRPuA/FZP8wN1mr0LPyX7WXUnpv
	5U/s5y0acRcib2j8IFbsEknoEH+0q7OjxtoMwtmZDVHgnwV+EG9b94y+dfgz3es+99v4f7FamHfqA
	3jaolePRBNcwitBa1KDmQLXpfVPaxJP4shyG189lSMMwUYFavWgafBo/FUKHzcRlzD1Q+DP/FQktx
	Ndrw9npsS8AHPVhe+S5SFfLuJFu8n/QKAAVpLst0izJZd5SVYZjBfql9w9B6QMEMqQYqGQpD760QM
	+W9VpByw==;
Received: from ip6-localhost ([::1]:44438 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kmK2E-0005ky-Su; Mon, 07 Dec 2020 17:10:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44262) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kmK20-0005kr-Iz
 for samba-technical@lists.samba.org; Mon, 07 Dec 2020 17:10:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=yiTQ6/a43PaPMe3dbNCo/61WkEnqAIR1upl49SaYgP8=; b=Ycqwm6Qi3oX1OpCiQ6jxFirttO
 7/hUb6uPqe43/+8mm2MZzbi+w2rvVGSxCG/zUPbDTdUiPCtGUPnilUAQ2I4LJpQmlZxWMHGu4d7QS
 JwgCIyfixWdnXdp+JoIIvkrYZvuzRR1cvkY68L5h6Gofp90aQLgxVWhnNFDQdKo2YWx4NhRDWs4Ad
 ypcchrhzBZFAo13Juu/0kgsQ4zG+Gh7jLMxZnK7EBSStz01F52QvUrC/2W1/k8Is51zoXsev9J9db
 celZvCT6Cc0d/F7Ao3a2gSVkqW0TpwzFcuNi7UoqekLUuGhAmEB9xCiXe1VTAj/aNh+xzAkNgWCVw
 0geB53yLlxtOvc6IEDomT4tNtDdi+YnL+s462t9SlLs2VziEsE+F+B++nswQj1mUn6JEHJDFf9tUN
 VBAytLe2nFDQ/j6QJMJQL4Wq7/oRLKsMokqpV59yjibQr/64gixIK9HzXhkRDZNuaUdgY4oX8Btcv
 snjJpYX8QH6PFvi82LHiyiVP;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kmK1j-0007lV-UN; Mon, 07 Dec 2020 17:10:20 +0000
Date: Mon, 7 Dec 2020 09:10:17 -0800
To: Joseph <j@gget.it>
Subject: Re: Samba + exFAT : how to avoid pre-allocating when copying big
 files?
Message-ID: <20201207171017.GC1730617@jeremy-acer>
References: <00a9f6a1-d316-40d1-a067-a39b1a60794b@mtasv.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <00a9f6a1-d316-40d1-a067-a39b1a60794b@mtasv.net>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Dec 07, 2020 at 11:23:05AM -0500, Joseph via samba-technical wrote:
>Hello,
>When sending a big file (for example 2 GB) from a Windows computer to a
>Linux computer (with Samba server), then:
>* if the destination FS is ext4, NTFS, no problem
>* if the destination FS is exfat, then there is a strange delay (~30
>seconds) during which the Windows Explorer waits, before actually copying
>the file
>It seems that the Samba server first "preallocates" the 2GB, before
>accepting to start the copy from Samba client.
>Thus, 2GB (of probably null bytes?) are first written, and then, the
>actual file is written.
>How to avoid this effect that doubles the number of gigabytes written and
>doubles the transfer time?
>
>I have already tried:
>
>    strict allocate = no
>
>without any success in the exfat case.
>
>Any idea?

This may not be a Samba issue. It may be the exFAT driver
in Linux that is allocating the space for position 'N' when
a process writes a byte at position 'N+1'.

I don't believe exFAT on Linux supports sparse
files.

https://unix.stackexchange.com/questions/506740/how-can-i-copy-sparse-files-from-a-ext4-file-system-to-an-exfat-file-system-and

So if the Windows client on copy first writes a byte
at EOF or some other position to pre-allocate space,
Samba does the write which causes the Linux exFAT
driver to do the allocation (slow).

For a filesystem that supports sparse files and
"strict allocate = no" then that write will only
allocate one block and leave the rest of that file
sparse.

You can test this by doing:

dd if=/dev/zero of=/file/on/exfat-drive bs=1K count=1 skip_bytes skip=2G

and if this takes a *very* long time, then it's
a driver problem not a Samba one.

