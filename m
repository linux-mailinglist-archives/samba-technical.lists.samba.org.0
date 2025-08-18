Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 24900B2B392
	for <lists+samba-technical@lfdr.de>; Mon, 18 Aug 2025 23:42:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=xVrApoP14f9caj21OlfYIfBa76LwsWl3k/rrsNeI8aU=; b=uysJQerFjmdFDIwcL/YTJCucB3
	7EymMmy76W1EkPuCtzBxUn0FbZh9fPm73BtI85jo/SrpA9IuGeQ3HfCKOTlQPdT66OJT3VTkdxJ8z
	+Iwf7O09BUh0SuR84x1PgEapDYFGRCZzOxLZ+XwjfZxBCpLUqScMkHWAnptWJwAQGnShxExPgh3Tm
	RKp0I53/AmpTO/FbvqZ+S8iduzjyfiuJPSdoCJC97CkddB6BVquuPZZRxQO6HhUK94Mg8/O7xZjpi
	Gu6o88Frj7uAmOUYiR3VvrepkkiqK2jBFw4AK8DIlTf6GImF5uCliqyxrrXdIGawwsk26PgWvAwwo
	lSAmEAlw==;
Received: from ip6-localhost ([::1]:49810 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uo7cK-00FH9n-9t; Mon, 18 Aug 2025 21:42:12 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:56568) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uo7cE-00FH9g-Dl
 for samba-technical@lists.samba.org; Mon, 18 Aug 2025 21:42:10 +0000
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-7e8702fd3b2so462895185a.0
 for <samba-technical@lists.samba.org>; Mon, 18 Aug 2025 14:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755553324; x=1756158124; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xVrApoP14f9caj21OlfYIfBa76LwsWl3k/rrsNeI8aU=;
 b=Hnne+9Z7i54w+wH1NiHqf95uw9gKewvi538/3RkvLJfVgwCeM50AFWOgqpL6hrJKAR
 CSNHzXjfKBv6DvFw+p9Swctfcxh6Tmt/ZIyJJLf276fqy/rydi8VNn3WSFGQ5NeTEbLr
 LPoUpx4j1/JdWiRmd55qSoQ7hlO3Cs8PY/uGPQQLpRtj6NzTYGcLSNNb2rCafKnMfes3
 kDOnemMvGRU8CbL/9twjkT7uZg5x3wGnT8DrAty38IcDLJa6ZgRlecXPFYlUugAdmci7
 eMinCQzj+vmqB0MenMFPynsvuQTRvIvCapD6QTB2qRQpIsuQ8/60HxdjzxWaDRB3kDgj
 RzZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755553324; x=1756158124;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xVrApoP14f9caj21OlfYIfBa76LwsWl3k/rrsNeI8aU=;
 b=qdpLhYFwjEpvr7gVVQQshP+8qnamxY8o99GSTsSWGsl4GwNbU7qoi8/RPg67k7nHrZ
 lnB/OfyDjMEc281BEyzFdp1M4uugAerMPbXYq5gsMUdvQLWJTQ9SzUxdC+7a5qZxAIrC
 /uIXX+1w9PFSyhlb44YEaDdaHIniOTJrxA1cnMMKOr3xq6bawyadXNy7f53htCe4FOjE
 9SISzxbFjzdycuPst86PapEpYE5wSYHxn84BZHLRCz+w11w9ohbxbEiyEc0jtsJeshCR
 eSYs77ova6IBWvj413nECRW4JeUY4GDSeG7nYydN6GgSjlGC+3F9aI2FCl7OADyC3TNr
 RlLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwmh1ibjPq39lxJ4W8Pqb7g/PdjYlG03cGJiEeiu5WI31h++4zUMiNnbJ5LRzcc2D7LnmbSDGNSptRtDtMtcY=@lists.samba.org
X-Gm-Message-State: AOJu0Ywdq4vvsEmjlI8WOmtLCpE6o3+xDZI5yi+nrQaCAqbTb3Ur4sLm
 CBOmhqnUyAYUMxhSTc6LupoYSDBXQSrmbZTPqkopICip6tvEtRKVJuRcdLN9KpDUg/peep19uVL
 Go8uKDGI7dbNrRdd3Hq6BiGOBv9DVr5s=
X-Gm-Gg: ASbGncsbvBGBQ1TqcdIeNSQ3QI6MENODtsUrrtbtYrYOkRHfbQPm+j68Wh+GfgU7TjQ
 YnkSSX0vJHicggDgGfpRpKfuukOSlO+N9OUJLCAnizeh34tnDQZ+rYzZy28608xyujJLPyGnwus
 KesQ5iQ5b5tYVuEB/KwR2XZB8rBpUdqQgVoBC1TXRQ8nWDGTJseUeC6+AkUiKpLwIH8o8ViD9Q8
 qNiFGZtbEs8zqX3PDYOH5Xmerj2SGFmWmBVMItZbgqO0DGSHgeztYWctEUSiQ==
