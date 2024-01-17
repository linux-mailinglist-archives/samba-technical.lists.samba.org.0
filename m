Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD5882FEE1
	for <lists+samba-technical@lfdr.de>; Wed, 17 Jan 2024 03:38:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=n3RjXI7Hh+GcQdwAHGUx/B1j21tMhV8hXjVUFEyYY7M=; b=PwC+dug5jzT/c4vNNvPARnEDCc
	c+vcrG3RhnjQ4gViJRu/ad+eCrR5xlKJXtPh8t7IFIthyGPsd2fGYcu4DFmK0UDKQDtp/f+HH445c
	gv0ajRvC5mGU6BJ5d8IFkZjz0NdjyJjfv1aahRLNkiF1AruuJXtpJjLxHxxwrjzUoZvD99zIO9NlU
	HIg/QwcruYZByJu8LRlClU3PIbFZP4inLbdiInVHWZExAPjc7ah7klkrJKoY37bt93+CjInJmIYfu
	XJVBveEoJsPMbXDf7L3k2huz2DVskUGoiIMGAFZXLM+jQPzjWa3GCDzI7H4laYMEeyBgSAggGASTo
	Tpk+dwFw==;
Received: from ip6-localhost ([::1]:21294 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rPvo9-003e6z-Lh; Wed, 17 Jan 2024 02:37:37 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:45122) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rPvo2-003e6r-SN
 for samba-technical@lists.samba.org; Wed, 17 Jan 2024 02:37:35 +0000
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50e78f1f41fso11169471e87.2
 for <samba-technical@lists.samba.org>; Tue, 16 Jan 2024 18:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705459049; x=1706063849; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n3RjXI7Hh+GcQdwAHGUx/B1j21tMhV8hXjVUFEyYY7M=;
 b=BXrCSsT3O+PY4mx96u2qyx/PnDFk+z2ZleD1CTUCFyjJsRQwhB+bLgdAE6iSlhGoqO
 LQ6acaZ2k/RSYykbbIowiLZCz70/Xx5iABPar4yI2fn9W/j31BLIkE4JJqq+9WtbDSbb
 6P6LSvGqCY8W+/HbTm+wLy9fxWQf5nK7yg9E4YrcQC22h/Dc6hvwYy/8QRd/HfM4FIqF
 FTT8IX9wp//QIyGadvWakwys5dEJfmWjzq7ZVI7WsNOhEXwDNtvohKTNIJYwQaDbmH34
 aIsecZ+YgLO4i4ozHKDVHl/nCpd4kTmwcP8cbEi5K4tV6E/xzveZacOEh4hTsbbzp86X
 qeUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705459049; x=1706063849;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n3RjXI7Hh+GcQdwAHGUx/B1j21tMhV8hXjVUFEyYY7M=;
 b=Y7Or6WfLQ/hdTFGjaRPtFmIcTp60gLTyH99tRE6p/NYQM3WxO7xTsgjWNhslPz4MLO
 jPTpJXayv/fyz+EckhMgi+PI+RE6CJGGCIZ3cb13SaqRbY28iVijpLRD0sMIwJahXYKX
 DUL2YILht/1Hw4EzJueLhMOl4Xq2zV1Bgu6ItlpJn8JO93V6CVEbQa1EFcrbkHwMiEAj
 IFOI4jxrKRkAA/HC9BnG9FRdwnT2vx8x4caeMhkZIRiTmNij/TnHepjj1ZS1uC7dDmtr
 S1IknqUIu3j+4+YkD7bh/E8pJE5RRFw5X85NaVLZ3HWWXqfBdQCxjmyPwqJFZdbeexd8
 zxmg==
X-Gm-Message-State: AOJu0YyyevcGzmxpj+jGl30kvLxsm+YevO+rzDszQGcBq3D2FyM3YL7H
 gxw87lqu0dRHbAEYGXF4IJieoGGqoHKugHLElzs=
X-Google-Smtp-Source: AGHT+IHlXPl9sCwcU8NLqkeAGIFmND77BIJ3iqBjLxTebH9GSpRoUl2SIp24HhsdTysTuhb5izRfl7oqYQvfOMFfqp8=
X-Received: by 2002:ac2:5604:0:b0:50e:8ed1:cf10 with SMTP id
 v4-20020ac25604000000b0050e8ed1cf10mr2998703lfd.42.1705459048542; Tue, 16 Jan
 2024 18:37:28 -0800 (PST)
MIME-Version: 1.0
References: <20240116105134.2245640-1-colin.i.king@gmail.com>
 <CAH2r5mvf+ZMyqpnFQUaO=DWC8ixXspsjWKE7BxQ1wW4WuvTVcA@mail.gmail.com>
