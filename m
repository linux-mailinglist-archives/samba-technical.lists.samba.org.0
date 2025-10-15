Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 762E6BDFA3B
	for <lists+samba-technical@lfdr.de>; Wed, 15 Oct 2025 18:25:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=XqHkGy7/fjPRyWV+kWEFR8BXKKYz0Livb4VHAc53lUY=; b=5tjF9OiDnsbz4RGN1GorMigXVb
	Qs5gLMeorbd/4C+J7DmlO1z5N6w2cGW1FXlSYQIwcCvmOsl+5W+CXmr6Z8haUnt3UZpqueCQz2KDI
	hN71YwSb9l41qi7j1Sbugsc2nK8M/TvnWFujRXODbhJTz7L3zkjsQ2YFYTZCn3i1af5ub3GvEqYwv
	lALOV/TLTqsuSraFSTBHlZ/Uxlm85pmZkDTbxeU950S5e7TfebCKRjWEC5XLkGxI4Hefk3N4So969
	Z6NP6riZCg6h/rNI3khq3A8EIthar5a1YifqAoVsTaKKWRoevu6wRD/+9Pvk9CCe+MnJdO/p5dHEG
	sh7qYgPg==;
Received: from ip6-localhost ([::1]:41820 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v94Iu-007s3v-FU; Wed, 15 Oct 2025 16:24:44 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:57751) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v94Io-007s3o-V1
 for samba-technical@lists.samba.org; Wed, 15 Oct 2025 16:24:41 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-78eba712e89so84888606d6.3
 for <samba-technical@lists.samba.org>; Wed, 15 Oct 2025 09:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760545477; x=1761150277; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XqHkGy7/fjPRyWV+kWEFR8BXKKYz0Livb4VHAc53lUY=;
 b=XRhLHCWCuZv3HjRuABP/CO84rhqCmOngDGCLlED+W8buHc97A2G7NxFAA90Dwwk11O
 dYqfbJZEGnSlsBSVwVYDVeK/j+u2Q/qALG634l1lFw/l3xf6uenrhJ9qG74zjZz4OCwS
 C8tYyyohaX3Bm+nHWB/Ajth2QmKsVgvrbCUjmXTeKrwF2oA3najrGaSTZEm4II6HQAV5
 EpvT4Feimyi0+egXghNWhuNquF27iyC7Vco2d8jgyN97au0vb00+HXy5nRG8bAB8UFNT
 r6A2Noqzk6yNBZu8hkzeMKyOA9h0SyEmuCjWVtkDAkR/pW7FkJ53C1JemB9Wvl2Ep94y
 FQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760545477; x=1761150277;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XqHkGy7/fjPRyWV+kWEFR8BXKKYz0Livb4VHAc53lUY=;
 b=hLRXiJNSyz+mqaP2RsgbvTAJeALCrelE3XX2HViKlxxwFoxhaPOawAKlXc3vv9w7uC
 Owrw5bI00ICobio8QQnxNkFBFcjGwPCABERZyjibL8kzhWEXCvQqtXMU5q9umAfc8MgR
 CmewyUnyMjc3kV6iMZr2fjzEBG35c0HFGK4en0bxk6Peyfbzw+QMBKSKVSndIX4qHMrG
 lvJOWzRnNrXfQJ7uqj7BfRuN0eHzLoKkpMpLb2tqm5e+BC4u9xhA6/yyuR4jZLPiaL9Z
 0OLK1xPzpSbJRdYBQGB0TRCogNl00uIPaRIn2X3WbLGERlky7fm/VA05VuEhIzzaViut
 Fmcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXsV1w+XVd3YlJdAbOqsOkucMI13XGuIyXVR6SaHbF0EA7lcIiUhZ3xJeb1bgqwix4xF0YzNUWXr8ur/vxzlQ=@lists.samba.org
X-Gm-Message-State: AOJu0Yw2PTEbwpQQCl+PpujznKr92FA1a6t91e/x6KSCuAi1s9+bipPl
 iGSoLedrN2RCn2ws4MSfvVur4yfiJCoxY8+F6uPpNLxQb19U3MAefcZ1CWX/+L9PYx3zy1ERtY3
 FFQn5G0xaA0o9ZDAdcHBJI9KUeJEfa18=
