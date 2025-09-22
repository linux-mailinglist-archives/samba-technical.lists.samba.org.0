Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DC6B920C4
	for <lists+samba-technical@lfdr.de>; Mon, 22 Sep 2025 17:49:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Qlg2oopvF77trHsNmLt3OpgaKYs1PYeJnpJK0K9pt00=; b=iQsaN/Jcygst0aXXbaXKcvTqhl
	6PapcD7eCIj9rNvoMO6rtz1GzbrYLq9Mtp4A5VnyN4RC3ljcMeAZBEQE+XTuArKTxICyERPuwpChN
	l5l9sXFChCLYn++mVsjulGcCEaiPvY0dfuATtgquK862Sm46hEVgMPL+zz+LmAzMGEbn4MFhvazlV
	dTT38H8IdsMl7ojBg2PJ2nl9u/C8ojlkSHtNOzV5AKNgK7EuCddY8FEDpLZ3+iaLxXp2AUS9hCJez
	NhPPsmAEmeAFGvSLYahCo5XpaXLQjS0GzVj54P8GtWlEgydFgaUxFO11VPnjz0cK9rwMpQ4+lhLXZ
	MWF7yvbg==;
Received: from ip6-localhost ([::1]:56418 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v0imo-004YJR-BA; Mon, 22 Sep 2025 15:49:06 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30]:52684) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0imj-004YJK-Ne
 for samba-technical@lists.samba.org; Mon, 22 Sep 2025 15:49:04 +0000
Received: by mail-qv1-xf30.google.com with SMTP id
 6a1803df08f44-796fe71deecso38854136d6.1
 for <samba-technical@lists.samba.org>; Mon, 22 Sep 2025 08:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758556139; x=1759160939; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qlg2oopvF77trHsNmLt3OpgaKYs1PYeJnpJK0K9pt00=;
 b=B9AXHF93MxIRVXKPctvGZ4i+iPt+LDzhoLx0FWRxzjbKkLy+WCbesGEMBBEfz6nNKo
 gThx4foiJ66DrsUhjImDshpg02No5am1SzFR8lvYNBwc9OXCZ9TiziSe0FzgKIOOenDY
 BT/UnwIwtCkQaBJQQ8rn+Tc6sj0N27EYrwPHbw7kzr4I9SxuCiSiqQS048TlUuom84MP
 tJ66nb1eEyQLsSQpY8uzKylNK8/KgnalejOcR8YJA6Fm/7vNym4Xn8oWQZnlIIMl3YzN
 TZ3UgjZqk7C9YArmO5wxd23HN2ntCxqhCJUCnNXYeRntUH5tZa86KvDie2ebYefZWgLZ
 OYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758556139; x=1759160939;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qlg2oopvF77trHsNmLt3OpgaKYs1PYeJnpJK0K9pt00=;
 b=qnLD4XLz7qfN3YPOmnrcdSNq6T3O1D6kazJvZWrflDzxjYh60neh5QtCpydt3+Stmh
 A8ekt73eoB0LXkSTAEL1oLoca+jvejkLLJ0cYjFPi1LBULBp1piVyN/2p0kwVRU/qWPp
 22BB0d2a5Q3nNXBPVG6qwHj0rrzc+VdvBOerK/8aoQrPkjrfp3KymQUDyS7L1kpE0/Pj
 eRfZ/Fusq/j3Eq+fagvNqyLuAF2lqWUpK9dDf5GMZscY+rlPOo+AZxGqNpNBQ8naYp59
 Sd5ILoB7xBNeCxgTlccxt4Yxeqsm4aqUMVbhyiWN2V/Xqq7DpXPsaS6btURzoDwh8N0w
 NszQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIFsjU8SlvATdBx0YhB/eqKoyKvm2IR0IF4MmXELwGZ+mwKub7TpzKJJzi6dSUdqMwCFV9MewFRaO5L12wjRc=@lists.samba.org
X-Gm-Message-State: AOJu0YxPR5ktlhB8b+5TnF2z56s45wOmwREXI/RhSiZ0SqlBNNG28N84
 p/1P5qoVTSl2YovuM1dnAbRKa0DTshWvS6FJeHn0mPXXzU2glfBunpnPkjcnG58XkN4TeQLgngL
 iSb8cgVGdh0XzXPOcaAYdoK45WlHw3MA=
