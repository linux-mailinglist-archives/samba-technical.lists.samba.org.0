Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B29F619F5A
	for <lists+samba-technical@lfdr.de>; Fri,  4 Nov 2022 18:57:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=q1Dy8m8CsJkIJ0vL9UqbIPKGPHuWYevvTp/f6vZV0pM=; b=q5G1yrw/SO9OdN0/23nUP/ofCr
	76VVX4Gj0ZIANOlYXjfAx+L9kjDUPzXhc246MAUd88XRm2CaHTEr+puZ6lFOyQPlCDVHV28J8ObQu
	+Ae1quRVLtlX2TGL5tRdOHSd68ksKLHAaQlEn8zkMrcDXp8qnuMNuhy+APZ8IYEtH6oYX0ADtyq7M
	qGjV/kDs47uMnBWUifjuOU8+35ku+UkOQdMkyR+J3yUBfj5jto/YhteAR4rtUK5QIgV7dcNThLhBA
	wa8EC5Cqpbyeprw4e4hB/fEgI5ZBa/5bqGF5PJT1Gev/zOZCKtt6L/UPRrkaZ2q3jXPIM9BAqFWjT
	AvhuZ3Rw==;
Received: from ip6-localhost ([::1]:30228 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1or0v8-00AxlP-HX; Fri, 04 Nov 2022 17:55:58 +0000
Received: from mx.cjr.nz ([51.158.111.142]:24142) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1or0v2-00AxlG-Vy
 for samba-technical@lists.samba.org; Fri, 04 Nov 2022 17:55:55 +0000
Received: from authenticated-user (mx.cjr.nz [51.158.111.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pc)
 by mx.cjr.nz (Postfix) with ESMTPSA id C75D37FC21;
 Fri,  4 Nov 2022 17:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjr.nz; s=dkim;
 t=1667584549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q1Dy8m8CsJkIJ0vL9UqbIPKGPHuWYevvTp/f6vZV0pM=;
 b=pW6sPzhPrB5TXSoZipU1GaNRjF7yspEEjL4QX3KVHm8sRdQhsonojI5CWnutDj9nBFkRX/
 FJMRlg1f7y3QdZA6B/XsqRiK0lGjSdBKjTB9re1e1LVqo2UUrDDULdpkRNpOgaDpWfAJuK
 jq0dtIxOdBMjq0/R31fetPo7pdnXwJEQWt9Ohk0sfJmcoqLW7ofhY+mIVprTqxHnGyM61R
 KWpJbs5gxRt0b1VDtULMzCF7u/iALCq+UJG6/6AguPO6VrVMMsQ52PexFKYCRVc8akBMm4
 KIbXtm6L1Z/GNau2DuwqwNz1ocBoKNe2NDVJ2UzwY7sKWmN6j3F6YyvixeoApA==
To: ChenXiaoSong <chenxiaosong2@huawei.com>, sfrench@samba.org,
 lsahlber@redhat.com
Subject: Re: [PATCH v2] cifs: fix use-after-free on the link name
In-Reply-To: <20221104074441.634677-1-chenxiaosong2@huawei.com>
References: <20221104074441.634677-1-chenxiaosong2@huawei.com>
Date: Fri, 04 Nov 2022 14:56:57 -0300
Message-ID: <871qqi1u3a.fsf@cjr.nz>
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
Cc: linux-cifs@vger.kernel.org, yi.zhang@huawei.com, chenxiaosong2@huawei.com,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 zhangxiaoxu5@huawei.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

ChenXiaoSong <chenxiaosong2@huawei.com> writes:

> When opened a symlink, link name is from 'inode->i_link', but it may be
> reset to a new value when revalidate the dentry. If some processes get the
> link name on the race scenario, then UAF will happen on link name.
>
> Fix this by implementing 'get_link' interface to duplicate the link name.
>
> Fixes: 76894f3e2f71 ("cifs: improve symlink handling for smb2+")
> Signed-off-by: ChenXiaoSong <chenxiaosong2@huawei.com>
> ---
>  fs/cifs/cifsfs.c | 26 +++++++++++++++++++++++++-
>  fs/cifs/inode.c  |  5 -----
>  2 files changed, 25 insertions(+), 6 deletions(-)

Reviewed-by: Paulo Alcantara (SUSE) <pc@cjr.nz>

