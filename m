Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D37A035939C
	for <lists+samba-technical@lfdr.de>; Fri,  9 Apr 2021 06:10:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=jrdGfzw0sLrUe/7ljN5TaAvoWpq/FVRgXaiuOP0F+qw=; b=NtUs/VPXWHEVSE2WQ2dZzulnJk
	9ccxdUcJnGdLVgLBYT3yX1qvmLeEulOZ0swf8zv1+HaNUjyO5DqCO6oB8KVfy1rk4C059331nyIZn
	g6wGX86MwJrVK8WzbTCAoJiS3Nem7aLSrCKUe++yuTFKumdPb6cUT89cz6AKEbyL+5D84bbe4kh3z
	yJSbUcFlckajhxc7gLYHhArAKV+AGvL8kg0AWEUiubu3PE/lUwKheTZOwISpJ92aDGMu5rst4A1se
	3YNA57VULkL2YtY6NNHAn4RbtLMGiiDVO2syS3p91X77bQebrkh3qcHec+2ZHEJgZdd8YjLJ1TShL
	GQvnUBoA==;
Received: from ip6-localhost ([::1]:49878 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lUiT6-00AbeZ-Fu; Fri, 09 Apr 2021 04:10:04 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:45002) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lUiT1-00AbeS-O3
 for samba-technical@lists.samba.org; Fri, 09 Apr 2021 04:10:02 +0000
Received: by mail-lf1-x131.google.com with SMTP id d12so7502101lfv.11
 for <samba-technical@lists.samba.org>; Thu, 08 Apr 2021 21:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jrdGfzw0sLrUe/7ljN5TaAvoWpq/FVRgXaiuOP0F+qw=;
 b=BeKsYzEzoNKY7lToW6m6+vEexUtrGxIm5fBgoZh7/3PECzuJlRUtfssVfHMIoEPJ3/
 4Po6jKgapuUxiSoDWQ1wDcd5nyluNhOyr2FGUe7RrKgVb/U3R9imrnWyI/TRWcHNbI1o
 1C9Rd8Q18uRzGlgVBsdqD/Sc6zepIbBf5E1N4+euuLoogmPSF6qVPMeb75ZDQBhA37YH
 h31k6F+Qa2h6yRX87wZh41iFw7tHVdqpJHj01KIb3CMsFwGYQyNoyKtyCdOWDbxz1wzp
 NhJpWJK+OP3Ed3XPoYhADIHcAaHjsHH5BJioERkY2mASm+eW4vLm3ZHVqjPFYthvTKn1
 BoBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jrdGfzw0sLrUe/7ljN5TaAvoWpq/FVRgXaiuOP0F+qw=;
 b=Z8Hf7w+O4ofrfXIJul43JPDByT8ftuE8nZ4Ulm0HvwBYnDayQPZUtr1iy35knvr6s5
 CcUNzk9ppdtehRGgPMHO2zrwNPfUEIqVdEXN6ttUxpKTHvX1DJHe6lhmQcP7fRbBkxzN
 boJRUXHYD2OUyP6FwdHgnLsaSYPV7oPbqxi38IHi5RQrBtxxJ2MxZVD1Qcduq6zLculq
 hJ1reHH2wdYvtfj0NFNGcXrBoKmUYl3hrRvbR/OFGZDufP/mCLCTs+AXhZ4Yyj+5Se+p
 fCnlUEsXsOHo+QpNlaarav5JbOiHJyl0x0dDjkE3Vt9gGInUQo+mOT7nssPWiivQXfNP
 89BQ==
X-Gm-Message-State: AOAM532qVXpH4mYJMx8l/izrf5IIL+m7S+vmREhKfgw9Bi3nOkQ9NWqk
 zAfGGdd0aSIA9UtP43nb//v/8v7xTudoulgZ9lQ=
X-Google-Smtp-Source: ABdhPJzzqaul7xF/ZUamoMPlogelnhKWk4VAgGT3Ym1rfjd0CvJGieCbIeSnpvX5PsPwSB+FNUzQ0fjjpnHHEy9Tras=
X-Received: by 2002:a19:8c0a:: with SMTP id o10mr9056546lfd.175.1617941398568; 
 Thu, 08 Apr 2021 21:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <1617870662-78127-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1617870662-78127-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Date: Thu, 8 Apr 2021 23:09:47 -0500
Message-ID: <CAH2r5mtmeMpkp=vAZYws7c7O+bXo-0XCmLLtNPLUYqV3rByqpA@mail.gmail.com>
Subject: Re: [PATCH] cifs: Remove useless variable
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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
Cc: Steve French <sfrench@samba.org>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Thu, Apr 8, 2021 at 3:33 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Fix the following gcc warning:
>
> fs/cifs/cifsacl.c:1097:8: warning: variable =E2=80=98nmode=E2=80=99 set b=
ut not used
> [-Wunused-but-set-variable].
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  fs/cifs/cifsacl.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/fs/cifs/cifsacl.c b/fs/cifs/cifsacl.c
> index d178cf8..fdb258a 100644
> --- a/fs/cifs/cifsacl.c
> +++ b/fs/cifs/cifsacl.c
> @@ -1094,11 +1094,9 @@ static int set_chmod_dacl(struct cifs_acl *pdacl, =
struct cifs_acl *pndacl,
>         struct cifs_ace *pnntace =3D NULL;
>         char *nacl_base =3D NULL;
>         u32 num_aces =3D 0;
> -       __u64 nmode;
>         bool new_aces_set =3D false;
>
>         /* Assuming that pndacl and pnmode are never NULL */
> -       nmode =3D *pnmode;
>         nacl_base =3D (char *)pndacl;
>         nsize =3D sizeof(struct cifs_acl);
>
> --
> 1.8.3.1
>


--=20
Thanks,

Steve

