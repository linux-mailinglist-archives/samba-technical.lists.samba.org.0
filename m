Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2953A5B12
	for <lists+samba-technical@lfdr.de>; Mon, 14 Jun 2021 01:35:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=pLASACZgoEcl1P3pbbsnivd00oF00ItQz/xXGbfD/EQ=; b=aDBLOIboE2DF2hcO3y1og5INUE
	n3U5Tf1yQqXypAERWLcbEcYYS602o+UD5DtrAWRVWlvjYFVOpMR2FMo832GjtneSccGp1EPZM7Kbx
	YWJBNydklPbE4BvOHLCvZQ3CckW7/b4Ir7XQGvcSgldLubu1plqkJp+rk/w+RRae7P7OzOue8z5Kh
	HacEUAoPNNJry31r7YOAoi3+bFUsss1acdv48yoaO4VQ+Wi25BdK3l3t1M74yUSNWshQD7Fdaq/aM
	qFjX0n3RS/LqpxRYjTkQvbxXx6s07krU9msVrzLCyadsBeCFT0kdAhc1n20Rn3rItxXMOrS2xf8oO
	wBjKgExw==;
Received: from ip6-localhost ([::1]:33376 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lsZdv-005RUq-Lg; Sun, 13 Jun 2021 23:35:51 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:40929) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lsZdq-005RUg-F6
 for samba-technical@lists.samba.org; Sun, 13 Jun 2021 23:35:48 +0000
Received: by mail-lf1-x132.google.com with SMTP id k40so17972976lfv.7
 for <samba-technical@lists.samba.org>; Sun, 13 Jun 2021 16:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pLASACZgoEcl1P3pbbsnivd00oF00ItQz/xXGbfD/EQ=;
 b=N8yCzvNIgGxKzDVHLs6pGnODwSmKhFqbrXx7BeqkOGVqxPFVXrHPsx25dEJnz4R2ir
 2l7YB6osG/lUkbOXtobn3Fg3xvIgcDDA/6sBX0pOf/U7/DjjTSvA++JEjLQWj87wcv3G
 Va137eXEb97CBLGkVw8XnswjjxV0fBOVrvke1gJxDl40qWrIs2bjqGapG0kXISPuxKYD
 H0+JatL1I3IoYJK4bZW13sdimWAYaKqwHLRq6AD3R8KadOcC1YEJ3S9hr4Q9DzrzbEMF
 Xo4xe4m8GCxXJTWtrql5iTDFo4Xl0rDbmLWlPfelnp/ntLguOR5Q/9K0CVS6DHQm733w
 30/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pLASACZgoEcl1P3pbbsnivd00oF00ItQz/xXGbfD/EQ=;
 b=U4dLytHjt/DlCDFRw2OItZFngy70jEwpE0DTwSMt2wFgyMdssB6EIePPfcE9CtA1bX
 KHxhc0SHqISOGFYXXNPTwN9I/9swiuq8o+P1WKVeZ212LEJzxUTEkuP8JeaJUBXLIdBx
 pQ1FkKmlVkgXzu2QP/TBJ8nnNUGyjU7vlwA3sMvZTZF7RL6wg84Y+VawwdYar9R3M37c
 JZv7/fUonUAg98wr7+dxmlDceLz9ue6exfLRQeBjnwuD+YBCtBI/GJGgiRCOoQ8KhKbo
 PLdrbnxfVMxWEl91T5cx3WR4H21Xlp2WYn/vKMWlF+WfJkOFhyyC1cK+ZithC+3g12Ba
 80UQ==
X-Gm-Message-State: AOAM531+RJQ0ZsAy0TNZNCxJJcn0hNaaeOeJLeWmJjOCJ/IciHLRHVHL
 zoElPdZrDaplSl30Op42nFHLEpvEw8A+SXPQGP4=
X-Google-Smtp-Source: ABdhPJx+Lw4Xbs1wZzyzLdqYERPwT2cOIF0xwW4dXW328s5oJqjcLoZ9f5LbnFns68wyKfnYZ7qu0XXyinSuw7ze+rs=
X-Received: by 2002:ac2:43b2:: with SMTP id t18mr9819944lfl.133.1623627341275; 
 Sun, 13 Jun 2021 16:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210610114817.3524037-1-libaokun1@huawei.com>
In-Reply-To: <20210610114817.3524037-1-libaokun1@huawei.com>
Date: Sun, 13 Jun 2021 18:35:30 -0500
Message-ID: <CAH2r5mtOfwzNqTmuPhwejk2JBm6YFbF8LgPzyNsKwnrT0V4P2g@mail.gmail.com>
Subject: Re: [PATCH -next] cifs: fix doc warnings in cifs_dfs_ref.c
To: Baokun Li <libaokun1@huawei.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 YueHaibing <yuehaibing@huawei.com>, LKML <linux-kernel@vger.kernel.org>,
 Steve French <sfrench@samba.org>, yangjihong1@huawei.com,
 Wei Yongjun <weiyongjun1@huawei.com>, yukuai3@huawei.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Thu, Jun 10, 2021 at 6:39 AM Baokun Li <libaokun1@huawei.com> wrote:
>
> Add description for `cifs_compose_mount_options` to fix the W=1 warnings:
>
>  fs/cifs/cifs_dfs_ref.c:139: warning: Function parameter or
>   member 'devname' not described in 'cifs_compose_mount_options'
>
> Signed-off-by: Baokun Li <libaokun1@huawei.com>
> ---
>  fs/cifs/cifs_dfs_ref.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/cifs/cifs_dfs_ref.c b/fs/cifs/cifs_dfs_ref.c
> index c87c37cf2914..ec57cdb1590f 100644
> --- a/fs/cifs/cifs_dfs_ref.c
> +++ b/fs/cifs/cifs_dfs_ref.c
> @@ -125,7 +125,7 @@ cifs_build_devname(char *nodename, const char *prepath)
>   * @sb_mountdata:      parent/root DFS mount options (template)
>   * @fullpath:          full path in UNC format
>   * @ref:               optional server's referral
> - *
> + * @devname:           return the built cifs device name if passed pointer not NULL
>   * creates mount options for submount based on template options sb_mountdata
>   * and replacing unc,ip,prefixpath options with ones we've got form ref_unc.
>   *
> --
> 2.31.1
>


-- 
Thanks,

Steve

