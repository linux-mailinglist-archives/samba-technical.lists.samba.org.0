Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 73219BC6A9B
	for <lists+samba-technical@lfdr.de>; Wed, 08 Oct 2025 23:18:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ByM2tzO1+0a8fqPRSdXXC1vD77a0Sa0BPaX0ctDvc2o=; b=cpMQDgLwEE0WyeE6wRxVNLhHvz
	qNHR8dK9Fvga2osJP28D4Dxd4SsAY9+eIDPGkm/OPKwxlUs+C3WIWVoXeDDqUdGkOMBter67bF+OH
	2SLSvDba2x7W7U1W81OnUYIANFWvXiuW0G4iG9xOeYvVMMUsNI1YBpBlNOozaXxF549Ciff7Tzelw
	PPZVB+ugtrMzVK5uJtkl8lGoQ9sQZsTb8ONsutBmhEZgQtX/dZCIaNvYbPVpc+R/8g+0K8sbTJx3G
	EUpgsaOxWA3tIk9EYFpuv9Hw75+qXZk5mJKWOKMfu+Z+hV6gEilbD4onQsqQlBLhRI592dB7BT8pT
	PgfgK+Bw==;
Received: from ip6-localhost ([::1]:48720 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v6bXi-007KJk-3K; Wed, 08 Oct 2025 21:17:50 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32]:56501) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v6bXc-007KJd-QP
 for samba-technical@lists.samba.org; Wed, 08 Oct 2025 21:17:47 +0000
Received: by mail-qv1-xf32.google.com with SMTP id
 6a1803df08f44-78f75b0a058so3423576d6.0
 for <samba-technical@lists.samba.org>; Wed, 08 Oct 2025 14:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759958263; x=1760563063; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IiQD4aus3q4k5mLktWzfGVnKCAa7gtHvgEatPzTXuUI=;
 b=i+DzroJb+s4qndaI/GtOpX8vEg7RlQP0SEkvBjf6uPdPChLU4Z9y6hridecYabKw3w
 9Rmpp0tSNQR4Di1aRz4l85xWLXZrVt23akeuYZb9LFn/ywhOeR9ecHt+Gs4/GJaN1s08
 uRuFbEx1D2tilawUFWJOjuXZ6UI+LLbRVPgBTGmcYc5dT3kN7EgRW2xOjWUnls8aukfP
 vrZ6JZaVDlf6SvkhPnT5krfFFa2kFsNhRQebinvnf9eUYrdnuBo9gMZVnxo5UrkeYK2/
 gCNBL+Y6ZRZ18uUxHHTgJrPUua5OpL9+fvbtt1WWF+o9N4+IXszSdTD6f4VeEB+Y436g
 Eoiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759958263; x=1760563063;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IiQD4aus3q4k5mLktWzfGVnKCAa7gtHvgEatPzTXuUI=;
 b=lUpD5LpPqCM8q8FU7FvWwLKEgXY459sJeiPA+yTdLKk/kSkQJPt6WpwgrKLYsmB2wC
 puT2FRCmvw7vTURCtiD7OVTuHGWH8KCGVt4LzOwpiogc1hIMVn3PB4HrO7axMPCaqUd0
 copeW0hK7hQ05Uk3UXWB169S6BvlF4/Fc2ry62XIA48ZxaGv2zZ6Cy2HuFm+9/L82XWc
 94fW7wXPdewI/pFjC0X5RCxioSU/o9ogyhAL8uuYe0QuAEfCAC6BXGzaWzX+6gpt5ng+
 g6VYd4VoTewySzK3bpYB3Qj754RQigTgEP/EfWu/JVdcaZfpQx+Yhhva69A+chi1E6Bf
 VExA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyH9G2p6j65hK1KX7eNcCVCrKVb2oocP1bfOFyqRXE/0h+MSO0Cd68gHea21z6nUm4GzUuKhyE71sc0tLVfbY=@lists.samba.org
