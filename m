Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3E816A29
	for <lists+samba-technical@lfdr.de>; Tue,  7 May 2019 20:29:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=uAxHVQCsBo1b5PlzfwAXI4RufhZYGzT/dUPxeSN4rRc=; b=KpLi1Mc3j+mZ0FAw3u4JAeZP++
	Xc8DVnBN2FBuXuMob2l8jG687HY7aRBYowsIDNkZBAafKZXqnnh6RDlC5KMGQeK6Mxvb69IrLWYUx
	Wn+bxwduhIY3mALs6vYstld71pt6ott1NMaL3MJFXhAqG7a22grXNdgbiXLnWAgMSN/tcGq1sev7X
	a6SYzfFr0HJvwUrdotsQOMq0D514NExvSMPmmE/yr2XvtFlhgkYqSqjmjLJsJWP5mbB1xSqNFuMcJ
	vYhBXuXNTwSnLwGu1kGsnbdnWkSzisi+DteS/3pmfje3UGM22dOTRR0vueiebMyY/JUr96iMh2tPl
	yyEYgY2A==;
Received: from localhost ([::1]:35258 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hO4pj-002utt-UZ; Tue, 07 May 2019 18:28:56 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:46664) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hO4pf-002utm-AP
 for samba-technical@lists.samba.org; Tue, 07 May 2019 18:28:53 +0000
Received: by mail-lf1-x142.google.com with SMTP id k18so12554728lfj.13
 for <samba-technical@lists.samba.org>; Tue, 07 May 2019 11:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uAxHVQCsBo1b5PlzfwAXI4RufhZYGzT/dUPxeSN4rRc=;
 b=hjEGDLuO2QkLFE8Scimbk32wX+OqUolVirFNhseP74IGhXIAWEtuYU5TRLGFPXeMoy
 V99BKgFguxrWHHkqwFK3m4I9tpkLvyr49I0nLrWvzgCN9IEmfvRRD313pFeeajY+dG88
 VDec2lVe5xV+COKmhh8tuB/yR9jlX6Y1xSW/DscySsqLUNspbvMG6IpTkgE2vyUqIWLh
 WhLUCP/qh3zrcwy1PGZReAeZu/bEG3YP8jmDJHw7z8Pa/ZQt/HwaizKaB1PfyAR7Xy6X
 m8qV5vv4DgonM+sp1SuNzIPUGQehozrnPS1S48fcfic4emtxfvT1oycRfAJZTbbAuj2C
 MKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uAxHVQCsBo1b5PlzfwAXI4RufhZYGzT/dUPxeSN4rRc=;
 b=a0rcatzHLMnvxb1jYPDCmGBbm+U9lGeBIUhiO7DzyZEn0R5CecXnNxo4f4JMe11mK2
 1wYGlwwXlHLmfYyETPKuNHuqw4dqNLlRIVqP5YIlpY2iii09YTx0/DqiA3DAQWzNHFxd
 a7GHCJGO4OB8QA8dXyFPOzBOdumGu3jlPSEtcnDv2q7kGb43DY4nWjOZEWejVWobaP5f
 E7onEk01yaWIYdVfBcY+mnu0VTP1XqH0OKVi5HKCdSuxIsNt16nekhlvP43n8WXhej/r
 lU4lYDyR03UTlyEYPx44V3phdzlIjZNqBnpwNMKFJpHw0TmA4CX21il0NFjWeW2n2EU3
 bRlg==
X-Gm-Message-State: APjAAAUhwnab8dQvP5yeisxAh+zEa5u3zijsXHNGHBLSR8H0FavqrCqO
 dqhgJKqGqyq0vw+gt0nLxzue3Jvi9kbZ7RbRjA==
X-Google-Smtp-Source: APXvYqwWE8j/YwpgzAJc07ZnEdvmNMqpEjiJgo/l8eCz+eM3VRlwhGXZEJL4TCGOh/ka/80d1PC8L4zwgaWBO1jEVxQ=
X-Received: by 2002:a19:655a:: with SMTP id c26mr13965657lfj.97.1557253730334; 
 Tue, 07 May 2019 11:28:50 -0700 (PDT)
