Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1817D2D1900
	for <lists+samba-technical@lfdr.de>; Mon,  7 Dec 2020 20:06:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=CnTU61U0VfmH5d7Y0floY0nX86RrCNSa09zdCXYBzXk=; b=BJQ1BlGUX/z8V52oE36CcFs7ff
	4h/p/g+9jPbV0LLQBVZ2twFU7MJDEP+I3wOazJfEtFs2lqLm9Rw5By7IBsp3jUD7dIEuE9bp9UT40
	TIgR/YOLpJPeFA2TTlkZLPvhgYCrYy21qQuYbscETq54Pyc76dBlha+duLEX50M2vA6IaazyuXI0p
	wgh3vI9L7oyqI+9bkYrAmtAecHTUzK3Jnk7FXdKdLRwja4i7/c1QVk22+WFL2nIc4zMut7ligc61Y
	cG35DTWyR1NIRfiijwhPT7qFDTSdP/Ng0GBKOIR/Hdzq/ojyJGBvUH9M+BhtMePQMSNYEyQM34Yq4
	aGI8BjwQ==;
Received: from ip6-localhost ([::1]:51298 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kmLpA-0006mh-If; Mon, 07 Dec 2020 19:05:28 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:40326) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kmLoz-0006ma-AQ
 for samba-technical@lists.samba.org; Mon, 07 Dec 2020 19:05:25 +0000
Received: by mail-ej1-x642.google.com with SMTP id x16so21043098ejj.7
 for <samba-technical@lists.samba.org>; Mon, 07 Dec 2020 11:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CnTU61U0VfmH5d7Y0floY0nX86RrCNSa09zdCXYBzXk=;
 b=PFOwHotdXDiwAsjMXr+a10ZmP59ofuYod/RNnamWO8iVNjFwnVmSrBeG9mivlKWtXo
 MxA353m/lANrFXRl33HgKXA3om9hrLWdFJcMPBVMbJEFoKdxhmPDDFFcEjntDbmqswMy
 MDSx/3CvEjXGej5Zyyfe0wiLu2GIymcWv8D5LEzfYycNIAJO0UoY1tqaUyVsQaxFES3q
 C0c8tjA4yWs6XARBOTViv+EWIO/z5Usk2KE8/ETnT5IQzd7+w+Iov3AA07Lga40igwz8
 G7QHvJjL5DGyOnK2jPCIBcOdbFMNEbeT7/7iHyFdmK/UypiGDPxgW3N3AsKG9+8yB5R8
 dYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CnTU61U0VfmH5d7Y0floY0nX86RrCNSa09zdCXYBzXk=;
 b=YcJSM+l5yajvPplmyZmTlFCCe4f4abh+Ib37WZhi90GQf8qSuAg9wCiupqwiwUtk9W
 hD+aHkFwRGeiJ56+Y2xgyrTte7y8HANMTdI04GUlS0Z96Qgrr3acYpkLG1EvGdpGJR4d
 i8MCyQ4ka7CRev4dlTPvwXMuC8YXrMt02pmYC0vXozkyOIjFqxHehT4u+3pEIOr90s/3
 9MacFpxmoLa3LLn0UsusN8E3vqZuCniMJl7JPKG7dcOGaT51/eecKFx5Y7y9Kbl13MYb
 ylDHM7hfq6sfCwK7K+UbP0ivuL1mUF+ll5VoJ3sg3eERWinkAzgXPrHJZaH99fd6nIZm
 YxIw==
X-Gm-Message-State: AOAM53306b+Q0nAgpdf0Gqg+9O7nSmMswJ6W2DodNEazGGEnDBVIVyqT
 Uva8RpiBTQpt0ZqcyriScfxuxC/H096/I3bW/w==
X-Google-Smtp-Source: ABdhPJyeboDPaJ6kDWKnmuQSQ9Jl9RbHTtINLsCaQptKdeEl1Jt00gyRZ1hcGoL18y9HiNQp4hDD7Twv7QOz1TxqwLw=
X-Received: by 2002:a17:906:604e:: with SMTP id
 p14mr20917499ejj.515.1607367905955; 
 Mon, 07 Dec 2020 11:05:05 -0800 (PST)
