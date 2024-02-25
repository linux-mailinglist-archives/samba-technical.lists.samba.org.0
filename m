Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD89862BF8
	for <lists+samba-technical@lfdr.de>; Sun, 25 Feb 2024 17:52:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=OVBARaDhY4/ZJwxqvZSGq2HB0eTnWoqOZB0E4z9T7/A=; b=q7qnwAPoe/KjpjybM+Y0KkXdRt
	wm0ZXAQRnXOag/jqd2vlERhq9lDz9yx8cSUp2mm7gXKZyiZR9HcEu7xnhu9MEy/RMRPbpy0hnvcrG
	4Gl7ylpBrQp9mc42xJcpR4US8TvzGO+cg6GCtk3Su33qCSCZCpfgUvmrZs+QyS1+9RQfjMmaLYO0q
	qRhV8Brf5b2q7J+QA4uxcyP6wf0HsZpBrQjtnsK5q93PQzOpo8Qu4Su6/WSiyJuTuUkZHps4ppHxM
	tqUBt7RXAGo/NNjQHn9wTgbsZSj2kS0ckF1C7x8DLZGjXhhMxl7lfabPWbQZrwXGLuaZ5RVbd67tA
	PdlpESBg==;
Received: from ip6-localhost ([::1]:46562 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1reHjU-009PBr-Tb; Sun, 25 Feb 2024 16:52:09 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:61934) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1reHjP-009PBk-Ot
 for samba-technical@lists.samba.org; Sun, 25 Feb 2024 16:52:06 +0000
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-512cc3ea7a5so2048443e87.3
 for <samba-technical@lists.samba.org>; Sun, 25 Feb 2024 08:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708879922; x=1709484722; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OVBARaDhY4/ZJwxqvZSGq2HB0eTnWoqOZB0E4z9T7/A=;
 b=ftWB4PIwj2Nbn9ZbTolJ+Mzga87wSMNuh2JYCbZ4T5vajscFHxJ/neNjArGBZGOdGr
 IeLzAW7CgJUsUE2OTz15x1+IjWuwKEslwrKKKIbNRHOnTXID05QDe0KNVEeXgNP60rJv
 CEy8Pd3IuIQcmEG4oMAuenxWIIlLtXCa1YNO/SGwua2erdSyHZMkO/TMFye9H7PFSdqA
 qyNH5LYouAHbzK6z7Q3fPh7q2V6MnEYmR78R09XEJ5fLWuNCrVkxGTb1A6KS1rGv99pd
 FgBeraH0i+q9saZVTKqjxy0mPj87EVHkWGb6rvh2UHnAhjNTK7kyRVJBZo8Jl6TLGrzN
 veLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708879922; x=1709484722;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OVBARaDhY4/ZJwxqvZSGq2HB0eTnWoqOZB0E4z9T7/A=;
 b=e8Pq+GgZKDWEIg6Foflm6Gxv6nmgMBxZgaPMhNEVAT87gM+mMqbkpivp2xp9LKdbdz
 kmIrDGv/aqGaSj4xq8NsO4V4LnfDK8WTBCUuUt2mJAgYotkKVwW78468dlFZ+AEaMPOu
 EnbdKBF1FF41XjbnIKduRoLrKhZuvD8zNqAl0PVds6UlFzdMFPhmml+KYm4oZ3gMObw5
 PnM4rr0CfvG1P+al1wA5lcnzg7ZOdL/6zAUvjTdLBEzlqBM/LuLgpihFn/Fpt8whcgyw
 mhLOGmq84JPbZ4HXWCvE0+boflHiElkKkHRivSjQiqRe+MfQ5IM0kaS+HWuyfUW0mKVK
 /aOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnNj4rvPDLgR2u7pcoTiFc9gOqSH0yet9hWvafkp+W4okBFLCbeV2xBIHoIreYyCfQ9RdzCBW6J0cuD7fKWcU0RuWQ+SA1Iunv3gWhowD1
X-Gm-Message-State: AOJu0Yzf80CV7w36i0pnydZ/TOJCBjUNc2pLjFEqJjMh9/12E3VX/6VQ
 m4w5g21+Jl4nP5hnEt4yqT9kaGWTxMtECS9shUIBwTUpZWVaDvutlAMmQaKdCfL50Ef9T7GtnDB
 SshGnRJxPIl3/ESMhD16Bv5yWsu0=
X-Google-Smtp-Source: AGHT+IEgmqbO9wxfKjJgwrgk/OccX2wFSH4UyEXLgZcgtXOEMyUIPc3FHLXpzE3nabPMr+da8zY76L6BygSBRqMVwdA=
X-Received: by 2002:a05:6512:614:b0:512:e51f:b58 with SMTP id
 b20-20020a056512061400b00512e51f0b58mr3178846lfe.24.1708879921986; Sun, 25
 Feb 2024 08:52:01 -0800 (PST)
MIME-Version: 1.0
References: <20240224135809.830610-1-chengming.zhou@linux.dev>
In-Reply-To: <20240224135809.830610-1-chengming.zhou@linux.dev>
Date: Sun, 25 Feb 2024 10:51:50 -0600
Message-ID: <CAH2r5mvoS1+52SvT3XCPiBtOWAFyoVy3LajfQSFGOAa2h8Wy3w@mail.gmail.com>
Subject: Re: [PATCH] smb: remove SLAB_MEM_SPREAD flag usage
To: chengming.zhou@linux.dev
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
 linux-cifs@vger.kernel.org, roman.gushchin@linux.dev,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 sfrench@samba.org, linux-mm@kvack.org, Xiongwei.Song@windriver.com,
 vbabka@suse.cz, Chengming Zhou <zhouchengming@bytedance.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

added to cifs-2.6.git for-next (minor update to put "Link: ...") line
in the description

On Sat, Feb 24, 2024 at 7:58=E2=80=AFAM <chengming.zhou@linux.dev> wrote:
>
> From: Chengming Zhou <zhouchengming@bytedance.com>
>
> The SLAB_MEM_SPREAD flag is already a no-op as of 6.8-rc1, remove
> its usage so we can delete it from slab. No functional change.
>
> Signed-off-by: Chengming Zhou <zhouchengming@bytedance.com>
> ---
>  fs/smb/client/cifsfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/smb/client/cifsfs.c b/fs/smb/client/cifsfs.c
> index 9cd3bb48bd3b..45e57c852f33 100644
> --- a/fs/smb/client/cifsfs.c
> +++ b/fs/smb/client/cifsfs.c
> @@ -1661,7 +1661,7 @@ cifs_init_inodecache(void)
>         cifs_inode_cachep =3D kmem_cache_create("cifs_inode_cache",
>                                               sizeof(struct cifsInodeInfo=
),
>                                               0, (SLAB_RECLAIM_ACCOUNT|
> -                                               SLAB_MEM_SPREAD|SLAB_ACCO=
UNT),
> +                                               SLAB_ACCOUNT),
>                                               cifs_init_once);
>         if (cifs_inode_cachep =3D=3D NULL)
>                 return -ENOMEM;
> --
> 2.40.1
>
>


--=20
Thanks,

Steve

