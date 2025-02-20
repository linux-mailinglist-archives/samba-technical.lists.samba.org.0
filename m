Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EECFA3D0D3
	for <lists+samba-technical@lfdr.de>; Thu, 20 Feb 2025 06:35:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=nxHO5xks8df2tnW/6a5XWxo3H0le3C1ZTdsmsLIpQ+c=; b=CcnjH4KR8bx6i5aDCWTgsTtVIm
	/OdbA4ClHg+RwHQN1Q66EBxuzUh5ugQjfbThf/axI/tDb+ZD0j+2y+eHbb+AOFvuRtYNzj4rNVgAW
	pHViZYpmEz4SWPtApQxVZWnakHv55Gxx+DHqXKZeV/TEb08uU5PMR2wi8EfEBCtR9V31OD9FQyX3J
	Gop9kKNxzLu5C7Xgd7JrcBuwkqt50RDy3UMRsCEkFUNX4vnJfyIL7g18hfHYOBosyswsTS0J4W1E2
	d2rSJKAv4osiMyNiM5rOXarb27xLMjNzYAdsVo1M/dLmCbBZtthAt7wmccsptAsewUE2KCBKUPV1m
	gkq53tlA==;
Received: from ip6-localhost ([::1]:59416 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tkzCw-00Cwzr-UJ; Thu, 20 Feb 2025 05:34:47 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:60859) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tkzCr-00Cwzk-Ef
 for samba-technical@lists.samba.org; Thu, 20 Feb 2025 05:34:44 +0000
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5452d9d0d47so466145e87.1
 for <samba-technical@lists.samba.org>; Wed, 19 Feb 2025 21:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740029668; x=1740634468; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nxHO5xks8df2tnW/6a5XWxo3H0le3C1ZTdsmsLIpQ+c=;
 b=VAHmMUDk7EtCtSrEaGXfzbbNYtU1+xuKFGK8EIWUFHve/vmrdBuCH/h6DaN3jwWYc1
 h9pZl4ZK0wdvjdKWTOA67y1bWmVsGPbb3I32c810XAAfamc3pKVw5VKzlgYff10PchZC
 80bZfwjtewwx8wr/TW2qJHtt97GRnDwk/6dplaNuaZX3HrQK2zKJffvAX7fxsSwcUi0Y
 k8Gggij9zgLrlWsCe5WUAPnA64qMvDGFj+ls7e32lNQBiQXnyW/42GEe/ZiDQMb3kN3T
 ec1lLEGLSzudnxVwSmLe+2CrYdtWCGheKOSddUqtCIMWg7zrsIWZNff1+Fvig0iQSkNo
 GDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740029668; x=1740634468;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nxHO5xks8df2tnW/6a5XWxo3H0le3C1ZTdsmsLIpQ+c=;
 b=wX1lV7frFhJwuzJC5JYviqUsVkIOprCM9fMVL8D0PBNup8r3jzLrOPn7WcxexYQwhL
 8bMVOed41XYInngZUmS7tvpDOleSm0de9ApFPsTQKqOBABtqWRTBDqqAYNgiV/EDxEeZ
 cxcmorpuyCy93RoV169TE93znIvDRIIN/oBNbY6grloWqxDCrL9rvlzgISa+NUlYEUot
 bfWJ8TxwVywFXFxK1NMoTUGSGQrVDjjI/ld+aDMUkWo7XBQ0a20IXNxH5gCGBh3zoPrg
 LDu1hBUc+s+dDIyqebng5/JBKNz0ShDo5PcI7m8T6R5Wv6NOICwzP97ywfVPumANm4bU
 6s8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzCJIYCn4pID/dOzHqf8gyxvz6MSvn+U4KJYfsHYLF1nNJsrrvhEkxkiU/Oy8N4Om5WFxNOYI0ZEADfj84aQE=@lists.samba.org
X-Gm-Message-State: AOJu0YyH8K3aJDdeIDvBwHMvh5Rfa/9Sk5ubupHOFGk8Eseprwhtxfhj
 vj+A5MkiSqcwSOfOXkFDbCkOeKmKa8+fUaGmyIFMEXpSjPaohVz8EmoFCGALbIMrW0mtMeV35Hx
 /c7QXMAUWIsJW1PHOKe3yKTIbBSk=
X-Gm-Gg: ASbGncvlaEclNYPm0bm5D52w9xTCHFVbHdLKqkXlP/2/Olzo/Kp6/+mPRHlE74NsF59
 rSqbF6SZ4jIbNqdtZQPgByOCqr8Ep3p7rVW+HqJVPzcgQ8KVCzpId3L4atVRZ8bM0bsBFnw==
X-Google-Smtp-Source: AGHT+IGcwv22gm4Mb8LSCO0ab7eCHF5tc0t/ohjExzT5CdWz31S37WwgbeeCiWbF1KwTW1ILNSfNLynudHkKGUbUWr0=
X-Received: by 2002:a05:6512:2353:b0:544:ead:e1d6 with SMTP id
 2adb3069b0e04-5462ef1989fmr2398730e87.38.1740029667698; Wed, 19 Feb 2025
 21:34:27 -0800 (PST)
MIME-Version: 1.0
References: <20250217072038.2311858-1-haoxiang_li2024@163.com>
In-Reply-To: <20250217072038.2311858-1-haoxiang_li2024@163.com>
Date: Wed, 19 Feb 2025 23:34:13 -0600
X-Gm-Features: AWEUYZkFuWr5xR08Vj1lDihLjqWdTIC-eMaZC12VdwrjG3APe4AqM6C5ntJ07xE
Message-ID: <CAH2r5mt=oHJRjB6Mo_fE46yB-bkXgc2J-cq-eWv1OKPo3z5z3g@mail.gmail.com>
Subject: Re: [PATCH] smb: client: Add check for next_buffer in
 receive_encrypted_standard()
To: Haoxiang Li <haoxiang_li2024@163.com>
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
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, sfrench@samba.org,
 bharathsm@microsoft.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next pending additional review and testing

On Mon, Feb 17, 2025 at 1:22=E2=80=AFAM Haoxiang Li <haoxiang_li2024@163.co=
m> wrote:
>
> Add check for the return value of cifs_buf_get() and cifs_small_buf_get()
> in receive_encrypted_standard() to prevent null pointer dereference.
>
> Fixes: eec04ea11969 ("smb: client: fix OOB in receive_encrypted_standard(=
)")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
>  fs/smb/client/smb2ops.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
> index ec36bed54b0b..2ca8fe196051 100644
> --- a/fs/smb/client/smb2ops.c
> +++ b/fs/smb/client/smb2ops.c
> @@ -4964,6 +4964,10 @@ receive_encrypted_standard(struct TCP_Server_Info =
*server,
>                         next_buffer =3D (char *)cifs_buf_get();
>                 else
>                         next_buffer =3D (char *)cifs_small_buf_get();
> +               if (!next_buffer) {
> +                       cifs_server_dbg(VFS, "No memory for (large) SMB r=
esponse\n");
> +                       return -1;
> +               }
>                 memcpy(next_buffer, buf + next_cmd, pdu_length - next_cmd=
);
>         }
>
> --
> 2.25.1
>
>


--=20
Thanks,

Steve

