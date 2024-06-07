Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C35900B20
	for <lists+samba-technical@lfdr.de>; Fri,  7 Jun 2024 19:20:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=kOZvRVTySbRni5afVf+GtyV4XTHlZOBbpeCGMCQz6Ls=; b=BBcnAQIODvpQQ62S2mpgg2/kpP
	QahHcg8dJtCDjdhWtFQviAub45HWtcNgPHGeCnO1qFy03i0MB9FZuZ5Z55ocRf5/qal6RqHsGqMtR
	Q9B00AYrF5bYi7u92cr3yfRNzTgXGamILFgV7D8ApV5LAASzIooxn4so+NUN8P/ujhH+4s0nT85Sq
	SkVXZKJE8CSTiQnDmKmwXFDcJw+fb/CcXe/RrLYt6hG1rJoQso/NgyLm48SE4+zaQhbtJr9gOQQwa
	SO6VrI0NIq9TFeuXlbLCbudVO9hFMF7GHtybklq8v1Yh8MuyNvcCHu1ZUAGG4KVmEpF1pXch/h99M
	uZlofZBg==;
Received: from ip6-localhost ([::1]:47714 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sFdFX-00D6nJ-OD; Fri, 07 Jun 2024 17:19:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43244) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sFdFT-00D6nC-GO
 for samba-technical@lists.samba.org; Fri, 07 Jun 2024 17:19:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=kOZvRVTySbRni5afVf+GtyV4XTHlZOBbpeCGMCQz6Ls=; b=V7mS1z+EbICpbK5XjAObv9pXdU
 sm58Jc83gSs+IbP0Ww4259KCZ1ckIokCHDlmJGGeCgpNvMmbrdDkUQ3+cYF9xmNAnMu+5MK457wLy
 SKX8rTuURL0Zu6N6PUQlVpjxQzX1epIYK+ivZ4Y6hQc8s3hwO7MfUFnpFQ+5gRmE/cIn1GJGcppQa
 2iYhLZi11ANxPt8o3XsSXs32MSrkg+X+wlZrEm1CgN6RWpKzU+B+Dh18/MbN8yK1A8RyKyqEdI2LU
 Q+XeoMz4ycdC/+ANZvAwlYzQ+TktHLSm0SVmWJJioYVBt33/AdKsHYOJWJxZv6nylhcEuDZkGC3dk
 n5fCdzCiI48S/+LeOUoDaEUnkGbkQDe1yUADxq9wJmKRFiGq0NhJ8PP5IW0nMpn9HGXCu7Bt0Ss6K
 YVElPolI6MnJ/YO6FJR4r0kFHOSG+CnDL+74d1ykCCSJY+m5rRvKKyxJ64DHtLoXQohARtCKLoo+0
 5OcnU6k4Js/V5y7WypSzGsQq;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sFdFS-00FYyH-0Q; Fri, 07 Jun 2024 17:19:30 +0000
Date: Fri, 7 Jun 2024 10:19:27 -0700
To: Stefan Metzmacher <metze@samba.org>
Subject: Re: SMB_VFS_PARENT_PATHNAME
Message-ID: <ZmNBHxdnuTN42QP8@jeremy-HP-Z840-Workstation>
References: <ebf3fb98-7c76-42ff-9716-818da62cca46@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ebf3fb98-7c76-42ff-9716-818da62cca46@samba.org>
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
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Jun 07, 2024 at 03:55:08PM +0200, Stefan Metzmacher wrote:
>Hi Jeremy,
>
>I'm currently looking at shadow_copy2_parent_pathname()
>and don't really understand why we have it.

For the list. I replied directly to metze with an
mbox containing messages discussing shadow_copy2_parent_pathname()
=66rom around the right time.

Hopefully this will help :-).

Jeremy.

