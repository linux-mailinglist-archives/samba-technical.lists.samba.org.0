Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BA5D6E65
	for <lists+samba-technical@lfdr.de>; Tue, 15 Oct 2019 06:55:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=FoyKK6+CZHtzLvyc+hXa9rZT9/61RNMGYHQKvCgAsn8=; b=BsFPuXoy3uOSYhV42YxHUiOViH
	t05C1jplgnl7LV9OnfZ1kF48rc6emObopYcWHOv0AfdbQbZmUMDPdsC3B3IzlISgTOYHrSp/cDXCx
	lFsEfEn5CWjN3R0yrnGEbNnecYTEh5cK44xLKnYAqI+Og1ubaOG59UryxwhiC+/mEXWM2Apm7ST4x
	E2dAqKMypV+KHArOEyL6BMwAjM+56t/uZbbFiPJaG76Nme0un+sp0O9P9xtmTB/+byh7erfdbld7T
	OnobcSBMeWRpbNcbq/HVp35zIKirSP++ITJo4F3/KP/ULLRs6X/HWI8ztbfoLTXZwPGwgXnl3sm8+
	aQm/WHdw==;
Received: from localhost ([::1]:33798 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iKEqK-003nmR-Tq; Tue, 15 Oct 2019 04:53:56 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:40152) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iKEqG-003nmK-5o
 for samba-technical@lists.samba.org; Tue, 15 Oct 2019 04:53:54 +0000
Received: by mail-io1-xd43.google.com with SMTP id h144so42917070iof.7
 for <samba-technical@lists.samba.org>; Mon, 14 Oct 2019 21:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FoyKK6+CZHtzLvyc+hXa9rZT9/61RNMGYHQKvCgAsn8=;
 b=da1+odWxWl7gUFhDl9t6DAPPjvv49NvV4J800iLoARhJP8025HZn3Kxd/DL6c6uO8P
 GFWRHn1nDwbjzHP+Fy5RLnWWBYInr8ZrFkwjETeXTznLEa6Mrf3oTePwZie/0zzI3pq8
 3H556MItZnzFM0oZIjoEL2ydVfi+OEpbzBIkpW9E1PGbwFNf2MMU/kKgQ6aRozQRiQIm
 ygkRH2h/xDqS2hvCa1UD0WRTidtODYmBjAnoBRKHvdEMZmoPnufZNxqLzh2MKuoLocHb
 7ZrwAP92LrsOk1ywJCXH6FKRFORrdKoRtUNICv1A69XGGWNgjAjD6us1nCtDSsPDvszE
 SQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FoyKK6+CZHtzLvyc+hXa9rZT9/61RNMGYHQKvCgAsn8=;
 b=lRAAkPW9s/vCUf3XmjhWuP0DWU4KqcKbzofAdX1/xe2HiPDjuXIR6kNZSmE2R+9dDB
 aVipI7h1hlDv7eLPUxezknrinmmJ7/rpz20KEfL7ZYdrfFGjTq45+b9qszhyG8UyDyDJ
 cluATBmElrUQghEEonYSW8gj0+S4w9klfcOy6q7RBKiNKBJZnTBaWWMLOz2Wg0ftwQae
 VrcfHoMvl1/gVisxjr2kLQeVX3sUsAyvn/m7euAsWVTjIiuUovTsYO6l/R+fi6hK0j8g
 oHiIpO2uFDcZgNBlEBfaJx305PuCrlPDYnxPhuXPEo76esxXvxlBWhxzMWCPfnqugNxg
 E/Yg==
X-Gm-Message-State: APjAAAXGm7m7n3ldpLXNrF5O6jFT/UIjaSLwdRVgAcPqVKpyCsWTifTy
 3irLEGm9bcAKbLiIo6bximHK+1hipTdxLAmAoHo1iGnr
X-Google-Smtp-Source: APXvYqyQZ42Wzz4Mil0VtK34oFTpJ7nzC1L+Te3pMJBnDtnnJhfH6Tb5NGwSDCztaKyQCoaC83210VSdDSzpC57w4ow=
X-Received: by 2002:a6b:fa12:: with SMTP id p18mr14453335ioh.272.1571115230075; 
 Mon, 14 Oct 2019 21:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20191014071531.12790-1-hslester96@gmail.com>
 <CAKywueQY-J3g0RBF4=opP8SbhpWh-BHoHWzNEeTruxmfacnhGw@mail.gmail.com>
In-Reply-To: <CAKywueQY-J3g0RBF4=opP8SbhpWh-BHoHWzNEeTruxmfacnhGw@mail.gmail.com>
Date: Mon, 14 Oct 2019 23:53:38 -0500
Message-ID: <CAH2r5msPBvF298mWgz_1Jx9svHY1NyqNti4G9TUaNdEqg=A=CQ@mail.gmail.com>
Subject: Re: [PATCH] cifs: Fix missed free operations
To: Pavel Shilovsky <piastryyy@gmail.com>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Steve French <sfrench@samba.org>, linux-cifs <linux-cifs@vger.kernel.org>,
 Chuhong Yuan <hslester96@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Merged into cifs-2.6.git for-next and cc: stable for 5.3

On Mon, Oct 14, 2019 at 4:43 PM Pavel Shilovsky via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> =D0=BF=D0=BD, 14 =D0=BE=D0=BA=D1=82. 2019 =D0=B3. =D0=B2 00:18, Chuhong Y=
uan <hslester96@gmail.com>:
> >
> > cifs_setattr_nounix has two paths which miss free operations
> > for xid and fullpath.
> > Use goto cifs_setattr_exit like other paths to fix them.
> >
> > Fixes: aa081859b10c ("cifs: flush before set-info if we have writeable =
handles")
> > Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> > ---
> >  fs/cifs/inode.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/fs/cifs/inode.c b/fs/cifs/inode.c
> > index 5dcc95b38310..df9377828e2f 100644
> > --- a/fs/cifs/inode.c
> > +++ b/fs/cifs/inode.c
> > @@ -2475,9 +2475,9 @@ cifs_setattr_nounix(struct dentry *direntry, stru=
ct iattr *attrs)
> >                         rc =3D tcon->ses->server->ops->flush(xid, tcon,=
 &wfile->fid);
> >                         cifsFileInfo_put(wfile);
> >                         if (rc)
> > -                               return rc;
> > +                               goto cifs_setattr_exit;
> >                 } else if (rc !=3D -EBADF)
> > -                       return rc;
> > +                       goto cifs_setattr_exit;
> >                 else
> >                         rc =3D 0;
> >         }
> > --
> > 2.20.1
> >
>
> Looks good, thanks.
>
> Reviewed-by: Pavel Shilovsky <pshilov@microsoft.com>
>
> The original patch was tagged for stable, so, it seems that this one
> should be tagged too.
>
> --
> Best regards,
> Pavel Shilovsky
>


--=20
Thanks,

Steve