X-Gm-Gg: ASbGncvVfYh0+OyYvtmolWJ6xuDIKEmnguaCExldyD9VkL/vH+gVNLGHm9OU/BgnYXQ
 fLkbDtFgW3U3kKeNRkMjfJRgHDnW5/JnD2opKlJTY1do1VYIcZ6SXK/1dMsscb5Frfbd9fIIgaT
 9cQdDwuyYqzB2L2RjEfV2pxh3rENQkS6Ecw0AcVJtef9pSnGBKRWnY/nsKVKqUhffIpX41yl8q5
 t7Bn5J4mUotXecrFkTEt7m2yomOnpbM+VvZyHj/1A1msuU+GxpgNowuNFcXUB8pWgCiPYXGE/Kp
 wagZJoHpjurpkouQ6e1ZQSsuML2llRgCoib+g3hPKMgzZt1SbAYD+lm3m4yDNzX9Q+c9ihpG0wd
 BBThn27yU2dVGZzXvsXxR
X-Google-Smtp-Source: AGHT+IHVcugTSFzYYfT7bSVR5B8KfV75JOC+bkghqVVTgya+qCitcTbaRA7yVXfj09A0yT4WrZbJ6OupQWKSKBIcWws=
X-Received: by 2002:a05:6214:268b:b0:77e:8d71:c334 with SMTP id
 6a1803df08f44-7991297fb36mr150947796d6.17.1758556139181; Mon, 22 Sep 2025
 08:48:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250922082417.816331-1-rajasimandalos@gmail.com>
In-Reply-To: <20250922082417.816331-1-rajasimandalos@gmail.com>
Date: Mon, 22 Sep 2025 10:48:47 -0500
X-Gm-Features: AS18NWBZ-tc9h4IfVjj8s-i7hSP4_43DpRVZDBpO1wJ1me1nASDPtaIyja-mdsg
Message-ID: <CAH2r5mtpEc7ePZ58_qdE+9GRPVO3PPYuN44uHuskoQpnssbkdA@mail.gmail.com>
Subject: Re: [PATCH 1/2] cifs: client: force multichannel=off when
 max_channels=1
To: rajasimandalos@gmail.com
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
Cc: Rajasi Mandal <rajasimandal@microsoft.com>, linux-cifs@vger.kernel.org,
 sprasad@microsoft.com, pc@manguebit.org,
 samba-technical <samba-technical@lists.samba.org>,
 linux-kernel@vger.kernel.org, tom@talpey.com, bharathsm@microsoft.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

i just noticed a more serious problem with multichannel/max_channels

When we mount with multichannel (at least to Samba e.g.) with
multichannel disabled on the server it confusingly returns "resource
not available" we should at least log to dmesg something more
meaningful than what we do today:

[ 1195.349188] CIFS: VFS: failed to open extra channel on
iface:10.45.126.66 rc=3D-11
[ 1195.454361] CIFS: successfully opened new channel on
iface:2607:fb90:f2b6:0732:7504:183c:991e:6e53
[ 1195.454599] CIFS: VFS: reconnect tcon failed rc =3D -11
[ 1195.457025] CIFS: VFS: reconnect tcon failed rc =3D -11
[ 1195.457040] CIFS: VFS: cifs_read_super: get root inode failed


Samba behavior is also strange - it advertises multichannel support in
negprot response but doesn't advertise it in session setup flags.

On Mon, Sep 22, 2025 at 3:25=E2=80=AFAM <rajasimandalos@gmail.com> wrote:
>
> From: Rajasi Mandal <rajasimandal@microsoft.com>
>
> Previously, specifying both multichannel and max_channels=3D1 as mount
> options would leave multichannel enabled, even though it is not
> meaningful when only one channel is allowed. This led to confusion and
> inconsistent behavior, as the client would advertise multichannel
> capability but never establish secondary channels.
>
> Fix this by forcing multichannel to false whenever max_channels=3D1,
> ensuring the mount configuration is consistent and matches user intent.
> This prevents the client from advertising or attempting multichannel
> support when it is not possible.
>
> Signed-off-by: Rajasi Mandal <rajasimandal@microsoft.com>
> ---
>  fs/smb/client/fs_context.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/fs/smb/client/fs_context.c b/fs/smb/client/fs_context.c
> index 072383899e81..43552b44f613 100644
> --- a/fs/smb/client/fs_context.c
> +++ b/fs/smb/client/fs_context.c
> @@ -1820,6 +1820,13 @@ static int smb3_fs_context_parse_param(struct fs_c=
ontext *fc,
>                 goto cifs_parse_mount_err;
>         }
>
> +       /*
> +        * Multichannel is not meaningful if max_channels is 1.
> +        * Force multichannel to false to ensure consistent configuration=
.
> +        */
> +       if (ctx->multichannel && ctx->max_channels =3D=3D 1)
> +               ctx->multichannel =3D false;
> +
>         return 0;
>
>   cifs_parse_mount_err:
> --
> 2.43.0
>
>


--=20
Thanks,

Steve

