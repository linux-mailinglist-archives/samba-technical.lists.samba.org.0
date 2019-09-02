Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD74A5CCD
	for <lists+samba-technical@lfdr.de>; Mon,  2 Sep 2019 21:43:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=QnCqjttPsD9VOItZgQKR8PHxubyIWfecxGB1z85kRaA=; b=cghI+Pjc/GuU6O/+sWNXcsl5sN
	ujqXEMDaTkChgpssrIklPQeC65rNigvZZisM7yaAMg0MIYKsTgfLDIzcRw/jp92xVagRr2PcRkO3E
	YiYouXNaOVMpxkvAifo7RyzStkRvygPPbKmVt89T+M+h80iI2pclu6G/AZQPNVk4ampCMZ1TBe5CT
	Oa6QC58vzdseSRTsu2V8vcuVcl7/vUhEgBPp76Jx/WTbS4Wgbpgfk/lmCRpy7ooH8Lsmyz2KADnIw
	jJtB0Z2ghV+MP5wvvqb5/i6OwOxfwoqdE8j2QHoWG8VqG+N3W5xOqol9yjl9qK1y7WcVxc3XunzqV
	u4cgAAuQ==;
Received: from localhost ([::1]:46496 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i4sE1-0033Tb-L9; Mon, 02 Sep 2019 19:42:53 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:45159) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i4sDw-0033TU-K1
 for samba-technical@lists.samba.org; Mon, 02 Sep 2019 19:42:51 +0000
Received: by mail-io1-xd44.google.com with SMTP id f12so13495902iog.12
 for <samba-technical@lists.samba.org>; Mon, 02 Sep 2019 12:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QnCqjttPsD9VOItZgQKR8PHxubyIWfecxGB1z85kRaA=;
 b=drk3pFKrwK38hMeRXxVG2/nOt7S70Pfl9vl3UrDB/SaQoNBjlHvB0wWXFsN+vGsWPL
 8lXwNSZhUfDAWlfNVUnhJv+pfSH9ZgqRoBfr1Kcc+BBYYDcuN2p65XDjF538ynOkczuK
 wRFtpxcgV1311tVqcH3hbqFBDIXln5wgwCjlbZFTNBNubr8ISIcFOJlOZwSs+d+mHpQ+
 cXrlhW+3yaMM4aqB4guKpTKEUawxMOsiDKUvFDGsiEL9+HGqB3c3muIkkPF3LxiQSZL/
 xmBNYgivufdorFGF+XdUVNhY/sMGsiaWwl0tHBewkKDTfPWu6mkl0VOPS5CgQE7ynN6B
 G2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QnCqjttPsD9VOItZgQKR8PHxubyIWfecxGB1z85kRaA=;
 b=RGCW9A0I+gH1dHjiFGRImP2EzJIWLSt2D/6EZx5fPeK+Y3Mr7S/Kn64nBCRYhLX36N
 OdKUn3MHwQw1z8IkJlVnXaEXI6jrA3EhxWmg1Wd38AuLfwg6X9iaAxKy5cY1as9mhlSK
 YnnVTnZAqkaJ20Afnls4OwLQFA8kO736E+x5STBkrccTFuvPZuO5M84pfqZKoKYrdrfI
 DNux+PmLzScL8mbi9Jb8bgVp1JuxObC3IeWBcV8BKlKtaJ3rXlO+YR2snPb16MDSeNOE
 vEQgeqzpg77yX9Ch+Q6o/NZwRTC4CiWdIxrI6Qd2BTk1y8SMv/8Jm9bZ5O7zeiQDMq/X
 pN/Q==
X-Gm-Message-State: APjAAAXQcg7sWV3ykk+BlKH8JKa58h8D0dsmuhEDN8UrAyB+ZlH7xeER
 xqZ5/6LlGffAp8nKnyrk+w79PeHgukqgVlCJ+R4=
