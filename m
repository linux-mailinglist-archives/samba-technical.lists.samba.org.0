Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAA7BD5FFC
	for <lists+samba-technical@lfdr.de>; Mon, 13 Oct 2025 21:46:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=GcmZEKTNBTIPCp8q96eFzSv9hIg6mWUgJbBgwmUh3jc=; b=wkKKa1AHfFTWXqQViOjMfyGaSM
	xjR1/z8lIRpcdYQLF+7NzuC8V6oG5Ft1gDaHPJi1j5OtCM9JfLrwvQHP62Gf2bxO41loT2mUjXcUE
	upch8ncPzgeY3h6UN7H0ud36V1HyJlVHAeIfpXvtguPn9oPrCKC6VqJIBgg5LrBWk8Erpa3ZCGZUw
	lQ0BkaPCPC8HMj0BimxHp+CcySz0S4BC17/7Gmyy4C6g7GHaL+1l5iD8dKgf/9mexmkNWMaQVBNDW
	JN5lEvVp6GMnhHyxDj4GgJ3ssbB60iMSztfyVOoiIL6tg5su4aQkez3W32RUOUPpgooXvz9YkYbTv
	9w1msYig==;
Received: from ip6-localhost ([::1]:29708 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v8OUM-007iBq-BJ; Mon, 13 Oct 2025 19:45:46 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:61673) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v8OUH-007iBj-Op
 for samba-technical@lists.samba.org; Mon, 13 Oct 2025 19:45:44 +0000
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-875d55217a5so632988485a.2
 for <samba-technical@lists.samba.org>; Mon, 13 Oct 2025 12:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760384740; x=1760989540; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GcmZEKTNBTIPCp8q96eFzSv9hIg6mWUgJbBgwmUh3jc=;
 b=ftE5oMeQT6xYbHHA63dkgyxvAwlVPEePcA5oYXxI6SzFk4l9tm9rLoXJEeyZpb8ZGj
 zrPH4iovdD42XMJAtRrFVd1nPDWSVCqcz636AuEZ2cH4bj449kRNuXbCA0OGAVn2fbFu
 IT6qYxZ0+4OkDuw/0VrJ40VpFB1sbwB8OBwjybtEk2g88X/mwiAWYULB9dHi/wdqftKU
 mmZoGIvOgb59TVPdifDURCuYU6lMdLxU6YXDuB3mjqEGqIqS4k/kzHJXcu23vtytF5Z6
 rC0wy+su4jYM9tULzDfKty9eYMD086mzX92ClIO7KAgGNxjL4RLeMAbiT7VFx1vwXB2D
 Dt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760384740; x=1760989540;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GcmZEKTNBTIPCp8q96eFzSv9hIg6mWUgJbBgwmUh3jc=;
 b=xEf+UlAHWYOSZnnsoUh9RhpQDw+9g5m53aHas4aORP58I9iu2sxjWd9cYVKIEU87vm
 IwvSrAcZk84x9erf5+oWDeBHGAyx551fAi4BrCijrgHJtoMcNsqnJSTKYMhhnYuuPPd1
 6i8E4MTRgxGDv4eQwwf36IJzBEWVhcj5DOAti9Dfmgoyrv5tAPSIGSyQTqElbPV9EH9G
 hU9wwadejC+Xyf0HsDDYhlFpAnNItimjh48Ggn1RtvXL0AjCMgBfKiHk3DVHDDqRteCS
 ZVF1dkrZDRqpTmAQq5hb0b2zwG680OyI1csbZ1IBNkAbnXhAdM6mlX7iJSAERAf2jS4Z
 Y3DQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFmgCj6NLGU0vdT5lDFq8K29Vsiyda9VMd1GqE0hYY/HfnxoS8cgFklnyTHWgr2FHcRwwqqZ0uMrw3lS9bMXE=@lists.samba.org
X-Gm-Message-State: AOJu0YyzYbOqDS20MatP88p2aPyJOTW4nP/qS+k5dgFvIz3TYKehcJ+Q
 RzrmbC9wVtFPyzmVCfDP3hHiMq9AIECKDiL2rcPhpBDwY7GdnMztDMUiy0VVG9YdmZnvPsYvjXt
 rsikqxIIQcNYi//7XbGoHTMwvFgBt5Qw=
