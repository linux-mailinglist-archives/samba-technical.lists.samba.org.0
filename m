Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F19B70C290
	for <lists+samba-technical@lfdr.de>; Mon, 22 May 2023 17:36:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=2rmBIymWQFv7eUJHkKnBb1WVUgTxwoZiRvWkcw9OY9Y=; b=IeQR05ch1MT0BTkrJQLmNNOVwx
	GG7ZkdscpAxoIjB6cW0Iem/t4VYyCMFTwDW3hfhkORN27S2Qf+oOCrrB62xNLouQDnLMJO1xKL50L
	n4CWPDko2CY60cwGzgQQzXIvVuNHqD0zRFX91EBiu/EW465o4P199e1qW/HRNTK3x7kQFhdPFz8LK
	ft4axKqyibBBS8qmxynoKK/ypTnPoOnSDBVFkw5bn931mG7gJ/nOsK5q3zbWlwhwVo+xFzbeZcfng
	3eQ4hElivTKn1wHV8XXYaoOj7n9so+t7MPTHKDIyKy5FUXAUhAjZk7+928BKdDTak7sUtdgGFbFuR
	xVvva7hg==;
Received: from ip6-localhost ([::1]:42706 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q17aB-00BN1Z-C7; Mon, 22 May 2023 15:36:23 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:55324) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q17a6-00BN1P-7I
 for samba-technical@lists.samba.org; Mon, 22 May 2023 15:36:21 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2533d3acd5fso5457466a91.2
 for <samba-technical@lists.samba.org>; Mon, 22 May 2023 08:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google; t=1684769775; x=1687361775;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2rmBIymWQFv7eUJHkKnBb1WVUgTxwoZiRvWkcw9OY9Y=;
 b=krCTsnO8F8/nRYMK19QmZgZgoHDaQk7UHRch6knvztPZeg5eImdURRZydEUtyA/zCc
 gEa5QX5uT0hC2u/hgTQ/eOlUPvvapm0WytES8AkRkOdUrKuuHRmbhFSD1GveWjSSXHjR
 qPHhOvtSjJKYcNnRHgW/42JJag57mQtgftXk0KSm6KczNRncN/1xnOne9fPmsOkoJwKu
 Q+iwJvXtAMdF+Zgv5+MSjAr9CAbBAdBRXozhY3f+gCYv0cly+kshMpnR+vHMnqHLC8od
 H2QrJHzPA3g14ozSHOj5SNWiVOxl8ZG2Y0rQPVCpOyv4iNOsSGwbLM3XmhhrpC18VdTb
 /yKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684769775; x=1687361775;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2rmBIymWQFv7eUJHkKnBb1WVUgTxwoZiRvWkcw9OY9Y=;
 b=BoBhaymzgmz4SlNjkg7OZcn873+/9sNKYURaqSL2ZOKH1ZcHFmOcahJfwuSXvXrrG+
 lixUuUQJGIJETmfDCHCydNDNVBqT7F7KNeCIEvu+k72fgASaLsj/jpANdpxC+EW9nF1s
 DLu7utUjaQFTj0pmS1CZ6x6jrPzh++6OuRdCjlqYJWphRrIkAGGYUbTb1ElOAcsytAhD
 DKeUBZ/OVAiIRQnQiuKxl1c4zZw1jqcBkjpG/6p5PXDwb2mpOMlL7GEB30LgO4S45EWU
 QK2Nszl/ransLU2IP2bmEeeXcRF+dCKG1VMuzz2yNSGrc4sMKwffEzupu5qluIZbPK+R
 NCCw==
X-Gm-Message-State: AC+VfDya1guAd+5LQJEVyJSXf4/TwPs1GvnphQsCdQFJoESA1c3NXoBt
 ZEnOtC/pfc2Al6QCDkKomazO80WY3ldv9358+TMMEblXfAUeiKRKRLE=
X-Google-Smtp-Source: ACHHUZ6A8nOc33wxc/cfU+Vworyh91nsY0BRe5qj3zNu9LI6QXxdZ05LHodivHyS4CTHZjYoCSMzlSrru+j0q1YeNk8=
X-Received: by 2002:a17:90b:3ecb:b0:24e:5344:9c9d with SMTP id
 rm11-20020a17090b3ecb00b0024e53449c9dmr11099441pjb.38.1684769775492; Mon, 22
 May 2023 08:36:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mv8nAncg-f=Z5u8LkH4o7kfJLJdtoksYQgiguF7efKZkQ@mail.gmail.com>
In-Reply-To: <CAH2r5mv8nAncg-f=Z5u8LkH4o7kfJLJdtoksYQgiguF7efKZkQ@mail.gmail.com>
Date: Mon, 22 May 2023 10:36:04 -0500
Message-ID: <CAB5c7xq3dZ6yh6VXKGoJD--gg41rMgZ_u6RJYGMyzc6SE78UgA@mail.gmail.com>
Subject: Re: Displaying streams as xattrs
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, May 21, 2023 at 9:08=E2=80=AFPM Steve French <smfrench@gmail.com> w=
rote:
>
> Looking through code today (in fs/cifs/xattr.c) I noticed an old
> reference to returning alternate data streams as pseudo-xattrs.
> Although it is possible to list streams via "smbinfo filestreaminfo"
> presumably it is not common (opening streams on remote files from
> Linux is probably not done as commonly as it should be as well).
>
> Any thoughts about returning alternate data streams via pseudo-xattrs?
> Macs apparently allow this (see e.g.
> https://www.jankyrobotsecurity.com/2018/07/24/accessing-alternate-data-st=
reams-from-a-mac/)
>
>
>
>
>
> --
> Thanks,
>
> Steve

Another issue with exposing ADS as xattr on Linux is that VFS caps max
xattr size at 64 KiB. I've seen MacOS resource forks in the wild with
sizes of up to 3 MiB. FCNTL sounds interesting.

Andrew

