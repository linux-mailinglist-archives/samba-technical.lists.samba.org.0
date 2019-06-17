Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A5B492F7
	for <lists+samba-technical@lfdr.de>; Mon, 17 Jun 2019 23:26:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=lNiBYiT9Pp+8r96YA0aKnZr+U8uH85TDSFdJzYqr6D4=; b=0WWr7da3jiiddsbhLvL+Msw12G
	btEYZgX6V/xexKWaKFlCRoVwh1QsqFYsKsk0UNl3hATPQWF0GwzJB1w3M3k08emOKrG62796Wg8+R
	zkecui+Vn4FNeQ9lBA3RKXAQ4xxKZPWUwcADOJ42bqPtdctaY+Lko/ZyJaYGJjAh0L+4mYagY//JN
	yHmhweCEaFwV7/TWgYDcYcwaRfBylMKOEDLkr7mmUDiRAOt+SfteCEvfnYiUGcGmRv4gJuq4Bia21
	rr6HATOVDxTN8qyFa2O8ehInmiQg0wQZdJKc8AN+k2x5pB72cY1FOOuO3ObwNBF0nFqcKndFdGJTP
	OVvO9qqQ==;
Received: from localhost ([::1]:48632 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hcz8Q-000sVw-F2; Mon, 17 Jun 2019 21:25:50 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:42615) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hcz8L-000sVp-MF
 for samba-technical@lists.samba.org; Mon, 17 Jun 2019 21:25:48 +0000
Received: by mail-lj1-x243.google.com with SMTP id t28so10789636lje.9
 for <samba-technical@lists.samba.org>; Mon, 17 Jun 2019 14:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lNiBYiT9Pp+8r96YA0aKnZr+U8uH85TDSFdJzYqr6D4=;
 b=XE2SJOVQalk107+qXDQFQ7uRbMDEC9StP/hD1gLK5jroSSbBi0yGep2Lv3/zDbICoH
 BxNZmSIruCqWjQ9omDJalBm7/m2y/G26bl0jhvlda2EAhR7zOi1ABUYPtQMSDl97Tv3K
 MlcRt58kacpdun1Mf6lwK4UWu8wPtQgk79MPUNLnEZ/QoYiaTiLOSKUb5OqH5LzPnWKh
 Gd0amh3GjDHh1gQV5bHYHnCXVRg+CvPbuT48HLdySZRo5zv/n7nYRnCcyZfd0lXKZhQt
 GCXGkTQ1aW6EZ+rlXt4k31P15K/3+/SHF5KijJUvTLwLTj17Brr8/H/o2Tr3OgSZFzGJ
 buTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lNiBYiT9Pp+8r96YA0aKnZr+U8uH85TDSFdJzYqr6D4=;
 b=Zf9GXYi2YzygPNUFj2qYYalGawN03ZjQS9YgAqOzDllw6HLaX93o6wpmiKu+ZsbH3k
 r1L9awl7imD5tL0JTO0tlBYbSrlmv1o1Ly0qZViMc5c8l1dtHGG4p20YT5+OT9jSwllb
 Lbfiabr7cf5OrEzrMT+Hz3lIrzpQGWs40KIKoFodm/BzyfWnRrJh0lwoZwDKfJiRoeS1
 8Fxp0lWeEnqDD+K+78mSrsd9qQ0iatkESqBzP7o7o3h3zGHPtuj4V+QhTp9o/xvM5PsV
 Vapg+vc5Y8qPLg75Y3stsNiTQut47fpF8ffmOKw75A177WHLLc2yK/0iUOtI7TQbzUkH
 7iZQ==
X-Gm-Message-State: APjAAAWZ0skW52NqAEJkx5TFu9pUVH8/iuEI9+5204VtUcgTdVpE029s
 BZgVDfrnJzxelr1wgcCMLP4UqAoNRqjcYgVbbA==
X-Google-Smtp-Source: APXvYqyoez6UPHcVwWSuagUzE5RNM2VqcFD21F/eyWDl99tmpBjI0HtWiguGNyHXd1hXO7pQx2nk7YurVLszM2FZEbc=
X-Received: by 2002:a05:651c:87:: with SMTP id
 7mr43496971ljq.184.1560806744685; 
 Mon, 17 Jun 2019 14:25:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mvo9sWf8VoPb8puCDh4HM6WnrMgjs+HyhUzqEZXtuQwtA@mail.gmail.com>
 <CAH2r5mtC5cXkhAVrioy_cLeoTq_4Jq0nw3CR4HTiEP_twSSKJg@mail.gmail.com>
 <CAN05THQaHUATgVy=5AKksQ+FciLxP=uuC1PwHe5gLm+g=Qz-aw@mail.gmail.com>
In-Reply-To: <CAN05THQaHUATgVy=5AKksQ+FciLxP=uuC1PwHe5gLm+g=Qz-aw@mail.gmail.com>
Date: Mon, 17 Jun 2019 14:25:33 -0700
Message-ID: <CAKywueSMK8Cns9B5gKwuiyzP0V8nbJ3H0YKamDn7Zu9M7nzWDw@mail.gmail.com>
Subject: Re: NT_STATUS_INSUFFICIENT_RESOURCES and retrying writes to Windows
 10 servers