MIME-Version: 1.0
References: <20201027204226.26906-1-pboris@amazon.com>
 <CAHhKpQ7v_nPwBx2czk7rVXK3ZrmsZrAkcxDFOgq0ABTOVc7iSA@mail.gmail.com>
 <CANT5p=q2YvkEOEa4bS=-nbPOc9Xwa=4gnc09csCcszMmMjYSPg@mail.gmail.com>
 <CAHhKpQ7PwgDysS3nUAA0ALLdMZqnzG6q6wL1tmn3aqOPwZbyyg@mail.gmail.com>
In-Reply-To: <CAHhKpQ7PwgDysS3nUAA0ALLdMZqnzG6q6wL1tmn3aqOPwZbyyg@mail.gmail.com>
Date: Mon, 7 Dec 2020 11:04:54 -0800
Message-ID: <CAKywueSZ5bfOxXVH6dkpjDjDawo-JdHjoSdQBYqrhrg7Zoi=Bw@mail.gmail.com>
Subject: Re: [PATCH] Add support for getting and setting SACLs
To: Boris Protopopov <boris.v.protopopov@gmail.com>
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
Reply-To: Pavel Shilovsky <piastryyy@gmail.com>
Cc: Shyam Prasad N <nspmangalore@gmail.com>,
 linux-cifs <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
 Boris Protopopov <pboris@amazon.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Boris,

Are you talking about this patch "[PATCH] Extend cifs acl utilities to
handle SACLs"?

Just for the future, I am trying to monitor the samba-dev mailing list
but if you would like to get the fastest response to your patches then
please include me directly or at least the linux-cifs mailing list.

I stage pending patches in the "next" branch on my github tree, so,
will include the one above.

https://github.com/piastry/cifs-utils/commits/next

--
Best regards,
Pavel Shilovsky

=D0=BF=D0=BD, 7 =D0=B4=D0=B5=D0=BA. 2020 =D0=B3. =D0=B2 07:28, Boris Protop=
opov <boris.v.protopopov@gmail.com>:
>
> Hello, Shyam,
>
> sorry for the delayed reply and thanks for looking at this patch. Yes,
> the testing was done using the extended versions of
> getcifsacl/setcifsacl (added setting owner and SACL support), the
> patch for that posted recently via samba-technical (message ID
> <20201120214918.12517-1-pboris@amazon.com>). I have tested
> setting/getting the owner, DACL, and SACL, for all the DACL/SACL flags
> (-a, -D, -M, -S), SACL type SYSTEM_AUDIT. This testing was done
> against 5.10.0-rc1 and 4.14.203 (the latter required porting the
> user-space patch). I believe this testing has fully exercised the code
> changes in question.
>
> I will look at contributing to the fsxtesting-cifs code, but I think
> the setcifsacl/getcifsact patch that enables easy access to the
> descriptor components is a pre-requisite for such contributions.
>
> Thanks!
>
>
> On Wed, Dec 2, 2020 at 5:43 AM Shyam Prasad N <nspmangalore@gmail.com> wr=
ote:
> >
> > Hi Boris,
> >
> > At a high level, the changes look good to me. Will go through the
> > changes in more detail tomorrow morning.
> >
> > On a related note, we may need more test coverage in this area.
> > Can you please share your testing output against your changes?
> > Or even better, if you can contribute some xfstests for this use case:
> > https://wiki.samba.org/index.php/Xfstesting-cifs
> >
> > Regards,
> > Shyam
> >
> > On Wed, Dec 2, 2020 at 12:24 AM Boris Protopopov
> > <boris.v.protopopov@gmail.com> wrote:
> > >
> > > Hello,
> > > I am checking in to see if anyone had a chance to take a look at this
> > > patch. I would appreciate any feedback.
> > > Thanks!
> > >
> > > On Tue, Oct 27, 2020 at 5:01 PM Boris Protopopov via samba-technical
> > > <samba-technical@lists.samba.org> wrote:
> > > >
> > > > Add SYSTEM_SECURITY access flag and use with smb2 when opening
> > > > files for getting/setting SACLs. Add "system.cifs_ntsd_full"
> > > > extended attribute to allow user-space access to the functionality.
> > > > Avoid multiple server calls when setting owner, DACL, and SACL.
> > > >
> > > > Signed-off-by: Boris Protopopov <pboris@amazon.com>
> > > > ---
> > > ...
> >
> >
> >
> > --
> > -Shyam

