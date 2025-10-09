Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E06BC9CCC
	for <lists+samba-technical@lfdr.de>; Thu, 09 Oct 2025 17:30:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=3K/OkTfxaQVQjtAI923mEKQkdyC4/Ch4flZGg5G+nto=; b=qUY3MogbAC2/pJQjvf+RGR7N87
	dKNunSR14lvNFPmJChIkevni2xuc47l1YsWIn/Q5ql3TpJFFYJksfnqnCIq+EWziUQnFldYrtKRV1
	VPt/tuhZaAliu+QQT3G9NlB1PpM7UMSiCC6Xj2Fdzmi+Ito5/gszv42P+VipwdjFOAAt0lwKuYMU7
	7QgSWtoSWEGw7FZRYwd0U0jtDGON+R/cHjp88SVY83YaQMIwVillk0M3aZPW9mEUNpHK2NTy6OfkZ
	w0leZgFeT+x2KqccjZENX2wBKg1M/wiHpkSTc2C9HbDK/At8MsL6lIMvhZLwETHlgjoIyEjK/qlLr
	jJQzCqRw==;
Received: from ip6-localhost ([::1]:31930 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v6saw-007REv-8t; Thu, 09 Oct 2025 15:30:18 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:48563) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v6saq-007REl-1h
 for samba-technical@lists.samba.org; Thu, 09 Oct 2025 15:30:15 +0000
Received: by mail-qv1-xf36.google.com with SMTP id
 6a1803df08f44-795773ac2a2so9243126d6.1
 for <samba-technical@lists.samba.org>; Thu, 09 Oct 2025 08:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760023810; x=1760628610; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3K/OkTfxaQVQjtAI923mEKQkdyC4/Ch4flZGg5G+nto=;
 b=UXTedhxOYimvvct1awyG/71cV6ES9TIqsx3Fa0t9oQT35oQ/gK4Rw9Qw0LV+cuFBa2
 n+yU09Lf0+cGqha6m+I5wIkjhTa7Qk4b+IDRT/CHTT5JILlzXRQyBmspAmB+hICvZ+KS
 v3ukHcRT2vIDcR5ZmDtsMXn8PpWIyuwipoBOJqTgVLTBG7efKDG0U68fnhJCCzhe/ROQ
 zGZLqud6SDHu/jGvhm8xK7hlsnT2CUPwKQw2cd+Wg+C1LHlr6MwOw18ujcTLI+whmSUy
 NaPVXFc8xIIPv5sGGqun3CW765nBohTs4ADbBHgNMbNnG/CdLPQBnYKMkicba1xuDpP5
 84Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760023810; x=1760628610;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3K/OkTfxaQVQjtAI923mEKQkdyC4/Ch4flZGg5G+nto=;
 b=qgNoYG0ycihCv91rvYZIsOhtDnL+px1h03L2xJ/l7w/UXdAuvEBBNsG+OYOcGC4PrB
 +HqcpBI8kuh+rmyrdsW5ECZj2hVy2/4/AjmKdetEmSzKutOhNIkXFMto+0th4OEayGSV
 RvMLa3nDp10v9PMps43fD9Sui6lej+f+ZQRfR3IHAY4yDyyX4N2wDkbD+NSHQ2GFZX9Z
 VfvViUrk884slJBmT+C8Vm0jaLz9QbquPu/UTQWcCij4sf1LDLXUoAkffeOn0ssBQPEZ
 QJCbKftBJSBbLF5RPlekpdANjkLW/6EU9TwtoJ4K4c75DiMWcSaJhpXshIcGxhB4fxWT
 PweA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWAALpQdhdnz6w3DbNHaz7IvdWqEqyxbT0iiaGv4u+vUa7VCGswJijVr+DY8knYDLj0NCmcMPOExm9Za5ryKY=@lists.samba.org
X-Gm-Message-State: AOJu0YxyhTlcaStNuka+9w/FBUprO7qQ6RJ5CkLnPuInN1EhEvu40tAb
 +OH+fCTAUUPIUOZOLBBMMQ4WecD5jUhKjyxdSoY9MW66YCJxbRCzQijvE9tHTzYywtZAgoPOJx2
 g3Np68u+jCHbvJUW99auLe//yeMA1ig8=