To: ronnie sahlberg <ronniesahlberg@gmail.com>
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
From: Pavel Shilovsky via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Shilovsky <piastryyy@gmail.com>
Cc: Paulo Alcantara <paulo@paulo.ac>, Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Reviewed-by: Pavel Shilovsky <pshilov@microsoft.com>

--
Best regards,
Pavel Shilovsky

=D0=BF=D0=BD, 17 =D0=B8=D1=8E=D0=BD. 2019 =D0=B3. =D0=B2 13:46, ronnie sahl=
berg <ronniesahlberg@gmail.com>:
>
> Reviewed-by: Ronnie Sahlberg <lsahlber@redhat.com>
>
> On Tue, Jun 18, 2019 at 5:51 AM Steve French <smfrench@gmail.com> wrote:
> >
> > Attached is a patch with updated comments and cc:stable:
> >
> >
> > On Sat, Jun 15, 2019 at 11:18 PM Steve French <smfrench@gmail.com> wrot=
e:
> > >
> > > By default large file copy to Windows 10 can return MANY potentially
> > > retryable errors on write (which we don't retry from the Linux cifs
> > > client) which can cause cp to fail.
> > >
> > > It did look like my patch for the problem worked (see below).  Window=
s
> > > 10 returns *A LOT* (about 1/3 of writes in some cases I tried) of
> > > NT_STATUS_INSUFFICIENT_RESOURCES errors (presumably due to the
> > > 'blocking operation credit' max of 64 in Windows 10 - see note 203 of
> > > MS-SMB2).
> > >
> > > "<203> Section 3.3.4.2: Windows-based servers enforce a configurable
> > > blocking operation credit,
> > > which defaults to 64 on Windows Vista SP1, Windows 7, Windows 8,
> > > Windows 8.1, and, Windows 10,
> > > and defaults to 512 on Windows Server 2008, Windows Server 2008 R2,
> > > Windows Server 2012 ..."
> > >
> > > This patch did seem to work around the problem, but perhaps we should
> > > use far fewer credits when mounting to Windows 10 even though they ar=
e
> > > giving us enough credits for more? Or change how we do writes to not
> > > do synchronous writes? I haven't seen this problem to Windows 2016 or
> > > 2019 but perhaps the explanation on note 203  is all we need to know
> > > ... ie that clients can enforce a lower limit than 512
> > >
> > > ~/cifs-2.6/fs/cifs$ git diff -a
> > > diff --git a/fs/cifs/smb2maperror.c b/fs/cifs/smb2maperror.c
> > > index e32c264e3adb..82ade16c9501 100644
> > > --- a/fs/cifs/smb2maperror.c
> > > +++ b/fs/cifs/smb2maperror.c
> > > @@ -457,7 +457,7 @@ static const struct status_to_posix_error
> > > smb2_error_map_table[] =3D {
> > >         {STATUS_FILE_INVALID, -EIO, "STATUS_FILE_INVALID"},
> > >         {STATUS_ALLOTTED_SPACE_EXCEEDED, -EIO,
> > >         "STATUS_ALLOTTED_SPACE_EXCEEDED"},
> > > -       {STATUS_INSUFFICIENT_RESOURCES, -EREMOTEIO,
> > > +       {STATUS_INSUFFICIENT_RESOURCES, -EAGAIN,
> > >                                 "STATUS_INSUFFICIENT_RESOURCES"},
> > >         {STATUS_DFS_EXIT_PATH_FOUND, -EIO, "STATUS_DFS_EXIT_PATH_FOUN=
D"},
> > >         {STATUS_DEVICE_DATA_ERROR, -EIO, "STATUS_DEVICE_DATA_ERROR"},
> > >
> > >
> > > e.g. see the number of write errors in my 8GB copy in my test below
> > >
> > > # cat /proc/fs/cifs/Stats
> > > Resources in use
> > > CIFS Session: 1
> > > Share (unique mount targets): 2
> > > SMB Request/Response Buffer: 1 Pool size: 5
> > > SMB Small Req/Resp Buffer: 1 Pool size: 30
> > > Operations (MIDs): 0
> > >
> > > 0 session 0 share reconnects
> > > Total vfs operations: 363 maximum at one time: 2
> > >
> > > 1) \\10.0.3.4\public-share
> > > SMBs: 14879
> > > Bytes read: 0  Bytes written: 8589934592
> > > Open files: 2 total (local), 0 open on server
> > > TreeConnects: 3 total 0 failed
> > > TreeDisconnects: 0 total 0 failed
> > > Creates: 12 total 0 failed
> > > Closes: 10 total 0 failed
> > > Flushes: 0 total 0 failed
> > > Reads: 0 total 0 failed
> > > Writes: 14838 total 5624 failed
> > > ...
> > >
> > > Any thoughts?
> > >
> > > Any risk that we could run into places where EAGAIN would not be
> > > handled (there are SMB3 commands other than read and write where
> > > NT_STATUS_INSUFFICIENT_RESOURCES could be returned in theory)
> > >
> > > --
> > > Thanks,
> > >
> > > Steve
> >
> >
> >
> > --
> > Thanks,
> >
> > Steve