X-Gm-Gg: ASbGncuCBTsVcSA+Z9IcCG4gf1Pwkk/1Evu/Jp/G5WcBu8uLUVeXnVqPUTfA0JoGXaf
 v0MMcfZUSl9QAr+eH9Bizal3GK6mVH0HQZSKp9l8Ai0Z+PSuxbdnCuvqq6jwY3u3h/iOPIFw6SS
 La9pRJwctVVgduq9Y+f+diU+RaAALFG4tUkOdbwPpslas92yTWwYG7SG/DeoxE8BQ77M12UzKBt
 Qrz+f7jbiOYvddfrIFSq1XNAZeMjjOopc2aFxC1NMx3ZwLvkZ3EtgMyFX8UoEH1auAaeko1/3qK
 iKnpl+pj0xCe30tUmpgJcttEU29sTgh6BbCOyVNmxDAdf4eYjrB0B4Fa7TTQdpSLRN9hheOEcXN
 dhPXW3XkcaQZRbmgbgvtE9AIWUyY/0VDzc3nDwhzgU54mRepjn9s=
X-Google-Smtp-Source: AGHT+IF9sCYKN0g9TVqil8pUkwyUn+jjklPZeGO8CcLdwB2We9WKmu9BxTJaYyjQC5nrE6Edju/O9ncg/zr0gPWjkuo=
X-Received: by 2002:a05:622a:2cf:b0:4b4:9522:67a with SMTP id
 d75a77b69052e-4e6ead12f0amr281990381cf.33.1760384739785; Mon, 13 Oct 2025
 12:45:39 -0700 (PDT)
MIME-Version: 1.0
References: <e8a44f5e-0f29-40ab-a6a3-74802cd970aa@web.de>
 <8f7ac740-e6a8-4c37-a0aa-e0572c87fe9e@web.de>
 <CAH2r5msRAejKX=vo7xGxMZDG_s++zZyHTazoFomd6GKOSt1XQA@mail.gmail.com>
In-Reply-To: <CAH2r5msRAejKX=vo7xGxMZDG_s++zZyHTazoFomd6GKOSt1XQA@mail.gmail.com>
Date: Mon, 13 Oct 2025 14:45:28 -0500
X-Gm-Features: AS18NWCd3IA-GCOJgEu5wU-1WGwlNGLY2Cee4sZPgpXfTbOgHjuM5rizQnQvuHk
Message-ID: <CAH2r5mv46wgNC5E=y+0hU9u2SWBreBOU_=F9Y_UxYFRwo_Z-wQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] smb: client: Omit a variable initialisation in
 smb311_crypto_shash_allocate()
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
Cc: linux-cifs@vger.kernel.org, Paulo Alcantara <pc@manguebit.org>,
 Eric Biggers <ebiggers@kernel.org>, samba-technical@lists.samba.org,
 kernel-janitors@vger.kernel.org,
 "Stefan \(metze\) Metzmacher" <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Removed from cifs-2.6.git for-next, as it conflicts with Eric's recent
patch series ("smb: client: More crypto library conversions").

Obviously one of the problems of minor cleanup patches, is they can
cause noise like this

On Fri, Oct 10, 2025 at 4:47=E2=80=AFPM Steve French <smfrench@gmail.com> w=
rote:
>
> merged into cifs-2.6.git for-next
>
> On Fri, Oct 10, 2025 at 1:52=E2=80=AFAM Markus Elfring <Markus.Elfring@we=
b.de> wrote:
> >
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Fri, 10 Oct 2025 08:05:21 +0200
> > Subject: [PATCH 3/3] smb: client: Omit a variable initialisation in smb=
311_crypto_shash_allocate()
> > MIME-Version: 1.0
> > Content-Type: text/plain; charset=3DUTF-8
> > Content-Transfer-Encoding: 8bit
> >
> > The local variable =E2=80=9Crc=E2=80=9D is immediately reassigned. Thus=
 omit the explicit
> > initialisation at the beginning.
> >
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > ---
> >  fs/smb/client/smb2transport.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/fs/smb/client/smb2transport.c b/fs/smb/client/smb2transpor=
t.c
> > index b790f6b970a9..3f8b0509f8c8 100644
> > --- a/fs/smb/client/smb2transport.c
> > +++ b/fs/smb/client/smb2transport.c
> > @@ -50,7 +50,7 @@ int
> >  smb311_crypto_shash_allocate(struct TCP_Server_Info *server)
> >  {
> >         struct cifs_secmech *p =3D &server->secmech;
> > -       int rc =3D 0;
> > +       int rc;
> >
> >         rc =3D cifs_alloc_hash("hmac(sha256)", &p->hmacsha256);
> >         if (rc)
> > --
> > 2.51.0
> >
> >
> >
>
>
> --
> Thanks,
>
> Steve



--=20
Thanks,

Steve

