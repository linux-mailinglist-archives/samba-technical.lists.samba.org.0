Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FDFCB2B9
	for <lists+samba-technical@lfdr.de>; Fri,  4 Oct 2019 02:23:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=7vMc6KDlBcnghGB9c43lv1XQLrLse3+j0pr6CseKS/c=; b=oZnFXKIb2YNW37rY84D2X5WbdP
	DjQJPs/ghYPm4NiYHCVw8Zi3smSdvf5SoBVAJym2UqIlaIs1ATOTJp4mJ7XNUyVAceOFps2ZDnXUK
	cybtsrTnV+nIkAiHjmvnc4h0EJfgfK9XH0FTYHH+3IZVDZdaYzjDQfV7wncIMrrsviAooz8iCAyd1
	T/MGR3P7YAUW4yupBAFCrmRb8YFKWnXWLDa/vWdP7MbGl4EtyzGzls3agfuoB8HpGZ9nnZGFDioX+
	FZM/OWoWRfL9N+lI1yyknf4tbLwJaAwoxExNIEL4FKIfftLkSLn6KH4muKizwygSGYvUs3SGbf7t/
	zY6I+oQg==;
Received: from localhost ([::1]:33068 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iGBNU-000xRE-Iv; Fri, 04 Oct 2019 00:23:24 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:35792) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iGBNP-000xR6-NP
 for samba-technical@lists.samba.org; Fri, 04 Oct 2019 00:23:21 +0000
Received: by mail-lf1-x141.google.com with SMTP id w6so3187262lfl.2
 for <samba-technical@lists.samba.org>; Thu, 03 Oct 2019 17:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7vMc6KDlBcnghGB9c43lv1XQLrLse3+j0pr6CseKS/c=;
 b=EazOEHZ392ZrKlo3aqbBugnP+8Mh7YknVLEzRrYoLM2seLAkQ+82InqtT9lgsyTuSa
 JvYEXrDupxxrxGuPCxk3YxpnM55TXqMkyTExLDXnJ0GQikRpyykphxR8wMHsfpDoBJuo
 SdvlnMs0zPHglHE1QL0E14Dd1wWoZvizR5kzUQW1s21dwIayp+Xn34iZJeTboGRaLnPo
 s9SRtpJMSnhTfuDdOIweteMV6QjmHjVYQhFjUPzRXJmondg8RzSN5KuTCXVQBiffdTh5
 wd2zKONC/FcXxS7BzKaJPsvd7+icIxZLGAlLl1VnlBdEermDEn8pm29Be2oZ69FSSTTE
 Z5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7vMc6KDlBcnghGB9c43lv1XQLrLse3+j0pr6CseKS/c=;
 b=MzmqlUz7zRPArPdxvPOv142wSExujgT2MB5Q5J9k1IiX1HpWlfPiURQ2b758J31P/s
 F03+XCuXITU6uctu28OZmUkEKn0uij5IBrhrhPXvMJuZcW5qj9mFiJOVs4C5S6GNtmY0
 faQxFfRQjQ8gaMSk8AJagDUeu/qWJpivGLuuuO67RC7mNbRznnAHXEx2dhCGTp978WCC
 hk4G6J2O1CdyYBNMMX9NfAplfniH0xSo+O7DAQbm0WIY0ny7DB/vDLuksFSYHaBqtuSU
 eMhsRVt6f2G9fGzayIwMk2m9vI87Ke3E5kX1MzojaISJRMx8CGZtLSOsqJ6b+bK686jL
 6d0Q==
X-Gm-Message-State: APjAAAXnVFh63yMQIsQtuQR/5xH44j+DEHlwtk5oYR+I38KTLZlWtiI0
 winbcpCmi/iWd1B0TidNGGEQYee1hV7ELFUFyw==
X-Google-Smtp-Source: APXvYqwOGw9nZ/A5ERBBn8vCm6/MAZzsFlCyTjV4eiEu/gGx676lSBKnhvnMXZZ8KCrnkBkL1byYt8UO1BIicye8qu8=
X-Received: by 2002:a05:6512:304:: with SMTP id
 t4mr7493883lfp.15.1570148598838; 
 Thu, 03 Oct 2019 17:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190919121226.8756-1-pc@cjr.nz>
 <4451b38f-abb2-8437-62f6-e499a3497737@suse.com>
