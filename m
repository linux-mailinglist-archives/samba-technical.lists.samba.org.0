Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 804DF7CB665
	for <lists+samba-technical@lfdr.de>; Tue, 17 Oct 2023 00:15:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=KvN8fCLlFe7Jrcf7tnyNS2O/KMreYubvjkRXV3ZF900=; b=6aJQ7d7jSLbLyQT8O7bxf0D1Rn
	mTK6u0pfFwFC+oT3wCXwspSZ2YtcfBNjlmg394OhYrnVb0EMjvN9lXgaxVDFm6wa6RLlXa/AATgiM
	hw1LwJ1/xd2EKeKZKtfEPITmscM/VdnR8ZLdZMLJJLAAeGGW3qlfs/wxML6Fa+BM167XeHQihsjdY
	Te5Xsx7azHzheWEDrPJDRBU4Gg6VLHkrrbXOtPboqQnZkkmRWqolwkFAS5urGYXAGaDxmeXMx004F
	VCxeORT6ps9V7Tv7trOjNP8l/xkhIadWpLFlecvON5N1I/v39PG0ffPH9ZbDUeTecFZpPiu1CLUSa
	UdaBhZpg==;
Received: from ip6-localhost ([::1]:24574 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qsVqz-000iYK-24; Mon, 16 Oct 2023 22:14:25 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:61556) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qsVqu-000iYB-75
 for samba-technical@lists.samba.org; Mon, 16 Oct 2023 22:14:23 +0000
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50305abe5f0so6519679e87.2
 for <samba-technical@lists.samba.org>; Mon, 16 Oct 2023 15:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697494458; x=1698099258; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KvN8fCLlFe7Jrcf7tnyNS2O/KMreYubvjkRXV3ZF900=;
 b=J9Gz9DBRmbbyJCdBh3RVuDWQh6yaH+BHfhGxjl4Jm1zNmqGnKArnSaHBFkMZlVbZ3S
 ai7OT9cqr1mCOBVpEolFtewcLq0cKE27l0EYOZ2bgYLpDfic3D8zgtXSCP6Gzeq9nwfG
 035IbBhMwXi002Zbi6ezOzPu03d432xQM+pm8bn5qusdF10YmuGhqQubibLau9E30bXz
 Rv2lJNihQUpKKAOiI0tL/JuBkRAbrXOihEOlZC8uLnDXWTpwShl0zdOutpeOakUYJJhV
 y7b8zkhpiUYrEvX4TaTH0XjBVzWa73g9xN/JtkBHKfQPslplmnuFW8ubuSHb9MNDIx/c
 ekAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697494458; x=1698099258;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KvN8fCLlFe7Jrcf7tnyNS2O/KMreYubvjkRXV3ZF900=;
 b=eibMX3cy/kKsnrGOG93Yd9Rr6nouzruzNUYsHrAWYUH8cQFrCjB0hdNdlsmVIXVI7w
 +8zymbXeNxSmvF++Wq09OFQFUpv/9o7geUYUjuNlLuwASYC7d0YLd5X37TcEIqgAbwVE
 THpq+c6FRGwx3EgpKpjb9OMyX4w9IkeJ5ggTbFvJMN/vl0+oM4pEu5U+QnEsfnv3vCX9
 xh1iW8xslT0HQmz1Yb0CrgeHdQMl4yzeTbM9gjXIJIfQNLg8b0wMX9+YNuDHUnEPypgd
 deBSEyiJvXwhHulyzrR64ItxIgg8ZQUDMAlzwFM1GiIMKWUY4atTHWcdligrDVa2+vqT
 WXwg==
X-Gm-Message-State: AOJu0YwlDnrJr1oj3D9aCmn+btjz54oCqRC4ZyiSIn9LboktP5/fUH4x
 A4amw7HMSPNctA5ziLtS9iP1XGFE4yTSyVyr64w=
X-Google-Smtp-Source: AGHT+IFXFt/eaJWjHKduGhvzniZ6R3YYjayeqqEwooMHqMLyF5XD1We0e5s+zndoyLW1kupxy0QwGcfYS3q2cotGUGo=
X-Received: by 2002:ac2:5de2:0:b0:503:1775:fc1 with SMTP id
 z2-20020ac25de2000000b0050317750fc1mr474446lfq.31.1697494458303; Mon, 16 Oct
 2023 15:14:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mui-uk5XVnJMM2UQ40VJM5dyA=+YChGpDcLAapBTCk4kw@mail.gmail.com>
 <ZS1zSoRwv+yr5BHS@casper.infradead.org>
In-Reply-To: <ZS1zSoRwv+yr5BHS@casper.infradead.org>
Date: Mon, 16 Oct 2023 17:14:06 -0500
Message-ID: <CAH2r5mvBqqas=qrR+Sxfz2T99B2YbuJRn1O8vdpXhUc1CcnoQw@mail.gmail.com>
Subject: Re: [PATCH][SMB3 client] fix touch -h of symlink
To: Matthew Wilcox <willy@infradead.org>
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
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Oct 16, 2023 at 12:30=E2=80=AFPM Matthew Wilcox <willy@infradead.or=
g> wrote:
>
> On Mon, Oct 16, 2023 at 12:26:23PM -0500, Steve French wrote:
> > For example:
> >           touch -h -t 02011200 testfile
> >     where testfile is a symlink would not change the timestamp, but
> >           touch -t 02011200 testfile
> >     does work to change the timestamp of the target
> >
> > Looks like some symlink inode operations are missing for other fs as we=
ll
>
> Do we have an xfstests for this?

I was thinking the same thing - would be useful to add an xfstest for
this.  I actually noticed this old bug when someone reported an
unrelated problem (where "find . -type l" doesn't show the symlink but
"ls" and "stat" do) and the other unrelated symlink bug could be
useful to add to the same test

Are there other scenarios we could repro problems to an fs that
doesn't have a .getattr method (like cifs.ko, afs) or .permission
(like nfs and ext4)?


--=20
Thanks,

Steve

