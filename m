Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E105D4E4BDF
	for <lists+samba-technical@lfdr.de>; Wed, 23 Mar 2022 05:21:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=pc/hvVo0/6NKpglRsU7c5DEB6PgMyaUIQfdPH5do0+I=; b=bQNGuJ6wuw/iYm3VWo0mXFgl9r
	mx58kSIpzcdzV6W58edXEkVkR97IY/r9XPgoNzSptH1N0ideOOVkjwuAUGbbFgfDl9nOD9SXLg8Lc
	H1cue/QnkMGaB14KSZ63OG6JzSqe0HnvFmedvwx3KVs5jPzu3qXJw08uKg/i3mTjrCcfHossAKGWD
	0r4B5Fixg57z0ZeSiCHAxsXgyeYdwf7i++hBzVOwOEU6NsijX64l4TbPtaE5yHHgtsTXqVvVs/hbs
	mZ/xF5UxEP2UpKogp+yDyGAmlfu9rutTZDcg9bMYvSLtM4no/ZOJY9l9ur7ohGMnwQ814EZF08VcG
	Rm3ttXrw==;
Received: from ip6-localhost ([::1]:59670 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nWsUH-004J4f-Ew; Wed, 23 Mar 2022 04:20:45 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:43532) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nWsU8-004J4U-Qr
 for samba-technical@lists.samba.org; Wed, 23 Mar 2022 04:20:42 +0000
Received: by mail-lf1-x12a.google.com with SMTP id a26so681286lfg.10
 for <samba-technical@lists.samba.org>; Tue, 22 Mar 2022 21:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pc/hvVo0/6NKpglRsU7c5DEB6PgMyaUIQfdPH5do0+I=;
 b=B8/vZ43epAmy3zm8teeKI/qHOROvXFw2pqqi7vPAPsEBeqdMz8Pt+h2wZ75zku3TYT
 WbFHYje2B7Eya5XOrU0sGzEfJjtzxRE93umNgv0tFao6nRnN/QmNlr5CwVxFsI93yrko
 Tpmsc2fYdj/G7lzLS+knpFvtAmnbzsj+rXPPPleQHeB5Pa3NzRK0le7btPS3JN/L+pZw
 IOSWaV0xPtckwXx7Uy0KFi2gzLl5BdtQGDcuUwWzJzvnS/byEQ1G1I1gaNI6gGDZQfhe
 S6slYlZOiCR/YWzOPr6PtjElWmwZTS/9TPCEJswqoTSI7biWZ6b0VX8poP9b2E5q/tY4
 xQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pc/hvVo0/6NKpglRsU7c5DEB6PgMyaUIQfdPH5do0+I=;
 b=q53VvXXJ6F2KnumegJN8SQ7+mN7RqKrc8dCmid1udk7X+EwQDwbuV5DOC6iMlfnwJW
 jOacY4I396LV/y4LPbeVwojd35oDlloQx2VRsJ3watyKqfODaNNQLZvCuBwJWaku/+Bi
 cx5dNIT/FdwQiOpeCLX/QuGIBhdTUfFPjvor9Yj0TNixeNLiKmcpfbhzxxKiWHKSYnT6
 97qxn5D9x1YJn0E2kH4mSJTJcZ7L1nmzriQ9QMrLskHe6ERJs6WcwKXKBWFLdNTbxvLE
 GDEcWg1WS6hfjURXri73sFvOb5dDVLY1wXcX/X+0zWBYTSTXr2IUW1oVIn9/DQWo+8DC
 Othg==
X-Gm-Message-State: AOAM530iN/wXlvljoDT7woLX1OROrTHtPVHugoaPyQDJTf3qfK0OfyBF
 30Za2Tc1fSLj3dS92hNlL0Maeh6U9HMwjJybo5s=
X-Google-Smtp-Source: ABdhPJwYUD5lEyXExITlf9Ho8r5Y0Xi7y7bkZfLHtNb1ieORDpPSd1WYv2KM4NKaeou5qsHbZLInXFMrkn3nqTaCftY=
X-Received: by 2002:a05:6512:b19:b0:446:f1c6:81bd with SMTP id
 w25-20020a0565120b1900b00446f1c681bdmr20966035lfu.320.1648009232002; Tue, 22
 Mar 2022 21:20:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220320135015.19794-1-xiam0nd.tong@gmail.com>
 <CANT5p=qEmVtgC5gD5G3D1o+7mxLMpQawnh0DSY+dLD-Dyrw5Uw@mail.gmail.com>
In-Reply-To: <CANT5p=qEmVtgC5gD5G3D1o+7mxLMpQawnh0DSY+dLD-Dyrw5Uw@mail.gmail.com>
Date: Tue, 22 Mar 2022 23:20:21 -0500
Message-ID: <CAH2r5mu-Ci=HL+BkeEYVkW8Qc9jCW7ma7a_yK4-70MgoJgJkhA@mail.gmail.com>
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

tentatively merged into cifs-2.6.git for-next pending additional testing

Also added cc:stable 5.17

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

