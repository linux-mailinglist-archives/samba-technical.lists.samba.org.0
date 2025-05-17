Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D05ABAC5A
	for <lists+samba-technical@lfdr.de>; Sat, 17 May 2025 22:20:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Bxe9LQxmBejqhUnY/9oT1NUiY/3f8IH0qnoMafyHVxE=; b=EAIZq26mkCWhVQ7sds4n5w5GJT
	c7eTfr1Nnirxjt2nWvO17OwKfBxVjXyNapmomeFZ/TKQgeiX1kLfeBJLbMfin5hgqlHFN8tdh/kiN
	ku43YcQrktGwHTg3jUSugj+fxm9V7jlcUurDA4ZAnHM4bRdQjmKibDBWWspWhaHqoHgXCwh++dc6L
	lqCI6YBBackCtLoyCyJreSS55AaWv5HDqO4kJqFpsRfEob8nfij9csakbZEfSyuRteyBJYvIlLudp
	hHqX20irOQSmhAP7lNEzUTkCuj5W3HSFfey/h354mpo2J9iyVoA/V97+H4JoaDtJZTs7eWu5VWNxa
	TYre747w==;
Received: from ip6-localhost ([::1]:58644 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uGNzz-003kOL-GI; Sat, 17 May 2025 20:19:11 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:43305) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uGNzt-003kOE-2e
 for samba-technical@lists.samba.org; Sat, 17 May 2025 20:19:09 +0000
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-32805a565e6so27338481fa.1
 for <samba-technical@lists.samba.org>; Sat, 17 May 2025 13:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747513143; x=1748117943; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bxe9LQxmBejqhUnY/9oT1NUiY/3f8IH0qnoMafyHVxE=;
 b=OpkXDbhCbF5EU/7auGxJPdOO2NBkYYqngIHzf/GoH8lgu8Ae491b0S6iXneL5Z9/vs
 Xx/uUvB7uYROiAlTIaHi+EFTMA/sMGhLBvh6ltwSZkE/qu7QRJKVBgnqkV/NFcm1sfy/
 WRueOAyDfoLD24z8evbHrPyDYN+y/mCpeg4n9HdErvNzvbwmoaEhwItHCX+OrSuGq84R
 U5sIy8ikK/sqrJpGOu8966JRAhWFRqfYLXQ03kfIC/E6JidWTW8hl7RtgqyuYj0T4oxx
 84wGP4QT24KzBzxX+lJklXAAnXK1x6XKWn7P5DVwr49u9rLeOCl+MJmFfwNfctVj6e5a
 5/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747513143; x=1748117943;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bxe9LQxmBejqhUnY/9oT1NUiY/3f8IH0qnoMafyHVxE=;
 b=ZPzpInT1hQmPHPcb/GVm8QXd0I8VOv7noslrrV3cJAW0qzv5IlRVzSjQ4e+KsexdTW
 pD+GK4SyrLBLkx5pGhf4umWDXza9QlmI8Sbo0Oeji4y4pCtGp1eUHUTT1e03p8x0tyRr
 CADvrD7BF+BEtKfRMKoT69CjjgJD+mqITkQfKaQAiUg/+6ZVEzHA2ohl0tLoM1FIHL5m
 tdAEJS6O3RncJimU2xxpRNjnuFDV6MnlRw/WD7UZaS8L9O8yR42xDqJXslZD3mXe2+E1
 xEyxKbCMIKgjxPV1RiDNDFRkT5R0Mz9HcDkVC6uvqV6fU05WIDgihChomsqEgL+vrO/3
 Y81g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAxg6iH/8zyNXBo3POhLXNlmwkmfOS7HDLydyOaoP39OvfzjZbHroC+DwW9wSv4JGaygY+50S9CkBcv4PKGBY=@lists.samba.org
