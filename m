Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E58F3B1FE3F
	for <lists+samba-technical@lfdr.de>; Mon, 11 Aug 2025 05:50:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=dU0qTogiP2a033v5TYXMo7DdbYERcKnC4lC7Xn3UtLo=; b=DABuNDSGZsB6+4bjfQk685MXYV
	VFRxmoAGaPr8UpZLkoEYuktGQRXv57wguo3hruW8O+1Zg2sLB5BAH3V6nuZ77WyOnGD2VThbxGA05
	iABLo4XdHPvj/p4ddVZpPVtoSiyVAHqKJdVYCLae9qU0pCtdrbpEQtGyFOfd05lBLfegCXumcFWsa
	ZW4lonCsj93OAR4NMhKfHsjDz+UyUOvx7IOeE8yn9890KoKVGESSxIHix1OkOzm3lhJil8QsaXu7u
	ntIwbGTDz2d1JHWQ3z5NVRWplfxUq3/MRGGUsFOSXsJEDJoM1Lx7lhFkoeyJcXL26QJ1kVoYxBJUa
	4hZ7PLWw==;
Received: from ip6-localhost ([::1]:36426 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ulJXw-00Eq3X-MG; Mon, 11 Aug 2025 03:50:04 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:45095) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ulJXr-00Eq3N-Nw
 for samba-technical@lists.samba.org; Mon, 11 Aug 2025 03:50:02 +0000
Received: by mail-qv1-xf36.google.com with SMTP id
 6a1803df08f44-6fa980d05a8so40353246d6.2
 for <samba-technical@lists.samba.org>; Sun, 10 Aug 2025 20:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754884197; x=1755488997; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dU0qTogiP2a033v5TYXMo7DdbYERcKnC4lC7Xn3UtLo=;
 b=OGUmhJMopLxn5YMoMY7ibCmrbXgFAXZU5Ube3teeKu2UP8zUsAk6V/Y69ECILwz8q8
 fBcAYVI7eEli8zjCGD3Qv6Ks8+ZMEe/UoWfg4PSeGTY0DyDsm1aP2Cw0G8Sn/X68vYD9
 yk5lYV+YdCar+F9M+b9bxML8UzBHaFdsiGgWKmlpyfXTbsyqVCB2SdIkUt4fx0z9Xb3g
 +5AKIb54+Ar2DqhshLQ9VT+sLwE1h9q0drrdUC+aGHQzHZZA+/BLkOXCIItdVhFoqj5v
 HdwIlbZrJ7ZyMY6DOYsyS+MItYtwBxme3Jk9QxvnIaV15EsSLrUeItjtAJRFKo9GXr5o
 6gYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754884197; x=1755488997;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dU0qTogiP2a033v5TYXMo7DdbYERcKnC4lC7Xn3UtLo=;
 b=lSkvMQmiyGEPaf4pRvjT4RGEsNLn86hKkIeSBd4+ZOU6LAJp78BN4x8rgX2SeljV5I
 +GvCeoahPAsozOte7P4To+CdY59QhkKv5cNmNOr7iIGhgDyZxxPwOsn/nzxC6r0BWFXN
 382ap90Ehk+JUEFuq64VacESIs6UBWKWd3dOSPxi1ZXSx0uikQ57sCzTadKGIMa9+meX
 1ZTC6AfU5IaK0K8TSPiSL1kuuw9rUNqJLcCyKo3o6cXYBrx+5SOjUV5OV7toRG3VTkNR
 onpKH0cwDZBc2OKDnEccRHMfuO9qlwLHQHEFzG3jTUbsh33HqoBUsRw+lOu8TZvPvn7k
 1PXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyfYwWVRk+ZPWiqvdkOE2d33qGWmaxCbmKLiRFhIkW2ukXx1/gm1f6Kgq34nK0wnp8Z1bP8TFHz0wDoBMB4rU=@lists.samba.org
X-Gm-Message-State: AOJu0YzLZLJbePdADf1JdYFTYbG3Up2/qg9OiXrLmTlxX0jIN+ax95KK
 b3t/SvOORMcIVmNCKKnkYqgn5whBDlj4EhjM1FVAAL2dt00/4no4iY5w+y/gt4oX7wj6TVJsDBv
 0CLUbazDgy0lgg8iJUOE+ub7RrVXdqYM=
