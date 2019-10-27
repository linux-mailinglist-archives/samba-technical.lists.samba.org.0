Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F22C5E6535
	for <lists+samba-technical@lfdr.de>; Sun, 27 Oct 2019 21:02:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=mL2/uY8sNZ32Rr7//p8MD1BFGfeEFAqFolzQ51gp8xY=; b=0sni1wvXMQrc+aE931m/EAuRuK
	ULqVycUaxt1CReYMPQN20tyIyReI7dH7KgrNuKv/vsZZnU+yYXCRaIptmsyAtZhyKLN/eP5WIln4E
	eqS0ze4DqvPRP5m85enKJBgXcdFmYt2TLXvpGP355mY9CxN5S5jXeY4+h2MFG6+S+iDzAMxPbE61j
	dXKjeDp51ZyTMwAMR//udkuWB2eekHRudlcZQ9FB1N9jawjx5rZJHDZuZyy+1nNV/uslQUJwdY3Uo
	LwfGuFqCbBtTq7Ouhy/ib29xUXWi5LgV7WiDp5U8+Jk22/PV47xqiqT4XXLNH7wKQqNizPgwp8c+f
	Sm1zISeA==;
Received: from localhost ([::1]:30182 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iOokV-002rD4-1g; Sun, 27 Oct 2019 20:02:51 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:41512) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iOokQ-002rCx-Fo
 for samba-technical@lists.samba.org; Sun, 27 Oct 2019 20:02:48 +0000
Received: by mail-il1-x143.google.com with SMTP id z10so6196097ilo.8
 for <samba-technical@lists.samba.org>; Sun, 27 Oct 2019 13:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mL2/uY8sNZ32Rr7//p8MD1BFGfeEFAqFolzQ51gp8xY=;
 b=EN/R/SDwszFb6hccaqaQb7G4qhXpmMD5YOUtOkQ7NjDj6vdMM+09pkphi9tg4T863/
 JpKIGi81NeF8cO7oIlwng3w2FgUOrG4jy1q/DgK+ziMzA3kE0PM/UQ2nCGxAaiVpaljo
 RBqEg8bcjeAvsHvTdcxaaiAsAjsFgc3YX04mbwjFpeGZ9IV9Atu9gQX743phd6wMfvOb
 36V/GLbH2F+9NgJ9Qfq93P1LnrU7CE2vDTBni0gOVNO480ag3wk+TxYUKxGNbBn8nEbi
 RbaVkF/7eJCOsX5U2QKc7W0aAhdBOBNGVAh84v1a7ecOhKb/OUf1zNF9wOwrScdhhpMP
 DXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mL2/uY8sNZ32Rr7//p8MD1BFGfeEFAqFolzQ51gp8xY=;
 b=f+iYCH9PXyX83QdtzuZbSOjFmP0RANXKSnoidIPMkgQ6wpNNWJAhjO6ACTMtMh4+aX
 U5Ro8q+Kng+m1UYXGR/Cj+cn3mk20yxH/4aew3oaXdLJtgj6nKfoN0vtroiAKUmVqGRO
 0gMd8bdMZiJ0OBs5HTGxTGtvMaw4gi8UVMVnpsWGTg5BIjWC8D2RuZQky/y5cq7slzeC
 7kSJyCPYn3ObuVh9pcDCU7esxEkXfuiW/WqNTU90bZBTmW3UxA8ka770tH/nVPuj+7zg
 Q3XannV/qw8gNqRpc/jGHtRSNNsALcUHVPNYDoX4Nwbw7IX8c/Ulgit3OfHwiatlZURU
 bnJQ==
X-Gm-Message-State: APjAAAUMOEDP4PfZ8gS/BSv+NftKz/n9tFoEUSU/aBQCAH4hnFIz31od
 0ZLhSXkmuUwpbpPQRqZBZ7OHVHLnW4wphNotT7c=
X-Google-Smtp-Source: APXvYqxNjKxlIi5unG0uD7UP+ivcHGeLfqrhGORTFOvQRmgbmvSnID6uJuhwO+QRbphdQnDOM0AEc6oprVcW+x+HbCg=
X-Received: by 2002:a92:48d8:: with SMTP id j85mr16121970ilg.272.1572206564433; 
 Sun, 27 Oct 2019 13:02:44 -0700 (PDT)
MIME-Version: 1.0
References: <1571259116-102015-1-git-send-email-longli@linuxonhyperv.com>
 <1571259116-102015-8-git-send-email-longli@linuxonhyperv.com>
In-Reply-To: <1571259116-102015-8-git-send-email-longli@linuxonhyperv.com>
Date: Sun, 27 Oct 2019 15:02:33 -0500
Message-ID: <CAH2r5mtx9OaQ6tdXPEh5rsB=fVjMfNBFf+xBLdSrjNR9PhMruw@mail.gmail.com>
Subject: Re: [PATCH 7/7] cifs: smbd: Return -EAGAIN when transport is
 reconnecting
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

Tentatively merged the 7 patch series into cifs-2.6.git for-next
pending more reviews and xfstests regression testing runs

On Wed, Oct 16, 2019 at 4:11 PM longli--- via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> From: Long Li <longli@microsoft.com>
>
> During reconnecting, the transport may have already been destroyed and is in
> the process being reconnected. In this case, return -EAGAIN to not fail and
> to retry this I/O.
>
> Signed-off-by: Long Li <longli@microsoft.com>
> Cc: stable@vger.kernel.org
> ---
>  fs/cifs/transport.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/fs/cifs/transport.c b/fs/cifs/transport.c
> index afe66f9cb15e..66fde7bfec4f 100644
> --- a/fs/cifs/transport.c
> +++ b/fs/cifs/transport.c
> @@ -318,8 +318,11 @@ __smb_send_rqst(struct TCP_Server_Info *server, int num_rqst,
>         int val = 1;
>         __be32 rfc1002_marker;
>
> -       if (cifs_rdma_enabled(server) && server->smbd_conn) {
> -               rc = smbd_send(server, num_rqst, rqst);
> +       if (cifs_rdma_enabled(server)) {
> +               /* return -EAGAIN when connecting or reconnecting */
> +               rc = -EAGAIN;
> +               if (server->smbd_conn)
> +                       rc = smbd_send(server, num_rqst, rqst);
>                 goto smbd_done;
>         }
>
> --
> 2.17.1
>
>


-- 
Thanks,

Steve