X-Google-Smtp-Source: APXvYqz0ig3Ou3gySoBUVnZyPjYLAcAupHpExck2qSURcqM7IatpW8/XwvrGxI/vgiYJ8fO0ibOunmPv31vCfW2Exhs=
X-Received: by 2002:a5d:9c4c:: with SMTP id 12mr15389478iof.5.1567453365705;
 Mon, 02 Sep 2019 12:42:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190902151059.22088-1-colin.king@canonical.com>
In-Reply-To: <20190902151059.22088-1-colin.king@canonical.com>
Date: Mon, 2 Sep 2019 14:42:34 -0500
Message-ID: <CAH2r5mv_Fv_k8h=-i8-bBrgBU3ghCVM3W=KyLrL=LrrCiT=vOQ@mail.gmail.com>
Subject: Re: [PATCH][V2][cifs-next] cifs: fix dereference on ses before it is
 null checked
To: Colin King <colin.king@canonical.com>
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
 kernel-janitors <kernel-janitors@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Tentatively merged into cifs-2.6.git pending additional testing

Kicked off buildbot with rc7+patches in cifs for-next

See http://smb3-test-rhel-75.southcentralus.cloudapp.azure.com/#/builders/2/builds/247

On Mon, Sep 2, 2019 at 10:33 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The assignment of pointer server dereferences pointer ses, however,
> this dereference occurs before ses is null checked and hence we
> have a potential null pointer dereference.  Fix this by only
> dereferencing ses after it has been null checked.
>
> Addresses-Coverity: ("Dereference before null check")
> Fixes: 2808c6639104 ("cifs: add new debugging macro cifs_server_dbg")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/cifs/smb2pdu.c   | 11 ++++++++---
>  fs/cifs/transport.c |  3 ++-
>  2 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
> index dbc6ef50dd45..0e92983de0b7 100644
> --- a/fs/cifs/smb2pdu.c
> +++ b/fs/cifs/smb2pdu.c
> @@ -2759,8 +2759,10 @@ SMB2_ioctl(const unsigned int xid, struct cifs_tcon *tcon, u64 persistent_fid,
>         else
>                 return -EIO;
>
> +       if (!ses)
> +               return -EIO;
>         server = ses->server;
> -       if (!ses || !(server))
> +       if (!server)
>                 return -EIO;
>
>         if (smb3_encryption_required(tcon))
> @@ -3058,13 +3060,16 @@ query_info(const unsigned int xid, struct cifs_tcon *tcon,
>         int rc = 0;
>         int resp_buftype = CIFS_NO_BUFFER;
>         struct cifs_ses *ses = tcon->ses;
> -       struct TCP_Server_Info *server = ses->server;
> +       struct TCP_Server_Info *server;
>         int flags = 0;
>         bool allocated = false;
>
>         cifs_dbg(FYI, "Query Info\n");
>
> -       if (!ses || !(server))
> +       if (!ses)
> +               return -EIO;
> +       server = ses->server;
> +       if (!server)
>                 return -EIO;
>
>         if (smb3_encryption_required(tcon))
> diff --git a/fs/cifs/transport.c b/fs/cifs/transport.c
> index 0d60bd2f4dca..a90bd4d75b4d 100644
> --- a/fs/cifs/transport.c
> +++ b/fs/cifs/transport.c
> @@ -1242,12 +1242,13 @@ SendReceive(const unsigned int xid, struct cifs_ses *ses,
>         struct kvec iov = { .iov_base = in_buf, .iov_len = len };
>         struct smb_rqst rqst = { .rq_iov = &iov, .rq_nvec = 1 };
>         struct cifs_credits credits = { .value = 1, .instance = 0 };
> -       struct TCP_Server_Info *server = ses->server;
> +       struct TCP_Server_Info *server;
>
>         if (ses == NULL) {
>                 cifs_dbg(VFS, "Null smb session\n");
>                 return -EIO;
>         }
> +       server = ses->server;
>         if (server == NULL) {
>                 cifs_dbg(VFS, "Null tcp session\n");
>                 return -EIO;
> --
> 2.20.1
>


-- 
Thanks,

Steve

