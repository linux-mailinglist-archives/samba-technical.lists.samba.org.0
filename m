Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F04D5E50
	for <lists+samba-technical@lfdr.de>; Mon, 14 Oct 2019 11:10:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=3Ur1eTKoVO3wN+x03kXh8I2XsPr+iXVsLGNEziY9nGs=; b=G1zlEPmJrztwVHjVRM0CXB0HvB
	B5YmAMac4Ft5SzNfU0SKYm6BVC6lUPDgwVIs9oyPeM4LWDKUccyA5kFLXX1HWEsjqhzbCOq19JIJW
	MIAgHZ6APW8/14IQi/cGKQA3Vg8YkHlSJRTt7ndHuxIuQ8+KgGt6mjFPT9GKWjP8O5g7dkH+eOQod
	DE5X5M4jybzxHK+PtrcjtPBmoBUTnN4VV4cWOGr1JVY4DI92k4sudIZRCw5BnW3lnesFjLhEm7rM3
	KDsgpxBmyGrFV57yOfmwC9gHTUAlyA+SQAbzIy1utTK9pf/iuUnHYjTOZwh56d1MlnblGxuBQM/QM
	Kx0LwvQA==;
Received: from localhost ([::1]:57694 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iJwLb-003Z0F-OT; Mon, 14 Oct 2019 09:08:59 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:33023) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iJwLW-003Z07-OR
 for samba-technical@lists.samba.org; Mon, 14 Oct 2019 09:08:56 +0000
Received: by mail-io1-xd44.google.com with SMTP id z19so36454235ior.0
 for <samba-technical@lists.samba.org>; Mon, 14 Oct 2019 02:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3Ur1eTKoVO3wN+x03kXh8I2XsPr+iXVsLGNEziY9nGs=;
 b=du4IUe77YWpxVazpPUJ2kXDDjHDwWMN3AC8cd6KsXQMboK71TPwtXps6Og1P/Ac6EM
 4zo56tNmcbMFIcAQdP3ztqwP2wypoGjHsUQ1YAK4IRLe1rkKVUixgGw47b+pHqI5Siqz
 A0icudIGBbg1wB2F2UmI0FAnbKoUXQG2FK2ZQWKlKaFWhyMPKrefXGHShb1Jvg3HoygQ
 DVa7SWWiKD6FteO815c1Ue2iB+2Has6FSba8AvV1C5pxGKkxyH5GEREdlYN9eKL/F4Yb
 g8MMUn8JMX+sLUCxlCbVNd4c372gkwha1TD4mf/sakI2xhe//SpVjVDnrenVpSYrF4w2
 /hxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3Ur1eTKoVO3wN+x03kXh8I2XsPr+iXVsLGNEziY9nGs=;
 b=EOVyc888i8hS/kAXe8eF+RxtTJ6OSfr8Cv8bQDXs0IZYneBenXcFAfeWVUx7FhaaND
 QNpOJo96Njn/TKrzGhxUqB1/nwPNQmSpQDW8RkOWkQk3YU+YGCocFmOZ72nDMxu/R+Fm
 xe09uioA7f/Iay/JnZZWZmczMXl6HwD6Hy1PzVt0rfMPbXB7Z4GdE06i5y6g53bvgMhb
 QcDohTdmxvBUJZVtRgF6HXEi2RE6HvAJra0m3f3ZGp2M1Q1oc3XD3NUifu2XXIewscPD
 uoV8Mh9rnFCMsjeIoIf23bPWzRIbigBPKpMmTb3D0EyNFgqD2Lw9mUFf/kl2j3UGuAOz
 KsJw==
X-Gm-Message-State: APjAAAUr2gW/XW+TuzOuLrny8UpPTIdUFGNzqsiHyFoYegQfTmbBdZUP
 5cahYf3pBFUvEc5ePrkwnpUlfEu/TolmtC15Vpk=
X-Google-Smtp-Source: APXvYqzXREaLwpMF7/RnkNEs9C+aIl41nWeXpL63hROXqh+5vvu3fN0r80aSjI8rnVfv4MfxKTDtw0u0l84ACZVVQqA=
X-Received: by 2002:a5d:8f8e:: with SMTP id l14mr17532875iol.3.1571044132091; 
 Mon, 14 Oct 2019 02:08:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191014085923.14967-1-rbergant@redhat.com>
In-Reply-To: <20191014085923.14967-1-rbergant@redhat.com>
Date: Mon, 14 Oct 2019 19:08:43 +1000
Message-ID: <CAN05THQTb=aechQB5rqUxZLpfwocqfLPMVW5mAz4F5dn3ryj0w@mail.gmail.com>
Subject: Re: [PATCH] CIFS: avoid using MID 0xFFFF
To: Roberto Bergantinos Corpas <rbergant@redhat.com>
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
Cc: Steve French <sfrench@samba.org>, linux-cifs <linux-cifs@vger.kernel.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Oct 14, 2019 at 7:01 PM Roberto Bergantinos Corpas
<rbergant@redhat.com> wrote:
>
> According to MS-CIFS specification MID 0xFFFF should not be used by the
> CIFS client, but we actually do. Besides, this has proven to cause races
> leading to oops between SendReceive2/cifs_demultiplex_thread. On SMB1,
> MID is a 2 byte value easy to reach in CurrentMid which may conflict with
> an oplock break notification request coming from server
>
> Signed-off-by: Roberto Bergantinos Corpas <rbergant@redhat.com>
> ---
>  fs/cifs/smb1ops.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/fs/cifs/smb1ops.c b/fs/cifs/smb1ops.c
> index c4e75afa3258..c8d96230cbd2 100644
> --- a/fs/cifs/smb1ops.c
> +++ b/fs/cifs/smb1ops.c
> @@ -183,6 +183,9 @@ cifs_get_next_mid(struct TCP_Server_Info *server)
>         /* we do not want to loop forever */
>         last_mid = cur_mid;
>         cur_mid++;
> +       /* avoid 0xFFFF MID */
> +       if (cur_mid == 0xffff)
> +               cur_mid++;
>
>         /*
>          * This nested loop looks more expensive than it is.
> --

Reviewed-by: lsahlber@redhat.com>


Steve, can we get this pushed to linus soonish?  It is a bad issue.

