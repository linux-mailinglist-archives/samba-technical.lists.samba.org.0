Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BF91404A3
	for <lists+samba-technical@lfdr.de>; Fri, 17 Jan 2020 08:54:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=UMzj5rXvmC6rcg3TGp0r+bv48vd8zx3O/Jl+lBOM824=; b=eaBIc0Ws8fzY7inhjL3LDciBZe
	MKTOFq9jqXGhuXayMlIlbKnBr0QKKC/dO+lC46jxiEZS0+jFSo+h4BNddZPNLM6r3wrElCuNEIcBS
	p3ocwfRiTJnzJeDmY118+02B430gyoKA9kNYnx3C6gln33L+0AYYVK9Bhh2nRH4AuCpOte/mFc3mz
	Q+CHt97ynUJXXwmbuhPWtuxAHqCEWn2qHyrmydimApLi3TPUekpTazaZ9DzgTW7AI/dJi9OiNMBdX
	j+/1CKCiQyQHR7DKEX0qqEyuRl1KYgdIcKDh4PLvmFAx2JN9M777seb0ZQmqGP7sj2yFVd4GnX0na
	+3VJ4KQQ==;
Received: from localhost ([::1]:22606 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1isMRd-003jpJ-Q9; Fri, 17 Jan 2020 07:53:29 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:41601) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1isMRU-003jpB-U3
 for samba-technical@lists.samba.org; Fri, 17 Jan 2020 07:53:25 +0000
Received: by mail-io1-xd43.google.com with SMTP id m25so9388760ioo.8
 for <samba-technical@lists.samba.org>; Thu, 16 Jan 2020 23:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UMzj5rXvmC6rcg3TGp0r+bv48vd8zx3O/Jl+lBOM824=;
 b=K0g5FOnwioEbhVTO/BB7URoUfu9qb/FKRVhJNukEXzEcdEzffhUQKolWV8ixV8a7Ql
 xFLdWsxq8Av2nupseHiPC88OUDhbCcfiDYe5i84XCPS3BpSB7KBC8g25Hcjd/mmia4ay
 COb+x/3lurZ7DkxeqOCcly2NPnxkEQdtaKlqJXHCfNIx3hlqRoN7VN2fr85ES+Ef1UrX
 SaUZUssibEMJ/laFLSq7TjRa5WirOPf48kY2FEghBSgNl8LmmYoOP1304+W5RQnL8Efj
 RvJY3Im8zc+K5phoKOAm/24EjL1DVBv1MFGCc2HCPGcNQq5nXsYlD7LRF4wOoAUk4xrq
 jGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UMzj5rXvmC6rcg3TGp0r+bv48vd8zx3O/Jl+lBOM824=;
 b=cJRxia1dxuvkQWovuKQFQFKcARk1n71dRft0DONxZEYAmqyX1f8I2Tw4rDtLQGrVSZ
 c2jyrvA41c8/NDSu88y/wXkf0f/lMZtyIEQCvU93V9meJbfLOdWiY2DRZGvNOfSoGS5O
 ve4RZSeWj00Qw9p3f25w4+I0RIoXd4Sj13febtpLC5WCr3UZVBqle4mGUQBZU+f4oI9I
 cJxQxCKHLmkWzBo54dISsJ/jFbab/Oh8dXJ8MRU7tUUsjkY0G+YU7oj00FYZHc7fNe9g
 7m82TU9m1o7L0NaskUG8z/Q6Xsgifive/nrrYFddjMfQCo35gUtpEpNFQ/RLcpJ2cXNj
 mKpg==
X-Gm-Message-State: APjAAAVoDmhaGRgi2geOdKsS7QNbrtHj7gJRVTHSTcGQtjxDt8NuYi4r
 072Cg9lO9cqY4IEh6PkzpFtEbbzyJkTmKKyYhnw=
X-Google-Smtp-Source: APXvYqxN68umXck1USsTe5u758BVy+E8O+lfkcQxQNEs+860tNQagotavXediT7gRuQQRBW9n2gyJQvwSeK0rhiaKns=
X-Received: by 2002:a02:cd12:: with SMTP id g18mr32281878jaq.76.1579247598887; 
 Thu, 16 Jan 2020 23:53:18 -0800 (PST)
MIME-Version: 1.0
References: <20200117022156.57844-1-yuehaibing@huawei.com>
In-Reply-To: <20200117022156.57844-1-yuehaibing@huawei.com>
Date: Fri, 17 Jan 2020 01:53:07 -0600
Message-ID: <CAH2r5muybvVnEF=HzT1-xi=X2209PtE5F4zKr2OnMvaMcdLJHQ@mail.gmail.com>
Subject: Re: [PATCH] cifs: Fix return value in __update_cache_entry
To: YueHaibing <yuehaibing@huawei.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>, Paulo Alcantara <pc@cjr.nz>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Thu, Jan 16, 2020 at 9:58 PM YueHaibing <yuehaibing@huawei.com> wrote:
>
> copy_ref_data() may return error, it should be
> returned to upstream caller.
>
> Fixes: 03535b72873b ("cifs: Avoid doing network I/O while holding cache lock")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  fs/cifs/dfs_cache.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/cifs/dfs_cache.c b/fs/cifs/dfs_cache.c
> index 5617efe..03cfaa1 100644
> --- a/fs/cifs/dfs_cache.c
> +++ b/fs/cifs/dfs_cache.c
> @@ -593,7 +593,7 @@ static int __update_cache_entry(const char *path,
>
>         kfree(th);
>
> -       return 0;
> +       return rc;
>  }
>
>  static int get_dfs_referral(const unsigned int xid, struct cifs_ses *ses,
> --
> 2.7.4
>
>


-- 
Thanks,

Steve