MIME-Version: 1.0
References: <1557242200-26194-1-git-send-email-kernel@probst.it>
 <CAH2r5mtqkHYbHJkf_LbAjhujnNRQP6Zmkmqhj1dUHomwsc3e=w@mail.gmail.com>
In-Reply-To: <CAH2r5mtqkHYbHJkf_LbAjhujnNRQP6Zmkmqhj1dUHomwsc3e=w@mail.gmail.com>
Date: Tue, 7 May 2019 11:28:39 -0700
Message-ID: <CAKywueSJCs2B2cGmZvGNfxDU7KNvkBOsuyuaOSV=3GWG80f+kw@mail.gmail.com>
Subject: Re: [PATCH v2] cifs: fix strcat buffer overflow and reduce raciness
 in smb21_set_oplock_level()
To: Steve French <smfrench@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Pavel Shilovsky via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Shilovsky <piastryyy@gmail.com>
Cc: Steve French <sfrench@samba.org>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Christoph Probst <kernel@probst.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

=D0=B2=D1=82, 7 =D0=BC=D0=B0=D1=8F 2019 =D0=B3. =D0=B2 09:13, Steve French =
via samba-technical
<samba-technical@lists.samba.org>:
>
> merged into cifs-2.6.git for-next
>
> On Tue, May 7, 2019 at 10:17 AM Christoph Probst via samba-technical
> <samba-technical@lists.samba.org> wrote:
> >
> > Change strcat to strncpy in the "None" case to fix a buffer overflow
> > when cinode->oplock is reset to 0 by another thread accessing the same
> > cinode. It is never valid to append "None" to any other message.
> >
> > Consolidate multiple writes to cinode->oplock to reduce raciness.
> >
> > Signed-off-by: Christoph Probst <kernel@probst.it>
> > ---
> >  fs/cifs/smb2ops.c | 14 ++++++++------
> >  1 file changed, 8 insertions(+), 6 deletions(-)
> >
> > diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
> > index c36ff0d..aa61dcf 100644
> > --- a/fs/cifs/smb2ops.c
> > +++ b/fs/cifs/smb2ops.c
> > @@ -2917,26 +2917,28 @@ smb21_set_oplock_level(struct cifsInodeInfo *ci=
node, __u32 oplock,
> >                        unsigned int epoch, bool *purge_cache)
> >  {
> >         char message[5] =3D {0};
> > +       unsigned int new_oplock =3D 0;
> >
> >         oplock &=3D 0xFF;
> >         if (oplock =3D=3D SMB2_OPLOCK_LEVEL_NOCHANGE)
> >                 return;
> >
> > -       cinode->oplock =3D 0;
> >         if (oplock & SMB2_LEASE_READ_CACHING_HE) {
> > -               cinode->oplock |=3D CIFS_CACHE_READ_FLG;
> > +               new_oplock |=3D CIFS_CACHE_READ_FLG;
> >                 strcat(message, "R");
> >         }
> >         if (oplock & SMB2_LEASE_HANDLE_CACHING_HE) {
> > -               cinode->oplock |=3D CIFS_CACHE_HANDLE_FLG;
> > +               new_oplock |=3D CIFS_CACHE_HANDLE_FLG;
> >                 strcat(message, "H");
> >         }
> >         if (oplock & SMB2_LEASE_WRITE_CACHING_HE) {
> > -               cinode->oplock |=3D CIFS_CACHE_WRITE_FLG;
> > +               new_oplock |=3D CIFS_CACHE_WRITE_FLG;
> >                 strcat(message, "W");
> >         }
> > -       if (!cinode->oplock)
> > -               strcat(message, "None");
> > +       if (!new_oplock)
> > +               strncpy(message, "None", sizeof(message));
> > +
> > +       cinode->oplock =3D new_oplock;
> >         cifs_dbg(FYI, "%s Lease granted on inode %p\n", message,
> >                  &cinode->vfs_inode);
> >  }
> > --
> > 2.1.4
> >
> >
>

Thanks for cleaning it up!

Reviewed-by: Pavel Shilovsky <pshilov@microsoft.com>

--
Best regards,
Pavel Shilovsky

