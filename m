Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4B92D1BF1
	for <lists+samba-technical@lfdr.de>; Mon,  7 Dec 2020 22:24:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=EJOHc17zvEobDOFxwlnd1L4iMrQot9jcPwqhnGntr9I=; b=B2HdHLpMyFeQg21vQV6FZlU+4N
	pCnQ/0PleI3m3i3wX1/ER9CrPc0Zb1r8r8aUT/zLCKPvfIOADqNjxlg/Xiz9CJHNtOOKTrGqc3RYd
	ZrUeZtWYC81CqncDIPPm17UfzSf+gfzuoKN53+XAkmEIE2Ztq1qZWHCLJJEIPhqaHjFAerjhHywOY
	Jn6ogWpIjuqD6cK4rUw4xojDd+ECPv8gAVfxnqHLsuTJUElDBsLe9zJQZpzeI+AwLOP7jPJ9Vcn1G
	ZsIeQAzIh08i7Clqxs3m709T0HAgDn/6VNf8nsFQ3KX9GBhMp2jizGuj2ykL+xqFPUJN/yS9Y/lBV
	fq8VltPg==;
Received: from ip6-localhost ([::1]:54318 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kmNzJ-0007LW-OH; Mon, 07 Dec 2020 21:24:05 +0000
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:45570) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kmNzD-0007LN-IG
 for samba-technical@lists.samba.org; Mon, 07 Dec 2020 21:24:02 +0000
Received: by mail-yb1-xb43.google.com with SMTP id k78so5303972ybf.12
 for <samba-technical@lists.samba.org>; Mon, 07 Dec 2020 13:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EJOHc17zvEobDOFxwlnd1L4iMrQot9jcPwqhnGntr9I=;
 b=PR89FjhyROMYrzNdU/CC1sy61GlJsq1xPP9zXtszWtlNZ1p9hqWSvP2SAeHJOYSl+r
 nrK2vOZakMjvi20D89GE3y+afmrxePMvpvVuVzav3DjsiGaClZ6l3yvxfuXm7SO3vq7m
 9PYtA7ZXzMj4Kn2AyiQIdC/rHf3Fnot0r9Ao05CEhVJneTKf8OxQsc7AXdyXdlCEfgiJ
 utkc38Yit/vo2z7dOgwMtN8EuNG2hfZPE4G4i3EJXcicSD1P53NayKTisC8ahbsqrxzw
 DhZw5pZLZxEgcqC5CTvR38f/EGBvBTC28qk8a4ro4Ld+r4+WCFDFWQJberhAK2FTaabZ
 e+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EJOHc17zvEobDOFxwlnd1L4iMrQot9jcPwqhnGntr9I=;
 b=drJOxvjpk0VzxrUswOOlNklEJLqtTHEk7Txx5wVlDo9G9DmiOinKzRIQEsZ05dpc2G
 +7jv44SrWv7zAXlRzr2QB/IQVss6Gn71JQWf4yETt4kLksI6n8NFtAWT3oLhz0xlXj4g
 1R7wMuFQAhlByYGUtu+fn9x7f5f+rXdHTY2vkI7/ULidoUdtu8fhdPCF6USSxWRZ8J0B
 EQJNdH2g3TSp0JwGHhvMKj2msEpME95NFdZOhmEaCGG+cEtlWGXEud32l3ctEFBTzy+D
 PlvCRsdyaLvqc7vWNTIgsh78WfzwhM7QoAvGyOt9N/a356YyJEOCZIMEKwha1QIfZdNO
 zaAg==
X-Gm-Message-State: AOAM532bcfK3vHuRGgTy8v+gHWLLquI2iooRdnt96vvH+XYT/aB08/VW
 YDrulKSODpECvhhpLvak4B7SDlhIuyr9R/oEemU=
X-Google-Smtp-Source: ABdhPJx5qZ+rLue5yDZ0J7fW53DlyRNWKSX802X7XAN4N0j77LPTesms57jetylejWawrq8UlQ0Y7Omr67EaQhDYMHk=
X-Received: by 2002:a25:cad2:: with SMTP id
 a201mr25315070ybg.327.1607376232060; 
 Mon, 07 Dec 2020 13:23:52 -0800 (PST)
MIME-Version: 1.0
References: <20201027204226.26906-1-pboris@amazon.com>
 <CAHhKpQ7v_nPwBx2czk7rVXK3ZrmsZrAkcxDFOgq0ABTOVc7iSA@mail.gmail.com>
 <CANT5p=q2YvkEOEa4bS=-nbPOc9Xwa=4gnc09csCcszMmMjYSPg@mail.gmail.com>
 <CAHhKpQ7PwgDysS3nUAA0ALLdMZqnzG6q6wL1tmn3aqOPwZbyyg@mail.gmail.com>
 <CAKywueSZ5bfOxXVH6dkpjDjDawo-JdHjoSdQBYqrhrg7Zoi=Bw@mail.gmail.com>
In-Reply-To: <CAKywueSZ5bfOxXVH6dkpjDjDawo-JdHjoSdQBYqrhrg7Zoi=Bw@mail.gmail.com>
Date: Mon, 7 Dec 2020 16:23:41 -0500
Message-ID: <CAHhKpQ7GJK8HMf31Lri8z4khqJtu=nm79Q_A5yUS_5iDFmVj7w@mail.gmail.com>
Subject: Re: [PATCH] Add support for getting and setting SACLs
To: Pavel Shilovsky <piastryyy@gmail.com>
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
From: Boris Protopopov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Boris Protopopov <boris.v.protopopov@gmail.com>
Cc: Shyam Prasad N <nspmangalore@gmail.com>,
 linux-cifs <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
 Boris Protopopov <pboris@amazon.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

HI, Pavel,

yes, thanks for the pointer, will include in the future.

Boris.

On Mon, Dec 7, 2020 at 2:05 PM Pavel Shilovsky <piastryyy@gmail.com> wrote:
>
> Hi Boris,
>
> Are you talking about this patch "[PATCH] Extend cifs acl utilities to
> handle SACLs"?
>
> Just for the future, I am trying to monitor the samba-dev mailing list
> but if you would like to get the fastest response to your patches then
> please include me directly or at least the linux-cifs mailing list.
>
> I stage pending patches in the "next" branch on my github tree, so,
> will include the one above.
>
> https://github.com/piastry/cifs-utils/commits/next
>
> --
> Best regards,
> Pavel Shilovsky
>
> =D0=BF=D0=BD, 7 =D0=B4=D0=B5=D0=BA. 2020 =D0=B3. =D0=B2 07:28, Boris Prot=
opopov <boris.v.protopopov@gmail.com>:
> >
> > Hello, Shyam,
> >
> > sorry for the delayed reply and thanks for looking at this patch. Yes,
> > the testing was done using the extended versions of
> > getcifsacl/setcifsacl (added setting owner and SACL support), the
> > patch for that posted recently via samba-technical (message ID
> > <20201120214918.12517-1-pboris@amazon.com>). I have tested
> > setting/getting the owner, DACL, and SACL, for all the DACL/SACL flags
> > (-a, -D, -M, -S), SACL type SYSTEM_AUDIT. This testing was done
> > against 5.10.0-rc1 and 4.14.203 (the latter required porting the
> > user-space patch). I believe this testing has fully exercised the code
> > changes in question.
> >
> > I will look at contributing to the fsxtesting-cifs code, but I think
> > the setcifsacl/getcifsact patch that enables easy access to the
> > descriptor components is a pre-requisite for such contributions.
> >
> > Thanks!
> >
> >