X-Gm-Message-State: AOJu0YwakW0N6KicwxwDzeVITIgKxwqrW+meTHEfBN8E1jlHOEm+4FEu
 XzhaDR5pMXR/9/MDV4/RQVHQ2TQNC2f8I6IQ8eK7d5Gq2lhHs0a2v3s0nIdqsiXrIflZclGgq+B
 0l4OEhPSWrMVkXeg5X+kfAJANv4NMsig=
X-Gm-Gg: ASbGnctOLovAX39oxwOZ6LXxv98dN5atVdw2pMmb2DSp668J1m2koDGpl8+LyErx4j8
 Pw7fX6myhzxJgmIj6UHgDJIDKlXtA/0LvHpCITDgGWDbO+mNyH1/FJb1LsvN01Sml57JqdIL4m9
 nu1HxroGkHTellhBR2G7KiMly+ahx7hDTDzwcymMW9dqIT8QCLt/Of7xCnNFV896sV0VAZiS/nh
 00LKE05OkYAICsAPOhgSSPrkZ8p58m7x4G7xOQasSgvZJ4ML77SeBELq4DSnZDwP3Iyrush6pEf
 hSxD412sqjfqLnFarCLjeDjFFmTzNM9jUGaRCZnwxVDoxWcrh4XSJLUILKSPUZA5+8XlbwIla9g
 PqG7iQUjhYfKAuSvJfimk8rHyx2nx4llYpu4x/MuTEOVn
X-Google-Smtp-Source: AGHT+IG8FLyHKn1oeo6CgH/4wnSvCui4G+V8qCY7UNt93fnOFT9L+MY/as8Uhv+yIPs5zMEriwCypGngO5gQ9WSl2Bg=
X-Received: by 2002:a05:6214:dc7:b0:879:d0dc:6104 with SMTP id
 6a1803df08f44-87b270285abmr69330686d6.27.1759958262708; Wed, 08 Oct 2025
 14:17:42 -0700 (PDT)
MIME-Version: 1.0
References: <02627021-da2f-41f8-9ea7-fd2da96e0503@web.de>
 <5bd37df6-1743-4b9c-a83a-a811e221489b@suse.com>
 <CAH2r5msZjL_krwN-nd1Ly3skxAHK9srJehPJ_vYXPLRFXpJ_yw@mail.gmail.com>
 <99546145-8c6a-4e26-a787-b5c9bb0b8613@web.de>
In-Reply-To: <99546145-8c6a-4e26-a787-b5c9bb0b8613@web.de>
Date: Wed, 8 Oct 2025 16:17:30 -0500
X-Gm-Features: AS18NWAnJ8p8MWygggpRKApGeP4BaaEIjA_0e-xoq7wJLsbPVWuM84aEtvfFvHc
Message-ID: <CAH2r5msuDxQVERP+hkbUriE1xhBmKWP-atTves+Yv_Rx_Y-qGA@mail.gmail.com>
Subject: Re: [PATCH] smb: client: Move an error code assignment in
 smb3_init_transform_rq()
To: Markus Elfring <Markus.Elfring@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Henrique Carvalho <henrique.carvalho@suse.com>,
 CIFS <linux-cifs@vger.kernel.org>, Shyam Prasad N <sprasad@microsoft.com>,
 Paulo Alcantara <pc@manguebit.org>,
 kernel-janitors <kernel-janitors@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
 Bharath SM <bharathsm@microsoft.com>, Tom Talpey <tom@talpey.com>,
 Pavel Shilovsky <pshilov@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

It won't any difference to perf since compiler will optimize, but it could
be worth fixing if it shrinks code

Thanks,

Steve

On Wed, Oct 8, 2025, 4:00=E2=80=AFPM Markus Elfring <Markus.Elfring@web.de>=
 wrote:

> > Also when a patch doesn't shrink code, but even grows it by one line,
> and doesn't make it much clearer, it is probably not worth changing (it
> complicates future backports of real fixes in the future eg). Let's limit
> these to those that shrink code and make code clearer (or ideally fix
> potential bugs)
>
> Do you insist to keep an extra initialisation for the local variable =E2=
=80=9Crc=E2=80=9D
> despite of the implementation detail that the value =E2=80=9C-ENOMEM=E2=
=80=9D is needed
> only for a single if branch here?
>
> Regards,
> Markus
>
