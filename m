Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E848880AEE2
	for <lists+samba-technical@lfdr.de>; Fri,  8 Dec 2023 22:36:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=wHJCl3nDFuly3GMX2Yt7GFyzHFugHTAbl1QraemB6HM=; b=DDQJ9cVYet9IkKf8cOw9fJgxyW
	rIITBnC8+3ncKOj2wUN+CDChun22lChfYb1vWG8W5/ZHKEtol8GAA1ACaKiNy13IpytaYQYpScB+w
	NU28NoSTGayOc49LwzOLp4ev8jq9UUwyjJwAkTGJPvc8ai7O4e9aBZyqwLRFamrCar3Ufd/EYr0Vx
	Ui1fUCxtdyZmHny7Qc/x5nIz2GW7S6Z5ea3dar3u4Ew0r2HYp+YBpiX5TZS8YR54uVjUd0EJ6SImF
	5DiGkjAqK8TfhXI/V/ivhlFMpzYOHhHJ/A5+2FxW6ArMGnkf1wWxlEHW17452NOnceeiZb4J1c7cy
	xlijAPCw==;
Received: from ip6-localhost ([::1]:42296 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rBiWE-005Cpy-9V; Fri, 08 Dec 2023 21:36:22 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:51343) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1rBiW9-005Cpi-T7
 for samba-technical@lists.samba.org; Fri, 08 Dec 2023 21:36:20 +0000
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50bffb64178so3040663e87.2
 for <samba-technical@lists.samba.org>; Fri, 08 Dec 2023 13:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702071376; x=1702676176; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wHJCl3nDFuly3GMX2Yt7GFyzHFugHTAbl1QraemB6HM=;
 b=ZaW4BLdcJXUSlO/CvSPxQezOnHda5XvdSgSWcjpJ/h2AKpza45LIZxjhSJ66nqIWQz
 L2XhVCtSIRz0upWD7D9hjhu4kGB6OYsloNZ7OUga1XY6qAYPJyqzP7AgD0nIHCTsWIbP
 7HJ9n0SJPzkWZ9VbLHUrUlw5s+OLaloVc40d6FREClyerUO8eJkL5KLjfU3QiWpZ6Wty
 FnYqHHzq1AbskaPAjuJFSLjIBg+AO+SFOmGwFqRkQi/PchokrbzxJ6a+xT92QzLJq/my
 LMvZFvc1tP631CLd+FS1L7T0P72dgF5C/VxkfjcVOEwPeUCY+GiHmXIlVqZMGQOZOVaL
 7Y/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702071376; x=1702676176;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wHJCl3nDFuly3GMX2Yt7GFyzHFugHTAbl1QraemB6HM=;
 b=TfqkrtzLT4ZyKV8+dYg4JN1808Ryybg041knvP4jo1twGRf5ANyOW9ID6EffcP0KNg
 vaCLECoxFlz4KlwGKFxhLqKA4LLQqN0S06LVer1Vb9DGnRIh78N+yB89Lv7bqVB6QsRb
 nIsyKcYmfMc9dvIYkLJVpiQyuzEqEjq502ArIAb3E7Cjj8556Q8uHYuqObE5c0FnTioo
 DdBab+wupXy5ZmfusesyeO3f8T7JvxGV6ZGIsKJnpGpvZfcNRoCsKS6aa6jhCEJ+hPqh
 GURHyFqytYdB41Bs4vHoMFzDsCTritecwmNreiUhqnQURb44WM2+mcRtqFEQQGmf7uSy
 OpcQ==
X-Gm-Message-State: AOJu0YyvRQgXxnNL0WWJ/R9tk7ynKBdTpRYzEWIEj8138fzRhxWU0Uif
 a/VVNErQM+m0ZrvYSVIRUvKlIp7BUIgWdhvFLrM=
X-Google-Smtp-Source: AGHT+IE4MvXswdqa8bZcx8xbuZsrvK5mMn4Kpa6KWeIHVHRfspV8HFYRQzx83pxar9xpeqWvZPJaaZEQtKI+z7i3LHY=
X-Received: by 2002:ac2:5f91:0:b0:50b:c8a4:a96a with SMTP id
 r17-20020ac25f91000000b0050bc8a4a96amr270522lfe.39.1702071376076; Fri, 08 Dec
 2023 13:36:16 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mtK-JQeH5gLoGjUS5sywfd-KTJhnF_Mf4c+KCoapMEPhQ@mail.gmail.com>
 <2f21c53c-c374-40d3-b9ff-f2af8ec219cb@talpey.com>
 <ba42bcc91981af579d70a239f18ad810@manguebit.com>
In-Reply-To: <ba42bcc91981af579d70a239f18ad810@manguebit.com>
Date: Fri, 8 Dec 2023 15:36:03 -0600
Message-ID: <CAH2r5mvJw5PdPi3JByNO3fNKXa-8Z=KRDT2sNw_R62aDXr4HWQ@mail.gmail.com>
Subject: Re: Lease keys and hardlinked files
To: Paulo Alcantara <pc@manguebit.com>
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
Cc: meetakshisetiyaoss@gmail.com, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>, Tom Talpey <tom@talpey.com>,
 Shyam Prasad N <nspmangalore@gmail.com>,
 Meetakshi Setiya <msetiya@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Dec 8, 2023 at 1:07=E2=80=AFPM Paulo Alcantara <pc@manguebit.com> w=
rote:
>
> Tom Talpey <tom@talpey.com> writes:
>
> > On 12/8/2023 12:01 PM, Steve French wrote:
> >> Following up on a question about hardlinks and caching data remotely,
> >> I tried a simple experiment:
> >>
> >> 1) ln /mnt/hardlink1 /mnt/hardlink2
> >>     then
> >> 2) echo "some data" >> /mnt/hardlink1
> >>     then
> >> 3) echo "more stuff" >> /mnt/hardlink2
> >>
> >> I see the second open (ie the one to hardlink2) fail with
> >> STATUS_INVALID_PARAMETER, presumably due to the lease key being reused
> >> for the second open (for hardlink2) came from the first open (of
> >
> > Ok, so that is a client bug.
>
> I guess Steve forgot to mention that the above only happens with the
> patch applied.

This fails for me with mainline (I hadn't tried it with her patches), so ye=
s
this appears to be a different client bug

--=20
Thanks,

Steve

