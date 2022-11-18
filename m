Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B6F62F82E
	for <lists+samba-technical@lfdr.de>; Fri, 18 Nov 2022 15:50:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Yr8fQqxOuxgfsh7aSNnZ2DOYglECy5/Eal4thUcsDrg=; b=sPF1dF2Cu0Y/EPAPlSG4lQyvg/
	7ELvku2IS+yNKPbdHClP/RgKg/ZMPwjWiao6rI12JiILlTf6dJNXdgOIf9AihYlPljcQb1P/ehZg6
	jvpV8JP3jZTKKreAEO7qb1vPAAyNdXOgvpFnv828qWsSD9lFuSZNsYGDMLtP6BWmygXgIDgYgLwc7
	rjwqfUD2z+mhC6gVscYTA8dcpop76VwPoCModTczIQYBusK39JmBF6kZVnP+7C5ZhODJ3Ne7ISpNs
	qZwCJwjbqZ3+Kuv53t4SQKcbCSx9acD+X+azOqsINirbci0ePQrLh430/gJ3eY6oiPRrUZJonJElt
	ZTnNFRtQ==;
Received: from ip6-localhost ([::1]:45770 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ow2gv-00FHvw-Qd; Fri, 18 Nov 2022 14:50:05 +0000
Received: from mx.cjr.nz ([51.158.111.142]:9692) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ow2gq-00FHvn-8h
 for samba-technical@lists.samba.org; Fri, 18 Nov 2022 14:50:03 +0000
Received: from authenticated-user (mx.cjr.nz [51.158.111.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pc)
 by mx.cjr.nz (Postfix) with ESMTPSA id BC4AE7FD25;
 Fri, 18 Nov 2022 14:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjr.nz; s=dkim;
 t=1668782997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yr8fQqxOuxgfsh7aSNnZ2DOYglECy5/Eal4thUcsDrg=;
 b=SMUz7ChDot1X5TtFeHknvJ01g7SHxh3GY2WPHCNbCbPifrwZqCZWO7jJv09cn16Gs4V9M0
 2O7DUoDkVO+m+jyMRCiThIAgIPEa9dXhYT1ced9lQ8QH8VGI0Vyyb1a88awHuQQpt+S2YD
 M3XcR7B3JEJIDXXgCCYk5h22tM1bWgdT3cFxM25z3bN0rrmufMaB+fKKX2Pjbs+oW863dG
 XEQsBEubSCE9OtwQUhGV+CT5mtHo3qhmpJkwhuXZYnn9Y3xmrU9fOv1u5WySEZjpe42kT9
 MicDg1HVWZrMrd2IeupQwOjG7ALu5A4WmhWjFxfYfpi7IWWwusj+rMMR6yPSZQ==
To: Anastasia Belova <abelova@astralinux.ru>, Steve French <sfrench@samba.org>
Subject: Re: [PATCH] cifs: add check for returning value of SMB2_set_info_init
In-Reply-To: <20221116141027.10947-1-abelova@astralinux.ru>
References: <20221116141027.10947-1-abelova@astralinux.ru>
Date: Fri, 18 Nov 2022 11:51:15 -0300
Message-ID: <87a64ojoyk.fsf@cjr.nz>
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
 lvc-project@linuxtesting.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>,
 Tom Talpey <tom@talpey.com>, Anastasia Belova <abelova@astralinux.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Anastasia Belova <abelova@astralinux.ru> writes:

> If the returning value of SMB2_set_info_init is an error-value,
> exit the function.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: 0967e5457954 ("cifs: use a compound for setting an xattr")
>
> Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
> ---
>  fs/cifs/smb2ops.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Paulo Alcantara (SUSE) <pc@cjr.nz>

