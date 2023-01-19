Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0D1673AAE
	for <lists+samba-technical@lfdr.de>; Thu, 19 Jan 2023 14:47:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=6jMrzHfUDMPhgoNY3yBd3hH0UTZZSH5iDS5mJLl0a84=; b=w0FjfTVV7rD8nEj199KHsKSxR4
	i6TQpKl+abIT/Pm7TkityD1hRXBGLnD/hAv0XjLSffFKL7HdYZimFWVdBafBNS2I7FwLR5r8fX5xr
	vnV+aFMfhp1B5WspZ/8AA4SNpuePKcjv5HjHpJzHk0ngyRuwOtlRZo4tXZM22J7ae2G7rZY5Lca53
	F7VM040PaqVrBK1/QZXYeSS4BSn1Nmgmc91dCKXygf++TgBk5MVXkPmYcbpveqMQ3XRs59YY8XezF
	qJP0EbYAa+uVJJXgMg8G4Y68umdD7f89/DO0i9N95P6D8PPWROdTKUFDFTImhS3cq5PPwwPwBUWk/
	mfscXyNg==;
Received: from ip6-localhost ([::1]:61172 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pIVFt-000rbH-RS; Thu, 19 Jan 2023 13:47:02 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:46944) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pIVFo-000rb7-0m
 for samba-technical@lists.samba.org; Thu, 19 Jan 2023 13:46:58 +0000
Received: by mail-lf1-x135.google.com with SMTP id bp15so3245386lfb.13
 for <samba-technical@lists.samba.org>; Thu, 19 Jan 2023 05:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6jMrzHfUDMPhgoNY3yBd3hH0UTZZSH5iDS5mJLl0a84=;
 b=nsIQEI4Jqq5DVCmCuuojkzlwUJrC1cc+FJ0GCunSHeHdGo/1280j0Is7H0xBkfZc3q
 zhjdQOjXAkh165V9gOyN0J+8kj2Noe415LnR8C5n+qIE2+Errcxl7GbosvrSPmI4gOFw
 Fz3XUs22zAGJl1AyHQTt6afEytrsDV8WLjDDSBnO3zvJ9MfgH28rmnz3uOl9zy1D1KJb
 hrkWt+oMxCXLyNodUMWftk9E3oG2r23/YZ9f2bvF+Lx968RIarluhHjMgYEc3LfcxGaA
 SPcB88xFwqlrTc+FTrAGnl52xHj6sgtlDpn+F31Au6yoCewX+3pjyYt7SwdIU34sBGG6
 q+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6jMrzHfUDMPhgoNY3yBd3hH0UTZZSH5iDS5mJLl0a84=;
 b=5i9AoduxY/YC8DV1vV0AGNexVu5kNtTA0aanRY14zmaBpXzlCtREas+/N4H//yjFlC
 EusbR2QjXsmUJKeLfzVsJ8oG9PFClZ1+SvRIjrY9hNxl0PfRDbaO4m0uJQ3+cc7cvJr1
 6I+OGOvDwPj+O2MRTlKjwtBlkVOpTxvMR7srAsylq5khHgK1nz9wtzwRw9Li9BWtOfPW
 0UC1exc5DMsyYbz1TXV8jI+EdBydluT6+KY9kXpn82vdPG/C1+SpHddiWxQwlu5bVff5
 UW42k4FpTHDN2YwJ4DdBJtg+V07hWGdDU2WpSZ5YHL7GgFdgCidCJGO5svPpPA2JAGM8
 bl/Q==
X-Gm-Message-State: AFqh2kpX0ct6HUbl5D8PBitvS0HReYA3/tb1OvJoTEaC5J6nySSOVrwI
 QLbqXf2QTYwXpj8ssRsA2CV43b1iKTnjgBUUWcU=
X-Google-Smtp-Source: AMrXdXs1eVnrtkkjaYXo4G/F36N2WVOQE8ZZ1Ky3bMn/HPt8/om3BFjfXu66wvpsvZpNLBr8BrCvPJvVJuw6RW/iNc4=
X-Received: by 2002:ac2:4c8a:0:b0:4cb:e53:d54a with SMTP id
 d10-20020ac24c8a000000b004cb0e53d54amr1091310lfl.156.1674136007018; Thu, 19
 Jan 2023 05:46:47 -0800 (PST)
MIME-Version: 1.0
References: <20230119111853.596560-1-arnd@kernel.org>
In-Reply-To: <20230119111853.596560-1-arnd@kernel.org>
Date: Thu, 19 Jan 2023 19:16:35 +0530
Message-ID: <CANT5p=r+FB87Mx+Je6Xeo1-q=Cu01Mx++jR-=UegFYRtEtpBmA@mail.gmail.com>
Subject: Re: [PATCH] cifs: fix debug format string in cifs_debug_data_proc_show
To: Arnd Bergmann <arnd@kernel.org>
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
From: Shyam Prasad N via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shyam Prasad N <nspmangalore@gmail.com>
Cc: Tom Talpey <tom@talpey.com>, Shyam Prasad N <sprasad@microsoft.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-cifs@vger.kernel.org,
 Enzo Matsumiya <ematsumiya@suse.de>, Paulo Alcantara <pc@cjr.nz>,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <sfrench@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Jan 19, 2023 at 4:55 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Printing a size_t as %lu causes a warning on some architectures:
>
> fs/cifs/cifs_debug.c: In function 'cifs_debug_data_proc_show':
> fs/cifs/cifs_debug.c:478:75: error: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Werror=format=]
>   478 |                                 seq_printf(m, "\t\tWeight (cur,total): (%lu,%lu)"
>
> Use the correct %zu format string instead.
>
> Fixes: 962a0fd04791 ("cifs: distribute channels across interfaces based on speed")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  fs/cifs/cifs_debug.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/cifs/cifs_debug.c b/fs/cifs/cifs_debug.c
> index f5f07019fc7e..2e644d926e62 100644
> --- a/fs/cifs/cifs_debug.c
> +++ b/fs/cifs/cifs_debug.c
> @@ -475,7 +475,7 @@ static int cifs_debug_data_proc_show(struct seq_file *m, void *v)
>                                 cifs_dump_iface(m, iface);
>
>                                 iface_weight = iface->speed / iface_min_speed;
> -                               seq_printf(m, "\t\tWeight (cur,total): (%lu,%lu)"
> +                               seq_printf(m, "\t\tWeight (cur,total): (%zu,%zu)"
>                                            "\n\t\tAllocated channels: %u\n",
>                                            iface->weight_fulfilled,
>                                            iface_weight,
> --
> 2.39.0
>

Hi Arnd,

Thanks for pointing this out.

-- 
Regards,
Shyam

