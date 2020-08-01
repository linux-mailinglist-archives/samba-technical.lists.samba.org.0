Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F90E2352D7
	for <lists+samba-technical@lfdr.de>; Sat,  1 Aug 2020 16:51:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=UVNdjfkuEymtlCMjYVhcJ1dm1EhRpHn4gFio0XQo7YU=; b=NlC6jEaXZWI8pZjm90GwUbsGy0
	HL/zCZAFYoGvRu7z37weM5CsGlLaFpeU5xyzCnfiPgSEtt7GMsxj7Ejf92korE2HsPc53dCcLay+v
	mDdbdUKmMqpi4j2yq+xvQgGPU7n5/aT08FvsTY4Z+mv67FqTPyBRR1VpOP5lOTw8QN2+HyLUYW4dC
	UZTfPD9ZMj9q14kQ87Go4UGKrJWsSQynqj558ewsObQk0dOTv/HNHsHDtD7q0LG/i7IBqKIElhjlY
	3TZimKQrumQh+I4rI3oziNYLDGRxddd7SmsM9TqWPNECi+NV57YST+UoJL1Mjv5A+pmj8IZjsNiNq
	tcKZtCXA==;
Received: from localhost ([::1]:33514 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k1spp-00CEhM-60; Sat, 01 Aug 2020 14:50:05 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:35317) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k1spi-00CEhF-6p
 for samba-technical@lists.samba.org; Sat, 01 Aug 2020 14:50:01 +0000
Received: by mail-io1-xd43.google.com with SMTP id s189so27229904iod.2
 for <samba-technical@lists.samba.org>; Sat, 01 Aug 2020 07:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UVNdjfkuEymtlCMjYVhcJ1dm1EhRpHn4gFio0XQo7YU=;
 b=kEI+g4g0e4gyRGxDXB6HuB4aGlGy4Lm3cI4tsQCYmzgt4A3SiVkWv6KTOGppNfi6Zh
 u5aOg5BDskxdER9ke/NyCE4oP3jqdOYU5Gr9KcgYG/+xIy0JN4FAbOggeOYXSZRi2dru
 7RDosvnh8Erp/OC0akp3krFR8J97rsJL65i8jTueW5i8MipD/KYOW300Wb2bL6dvtAvE
 AaTzBJu+gSI0SXChEoYIxjGiNrbZqp7EBql4Th9kIslh7Vd950kVD0OLqhewLixPKIkv
 5lUzvGyk3nOYpBmjCstlHi+kYT5TRQghw9RXAo7xWORz2egPO1kzKNibz7VWvsyd0NGH
 8THg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UVNdjfkuEymtlCMjYVhcJ1dm1EhRpHn4gFio0XQo7YU=;
 b=o/ENLbxlUH3TNXr0tPpgdaIJY/0l55qu17hecdAgoO+ZFZVOKhxMJMRUwzls/SBPH+
 YA7PjFZ1kRk0S5zZyHC+Fa+C+B+JX2EqZx4b/ziaiH/Icb5ifgw+56i+a/5JTYkEA4+l
 VnwyyfDH7Vej83back4PXdorpKekWPMgO3ekokLUvYKjoBRFOeXiyhX8KSAdl9AXQOW5
 RUD/KImO7IO11oYRHbFe5pXTYrYm+gpA0EGtEuBtPRW9o/HLXVdW7G5hFlc3VV/KnQ93
 0frz/XDnExJ/0UYCiebCYE8SmGh57PYPooIJVIRifczpE84UYcXQjJE2jeh2HGEW3Y34
 6IFA==
X-Gm-Message-State: AOAM532T1wu3d/pAkZQNHs1VTBWwLvDPrCe3FEe/HqNbSXDK9pG638Tc
 shcrU1Q+DXQaHn8pHscet8sZ6BHWmNQNOqoOoWI=
X-Google-Smtp-Source: ABdhPJx/jOwTXIJbiM7v1rANDakrJ2QmDFARmK57MOV3E6LasX1X6K+1lQca48VHVG+yOiEIFE8ph0FlqouO8Eq1wEc=
X-Received: by 2002:a5e:a607:: with SMTP id q7mr8479532ioi.16.1596293394048;
 Sat, 01 Aug 2020 07:49:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200731171342.36636-1-colin.king@canonical.com>
In-Reply-To: <20200731171342.36636-1-colin.king@canonical.com>
Date: Sat, 1 Aug 2020 09:49:43 -0500
Message-ID: <CAH2r5mv8pWOcQfKknec=JksKVLvLTu2NbowAKwSguAb5-eojSw@mail.gmail.com>
Subject: Re: [PATCH][next] cifs: fix double free error on share and prefix
To: Colin King <colin.king@canonical.com>
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
 samba-technical <samba-technical@lists.samba.org>, Paulo Alcantara <pc@cjr.nz>,
 kernel-janitors <kernel-janitors@vger.kernel.org>,
 Aurelien Aptel <aaptel@suse.com>, LKML <linux-kernel@vger.kernel.org>,
 Steve French <sfrench@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Fri, Jul 31, 2020 at 12:15 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently if the call dfs_cache_get_tgt_share fails we cannot
> fully guarantee that share and prefix are set to NULL and the
> next iteration of the loop can end up potentially double freeing
> these pointers. Since the semantics of dfs_cache_get_tgt_share
> are ambiguous for failure cases with the setting of share and
> prefix (currently now and the possibly the future), it seems
> prudent to set the pointers to NULL when the objects are
> free'd to avoid any double frees.
>
> Addresses-Coverity: ("Double free")
> Fixes: 96296c946a2a ("cifs: handle RESP_GET_DFS_REFERRAL.PathConsumed in reconnect")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/cifs/connect.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
> index 3c4dd4e1b9eb..4b2f5f5b3a8e 100644
> --- a/fs/cifs/connect.c
> +++ b/fs/cifs/connect.c
> @@ -5574,6 +5574,8 @@ int cifs_tree_connect(const unsigned int xid, struct cifs_tcon *tcon, const stru
>
>                 kfree(share);
>                 kfree(prefix);
> +               share = NULL;
> +               prefix = NULL;
>
>                 rc = dfs_cache_get_tgt_share(tcon->dfs_path + 1, it, &share, &prefix);
>                 if (rc) {
> --
> 2.27.0
>


-- 
Thanks,

Steve