In-Reply-To: <CAH2r5mvf+ZMyqpnFQUaO=DWC8ixXspsjWKE7BxQ1wW4WuvTVcA@mail.gmail.com>
Date: Wed, 17 Jan 2024 08:07:17 +0530
Message-ID: <CANT5p=r=y4BN-1eeSur_zWCx=R1fn+8OU-3nv+AffraPjja+qQ@mail.gmail.com>
Subject: Re: [PATCH][next] cifs: remove redundant variable tcon_exist
To: Steve French <smfrench@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Shyam Prasad N via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shyam Prasad N <nspmangalore@gmail.com>
Cc: Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>,
 Shyam Prasad N <sprasad@microsoft.com>, linux-cifs@vger.kernel.org,
 kernel-janitors@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, Steve French <sfrench@samba.org>,
 Colin Ian King <colin.i.king@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jan 17, 2024 at 4:47=E2=80=AFAM Steve French <smfrench@gmail.com> w=
rote:
>
> Yes - it looks like Shyam's commit made that variable obsolete.
>
> Shyam/Paulo,
> Let me know if any objections.  Will put into cifs-2.6.git for-next
>
> commit 04909192ada3285070f8ced0af7f07735478b364 (tag: 6.7-rc4-smb3-client=
-fixes)
> Author: Shyam Prasad N <sprasad@microsoft.com>
> Date:   Wed Dec 6 16:37:38 2023 +0000
>
>     cifs: reconnect worker should take reference on server struct
> unconditionally
>
>     Reconnect worker currently assumes that the server struct
>     is alive and only takes reference on the server if it needs
>     to call smb2_reconnect.
>
>     With the new ability to disable channels based on whether the
>     server has multichannel disabled, this becomes a problem when
>     we need to disable established channels. While disabling the
>     channels and deallocating the server, there could be reconnect
>     work that could not be cancelled (because it started).
>
>     This change forces the reconnect worker to unconditionally
>     take a reference on the server when it runs.
>
>     Also, this change now allows smb2_reconnect to know if it was
>     called by the reconnect worker. Based on this, the cifs_put_tcp_sessi=
on
>     can decide whether it can cancel the reconnect work synchronously or =
not.
>
>     Signed-off-by: Shyam Prasad N <sprasad@microsoft.com>
>     Signed-off-by: Steve French <stfrench@microsoft.com>
>
> On Tue, Jan 16, 2024 at 4:51=E2=80=AFAM Colin Ian King <colin.i.king@gmai=
l.com> wrote:
> >
> > The variable tcon_exist is being assigned however it is never read, the
> > variable is redundant and can be removed.
> >
> > Cleans up clang scan build warning:
> > warning: Although the value stored to 'tcon_exist' is used in
> > the enclosing expression, the value is never actually readfrom
> > 'tcon_exist' [deadcode.DeadStores]
> >
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> > ---
> >  fs/smb/client/smb2pdu.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/fs/smb/client/smb2pdu.c b/fs/smb/client/smb2pdu.c
> > index bd25c34dc398..50f6bf16b624 100644
> > --- a/fs/smb/client/smb2pdu.c
> > +++ b/fs/smb/client/smb2pdu.c
> > @@ -3918,7 +3918,7 @@ void smb2_reconnect_server(struct work_struct *wo=
rk)
> >         struct cifs_ses *ses, *ses2;
> >         struct cifs_tcon *tcon, *tcon2;
> >         struct list_head tmp_list, tmp_ses_list;
> > -       bool tcon_exist =3D false, ses_exist =3D false;
> > +       bool ses_exist =3D false;
> >         bool tcon_selected =3D false;
> >         int rc;
> >         bool resched =3D false;
> > @@ -3964,7 +3964,7 @@ void smb2_reconnect_server(struct work_struct *wo=
rk)
> >                         if (tcon->need_reconnect || tcon->need_reopen_f=
iles) {
> >                                 tcon->tc_count++;
> >                                 list_add_tail(&tcon->rlist, &tmp_list);
> > -                               tcon_selected =3D tcon_exist =3D true;
> > +                               tcon_selected =3D true;
> >                         }
> >                 }
> >                 /*
> > @@ -3973,7 +3973,7 @@ void smb2_reconnect_server(struct work_struct *wo=
rk)
> >                  */
> >                 if (ses->tcon_ipc && ses->tcon_ipc->need_reconnect) {
> >                         list_add_tail(&ses->tcon_ipc->rlist, &tmp_list)=
;
> > -                       tcon_selected =3D tcon_exist =3D true;
> > +                       tcon_selected =3D true;
> >                         cifs_smb_ses_inc_refcount(ses);
> >                 }
> >                 /*
> > --
> > 2.39.2
> >
> >
>
>
> --
> Thanks,
>
> Steve
>

The change looks good to me.

--=20
Regards,
Shyam