X-Gm-Gg: ASbGncv2h4IjMn1WGzp4zr5wfrYqP38agRAGadfDFQSxYMciYpWpxLH5+ol8f35qnem
 +f9n85v3oiAWuDnN9c54KhXf5HI92+5hN1qZbdpsXgQwXGKATkRw9TAhdPdOU1fHTucABe75IXb
 CJJNcdlg46I10edRS22q20mB89llazfyiTIazCfXICMYeF8uqUP3JwW6oUJRjg4Pdblky3fmANT
 HUM5QmfikE/tSOSNi7xT6GiuAsuKC8x0ywp5rq+6w==
X-Google-Smtp-Source: AGHT+IF7zha6IkAtgvMpZSM/kef8AJ49qQQvXQxRtK2XDtuVt4EJE2F1Gv8Kr8UddslI+Qv3yCauyP57SlpqHn3q5Kw=
X-Received: by 2002:a05:6214:20a7:b0:707:6364:792f with SMTP id
 6a1803df08f44-7099a2842c6mr128624876d6.11.1754884197387; Sun, 10 Aug 2025
 20:49:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250801090724.2903515-1-wangzhaolong@huaweicloud.com>
In-Reply-To: <20250801090724.2903515-1-wangzhaolong@huaweicloud.com>
Date: Sun, 10 Aug 2025 22:49:46 -0500
X-Gm-Features: Ac12FXwslo12TH7OKSYMVozbK7r8DgvDFN8SBf_9dWAWAORt8pccei83N3-_dng
Message-ID: <CAH2r5muBsUA3V+JKHuNj-TeOqW5Bhg6cS+2A+zx17owHCYJw4g@mail.gmail.com>
Subject: Re: [PATCH -next] smb: client: remove redundant lstrp update in
 negotiate protocol
To: Wang Zhaolong <wangzhaolong@huaweicloud.com>
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
Cc: linux-cifs@vger.kernel.org, yi.zhang@huawei.com, yangerkun@huawei.com,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 chengzhihao1@huawei.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

tentatively merged into cifs-2.6.git for-next pending more review and testi=
ng

On Fri, Aug 1, 2025 at 4:07=E2=80=AFAM Wang Zhaolong
<wangzhaolong@huaweicloud.com> wrote:
>
> Commit 34331d7beed7 ("smb: client: fix first command failure during
> re-negotiation") addressed a race condition by updating lstrp before
> entering negotiate state. However, this approach may have some unintended
> side effects.
>
> The lstrp field is documented as "when we got last response from this
> server", and updating it before actually receiving a server response
> could potentially affect other mechanisms that rely on this timestamp.
> For example, the SMB echo detection logic also uses lstrp as a reference
> point. In scenarios with frequent user operations during reconnect states=
,
> the repeated calls to cifs_negotiate_protocol() might continuously
> update lstrp, which could interfere with the echo detection timing.
>
> Additionally, commit 266b5d02e14f ("smb: client: fix race condition in
> negotiate timeout by using more precise timing") introduced a dedicated
> neg_start field specifically for tracking negotiate start time. This
> provides a more precise solution for the original race condition while
> preserving the intended semantics of lstrp.
>
> Since the race condition is now properly handled by the neg_start
> mechanism, the lstrp update in cifs_negotiate_protocol() is no longer
> necessary and can be safely removed.
>
> Fixes: 266b5d02e14f ("smb: client: fix race condition in negotiate timeou=
t by using more precise timing")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wang Zhaolong <wangzhaolong@huaweicloud.com>
> ---
>  fs/smb/client/connect.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/fs/smb/client/connect.c b/fs/smb/client/connect.c
> index 205f547ca49e..a2c49683be66 100644
> --- a/fs/smb/client/connect.c
> +++ b/fs/smb/client/connect.c
> @@ -4205,11 +4205,10 @@ cifs_negotiate_protocol(const unsigned int xid, s=
truct cifs_ses *ses,
>             server->tcpStatus =3D=3D CifsGood) {
>                 spin_unlock(&server->srv_lock);
>                 return 0;
>         }
>
> -       server->lstrp =3D jiffies;
>         server->tcpStatus =3D CifsInNegotiate;
>         server->neg_start =3D jiffies;
>         spin_unlock(&server->srv_lock);
>
>         rc =3D server->ops->negotiate(xid, ses, server);
> --
> 2.34.3
>
>


--=20
Thanks,

Steve

