Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EF715BC69B6
	for <lists+samba-technical@lfdr.de>; Wed, 08 Oct 2025 22:46:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=+YFWjA++9pY2FRbJ3hLQ9CLg3LpwwP6DLi+keIyaDjE=; b=xarixtOavhbU91hHZ/j+YLLO7T
	TErd8zhuqkodHolSowSR3oJFh6auX6RH/6djzv1myjOcWYiIe4SXAOrJnVkhmgcWu/PYZXMS4ONBp
	fPwhu/3J9LeSVg/tQQSzSKC0h8hbELpkc6DYdyylI4jLZRuquhh9y9MueSrGZ4WTvpyARRDTLn/pO
	FyT51P6ZCyxy8D66XVgQGNokycxHKlSR7deLMA8kGsNWCZyS2sAOLXhl1Q4J2+aqOjqdzgnlwmt9M
	mCo8m7MxYvsPb57QPXzEBnwOsFz3sRKjXgXdHpAHZWZ2KcQ8flO/TAUSIuc5GlBbpUdgGWb90RW2Y
	yYuirobQ==;
Received: from ip6-localhost ([::1]:22012 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v6b2m-007Jqx-WC; Wed, 08 Oct 2025 20:45:53 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:46403) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v6b2h-007Jqk-1D
 for samba-technical@lists.samba.org; Wed, 08 Oct 2025 20:45:50 +0000
Received: by mail-qt1-x830.google.com with SMTP id
 d75a77b69052e-4db7e5a653cso1922661cf.1
 for <samba-technical@lists.samba.org>; Wed, 08 Oct 2025 13:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759956345; x=1760561145; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PUoq7J+hQNsvRf5azcl1cZqBBIrlQWgwLVC7NCfgqG8=;
 b=caIqTF2MC13RW+g6dZEcILRkpNzETnYzE/fzXaJwHnNOosluVMzAkobcl+PDmW8Jpc
 I6GEsPG6M/+0nrjkSzGaq1eLetp/ZvN6Zn2BmO8wbaMgdPN1dU0H0cOa7w4AVEOp0KAb
 LOzcy94gvkDtrsw2l33lrASvpdqR0N2lP1jBFT07blr1pjQfXVgh9zzsnI10sB70ZJfT
 PQkYZR5I36esxNRWyr0s887cZ9+MLtSvTNJV45v3oKHbwXM7GiMqdr6Dg6LGPgfmv6a1
 Ecf1Mj2z/pbSh4vYiQHsWKGnI9mRo0KBs4jgxVz9wOFDSWvQHpB7gs8AuwPlT4UoAOPI
 Eh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759956345; x=1760561145;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PUoq7J+hQNsvRf5azcl1cZqBBIrlQWgwLVC7NCfgqG8=;
 b=W0K6s+T2o6ws7JJW+rd797isuVS3QhjGnje0nLAHHkjCku2l7xEUVZF6rxcpUirpOg
 JVHTfuIgqeHoysQvf8Z4mWeEWjec7Cl/JZNttTsMd2UMmvUtEOsC6Ar08cl/ZNCHsI7T
 d/m//tSfLBl3O42D5Ks1PTbnpcH0xA0/n7XschTXTjfGU3KKl/3C1JFbqGZd0MZd9D47
 DlEfNazDfUHFkxvp+XVQURI7bzRYImNgdSiFe/bQhq9Z8a+7AO9HakYzI0BO26ond2H0
 skWHr7WiLLaBYFkVyPVq9wkbyMIxuaLgBbUFl3MkUOiFkUUHH7tkNFqD921rKadQRzQy
 JFzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRMzs4KD/oDSP+50d7f7YcEqr1NocyezvAKGfZxnQsG3B76KODEB6Uuo5/yHIzVUwKBUvxk3pQf4O8k9jQ+aU=@lists.samba.org
X-Gm-Message-State: AOJu0YxFIjQUlI1fxoH4v4SrXwcYSXHi4QsP6r9k63ESkeihUq+DUQzZ
 KCry1b3ZpSd+Sle5oOyZ2icuO7q1RG+ZTic+F6CQ43shuM9ePezqS0KUS+0F6YkPJJGDqBRX6HK
 XwBJFhshe6owB6dQIkasfw/qv8AheMVo=
X-Gm-Gg: ASbGncsbh6MEWRRM2rEQYz2pzGkwng0OELacnZPetOziZuB0FwVod823WFcS1sYE0IT
 YlYplojdbmY5lADhECbPkQd6Pz9wHt+MGMCyKaAkKmLlWMU4ntHRV9a7vUX2Q5IJqbdltVSvRTp
 4LIVxtRK2U9pZ12FvGpmIID9aYXbbIh5hwBiz4mtuRshT2CboPilcPmDOSWaNj+8C7gBNe3G3jZ
 ShSZZrvlGDqSQ2/wyXTHNKJK03uCw1u9qv+fbdRO+yFNOdu4Js4A/o98QYeiJKEqxjSoRicrTqv
 sT0Civq7/sc1BrgibSu65Th1vrLR0wsDSDExc5aoTc5bG4IXxWH63MVK5yggLLOPeT0dXiH9eBB
 et1k13gBlyntWZJIaekirbN+kg/eE/sA9Ukq02YLb0SiO
