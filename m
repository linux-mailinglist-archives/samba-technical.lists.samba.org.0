Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CBDDD965
	for <lists+samba-technical@lfdr.de>; Sat, 19 Oct 2019 17:34:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=NIb3d/6toqZlUMcL7Zc8QdhiLzW9kKqfuVQu7v/JRyg=; b=LryxKon4gtl18iluiDBysQ3e7M
	sCnvIeD+7NTFI57XB0ocQ29F+Sn/DmWMR06zT/5lFeYonJPJZr9wzdJtewx/4i1YTuhBt8vmdM8eQ
	veRlRJmUoHuVP9KUnQ4Bid6cQWBqAMcHNYKJXfV7mmES2j4ZE5osCOCWplQddG1EljHVQTKpyTx1T
	M3xO2VkYarbMPw8Skaql2w6cO3az9pyLm2AlcXmhtJR+DfGEuXzW8ml/s5mc/WM1Aha9v+65QfH/R
	g79Sroj3uPlzy6K7oMMuYb9PnxriC+G6NSDDhRkqPeGpjgvxQq90ZrLkK97uKgnXk6nCsUw/dBr8i
	hi+2gRew==;
Received: from localhost ([::1]:36532 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iLqj8-000cqZ-7J; Sat, 19 Oct 2019 15:33:10 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:34952) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iLqj3-000cqS-TX
 for samba-technical@lists.samba.org; Sat, 19 Oct 2019 15:33:08 +0000
Received: by mail-io1-xd44.google.com with SMTP id t18so6860915iog.2
 for <samba-technical@lists.samba.org>; Sat, 19 Oct 2019 08:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NIb3d/6toqZlUMcL7Zc8QdhiLzW9kKqfuVQu7v/JRyg=;
 b=L3Vj1kOjh/KZ+NM2bYzvMPYecYR0A9+wlEwnyTyQjAO1K0vGrt5253pKMcYXllwx2T
 YLAmBckEL++tOo2MqutwWpos6jo9jc7JYXy2krBnaV5gcqdsk22et2V+vs/zISZUbxxW
 PPzetePYJBdaEKkDwcjswxRllw0jirERNrZoEf4w++galojWuKOb/yd7kHcduDZMJZgw
 Nd92jBZ83FQVGSIZIRUn4we1RIm2gEXt29bv2w5+DVfWbJPK4mCqx37KpI/lkjQ4pY5f
 W+1B3DcJpADEasmOaU8YKLNjC18+Ynu9qlH8GH3Qw4/2hVBjwa+nQ57WFvDSP6/zsOoR
 JNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NIb3d/6toqZlUMcL7Zc8QdhiLzW9kKqfuVQu7v/JRyg=;
 b=nEI6dcsAxC/xf5ohr9BISs7eFyMqeBjX9KKOwFdP7bFebhoQ2FxczHwCBu2zRhOS+D
 PW69+xdcJ9QnHWvUZg551UD3OOAAuhuprP0BVBdfpR8gauEAGMonFNO95JgB2uhuABCk
 4GnJ/VgoeNbhKJKaaUfLIv7LqcJfRfn9xsqfAfkRJmvxlo1HWot13XqAikX/W2umihzV
 gvsjVSVU4PQeZW/LaRNJQZmqLCQLyYAP0z8HT9lUMXjXu1GoU9ZzClQSTF7/rmTAvhjA
 aMSFBvyyPcd6IVn+nWJjqd90HLQFS8Q8xuP6O+0iX7lY//6VmDEU8LrGxVpeyPKqFexT
 JfrQ==
X-Gm-Message-State: APjAAAWjw3a1amLqU4ijar3q3GaCrbHVfpqcEt8ilBkB12Gr+Yc2vzqK
 g8Fd12YWiv18XD/I0HVvHvgexetq08mPZmulOyE=
X-Google-Smtp-Source: APXvYqzctIUFoGaIl0rpBUDrpqH8GDKfSMmdOFSYgwBO7PeaqyV1oVJFIstJbr0hTlAN7tiDDzPhiyHFiSxfpgjP0/g=
X-Received: by 2002:a5e:9405:: with SMTP id q5mr13110599ioj.5.1571499182901;
 Sat, 19 Oct 2019 08:33:02 -0700 (PDT)
MIME-Version: 1.0
References: <20191017035351.125013-1-yuehaibing@huawei.com>
In-Reply-To: <20191017035351.125013-1-yuehaibing@huawei.com>
Date: Sat, 19 Oct 2019 10:32:52 -0500
Message-ID: <CAH2r5mucpgb=cOzbq52kLojoTega3fCVh9yRtpodPe1zw9GG6Q@mail.gmail.com>
Subject: Re: [PATCH -next] CIFS: remove set but not used variables 'cinode'
 and 'netfid'
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 kernel-janitors <kernel-janitors@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
 Hulk Robot <hulkci@huawei.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

tentatively pushed to cifs-2.6.git for-next pending more testing of
the flock patch it modified.

On Fri, Oct 18, 2019 at 1:07 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> fs/cifs/file.c: In function 'cifs_flock':
> fs/cifs/file.c:1704:8: warning:
>  variable 'netfid' set but not used [-Wunused-but-set-variable]
>
> fs/cifs/file.c:1702:24: warning:
>  variable 'cinode' set but not used [-Wunused-but-set-variable]
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  fs/cifs/file.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/fs/cifs/file.c b/fs/cifs/file.c
> index 936e03892e2a..02a81dc6861a 100644
> --- a/fs/cifs/file.c
> +++ b/fs/cifs/file.c
> @@ -1699,9 +1699,7 @@ int cifs_flock(struct file *file, int cmd, struct file_lock *fl)
>         bool posix_lck = false;
>         struct cifs_sb_info *cifs_sb;
>         struct cifs_tcon *tcon;
> -       struct cifsInodeInfo *cinode;
>         struct cifsFileInfo *cfile;
> -       __u16 netfid;
>         __u32 type;
>
>         rc = -EACCES;
> @@ -1716,8 +1714,6 @@ int cifs_flock(struct file *file, int cmd, struct file_lock *fl)
>         cifs_read_flock(fl, &type, &lock, &unlock, &wait_flag,
>                         tcon->ses->server);
>         cifs_sb = CIFS_FILE_SB(file);
> -       netfid = cfile->fid.netfid;
> -       cinode = CIFS_I(file_inode(file));
>
>         if (cap_unix(tcon->ses) &&
>             (CIFS_UNIX_FCNTL_CAP & le64_to_cpu(tcon->fsUnixInfo.Capability)) &&
>
>
>


-- 
Thanks,

Steve

