Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FA362F810
	for <lists+samba-technical@lfdr.de>; Fri, 18 Nov 2022 15:48:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=i4KIqUADj/IJllVAyObmkbmWGqEBQfr/5CjaR+2wZao=; b=2lRFYMRZkNJ9CMcOczo9IeAQJh
	oqwLIesVAdi2KGiC9evwqLsVDV1WHmsxNkCwHfCqFZYskBuDfQu3Re7Xl/PrDLgr5d1se2l93H6+E
	0Tu+kXA/wavC+OJwqjoCPmLMwl8VbfZ/2lVOqPlC8XP2TxWKIkSmL/Wos7BmKvypfo52oZepsAfi/
	bN73N17lU8pzXBk4oZZsBQtfbJrWsTQtUF8/thw2pDs5lDlilocS9HAT0UTUTcKhRIyq/c069m8NT
	oSFhZ3ixoMs6IT4dy21AO9THDo4C36WVxj8vu/H0xIISbPo5GwCZbxhrcN6G+WmWfLHTxT7Xg+PKr
	4h+vBWAw==;
Received: from ip6-localhost ([::1]:54780 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ow2e7-00FHeU-BM; Fri, 18 Nov 2022 14:47:11 +0000
Received: from mx.cjr.nz ([51.158.111.142]:9128) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ow2e0-00FHeK-2S
 for samba-technical@lists.samba.org; Fri, 18 Nov 2022 14:47:08 +0000
Received: from authenticated-user (mx.cjr.nz [51.158.111.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pc)
 by mx.cjr.nz (Postfix) with ESMTPSA id C526A7FCED;
 Fri, 18 Nov 2022 14:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjr.nz; s=dkim;
 t=1668782811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i4KIqUADj/IJllVAyObmkbmWGqEBQfr/5CjaR+2wZao=;
 b=v+gUuexlcJgBUnllEq88k6vkD5GyDzJojlJ/cZgyU993jASZyrhs/bgoURLsUCaKKksrsg
 yuNVNiUKAqD2G7lm/1b9Ga3AXV5PugeDSXfsQtVexZYriAL1j1y3Hitf1ejerCZNw4gueI
 iyPS7CUqru7bhjl/ZjkaEPMhqhX/6mTbOV0VTtRShLbNSAxkQmS/XgPxbXUXhAsxJIfAgj
 EETTeHSg/HFhVT2hFCB9Yd/gr9pvUlp9Swc2cQLD/BIdlliSGftcNr2w6MeT8HNStOnazz
 1/0/AY5TfTOkGeFM1/WmgVAlkQzqWpfRu3wnh3AWDt66iPdhclJHZG7+pDCRzg==
To: Dan Carpenter <error27@gmail.com>, Steve French <sfrench@samba.org>
Subject: Re: [PATCH] cifs: Use after free in debug code
In-Reply-To: <Y3dw8KLm7MDgACCY@kili>
References: <Y3dw8KLm7MDgACCY@kili>
Date: Fri, 18 Nov 2022 11:48:08 -0300
Message-ID: <87edu0jp3r.fsf@cjr.nz>
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
 samba-technical@lists.samba.org, kernel-janitors@vger.kernel.org,
 Ronnie Sahlberg <lsahlber@redhat.com>, Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Dan Carpenter <error27@gmail.com> writes:

> This debug code dereferences "old_iface" after it was already freed by
> the call to release_iface().  Re-order the debugging to avoid this
> issue.
>
> Fixes: b54034a73baf ("cifs: during reconnect, update interface if necessary")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  fs/cifs/sess.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Paulo Alcantara (SUSE) <pc@cjr.nz>