X-Gm-Gg: ASbGncuqTs/XZ/nvmBeCKyNMLkIfhEJKhSWyBuAFGYgb+/aXd/nnVORX2AKh50mbF+z
 3q93hhpHlEXvTFs5NFWTal3n5GVMGXPvKIN80ay/ensGufA5Oekgjn1a9KzmEPl2/3YDNm37evc
 ynApHe3TBjohKAEmFcQqy4Yxw8YQF30mWJN/45Ai9+/PJmUFe6DPZQ26yLFKJ+ty+ZHpBKXkESE
 JxptKMVFo+52gL63do+fdHbNSaTWNT7JfPyfJoaNFVpJ1fLMtNTf+l5gTBETEOZVVTwYQ4hoe/1
 ZuP6DUR/JkUoYP/PAE7eyZ9AIxf88RqewluaVRSsxJxZMrbirto4SCpB18WbkEEPU75pEIBLCeD
 55fkZBkufa79g82EPbCTzajg7EFop4yaV4zgSVvTClCdZ5SmKF+MpY6Va
X-Google-Smtp-Source: AGHT+IGJdcJchywsY80gAXJqF2Dh5hkmMc+nT1QmiKbYTO/FxvtFxR8ICSKzlj+TOaws0AV2aAY8SzOBjdCxSsbgzqY=
X-Received: by 2002:a05:6214:484:b0:7cd:91ff:6215 with SMTP id
 6a1803df08f44-87b2efc2c6dmr99245676d6.61.1760023809944; Thu, 09 Oct 2025
 08:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <5b95806a-e72e-4d05-9db8-104be645e6e5@web.de>
In-Reply-To: <5b95806a-e72e-4d05-9db8-104be645e6e5@web.de>
Date: Thu, 9 Oct 2025 10:29:57 -0500
X-Gm-Features: AS18NWC3ORxIiPJ-wdFN48myFn8Rs2UbLqRS_MIq9LzeT2xWYlDBUeIINdVmdKk
Message-ID: <CAH2r5mvg=kqPyA2nYF=Nhjr3vkt4dT1R4p-Bk_MBQtddjx_EhA@mail.gmail.com>
Subject: Re: [PATCH] smb: client: Simplify a return statement in
 get_smb2_acl_by_path()
To: Markus Elfring <Markus.Elfring@web.de>
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
Cc: linux-cifs@vger.kernel.org, Shyam Prasad N <sprasad@microsoft.com>,
 Paulo Alcantara <pc@manguebit.org>, kernel-janitors@vger.kernel.org,
 samba-technical@lists.samba.org, LKML <linux-kernel@vger.kernel.org>,
 Steve French <sfrench@samba.org>, Bharath SM <bharathsm@microsoft.com>,
 Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

As pointed out by the kernel test robot a few minutes ago, this patch
would introduce a regression (uninitialized rc variable in free_xid
macro), so will remove this patch from for-next.


On Wed, Oct 8, 2025 at 3:02=E2=80=AFPM Markus Elfring <Markus.Elfring@web.d=
e> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 8 Oct 2025 21:56:34 +0200
>
> Return an error pointer without referencing another local variable
> in an if branch of this function implementation.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  fs/smb/client/smb2ops.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
> index 7c3e96260fd4..bb5eda032aa4 100644
> --- a/fs/smb/client/smb2ops.c
> +++ b/fs/smb/client/smb2ops.c
> @@ -3216,9 +3216,8 @@ get_smb2_acl_by_path(struct cifs_sb_info *cifs_sb,
>
>         utf16_path =3D cifs_convert_path_to_utf16(path, cifs_sb);
>         if (!utf16_path) {
> -               rc =3D -ENOMEM;
>                 free_xid(xid);
> -               return ERR_PTR(rc);
> +               return ERR_PTR(-ENOMEM);
>         }
>
>         oparms =3D (struct cifs_open_parms) {
> --
> 2.51.0
>
>


--=20
Thanks,

Steve

