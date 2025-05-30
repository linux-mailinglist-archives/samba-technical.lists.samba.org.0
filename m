Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE7BAC933C
	for <lists+samba-technical@lfdr.de>; Fri, 30 May 2025 18:15:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=6UTq5HkLhV23M0xz/nleVLoMMJCEzvqCvQMrpj98LYs=; b=NVO1Q80c/8GXgBR+haTBhBlURu
	5oJmhGbjI4pGupf81695oOo/r++lTK6MdC+0Tdr1r4FlIqxlVpC4n1bafcgSXSydoDKWy8Plb/QgO
	2rK5FVm6GGe6jbaQK4RQnqRQ1xIp9bVlQLBtf1Dq0lj1WnBFhCG5bsypV3xnycH75CTxruveKAX6c
	D4kNZ7EeOvCcvWos8F8iGVq9sRzfbVyJgrGoFophOoxsTTUB9jRmMpEspdd3PWkRHc0ZpT9eNQJI8
	rgB6SN1mcsnuL7U6UJH0eBqDUYhkxNON1tB3PnjV0Av+nVYJ3Mmji0QD+730fTkFbFxmu9CBdJ8LX
	qNDjR6mQ==;
Received: from ip6-localhost ([::1]:55850 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uL2Ns-004TvO-EO; Fri, 30 May 2025 16:15:04 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:55405) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uL2No-004TvE-5I
 for samba-technical@lists.samba.org; Fri, 30 May 2025 16:15:02 +0000
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-32a6083ef65so20303711fa.2
 for <samba-technical@lists.samba.org>; Fri, 30 May 2025 09:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748621698; x=1749226498; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6UTq5HkLhV23M0xz/nleVLoMMJCEzvqCvQMrpj98LYs=;
 b=QfxWPheMP3m+GXTL+YScEM0TSyv1dk8jqyM/WuzFW4zKtVUcRlmGUSCxU3OKsjATfE
 76T/1PvBVy19FR7Zof5m6KNatxvn4ejrN1Uduk4LgOUubHbo2ZfWdM/RXnMsuDhMBW+y
 52bjeXrciEXv24v65fULnMSeR8/xP9/jCZukuJ+0PD1bc9aYaV6cv5hS3yFJ0Rz4ynUN
 vP8nFlR4jvsKNMoXBpm/63G1pGS1OqKEnRpiPQRgb1MYsQoyg2qzIBvVxxf/VNKunyZq
 WIP7LAsORQfBDAulXRPuHmzRw/h5ArwHIfbaLAZOR+d2/QrkRT4IFYty9A0ilvUtlnnb
 LXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748621698; x=1749226498;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6UTq5HkLhV23M0xz/nleVLoMMJCEzvqCvQMrpj98LYs=;
 b=XYWjg1K4g0TGI5gWhUIBQRyG66PHyuOQOyZXjrnU4b4mhU+jXM3dfaiUJsrw21nsIM
 dW7XNNjFKG7T12k/dRV8HU7izxz7UJoD1bY2XkMQgBheMQYxlN0jrtEAnuyJZb/WLig6
 OCX8TON9oIA8tX1E5KzW2m1PIrV1xoxHfo5P+qguQ/lXq+FWaasewEvVAPVw6Iny8IQe
 F1EArApCG4xJGivNRL5kL1bvSxdxh7aHMasPpCgIEtur07Cdp4NNx05tWCY4XwTTOpKD
 stsDKe7Vmv3FahW0zWI4YQwRpU+lrMMKOHpz9oj/ezkml5OwgnEP3DqyXZ0UXBCx8+1K
 IErA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsio2o44cBKmXtvT+Lfu+UscLxjRDNF7Hytgk0vF/UVRRh6isIzlqHeMbbVTn8yXhW86DSl5RJJb9ZlQXFFh8=@lists.samba.org
