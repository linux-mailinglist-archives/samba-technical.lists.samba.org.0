Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 978DF8AB28E
	for <lists+samba-technical@lfdr.de>; Fri, 19 Apr 2024 17:56:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=KqGQPaqehHcI2IeKAf2Liecz53eBG4Btw11mugwJjeg=; b=roJAbeAGETefm5s9xpPBNK+I9w
	oJvqCN1gqwPog/UbjtFaEsorMleyTO0VWpqZU1PE5otoSf13FREQ6a/hV5z6IZP0Iw2KLpvj6R5cE
	Ge+vY+RUq/AfDmuENBd7zJ9l7vQS0p5bWympfQvl9VkrPvtrsb8I9cuKUF3eYsTr4kE7bPgENLwlK
	zOD49ML85bV8viEE34RK4y/lSAdEdwGCpAl2JbffWlxoohNQvL1nm/qvuD0gLrBuKlIm+MT46PZoU
	NPjQd6hIvip6ZkuUEiGJ193A7IRS1BuP49WUNGCYZ4m8OCoESxrX5dEdS+GinuU8VnNbK3HD5iYrg
	pKEN9JSQ==;
Received: from ip6-localhost ([::1]:33040 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rxqaE-005CWM-Jb; Fri, 19 Apr 2024 15:55:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51994) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rxqa9-005CWF-HE
 for samba-technical@lists.samba.org; Fri, 19 Apr 2024 15:55:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=KqGQPaqehHcI2IeKAf2Liecz53eBG4Btw11mugwJjeg=; b=pWg7KJEQDnbfZTi55LPPgfwu42
 EhAMr+G51dYVQt1HshKAS+NYuwg1xDWh2tT/OPTkBp2XtVn9/xLxcyD1Dzxfc7rF1UwP7D545w5hk
 QdXIVZQALABSGqVP7Vp3Tjmea3yhTvcea0SmPWDUhwY4Aylfn6wvMCOuzA+fT0b3S0slo5vbwrSur
 mlSrYwO9KGwAKue6Yj9W0r9/cV+RCLOvwdNiZBkTS6qrgitFoEkMy05I7D20uJLLEC5Ajyzrj0R4z
 tD3K5a7VTBggbgFqGz6r+IzMMGmV+P2BXXquf3Fy2wOG3vjojl/7aM8z3kwFJ+uoiZA/DOc4bu0dv
 FdqVJPxHBt4Jku76y1dW75SlMoSZ4fcVJR83CbuyLJTvT9EcgA2BkG9UnoLKvqsfeZwnJQnhfMH9s
 hmPOXudxWyCgfOtNi3nsQpoIRVTevBvEen0wT0DAKznUd1OowyHSkuMnjFG8YTiH/uZ+XLlFsn+Ps
 xSQuYlcNd95h/ZIxtIZy7SvI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rxqa3-007HKk-0k; Fri, 19 Apr 2024 15:55:16 +0000
Date: Fri, 19 Apr 2024 08:55:12 -0700
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Missing protocol features that could help Linux
Message-ID: <ZiKT4CursWvT2dhq@jeremy-HP-Z840-Workstation>
References: <CAH2r5mstDacz=gvpjFQeB_nc1kBjyzTZw57tF8UNrXARXkV1rQ@mail.gmail.com>
 <c7d80c1538db3a414636977314feba13871907ef.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <c7d80c1538db3a414636977314feba13871907ef.camel@samba.org>
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
Cc: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 Namjae Jeon <linkinjeon@kernel.org>, CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Apr 19, 2024 at 01:40:34PM +1200, Andrew Bartlett wrote:
>POSIX <-> POSIX locking over SMB is something I have a client trying to
>get working with SMB3.
>
>They have a use case where, as I understand it so far, the mapping of
>POSIX fcntl() read and write locks to SMB locks isn't 1-1, because they
>expect advisory locks, but SMB locks are mandatory as far as I read
>it.
>
>They use cifs.ko and Samba, so it isn't about working with Windows, it
>is about running Libreoffice on LInux against Samba.

That's not going to work the way LibreOffice on Linux expects,
until we fully expose POSIX locking semantics.

It's the range semantics that will probably break them.

POSIX locks can be split/merged/overlapped. Windows locks
must be distinct. Currently over SMB3 we only expose Windows
locks.

