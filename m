Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C542D599537
	for <lists+samba-technical@lfdr.de>; Fri, 19 Aug 2022 08:21:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=0MSWc7wdb4JmTnyiY3TNYUbqrM+fW7halymViKhckH0=; b=WIJd2sAAGLcLiIJTmKAlMiPTwf
	sPWtosiONmzsaPSU8z0JOfZc8NEGwCyOa4NEcdMQdtGGwFS55clA0aDYLU0CkXAbDpgDNrP9mvHQK
	ZbJQtzUXs7/2ZRnOaw+QsbPORFbmVLHAbNeW4dZmlnvPZq6cgcrdfBTI0PsCry11xd2a19P2vNTOF
	jneionqiEmgrIFa50ilc52l4AHBNSEJxw4sOV0ORKkcudFh8SmoH2l8YvzrvH5XRbmjymSWFHB2L3
	qVFyDnLnuYs91V/ZZX+3j+ylHB0n8HpQe8aqw9+sO2hsa7RWDhNp66YfSXg8shKzLk4oMSk/6V/PT
	vHdliHQw==;
Received: from ip6-localhost ([::1]:22230 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oOvMw-001KEd-TZ; Fri, 19 Aug 2022 06:20:34 +0000
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930]:39734) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oOvMq-001KEU-9x
 for samba-technical@lists.samba.org; Fri, 19 Aug 2022 06:20:31 +0000
Received: by mail-ua1-x930.google.com with SMTP id i5so1448415uat.6
 for <samba-technical@lists.samba.org>; Thu, 18 Aug 2022 23:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=0MSWc7wdb4JmTnyiY3TNYUbqrM+fW7halymViKhckH0=;
 b=ldS6CT+CSIK1ONsRd4HFvX5zLNhbwOSmfYXGXtouMr+obCzSyvKuevfrvhdq9568Tf
 rfa6MxqeABVgMEcTGyshxoXuxXa9gl4AuwAaPLNZ3ekA0qZKoig9MT8Go5qMKM0vtu/K
 uR6ifXy80K0kwL3BXvLdZnJiY+LiGdkInUmrd3D1WtZaOvhhare2mc707N79qXaHATAA
 sDsEORXOqx8O+GCqes40t2SC+n8f82bIjnV9w30Jwr3Id/5O54G1eDQV8ebxdKEsKdwz
 UHdZaGW09CuOHSCJ6ZA2LD7GHZ3ICNYjW4k9XSi2AYnK4ADMLbiKN8IbpslU7chE6epU
 dwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=0MSWc7wdb4JmTnyiY3TNYUbqrM+fW7halymViKhckH0=;
 b=Yjdz5hzA+CRdMyh8hYYh3v1W7KxgFB0Ie4bOaPR7ygKqSmiNFY3fXp8psrj3mvRt/V
 AzkRFzPXWsAoc4Spb9Q4ERwouWQqPHYMOS4Y5j4DtwKzvlZcz8FB2uMf3i5NEYX7WG2L
 9PIXqR+49q4FL7MC289NbfaYc/7mRYlP0ji6cVm7ApdkPn/wj4G3c5aVViNotBlg19MP
 TXmytF4MnMemYkVdm1syS/8WclJ0N5KQUdA0TkfukYFD48d2VCcxExkj9bc+SM1bXNAG
 ZuySS5Aqy6k7FqkVcMt14QSgJc9LVAVFtucvh6/Kf1NzmxvmfCEMajk+UkoYe40sq6IJ
 3kfQ==
X-Gm-Message-State: ACgBeo1reriWpn/umjHz3iXnb9OxPJrRAG5YCQH0QJenisBPolM8Rr/F
 5sHDDb+IS3wPqNEu9ZRXmRiFf6MWuPhpZzPDpkc=
X-Google-Smtp-Source: AA6agR6FNSsP/9mrdqwlhKF+kOZqYewx8f9uLyJBK/GqLrNmGE86ASbR883Y2sokThy2rEEDu1AZojaH4LFG/Bxwwgg=
X-Received: by 2002:ab0:3bc6:0:b0:381:c4db:ef5 with SMTP id
 q6-20020ab03bc6000000b00381c4db0ef5mr2542135uaw.81.1660890025731; Thu, 18 Aug
 2022 23:20:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220818210142.7867-1-wsa+renesas@sang-engineering.com>
 <CAH2r5muBD8AV51ZQMapGoXyF=5Mk0GW2tYz2ng9XrhKRp_b96g@mail.gmail.com>
