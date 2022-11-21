Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EDF632689
	for <lists+samba-technical@lfdr.de>; Mon, 21 Nov 2022 15:41:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=bEARu0JbQorKPvi4zAUJ1f0tT4f5K3ZqomAc0zTv4IU=; b=v2RwdFWgFbd/i2thOal/jgKbcb
	9a9WJmYZ1R0aADvNhadhnV8uEP5CA+E6jvH3/WCzoLanFvO9VcV6IWlJgUn25VpJ1cEAx4B4AeSvK
	sKFuE7R4PBX6rgPpcHxqqpPFhfYwKb2vbz9/h3wCBfJyi5XvhPcAD1dUqZ1MmfkTxmenKfxs1iVJ2
	MnzWYJ7xILBl7O100Uhul9kri5YIxlYgiSxneOGYcnp5TcbBh0bPH/rGoBwiOe6IfuYSmtGJt7jhZ
	GMRnljb2fQr0po5Bpiv+Ga+nJrfknSzuh3crBYD+VyOV7b7vHdL5TEtNxny+DS4leZAh06b14kE2w
	pRjXV7SA==;
Received: from ip6-localhost ([::1]:24424 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ox7yW-00GJhZ-GG; Mon, 21 Nov 2022 14:40:44 +0000
Received: from mx.cjr.nz ([51.158.111.142]:58630) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ox7yS-00GJhQ-6l
 for samba-technical@lists.samba.org; Mon, 21 Nov 2022 14:40:42 +0000
Received: from authenticated-user (mx.cjr.nz [51.158.111.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pc)
 by mx.cjr.nz (Postfix) with ESMTPSA id 45B8B7FD25;
 Mon, 21 Nov 2022 14:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjr.nz; s=dkim;
 t=1669041637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bEARu0JbQorKPvi4zAUJ1f0tT4f5K3ZqomAc0zTv4IU=;
 b=bUeIfrhiI1iRGk6aylBQTqyrT9PYNIYcVY0djJjxf6ssRl1nqqNJltP6/NdbjN6LDiPdOo
 bOYBdhhQLZtO27XSd7Oal3iLJIyDYc5KT68mYjzRw1JO4BKli3GTh+z8DNChXSjRI+Pn5D
 NOU0Un9UlJcI9rSRJUHPG80FG9dMY/CN4ou1YtcjVh202tI1/ATCRaN1AGXUI/QJF0D0Tk
 wbvyHuebllBcWXFOzFt5RadidQq+bVdMeGF3EPnmFFBYqn5f3sWGHD9MFUdIXE5Jla3Uz7
 hfGrtR6LX5FCIBTF1tjoadg2/L2d5oCyNpVxWnM6MX8yB7kCoZFk6jT/+v4iUA==
To: ChenXiaoSong <chenxiaosong2@huawei.com>, sfrench@samba.org,
 dhowells@redhat.com
Subject: Re: [PATCH] cifs: fix missing unlock in cifs_file_copychunk_range()
In-Reply-To: <20221119045159.1400244-1-chenxiaosong2@huawei.com>
References: <20221119045159.1400244-1-chenxiaosong2@huawei.com>
Date: Mon, 21 Nov 2022 11:42:01 -0300
Message-ID: <871qpw1i9y.fsf@cjr.nz>
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
 yanaijie@huawei.com, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, zhangxiaoxu5@huawei.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

ChenXiaoSong <chenxiaosong2@huawei.com> writes:

> xfstests generic/013 and generic/476 reported WARNING as follows:
>
>   WARNING: lock held when returning to user space!
>   6.1.0-rc5+ #4 Not tainted
>   ------------------------------------------------
>   fsstress/504233 is leaving the kernel with locks still held!
>   2 locks held by fsstress/504233:
>    #0: ffff888054c38850 (&sb->s_type->i_mutex_key#21){+.+.}-{3:3}, at:
>                         lock_two_nondirectories+0xcf/0xf0
>    #1: ffff8880b8fec750 (&sb->s_type->i_mutex_key#21/4){+.+.}-{3:3}, at:
>                         lock_two_nondirectories+0xb7/0xf0
>
> This will lead to deadlock and hungtask.
>
> Fix this by releasing locks when failed to write out on a file range in
> cifs_file_copychunk_range().
>
> Fixes: 3e3761f1ec7d ("smb3: use filemap_write_and_wait_range instead of filemap_write_and_wait")
> Signed-off-by: ChenXiaoSong <chenxiaosong2@huawei.com>
> ---
>  fs/cifs/cifsfs.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Paulo Alcantara (SUSE) <pc@cjr.nz>

