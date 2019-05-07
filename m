Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7164816782
	for <lists+samba-technical@lfdr.de>; Tue,  7 May 2019 18:14:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=PvouaYjN3Arp+88+2ukjI7BrrRf9lUz+IEKElaRnfEQ=; b=sTyzkE09R9F5gTEMr25M6nry+D
	LuWbVvE04SiJOnXnE0oZUd3VV5TFfFQCcrAuCVJDJdcHDQCSjxk0ZZgBb5h2g+9U0aw/ZVFIkeXRV
	+JM8IZgOut5LkoTri24jwNrzOnzpBt2ogzkjLDdEtaZEmgGlFV+BlBjAHExhZ5itnLpriO46YJwMU
	5GKh2nfHKWkD8AGn9PmSUzQn+KwOWxYIbJALjVldjVh20CaoHbBZVct9l9kRTfBggbFKrqS1QyNwN
	Itb5BtUi7KplpIDqQ4eMC6bHFVY9EZ1uOb6UQxXUyEsMY8lsD2KOKLse6dwvHqQwWjYnwGkoiQI0G
	tjSGf9YQ==;
Received: from localhost ([::1]:31974 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hO2j3-002uPK-Vg; Tue, 07 May 2019 16:13:54 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:34048) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hO2iz-002uPD-5c
 for samba-technical@lists.samba.org; Tue, 07 May 2019 16:13:51 +0000
Received: by mail-pl1-x642.google.com with SMTP id ck18so8430592plb.1
 for <samba-technical@lists.samba.org>; Tue, 07 May 2019 09:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PvouaYjN3Arp+88+2ukjI7BrrRf9lUz+IEKElaRnfEQ=;
 b=QHZynWd2QYaXvolmJ2TVdMus1VL9YSL+KBfdl3oW1im3eGDEhHXcTHTPr5fHG5NHL1
 P1tPTJQBEplq5W+TrTmNGLR3sSvXrZ50RNK8G1LnVoDz5qp8NgfpfahuxzbByan1+1pl
 LoPJj8bmA6DTi50GOVFqXBA5053BgnXKVU7f3/+qfYOaQ5vlXWrqI4uIh1lhSR5qxe91
 0CISQFBxXzuC4yVEIuLmLpx0leHBOfPA6iiH35PNgFMbqvVMeDw36h7Hfbpw6Hp1ZM+T
 q12fZmmdaPk27jPyUqyyDXVRbIVNsT06SHTmIclL5L9eOR5+2l6jCXKmKSPs4VxFrB1H
 BkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PvouaYjN3Arp+88+2ukjI7BrrRf9lUz+IEKElaRnfEQ=;
 b=QcIk/kHr+HiupfXwr/k1aBXh/ieXEb3pjqPWffuuceAgmK3hFRxOlIpW7HTVSGnOGz
 3dPE9FmG3FZqbrtXO8Lz4e+wu9v4Oh2EE+M1/PX04Fo3I89LH8cETz0lw+4MfgFHYTeO
 fLapmm4swAPK8QHezujBCefhG/Wu1N0Z3jVBBnqeJevy6unrITJ56m23jaaR5A3UEA1H
 O1MLHdcY0ta4ZKRIhWkNfKBSM/IYjJuKBHKU8vSnSYYBrvjCzMDf7EgtKC4w1+qxAsob
 dSewUDfNzERblbirK1s8ljZKsuWDi4KoGcsi4RGLt9s5MhDY88sYYewtwMPwPCC/kMSX
 laFA==
X-Gm-Message-State: APjAAAUN1ADTVYKPAGDj3YrZZjJk/+rgFHbP5KdlA5gAI++X0vfptsYC
 nZQXH9zpD+T+iLsgnzPlC5aPWwAxD5ONDAoLs9g=
X-Google-Smtp-Source: APXvYqzwej+/HPo7Bs6aRyGls46/1CQgiFLznL8JZhUc7dAFJOuirFsxCA42mxNCF1VwIn1EexS6Nu9rkXYKvnNMuEk=
X-Received: by 2002:a17:902:e00a:: with SMTP id
 ca10mr10539729plb.18.1557245626111; 
 Tue, 07 May 2019 09:13:46 -0700 (PDT)
MIME-Version: 1.0
References: <1557242200-26194-1-git-send-email-kernel@probst.it>
In-Reply-To: <1557242200-26194-1-git-send-email-kernel@probst.it>
Date: Tue, 7 May 2019 11:13:34 -0500
Message-ID: <CAH2r5mtqkHYbHJkf_LbAjhujnNRQP6Zmkmqhj1dUHomwsc3e=w@mail.gmail.com>
Subject: Re: [PATCH v2] cifs: fix strcat buffer overflow and reduce raciness
 in smb21_set_oplock_level()
To: Christoph Probst <kernel@probst.it>
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
Cc: Steve French <sfrench@samba.org>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Tue, May 7, 2019 at 10:17 AM Christoph Probst via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Change strcat to strncpy in the "None" case to fix a buffer overflow
> when cinode->oplock is reset to 0 by another thread accessing the same
> cinode. It is never valid to append "None" to any other message.
>
> Consolidate multiple writes to cinode->oplock to reduce raciness.
>
> Signed-off-by: Christoph Probst <kernel@probst.it>
> ---
>  fs/cifs/smb2ops.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
> index c36ff0d..aa61dcf 100644
> --- a/fs/cifs/smb2ops.c
> +++ b/fs/cifs/smb2ops.c
> @@ -2917,26 +2917,28 @@ smb21_set_oplock_level(struct cifsInodeInfo *cinode, __u32 oplock,
>                        unsigned int epoch, bool *purge_cache)
>  {
>         char message[5] = {0};
> +       unsigned int new_oplock = 0;
>
>         oplock &= 0xFF;
>         if (oplock == SMB2_OPLOCK_LEVEL_NOCHANGE)
>                 return;
>
> -       cinode->oplock = 0;
>         if (oplock & SMB2_LEASE_READ_CACHING_HE) {
> -               cinode->oplock |= CIFS_CACHE_READ_FLG;
> +               new_oplock |= CIFS_CACHE_READ_FLG;
>                 strcat(message, "R");
>         }
>         if (oplock & SMB2_LEASE_HANDLE_CACHING_HE) {
> -               cinode->oplock |= CIFS_CACHE_HANDLE_FLG;
> +               new_oplock |= CIFS_CACHE_HANDLE_FLG;
>                 strcat(message, "H");
>         }
>         if (oplock & SMB2_LEASE_WRITE_CACHING_HE) {
> -               cinode->oplock |= CIFS_CACHE_WRITE_FLG;
> +               new_oplock |= CIFS_CACHE_WRITE_FLG;
>                 strcat(message, "W");
>         }
> -       if (!cinode->oplock)
> -               strcat(message, "None");
> +       if (!new_oplock)
> +               strncpy(message, "None", sizeof(message));
> +
> +       cinode->oplock = new_oplock;
>         cifs_dbg(FYI, "%s Lease granted on inode %p\n", message,
>                  &cinode->vfs_inode);
>  }
> --
> 2.1.4
>
>


-- 
Thanks,

Steve

