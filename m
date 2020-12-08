Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A1B2D340B
	for <lists+samba-technical@lfdr.de>; Tue,  8 Dec 2020 21:43:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=zPEezVzK5/kLNT18lfW/dfChG0nQyJZzaqQoMAH4Ojw=; b=dipVp0xWByIAo48eeDVimJRTWW
	gqeehIaV4H0zHehGCoQRXPxMLPUS4DDiTVBYG03vixe8Rt0o3agwia4b3GF81/fCCVbg4rXYcBppu
	25ORZWeCsRHCPFlRN/9CVJXHdbs4k/LkedQkxvcp/qeqeSm6nx+qtFP//vBISXA0ndYiPVJ9AIkg4
	kH3ESUmMW2MhpNymnhKY/c7ZDzd0BxF/Y0Ka09FjX2oaOuhGJPZhEP7nzCp6UAhCUvfOvr0ZPdYnA
	U1WA4JRvWL8QyJ6jYZr95Z0M8CVcHlRte5qzRh34HZ/6NWxAaSoGmpim0z4ZHfWz+O4n1hc/aY9y2
	qDHvpIWg==;
Received: from ip6-localhost ([::1]:35014 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kmjp4-000Dai-Qb; Tue, 08 Dec 2020 20:42:58 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:42457) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kmjp0-000Daa-95
 for samba-technical@lists.samba.org; Tue, 08 Dec 2020 20:42:57 +0000
Received: by mail-lf1-x143.google.com with SMTP id u18so54288lfd.9
 for <samba-technical@lists.samba.org>; Tue, 08 Dec 2020 12:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zPEezVzK5/kLNT18lfW/dfChG0nQyJZzaqQoMAH4Ojw=;
 b=QQB6xX7ZMHg5p+Sz6Bt9MksNDS64p3I6yufe4wI9yXPB/gVrO3fXujcKeeSB9vuEWp
 3a23umzaJgQ7JDO9BB/hOohKVSl1sHLJFD7X2ep22r/iO4cjIag+ZzLnqcKcoJLlYM7P
 PWQmJZRCIv4T4OkshRETA/Bfm6Wn9tRDmPwuSGgKVgxWzTb3G6hXpIkqKxAq/7LInnqj
 8FrUOY274w9bytUgQZYAXOIMIS8YfUivRINu6yrbLQ+czfZb83CQZsgLu6RP/C3o7fg4
 0Tp8z19OXY/ABUelr4Nx50muS+9ok8KuARMWdmXDpe5/TzKYoF7jsgS7p8XPBEGIfidC
 b2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zPEezVzK5/kLNT18lfW/dfChG0nQyJZzaqQoMAH4Ojw=;
 b=sMiF/b/b4LpAii3MhJJZ+uiphf3TtHWpglbTia7DGbWNE+Mom30mGyM3vKBvI3Q5dE
 6KUH3yq+TSrXY2TT/evqnAsWG/YGBaaT2uyGU8Rrk4QDhfNSnasawTN0wyb/Z5RQc+rV
 dHthcUCwpkvRTDEQQ/ppRHkUHOh08JGRi33r8sf38HbaNz+ky8Hi2HZEZZbDvftTno5J
 RfYwYJyvliyu/VJggYGeaGO9WPal/SK+IBAetrAbAR+sgip/qVINw3hxwPahZJXfNISJ
 d7yygDtmdKMvKYrZpSJj6ADnJY4g+r9CU0LR0beDXFHF4wN24ytt4byXcRwQWqQjxIIQ
 +20Q==
X-Gm-Message-State: AOAM530QUHnb5H0zAAZZ/JlCPiVZ0gUqzHs6jP8+MyOdP1U8dGikCoJ7
 0VCeNp3hzn+9LiWeEjG6DXqSaJoZlclit6pU6tQ=
X-Google-Smtp-Source: ABdhPJxV3qjQHB6wUEKu9rWrbuLtX9hIHxwZYN45a2xlKjN3Iv09O/zEhJ+iIFYHbTAk33M7azJfMCbvOBT9Bh7Cz4k=
X-Received: by 2002:a19:950:: with SMTP id 77mr6586265lfj.133.1607460172142;
 Tue, 08 Dec 2020 12:42:52 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605896059.git.gustavoars@kernel.org>
 <8a35ff7132f95e24f6d9501e1bec644854fc5078.1605896059.git.gustavoars@kernel.org>
In-Reply-To: <8a35ff7132f95e24f6d9501e1bec644854fc5078.1605896059.git.gustavoars@kernel.org>
Date: Tue, 8 Dec 2020 14:42:40 -0600
Message-ID: <CAH2r5mtS-A+0N1byiXT3GYHEAkvyZByBdr-G_+ZDGhcfs40qrQ@mail.gmail.com>
Subject: Re: [PATCH 003/141] cifs: Fix fall-through warnings for Clang
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
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
 LKML <linux-kernel@vger.kernel.org>, linux-hardening@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Merged into cifs-2.6.git for-next

Let me know if you see any other cleanup/misc cifs.ko patches that may
have gotten missed ...

On Fri, Nov 20, 2020 at 12:25 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> In preparation to enable -Wimplicit-fallthrough for Clang, fix multiple
> warnings by explicitly adding multiple break/goto statements instead of
> just letting the code fall through to the next case.
>
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  fs/cifs/inode.c     | 1 +
>  fs/cifs/sess.c      | 1 +
>  fs/cifs/smbdirect.c | 1 +
>  3 files changed, 3 insertions(+)
>
> diff --git a/fs/cifs/inode.c b/fs/cifs/inode.c
> index 9ee5f304592f..ac01f9684b39 100644
> --- a/fs/cifs/inode.c
> +++ b/fs/cifs/inode.c
> @@ -771,6 +771,7 @@ cifs_get_file_info(struct file *filp)
>                  */
>                 rc = 0;
>                 CIFS_I(inode)->time = 0;
> +               goto cgfi_exit;
>         default:
>                 goto cgfi_exit;
>         }
> diff --git a/fs/cifs/sess.c b/fs/cifs/sess.c
> index de564368a887..6c2c42f8d893 100644
> --- a/fs/cifs/sess.c
> +++ b/fs/cifs/sess.c
> @@ -812,6 +812,7 @@ cifs_select_sectype(struct TCP_Server_Info *server, enum securityEnum requested)
>                                 return NTLMv2;
>                         if (global_secflags & CIFSSEC_MAY_NTLM)
>                                 return NTLM;
> +                       break;
>                 default:
>                         break;
>                 }
> diff --git a/fs/cifs/smbdirect.c b/fs/cifs/smbdirect.c
> index b029ed31ef91..10dfe5006792 100644
> --- a/fs/cifs/smbdirect.c
> +++ b/fs/cifs/smbdirect.c
> @@ -246,6 +246,7 @@ smbd_qp_async_error_upcall(struct ib_event *event, void *context)
>         case IB_EVENT_CQ_ERR:
>         case IB_EVENT_QP_FATAL:
>                 smbd_disconnect_rdma_connection(info);
> +               break;
>
>         default:
>                 break;
> --
> 2.27.0
>


-- 
Thanks,

Steve

