Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6101C7444
	for <lists+samba-technical@lfdr.de>; Wed,  6 May 2020 17:24:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=HN9ojInOFKYThRzc8Ql4PZMRAE8OzPwg0Rj7oohGgGQ=; b=oy5KDT58ue+5Hqm+8GtGuttJNR
	Ygqtd1Ch+0UXDTCto4DbWrtNqwnUuPqOZDju6XWsBQbS8NRePf8iKFU9+s4d14Fw8c2QIzmomzHfD
	v0zJquDf+cGJe9y018OPoehKqelI9Zradr0Rw9zvjkv/vjfCyNN7+z2D4lh77XVPMvxLnPVH6p4dE
	GO1Cqc6vO8YpWHGhuWfCtjeu9Ho+sJUxUQoDj9VLoXkav9AaN2yfDyrMy2ftHpjBO+GCdeTIZGP0x
	99VxD3p96QPGUhHbffEa8siJfOAZ/xX99xr4Qf6iZtCTSxiifLLmcystpUJRrgQlQN473he5jc4Cw
	9tj1Rg0Q==;
Received: from localhost ([::1]:45582 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jWLtp-0032FA-Hn; Wed, 06 May 2020 15:23:53 +0000
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:35915) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWLti-0032F3-Pk
 for samba-technical@lists.samba.org; Wed, 06 May 2020 15:23:49 +0000
Received: by mail-yb1-xb43.google.com with SMTP id a8so1188200ybs.3
 for <samba-technical@lists.samba.org>; Wed, 06 May 2020 08:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HN9ojInOFKYThRzc8Ql4PZMRAE8OzPwg0Rj7oohGgGQ=;
 b=kod1vXQydzMu58nt7WS5nepff0qeObRx4XHGsshew2+imFpLAyaJDSSgKd5uPcGhdC
 4MGDv8sa3k7u82yjl+9XFcPt2kEpOaqykd6kiPBXAeHOOoGiZ+cWcn9ptyem/B0i/Z+F
 QIYNrQFYk+HGtZ5wBDLqpS8ZkqQXfFTu5LgkJEtbJQJ36NK0HejTJLqty9zSxcbQai5Q
 3in5w6CDIvWK4cqZBK6jLiaJB5LGDwznGy7Y6I1gqs8TG6NcSUeuIxp4uVCB42DUhssW
 ZJawDFzeIQhEPi8dfSLCdZd4r+y+sCcdFcFYBhKpnqJLbOgfxiqHvNhjkuB6XZ04T6RN
 fKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HN9ojInOFKYThRzc8Ql4PZMRAE8OzPwg0Rj7oohGgGQ=;
 b=saTNA1zZqQPhzBSqUXL5HdhARRBfX0HOFYx3xbSVQt+9dOfEGTGawlggD7Kxz2Btk7
 8Y4cx5mWwcPspYhCvZE6UDsMqDWyGqNzSFa+N/fPfeL5p9a/tOPBQJ1utDT0UFKX8Mjg
 I13dLK7WtFB+ulDgrDgNHjyOLgFOJ7oCFnDtkMUQoHN+Bqn+O+MEbaCx4Yyo4x6W31F9
 sL13uDHkuVUEYhUBKgkbYiYVVsGnVAw/FcKlnVrUSr7PoEeudIvMdaxhbAzAla4PsSYl
 bD3ZvShTd0Ioli1SByyuIYAZQhUObYqv7QXiTdapdR5VmOAuUyFl04D32ym8UzfbQLkG
 jNSg==
X-Gm-Message-State: AGi0PuYai2ZpPLANc4Dtsm88eJWkBbrKqI2Uh5Oaw6eevuJu/QV259Yq
 H1g7hmgsvL3MwUyrVM1XWQ1uK0NNIpycX+FOrSM=
X-Google-Smtp-Source: APiQypIqRLHpjtToZNBKKvR/o1+aXAENDQ953WCIfNCcT9Ks9wfQ9MZn60jC/Fvhcd19XSLXbKMWBALmuU8M76B1tgE=
X-Received: by 2002:a25:abcc:: with SMTP id v70mr4224871ybi.364.1588778624121; 
 Wed, 06 May 2020 08:23:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200505134335.26802-1-geert+renesas@glider.be>
In-Reply-To: <20200505134335.26802-1-geert+renesas@glider.be>
Date: Wed, 6 May 2020 10:23:33 -0500
Message-ID: <CAH2r5mvndbMwhcLRDG5JGG-2GnHwfQYz2kh6avBzQWnAebY_Cw@mail.gmail.com>
Subject: Re: [PATCH trivial] CIFS: Spelling s/EACCESS/EACCES/
To: Geert Uytterhoeven <geert+renesas@glider.be>
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
Cc: CIFS <linux-cifs@vger.kernel.org>, Jiri Kosina <trivial@kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Aurelien Aptel <aaptel@suse.com>, LKML <linux-kernel@vger.kernel.org>,
 Steve French <sfrench@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Tue, May 5, 2020 at 8:49 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> As per POSIX, the correct spelling is EACCES:
>
> include/uapi/asm-generic/errno-base.h:#define EACCES 13 /* Permission denied */
>
> Fixes: b8f7442bc46e48fb ("CIFS: refactor cifs_get_inode_info()")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  fs/cifs/inode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/cifs/inode.c b/fs/cifs/inode.c
> index 390d2b15ef6ef9d7..5d2965a2373054a4 100644
> --- a/fs/cifs/inode.c
> +++ b/fs/cifs/inode.c
> @@ -730,7 +730,7 @@ static __u64 simple_hashstr(const char *str)
>   * cifs_backup_query_path_info - SMB1 fallback code to get ino
>   *
>   * Fallback code to get file metadata when we don't have access to
> - * @full_path (EACCESS) and have backup creds.
> + * @full_path (EACCES) and have backup creds.
>   *
>   * @data will be set to search info result buffer
>   * @resp_buf will be set to cifs resp buf and needs to be freed with
> --
> 2.17.1
>


-- 
Thanks,

Steve

