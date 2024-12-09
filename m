Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 172099EA13B
	for <lists+samba-technical@lfdr.de>; Mon,  9 Dec 2024 22:26:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=53NmjpME1xHX7DX/jgKMbQey7g7GeYI01hf4hjnj9q4=; b=t+NzyWDifyiWOaC/PMv+qQmfvH
	r7l7IH8P/FfD7CouX0+LBoRD/yP27JS5zs0g0HKYo1MlHNyxdjLxMZiRGeP2G4QLd/6ArY+C8smis
	lbS0wUTJtM70JUO7w1SPEpNP4dg0d94c+pJ6piAnbTqBnUwusTvmNF044N5er9GdmSJUA0KghDBbT
	TrAO6E2wkJ+jgF0PYRdhsP85k+ql/atMorcIstDUcDFSXoGteK82/zSYY8J9GoQSeXehaoXLJrjDe
	WnVkxOdCSGjxZtbGSBaJ8XAeEG75YMKYD/mQ5KPagOwetDOXBpr7rYgAr4+IKxVrq1HFYhunIPhSM
	hxK/djrg==;
Received: from ip6-localhost ([::1]:62250 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tKlGK-003n84-Jm; Mon, 09 Dec 2024 21:25:52 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:61618) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tKlGE-003n7x-V8
 for samba-technical@lists.samba.org; Mon, 09 Dec 2024 21:25:49 +0000
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-53f22fd6887so2203660e87.2
 for <samba-technical@lists.samba.org>; Mon, 09 Dec 2024 13:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733779544; x=1734384344; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=53NmjpME1xHX7DX/jgKMbQey7g7GeYI01hf4hjnj9q4=;
 b=ALWIY9iX9c56xh2hxV/pJfS83uIQYIMO23siwbzt+h1QoJFxKLy7pV3OK9VDMCPCfd
 LLFu/YCzQv4RWPpvY5SHAN+fB25g7ZIMxNhGU6wz3EK+NCcgmkXRKkkSHKXMVv1TGPoA
 xS4g/KAngShzUYaCuMnhgOXP22HiKzOiTCp4XKRzFF/VPwQ81HJpsIkxlGqYr/b+r/Tc
 NBjJ15Ulm9S3aliAO2pPQ2karV/Co2XsOo+OKJfbOblhR302d6iBtBXTZcMTf2dLEMbG
 Rc9yv3ORJz+pkdYFuvF0toWvDE/yTeRptwMgHpDjJDte5kY4iYme4xM+b0ZqVnw+e9LZ
 Y5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733779544; x=1734384344;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=53NmjpME1xHX7DX/jgKMbQey7g7GeYI01hf4hjnj9q4=;
 b=JWmBO5HP8ZxxY9Vyh5UQqauRCvR1j34yEwzmdZpxub+qXzXwqMJ9tkcxHs/x+pbGhS
 SZxJN+PXKf19md2x+qtFO4j5Zhe3cxluwebxg/lj5s5+P4RemrDKTJhfOMses94dmiUG
 NmZdYjLK0wrAo62iPfyCqdAH9+KlHt3bIObsy/zRBmhg0q0rBWPlnNgPG7DlswBi5+zN
 Z2lG7hEwW0KMIaWT2D55MIo4aaPhnBB5HX4IVr8Mqc7ejMVUuqcYD9yOPLh3GPiJnY9O
 vqzD52dHGLkptmKuN3XKLhhbcSnod7AJMrxAiIeMXMXBR8Gb3WLXYC5K7GnWjEuP1IW/
 phrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeArX0pt5vDsLIF+WNcNL/yJ+RRc0Yz6mDJj4Ho2EJh4J/AoCGaud1LYIoFJIpJcfD9z2ioGeH8vTT3o5PVR0=@lists.samba.org
X-Gm-Message-State: AOJu0YzsOkR4E8FK5iKER0GKtKxS7w2/SAOVrr38m/L3WGesS0Vqtksm
 WrFLp3BauFCrzakfXFJ+sPBThQMx5YD3KBeu9xPs/Ur1B6+YUeIg2rCxqo1pMOYqmh8oOz6UfI3
 lTEUAUq8AIQpAM/RTrxtS1aicQfg=
X-Gm-Gg: ASbGncsnRuCbl+2zOBuzRfZlz8qlfvXi19iS/iVzg1PIUPjljxwtA9yVlQGmD8FnHXg
 7YVwov1khISTg12pLlc0g5oYMLEMJ2M7IBxjNafLDgl9wGEvXpEJZCsJZcd557v8m
X-Google-Smtp-Source: AGHT+IHTDwqErjmIWofxz5/aGKnw+3l4AJ7nvW1mEqhxbKvkpvWY4PENkEagDjvrMk9CtW+nkydmoJbaUqhQmqrjCNY=
X-Received: by 2002:a05:6512:39c8:b0:53e:3804:579f with SMTP id
 2adb3069b0e04-53e38045800mr5583727e87.47.1733779542767; Mon, 09 Dec 2024
 13:25:42 -0800 (PST)
MIME-Version: 1.0
References: <20241209110708.40045-2-thorsten.blum@linux.dev>
In-Reply-To: <20241209110708.40045-2-thorsten.blum@linux.dev>
Date: Mon, 9 Dec 2024 15:25:31 -0600
Message-ID: <CAH2r5mvDEcu_-QkS=e-sUx3-_OAbz93P=pO7M-7B_aatKfRbrw@mail.gmail.com>
Subject: Re: [RESEND PATCH] cifs: Use str_yes_no() helper in
 cifs_ses_add_channel()
To: Thorsten Blum <thorsten.blum@linux.dev>
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
Cc: Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>,
 Shyam Prasad N <sprasad@microsoft.com>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 Steve French <sfrench@samba.org>, Bharath SM <bharathsm@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Mon, Dec 9, 2024 at 5:10=E2=80=AFAM Thorsten Blum <thorsten.blum@linux.d=
ev> wrote:
>
> Remove hard-coded strings by using the str_yes_no() helper function.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  fs/smb/client/sess.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/smb/client/sess.c b/fs/smb/client/sess.c
> index 0bb77f9ec686..3306fb655136 100644
> --- a/fs/smb/client/sess.c
> +++ b/fs/smb/client/sess.c
> @@ -488,11 +488,11 @@ cifs_ses_add_channel(struct cifs_ses *ses,
>
>         if (iface->sockaddr.ss_family =3D=3D AF_INET)
>                 cifs_dbg(FYI, "adding channel to ses %p (speed:%zu bps rd=
ma:%s ip:%pI4)\n",
> -                        ses, iface->speed, iface->rdma_capable ? "yes" :=
 "no",
> +                        ses, iface->speed, str_yes_no(iface->rdma_capabl=
e),
>                          &ipv4->sin_addr);
>         else
>                 cifs_dbg(FYI, "adding channel to ses %p (speed:%zu bps rd=
ma:%s ip:%pI6)\n",
> -                        ses, iface->speed, iface->rdma_capable ? "yes" :=
 "no",
> +                        ses, iface->speed, str_yes_no(iface->rdma_capabl=
e),
>                          &ipv6->sin6_addr);
>
>         /*
> --
> 2.47.1
>
>


--=20
Thanks,

Steve