X-Google-Smtp-Source: AGHT+IFjMAkT1mpPySflC+bP9ZHS64EiNo5JBjZgoMeWA3kK3ZsMgAjLbou5MIdDwNmOYm9WYdTpVGUD2Bs1b4gT8I0=
X-Received: by 2002:a05:620a:4686:b0:7e6:9644:c993 with SMTP id
 af79cd13be357-7e9f331f874mr67836285a.15.1755553323896; Mon, 18 Aug 2025
 14:42:03 -0700 (PDT)
MIME-Version: 1.0
References: <aKL5dUyf7UWcQNvW@stanley.mountain>
 <89a2023c-e383-4780-83e3-ba8f9e44c015@huaweicloud.com>
In-Reply-To: <89a2023c-e383-4780-83e3-ba8f9e44c015@huaweicloud.com>
Date: Mon, 18 Aug 2025 16:41:52 -0500
X-Gm-Features: Ac12FXwxzyYRFXGH5ZrXXAIDEefWWgUFghEhiymRb0KWanoatFRoAiMK5AWyNkk
Message-ID: <CAH2r5muVjS+Y_NFSWwYoisPGfynyTkmynjpQHi2_Kk6Z8AiG0w@mail.gmail.com>
Subject: Re: [PATCH next] smb: client: Fix NULL vs ERR_PTR() returns in
 cifs_get_tcon_super()
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
Cc: Tom Talpey <tom@talpey.com>, Shyam Prasad N <sprasad@microsoft.com>,
 Paulo Alcantara <pc@manguebit.org>, linux-cifs@vger.kernel.org,
 kernel-janitors@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, Steve French <sfrench@samba.org>,
 Bharath SM <bharathsm@microsoft.com>, Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Since Paulo pointed out a problem with v4 of this patch, an obvious
question is Dan's patch "independent enough" to take or would it make
the v5 of your patch harder.  Let me know when there is a v5 of the
patch so we can do more testing and review

On Mon, Aug 18, 2025 at 8:30=E2=80=AFAM Wang Zhaolong
<wangzhaolong@huaweicloud.com> wrote:
>
>
>
> > The cifs_get_tcon_super() function returns NULL on error but the caller
> > expect it to return error pointers instead.  Change it to return error
> > pointers.  Otherwise it results in a NULL pointer dereference.
> >
> > Fixes: 0938b093b1ae ("smb: client: Fix mount deadlock by avoiding super=
 block iteration in DFS reconnect")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>
> Hi Dan,
>
> Thank you for your patch and for taking the time to address this issue.
>
> I would like to mention that I have recently sent out the V4 version of
> the patch series, which addresses the issues related to `cifs_get_tcon_su=
per()`.
> In the latest version, the issue of NULL pointer dereference has already
> been resolved.
>
> https://lore.kernel.org/all/CAH2r5msLMNdqdo6EBuTvrQ0hwrqSRC-LSZuN2WpwV+Pk=
DwsCOw@mail.gmail.com/
>
> I avoid null pointer dereferencing by performing a null pointer check on
> the return value of cifs_get_dfs_tcon_super().
>
>
> > ---
> >   fs/smb/client/misc.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/fs/smb/client/misc.c b/fs/smb/client/misc.c
> > index 3b6920a52daa..d73c36862e97 100644
> > --- a/fs/smb/client/misc.c
> > +++ b/fs/smb/client/misc.c
> > @@ -1116,7 +1116,7 @@ static struct super_block *cifs_get_tcon_super(st=
ruct cifs_tcon *tcon)
> >       struct cifs_sb_info *cifs_sb;
> >
> >       if (!tcon)
> > -             return NULL;
> > +             return ERR_PTR(-EINVAL);
> >
> >       spin_lock(&tcon->sb_list_lock);
> >       list_for_each_entry(cifs_sb, &tcon->cifs_sb_list, tcon_sb_link) {
> > @@ -1141,7 +1141,7 @@ static struct super_block *cifs_get_tcon_super(st=
ruct cifs_tcon *tcon)
> >       }
> >       spin_unlock(&tcon->sb_list_lock);
> >
> > -     return NULL;
> > +     return ERR_PTR(-ENOENT);
> >   }
> >
> >   struct super_block *cifs_get_dfs_tcon_super(struct cifs_tcon *tcon)
>
> Additionally, I think it somewhat peculiar that in the current
> implementation, cifs_get_tcon_super() returns -EINVAL.
>
> I would greatly appreciate it if you could review my latest patch series =
to
> confirm if it resolves the concerns. If there are any additional improvem=
ents, I
> would be happy to collaborate further to ensure the best possible solutio=
n.
>
> Best regards,
> Wang Zhaolong
>
>


--=20
Thanks,

Steve