X-Gm-Gg: ASbGnctnZ2kz2XldUJIrIeaX9pZIdZt/yz6GcCK4IbihvS0ERo7HNUd7NLHXDCZ8z/U
 YLer79jhs5WFTRZmXkTGlfSSnihQnvNmheBHp7qnIZbCkD2Z1qcBwUGjixYV1tlMqOy7mzeSwWw
 Lftyq5KdeAHUvr3u21gYxmoedVRVlgEGWQGAGtrXrah+XDU3WAce0Qpg7OD8bfM7J2yboHyF2Ve
 BrMnz2s2XAz1GKzP2BgyQhQq6dphyi3yN7muM/t7BWN0FdEEA5hBRdwXHVb81I3wmEQ+ZBH4OJe
 kZOypG1z5utmC7uR5NtFsgALOouUHMuu2Ha4Bdm2lvkUGAGl1rAP//KqIjJhEOWsOWtnT2K+0Bx
 uqYEOLU6r3ua920MhzD7JFjzkuty6WtFJtBu8Kw==
X-Google-Smtp-Source: AGHT+IEVzZ+yLpoj1ia1wn/HsgbfqSzpJvZS6OpqjFjtVolpUr4+7TdWXEXq5uKPKk5gecG1XDu8E1ejxl7P3daRDUA=
X-Received: by 2002:a05:6214:2aa6:b0:824:30f8:ed70 with SMTP id
 6a1803df08f44-87b2107268fmr345152266d6.9.1760545476870; Wed, 15 Oct 2025
 09:24:36 -0700 (PDT)
MIME-Version: 1.0
References: <20251015150504.1109560-1-metze@samba.org>
In-Reply-To: <20251015150504.1109560-1-metze@samba.org>
Date: Wed, 15 Oct 2025 11:24:23 -0500
X-Gm-Features: AS18NWBgQv739s_NDjluG-V1hfp_W88BsgWQzXb0RipseMP32HeztWH9o4E72DE
Message-ID: <CAH2r5msUtZHp0jNWM142zyFvrqp+tLPyXR=bz+hCam_3HB5iQw@mail.gmail.com>
Subject: Re: [PATCH] smb: client: let smbd_destroy() wait for
 SMBDIRECT_SOCKET_DISCONNECTED
To: Stefan Metzmacher <metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next pending more review and testing

On Wed, Oct 15, 2025 at 10:05=E2=80=AFAM Stefan Metzmacher <metze@samba.org=
> wrote:
>
> We should wait for the rdma_cm to become SMBDIRECT_SOCKET_DISCONNECTED,
> it turns out that (at least running some xfstests e.g. cifs/001)
> often triggers the case where wait_event_interruptible() returns
> with -ERESTARTSYS instead of waiting for SMBDIRECT_SOCKET_DISCONNECTED
> to be reached.
>
> Or we are already in SMBDIRECT_SOCKET_DISCONNECTING and never wait
> for SMBDIRECT_SOCKET_DISCONNECTED.
>
> Fixes: 050b8c374019 ("smbd: Make upper layer decide when to destroy the t=
ransport")
> Fixes: e8b3bfe9bc65 ("cifs: smbd: Don't destroy transport on RDMA disconn=
ect")
> Fixes: b0aa92a229ab ("smb: client: make sure smbd_disconnect_rdma_work() =
doesn't run after smbd_destroy() took over")
> Cc: Steve French <smfrench@gmail.com>
> Cc: Tom Talpey <tom@talpey.com>
> Cc: Long Li <longli@microsoft.com>
> Cc: Namjae Jeon <linkinjeon@kernel.org>
> Cc: linux-cifs@vger.kernel.org
> Cc: samba-technical@lists.samba.org
> Signed-off-by: Stefan Metzmacher <metze@samba.org>
> ---
>  fs/smb/client/smbdirect.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
> index 77de85d7cdc3..49e2df3ad1f0 100644
> --- a/fs/smb/client/smbdirect.c
> +++ b/fs/smb/client/smbdirect.c
> @@ -1575,12 +1575,12 @@ void smbd_destroy(struct TCP_Server_Info *server)
>         disable_work_sync(&sc->disconnect_work);
>
>         log_rdma_event(INFO, "destroying rdma session\n");
> -       if (sc->status < SMBDIRECT_SOCKET_DISCONNECTING) {
> +       if (sc->status < SMBDIRECT_SOCKET_DISCONNECTING)
>                 smbd_disconnect_rdma_work(&sc->disconnect_work);
> +       if (sc->status < SMBDIRECT_SOCKET_DISCONNECTED) {
>                 log_rdma_event(INFO, "wait for transport being disconnect=
ed\n");
> -               wait_event_interruptible(
> -                       sc->status_wait,
> -                       sc->status =3D=3D SMBDIRECT_SOCKET_DISCONNECTED);
> +               wait_event(sc->status_wait, sc->status =3D=3D SMBDIRECT_S=
OCKET_DISCONNECTED);
> +               log_rdma_event(INFO, "waited for transport being disconne=
cted\n");
>         }
>
>         /*
> --
> 2.43.0
>


--=20
Thanks,

Steve

