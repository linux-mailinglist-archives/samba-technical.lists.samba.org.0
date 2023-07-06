Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF5074A0EE
	for <lists+samba-technical@lfdr.de>; Thu,  6 Jul 2023 17:27:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=XtfE8VfL9/Ahx6GTmCZcc9TQkFw8X5Q1Xxl7Qq4Ume8=; b=tvivMuTD8TdLLfm9T4PtndS1w6
	rYGihrB+P1cGeW709t5Q7RBejHwp4Cdia01JtM3GEoMT2x2cI8y9NbEuPhKdDy6kcP5eCn/CbmTU3
	6YGkvI+i1Ayb/htaTiVz2OO+g0G+iAVXkOTtmAQvqEcGYIKrSbZCK2damt5C/sEy1AElVJPJkapu1
	mjnjLPepKgbqAId8A5WoEMCcRqoFu9u/6n2gDY4zHlwt+RutUyaTDFe2mu0LncBNFy4GOzFwl+DDw
	somZhOizvKmt23hU10cKMev007cAUfV94+TSsilyKbBbS/b7H6vy7Vt5v1FMux9TGGa2AGh0WH7Re
	gfdnWAgg==;
Received: from ip6-localhost ([::1]:54364 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qHQsQ-000c1c-V2; Thu, 06 Jul 2023 15:26:39 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:58378) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qHQsJ-000c1T-1e
 for samba-technical@lists.samba.org; Thu, 06 Jul 2023 15:26:35 +0000
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b6afc1ceffso12726491fa.0
 for <samba-technical@lists.samba.org>; Thu, 06 Jul 2023 08:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688657190; x=1691249190;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XtfE8VfL9/Ahx6GTmCZcc9TQkFw8X5Q1Xxl7Qq4Ume8=;
 b=LTBnJxGZbM5tJrSwF7zMiCvZrBbFIXzGc2+8VjuqKB3TGKuwP1XsiInHM0fNIBD92N
 gzzSYp/oYWe9FOvaUgP8y0jNwkn5E65nddSeN68DYLA/PsT5q9jw8vgSwMRIJI+xeT4L
 PNcFD4TssHnjH7SNR3ZZ8jnh2AWRfFgHXooYsrdv9EjVY+hGdVureO9CzMYfOlaurB5H
 dxfy8Dtn4WZiNrSfO01h6J4HA7roCuKz+GKc6ZxID5BB/JSWD6emzEpuyuBEKPVX171B
 J1RPmTkas8vbpZvLa98wPqtXW0utJh43fDFqm2F4MIItA+fcVJUDW3qno/JFF/vlzCCq
 lfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688657190; x=1691249190;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XtfE8VfL9/Ahx6GTmCZcc9TQkFw8X5Q1Xxl7Qq4Ume8=;
 b=eGnfLZFQKvcaTk5/ylcH06X4a/EX4SpphjDT0o0OuGeqaR153Gi5bEzALV47JCyV4b
 rs3XiWx4Io+dRvpjfE4mBvnnGbwfxIgzOiYDH0dHMLxFZSFH00sE0spaTq63lSLfS40z
 Tj+zcYYc9GrVkLi0FmjU1I/1/HjBIfw0Wf8f14VkU19QwgLMD2JcoCQuacZYNFVb726S
 oBaMyCf6BWHmwaJA/ii1Q3GS5AhVsOirtZZUzU7LZDgUosI0noOtbJXls/5myn3YYSjV
 W2G6OCB/v8OFG6KKYzD4q6Hq1fOkzmiJ6/DmoiwmTPsdzJ0ukaRNjiQkzfAC0aQsqUz1
 Eoeg==
X-Gm-Message-State: ABy/qLZo031K38RYRpHWUyDb/uEKrMej748Rvinr4Bds59s4YWNOUhrS
 OZKcFxsUmRIuhRwJp/An4Npkopd36fHmCziBAww=
X-Google-Smtp-Source: APBJJlER+BCDcEUIg4OEmVyyaxgXpw8ib6IqQC2iYtZrUdQ6V/tVqpTRHHCYrROAGxJOx288TdEB4hk8NhZdlX4q6OI=
X-Received: by 2002:a2e:9c95:0:b0:2b6:c16a:db06 with SMTP id
 x21-20020a2e9c95000000b002b6c16adb06mr1741654lji.39.1688657189389; Thu, 06
 Jul 2023 08:26:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230705185755.579053-1-jlayton@kernel.org>
 <20230705190309.579783-1-jlayton@kernel.org>
 <20230705190309.579783-6-jlayton@kernel.org>
In-Reply-To: <20230705190309.579783-6-jlayton@kernel.org>
Date: Thu, 6 Jul 2023 10:26:18 -0500
Message-ID: <CAH2r5msVjOVx8FnV6kCErMtkUpfTdPUMHXug3V=9PaA4MevkgA@mail.gmail.com>
Subject: Re: [PATCH v2 06/92] cifs: update the ctime on a partial page write
To: Jeff Layton <jlayton@kernel.org>
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
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org,
 samba-technical@lists.samba.org, Shyam Prasad N <sprasad@microsoft.com>,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <sfrench@samba.org>,
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Reviewed-by: Steve French <stfrench@microsoft.com>

On Wed, Jul 5, 2023 at 2:04=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wro=
te:
>
> POSIX says:
>
>     "Upon successful completion, where nbyte is greater than 0, write()
>      shall mark for update the last data modification and last file statu=
s
>      change timestamps of the file..."
>
> Add the missing ctime update.
>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/smb/client/file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
> index 879bc8e6555c..0a5fe8d5314b 100644
> --- a/fs/smb/client/file.c
> +++ b/fs/smb/client/file.c
> @@ -2596,7 +2596,7 @@ static int cifs_partialpagewrite(struct page *page,=
 unsigned from, unsigned to)
>                                            write_data, to - from, &offset=
);
>                 cifsFileInfo_put(open_file);
>                 /* Does mm or vfs already set times? */
> -               inode->i_atime =3D inode->i_mtime =3D current_time(inode)=
;
> +               inode->i_atime =3D inode->i_mtime =3D inode->i_ctime =3D =
current_time(inode);
>                 if ((bytes_written > 0) && (offset))
>                         rc =3D 0;
>                 else if (bytes_written < 0)
> --
> 2.41.0
>


--=20
Thanks,

Steve

