Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C0294D3B9
	for <lists+samba-technical@lfdr.de>; Fri,  9 Aug 2024 17:39:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=TWXbMODiYuxXorvAx+kfN59eGwt8Ix7uvQ6uN1UXLrg=; b=uc0XQcutyWSFFqffhLKtJqwWdR
	+l5IALTWEbmaWHfBMbtkhLSYuDppJh00w3fHZEIhLPHIzxdaJ+L8YUKCPkX4yLiRv84X6yqwCIbuh
	j7mxs/Guq7H7kB972vHHb2tnM03LONT3mRx9wRavoPdZ1HRM63bQDVp+Cuh7496c0H6K/u47VQr1o
	UXKVIKz0dgYst7+S+kJNDNy4RvZp4rMeLTYLP7xv/QSOPy1xUgAYVUnkOgiqpJqbZNUCgfCsvT3/S
	IZlzj6DXh2OcAp1o2gBic/CjjQHmhTlcQhECvkRIxMrNQ6Zc1CFB0SpPjALO5MdDR33s+lK/YXxkf
	Q81jr/cQ==;
Received: from ip6-localhost ([::1]:48270 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1scRhK-004GkD-PO; Fri, 09 Aug 2024 15:38:34 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:53336) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1scRhG-004Gk6-4X
 for samba-technical@lists.samba.org; Fri, 09 Aug 2024 15:38:32 +0000
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2f029e9c9cfso34623131fa.2
 for <samba-technical@lists.samba.org>; Fri, 09 Aug 2024 08:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723217909; x=1723822709; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TWXbMODiYuxXorvAx+kfN59eGwt8Ix7uvQ6uN1UXLrg=;
 b=U1yyL4jNxtBxcH7SWoENFjXee83YzbuGhkpKY9Mv+H1M7OWDEJb51OzF490ABrm4Pe
 KZOfYNNuoYOjPQ3CVrC/LkYcwxm240TzqCRr6CtR5elXq4mkOWS49p85E0l5QoB2JjZq
 1N9B2pcKOA7q9Zd8Ju4Bkn6eFP8eyHrwdTLa3+PGHA3wlH7gc76Ii6TXds6OUL7p/exC
 +rKxMPmCts/0tFXaZ5tSRPMxqLvQopiwPvPezsz85o5PBQjosPAYS4l1yW505TliPhkn
 GMXotn05PXLg+mVuF664xMXBlbTt7q6p6rQ/w2R8c/YE94N5VncNorc94yAbDgZSFlw5
 viRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723217909; x=1723822709;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TWXbMODiYuxXorvAx+kfN59eGwt8Ix7uvQ6uN1UXLrg=;
 b=sM5UocrY08+1jPoDrgk4CMEFVCHakxnLtWS+QmS+EqP7XGflhV2cVUlayJ0NDGEFV3
 pEOePJ+9p7v1GKObJs0KvW3rSGpy0/u2VYXZPv1Bn8QpiWA0J4ApyeOeGeocvRgSk1Yz
 B4OyBm90SuFEHtD+CLxQi1KIlHf0GIPSpvg+oSJRVF2g6N9Yf3XcvBiX1KQ4Jm/S4hVa
 rXNdScvYfwXEMLKQ4PKY/R7wxAxBkYop7A76dT0yVRhW6TaKJ9pnnNyXKJle0ZliKA1X
 zAwp0s0/2MrYFA5Eo9dfvMKzl4Z9U5WssUHuhNOMom9512ih4cPi2bkO5juM2b1gLewr
 xJZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk2EozJ1oC+2K1A9XD8Ui0D5EyVn8Q3tVhNghJGFRxRsCGOx1C9iMY8arloPBHqZNcsFZhHpADL2BnbaMAzYvAXfSCHQbT47XniXiy4ys3
X-Gm-Message-State: AOJu0YyXbrSeJ6t5n1iHRneGHHlThhJ5uycCGAbG8m9+JWXbbj5w3Imi
 hid5GC2y9e+G3XVxQ/MNmYSfz4go2qcEd0SdavFxGZtpyvC+e/OScHylrkw0rBbwFflSHjPCOd0
 lEQkjOiVBs9pgPqON40B22dvNJBAfrQ==
