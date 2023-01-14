Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 013ED66AD3A
	for <lists+samba-technical@lfdr.de>; Sat, 14 Jan 2023 19:12:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=NSlRoDTtSoPSgCdi+CZiZS3Sznec9wySQ545Pko7j/k=; b=EqeRE8jw6o4Hxd58qQijEg/I0r
	NzqjJ093Fxfrq39QPrL0pYVBJLWt9LzMRut9KXhctBFerhuCpAMDoQasW5dLgYob7D0KKEjp8fJ2d
	K5j/vw/JiQA2XXw6y3WW7xLjjDIBrhFbp6t4sp+UfE0EPXRRAd2vk+rVlNGWrPGEFNi845Drai5ky
	VJEi3yFvKelpWoDIDwxRqZzIo1YNLQSQi9Xhi+KtEBBUWglz60hzgF20uljLpeoLcXmwPL5nu/EcY
	BPkeVxWBJTgjOsurDqtNnuWbL9x46hAcJcAAUQjE9bFOjYR1DVrpbqllqNF2ewZ38yMZ37pIIuKux
	F/ogKaDg==;
Received: from ip6-localhost ([::1]:64740 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pGl0H-00H2Mt-GJ; Sat, 14 Jan 2023 18:11:41 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:45013) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pGl09-00H2Mi-5Y
 for samba-technical@lists.samba.org; Sat, 14 Jan 2023 18:11:38 +0000
Received: by mail-lj1-x22d.google.com with SMTP id y18so22197793ljk.11
 for <samba-technical@lists.samba.org>; Sat, 14 Jan 2023 10:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NSlRoDTtSoPSgCdi+CZiZS3Sznec9wySQ545Pko7j/k=;
 b=Z8eXvudrG4nQzD8PfAyoxIhxbLNvVxnIrofwEXoHf8uz02oXhL2i5BvN8zAV8V8rJt
 u3C7YyUb2MeYY1GPqWkxpAhkdLEpe3SI8T94/ysVfIuMSXInnJQNGSONIP4GwqoJiD7N
 uF5buMMj6oOJi+bbO74m8kS/N7/SMzZfnF73Nu+8W/9tFDFfzS58t1DbCy+uD2xxaNX7
 IqoIYVHxDBhke6+gQRog682Z1+qLVD3ZLU8ysy09+MBIZTsJNCEmZ6XJVkLCUIlOhPOq
 O34XYAadIUNwFcmFh8UVkOT9MyHTEssVtdXFsi5J4aNBoACjcBSQ6oQiq4QhApMvkQ+S
 lNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NSlRoDTtSoPSgCdi+CZiZS3Sznec9wySQ545Pko7j/k=;
 b=tXy0h3wmAa4At9HwvhlDJKefe5DoBMLM+OhLDhsyOeQz7kphVZNuJ+ESy8GhwRRN+N
 Rv0W+XJKxWPqWv24F4+0r3JBTGwz/S2NB1fSFfxYj3BmqKyPnbFCusV4VH+EUrIj/c2k
 gbD63iGWISGhOCiJ+vGwyCT86ldL7La6ADNdrZo612c804qnrUA/32Z5Vzvg1EHzsekW
 groRpkRNQ1EsSZH4OZ6IFJMn+9k0/1W4u2ZCLZsnHDiI5is7wzvAHGpk09HYKB0zbGi5
 WpjfdRqwfnP82HmlxRwwMK118Q9n8w06B2mZ2tsSAZkV3WzpTrjEF/zrSmttmLvtlr36
 vlMA==
X-Gm-Message-State: AFqh2krUVQXxKArXUaGfqoN0P5eZERr2YBjW41ziw7kqobz4qJZAcTO+
 xBT/QVSvU2dtQ1F9OXwsqWplc4xjyIZ8JOugJ6U=
X-Google-Smtp-Source: AMrXdXsegW3pLvFHzGQ24UgODjHyhq7rdd1Hqg+NWXOoist8eCemWI9UMRmUSycI6TzREF0sM3CTiOZ+G+VfBIPYeA0=
X-Received: by 2002:a2e:988b:0:b0:28b:7925:3d2 with SMTP id
 b11-20020a2e988b000000b0028b792503d2mr48626ljj.229.1673719887512; Sat, 14 Jan
 2023 10:11:27 -0800 (PST)
MIME-Version: 1.0
References: <b4cb5ccc96332ca81d6732b3063942186614eaa6.1673686651.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <b4cb5ccc96332ca81d6732b3063942186614eaa6.1673686651.git.christophe.jaillet@wanadoo.fr>
Date: Sat, 14 Jan 2023 12:11:16 -0600
Message-ID: <CAH2r5mvvVwSFf7y=YB0=gxGPOhVaN2zwNvFdRSh_E5Dk7hAMEg@mail.gmail.com>
Subject: Re: [PATCH v2] cifs: Use kstrtobool() instead of strtobool()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
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
Cc: Tom Talpey <tom@talpey.com>, Shyam Prasad N <sprasad@microsoft.com>,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 Paulo Alcantara <pc@cjr.nz>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>,
 Steve French <sfrench@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Sat, Jan 14, 2023 at 2:58 AM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> strtobool() is the same as kstrtobool().
> However, the latter is more used within the kernel.
>
> In order to remove strtobool() and slightly simplify kstrtox.h, switch to
> the other function name.
>
> While at it, include the corresponding header file (<linux/kstrtox.h>)
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This patch was already sent as a part of a serie ([1]) that axed all usages
> of strtobool().
> Most of the patches have been merged in -next.
>
> I synch'ed with latest -next and re-send the remaining ones as individual
> patches.
>
> Changes in v2:
>   - synch with latest -next.
>
> [1]: https://lore.kernel.org/all/cover.1667336095.git.christophe.jaillet@wanadoo.fr/
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  fs/cifs/cifs_debug.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/fs/cifs/cifs_debug.c b/fs/cifs/cifs_debug.c
> index 56b23def4c95..612f0bb284c9 100644
> --- a/fs/cifs/cifs_debug.c
> +++ b/fs/cifs/cifs_debug.c
> @@ -8,6 +8,7 @@
>  #include <linux/fs.h>
>  #include <linux/string.h>
>  #include <linux/ctype.h>
> +#include <linux/kstrtox.h>
>  #include <linux/module.h>
>  #include <linux/proc_fs.h>
>  #include <linux/uaccess.h>
> @@ -787,7 +788,7 @@ static ssize_t cifsFYI_proc_write(struct file *file, const char __user *buffer,
>         rc = get_user(c[0], buffer);
>         if (rc)
>                 return rc;
> -       if (strtobool(c, &bv) == 0)
> +       if (kstrtobool(c, &bv) == 0)
>                 cifsFYI = bv;
>         else if ((c[0] > '1') && (c[0] <= '9'))
>                 cifsFYI = (int) (c[0] - '0'); /* see cifs_debug.h for meanings */
> @@ -947,7 +948,7 @@ static ssize_t cifs_security_flags_proc_write(struct file *file,
>
>         if (count < 3) {
>                 /* single char or single char followed by null */
> -               if (strtobool(flags_string, &bv) == 0) {
> +               if (kstrtobool(flags_string, &bv) == 0) {
>                         global_secflags = bv ? CIFSSEC_MAX : CIFSSEC_DEF;
>                         return count;
>                 } else if (!isdigit(flags_string[0])) {
> --
> 2.34.1
>


-- 
Thanks,

Steve

