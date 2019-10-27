Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCE6E6531
	for <lists+samba-technical@lfdr.de>; Sun, 27 Oct 2019 21:00:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=1JDSmw4J3XoscIws3mjSmVtK+pmmPNy7/Yi1UQKGYyc=; b=EMXqgzfHFYJYKxW8qgY8y3vMZz
	P0QZHUh6nSYeySOKrog0SKTRs+yQzaPAyxKtoTwu1XZVVZt5x6m+w5tmaPwjv5/jHi9F307mXJCBw
	69KyKPo+6tFml1AlS8gWvmV0WjlGZP2zszHwzg+v2WLpd3U1/SDNhg196V5vvX8yWR9bGCPI10ZGz
	oymLvZe8T57QpFePK/cE6+i1U73mAuXtWsAeAJLRPSsnQgHlIbnOK2SavX2hZekHewUwnZkeU3fZ3
	cwq6UZbApJpn4iNAX66yvDAztYMPP/6emBsfua3aQbkaq6NiCif6MQeFqYhTYKr4Y7OKdBISAu5Eg
	guMg8Kcg==;
Received: from localhost ([::1]:29368 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iOohL-002r6C-0k; Sun, 27 Oct 2019 19:59:35 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:43870) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iOohG-002r65-2M
 for samba-technical@lists.samba.org; Sun, 27 Oct 2019 19:59:32 +0000
Received: by mail-io1-xd44.google.com with SMTP id c11so8128740iom.10
 for <samba-technical@lists.samba.org>; Sun, 27 Oct 2019 12:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1JDSmw4J3XoscIws3mjSmVtK+pmmPNy7/Yi1UQKGYyc=;
 b=IfnIIUZpwalkn0FyuXzidd6QbzoB/pizIfsG7Kq/pLUDKe0/r/6k5nl+T0L9VY9LHc
 UeGyRrDWobnZWk772raunkKmfuhcIGE0AxgzD2dJP6FhRnJ6GuSMv1pGLWkfMZYMy/H7
 gmrvOpgA6virUieOFyZq+NtEsOHCSy5RIthtjfuhEqqcQlUNlp9uRgEqZLrPsIhnF0aQ
 WJMee5yNIYIexo27dVyCe79v5SIirCLDi2mjXncXVZHBNrqfrRQMzDiU7PJstoHNi4E7
 tOpDpcnmFi1b1YL1x447NeM2Eg6QcyQkSmKwLZOWmD/c9Ef4G0j+UosEKCForP5i5Tfl
 +fug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1JDSmw4J3XoscIws3mjSmVtK+pmmPNy7/Yi1UQKGYyc=;
 b=FXf3jf96IbmCFSmHaxPDhoJf/i7Trsb1ERUEDhEq6pF8hANlq2rStmtY/CZ0NU1eor
 3K4TQCI1r8MLb44aiOtsVOLaPzMZUpM9dUXiqrmwA2zwi6otPCaflvxURLBztTFzpUl4
 N41NUAYw1gokNGdEOx1+cEv5LfksKKZxqa7PPgQQidtvbzhMvy4P0qMmAM9j+Vr/qf9S
 kd45wFlfIZg5BWGtFOCTsvs8bhIO/LCvx+Bl4k50+ZwYFEhHlW9BvvIyx8yJK6ayu2hA
 L43EDpvzyAs22x7gW4TrI6EWNmk2/BYREeQQoN2lhERe65MY6VQKqb5FhLQHR133040w
 AIJA==
X-Gm-Message-State: APjAAAUYz4AdfMWWZtF0eQExyknK5PSGpvDdGKrE6fW3iiMW9PYrrICg
 bWwIy65z1Km4SX0RqhJhJWEsihKdinX2gTYE65w=
X-Google-Smtp-Source: APXvYqzQBpwMNIT2dG22laDowix/1mJWw64mvlIHL9mvLhX8iaqPbYdgarAGvzKHfXWihZYw3Fy20QQ5B1mKqGkyQ3M=
X-Received: by 2002:a02:1c41:: with SMTP id c62mr12041847jac.132.1572206367691; 
 Sun, 27 Oct 2019 12:59:27 -0700 (PDT)
