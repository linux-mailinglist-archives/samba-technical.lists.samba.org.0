Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAC223FF56
	for <lists+samba-technical@lfdr.de>; Sun,  9 Aug 2020 18:48:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=UCHvINa6VosD8msvnuFOWiWxKgJoPHzS7PIxpE/jDKE=; b=wE9GAD6v3OlnuzQv8saeLhwuAq
	jBlFYWU8lFFILDP7Eobk2Mz6QGPjpJGTLVbiO/ZacvadsuFsukHWHlBLurjE/pKxr4KImVOsjSaPE
	6IIfTou7uQb5mbekohSU9Q953GzFfbgjghrfNtSbbfOzPkU8kUDEdr7fIh3WiyVdQHB2KixIxTUfA
	4+t4AXosx9980NH7YxDVByMC/q/NAc7R7tJYQLKH5dfgp4wZZXUZGkFnIxbVdeeTeEOR11efHDylK
	qB07n95Oy6Q4C4UJT2O6xKa3hXzvn7YCkti2dlPpTfc8F73vKWXKPe9kOwu81Ff2EHhSOfxdyA2tK
	3ue0th5A==;
Received: from localhost ([::1]:34378 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k4oTK-00D2q3-PP; Sun, 09 Aug 2020 16:46:58 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:35329) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k4oTD-00D2pw-5R
 for samba-technical@lists.samba.org; Sun, 09 Aug 2020 16:46:54 +0000
Received: by mail-io1-xd43.google.com with SMTP id s189so6642753iod.2
 for <samba-technical@lists.samba.org>; Sun, 09 Aug 2020 09:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UCHvINa6VosD8msvnuFOWiWxKgJoPHzS7PIxpE/jDKE=;
 b=SUUlQ486bbodonuMFEkprugAhuuwL2vHbLCV1+2ijqzaObbJzRpgSGucKZ6F+5UQh9
 vNQ/6Wp1o6OXrBW/ujPh9GzKi3skf1L3CWxuMSIsgzAtUBWnhsCMb/dYega9BNkcFm5h
 zaEaSbVPN00rGpU0UWU/XDauI/L36qM13aUNnmWiEJLIgdCYkof1ip3ZO1N9ToqwH3ml
 UhFH7V6cK4rdCblXegiI4p35SYmrGKVPGhUmbCN9aA6Dzn0XUCJHsq+3bShzqKeRtx1V
 ckK3GO3ckXG2gSTC9CjqIO+bpEra0Xj5TTk+se3ZhfBBl1UMmN56N9kA+M+IaI5j9EH9
 fGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UCHvINa6VosD8msvnuFOWiWxKgJoPHzS7PIxpE/jDKE=;
 b=VhVYbEbeOt8AVlvoOpnNRubsXuGJkKB3XU7TAS8M+H+ZzRzScZ3jVriTPZdhoro5tT
 VxkDdLLluLHe8VCel96u9HmAXRtsHiFWM+tcYytmEJDK9PxpuEIHkOiR5i0dl8/lasik
 V/r19WBXBQMmsl6rYThnvC5+18tIuL28c9BBXt5VKB/3PFQLn3Nx2vDSG3uF2enNGqJ0
 qOJa+iSMZwnpg1Pyt4YJR0aksFukeVeVdrl30KOUOIo92W4kq10a86kk14flSOQJOsdH
 LK+6qsEjpDAFHYH+2xif+khoSnPaNTEehqO1iS6j9rOJR7I7HZnI/U8rWzRl4AGFsrve
 vSvw==
X-Gm-Message-State: AOAM531JR73/TVDU4tqY+9L56MIFsyG4Eh04MxkGxqVUo6gTsCfYOjiY
 2H9IKajiF8RGcd2Z2nESTjkaUyt220bUD2tGF6o=
X-Google-Smtp-Source: ABdhPJxoK4IbE9i3/uwbgKBES4omB1Sn1yEUDgiKt1behl2IAnP9cuy6hGYY0MP9i6FNBs4RCSbb+ZuPMaYpszZy2ZU=
X-Received: by 2002:a05:6638:635:: with SMTP id
 h21mr16236867jar.27.1596991604178; 
 Sun, 09 Aug 2020 09:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <1596875797-22710-1-git-send-email-linmiaohe@huawei.com>
In-Reply-To: <1596875797-22710-1-git-send-email-linmiaohe@huawei.com>
Date: Sun, 9 Aug 2020 11:46:33 -0500
Message-ID: <CAH2r5mvHLXtCAam9Wcw6PJUGg3bY8PvjYG8ijFh0km-CKNEUnA@mail.gmail.com>
Subject: Re: [PATCH] cifs: Convert to use the fallthrough macro
To: linmiaohe <linmiaohe@huawei.com>
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

Is this conversion from "/* Fallthrough */"   to the preferred (?)
"fallthrough;" documented anywhere?

All I see is a few fs changesets like:

commit c730ae0c6bb3125ccb776fb2ab6abbdff500c02c
Author: Marcos Paulo de Souza <mpdesouza@suse.com>
Date:   Tue Jun 16 15:54:29 2020 -0300

    btrfs: convert comments to fallthrough annotations

    Convert fall through comments to the pseudo-keyword which is now the
    preferred way.

And the vast majority of places (33 vs. 4) use "/* Fallthrough */ in
the fs directory

On Sat, Aug 8, 2020 at 3:34 AM linmiaohe <linmiaohe@huawei.com> wrote:
>
> From: Miaohe Lin <linmiaohe@huawei.com>
>
> Convert the uses of fallthrough comments to fallthrough macro.
>
> Signed-off-by: Hongxiang Lou <louhongxiang@huawei.com>
> Signed-off-by: Miaohe Lin <linmiaohe@huawei.com>
> ---
>  fs/cifs/smb2pdu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
> index 24c2ac360591..667d70aa335f 100644
> --- a/fs/cifs/smb2pdu.c
> +++ b/fs/cifs/smb2pdu.c
> @@ -3913,7 +3913,7 @@ smb2_readv_callback(struct mid_q_entry *mid)
>         case MID_RESPONSE_MALFORMED:
>                 credits.value = le16_to_cpu(shdr->CreditRequest);
>                 credits.instance = server->reconnect_instance;
> -               /* fall through */
> +               fallthrough;
>         default:
>                 rdata->result = -EIO;
>         }
> @@ -4146,7 +4146,7 @@ smb2_writev_callback(struct mid_q_entry *mid)
>         case MID_RESPONSE_MALFORMED:
>                 credits.value = le16_to_cpu(rsp->sync_hdr.CreditRequest);
>                 credits.instance = server->reconnect_instance;
> -               /* fall through */
> +               fallthrough;
>         default:
>                 wdata->result = -EIO;
>                 break;
> --
> 2.19.1
>


-- 
Thanks,

Steve