X-Google-Smtp-Source: AGHT+IFrrCUT+HJWFjXvxQEV3ITu84mxyWLhuzwLjtJ4nW5WcXBU4YeYGQ3URChdaQ8hO1rRYjy4qKNh6eDpVlwHt5Q=
X-Received: by 2002:a05:651c:102a:b0:2ef:32bb:5368 with SMTP id
 38308e7fff4ca-2f1a6c5c2f2mr17381101fa.11.1723217908335; Fri, 09 Aug 2024
 08:38:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240808122331.342473-1-suhui@nfschina.com>
 <893f2ebb-2979-4e34-bdab-a7cbb0c7e7b8@stanley.mountain>
In-Reply-To: <893f2ebb-2979-4e34-bdab-a7cbb0c7e7b8@stanley.mountain>
Date: Fri, 9 Aug 2024 10:38:17 -0500
Message-ID: <CAH2r5mvHpNA-FLuq3gwV06tzwv+ioqQxFWqC8f3rcRPMrmdOFg@mail.gmail.com>
Subject: Re: [PATCH] smb/client: avoid possible NULL dereference in
 cifs_free_subrequest()
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
Cc: pc@manguebit.com, sfrench@samba.org, sprasad@microsoft.com,
 llvm@lists.linux.dev, Su Hui <suhui@nfschina.com>, linux-cifs@vger.kernel.org,
 kernel-janitors@vger.kernel.org, samba-technical@lists.samba.org,
 nathan@kernel.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>, bharathsm@microsoft.com, tom@talpey.com,
 morbo@google.com, justinstitt@google.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Aug 9, 2024 at 10:01=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Thu, Aug 08, 2024 at 08:23:32PM +0800, Su Hui wrote:
> > Clang static checker (scan-build) warning:
> >       cifsglob.h:line 890, column 3
> >       Access to field 'ops' results in a dereference of a null pointer.
> >
> > Commit 519be989717c ("cifs: Add a tracepoint to track credits involved =
in
> > R/W requests") adds a check for 'rdata->server', and let clang throw th=
is
> > warning about NULL dereference.
> >
> > When 'rdata->credits.value !=3D 0 && rdata->server =3D=3D NULL' happens=
,
> > add_credits_and_wake_if() will call rdata->server->ops->add_credits().
> > This will cause NULL dereference problem. Add a check for 'rdata->serve=
r'
> > to avoid NULL dereference.
> >
> > Signed-off-by: Su Hui <suhui@nfschina.com>
>
> Needs a Fixes tag.

I had added a fixes tag

> Also when you add a Fixes tag, then get_maintainer will add the David How=
ells
> automatically.  I've added him manually.
>
> > ---
> >  fs/smb/client/file.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
> > index b2405dd4d4d4..45459af5044d 100644
> > --- a/fs/smb/client/file.c
> > +++ b/fs/smb/client/file.c
> > @@ -315,7 +315,7 @@ static void cifs_free_subrequest(struct netfs_io_su=
brequest *subreq)
> >  #endif
> >       }
> >
> > -     if (rdata->credits.value !=3D 0)
> > +     if (rdata->credits.value !=3D 0) {
> >               trace_smb3_rw_credits(rdata->rreq->debug_id,
> >                                     rdata->subreq.debug_index,
> >                                     rdata->credits.value,
> > @@ -323,8 +323,12 @@ static void cifs_free_subrequest(struct netfs_io_s=
ubrequest *subreq)
> >                                     rdata->server ? rdata->server->in_f=
light : 0,
> >                                     -rdata->credits.value,
> >                                     cifs_trace_rw_credits_free_subreq);
> > +             if (rdata->server)
> > +                     add_credits_and_wake_if(rdata->server, &rdata->cr=
edits, 0);
> > +             else
> > +                     rdata->credits.value =3D 0;
>                         ^^^^^^^^^^^^^^^^^^^^^^^^^
> Why do this?

add_credits_and_wake() has the effect of setting credits->value to 0
so seems reasonable here
(in the case where add_credits_and_wake can not be safely called),
even if an extremely unlikely for rdata->server to be null.





--=20
Thanks,

Steve

