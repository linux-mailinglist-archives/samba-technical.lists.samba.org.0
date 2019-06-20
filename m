Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E90CB4C5CA
	for <lists+samba-technical@lfdr.de>; Thu, 20 Jun 2019 05:28:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=pAFpiri2f2t5SNQ1oqnI5SugxmE4elTmy073WdMMsRI=; b=ly470mgXHVaE8po4JhZp12OMOp
	BRacU7X6SphTmHgatJQA/h3GjtBUWdzFBRALXczwk/DkfXwWYcPsn/aT0fXmy5HgYkBAeUd6c5J1+
	/T5KLObVvqPUM4hQb1yn86jNBX3t481kJhsZNVS9ww7piEc8LcFsx9gypgwowqMwBkXdYSlnNVZg7
	Tv0jeYQEUt28XK4LhREcDGm1bS0VYseaIrYdfZgJPliQikNCthO+6WhaGLLQGFWXpVsx0bGR7L1KS
	MPnvD3MY8IUxayEJiGIPGSRzsmsc7+D9enUTgqjocZ8YfyxdFw2bBebwbvfl09emw8g0+DUeuVkgy
	cAEvojIw==;
Received: from localhost ([::1]:45724 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hdnkX-000ZoY-ND; Thu, 20 Jun 2019 03:28:33 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:34455) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hdnkT-000ZoR-Go
 for samba-technical@lists.samba.org; Thu, 20 Jun 2019 03:28:31 +0000
Received: by mail-io1-xd42.google.com with SMTP id k8so541797iot.1
 for <samba-technical@lists.samba.org>; Wed, 19 Jun 2019 20:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pAFpiri2f2t5SNQ1oqnI5SugxmE4elTmy073WdMMsRI=;
 b=Jtf3/GfZuWy5wsExbbdNhkbTF4s4dwCZGIIIaz7MBHQBuFoU0HYV1cZEKrDwvI73w1
 EZvI8h3Wl41uOapIbzo8WcI1JLz7UbqDlZ5Wa3teCmj9DG2bqVrBWyKWrJ7A4SNtfdXb
 kWVPbUMEQOow9bXRp6peiIsh1G9LNMrJU3eC6g3ZQ/yPczzx5xDMF7aafQ4tOuUaaGS8
 RztteGoPFK5I5zLuyoh2IZbw5VTaY+vbdr+pFggUT+kRqopdEv7rX7/7t5TdaaGFdyzE
 JDwz8PmZA1LOBd4Y11mzU2Lr49ZtRyFtdPqE1IeLon7anvR1qEq37zueGW/ksky4ahqZ
 2nFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pAFpiri2f2t5SNQ1oqnI5SugxmE4elTmy073WdMMsRI=;
 b=fa3/YLtzKswt0SMyX88fWNvA3FZWmL3QIXN2CLvhFbrUoP5cZwe2nrMFEcVl0p/ROV
 lKBmCD28CPK1vZR244CpwK49WXDfCO3w4EctOM5wz8iWElAYoVLcbBR4xSVSuned+mKU
 68bG5v+pm7/xSiHHLzjBHLnER1D053rDNK85wcoFAH2LD/PviQkP44JvZPP8BFTKYre8
 Dc8eJwcod4ICDQRs6yVfA8O4AB5KsO9eSJ2o8+YrIYGiQ/DW1mzdVKEWeHwPPjpu2khu
 I1ECINcg6O3KL3abA+wBKyTVaIC0w1k0BxP1ugR0Vqfow0M1R+OWoemTPPHGSI9UqZyx
 Lofg==
X-Gm-Message-State: APjAAAVJ0puoWJjVINqnbhF2XF2tt/mahxLw9RlRg7QfGV4fs9k0rwpT
 0QaX8hKgQxGcfZyb8cAFPnUaMIoDKVgsuwOFu8Q=
X-Google-Smtp-Source: APXvYqyS9VJQZ/l6B688xMlfZqGkZDorP5yUodbs5DrUkTwIy4NL3bVs6yQ2dwM2SAbTtl2G176jyXp1eXvW6C+MRoU=
X-Received: by 2002:a6b:4f14:: with SMTP id d20mr4211820iob.219.1561001307883; 
 Wed, 19 Jun 2019 20:28:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5ms8f_wTwBVofvdRF=tNH2NJHvJC6sWYCJyG6E5PVGTwZQ@mail.gmail.com>
 <CAN05THSoKCKCFXkzfSiKC0XUb3R1S3B9nc2b9B+8ksKDn+NE_A@mail.gmail.com>
 <CAH2r5mu0kZFhOyg3sXw6NVaAjyVGKuNdRGP=r_MoKqtJSqXJbw@mail.gmail.com>
In-Reply-To: <CAH2r5mu0kZFhOyg3sXw6NVaAjyVGKuNdRGP=r_MoKqtJSqXJbw@mail.gmail.com>
Date: Thu, 20 Jun 2019 13:28:16 +1000
Message-ID: <CAN05THRq6CM-3ZHK5WNE-VA60N0MxSHTxeM7sp-hz-ehOTeEOA@mail.gmail.com>
Subject: Re: [SMB3][PATCH] fix copy_file_range when copying beyond end of
 source file
To: Steve French <smfrench@gmail.com>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 CIFS <linux-cifs@vger.kernel.org>, Amir Goldstein <amir73il@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 "Darrick J. Wong" <darrick.wong@oracle.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Guess we need a fix to the man page.

Reviewed-by: Ronnie Sahlberg <lsahlber@redhat.com>

On Thu, Jun 20, 2019 at 1:19 PM Steve French <smfrench@gmail.com> wrote:
>
> Local file systems that I tried, seem to agree with xfstest and return
> 0 if you try to copy beyond end of src file but do create a zero
> length target file
>
> On Wed, Jun 19, 2019 at 9:14 PM ronnie sahlberg
> <ronniesahlberg@gmail.com> wrote:
> >
> > On Thu, Jun 20, 2019 at 11:45 AM Steve French via samba-technical
> > <samba-technical@lists.samba.org> wrote:
> > >
> > > Patch attached fixes the case where copy_file_range over an SMB3 mount
> > > tries to go beyond the end of file of the source file.  This fixes
> > > xfstests generic/430 and generic/431
> > >
> > > Amir's patches had added a similar change in the VFS layer, but
> > > presumably harmless to have the check in cifs.ko as well to ensure
> > > that we don't try to copy beyond end of the source file (otherwise
> > > SMB3 servers will return an error on copychunk rather than doing the
> > > partial copy (up to end of the source file) that copy_file_range
> > > expects).
> >
> > + if (src_off >= inode->i_size) {
> > + cifs_dbg(FYI, "nothing to do on copychunk\n");
> > + goto cchunk_out; /* nothing to do */
> > + } else if (src_off + len > inode->i_size) {
> > + /* consider adding check to see if src oplocked */
> > + len = inode->i_size - src_off;
> > + cifs_dbg(FYI, "adjust copychunk len %lld less\n", len);
> > + }
> >
> > This makes us return rc == 0 when this triggers. Is that what we want?
> > Looking at "man copy_file_range" suggests we should return -EINVAL in
> > both these cases.
> >
> >
> >
> > >
> > >
> > >
> > > --
> > > Thanks,
> > >
> > > Steve
>
>
>
> --
> Thanks,
>
> Steve

