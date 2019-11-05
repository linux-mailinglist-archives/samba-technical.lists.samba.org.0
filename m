Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8727FF09F3
	for <lists+samba-technical@lfdr.de>; Wed,  6 Nov 2019 00:00:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=yoWC56++M3uoXU+oelt/CMWG4cbTRPSJURz59kUPoBM=; b=Z9dZMQtygjkAKEmukL8oW0/4kL
	P6UvFk24sFlvwaZ0Y1Knt4bQOBbQbfMgWBvCSGLm9eOsld/QO48Lms6kcer4XVWaBH+IaaYG7M/Vf
	ZA18RtMrwQeudwovqxs5lUoyTkKIb8YE3CCLux5xN+/1zsNVFw0BvdqGnYunQ2WZpEtNvkmwANYYh
	SukdOPSzjgnBkA0Azqj4zhjS6gxV6sD64OsDOLBW8SmyDTeGqPR4cpN++Att48/tF6ZtJjNh2Gh6x
	QHn2GI7xoEIQkifAmmV3tdRgoy1ZpTM+Nbuw8D8wg91ARfcBGtvJ6wSk4C4wWI1248bPiLcdTEj/W
	ox+q0rpA==;
Received: from localhost ([::1]:40040 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iS7oF-006rzR-IZ; Tue, 05 Nov 2019 23:00:23 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:40473) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iS7oA-006rzI-3D
 for samba-technical@lists.samba.org; Tue, 05 Nov 2019 23:00:22 +0000
Received: by mail-io1-xd42.google.com with SMTP id p6so24690144iod.7
 for <samba-technical@lists.samba.org>; Tue, 05 Nov 2019 15:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yoWC56++M3uoXU+oelt/CMWG4cbTRPSJURz59kUPoBM=;
 b=BTke/Ek/zLnhDSfeNuipm+/POYtDfp0HKri7zNJmRTzwXXipSLLmLhnkoOckfDN6nO
 8TTiEw3HGDSUKqcTm45ypk1+kJ8UuNAJX/CezHPd7OJw93mc4BKm+wbFEYtIOZQgmTBH
 o2KpPpA2rdVqMWMM4+5O9T7/VLFM0ymlptrGwB5vSex6Q1XQVMxopHPH9fmmxHtRFihV
 OuQ/lYpc9OnqT3W3PEIX+ghL8KKLxw1l4gOJDqSEwJUIAkF+S12VaEckCDZm/bptd4ns
 0UqHhFK7k8EXe1UQazdsR1SIQts/AurUGvu+lWlSNzbqiDCwmynlZ2mkx+fuTU7bKeQQ
 btaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yoWC56++M3uoXU+oelt/CMWG4cbTRPSJURz59kUPoBM=;
 b=J7zruFK4rlA/ehM6s0ZHmJDFb03CLjsI8M+kV/ea8Hhc+JI3ZLXrZhHU/PZy5gGIet
 uTyHTMnQJQV3byu946PGlCI8msvluj1Ik3Ea9Pc+LLsJAkUIHOGV/n5JtZlwOVNthlil
 W3RJ7D73IO2HUZ8xFQQufxf7j/adJyiRxYUODbdo1KUwjAzqVum4mqzIB252aR3zmsBU
 mfoqnv6ehqJwRqFeYbE9FtioTDvU/fDRdWdylAPfueWhzYH3pV1uta+FRPMPVJB/0Wvc
 kh7JaQT9iccGJuqMHo8qUTfyfPw3Y26Kk2OWps8T8vtqiVloku2kOHYMTVAk9A+SxenC
 puNg==
X-Gm-Message-State: APjAAAXoZQZMmqpmP5T4aMQtg1SE3A7sGA3sUUdtZFrdR84+jQUo13pU
 aF6gjBBlyar113F+vTzdaHAaXj0WknjXyQfmgoI=
X-Google-Smtp-Source: APXvYqzZ6TB+/QC8CW+9Q+EgSJexTwDdd/GYLyU/P7veuUPS+oIhgF0WwBMlhoBMAUS8bZWv6xwB5kIhrqIFrG+wCBI=
X-Received: by 2002:a5d:848c:: with SMTP id t12mr2960373iom.5.1572994814380;
 Tue, 05 Nov 2019 15:00:14 -0800 (PST)
MIME-Version: 1.0
References: <201911041524.o7kWSYSC%lkp@intel.com>
 <20191104075911.23rhzcbztbhlbjk5@4978f4969bb8>
In-Reply-To: <20191104075911.23rhzcbztbhlbjk5@4978f4969bb8>
Date: Tue, 5 Nov 2019 17:00:03 -0600
Message-ID: <CAH2r5mv43iPuAgvM699A5TstZGzHj=WOsYd8ffmk1DSUsQXdrA@mail.gmail.com>
Subject: Re: [RFC PATCH cifs] cifs: smb3_crypto_shash_allocate can be static
To: kbuild test robot <lkp@intel.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>, kbuild-all@lists.01.org,
 samba-technical <samba-technical@lists.samba.org>,
 Aurelien Aptel <aaptel@suse.com>, LKML <linux-kernel@vger.kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

FYI - I updated cifs-2.6.for-next with the equivalent change (fixing a
line change to one of Aurelien's patches in the multichannel series)

On Mon, Nov 4, 2019 at 1:59 AM kbuild test robot <lkp@intel.com> wrote:
>
>
> Fixes: 4d1cc0309f7e ("cifs: try opening channels after mounting")
> Signed-off-by: kbuild test robot <lkp@intel.com>
> ---
>  smb2transport.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/cifs/smb2transport.c b/fs/cifs/smb2transport.c
> index 1af789871ec2e..86501239cef55 100644
> --- a/fs/cifs/smb2transport.c
> +++ b/fs/cifs/smb2transport.c
> @@ -48,7 +48,7 @@ smb2_crypto_shash_allocate(struct TCP_Server_Info *server)
>                                &server->secmech.sdeschmacsha256);
>  }
>
> -int
> +static int
>  smb3_crypto_shash_allocate(struct TCP_Server_Info *server)
>  {
>         struct cifs_secmech *p = &server->secmech;



-- 
Thanks,

Steve

