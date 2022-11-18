Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9738062F830
	for <lists+samba-technical@lfdr.de>; Fri, 18 Nov 2022 15:50:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=/rePAaj+Om/SnbzekquTM/6DwN9lHDTUpeQeQgkp3dc=; b=gvsYOxKlrwKG9IZ7qW7JS8vkwy
	fsvvSqQNFmtVoKeGbvi4m+QFJ1EECXOb84iUUM7p3olBHa2fzcRHqq/4ixPtNDHj7rArzrePoqssz
	BcJdt8AutCPngjVBBrNbTmzHcSxgl29PtDIu1iCU6BHPcrDDMxLOQerSQLE8NHAFYR2FSpJEiL9wn
	dPNCiQL4dMewUDGdOVOUzUS0EBq/5nJiC21xivrZFBbbgct+2SWwashf0g9reNvThhMIlU/KZhE95
	14aAsOY7NIIa+0feO0GlNjNtDFbTOvZGxgXlDOw6t+HSfDHJDctoAm673/MdZ7Aq8Rf1cUKH4J9sJ
	jTR0csUw==;
Received: from ip6-localhost ([::1]:62338 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ow2hM-00FI4K-1P; Fri, 18 Nov 2022 14:50:32 +0000
Received: from mx.cjr.nz ([51.158.111.142]:9808) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ow2h5-00FHyE-Iw
 for samba-technical@lists.samba.org; Fri, 18 Nov 2022 14:50:19 +0000
Received: from authenticated-user (mx.cjr.nz [51.158.111.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pc)
 by mx.cjr.nz (Postfix) with ESMTPSA id 58D2A7FD25;
 Fri, 18 Nov 2022 14:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjr.nz; s=dkim;
 t=1668783013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/rePAaj+Om/SnbzekquTM/6DwN9lHDTUpeQeQgkp3dc=;
 b=ALBdruPCG8kg8CYj1aspn86VITy01IRFclshjVb2AwcDl8G1yzf4K5Al5ZT9tY/bLaEOSI
 QsMHqTCpnef89BxB9MMnSY/wCPcrIvjcjZ5mJA8LKIvl6KxgNX7xPS0qv/ppW8FPu7/tx4
 eCJz6Qib+sZYvXRMc4qBPho+BTcxdi2fdvtlmWDxwFr76oz/tOzM+/wEl7iVU0TUuAvcAS
 y37bI7Ut0k3jwPo5FGYoCaeNY3CP6r0OmiZfq2faMsDntPF8BEGakXmwuxMKILpFwPA/kD
 NHSeR/x3vn1v7ocZstjtUz52mhlyjyIOK6vcILJwqyxMGV6b6OrE8YS19P4CsA==
To: Anastasia Belova <abelova@astralinux.ru>, Steve French <sfrench@samba.org>
Subject: Re: [PATCH] cifs: add check for returning value of SMB2_close_init
In-Reply-To: <20221115142701.27074-1-abelova@astralinux.ru>
References: <20221115142701.27074-1-abelova@astralinux.ru>
Date: Fri, 18 Nov 2022 11:51:31 -0300
Message-ID: <877czsjoy4.fsf@cjr.nz>
MIME-Version: 1.0
Content-Type: text/plain
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
From: Paulo Alcantara via samba-technical <samba-technical@lists.samba.org>
Reply-To: Paulo Alcantara <pc@cjr.nz>
Cc: linux-cifs@vger.kernel.org, Shyam Prasad N <sprasad@microsoft.com>,
 lvc-project@linuxtesting.org, linux-kernel@vger.kernel.org,
 samba-technical@lists.samba.org, Aurelien Aptel <aaptel@suse.com>,
 Ronnie Sahlberg <lsahlber@redhat.com>, Tom Talpey <tom@talpey.com>,
 Anastasia Belova <abelova@astralinux.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Anastasia Belova <abelova@astralinux.ru> writes:

> If the returning value of SMB2_close_init is an error-value, 
> exit the function.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: 352d96f3acc6 ("cifs: multichannel: move channel selection above transport layer")
>
> Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
> ---
>  fs/cifs/smb2ops.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Paulo Alcantara (SUSE) <pc@cjr.nz>

