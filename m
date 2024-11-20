Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 259DD9D42E6
	for <lists+samba-technical@lfdr.de>; Wed, 20 Nov 2024 21:14:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=zBQkKb4gSboV6iKU/oPbGe52ILx+pR9xNlAhFQK8kPk=; b=q7gvGshJPBOFuIOa7jKO6xYv5e
	lKURRD6z8U4L8A9qp+INqpiZVqRqxQfSjUizUBBk9FlyiFBTHycBfulAQ+hwkb8YBthcNFFqETce1
	O7B1o4OrH8DskRKV35TIEj4PykuplqNHJs0RpbXcM+d7KxL3Js8TuXULFzAWMY9CscHTckRkxKTre
	2mkY//qanycj4GfK9og7F2ig9f8jIC65zYuieESIMqgrax3QBG+LElBde/I+MsiLgPTFu7vaYf0Oc
	jOD79WhMnzmhVQ1Q+B1I2Ywj9x/p6wfS7jGN2kMUZIp/DGHDw/67BjWECd6RCDkTiVVvuHvJE9Wg8
	cFezrMzA==;
Received: from ip6-localhost ([::1]:28552 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tDr4y-000MIT-Cq; Wed, 20 Nov 2024 20:13:36 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:56343) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tDr4t-000MIM-4O
 for samba-technical@lists.samba.org; Wed, 20 Nov 2024 20:13:33 +0000
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-53b34ed38easo147174e87.0
 for <samba-technical@lists.samba.org>; Wed, 20 Nov 2024 12:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732133609; x=1732738409; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zBQkKb4gSboV6iKU/oPbGe52ILx+pR9xNlAhFQK8kPk=;
 b=SxCQp9is4CksvxpDeY/oKcc2Le9y5M+GYdluX+YkeHR6LGsPc0AavZLagGLHzYtp8v
 MHp9bsuj9cOIcypzujxRjkSaHHGr0qPS5aetqM6lIZSwFE9+wP0RkK3krmOFZO+2njqG
 5/UHEY1o6SYKXj0V3fT4m9xqQIlbuXWiKpyDYSvCdvZAJ7l3pcNTkVtRIF6s02FR/aHq
 wB1JYWvgOo0tv5lEogIsnUuFKxDkhNIluHQeJHDMTro1pCW4JaOMVzoXRHGB8f30a6jb
 jECPeChJvvy3JVjMmWYbVIQm6j6QSELsQPOWrl2g7HIDAzeC/xUkEj/aRSzgJtLPMzyi
 /9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732133609; x=1732738409;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zBQkKb4gSboV6iKU/oPbGe52ILx+pR9xNlAhFQK8kPk=;
 b=vXj5xFlsd24uQigAigKgMB9Ioje0+3MaUA6oQLPRuMOaCONrXvhs5x63ZGwPIqxSTu
 pbsdji2xiXRzbii45H7iU8uX8wiKaXDROt4oFWqDgu0Do/gnZazz7YGVM+HkgfpZHiY8
 kwKaKvBBOAF8hGPA/gMtxXZzXWB71zL+wIrGVMyP6V/ZTr2pTGXMBRb6NaGaw3EtR+e4
 UAZ8T9UWH3BJO3dnoSSdQZdHVbsfWeRbtedd6aIBOTSSsXjGnUifSZGAdUsOaSduizM+
 aMhrabotLpNJuReGPWycWi9EEKOHv00EkKLtrXcRC+sty9Y5t+7i1LUJ09RPZcGlM7oH
 gn3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJRT/IOFZnsp9STkMLSQ5t/So6PPRgfwxZ/exO7VQg5HzBS2N3BWH8naSJyCCVj44+LGzFtWynodCoPesBr/g=@lists.samba.org
X-Gm-Message-State: AOJu0Yw7Ib63n1xWfiRec0LB+2qI6N0GqBX51lnwGgi6Rf1/dsLHowWd
 dXRF3Y4rg1AYX7UWhybAeB2dW2OtPqXMSTAyPFn0yrQIvId3N0jNimxlRbSNQOGXioCBjFZKZNe
 DoRDKJIq0w+oozxNJ73jJioGhaKY=
X-Gm-Gg: ASbGnctMbc2jaSXlUDIcqFvZ89YCoJh+zc2iWuPLzzvYLKWWOl4zs4QHqu4Z9rXrUrd
 0voT8bLVaN9DslAHMwZU6LZWFa7fkazFHlYoG+wTct+Oz/smKXfxCvx+N8Bw1Ahit4g==
X-Google-Smtp-Source: AGHT+IFlFr1JI5HCpNRZOwkeFCqSrWI0luh5NT2gRSmyfWPA36RCIsBljUHjNfK499/nK1PzZHJkhP6c8TKTffzp0TY=
X-Received: by 2002:a05:6512:2316:b0:539:f9b9:e6d2 with SMTP id
 2adb3069b0e04-53dc136715emr2383473e87.35.1732133608822; Wed, 20 Nov 2024
 12:13:28 -0800 (PST)
MIME-Version: 1.0
References: <e0addd3d-2687-4619-8f47-4d8ff13950a7@stanley.mountain>
In-Reply-To: <e0addd3d-2687-4619-8f47-4d8ff13950a7@stanley.mountain>
Date: Wed, 20 Nov 2024 14:13:17 -0600
Message-ID: <CAH2r5mu=8vvqgD0KGb_WVFsP2c1dvOz=ePbWurF3A=AL=nQoWw@mail.gmail.com>
Subject: Re: [PATCH next] smb/client: Prevent error pointer dereference
To: Dan Carpenter <dan.carpenter@linaro.org>
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
 kernel-janitors@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, Steve French <sfrench@samba.org>,
 Bharath SM <bharathsm@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Wed, Nov 20, 2024 at 11:18=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> The cifs_sb_tlink() function can return error pointers, but this code
> dereferences it before checking for error pointers.  Re-order the code
> to fix that.
>
> Fixes: 0f9b6b045bb2 ("fs/smb/client: implement chmod() for SMB3 POSIX Ext=
ensions")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  fs/smb/client/cifsacl.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/fs/smb/client/cifsacl.c b/fs/smb/client/cifsacl.c
> index c68ad526a4de..ba79aa2107cc 100644
> --- a/fs/smb/client/cifsacl.c
> +++ b/fs/smb/client/cifsacl.c
> @@ -1592,14 +1592,16 @@ id_mode_to_cifs_acl(struct inode *inode, const ch=
ar *path, __u64 *pnmode,
>         struct smb_ntsd *pntsd =3D NULL; /* acl obtained from server */
>         struct smb_ntsd *pnntsd =3D NULL; /* modified acl to be sent to s=
erver */
>         struct cifs_sb_info *cifs_sb =3D CIFS_SB(inode->i_sb);
> -       struct tcon_link *tlink =3D cifs_sb_tlink(cifs_sb);
> +       struct tcon_link *tlink;
>         struct smb_version_operations *ops;
>         bool mode_from_sid, id_from_sid;
> -       bool posix =3D tlink_tcon(tlink)->posix_extensions;
>         const u32 info =3D 0;
> +       bool posix;
>
> +       tlink =3D cifs_sb_tlink(cifs_sb);
>         if (IS_ERR(tlink))
>                 return PTR_ERR(tlink);
> +       posix =3D tlink_tcon(tlink)->posix_extensions;
>
>         ops =3D tlink_tcon(tlink)->ses->server->ops;
>
> --
> 2.45.2
>
>


--=20
Thanks,

Steve

