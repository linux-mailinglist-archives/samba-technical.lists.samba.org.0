Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 575336F8044
	for <lists+samba-technical@lfdr.de>; Fri,  5 May 2023 11:44:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ufubWxzKxARqUJmhZ8ARTI9/l39hZnmHjfZ3QsO10+w=; b=fUm9a25FetvVQsoS8A/9aNOedW
	folZ4JJsdVbkkoZqtAcq84zrSD6yiFZCLAW9lV+9Mu8+8Ts+Eb735wSctaXy4CWMJginqLWcKRBFS
	CmEcercFkMy3c0Za8MqFYN7kSwHrJ8izn+ETuicvfPyTl8ct5eWE3Xy9JXNsXxi8PQRTTedXMMAhc
	uBKf5yTDvi5e6tPiM3YYtNTwaWYNggEBfm1mnVqrKutlNxK3qIvFt1u+N+2Fl+fnxn1Sx2pnJaBJZ
	2XU2GEZWBe3P4CP+94k5JW4RKbAatS7EHveAyo3qJJvTkaceBStC7MeWQ5tUsvztTmAkvUjhNOiE5
	x6hDobKA==;
Received: from ip6-localhost ([::1]:28058 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1puryG-008dM6-CW; Fri, 05 May 2023 09:43:24 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:57682) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1puryA-008dLx-6Y
 for samba-technical@lists.samba.org; Fri, 05 May 2023 09:43:20 +0000
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ac7c59665bso17635941fa.3
 for <samba-technical@lists.samba.org>; Fri, 05 May 2023 02:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683279796; x=1685871796;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ufubWxzKxARqUJmhZ8ARTI9/l39hZnmHjfZ3QsO10+w=;
 b=nwjy92vk9SA7NIC1OTfFjQympVPDDZquh211pdGqe4NjCE0sTJahrMJGZI7cEs1vi/
 +/ltpXBWXY4quIxhHQW7B0dBv0Hw8sE5qZwQ9WGNKl5EIJYJKuZM2q27bNW40LYJPQAX
 EYsqxOpiLs+TE/Vcv8JZEFRx79HV7t/2ZZSUVSj2U9B/R3PENT4fFYmqblk6IgG16OaR
 tjsJm8hihI9gLMVWGRSmzO0BmhZJBmVEWMqVx1p6nXF706XUWTFmnYR6zb63mEubL13d
 G7NY1VAglT6vRCTRmRUc//mCdLfZS1D13KCIl8R86DcExnvh6SgDTgq1me2fSXXQPEiG
 42og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683279796; x=1685871796;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ufubWxzKxARqUJmhZ8ARTI9/l39hZnmHjfZ3QsO10+w=;
 b=J31TOuZapIft0zGCMfRc9qUdqmXRuwoxVvqHPB6AqKA26nb1Ar8VYAWTJOxwhrKhZY
 T0tAdvAIiDhjsjUva/+lQQFI5WjCjkoeKu9dnIIHW67VEv7eejrX/owGXMNYuucrji03
 gctFe2F74ajF7XYAYQAFSHLDtuPhrI6lKAfgb8z1SeO0ZqXyjcrYvxbNfSDFSJyYIi/T
 MGh0BaaJFSkQteSknhHLM8AutQ28OuN3AyfNuN6st4cDYFkOkCQQywBCryhyHSbwojBG
 llOQzVmPBMBguqlwvJBrGJkrHPNYzibHOyL/x/FFHC6BzKnlLmWKiYdZFo6DQ3WP4jQQ
 smZg==
X-Gm-Message-State: AC+VfDzzi2qmMXgT4rDbPfrpAcCi5Pey/abXI5B8OpRKUGRrx0rvFcU3
 R6+UOSi0y4KHrqWfK9fCop9Mxay25fWhT0cgKZo=
X-Google-Smtp-Source: ACHHUZ71/HLECo1P1dp932YwLL95D9JhH+bQFKVksl3XgY1RO4ty14DlHH99yubfz4Mruj91cw/vHVswfuBkr5YW7EA=
X-Received: by 2002:a2e:9596:0:b0:2a8:b076:3877 with SMTP id
 w22-20020a2e9596000000b002a8b0763877mr280574ljh.10.1683279796416; Fri, 05 May
 2023 02:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230505004925.76301-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20230505004925.76301-1-yang.lee@linux.alibaba.com>
Date: Fri, 5 May 2023 04:43:05 -0500
Message-ID: <CAH2r5mu=r8emGeF7aYoSX=9kAox=9j4bgUU-i0DrwT8e_V8CcA@mail.gmail.com>
Subject: Re: [PATCH -next] cifs: Remove unneeded semicolon
To: Yang Li <yang.lee@linux.alibaba.com>
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
Cc: tom@talpey.com, sprasad@microsoft.com, linux-cifs@vger.kernel.org,
 Abaci Robot <abaci@linux.alibaba.com>, pc@cjr.nz,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 lsahlber@redhat.com, sfrench@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Thu, May 4, 2023 at 8:00=E2=80=AFPM Yang Li <yang.lee@linux.alibaba.com>=
 wrote:
>
> ./fs/cifs/smb2pdu.c:4140:2-3: Unneeded semicolon
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D4863
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  fs/cifs/smb2pdu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
> index 8e7c15e2fd91..e33ca0d33906 100644
> --- a/fs/cifs/smb2pdu.c
> +++ b/fs/cifs/smb2pdu.c
> @@ -4137,7 +4137,7 @@ smb2_readv_callback(struct mid_q_entry *mid)
>         if (rdata->got_bytes) {
>                 rqst.rq_iter      =3D rdata->iter;
>                 rqst.rq_iter_size =3D iov_iter_count(&rdata->iter);
> -       };
> +       }
>
>         WARN_ONCE(rdata->server !=3D mid->server,
>                   "rdata server %p !=3D mid server %p",
> --
> 2.20.1.7.g153144c
>


--=20
Thanks,

Steve

