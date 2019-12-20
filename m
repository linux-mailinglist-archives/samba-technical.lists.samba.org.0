Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B031272F6
	for <lists+samba-technical@lfdr.de>; Fri, 20 Dec 2019 02:44:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=sfr0DkASOT0MoT13/9e3piyeEKgEAbIuAROVb11tB/8=; b=QQ70I0tCKHMu5F98peLffEj2PI
	YTnwh+ebYKY+mWhEkJdCHDtmy5a9qaCQMY90ms2DX9ODHJx3V9W+JU5YLZZbiFJSgfJFCN0yTE06E
	m9sHw3zy2ln5CGZzJSwOhTQvJEGI5ZdADN7RXSell4ijhPRBrFwvDzSpeQlOMo49Xm20HxM7pDVfA
	puyoGsbYW9eoyVMGO8B1H6s0GvdkIjl8ECPsX0cvrC6hOT1YMixqdwU6R6gtanvotlO3lOSnOoGMq
	MAfrefxhDfji3hbnqdoMFw3dN3srpnKkl8ejkmI/el5M9cjCRRtc6IX7GiiryCZaFnOKIif72ESfH
	ZsSyeC0Q==;
Received: from localhost ([::1]:62038 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ii7JX-007zhS-6x; Fri, 20 Dec 2019 01:42:47 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:33081) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ii7JO-007zhL-N2
 for samba-technical@lists.samba.org; Fri, 20 Dec 2019 01:42:41 +0000
Received: by mail-il1-x143.google.com with SMTP id v15so6579957iln.0
 for <samba-technical@lists.samba.org>; Thu, 19 Dec 2019 17:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sfr0DkASOT0MoT13/9e3piyeEKgEAbIuAROVb11tB/8=;
 b=hDmKdmCEoRGDXnjj93XNfw6FoH8rtTZnKOYluWiw5na7UgC74B6XdOt5X1HcRAZnun
 odMTXStKNxHolBzNSxflFXZPttY+WPy9NuB7kXkL7OP1k/ur6X6NpKB/iKDkiptIEdRS
 B3pnFp6TsBm89uV38uszZHKpaaGpRnoIf1L685FfOY/qaHRt13u7hKgbWQ6mQ5cz8gRs
 0M5S7JWjgFvHlPSo1Y0gpvuxkzFLPwBOzs/bm3M+mrbCvk1+QB6786aHyt+b7f8gEJPh
 EDWgjplRuJyYyf5oXtJ/se+QjE0zNlc4rDEb6iBCEVweQKlA1pEgVjeCj4jya3lq5jJD
 SMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sfr0DkASOT0MoT13/9e3piyeEKgEAbIuAROVb11tB/8=;
 b=pHsQHiHpKqj9l6OA3glv24Q37pmYREz7St1Cpu7gW7VuLWFsfJfYVqYPfUjXPuuEFV
 Iq9FtWQYrtdTNQzAvHbHRD0cVFMcnevjmuENsEFhqjYVEsz6DgQ4YUH05nHH+rM15iyN
 xD0iZNeknEy25abtngjb50L/dcWyQIqlRY78qOiHukSpnPV4gxV2IEmAUfkiOk62QcCE
 /E0G8Q3yB4riw+0y4Ld4AbdmKyScLUCtZ0xcs3niqvqlA6PwEz5xF0P2tawS1XAoXssD
 1zZXW3F4ju/H78AKvrcSZUaGiTe9kxzu7B7I8nwBprldV+DRV/0CNNT6MKQXFs5QK0HI
 AoKw==
X-Gm-Message-State: APjAAAUKotHABG+14qEBQDijXk5CTe/or+WSkggJEc5IlM1hEp8toRGW
 XrWtWEvEMYx3m9xkyzssnfl8FKtoitJQ5Y3kiOg=
X-Google-Smtp-Source: APXvYqwW12fGRUInSbhFGQiF8M5rMUYdDDkl/mkcbRhVNYfiGDJz2k/OjCft5BgxUUEN5KqBimqQgZwbaY/hrYQzo6Y=
X-Received: by 2002:a92:4883:: with SMTP id j3mr9930949ilg.272.1576806154739; 
 Thu, 19 Dec 2019 17:42:34 -0800 (PST)
MIME-Version: 1.0
References: <20191218030451.40994-1-natechancellor@gmail.com>
In-Reply-To: <20191218030451.40994-1-natechancellor@gmail.com>
Date: Thu, 19 Dec 2019 19:42:23 -0600
Message-ID: <CAH2r5mtr=d-LYD_EQ_OQVX5s8QziHvAYNmRnwMpVjeb4JiHMYw@mail.gmail.com>
Subject: Re: [PATCH] cifs: Adjust indentation in smb2_open_file
To: Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, clang-built-linux@googlegroups.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Tue, Dec 17, 2019 at 9:04 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Clang warns:
>
> ../fs/cifs/smb2file.c:70:3: warning: misleading indentation; statement
> is not part of the previous 'if' [-Wmisleading-indentation]
>          if (oparms->tcon->use_resilient) {
>          ^
> ../fs/cifs/smb2file.c:66:2: note: previous statement is here
>         if (rc)
>         ^
> 1 warning generated.
>
> This warning occurs because there is a space after the tab on this line.
> Remove it so that the indentation is consistent with the Linux kernel
> coding style and clang no longer warns.
>
> Fixes: 592fafe644bf ("Add resilienthandles mount parm")
> Link: https://github.com/ClangBuiltLinux/linux/issues/826
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  fs/cifs/smb2file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/cifs/smb2file.c b/fs/cifs/smb2file.c
> index 8b0b512c5792..afe1f03aabe3 100644
> --- a/fs/cifs/smb2file.c
> +++ b/fs/cifs/smb2file.c
> @@ -67,7 +67,7 @@ smb2_open_file(const unsigned int xid, struct cifs_open_parms *oparms,
>                 goto out;
>
>
> -        if (oparms->tcon->use_resilient) {
> +       if (oparms->tcon->use_resilient) {
>                 /* default timeout is 0, servers pick default (120 seconds) */
>                 nr_ioctl_req.Timeout =
>                         cpu_to_le32(oparms->tcon->handle_timeout);
> --
> 2.24.1
>


-- 
Thanks,

Steve

