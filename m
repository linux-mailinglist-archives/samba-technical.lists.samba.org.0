Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A8572EFE0
	for <lists+samba-technical@lfdr.de>; Wed, 14 Jun 2023 01:18:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=T9oFByAzuwdj+HsDoRgbHwbCEXCI0Rwd5k3Gw6RNojE=; b=Vj31me5tjZ8QZiB0BIwcnfZ3eB
	Z7bX0dvdRyGkOMqF8IoZb0Dqut8/eRZoLXVkKnOzfMeeIyKSg3Fy9U8T2pGbReSALaDVaNoQd2N5o
	0DouNn0oCkSXC4mjAxXZGJyMs6/proV2kyczMnATney1kM9C1OOJSe2wRDosvv/AtdTMsD6okqeDu
	PWYas+c/QMxnCBusXjoRlw7FEP1dVCmqHVZjF7owQz2cUZi91eqhZF+F8SNu1taqs96ehHz0yuwBH
	n9TofWT+ndc/7OjP9KjjQOVT3GvzafcW1R7oRi+DimWQ0VufjhCmNOuAQMdk2Pmh1/bwwvHWNzAEo
	jYgo1fMA==;
Received: from ip6-localhost ([::1]:43618 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q9DGt-0029W9-8x; Tue, 13 Jun 2023 23:17:55 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:57407) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q9DGn-0029W0-Nn
 for samba-technical@lists.samba.org; Tue, 13 Jun 2023 23:17:52 +0000
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b1a46ad09fso655341fa.2
 for <samba-technical@lists.samba.org>; Tue, 13 Jun 2023 16:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686698267; x=1689290267;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T9oFByAzuwdj+HsDoRgbHwbCEXCI0Rwd5k3Gw6RNojE=;
 b=Bwcj5rTA4MzDF+tXocbm/r7JcZIIzfMQcCeNt3W3EAt4lBk7I7xJCIPtcZYOOUy1JH
 luHw99WjiPBVy8o3JH/LaZHzJUlwx7uHuma1ieMT8WmiIy7jzNVwfFeIwwuZIK6+Amti
 O9FNGNtN37Z+GgeNOpccysbUyRZHnjznxYVOi91GQsXKaVrrXaKPff7S4q1a7IYwKOx1
 kfoZL+L/93u42sO+OeySFLc6cKdhp0ZRALG9OfswOpYeeSeMv7YVjrWV+ISntUPJFMi9
 EcDBcEK1ia6r6RniOr+V7VIbAxne2IDYQV0/cJqHpR3rK4zP79QOQGvCKztm6LvkHoe/
 GOsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686698267; x=1689290267;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T9oFByAzuwdj+HsDoRgbHwbCEXCI0Rwd5k3Gw6RNojE=;
 b=dBE0li90FzJiL/EMI3cL62TItpv1VChe8eOJiuqrxaGFE/iclZ65p9F7LFZtbbhkAr
 KnGszFR8+lBJGHIhP1IW5vJkLzojbXMSh98y/uIqTU/dHqsAx4Ty+007dwUTDIC5sDfJ
 TpQISCIpj2mV1t2gf6uyev3yk/ZSKCaB9UxQsLTXBzUJ3ywBBqpzostb+Udh6KynZzBa
 6QdT0yIBBHtZi5K5pzm0HYhVuxzyQutZZgfPTrVs2+Md8wcNGdckLC1hGvwVmnK+m6ow
 olVo7U59BHad2LT0WmbGnYlMXj6ZemJvkQjQBvgFe/kdoZXuURjJNtdHFiVTd/LV7Gdk
 EPpQ==
X-Gm-Message-State: AC+VfDxRw0sRkzxiaHkvQGGcLv+Y3KsrCZLDZI1kGS2U1YKjN3bmxYa1
 MT25y3sboz0BRlDckXs8begTImcicGtaqlJHdAdHsvmxTXY=
X-Google-Smtp-Source: ACHHUZ5eERM7hKG+43pMJWnWZy7bPCECwe7WCyHWlpfZyXI1mjb9cG7GpMyEAsJJGgnG28h0kYcohfNBBmU8AjYgy04=
X-Received: by 2002:a2e:87d3:0:b0:2b1:b6aa:c5f6 with SMTP id
 v19-20020a2e87d3000000b002b1b6aac5f6mr5407634ljj.7.1686698267231; Tue, 13 Jun
 2023 16:17:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5muZavtKBU__Qy2s+XRG11u1HXyjC3oXF2yxY5h1b2jh1g@mail.gmail.com>
In-Reply-To: <CAH2r5muZavtKBU__Qy2s+XRG11u1HXyjC3oXF2yxY5h1b2jh1g@mail.gmail.com>
Date: Tue, 13 Jun 2023 18:17:35 -0500
Message-ID: <CAH2r5muVt+x26kMQ+OsB4WOVZ4bqeTLtG0GAVSXksSuE6YDy=Q@mail.gmail.com>
Subject: Re: Samba returning mtime for multiple time stamp fields
To: samba-technical <samba-technical@lists.samba.org>
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
Cc: CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Samba seems to be the only server with this bug (I tried it with and
without vfs_btrfs as well).  The test works to the other servers I
tried including Windows.

Windows server updates ctime on hardlinks, but Samba fails to update
the timestamps in this case since it looks like it populates both
ChangeTime (ctime) and LastWriteTime (mtime) based on mtime rather
than setting:    ChangeTime =3D ctime (and LastWriteTime =3D mtime).
Locally the mtime and ctime are correct on the Samba server, but
remotely it reports it wrong.

On Tue, May 9, 2023 at 3:54=E2=80=AFPM Steve French <smfrench@gmail.com> wr=
ote:
>
> I noticed a problem with Samba when running xfstest 236.
>
> xfstest/236 does
> touch file1
> stat file1
> ln file1 file2
> stat file2
>
> And checks to make sure ctime is updated.  Locally I can see the ctime
> is updated, but Samba reports the value of mtime in both mtime and
> ctime (and doesn't show the change to ctime which causes the test to
> fail)
>
> root@smfrench-ThinkPad-P52:/mnt2# stat /test/out1
>   File: /test/out1
>   Size: 0          Blocks: 8          IO Block: 4096   regular empty file
> Device: 10302h/66306d Inode: 552933716   Links: 2
> Access: (0777/-rwxrwxrwx)  Uid: ( 1000/smfrench)   Gid: ( 1000/smfrench)
> Access: 2023-05-09 15:49:37.000109800 -0500
> Modify: 2023-05-09 15:49:37.000109800 -0500
> Change: 2023-05-09 15:50:08.405799460 -0500
>  Birth: 2023-05-09 15:49:36.980131061 -0500
> root@smfrench-ThinkPad-P52:/mnt2# stat out1
>   File: out1
>   Size: 0          Blocks: 8          IO Block: 1048576 regular empty fil=
e
> Device: 35h/53d Inode: 226         Links: 2
> Access: (0777/-rwxrwxrwx)  Uid: (    0/    root)   Gid: (    0/    root)
> Access: 2023-05-09 15:49:37.000109800 -0500
> Modify: 2023-05-09 15:49:37.000109800 -0500
> Change: 2023-05-09 15:49:37.000109800 -0500
>  Birth: 2023-05-09 15:49:36.980131000 -0500
>
> #  /usr/local/samba/sbin/smbd -V
> Version 4.19.0pre1-GIT-3633027e49a
>
>
> --
> Thanks,
>
> Steve



--=20
Thanks,

Steve