X-Gm-Message-State: AOJu0Yw74WUnjLN7mxywY4wN8pIIxt3/pWGTixsNoNufFZCkNrPqaHYm
 LeIM7w55jsbu0chIvVgjxpSwxmuyUyfxsNpNQLDAC7fiXtQgNrrEn4qTl0cPJ5Wd1YKFvCn6xuf
 xgT24OBozI4DsdlYnMhlnm/5RwESyuiE=
X-Gm-Gg: ASbGncsePctU9M+7DATocLLnyzl8usgSJB5cfRpFUWTQGZ47OwBAEqsDKQ8c970libr
 Zv5cHWVSupW//Iewuy1+J3HMoC5x8zNb1x9QsiErvos7onPfnDFyGmx9e89MM5On1dfzXb7CAI1
 asSBB1QkD9AhAvpobN6KCvrTetQHyKSZ37VcTbvIVZ0eWIj0ob9E1fspwx+FBB+7jpAHs=
X-Google-Smtp-Source: AGHT+IG/NJcvokzMVAfgAUULPo5AHEfz55/2Xhz/gGIFl6PSQ86+UbqO3pGexblTmnbk2F682gpMuOlFZAHMLwVuv8c=
X-Received: by 2002:a05:651c:509:b0:32a:8062:69b1 with SMTP id
 38308e7fff4ca-32a9068a6f6mr12904441fa.8.1748621697994; Fri, 30 May 2025
 09:14:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250530084614.2434467-1-frank.li@vivo.com>
In-Reply-To: <20250530084614.2434467-1-frank.li@vivo.com>
Date: Fri, 30 May 2025 11:14:45 -0500
X-Gm-Features: AX0GCFtGHmv3izUG2w7WT1FVlkS5ZFbMOTfhnGBK58yTeSsKAU5O4zE_8tf3tkU
Message-ID: <CAH2r5msAq6Kq4R0euj+y526imrsGWcXLa_LCJ9T+8G2-9PJx6A@mail.gmail.com>
Subject: Re: [PATCH] cifs: correct superblock flags
To: Yangtao Li <frank.li@vivo.com>
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
Cc: pc@manguebit.com, linux-cifs@vger.kernel.org, sprasad@microsoft.com,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org, tom@talpey.com,
 bharathsm@microsoft.com, linux-fsdevel <linux-fsdevel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

> SB_NOATIME includes SB_NODIRATIME as a subset. Therefore, setting SB_NOAT=
IME is sufficient

Although technically the flag is not a subset, with current code in
atime_needs_update() setting SB_NODIRATIME is not needed if SB_NOATIME
is already set (see below), but it could be argued that the code is
clearer (easier to understand) to set both flags (especially as it has
no performance hit), and multiple other fs also do this. Any
additional thoughts?

        if (IS_NOATIME(inode))
                return false;
        if ((inode->i_sb->s_flags & SB_NODIRATIME) && S_ISDIR(inode->i_mode=
))
                return false;h


On Fri, May 30, 2025 at 3:25=E2=80=AFAM Yangtao Li <frank.li@vivo.com> wrot=
e:
>
> SB_NOATIME includes SB_NODIRATIME as a subset. Therefore,
> setting SB_NOATIME is sufficient to disable atime updates
> for all files and directories.
>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  fs/smb/client/cifsfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/smb/client/cifsfs.c b/fs/smb/client/cifsfs.c
> index a08c42363ffc..b4bc15ea33bf 100644
> --- a/fs/smb/client/cifsfs.c
> +++ b/fs/smb/client/cifsfs.c
> @@ -996,7 +996,7 @@ cifs_smb3_do_mount(struct file_system_type *fs_type,
>         mnt_data.flags =3D flags;
>
>         /* BB should we make this contingent on mount parm? */
> -       flags |=3D SB_NODIRATIME | SB_NOATIME;
> +       flags |=3D SB_NOATIME;
>
>         sb =3D sget(fs_type, cifs_match_super, cifs_set_super, flags, &mn=
t_data);
>         if (IS_ERR(sb)) {
> --
> 2.48.1
>
>


--
Thanks,

Steve

