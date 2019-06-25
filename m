Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DA88E5238F
	for <lists+samba-technical@lfdr.de>; Tue, 25 Jun 2019 08:31:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Yp1pZjIgM8j6nAWCJwr1RviA9TCpOdWc0/KD/+kueE8=; b=GoowmS65MMIT8ecritbFiRnXXI
	2xihc1mG8MyVu8oTKj+fb0xjf2+BQ4jZRQ5qVLoTeMmbz9KZ+rh5hWoQp6tlJ4M2RuyHL6tN2G+hb
	Ifx/3fZ1p/ggVhx38sG1Acs26OhLfH+O3rNKJiLH2RhxcB0WaFluPluyG2As4BcspbPNJOx/1DkEn
	gkemps7gNXw6Jpr6/N5ANUj+1AEDIXFG+sNN+48OD2K5zTG9LBpaRAsNGUqX+TuDeh/KxJ0wHOAC2
	GJtp1ayo4fQgLL3leLA0cCRCBZUUH+oXuA0BhK38YNKlz4Pnu4iYUi9FvD2f6TtDVPZxdxyLwdkLj
	d3pFGTjQ==;
Received: from localhost ([::1]:41138 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hfeyE-001YxF-Sp; Tue, 25 Jun 2019 06:30:23 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:41123) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hfexr-001Yvv-Mg
 for samba-technical@lists.samba.org; Tue, 25 Jun 2019 06:30:03 +0000
Received: by mail-pf1-x441.google.com with SMTP id m30so8908194pff.8
 for <samba-technical@lists.samba.org>; Mon, 24 Jun 2019 23:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yp1pZjIgM8j6nAWCJwr1RviA9TCpOdWc0/KD/+kueE8=;
 b=nkFsChlNZt6IeXoodY2TGON55dXdvG9cyS5sonM/QFDihbw7N5eQ5pnSitRqcsn5XZ
 zaNCV4RsHRiOCAHGMrj3lzKN4NPV2/3Q/MJBBlioBzksDgO9oSMQAdfgrOAgzxrdhrz8
 igy3BH/2aytuFOizukyI1An0Xk1yxzXvef8Ilt7eiecBkcOFozeqAxwHKQI7FisPAHqr
 x+SiDz5eixHJjZcVFVwIpP20LgJn6BqHsMZHS2sZrcTsowVQztyCTHCN7rSP3qppfNyY
 Nrw8yFahwBmuE2ajQ1OOHMTyBBIyzzbjTr29CDsjjUKIxMfIL2K+9hP9ZEWM+1nXubGP
 G+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yp1pZjIgM8j6nAWCJwr1RviA9TCpOdWc0/KD/+kueE8=;
 b=ikshWfDjGpEKg4N8iXo5u3mpiol2UR9LO3F0u0jfzKLNTDibHJc+sAGWwzQKwcez6n
 mGrtVzFlF82yjqvTIouh92sWC7gY3BT+1GONthxOGIXPezPdGg3oPuLmxk7zZRsrNLAC
 whP1yKTyF9p+iGHRH5hUVV8ogDSRrxLY3C52ZQONNL07y61KiPLrhh/hr2cjVSyAFF6j
 4RVg2n0WBj3veta1A4a6eALhvn5Gqu50usgySww3ThODFqAX7QoNclSfLAx60bKW8oaN
 KbO10pS2x82RjEHIet+JSAGzTYNy8hXwK7cMENbKG2knzkS0SMXkAY33gQWN0RXM1A19
 2pag==
X-Gm-Message-State: APjAAAXvpZVBNkhQwwK0u6fvmsyKkdy/rpGmKKEnZ7zrT1V6A5tnZu06
 iL2QApknB2UDLUmkyyKHstdnne6uknyEzOTnrqE=
X-Google-Smtp-Source: APXvYqzVcTKNjQWoRWqpshVelGz2/WVEbatr5RX3V5UecbE4d8qgv3csXOm9FYwbfR9FWhIFR3pRVjmDt9hAX76HG0E=
X-Received: by 2002:a63:8b4c:: with SMTP id j73mr26925363pge.11.1561444196820; 
 Mon, 24 Jun 2019 23:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190624163943.6721-1-colin.king@canonical.com>
In-Reply-To: <20190624163943.6721-1-colin.king@canonical.com>
Date: Tue, 25 Jun 2019 01:29:45 -0500
Message-ID: <CAH2r5mvSOS3khpwQ5bZ4OrTcuMXmxB_oaUuVLqaivD1w5g9n9Q@mail.gmail.com>
Subject: Re: [PATCH] cifs: fix typo in debug message with struct field ia_valid
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
Cc: Steve French <sfrench@samba.org>, CIFS <linux-cifs@vger.kernel.org>,
 kernel-janitors <kernel-janitors@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Mon, Jun 24, 2019 at 3:25 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Field ia_valid is being debugged with the field name iavalid, fix this.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/cifs/inode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/cifs/inode.c b/fs/cifs/inode.c
> index d7cc62252634..06a4892e9973 100644
> --- a/fs/cifs/inode.c
> +++ b/fs/cifs/inode.c
> @@ -2415,7 +2415,7 @@ cifs_setattr_nounix(struct dentry *direntry, struct iattr *attrs)
>
>         xid = get_xid();
>
> -       cifs_dbg(FYI, "setattr on file %pd attrs->iavalid 0x%x\n",
> +       cifs_dbg(FYI, "setattr on file %pd attrs->ia_valid 0x%x\n",
>                  direntry, attrs->ia_valid);
>
>         if (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_NO_PERM)
> --
> 2.20.1
>


-- 
Thanks,

Steve

