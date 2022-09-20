Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C775BDB24
	for <lists+samba-technical@lfdr.de>; Tue, 20 Sep 2022 06:04:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=9p3vxJkL8RheHt7HmOzh/lIGQhD2BoRvtqGyfowdj8E=; b=RWMgVqLqPshfr+DtxSdeClGrnz
	0NwUY9W1RoWulQEgfl9TcWUu3MqeS0ZxL8INqWCXN8fwcsTjFKlJTvLt7l00v/QO0zAQq1gl9P1Fh
	NJPk+UeZluY3n/Load9AhrbOb8WADdglrzpi94reLPHUU0ArZaarhNzMzD8cI6/uYa2XeXsUKz/jD
	Tpe7W33sTKI8wWlPkUQRSSvfrqVkmpuVD5CwvvxGjlHc08bxIq3qoE7xRyRVaaplydykLKO3KHQup
	bJbTihAQNnOL8Ih056G9eJdoUcErpQlPMzsvztOABuEyLnid169vJQeSzsV+GH4LJn0eqtsZ8Ira5
	uPZCizfw==;
Received: from ip6-localhost ([::1]:54492 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oaUU8-0028H9-AH; Tue, 20 Sep 2022 04:03:48 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32]:41931) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oaUU2-0028H0-CM
 for samba-technical@lists.samba.org; Tue, 20 Sep 2022 04:03:44 +0000
Received: by mail-vs1-xe32.google.com with SMTP id k2so1739056vsk.8
 for <samba-technical@lists.samba.org>; Mon, 19 Sep 2022 21:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=9p3vxJkL8RheHt7HmOzh/lIGQhD2BoRvtqGyfowdj8E=;
 b=THBlQ+1cFNQAVS1QfnzfbeC2nXo47pElTnE0D+OpEfYecuzQsa1JD8aMC02cDcJPal
 YNC+V/Q+dEqxxDCSxim1w7qf3KXlWjdZu/0b5QL/eT6Iicqyh8u86C9sBKvb1Tkdn/yp
 m38VomC6rgkA4zcP3InZJPBER0FtmDPdZ87viOdDq5403fo5m6cHhVvQUwlmSTrwixRr
 2YtxKp5MDkYtxmR384m/U1ZnkduuqYAqUGMWCYSdg3Hj6h8JnORyvTSfqKur1spRnfyY
 9iY2KHFFh2uS+A6v1IGWkTUSagUVGx16nD9hpykvsKhoNAlFZZKUuWVzL1xfXM50+wAH
 lwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=9p3vxJkL8RheHt7HmOzh/lIGQhD2BoRvtqGyfowdj8E=;
 b=1KB5OoGvjvb4JJYimJ53DZRfumTyhgZD/jCZrrGqSQCWDu3JVkxlePRj+mTrPoJ40F
 R1MXdobE0r3BjaZQqhrHmpFIfF5t7C8K0kXpHHhrJ2mTI4qK/G8F4G4WT5EAZRc2YA9w
 zCheuHse/zeomv69mSSnAel0baBlztV3H3dlrCuhUqHkvWTsV1zoyilwvYiFU8+XyQ+k
 djSv7KtKukJ31mWiEG0QnUYizuQfKv0J2qZh8/cJ2mN8RV4cfasCVAKFp5T5OrT/nYZx
 Q+fdSV76XENX2IieT8tXsthHC0BeSVq3fxt9jcDFh4OXG+5FEnZETmrzyieEH2f2lH56
 DNeg==
X-Gm-Message-State: ACrzQf2fL/76Vc+iDuR/fWjIgLsg09h4SmefvCC9C7d0ZwyQ5UrtpOz9
 RU2Ala5x/muw+0Q6iMnmWsPGprjgXBeinP24D2w=
X-Google-Smtp-Source: AMsMyM5OLjPVlyDmbcFZXVFLFn/qjtrCjidXLl8EJBGPLWirDOanB0DlnvAT425b9eSqVvk8+m0m9YfzYW5ttWyWsU0=
X-Received: by 2002:a67:1d87:0:b0:398:6d94:dbf4 with SMTP id
 d129-20020a671d87000000b003986d94dbf4mr7045221vsd.6.1663646619247; Mon, 19
 Sep 2022 21:03:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220906032435.932451-1-13667453960@163.com>
In-Reply-To: <20220906032435.932451-1-13667453960@163.com>
Date: Mon, 19 Sep 2022 23:03:28 -0500
Message-ID: <CAH2r5muzL_wNVKxzoeQ17rMmbG8Loz8H_REWWysOV2qy2JzyzQ@mail.gmail.com>
Subject: Re: [PATCH] cifs: misc: fix spelling typo in comment
To: Jiangshan Yi <13667453960@163.com>
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
Cc: linux-cifs@vger.kernel.org, sprasad@microsoft.com, pc@cjr.nz,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 lsahlber@redhat.com, sfrench@samba.org, k2ci <kernel-bot@kylinos.cn>,
 Jiangshan Yi <yijiangshan@kylinos.cn>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Mon, Sep 5, 2022 at 10:29 PM Jiangshan Yi <13667453960@163.com> wrote:
>
> From: Jiangshan Yi <yijiangshan@kylinos.cn>
>
> Fix spelling typo in comment.
>
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
> ---
>  fs/cifs/misc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/cifs/misc.c b/fs/cifs/misc.c
> index 87f60f736731..c6679398fff9 100644
> --- a/fs/cifs/misc.c
> +++ b/fs/cifs/misc.c
> @@ -824,7 +824,7 @@ cifs_close_deferred_file_under_dentry(struct cifs_tcon *tcon, const char *path)
>         free_dentry_path(page);
>  }
>
> -/* parses DFS refferal V3 structure
> +/* parses DFS referral V3 structure
>   * caller is responsible for freeing target_nodes
>   * returns:
>   * - on success - 0
> --
> 2.25.1
>
>
> No virus found
>                 Checked by Hillstone Network AntiVirus
>


-- 
Thanks,

Steve

