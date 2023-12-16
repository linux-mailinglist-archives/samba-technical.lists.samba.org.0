Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F4F815807
	for <lists+samba-technical@lfdr.de>; Sat, 16 Dec 2023 07:25:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Mvcews0bkmGQtLzZZHQH60WBefpCX2Y0ajeJT2rs0tM=; b=dUxRmTYOsUCWBJHGSaUJDsOmZQ
	ma6SXdJo2CPh7qC8MVBxN8yg2uDfZUj0YLjlsbEqRcWo1dEWZJw/rUEFKTHVn29qtfJvlnTTizsQU
	2pCruTRq+soXURmt8dsH5NU+xmZa1d2b+w++pKbpJ7mc0a6GwqZhARoUyF7FgGywOfj4yVSNtriLB
	Q53v8ZRaAMKhQuwIr1qf/Oxu+3EyhTj9gO6A3iCX/Um3VXm+xIVpHEhjH4MxcW0iWldHO3CJH8kSH
	luqHH4ISuQASSTzGJ728Dsun+juiigExInl704L7YXnOG0fNBxEaIzlj0L+TfvnhKWHOX/qsFJkCS
	g2SnGoJA==;
Received: from ip6-localhost ([::1]:37006 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rEO6M-007do3-CF; Sat, 16 Dec 2023 06:24:42 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:58433) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1rEO6G-007dnu-S9
 for samba-technical@lists.samba.org; Sat, 16 Dec 2023 06:24:40 +0000
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50bce78f145so1644887e87.0
 for <samba-technical@lists.samba.org>; Fri, 15 Dec 2023 22:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702707875; x=1703312675; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mvcews0bkmGQtLzZZHQH60WBefpCX2Y0ajeJT2rs0tM=;
 b=SlS74Ye0V45Sl2XaCXplOEoQcU0ghvo/o96BZIy+poudv4W+BcS6ZYSkhFbKJlJaNA
 5UjP9brxogzgxd7fTZ5RgIBdFfJ/X0LinwTl5YsGOnXyIdA0B2EGCkTlYV5douslQv2T
 oLBlnuYW/n+/P7CsjivMgKA6KC4Tse5kakuUU1G80u2xuTKtrgI9la6ng0bFJh8fe3od
 /+qSeIiKebtohREkRBirjMO1A4Cd/OcZ7V4sbxFAPvlGaDLL3eMOr+4UzVakRnjlK62r
 iuBe4sQSIVLAT3TEqNf4WUCfnjamxTsZCwmb7AMKdg5UZziuDkRkjdHXm8UieeU/9k82
 FPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702707875; x=1703312675;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mvcews0bkmGQtLzZZHQH60WBefpCX2Y0ajeJT2rs0tM=;
 b=qZe7+VGdiDvWmZZ4emoeMOsOR7pi2jhbWCXTtB80NTdcjyXMkyD2KyZHeI9zO7At6d
 LoM2lwWnmYLxkIac/cn1Rn93A1cjg3GNngvhg5h0+1F3Ff7BwzHgxEWDNpnxiEW5axqY
 2ObfTg6FDccvHtXsRf1Fo1zcJ05OptuMAWc4K8DJPvCWUm2x7NfERiC4iOpH6d0cMSVm
 1jNkbGgU2vDmvomJLfCsLQtmEFNix+nixNxdNafKghOf6OzTBqOkyL3fDGaOzvZTJwfZ
 kV9oZqp++/8yPCtvW9FrM0qJwwzFOpAhJBOVDWh+7yefJQggVp19/Wliak38VCOxRQDJ
 Afvw==
X-Gm-Message-State: AOJu0YyqAe+Ct8yXAneNi/5qIwy30sunDNhbGtP3SM463EOWxrcWn36V
 C/v3IM31EFDvowGU7FG8XrB8rGp1NRT35olfMQM=
X-Google-Smtp-Source: AGHT+IEU+xkKFg0E+T6i/v3ERxAOMcBYihZu1g9d3EVY1uSowY/sGag61JVIbppmfj3YPgO72hLie5JjxdRU/vKqU2M=
X-Received: by 2002:a05:6512:2829:b0:50b:f08f:8e8d with SMTP id
 cf41-20020a056512282900b0050bf08f8e8dmr3119231lfb.184.1702707874640; Fri, 15
 Dec 2023 22:24:34 -0800 (PST)
MIME-Version: 1.0
References: <20231213022353.2983979-1-wozizhi@huawei.com>
In-Reply-To: <20231213022353.2983979-1-wozizhi@huawei.com>
Date: Sat, 16 Dec 2023 00:24:23 -0600
Message-ID: <CAH2r5mvzuiYAT56SCx21A2dv-2+MfsaSRpX1fWWnMUnn9RtROg@mail.gmail.com>
Subject: Re: [PATCH -next] fs: cifs: Fix atime update check
To: Zizhi Wo <wozizhi@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-cifs@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 Jeff Layton <jlayton@kernel.org>, yangerkun@huawei.com,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 lsahlber@redhat.com, stfrench@microsoft.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

added to cifs-2.6.git for-next (and added Cc: stable) pending additional te=
sting

Adding @Christian Brauner  and @Jeff Layton  since this overlaps a
recent change of theirs.


On Tue, Dec 12, 2023 at 8:25=E2=80=AFPM Zizhi Wo <wozizhi@huawei.com> wrote=
:
>
> Commit 9b9c5bea0b96 ("cifs: do not return atime less than mtime") indicat=
es
> that in cifs, if atime is less than mtime, some apps will break.
> Therefore, it introduce a function to compare this two variables in two
> places where atime is updated. If atime is less than mtime, update it to
> mtime.
>
> However, the patch was handled incorrectly, resulting in atime and mtime
> being exactly equal. A previous commit 69738cfdfa70 ("fs: cifs: Fix atime
> update check vs mtime") fixed one place and forgot to fix another. Fix it=
.
>
> Fixes: 9b9c5bea0b96 ("cifs: do not return atime less than mtime")
> Signed-off-by: Zizhi Wo <wozizhi@huawei.com>
> ---
>  fs/smb/client/file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
> index cf17e3dd703e..32a8525415d9 100644
> --- a/fs/smb/client/file.c
> +++ b/fs/smb/client/file.c
> @@ -4671,7 +4671,7 @@ static int cifs_readpage_worker(struct file *file, =
struct page *page,
>         /* we do not want atime to be less than mtime, it broke some apps=
 */
>         atime =3D inode_set_atime_to_ts(inode, current_time(inode));
>         mtime =3D inode_get_mtime(inode);
> -       if (timespec64_compare(&atime, &mtime))
> +       if (timespec64_compare(&atime, &mtime) < 0)
>                 inode_set_atime_to_ts(inode, inode_get_mtime(inode));
>
>         if (PAGE_SIZE > rc)
> --
> 2.39.2
>
>


--
Thanks,

Steve