In-Reply-To: <4451b38f-abb2-8437-62f6-e499a3497737@suse.com>
Date: Thu, 3 Oct 2019 17:23:07 -0700
Message-ID: <CAKywueSaA8gavuVWhVGcEjdTt_u_GiPSW0bkCc_jLqpL2t_P9g@mail.gmail.com>
Subject: Re: [PATCH] mount.cifs: Fix invalid free
To: David Mulder <dmulder@suse.com>
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
From: Pavel Shilovsky via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Shilovsky <pavel.shilovsky@gmail.com>
Cc: "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 "Paulo Alcantara \(SUSE\)" <pc@cjr.nz>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

=D1=81=D1=80, 2 =D0=BE=D0=BA=D1=82. 2019 =D0=B3. =D0=B2 13:04, David Mulder=
 via samba-technical
<samba-technical@lists.samba.org>:
>
> Reviewed-by: David Mulder <dmulder@suse.com><mailto:dmulder@suse.com>
>
> On 9/19/19 6:12 AM, Paulo Alcantara (SUSE) wrote:
>
> When attemping to chdir into non-existing directories, mount.cifs
> crashes.
>
> This patch fixes the following ASAN report:
>
> $ ./mount.cifs //localhost/foo /mnt/invalid-dir -o ...
> /mnt/bar -o username=3Dfoo,password=3Dfoo,vers=3D1.0
> Couldn't chdir to /mnt/bar: No such file or directory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D11846=3D=3DERROR: AddressSanitizer: attempting free on address whic=
h was
> not malloc()-ed: 0x7ffd86332e97 in thread T0
>     #0 0x7f0860ca01e7 in
>     __interceptor_free (/usr/lib64/libasan.so.5+0x10a1e7)
>     #1 0x557edece9ccb in
>     acquire_mountpoint (/home/paulo/src/cifs-utils/mount.cifs+0xeccb)
>     #2 0x557edecea63d in
>     main (/home/paulo/src/cifs-utils/mount.cifs+0xf63d)
>     #3 0x7f08609f0bca in __libc_start_main (/lib64/libc.so.6+0x26bca)
>     #4 0x557edece27d9 in
>     _start (/home/paulo/src/cifs-utils/mount.cifs+0x77d9)
>
> Address 0x7ffd86332e97 is located in stack of thread T0 at offset 8951
> in frame
>     #0 0x557edece9ce0 in
>     main (/home/paulo/src/cifs-utils/mount.cifs+0xece0)
>
>   This frame has 2 object(s):
>     [48, 52) 'rc' (line 1959)
>     [64, 72) 'mountpoint' (line 1955) <=3D=3D Memory access at offset 895=
1
>     overflows this variable
> HINT: this may be a false positive if your program uses some custom
> stack unwind mechanism, swapcontext or vfork
>       (longjmp and C++ exceptions *are* supported)
> SUMMARY: AddressSanitizer: bad-free (/usr/lib64/libasan.so.5+0x10a1e7)
> in __interceptor_free
> =3D=3D11846=3D=3DABORTING
>
> Fixes: bf7f48f4c7dc ("mount.cifs.c: fix memory leaks in main func")
> Signed-off-by: Paulo Alcantara (SUSE) <pc@cjr.nz><mailto:pc@cjr.nz>
> ---
>  mount.cifs.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/mount.cifs.c b/mount.cifs.c
> index 7748d54aa814..0c38adcd99b1 100644
> --- a/mount.cifs.c
> +++ b/mount.cifs.c
> @@ -1893,7 +1893,7 @@ acquire_mountpoint(char **mountpointp)
>         int rc, dacrc;
>         uid_t realuid, oldfsuid;
>         gid_t oldfsgid;
> -       char *mountpoint;
> +       char *mountpoint =3D NULL;
>
>         /*
>          * Acquire the necessary privileges to chdir to the mountpoint. I=
f
> @@ -1942,9 +1942,9 @@ restore_privs:
>                 gid_t __attribute__((unused)) gignore =3D setfsgid(oldfsg=
id);
>         }
>
> -       if (rc) {
> -               free(*mountpointp);
> -       }
> +       if (rc)
> +               free(mountpoint);
> +
>         return rc;
>  }
>
Merged, thanks.
--
Best regards,
Pavel Shilovsky

