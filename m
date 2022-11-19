Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3C6631098
	for <lists+samba-technical@lfdr.de>; Sat, 19 Nov 2022 21:04:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ccp2wBYFO08vbXEm/oc3l6HKT+S2pZFfZ4H2UKRPVcM=; b=14K0a+90DTHeUPhsWFJ+FfnQwa
	vciNXqW9xjLIVEcpSfH4U20n+lSDc7lRYMG9qivpAQawJJqDYkTM3nmLC/0cFxM9WeL3gWUZKbGda
	xRqFIU+AgrBU32iBZnnMmRI2wRi2cgw0gorEgodBujHF/9wSLa5WvmbwOVAyz92s7+n6Nj9NwkPxm
	HKINUVBuqOp/g+6OC+jRpimBbXAHCl3GLA9ICB8n7JxsQR+sTh31NP9FRkC+vwP0L7pLtM5Qzak1P
	a9kDQ8BcDSCcs+vQF1+WRehyAsjSAuAdbQ5HMGJqGo058Rsr806BNU/iLc7iZEFo8UmBZ5L+OG2kX
	zwlj37PA==;
Received: from ip6-localhost ([::1]:21158 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1owU4Z-00Fj1b-U2; Sat, 19 Nov 2022 20:04:19 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:43856) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1owU4U-00Fj1S-IN
 for samba-technical@lists.samba.org; Sat, 19 Nov 2022 20:04:16 +0000
Received: by mail-lf1-x129.google.com with SMTP id d6so13342639lfs.10
 for <samba-technical@lists.samba.org>; Sat, 19 Nov 2022 12:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ccp2wBYFO08vbXEm/oc3l6HKT+S2pZFfZ4H2UKRPVcM=;
 b=oJIdZboD3LegFim07gTIpp2yjxJgy6JTs/1S+LgCUkXEHlNZp1otIlsxSu8jimHZoz
 KNcCV4OHsBzp0dtTE0spPqgKXa8M54B2NUtIkt8ViDhh3r5qrmBaBhztY6a5kBnM8y3q
 Rdzj4rFrqxJ5fmPSXV6qJ7rxwN8cfgmW6X+fRotJhCzxEkXK/4AJxqXDEYhNc4Ms0FBe
 M3LP6x0HDK/PESNm4LFXHNpN/kSOhwXT5PdQOIECMHiwDSiwRTR4Ij/U9xGGHVdu7rOh
 HSfHh/7aOKspgZmAG1a0SgpbeaOPmyGSMyQ8ydbpjSl+RqLYuhU7H0PZAiGvBfq8vCMl
 /sBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ccp2wBYFO08vbXEm/oc3l6HKT+S2pZFfZ4H2UKRPVcM=;
 b=8CEGL1cBaizLxRVTNBYstgYEP6NP4zT3aqT23ts0T5LdMZPaEHzZmV8+509C1Yllg8
 uxADk2zQaOC+yU7cQIk0NMVgiubqCOUu8CfjKut0apwsuJGw+MNWJ/u8TNbNHO/gszcg
 UVt5C9oxsfdSySKX45TwHu+4vCOEZjBtWiAjUVlnXc6j873bfPt//L2gkfJx0fXi+a+E
 VkoK7lpPs475BSDwqmHFHzJTQCIzSGjKkC0PN8NNvaKGnD88m+AbjhjzIk2DOHCq1gqU
 9841PqqXUL9dAZQt+Rn37Cfakd0HllzV28tFErWnWatfKz/nKQgeGsk8g2q7Sig7blkU
 YPZw==
X-Gm-Message-State: ANoB5pkpgjVA6KJGqE7jlIwfHRWiAT/MZOwigSA7nVMMNoc5Joj590KD
 TVUeKJoVlYtoPJYhUmr4JTL1UaupYNAwRuA/CzU=
X-Google-Smtp-Source: AA0mqf6Ox0HWsFKikihBgL/tqHbJffquiFQYL/D/NGLcRMUKabfuF1EhgDX6YA33mt/gp/ydXospydzbprKOFR6YxGs=
X-Received: by 2002:a05:6512:20cb:b0:4a2:23f5:c1f6 with SMTP id
 u11-20020a05651220cb00b004a223f5c1f6mr4164415lfr.472.1668888253418; Sat, 19
 Nov 2022 12:04:13 -0800 (PST)
MIME-Version: 1.0
References: <20221119045159.1400244-1-chenxiaosong2@huawei.com>
In-Reply-To: <20221119045159.1400244-1-chenxiaosong2@huawei.com>
Date: Sat, 19 Nov 2022 14:04:01 -0600
Message-ID: <CAH2r5mttt0zhzaz4XwPqz0x2m-P98oD45JJuMVfqu7EP2nbq_g@mail.gmail.com>
Subject: Re: [PATCH] cifs: fix missing unlock in cifs_file_copychunk_range()
To: ChenXiaoSong <chenxiaosong2@huawei.com>
Content-Type: text/plain; charset="UTF-8"
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: dhowells@redhat.com, linux-cifs@vger.kernel.org, yi.zhang@huawei.com,
 pc@cjr.nz, samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 sfrench@samba.org, yanaijie@huawei.com, zhangxiaoxu5@huawei.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

good catch.

merged into cifs-2.6.git for-next

On Fri, Nov 18, 2022 at 10:09 PM ChenXiaoSong <chenxiaosong2@huawei.com> wrote:
>
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
>
> diff --git a/fs/cifs/cifsfs.c b/fs/cifs/cifsfs.c
> index fe220686bba4..712a43161448 100644
> --- a/fs/cifs/cifsfs.c
> +++ b/fs/cifs/cifsfs.c
> @@ -1281,7 +1281,7 @@ ssize_t cifs_file_copychunk_range(unsigned int xid,
>         rc = filemap_write_and_wait_range(src_inode->i_mapping, off,
>                                           off + len - 1);
>         if (rc)
> -               goto out;
> +               goto unlock;
>
>         /* should we flush first and last page first */
>         truncate_inode_pages(&target_inode->i_data, 0);
> @@ -1297,6 +1297,8 @@ ssize_t cifs_file_copychunk_range(unsigned int xid,
>          * that target is updated on the server
>          */
>         CIFS_I(target_inode)->time = 0;
> +
> +unlock:
>         /* although unlocking in the reverse order from locking is not
>          * strictly necessary here it is a little cleaner to be consistent
>          */
> --
> 2.31.1
>


-- 
Thanks,

Steve

