Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 651AF9A00D4
	for <lists+samba-technical@lfdr.de>; Wed, 16 Oct 2024 07:36:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=FpFzgW48v/2WJ52rpa7W+YR88yLyOSmQvacK2YcE0vs=; b=4UD/MtKor7Ktvg1UvWJNQxqvQx
	WVkP9t6kFMGSvRav3nhMppblQRgtb4TYXKCdeBt05vHE/0FfvSCy9mgfTg66r3HdJlMARFZVeMif5
	hrxMS2Y1yCDgdohhJVFY0HJScDtXoFqyCSRCErqteSz6R0m6v8vuXk0Tuv+GjaRsf9kXhyek103M0
	iJzMzv3a2DQ3iMr+zFYBXoVLhhNT1id2NLZnGRZ/GRamRvEiQVSZgBY0p5MhKdCBGC2MGYi56gKOF
	yEcXo0CNhDwxl0k2nH+Ww5naBcBDM6WJgY1+BfD0TkY0rlyqbA/lT7XB6mL1jZePlwXDPwaHiqxPw
	Y3V+btJg==;
Received: from ip6-localhost ([::1]:52718 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t0whi-0047ED-Gt; Wed, 16 Oct 2024 05:36:14 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:46467) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t0whd-0047E6-8O
 for samba-technical@lists.samba.org; Wed, 16 Oct 2024 05:36:12 +0000
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-53a007743e7so1786282e87.1
 for <samba-technical@lists.samba.org>; Tue, 15 Oct 2024 22:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729056968; x=1729661768; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FpFzgW48v/2WJ52rpa7W+YR88yLyOSmQvacK2YcE0vs=;
 b=KiL6RTZ6uHag+mGT/98la9Kwp6oTz4ts/TonjYIt+LBZ/p6bwQJgjd4k2XcUVfMWTM
 JIe3WZkWe7jJ+M+X3PbRTgzkgISEJ614/QVy4VXRGexpvcXzYH2CJKihTsLBy1lzqM+z
 BcEusJXoNrgJNtA2ZIsrXQLjI3AThwrPVKEU1vFGFIiEVFGXio68OTtuh+JBmq7eFY7O
 QP6xBdCkdLMF7eRQsOXpsKA2WQKZ+BkT3Ikems7d/YSIYBm3PDS6xtu4+rkXjCLpYUJ6
 wRAkGnBVM3JFyoHA0vrwlKyeHa2i5zev/1With8RbC2HvxpvQWxuHrOSbBOSPThvw1MX
 FrKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729056968; x=1729661768;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FpFzgW48v/2WJ52rpa7W+YR88yLyOSmQvacK2YcE0vs=;
 b=YuOYNnuqY0QZQTbVdQK1I23IQ0mAAFzo/MBuw2fPoTmyqlb0W++wi6sUSdBqsUVuj1
 Kxog+7NPu27vbHBR5nvEH5vfdksyXhvA5ubdS4I3cmSNnlRNLTCXProyyQ0d8rNbxCHN
 Ik167kX8Gi0aBMvK1pY5tiPqmSbutEyAhT83iatN5RVGRyuvXo7/MrOp6j8+AMI2yqUx
 KUG5CHP5VAUvqFYOhKZ+byxmfIpr3OzEHeSgzDk3o0w0t+tQc9o4DI8Po1MN+EaN5mBs
 8DftqahX0Bhp5p12DWuLjmCEqvkStyKPfwaCO+v1NX7zVrGVh2boxV7lu7AT63dOm5Au
 EtmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCViujPa5Wu8og58X1dNyG0huj3mp+FZ39OZKE9CrDBVzmLBLv3DeZ2BaqUtn/Z0nC6chkHTZXvFya91kPfIG0s=@lists.samba.org
X-Gm-Message-State: AOJu0YzcK6W9lQDU9Bsp0GDYU8iFmBPjdM8ZN0c0lXuM63LqiQhHwYpw
 jJxq+JbTqzPB3LpKSnWU25dlnMOm6fQtfDjLNFaJ7N5GYP5piJTbEJhnngjwcK5eCKsxuMF/3uu
 L32XBRnPS+P3QKXBBD7Dy3Zpwnfc=
X-Google-Smtp-Source: AGHT+IHndmCm/EMXJXuOFINZjOEoWro6KrtmVvkmaBHgAUiFCfIOV+zT26SggvV9rS71zmBuYVLfzcWnox5WdYRK8qs=
X-Received: by 2002:a05:6512:3f29:b0:539:ee04:2321 with SMTP id
 2adb3069b0e04-539ee0424e1mr5151271e87.33.1729056967486; Tue, 15 Oct 2024
 22:36:07 -0700 (PDT)
MIME-Version: 1.0
References: <20241015102036.2882322-1-suhui@nfschina.com>
 <c0afa02b-991c-4601-bacb-13ace9cb96f2@stanley.mountain>
In-Reply-To: <c0afa02b-991c-4601-bacb-13ace9cb96f2@stanley.mountain>
Date: Wed, 16 Oct 2024 00:35:56 -0500
Message-ID: <CAH2r5msLmsCn_uHqyzFy8CXy6uCheOECNSXLReJdS4u1C4aN0w@mail.gmail.com>
Subject: Re: [PATCH v2] smb: client: fix possible double free in smb2_set_ea()
To: Dan Carpenter <dan.carpenter@linaro.org>
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
Cc: pc@manguebit.com, tom@talpey.com, sprasad@microsoft.com,
 llvm@lists.linux.dev, Su Hui <suhui@nfschina.com>, linux-cifs@vger.kernel.org,
 kernel-janitors@vger.kernel.org, samba-technical@lists.samba.org,
 nathan@kernel.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org,
 sfrench@samba.org, bharathsm@microsoft.com, morbo@google.com,
 justinstitt@google.com, stfrench@microsoft.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next pending additional testing

On Tue, Oct 15, 2024 at 5:45=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Tue, Oct 15, 2024 at 06:20:37PM +0800, Su Hui wrote:
> > Clang static checker(scan-build) warning=EF=BC=9A
> > fs/smb/client/smb2ops.c:1304:2: Attempt to free released memory.
> >  1304 |         kfree(ea);
> >       |         ^~~~~~~~~
> >
> > There is a double free in such case:
> > 'ea is initialized to NULL' -> 'first successful memory allocation for
> > ea' -> 'something failed, goto sea_exit' -> 'first memory release for e=
a'
> > -> 'goto replay_again' -> 'second goto sea_exit before allocate memory
> > for ea' -> 'second memory release for ea resulted in double free'.
> >
> > Re-initialie 'ea' to NULL near to the replay_again label, it can fix th=
is
> > double free problem.
> >
> > Fixes: 4f1fffa23769 ("cifs: commands that are retried should have repla=
y flag set")
> > Signed-off-by: Su Hui <suhui@nfschina.com>
> > ---
> > v2:
> > - Move 'ea =3D NULL' near to the replay_again label.(Dan's suggestion)
>
> Thanks!
>
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
>
> regards,
> dan carpenter
>
>


--=20
Thanks,

Steve

