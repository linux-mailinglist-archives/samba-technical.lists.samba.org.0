Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4599B3962D5
	for <lists+samba-technical@lfdr.de>; Mon, 31 May 2021 16:59:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=qJuMoqwILVb+N2IGSWtT1m1P73SBKtjiUw0oUcTLrHM=; b=xs1PQqU7zFxTe1bwAh4KdUwknn
	7nP/NfR8eERg3F46CAEPfeluS6GeoKR16HdIX4YUKTQbd3f6BrrD2o3+olvqyATekZBvQXkE6rfdN
	kgivxsVM8wxn0S8NoT2S3Bn5kEa2Ha2GXZ8+LZpe2Ay0MEgIWzD25TgMcXlzl3NIzmtnUEwwUqSVI
	AXvqRyxJWs0Wc+z8mE28v77d83FX1+h72aqosvSdoc/oyPMrzEiGj+E4pfuCvjaXL5l/rdoywX3Ru
	QzXYSi99OI3w6EjTRQIg2klDtKqYQvXgcdl2NED86KCbqXBCEUqAd7E10uUroGeG6uKpYF54LWziW
	YlKKiMCw==;
Received: from ip6-localhost ([::1]:58468 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lnjNJ-0009OT-1N; Mon, 31 May 2021 14:58:41 +0000
Received: from mx.cjr.nz ([51.158.111.142]:13746) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lnjNE-0009OK-1v
 for samba-technical@lists.samba.org; Mon, 31 May 2021 14:58:38 +0000
Received: from authenticated-user (mx.cjr.nz [51.158.111.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pc)
 by mx.cjr.nz (Postfix) with ESMTPSA id 9400C7FC02;
 Mon, 31 May 2021 14:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjr.nz; s=dkim;
 t=1622472453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qJuMoqwILVb+N2IGSWtT1m1P73SBKtjiUw0oUcTLrHM=;
 b=dEs7vZf7HWzb5ZSRlZ8wdjQCIG+TzB3r7OS87X9o42eKSfROG5UrXIf4oh+/ljFnNUSZUY
 PdUD+A04WM0AXhqqslrGmF0bgvoWWlHBMhOoDbI7JdnIeoRyBWkp7VlanY84aLE87TQ84G
 8NvLZYqi3uGhTfQwEBcNS+mHCQIv+wtYOyDA/5LQDsJGaF/CJHE4S+aHNI7mcXxZkU/4lP
 +W2ugYU6AMfkzzA3fgB7bbb+EuyTn79IK/eXlGEtTcv5WoP5JzwF0vnJQVrDXylSe16MsI
 ELUOJRgk6p0dXSG5Sdme7ZrrgjEun8FEvW8GD00tjyizjBdRIwoTqdzoAn9ENA==
To: YueHaibing <yuehaibing@huawei.com>, sfrench@samba.org
Subject: Re: [PATCH -next] cifs: Remove unused inline function
 is_sysvol_or_netlogon()
In-Reply-To: <20210529114848.19608-1-yuehaibing@huawei.com>
References: <20210529114848.19608-1-yuehaibing@huawei.com>
Date: Mon, 31 May 2021 11:47:27 -0300
Message-ID: <87eednot8g.fsf@cjr.nz>
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
Cc: linux-cifs@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

YueHaibing <yuehaibing@huawei.com> writes:

> is_sysvol_or_netlogon() is never used, so can remove it.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  fs/cifs/dfs_cache.c | 11 -----------
>  1 file changed, 11 deletions(-)

Reviewed-by: Paulo Alcantara (SUSE) <pc@cjr.nz>

