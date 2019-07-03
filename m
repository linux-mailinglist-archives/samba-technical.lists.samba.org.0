Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5275ED5E
	for <lists+samba-technical@lfdr.de>; Wed,  3 Jul 2019 22:17:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=6gjTEURaI56DnWgxjUVHz+R8emA5V0RKIIK+KTO8T2A=; b=YHL1FYxt4WVV4yvhx3RKc7KHO3
	BEZButkF5s4Uj6joqpsQc266Ykg+171ncKwg5Vt6LJPid82N6Je8764cMxIseAQhqnk8/VPBv0GKH
	ZU/wVPKeQN5cmvtut0cydxpLcXYeNa67epij7vX8dldDRF9NWmP4IIKi00DuXoHK2VwyfxLY138ib
	hEqqC782EfkM51Xv6eurOSURsVAfq98+fNp3QyMKZMxb+PtynVEmHHASoCKqbpwR695zuzWth8WVR
	kpjr4Lb7NIMwkEb63Z4qoV1u5U9ZupR1z7mj1aczbHCejdgW6TI/XeWllTUl8j2ub/+6CV1dVZBFo
	xIld/PkA==;
Received: from localhost ([::1]:58116 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hilge-004zFr-9D; Wed, 03 Jul 2019 20:17:04 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:45859) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hilgZ-004zFh-ED
 for samba-technical@lists.samba.org; Wed, 03 Jul 2019 20:17:01 +0000
Received: by mail-lj1-x244.google.com with SMTP id m23so3785963lje.12
 for <samba-technical@lists.samba.org>; Wed, 03 Jul 2019 13:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6gjTEURaI56DnWgxjUVHz+R8emA5V0RKIIK+KTO8T2A=;
 b=oMP6yg7CNAOFToPUIfpH+HChAeSfcf8UWM78eEjIqXhCaE0NSSJndklmjBf8C1do6N
 qssAZFk7YahYpQt9smVi4vZmRlHzY80DpPjWtEDaQt9Mctf5NSxzrz+lVJehsOI8bJNr
 nInQ97PqRSv7rWteUxtgyvtjJP2joGRrGXhJHzsbV4RRGyhuV60WafTiXn9KW1pTdbNh
 f8AWOzlkd4PGsXqrEdy2nDyA4HrjOZRyZRx8qoOf4OkZoFsj+EIMpe6k3h3u7CgkK6CX
 b3yaXQJV/lXLuQBI04iwVyHFaiz6lNTAp1qJOTjqZqwXOLnnYcTkv0AMuyrtxXHjhUb5
 ri9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6gjTEURaI56DnWgxjUVHz+R8emA5V0RKIIK+KTO8T2A=;
 b=URBCs6OHv+i5NxkYVeOQ8E5P0dT4/8A6tMSYboZRqkZ7StedGyw34fy2ZgsqRnRTw3
 SNcEk9Zr1QF9wEysF+ZGOgVmvPvKJd+lLffhV3YVdxDPywWFj3r94dKIpUnP0QCSFTwN
 wCucWowbGnamV+CtnpMqHI+5f9srGkGdYkMt1LuWh76c+FLvjzRg+7rjS+oHxVXTBXO5
 nYNfB+kqbYCHVkqxcdV+yoHOJOQ4ujkP7vseZFSEIgAqFwJRgVn23lsr2s5lZe3FzqXk
 pOUnBRJPYWWEQEc15Ku32Plvushe+EYgrmrLfFDhTFs02WLedv9Z9PIR9PtQE1QV1rl4
 GxyQ==
X-Gm-Message-State: APjAAAXZa/F84dzaBa6+h7fmQWon/iGoQhh8clZveg8wTDwPdI9b4YJX
 lrXLugpUzyAHwEdgX44UxANxAxS8b7oR7AhTWhk=
X-Google-Smtp-Source: APXvYqx8kL0PBOrg78gwrkY0ym1FFSDwe4mo0eFKm7Pj8XsmsdpOQrUgSN3rUl1fhnQnU3nEvTyNVTO2EyoDaohSsMY=
X-Received: by 2002:a2e:8396:: with SMTP id x22mr8686274ljg.135.1562185018170; 
 Wed, 03 Jul 2019 13:16:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190703131716.25689-1-huangfq.daxian@gmail.com>
In-Reply-To: <20190703131716.25689-1-huangfq.daxian@gmail.com>
Date: Wed, 3 Jul 2019 15:16:46 -0500
Message-ID: <CAH2r5muo1y5BPnpf6hNfaaSW8QCvNc=qtHHVbRF60fde_65F8Q@mail.gmail.com>
Subject: Re: [PATCH 22/30] cifs: Use kmemdup rather than duplicating its
 implementation
To: Fuqian Huang <huangfq.daxian@gmail.com>
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

Looks like this was already merged

commit c8fc464cbda384ba4ed48c1e744ca82cd69f1f93
Author: YueHaibing <yuehaibing@huawei.com>
Date:   Sat Jun 1 03:31:10 2019 +0000

    cifs: Use kmemdup in SMB2_ioctl_init()

    Use kmemdup rather than duplicating its implementation

    This was reported by coccinelle.

    Signed-off-by: YueHaibing <yuehaibing@huawei.com>
    Signed-off-by: Steve French <stfrench@microsoft.com>

diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
index 75311a8a68bf..ab8dc73d2282 100644
--- a/fs/cifs/smb2pdu.c
+++ b/fs/cifs/smb2pdu.c
@@ -2550,12 +2550,11 @@ SMB2_ioctl_init(struct cifs_tcon *tcon, struct
smb_rqst *rqst,
                 * indatalen is usually small at a couple of bytes max, so
                 * just allocate through generic pool
                 */
-               in_data_buf = kmalloc(indatalen, GFP_NOFS);
+               in_data_buf = kmemdup(in_data, indatalen, GFP_NOFS);
                if (!in_data_buf) {
                        cifs_small_buf_release(req);
                        return -ENOMEM;
                }
-               memcpy(in_data_buf, in_data, indatalen);
        }

        req->CtlCode = cpu_to_le32(opcode);

On Wed, Jul 3, 2019 at 8:18 AM Fuqian Huang <huangfq.daxian@gmail.com> wrote:
>
> kmemdup is introduced to duplicate a region of memory in a neat way.
> Rather than kmalloc/kzalloc + memset, which the programmer needs to
> write the size twice (sometimes lead to mistakes), kmemdup improves
> readability, leads to smaller code and also reduce the chances of mistakes.
> Suggestion to use kmemdup rather than using kmalloc/kzalloc + memset.
>
> Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
> ---
>  fs/cifs/smb2pdu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
> index 75311a8a68bf..ab8dc73d2282 100644
> --- a/fs/cifs/smb2pdu.c
> +++ b/fs/cifs/smb2pdu.c
> @@ -2550,12 +2550,11 @@ SMB2_ioctl_init(struct cifs_tcon *tcon, struct smb_rqst *rqst,
>                  * indatalen is usually small at a couple of bytes max, so
>                  * just allocate through generic pool
>                  */
> -               in_data_buf = kmalloc(indatalen, GFP_NOFS);
> +               in_data_buf = kmemdup(in_data, indatalen, GFP_NOFS);
>                 if (!in_data_buf) {
>                         cifs_small_buf_release(req);
>                         return -ENOMEM;
>                 }
> -               memcpy(in_data_buf, in_data, indatalen);
>         }
>
>         req->CtlCode = cpu_to_le32(opcode);
> --
> 2.11.0
>


-- 
Thanks,

Steve

