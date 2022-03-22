Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D2E4E417C
	for <lists+samba-technical@lfdr.de>; Tue, 22 Mar 2022 15:37:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=4QFC7wD2f8NyrU+V9IfhPZZ4570NNl/bW6dl2S6xb70=; b=YiZbofdwfHva5Fx7tm+BGcmP7k
	TJgInNr878P1JYdU80EWIcjw6Vq9ue/YD8qUDNMSkwgfh8WJc9vrvgu46/DHYUemenpklKzo/Ner4
	NT/sHg00us9KvBcLL0x3ZUdTPtQx/p2NSOuc4ACYg+Lg4AEnk1vYzDvcrQxXVsqVQD1RSKCK/GnUj
	r7NTyGLy8DZDjiLf2ulkyjJcdDLL+2oRIRUD8IU+4WhFPQjc3W20788UfoKrFPBWS0ZSxlJN6+i/I
	uIwfBvZI8jChJSjjgW48Bkkg7ol1QXWQLkjV3Mv5vz1i5loRyPj1u05rbEjIAMEfC1YJBWMibUNsQ
	TRlzRsaQ==;
Received: from ip6-localhost ([::1]:49458 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nWfcC-004Cml-0O; Tue, 22 Mar 2022 14:36:04 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:42982) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nWfc3-004Cmb-Uu
 for samba-technical@lists.samba.org; Tue, 22 Mar 2022 14:36:01 +0000
Received: by mail-lj1-x231.google.com with SMTP id c15so24192131ljr.9
 for <samba-technical@lists.samba.org>; Tue, 22 Mar 2022 07:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4QFC7wD2f8NyrU+V9IfhPZZ4570NNl/bW6dl2S6xb70=;
 b=aqQvPSoYUzAWoKP+RCT+gNjGBZouHYy4cFxwXmHNsxpveBX1AbqI4qAQseLuM16i9l
 u3fUgLs14FkrsUZV5PAu92WLy2W7ULyVESU8Od7eevwqlJG1O2iwho79otrCaVJMgs15
 nJRcjDXvz3nfTywN3ul13P3FUZdpkjxWVIKqvrgYh/Gw424bntpDaAu09W1ZBFAlJ0As
 NKf6pgToW0daQpmrOXBKlEpi39dIUSR87VgSc4qCzD0aXO3s+ULvPnen/HFzPMjN1d4r
 C3rOafuAoNgVHMfomlFwB6O+4tTQXJ7gL7sloP6o8jLc/Y5wQenhFy3YwXrKJrpCDhv3
 WDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4QFC7wD2f8NyrU+V9IfhPZZ4570NNl/bW6dl2S6xb70=;
 b=nIbeNK9oHdCb8IQ6uIkQYZM3ucxlcZIQf23g45S9kLEr7avHUjsSeMfi/6tQ/MX3c6
 lA3Uu4BqQgO1g9R6EqqspkpA0tK5psl2eKukg9ZnLhtVyWjx2E+QCdORgGnTES8P51MT
 Mv7BcbXP2W+uIwIIRC1Va4yihxQfmENcAKFuGiPgd2GMPA0Meb7ftf6aN+uKIdNXjaEs
 J9Dx6I/VVVZqt4H9tM4n1G9GNjex378+z/GQFmBDWRPabiyBdGb0m4P0tV3nlcndShDQ
 iM/QJCh6JhO1EtQXsANn/IXcfgshWqmEXPz3g8f/uTopRoQ9Ud0bHtg5FAfNMApR/saZ
 /Nyg==
X-Gm-Message-State: AOAM532R62bXoFv5pMY5Cc40D0FpvSx7NQViPw+o1jB4XuY7XiLzeu3C
 LyTrQaje3BwcAnqhUN1ZNmBiMYkqWfnYyIy7AwU=
X-Google-Smtp-Source: ABdhPJxJQKTW5hv1D0gmq2yXlJ4T7YlsKgTYCESts6Cvaqq0CfEzlbpWzWt3qw7q55yP02e5yHf9+9pFbabmZ666h8M=
X-Received: by 2002:a05:651c:1597:b0:247:f79c:5794 with SMTP id
 h23-20020a05651c159700b00247f79c5794mr18473828ljq.398.1647959754588; Tue, 22
 Mar 2022 07:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220320135015.19794-1-xiam0nd.tong@gmail.com>
 <CANT5p=qEmVtgC5gD5G3D1o+7mxLMpQawnh0DSY+dLD-Dyrw5Uw@mail.gmail.com>
In-Reply-To: <CANT5p=qEmVtgC5gD5G3D1o+7mxLMpQawnh0DSY+dLD-Dyrw5Uw@mail.gmail.com>
Date: Tue, 22 Mar 2022 09:35:43 -0500
Message-ID: <CAH2r5mv0mEYDofMrOrkpqE1PLYt9rYa9fAi-cjihR3x2MF0v3w@mail.gmail.com>
Subject: Re: [PATCH] cifs: fix incorrect use of list iterator after the loop
To: Shyam Prasad N <nspmangalore@gmail.com>
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
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Steven French <sfrench@samba.org>,
 Xiaomeng Tong <xiam0nd.tong@gmail.com>, jakobkoschel@gmail.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

cc:stable too?

On Tue, Mar 22, 2022 at 1:09 AM Shyam Prasad N via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> On Mon, Mar 21, 2022 at 3:50 PM Xiaomeng Tong <xiam0nd.tong@gmail.com> wrote:
> >
> > The bug is here:
> > if (!tcon) {
> >         resched = true;
> >         list_del_init(&ses->rlist);
> >         cifs_put_smb_ses(ses);
> >
> > Because the list_for_each_entry() never exits early (without any
> > break/goto/return inside the loop), the iterator 'ses' after the
> > loop will always be an pointer to a invalid struct containing the
> > HEAD (&pserver->smb_ses_list). As a result, the uses of 'ses' above
> > will lead to a invalid memory access.
> >
> > The original intention should have been to walk each entry 'ses' in
> > '&tmp_ses_list', delete '&ses->rlist' and put 'ses'. So fix it with
> > a list_for_each_entry_safe().
> >
> > Fixes: 3663c9045f51a ("cifs: check reconnects for channels of active tcons too")
> > Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
> > ---
> >  fs/cifs/smb2pdu.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
> > index 7e7909b1ae11..f82d6fcb5c64 100644
> > --- a/fs/cifs/smb2pdu.c
> > +++ b/fs/cifs/smb2pdu.c
> > @@ -3858,8 +3858,10 @@ void smb2_reconnect_server(struct work_struct *work)
> >         tcon = kzalloc(sizeof(struct cifs_tcon), GFP_KERNEL);
> >         if (!tcon) {
> >                 resched = true;
> > -               list_del_init(&ses->rlist);
> > -               cifs_put_smb_ses(ses);
> > +               list_for_each_entry_safe(ses, ses2, &tmp_ses_list, rlist) {
> > +                       list_del_init(&ses->rlist);
> > +                       cifs_put_smb_ses(ses);
> > +               }
> >                 goto done;
> >         }
> >
> >
> > base-commit: 14702b3b2438e2f2d07ae93b5d695c166e5c83d1
> > --
> > 2.17.1
> >
>
> Hi Xiaomeng,
> Good catch.
> Reviewed-by: Shyam Prasad N <sprasad@microsoft.com>
>
> Steve, This one needs to be marked for CC stable 5.17+
>
> --
> Regards,
> Shyam
>


-- 
Thanks,

Steve

