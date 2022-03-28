Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C21B74EA38D
	for <lists+samba-technical@lfdr.de>; Tue, 29 Mar 2022 01:16:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=KPUlqvwHDYg7pWP6tIakvfiow6JvXO7cJS1lzXKr2lE=; b=PYCEZLeEkF4xR1ab1cb9GrvHPY
	w+4XLmzeOuyG/ntM2tFj2x+KqQmz1dsWbm05TDe/OKHt1yE4Ir95SZGFWdkKlj5f9qnOUDMs86U3j
	ZAHI+wQ7vU2cpGRswQJ8CQeXSTYwbxfxyKVoyRMMRgquQji7KmgBEHnyn2kmDWYih5GiQ57G16ueH
	OcIH69up2z/kc0lAvDIqIAXIkmPJIWYEhNamM1ROgZiH7vum+zA3cty17ntw9Hc0xterizciA9pnr
	6A/UksytkpWjs/nBoRzF05Tod/cbQ2OqxlacVmtXdF6zoBrsRx4ONhhnUl5C/NrQ1HkFwfCLZ8+/O
	3S4OgpRw==;
Received: from ip6-localhost ([::1]:64990 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nYyZa-006855-9Z; Mon, 28 Mar 2022 23:14:54 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:35649) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nYyZV-00684w-F3
 for samba-technical@lists.samba.org; Mon, 28 Mar 2022 23:14:51 +0000
Received: by mail-lj1-x232.google.com with SMTP id h11so21248922ljb.2
 for <samba-technical@lists.samba.org>; Mon, 28 Mar 2022 16:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5SYcQVTrRnCuqkqQIHeJZullcku7dbrrhzSHUor7d3k=;
 b=n/auNiplSGSBIYYjf3Kx9B/h7N5mSF02lp17vH+83AB+dN9q4+TcaHLooLPXiRAdE8
 +D+Vruc3xYiA+Uh+Cqs+lnEGg/xE9Nl4GCwkPIkQstm/DDKL4OjU3hziJgnMNS3MRytk
 vJML30EVvUxRcHxLOA28QTC3UebQ//BfDmIyRUvGeNtcImJKz/CQOvqkeTTaIGvIZKQA
 5zLGri/016cTB2CBpaPPuTSgwaLve/kZEAEZdyXEzruomU8xoX3yF7vY0XgIBX07bhge
 VNstJFilxKW7j3K0VLcOtSzHw4P5i31BPdfDCtWqk9FGoKQCl1FpjH2BhIIZCdXCltkz
 cggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5SYcQVTrRnCuqkqQIHeJZullcku7dbrrhzSHUor7d3k=;
 b=cVpNQBjzyWH7Dj+GABUU7J+K13wVC4//AQXXKjzLbD562ss+ktdv6nfx05geC60rHF
 bRgA0uKK3V2/dcvmvRnLzYuGeW6M6a2XL/xVdh0vBzH6Hmlltc5dy1nqLj4jsrIyfLWf
 UhbBEl1vp0+ErOTiFb3F7FjAgeaOeZj+5DmL3Fm/cyugRb4B5hzy7oX6h0SSk64OYBSa
 20I2KJKuH4YcHXyywqOy4PwDup6990b0rMQREh/SAHfhXs68RnHyIpPj8JKlmQwd19P0
 jU5zBdBANUIAP5kzKC3xM8S97nRgt35ggCmqdvsCcHSeYkQj9lpXmximRB6kDXXVx4Qf
 qq6Q==
X-Gm-Message-State: AOAM5303GtRwb1Jl4CyJAYH5+9lMZLrc96s3eIKtAKjxi996w1l/GiCp
 /o0H768oBKNmcw1I9RCNrXsKRgKogAB/sz+hztk=
X-Google-Smtp-Source: ABdhPJzWQfbtGUt75TkA7ZaULVHXVC7P0UQ+PxBDjbuel/72lJhFG3QkmoHqwmpzMCJYJuObPLyza2LEbYBb38B7Q60=
X-Received: by 2002:a2e:9048:0:b0:249:78bb:375e with SMTP id
 n8-20020a2e9048000000b0024978bb375emr23093840ljg.229.1648509288271; Mon, 28
 Mar 2022 16:14:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220328130300.3090213-1-trix@redhat.com>
 <YkHdKQ8TlhXTv1FP@dev-arch.thelio-3990X>
In-Reply-To: <YkHdKQ8TlhXTv1FP@dev-arch.thelio-3990X>
Date: Mon, 28 Mar 2022 18:14:37 -0500
Message-ID: <CAH2r5mtQLnkPX61PF16Y-zUVr2kP75YDTUkQEDTTWjuR+dYRvw@mail.gmail.com>
Subject: Re: [PATCH] cifs: fix enum usage
To: Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
Cc: CIFS <linux-cifs@vger.kernel.org>, trix@redhat.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

That fix (for the remaining one you note) was checked in yesterday

On Mon, Mar 28, 2022, 16:28 Nathan Chancellor <nathan@kernel.org> wrote:

> On Mon, Mar 28, 2022 at 06:03:00AM -0700, trix@redhat.com wrote:
> > From: Tom Rix <trix@redhat.com>
> >
> > Clang build fails with
> > cifsfs.c:709:18: error: implicit conversion from enumeration
> >   type 'enum statusEnum' to different enumeration
> >   type 'enum tid_status_enum'
> >   tcon->status = CifsExiting;
> >                ~ ^~~~~~~~~~~
> >
> > The type of the element status changed, so enum needed to change.
> > Replace CifsExiting with TID_EXITING.
>
> Right, this was clearly missed by the below commit, as every other
> instance of tidStatus was changed to status plus the value from
> enum tid_status_enum, except this one.
>
> > Fixes: 7e5c8c02911b ("smb3: cleanup and clarify status of tree
> connections")
> > Signed-off-by: Tom Rix <trix@redhat.com>
>
> Thanks for sending the patch!
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> > ---
> >  fs/cifs/cifsfs.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/fs/cifs/cifsfs.c b/fs/cifs/cifsfs.c
> > index 0789bf1496c74..a47fa44b6d52b 100644
> > --- a/fs/cifs/cifsfs.c
> > +++ b/fs/cifs/cifsfs.c
> > @@ -706,7 +706,7 @@ static void cifs_umount_begin(struct super_block *sb)
> >               spin_unlock(&cifs_tcp_ses_lock);
> >               return;
> >       } else if (tcon->tc_count == 1)
> > -             tcon->status = CifsExiting;
> > +             tcon->status = TID_EXITING;
> >       spin_unlock(&cifs_tcp_ses_lock);
> >
> >       /* cancel_brl_requests(tcon); */ /* BB mark all brl mids as
> exiting */
> > --
> > 2.26.3
> >
> >
>
