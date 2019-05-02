Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 385E511C66
	for <lists+samba-technical@lfdr.de>; Thu,  2 May 2019 17:14:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ytkeotxqZMK+Pphx8YBNVSrBa2jJYvjrofY1/wEO/Ns=; b=RZrmK8u1pxBcag1JIlIbUcRX+w
	a13GXCKHjqKs/rzHMW3OpUlI7k2fdsiFOrDrYexdDLHObgFVeO1yAnDjCp5Ovo0PlJvIBUcC3eIIV
	0I/UPAhTfS0wPBtr50PQfqn8Zzxez3uF9uCRYE478XAnWzePK9nJpffvepEmTZriE2WhlcHFF3kHH
	ccANkLdwV+JKmId08IyfEjU5yuGMqru4YTJxS3AfOP7dBcZwHpnA0sdfbmFnlQZkLbwnQLgQbu5jj
	kqIG3prWWt/i5w7s/4XzO6BZq9vAizaRLBFzrRmKXNdozlj52FDp/TCH/75ypbSk8B/4Wlki/bhuC
	MNWWo+Gw==;
Received: from localhost ([::1]:26904 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hMDP3-0024aA-TK; Thu, 02 May 2019 15:13:41 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:46626) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hMDOz-0024a3-DL
 for samba-technical@lists.samba.org; Thu, 02 May 2019 15:13:39 +0000
Received: by mail-pl1-x644.google.com with SMTP id bi2so1155978plb.13
 for <samba-technical@lists.samba.org>; Thu, 02 May 2019 08:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ytkeotxqZMK+Pphx8YBNVSrBa2jJYvjrofY1/wEO/Ns=;
 b=JlolP3VNtmB3piHgYExaILh0eaeOxzoKa+o453ZqajfxAFvKoQc6BLCOE75V5ReScE
 refIkDa20vnCkTZiqEkYTvrI0jqEEh2AXSNySkCe7iI69qIbcjROTlYKzM4Ba57b+FQK
 02eBqdG37b38nBHCUVa9VLn9HTBOMFWMyQdTySHfwJgHS4PKg6+SzgakucErnmOLwuJo
 unnkASs6OnyWNP7qUB6BkC/H/MbJGmRJo2OSfr/7YlN2upBwcECQSdIes8RZkmzxzvE7
 agwihi4+d5t4uoL7qz6h0+NH6Z7J6XEuyJKC+OdEBIDw7Bk1CYl9bQM5B+GxKZ8u2nvD
 KUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ytkeotxqZMK+Pphx8YBNVSrBa2jJYvjrofY1/wEO/Ns=;
 b=OlxoHfAM/oX7YmAujKVAzCVuwm7jald7LtzVLftKNqcD11ihCb99d4spDZKc334pZh
 JhAkkxfGdAlccQUsVUup54MghQgSLHETpA333Quuu7opfapAp2eahRxseuDzEdZUHS3p
 BUb1iaVii1DCh9zZk74gsGNlh7jazpwa4fQacNwAHHqdCYOsQu6XVvlj1EveZrsL8sY+
 g+GjlvIIAKbHXG3Y+3Jkjano3ayLaXAohu8vaysATS9cTmEsWjGPabbjTbkQwSFFCRlZ
 zGWDf6B3H+Gg1oQskQO0+otfoRjkLgLIk/Ania3NpO2ndXIl4Bkm3sdw5loMNvQolqW/
 w4LQ==
X-Gm-Message-State: APjAAAVPjBxejUiMELzT5h7rq/UZU4ZyS9Vg4lw1jQCoxLcIgFxIgd5b
 QpeV9MV71s0gHydrPZfxHAKqYXktkrsU9dLDPqg=
X-Google-Smtp-Source: APXvYqxRaVJ1ZvMD65K8iaD0idLyT/VtUkYbZ8zzx61uHRVijYtv/xeXUpqjfHikDuVpgLwynuVM9Erapx7YybujNYo=
X-Received: by 2002:a17:902:b617:: with SMTP id
 b23mr4120030pls.73.1556810015180; 
 Thu, 02 May 2019 08:13:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190501205541.GC30899@veci.piliscsaba.redhat.com>
In-Reply-To: <20190501205541.GC30899@veci.piliscsaba.redhat.com>
Date: Thu, 2 May 2019 10:13:23 -0500
Message-ID: <CAH2r5mt+j9ozVuvNB8qZ=KmnHHqT4Vyd6f_jKVY2232aECH04w@mail.gmail.com>
Subject: Re: [RFC PATCH] network fs notification
To: Miklos Szeredi <miklos@szeredi.hu>, CIFS <linux-cifs@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
Cc: samba-technical <samba-technical@lists.samba.org>,
 Amir Goldstein <amir73il@gmail.com>, Jan Kara <jack@suse.cz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Adding linux-cifs

Will take a look today - looks promising

On Wed, May 1, 2019 at 3:55 PM Miklos Szeredi <miklos@szeredi.hu> wrote:
>
> This is a really really trivial first iteration, but I think it's enough to
> try out CIFS notification support.  Doesn't deal with mark deletion, but
> that's best effort anyway: fsnotify() will filter out unneeded events.
>
> Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> ---
>  fs/notify/fanotify/fanotify_user.c |    6 +++++-
>  fs/notify/inotify/inotify_user.c   |    2 ++
>  include/linux/fs.h                 |    1 +
>  3 files changed, 8 insertions(+), 1 deletion(-)
>
> --- a/fs/notify/fanotify/fanotify_user.c
> +++ b/fs/notify/fanotify/fanotify_user.c
> @@ -1041,9 +1041,13 @@ static int do_fanotify_mark(int fanotify
>                 else if (mark_type == FAN_MARK_FILESYSTEM)
>                         ret = fanotify_add_sb_mark(group, mnt->mnt_sb, mask,
>                                                    flags, fsid);
> -               else
> +               else {
>                         ret = fanotify_add_inode_mark(group, inode, mask,
>                                                       flags, fsid);
> +
> +                       if (!ret && inode->i_op->notify_update)
> +                               inode->i_op->notify_update(inode);
> +               }
>                 break;
>         case FAN_MARK_REMOVE:
>                 if (mark_type == FAN_MARK_MOUNT)
> --- a/fs/notify/inotify/inotify_user.c
> +++ b/fs/notify/inotify/inotify_user.c
> @@ -754,6 +754,8 @@ SYSCALL_DEFINE3(inotify_add_watch, int,
>
>         /* create/update an inode mark */
>         ret = inotify_update_watch(group, inode, mask);
> +       if (!ret && inode->i_op->notify_update)
> +               inode->i_op->notify_update(inode);
>         path_put(&path);
>  fput_and_out:
>         fdput(f);
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -1852,6 +1852,7 @@ struct inode_operations {
>                            umode_t create_mode);
>         int (*tmpfile) (struct inode *, struct dentry *, umode_t);
>         int (*set_acl)(struct inode *, struct posix_acl *, int);
> +       void (*notify_update)(struct inode *inode);
>  } ____cacheline_aligned;
>
>  static inline ssize_t call_read_iter(struct file *file, struct kiocb *kio,



-- 
Thanks,

Steve

