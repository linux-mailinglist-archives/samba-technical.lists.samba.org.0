Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C44EEC4EEC9
	for <lists+samba-technical@lfdr.de>; Tue, 11 Nov 2025 17:04:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=p22dqnTP+WT7LTzsUQpMYPFrvPg4fKs8whrEeV7I6/k=; b=UW3gUPFEZ1E60nAA8S9rNc3JmF
	/atqwVwzQHfnzbYjiLyScq4d46BOz1sopbhBp1WTMGRXJwV2fLwxeiDQId+dAzOhHILrb0wmSA3FT
	DR7u+NucyPj8/lQ5eL2e4g2khKYnwM6zQNjD/c9Nct9E4YnCRAaD5Offyfq7bAGedwZvh3nH/zkLR
	3nqSzu5fzHVoQHRI+uFBf2bKbnHPFfugkeDAvT4lVH1vE5goDYaDXlApGQD3SxMfs7N3kfnGhBHzg
	Qro02bBfBFNUIRdgDzWTXUl5i9WZxXw9uyRaPa6r+LWvjqFwPahvCzKEE8MRgZQN07olIgBAEcuHn
	qW68s8Aw==;
Received: from ip6-localhost ([::1]:64638 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vIqqi-00C0so-Rv; Tue, 11 Nov 2025 16:04:04 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:54404) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vIqqf-00C0sh-OP
 for samba-technical@lists.samba.org; Tue, 11 Nov 2025 16:04:02 +0000
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-8824ce98111so29051896d6.0
 for <samba-technical@lists.samba.org>; Tue, 11 Nov 2025 08:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762877040; x=1763481840; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p22dqnTP+WT7LTzsUQpMYPFrvPg4fKs8whrEeV7I6/k=;
 b=Ecw53iwTXBM/Gzyyr4PRcMjnGxAKP4w0cIC6exYxLlZIidSims3dnDsC/NIRXPVdY4
 angufTsAbfb2cdVWMW8dVKkfw0+lRIuHsgOE8pgWRVus1+BpME6WCM3OfYpLrqrQzq2I
 +KmWq7fjFtJTydJK4oVzLfc1l7lOGZD5J/6I/yghzvQ7yZXl3i+2g2MAr4chp3T/pr/c
 3aVZAxMmLp6YcvrMIWne6g5dao1V5TodiK7Y87prPP+SICLAS/34Re0R0DH6YzuAKvJ3
 TRGvtxey4e8t8Rurjy9STgIFG71++uafgtN0Dc+bGmFX/EgoPh54vSqh4ZhHIAwtxJhZ
 jCCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762877040; x=1763481840;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=p22dqnTP+WT7LTzsUQpMYPFrvPg4fKs8whrEeV7I6/k=;
 b=PZJxnlEzpC0LDw/WkL1AnMgMlKHIh6MygMN4lk17++f9POnoEQ5Zu4SbKtKL+Se3Pz
 kuAVM0009t7k9UBhV69iddaFl6Orpq34d8g8CRDt/YzPQdyJvBCNpNU1o28fqpql7dmW
 58lAdaA085+gHIVVzXsPZZ3eNwXJMOSxUL4xYxOj7ELEiJ9ecneSc0jK7gpJ03VRcri7
 JE1Fhve0q5CLSBOzKrl+rN8k9akqpS06EP8CWb4I04F71rL4dWtFPj7nVhOkyH3kO7e6
 zQ8XWHYhubLYIyRBc1vWqSvQC1yTeoFCSjPPbDQ+b6NpY8+k5Fb1RcfwN0M5lyGLib1p
 wcuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyybo0ZPp5K5PP11MEPh+uRsyTBWtJwjdooIQ2FNvrKgavnwLKk6rBzhxwXRZ/smVjltiv9I+hhDfYrcDbmXc=@lists.samba.org
X-Gm-Message-State: AOJu0YxiZ0gedhpMfhyRMYKB6d7suLINm7Gr2XIxX/7kgcZwdE/ZLGag
 VyyeNjp1/U+17PvL8rkZ20Ez4bwusIHegx7dL+6JZEKb6kCqiCzdsSB615kmviY13kk0ZuvalG6
 oCpt0tyecs8G5hHJgC/56fKUWS6k2XEg=
