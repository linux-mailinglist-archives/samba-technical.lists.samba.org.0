Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D11EB5D7CF
	for <lists+samba-technical@lfdr.de>; Tue,  2 Jul 2019 23:29:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=t3kvAYxZ9YfB3CErs/a0pOWO4ZDaH45y/5BXSbrPysE=; b=ksDz2ZsdBYSp9Gp3DpFnV8eWih
	yYhjH+Rqa/j4ZTg2qyzUijJocvRnHwR6HYMfXPkC7nL7HJEWAa2nP595H1J+LzUwMIacXqbIhNeQP
	T4KLupk4FfYjyaXn3hwLwscTWche7GrVsUiqEZdEFfGMyZrOPpJ9tETjixypLaGBj9+PiBAtoWAHs
	N3BbOiU24El4OgR7YNalILHsX92ndEW2tJUuFWsFWmASOeixJbQJAywKUG4hCe3Pc53mnyQQAI33c
	C98l4fdmD1rBwfCXAHZ0Gb4g/8zAPxvF6mcIVOw1tzm5Zf07WTY+ZdLE2Xlg7mSf1BKYdknslxX9J
	wYmeYflQ==;
Received: from localhost ([::1]:22674 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hiQLA-004lLg-8g; Tue, 02 Jul 2019 21:29:28 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:46103) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hiQL6-004lLY-DY
 for samba-technical@lists.samba.org; Tue, 02 Jul 2019 21:29:26 +0000
Received: by mail-pg1-x544.google.com with SMTP id i8so14989pgm.13
 for <samba-technical@lists.samba.org>; Tue, 02 Jul 2019 14:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t3kvAYxZ9YfB3CErs/a0pOWO4ZDaH45y/5BXSbrPysE=;
 b=nAAAHHf5Jhq0CPzmiVQ+diqs3YNFkJMpwWivvfs3Z3TeIdRyFEWlDUKogew+cbhhB4
 MuNhbAT5rEZQKQXWE4Z8DXIVx3jqoIVYiJqftA/B2m1oe+Nmfww6QVm8ARClFuZwalX3
 xGhV9BEeNzq7e7+0Jt0LfSvDBFEIw/aO7RvXX16XMJFXncbMFpmRGTKiEfXWnXmmBOwz
 v9tCNDgE7AyS25BrN3cxAJcIZHrg0eMfK/Yra3lEWDjnCbAXuI3NOSdTbAj8AnVgqPaH
 +vMwJUSzkOzdWQl2DyWy77wiuWDbr87YobkqS9PYQnNL8ON2MyQY0aAxIMtG7bkc1zHY
 C2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t3kvAYxZ9YfB3CErs/a0pOWO4ZDaH45y/5BXSbrPysE=;
 b=UYDkmkkl74YCLkvsO2reSD2Rc9MGcBpOMBDi2gRZ7+unw38waVUMSp1i+H3QCFGmvm
 q3VLBxgljBvECJhkc0j8GkJbWH62gnSDv9MLbUslC2VssyJO3qCzQTG8uuHcwKV1XKtJ
 hqP+t30NC0yqZO5ZfRZ+rJBX8FseOqj2LTBG8HEHpkQ4m1M/BOOg+D2Bw6tMrgNi1QZ7
 MZNZSqEtnZTbqq/L0+uQgSg3P8h1ixTIJjXIkjzOpznCXB4AsuxgddKx8hKCM31mXTqm
 qjtP+ZsTe4NV23CTTwK0fG/1qGBJfZgvXLdUbbq+fcttOeGMvVBlnJJrtFm1OypKdwuu
 rRKg==
X-Gm-Message-State: APjAAAXk6nI7nLL2sAgGqCJLpoEly1bmF+kH6DFIycAORKvD/pdlLoR9
 zZXpwiCIuin1ctOQbD6e9XKPVecQYTeG6CG7818=
X-Google-Smtp-Source: APXvYqzbHumWotK093sUi124dPGbA3soHvzWAIdlOwFN2MycCmHQQWsEBzSp3Ct0ygT1bevzBTdPflT84VNatn18ojU=
X-Received: by 2002:a17:90a:fa07:: with SMTP id
 cm7mr7742124pjb.138.1562102962310; 
 Tue, 02 Jul 2019 14:29:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190702182001.GA11497@hari-Inspiron-1545>
In-Reply-To: <20190702182001.GA11497@hari-Inspiron-1545>
Date: Tue, 2 Jul 2019 16:29:10 -0500
Message-ID: <CAH2r5mtrVbTP-iO6XebrXXL83aS80RDiYS7G4-FZC43-ieUk8w@mail.gmail.com>
Subject: Re: [PATCH] fs: cifs: cifsssmb: Change return type of
 convert_ace_to_cifs_ace
To: Hariprasad Kelam <hariprasad.kelam@gmail.com>
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
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Tue, Jul 2, 2019 at 1:20 PM Hariprasad Kelam
<hariprasad.kelam@gmail.com> wrote:
>
> Change return from int to void of  convert_ace_to_cifs_ace as it never
> fails.
>
> fixes below issue reported by coccicheck
> fs/cifs/cifssmb.c:3606:7-9: Unneeded variable: "rc". Return "0" on line
> 3620
>
> Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
> ---
>  fs/cifs/cifssmb.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
>
> diff --git a/fs/cifs/cifssmb.c b/fs/cifs/cifssmb.c
> index 2ea2855..6228719 100644
> --- a/fs/cifs/cifssmb.c
> +++ b/fs/cifs/cifssmb.c
> @@ -3600,11 +3600,9 @@ static int cifs_copy_posix_acl(char *trgt, char *src, const int buflen,
>         return size;
>  }
>
> -static __u16 convert_ace_to_cifs_ace(struct cifs_posix_ace *cifs_ace,
> +static void convert_ace_to_cifs_ace(struct cifs_posix_ace *cifs_ace,
>                                      const struct posix_acl_xattr_entry *local_ace)
>  {
> -       __u16 rc = 0; /* 0 = ACL converted ok */
> -
>         cifs_ace->cifs_e_perm = le16_to_cpu(local_ace->e_perm);
>         cifs_ace->cifs_e_tag =  le16_to_cpu(local_ace->e_tag);
>         /* BB is there a better way to handle the large uid? */
> @@ -3617,7 +3615,6 @@ static __u16 convert_ace_to_cifs_ace(struct cifs_posix_ace *cifs_ace,
>         cifs_dbg(FYI, "perm %d tag %d id %d\n",
>                  ace->e_perm, ace->e_tag, ace->e_id);
>  */
> -       return rc;
>  }
>
>  /* Convert ACL from local Linux POSIX xattr to CIFS POSIX ACL wire format */
> @@ -3653,13 +3650,8 @@ static __u16 ACL_to_cifs_posix(char *parm_data, const char *pACL,
>                 cifs_dbg(FYI, "unknown ACL type %d\n", acl_type);
>                 return 0;
>         }
> -       for (i = 0; i < count; i++) {
> -               rc = convert_ace_to_cifs_ace(&cifs_acl->ace_array[i], &ace[i]);
> -               if (rc != 0) {
> -                       /* ACE not converted */
> -                       break;
> -               }
> -       }
> +       for (i = 0; i < count; i++)
> +               convert_ace_to_cifs_ace(&cifs_acl->ace_array[i], &ace[i]);
>         if (rc == 0) {
>                 rc = (__u16)(count * sizeof(struct cifs_posix_ace));
>                 rc += sizeof(struct cifs_posix_acl);
> --
> 2.7.4
>


-- 
Thanks,

Steve