X-Gm-Message-State: AOJu0YzMgk30UKILtZH+sdz2tL0MIVhyYq2MFGNcaAgGZM8Bf1gPURu9
 snTH30uc4bIyVnpJFi71wlfJE4TvzYaZLuNF8cz/bBJIwpFLl4JZ1osgl6WquBiUTKxH5QjPCTO
 cn+s08pzW1sIfqhV8/9ge/oSBN0v9D18=
X-Gm-Gg: ASbGncug6CMy5bcMHAwbCoGM+Fsa9MfbhI4Ygrk09vrjd9b31v/0WcFsnoJZeVfjQEL
 1WvWWxwzCzJH8PtBkHlVLuJgXw4ArgVJD1VPNPqXzl7RtIY62a1UJh1WvqTocqtYcXAIRfUQyEd
 x9MhdsEBClKaHCUas5WlXoIzIGzslAaKo=
X-Google-Smtp-Source: AGHT+IEkothdgJXqrPQfNYqU/Rd588XJkNSYCLUChzj98bM0OsY/FhsdrgrpGpGUyHmz8F0GnnbR23CFlAKHqPg30iY=
X-Received: by 2002:a2e:bea2:0:b0:30b:fc16:d482 with SMTP id
 38308e7fff4ca-327f8415242mr43463481fa.3.1747513143148; Sat, 17 May 2025
 13:19:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250516091256.2756826-1-wangzhaolong1@huawei.com>
 <860a4f7600814b17e48dbabe1ae19f68@manguebit.com>
In-Reply-To: <860a4f7600814b17e48dbabe1ae19f68@manguebit.com>
Date: Sat, 17 May 2025 15:18:51 -0500
X-Gm-Features: AX0GCFuAICdLPBTAXpZ0wq1jvW_7ke3xHmJajyqQ5qd3QP6gU3K9bSgYRhEi8nU
Message-ID: <CAH2r5mvo1e3034LpCWUAuE0=dDBb7R0bMCmt80dGRWKMegRV+Q@mail.gmail.com>
Subject: Re: [PATCH V2 0/2] smb: client: Fix use-after-free in readdir
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
Cc: linux-cifs@vger.kernel.org, yi.zhang@huawei.com, yangerkun@huawei.com,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 sfrench@us.ibm.com, Wang Zhaolong <wangzhaolong1@huawei.com>,
 chengzhihao1@huawei.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Merged into cifs-2.6.git for-next

I was only able to reproduce the rmmod problem once though (without
the patch) so been tricky to test.  What server were you testing
against (I tried current Samba and ksmbd)?

On Fri, May 16, 2025 at 8:50=E2=80=AFAM Paulo Alcantara <pc@manguebit.com> =
wrote:
>
> Wang Zhaolong <wangzhaolong1@huawei.com> writes:
>
> > V2:
> >   - Correct spelling mistakes in the commit message, such as 'lopp' -> =
'loop'.
> >   - The titles of patches follow the same style.
> >
> > This patch series addresses a use-after-free vulnerability in the SMB/C=
IFS
> > client readdir implementation that can be triggered during concurrent
> > directory reads when a signal interrupts directory enumeration.
> >
> > The root cause is in the operation sequence in find_cifs_entry():
> > 1. When query_dir_next() fails due to signal interruption (ERESTARTSYS)
> > 2. The code continues to access last_entry pointer before checking the =
return code
> > 3. This can access freed memory since the buffer may have been released
> >
> > The race condition can be triggered by processes accessing the same dir=
ectory
> > with concurrent readdir operations, especially when signals are involve=
d.
> >
> > The fix is straightforward:
> > 1. First patch ensures we check the return code before using any pointe=
rs
> > 2. Second patch improves defensiveness by resetting all related buffer =
pointers
> >    when freeing the network buffer
> >
> > Wang Zhaolong (2):
> >   smb: client: Fix use-after-free in cifs_fill_dirent
> >   smb: client: Reset all search buffer pointers when releasing buffer
> >
> >  fs/smb/client/readdir.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
>
> Reviewed-by: Paulo Alcantara (Red Hat) <pc@manguebit.com>
>


--=20
Thanks,

Steve