X-Gm-Gg: ASbGncuWqyLUOiufZwuOdIl3SXchjtzN8Oz1iFtc2u9xrLaBH8WJWoOG+knNkKYvM8r
 sj5jEvXq0AKhf04YLuYYrJjpXQT/yUDERowtDzL0/U+0Xuq68R+nRULHhm/iVO8aunheIS8SHlS
 6ICLgpuN8xcNcoWhptOje1k2BzUaH7EDdWbo0Suosb/ehEkbAfU759yQpubQoqzmgaTqolu/e+4
 PElGZFZF3GeQjrsYAAhXTjYcmxmK45LGt/Uc4aZGlass2h23i+q4WAXuKVi/FtqeKuz5iQExNGp
 rDkkWXf8xnGk/d67g0NlD/+i7f0Is9H4Hkd96OdDU7jvL5BbOKQlzJGAgJddSEt0Tn/bngbC2PK
 cI6+cQ0FdgRyuBrlCZ2bHs1vzsx+UI9C0sDBXViDROMgjrcvOJK+SLwW7IeELLWOkptFAcBfM8Q
 gZmh1x87AvTOyUrzBxrnU=
X-Google-Smtp-Source: AGHT+IGbI2y8BO4zXLUCfMUPsmSUaVvSwPP3A7OqUwFX0uRSKtOhi6kkDFDcw0Vnhb7AgoDQJVNEyWKQqIxY52glLdk=
X-Received: by 2002:a05:6214:3010:b0:87f:fb2e:9991 with SMTP id
 6a1803df08f44-882385cfb7dmr212493586d6.6.1762877039610; Tue, 11 Nov 2025
 08:03:59 -0800 (PST)
MIME-Version: 1.0
References: <20251111070539.1558765-1-sunyiqixm@gmail.com>
In-Reply-To: <20251111070539.1558765-1-sunyiqixm@gmail.com>
Date: Tue, 11 Nov 2025 10:03:47 -0600
X-Gm-Features: AWmQ_bnWa6CPOjA90RODWVbZ9Ca-j58oVz0SxlTOoe6a2Jum9heLBu_4Q52omkc
Message-ID: <CAH2r5msGsFW0GBrZpt1odmn8yXMbORMCHWTnD2xGOhG6GpWoLA@mail.gmail.com>
Subject: Re: [PATCH] smb: fix invalid username check in
 smb3_fs_context_parse_param()
To: Yiqi Sun <sunyiqixm@gmail.com>
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
Cc: tom@talpey.com, sprasad@microsoft.com, pc@manguebit.org,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, sfrench@samba.org, bharathsm@microsoft.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

tentatively applied to for-next pending review and testing

On Tue, Nov 11, 2025 at 1:19=E2=80=AFAM Yiqi Sun <sunyiqixm@gmail.com> wrot=
e:
>
> Since the maximum return value of strnlen(..., CIFS_MAX_USERNAME_LEN)
> is CIFS_MAX_USERNAME_LEN, length check in smb3_fs_context_parse_param()
> is always FALSE and invalid.
>
> Fix the comparison in if statement.
>
> Signed-off-by: Yiqi Sun <sunyiqixm@gmail.com>
> ---
>  fs/smb/client/fs_context.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/smb/client/fs_context.c b/fs/smb/client/fs_context.c
> index 59ccc2229ab3..d2cf1f60416a 100644
> --- a/fs/smb/client/fs_context.c
> +++ b/fs/smb/client/fs_context.c
> @@ -1470,7 +1470,7 @@ static int smb3_fs_context_parse_param(struct fs_co=
ntext *fc,
>                         break;
>                 }
>
> -               if (strnlen(param->string, CIFS_MAX_USERNAME_LEN) >
> +               if (strnlen(param->string, CIFS_MAX_USERNAME_LEN) =3D=3D
>                     CIFS_MAX_USERNAME_LEN) {
>                         pr_warn("username too long\n");
>                         goto cifs_parse_mount_err;
> --
> 2.34.1
>
>


--=20
Thanks,

Steve