X-Google-Smtp-Source: AGHT+IGbLFYqDN+zOWxueNeZBiDVta4UDWng9Rqf/UJtqtC2dUB2CTIvKhq84mijJCW/4kzlHL+wiluUETnlSD3U2HI=
X-Received: by 2002:a05:622a:181e:b0:4d3:8663:61ad with SMTP id
 d75a77b69052e-4e6eacdccdcmr68315891cf.18.1759956345012; Wed, 08 Oct 2025
 13:45:45 -0700 (PDT)
MIME-Version: 1.0
References: <02627021-da2f-41f8-9ea7-fd2da96e0503@web.de>
 <5bd37df6-1743-4b9c-a83a-a811e221489b@suse.com>
In-Reply-To: <5bd37df6-1743-4b9c-a83a-a811e221489b@suse.com>
Date: Wed, 8 Oct 2025 15:45:32 -0500
X-Gm-Features: AS18NWCtEvhf51hIm5oieRA8JSmkzInyV17kn6hQCSb8LoD6NdWzAAxtSJ7kpfg
Message-ID: <CAH2r5msZjL_krwN-nd1Ly3skxAHK9srJehPJ_vYXPLRFXpJ_yw@mail.gmail.com>
Subject: Re: [PATCH] smb: client: Move an error code assignment in
 smb3_init_transform_rq()
To: Henrique Carvalho <henrique.carvalho@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
Cc: CIFS <linux-cifs@vger.kernel.org>, Shyam Prasad N <sprasad@microsoft.com>,
 Paulo Alcantara <pc@manguebit.org>,
 kernel-janitors <kernel-janitors@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
 Bharath SM <bharathsm@microsoft.com>, Markus Elfring <Markus.Elfring@web.de>,
 Tom Talpey <tom@talpey.com>, Pavel Shilovsky <pshilov@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Also when a patch doesn't shrink code, but even grows it by one line, and
doesn't make it much clearer, it is probably not worth changing (it
complicates future backports of real fixes in the future eg). Let's limit
these to those that shrink code and make code clearer (or ideally fix
potential bugs)

Thanks,

Steve

On Wed, Oct 8, 2025, 12:19=E2=80=AFPM Henrique Carvalho <henrique.carvalho@=
suse.com>
wrote:

> Hi Markus,
>
> On 10/8/25 2:04 PM, Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Wed, 8 Oct 2025 18:48:28 +0200
> >
> > Convert an initialisation for the variable =E2=80=9Crc=E2=80=9D into an=
 error code
> > assignment at the end of this function implementation.
> >
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > ---
> >  fs/smb/client/smb2ops.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
> > index 7c3e96260fd4..2513270ac596 100644
> > --- a/fs/smb/client/smb2ops.c
> > +++ b/fs/smb/client/smb2ops.c
> > @@ -4596,7 +4596,7 @@ smb3_init_transform_rq(struct TCP_Server_Info
> *server, int num_rqst,
> >  {
> >       struct smb2_transform_hdr *tr_hdr =3D new_rq[0].rq_iov[0].iov_bas=
e;
> >       unsigned int orig_len =3D 0;
> > -     int rc =3D -ENOMEM;
> > +     int rc;
> >
> >       for (int i =3D 1; i < num_rqst; i++) {
> >               struct smb_rqst *old =3D &old_rq[i - 1];
> > @@ -4611,7 +4611,7 @@ smb3_init_transform_rq(struct TCP_Server_Info
> *server, int num_rqst,
> >               if (size > 0) {
> >                       buffer =3D cifs_alloc_folioq_buffer(size);
> >                       if (!buffer)
> > -                             goto err_free;
> > +                             goto e_nomem;
> >
> >                       new->rq_buffer =3D buffer;
> >                       iov_iter_folio_queue(&new->rq_iter, ITER_SOURCE,
> > @@ -4634,6 +4634,8 @@ smb3_init_transform_rq(struct TCP_Server_Info
> *server, int num_rqst,
> >
> >       return rc;
> >
> > +e_nomem:
> > +     rc =3D -ENOMEM;
> >  err_free:
> >       smb3_free_compound_rqst(num_rqst - 1, &new_rq[1]);
> >       return rc;
>
> I don't think this change improves readability.
>
> I understand that making the assignment explicit is good, but why not
> simply set rc to -ENOMEM if !buffer and then goto err_free?
>
> Also, I think its a bit confusing having inconsistent naming styles `e_`
> `err_`...
>
> --
> Henrique
> SUSE Labs
>
>