MIME-Version: 1.0
References: <1571259116-102015-1-git-send-email-longli@linuxonhyperv.com>
 <1571259116-102015-7-git-send-email-longli@linuxonhyperv.com>
In-Reply-To: <1571259116-102015-7-git-send-email-longli@linuxonhyperv.com>
Date: Sun, 27 Oct 2019 14:59:16 -0500
Message-ID: <CAH2r5mto-Jbp1_yoLsFuiCWiFd-HA8TFVFB91CjDaBABq9PiuQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] cifs: smbd: Only queue work for error recovery on
 memory registration
To: Long Li <longli@microsoft.com>
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
 LKML <linux-kernel@vger.kernel.org>, Stable <stable@vger.kernel.org>,
 Steve French <sfrench@samba.org>, longli@linuxonhyperv.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I cleaned up minor cosmetic nit spotted by checkpatch

$ scripts/checkpatch.pl
0001-cifs-smbd-Only-queue-work-for-error-recovery-on-memo.patch
WARNING: Possible unwrapped commit description (prefer a maximum 75
chars per line)
#7:
It's not necessary to queue invalidated memory registration to work queue, as

WARNING: Block comments use a trailing */ on a separate line
#58: FILE: fs/cifs/smbdirect.c:2614:
+ * current I/O */

total: 0 errors, 2 warnings, 38 lines checked

On Wed, Oct 16, 2019 at 4:11 PM longli--- via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> From: Long Li <longli@microsoft.com>
>
> It's not necessary to queue invalidated memory registration to work queue, as
> all we need to do is to unmap the SG and make it usable again. This can save
> CPU cycles in normal data paths as memory registration errors are rare and
> normally only happens during reconnection.
>
> Signed-off-by: Long Li <longli@microsoft.com>
> Cc: stable@vger.kernel.org
> ---
>  fs/cifs/smbdirect.c | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
>
> diff --git a/fs/cifs/smbdirect.c b/fs/cifs/smbdirect.c
> index cf001f10d555..c00629a41d81 100644
> --- a/fs/cifs/smbdirect.c
> +++ b/fs/cifs/smbdirect.c
> @@ -2269,12 +2269,7 @@ static void smbd_mr_recovery_work(struct work_struct *work)
>         int rc;
>
>         list_for_each_entry(smbdirect_mr, &info->mr_list, list) {
> -               if (smbdirect_mr->state == MR_INVALIDATED)
> -                       ib_dma_unmap_sg(
> -                               info->id->device, smbdirect_mr->sgl,
> -                               smbdirect_mr->sgl_count,
> -                               smbdirect_mr->dir);
> -               else if (smbdirect_mr->state == MR_ERROR) {
> +               if (smbdirect_mr->state == MR_ERROR) {
>
>                         /* recover this MR entry */
>                         rc = ib_dereg_mr(smbdirect_mr->mr);
> @@ -2602,11 +2597,20 @@ int smbd_deregister_mr(struct smbd_mr *smbdirect_mr)
>                  */
>                 smbdirect_mr->state = MR_INVALIDATED;
>
> -       /*
> -        * Schedule the work to do MR recovery for future I/Os
> -        * MR recovery is slow and we don't want it to block the current I/O
> -        */
> -       queue_work(info->workqueue, &info->mr_recovery_work);
> +       if (smbdirect_mr->state == MR_INVALIDATED) {
> +               ib_dma_unmap_sg(
> +                       info->id->device, smbdirect_mr->sgl,
> +                       smbdirect_mr->sgl_count,
> +                       smbdirect_mr->dir);
> +               smbdirect_mr->state = MR_READY;
> +               if (atomic_inc_return(&info->mr_ready_count) == 1)
> +                       wake_up_interruptible(&info->wait_mr);
> +       } else
> +               /*
> +                * Schedule the work to do MR recovery for future I/Os
> +                * MR recovery is slow and we don't want it to block the
> +                * current I/O */
> +               queue_work(info->workqueue, &info->mr_recovery_work);
>
>  done:
>         if (atomic_dec_and_test(&info->mr_used_count))
> --
> 2.17.1
>
>


-- 
Thanks,

Steve

