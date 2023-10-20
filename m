Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 033D37D05AD
	for <lists+samba-technical@lfdr.de>; Fri, 20 Oct 2023 02:09:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=ejOszhK1ZyQmSIcoS3TpvrmrBycsdC2hFJOfftcxUF0=; b=j6NsNcTZh38RgjppU3fNOK30Ed
	tbZcInBujzIaGv/W7sdP7S95AH7wP95FscohIpmonxg6zPiUbX4nC4TnfduvAwuYaoBcKjEaf2i1F
	yFHbxF7jWEL0YGjVBSVlM7F4knfLwoIniVcc3MHIZksgEf8U8wXfDacsc4Er4Nbcz1MMaMU4zbK79
	oqahFttJBxxwjiB2Vt7tzWQuRVHf8brZt67Ra/KybNGmfWVjg94KpzL8XdGqMCHEQ5NJxMZNMWFvA
	YLqJEwi9s6w1jZ1Wydal0T0Aw2JnyucO4PCPmiwwO6gU3p8x+zpDSqndHZxK8PLAAHXwPRPZhL96b
	TKlaU+Aw==;
Received: from ip6-localhost ([::1]:50072 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qtd3t-001R57-KD; Fri, 20 Oct 2023 00:08:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51140) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qtd3o-001R4x-Hv
 for samba-technical@lists.samba.org; Fri, 20 Oct 2023 00:08:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=ejOszhK1ZyQmSIcoS3TpvrmrBycsdC2hFJOfftcxUF0=; b=HlpBl+l/iHMYHB7aUOFtr0kxAv
 fgmN9u2fWY4uSUYYE8ibfZy3LhJzlPW/PHOxov6q4+9MUQs/IHWuySZZdR1Wu0UJkdbopU1UqZhDd
 mFYrC26Xh8IzGTjjRJpVSltY457ZPcOIBk5JG46AdcBdf2QSls9t/OzNqZoElSLhTSS/oxGQiykJH
 aCsaDinQJE9aTfI4jz23qQINFdFZ3utX1y5WXyOVg8vs6hDtejfQehdl7cVxJWBWe8+kGXAi9aEUK
 HyKZ0RnAWYIZcuYfA/lz7pqw5Ow78ezxERGo3GNOjICoAT5jzlEcBjqMwIfGrkN+nCBdcLk8icXAm
 6BguQHF+EqTlsK2Wz/yGEVhWLUoU8P1YncQrIxIAtSNEQ7Z45ZcYYqF4S6ey4iCKo/w27qWzDaqPl
 8xappFvSicM0DOCr0fECShx8pSl6sWDtpM3t7/ymIkppbE1tSSqxfAz444fXO5uow9u6JzvbsNWq7
 iUdu4it903GXoF7GD1ZMqkyJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qtd3n-001axm-0b; Fri, 20 Oct 2023 00:08:15 +0000
Date: Thu, 19 Oct 2023 17:08:12 -0700
To: samba-technical@lists.samba.org
Subject: Samba on top of cloud ?
Message-ID: <ZTHE7GzYWbhSkfQU@jeremy-HP-Z840-Workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I saw on Hacker-news this:

https://cuno-cunofs.readthedocs-hosted.com/en/stable/getting-started-core-concepts.html

tl;dr it's a proprietary mapping from POSIX -> S3
via a FUSE API but also using LD_PRELOAD interposition
in the same way we do for socketwrapper etc. in Samba.

I just wondered if anyone had tried running Samba
on it and if so what the experience was ?

If they want to support us fully they'd probably
need a vfs_cunofs Samba VFS plug-in that calls
into their API's directly.