In-Reply-To: <CAH2r5muBD8AV51ZQMapGoXyF=5Mk0GW2tYz2ng9XrhKRp_b96g@mail.gmail.com>
Date: Fri, 19 Aug 2022 01:20:14 -0500
Message-ID: <CAH2r5mt9Qs+Mb5Fj6xSOADcDZdggxALuxdDr6bd5HHzi2Z6WHw@mail.gmail.com>
Subject: Re: [PATCH] cifs: move from strlcpy with unused retval to strscpy
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>, Shyam Prasad N <sprasad@microsoft.com>,
 Paulo Alcantara <pc@cjr.nz>, samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Ronnie Sahlberg <lsahlber@redhat.com>,
 Steve French <sfrench@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

tentatively merged into cifs-2.6.git for-next pending testing

On Fri, Aug 19, 2022 at 12:00 AM Steve French <smfrench@gmail.com> wrote:
>
> Looks fine.   Do you want this merged through my tree?
>
> On Thu, Aug 18, 2022 at 4:11 PM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> >
> > Follow the advice of the below link and prefer 'strscpy' in this
> > subsystem. Conversion is 1:1 because the return value is not used.
> > Generated by a coccinelle script.
> >
> > Link: https://lore.kernel.org/r/CAHk-=wgfRnXz0W3D37d01q3JFkr_i_uTL=V6A6G1oUZcprmknw@mail.gmail.com/
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >  fs/cifs/cifsroot.c | 2 +-
> >  fs/cifs/connect.c  | 2 +-
> >  fs/cifs/smb2pdu.c  | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/fs/cifs/cifsroot.c b/fs/cifs/cifsroot.c
> > index 9e91a5a40aae..56ec1b233f52 100644
> > --- a/fs/cifs/cifsroot.c
> > +++ b/fs/cifs/cifsroot.c
> > @@ -59,7 +59,7 @@ static int __init cifs_root_setup(char *line)
> >                         pr_err("Root-CIFS: UNC path too long\n");
> >                         return 1;
> >                 }
> > -               strlcpy(root_dev, line, len);
> > +               strscpy(root_dev, line, len);
> >                 srvaddr = parse_srvaddr(&line[2], s);
> >                 if (*s) {
> >                         int n = snprintf(root_opts,
> > diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
> > index 9111c025bcb8..3da5da9f16b0 100644
> > --- a/fs/cifs/connect.c
> > +++ b/fs/cifs/connect.c
> > @@ -3994,7 +3994,7 @@ CIFSTCon(const unsigned int xid, struct cifs_ses *ses,
> >                 }
> >                 bcc_ptr += length + 1;
> >                 bytes_left -= (length + 1);
> > -               strlcpy(tcon->treeName, tree, sizeof(tcon->treeName));
> > +               strscpy(tcon->treeName, tree, sizeof(tcon->treeName));
> >
> >                 /* mostly informational -- no need to fail on error here */
> >                 kfree(tcon->nativeFileSystem);
> > diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
> > index 9b31ea946d45..9958b5f1c12f 100644
> > --- a/fs/cifs/smb2pdu.c
> > +++ b/fs/cifs/smb2pdu.c
> > @@ -1928,7 +1928,7 @@ SMB2_tcon(const unsigned int xid, struct cifs_ses *ses, const char *tree,
> >         tcon->capabilities = rsp->Capabilities; /* we keep caps little endian */
> >         tcon->maximal_access = le32_to_cpu(rsp->MaximalAccess);
> >         tcon->tid = le32_to_cpu(rsp->hdr.Id.SyncId.TreeId);
> > -       strlcpy(tcon->treeName, tree, sizeof(tcon->treeName));
> > +       strscpy(tcon->treeName, tree, sizeof(tcon->treeName));
> >
> >         if ((rsp->Capabilities & SMB2_SHARE_CAP_DFS) &&
> >             ((tcon->share_flags & SHI1005_FLAGS_DFS) == 0))
> > --
> > 2.35.1
> >
>
>
> --
> Thanks,
>
> Steve



-- 
Thanks,

Steve

