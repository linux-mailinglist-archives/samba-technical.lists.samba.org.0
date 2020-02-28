Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 610DC173FE7
	for <lists+samba-technical@lfdr.de>; Fri, 28 Feb 2020 19:45:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=bmSSdDRVCwqbK4Qt0Ee3kcypbrveuzK6kf30t7tAC6g=; b=ZPGhEHhDqw0qFfkaMDIWf+RqOU
	YvtXcfExoWe5PuPqc/PaVpBqAy5D7py9UnS5Zw+8vrTjNs+RzP42Bbw9/6sTy7RZkNjXkbq+1UIBk
	Rr02ajyTNF+Kn0azBG19Ob/LZL/iQsDrTpT1nmXRnB8zdAkwpK41CUxtkrshDBfZevyPSSVaIaznU
	MvG7IOIIxjLaa7GUyg6Q/Tyr8yIoU5D/dstOXr5ePaVHtdw/eX/SQTRCWJ3pbcgnHBEd3aacbvmHp
	llide9MLodC73SECgDhGEeK/fvhHoQM5fYV4khr4zJhbAaKTgQ4X8LJN6K8fUl6mtLKVSZ01RuqBD
	LDz3E0cw==;
Received: from localhost ([::1]:19062 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j7kdZ-00COVz-Vz; Fri, 28 Feb 2020 18:45:26 +0000
Received: from mail-yw1-xc2f.google.com ([2607:f8b0:4864:20::c2f]:42969) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j7kdT-00COVs-Uc
 for samba-technical@lists.samba.org; Fri, 28 Feb 2020 18:45:22 +0000
Received: by mail-yw1-xc2f.google.com with SMTP id n127so4248659ywd.9
 for <samba-technical@lists.samba.org>; Fri, 28 Feb 2020 10:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+vT6b199TkuXlwgrFRReeOUJTXSIWJ1eAfz6tBN33BU=;
 b=D7P6ummZtEgDRS/kmez111dDPj9sCrhk2NzplxacaZPItf+erqn2+1g8c3p3hLMUST
 oPY0HEyaaJfUD60zQ8MdJqAJiaOlIqSjj7OYZr0I09ZhH1tuhmycGhnKN4eymfCrfnYF
 HfF+NquRoMwAsi9dIJoWUDlMF9v0lohDL3q5CbBcCrKrr1Y9Jzq/zj5OgcYRxXjJezHU
 NIiIjE13i4TimCzoN2AJbPgU/CwNfrgSga8yICIZYTVPXXhZY+pCPVaseISyn0nxs6Tu
 Wf7RG0kfQ+gEp/BBAKmM6ehAa5Mngl/FAvUmVSsi+r0BAN5hrR2R2IGG82R/cRJg5nYR
 i3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+vT6b199TkuXlwgrFRReeOUJTXSIWJ1eAfz6tBN33BU=;
 b=sxYPkmXws9E6XXFcGnpzO/eT8Jgg2mTApcNfMmAbS7T2i5n3fbg6XcWj7m3Edhce2a
 OLThLXlw6lKyTIjEXojr7DqcizxMotZz/fdMJJuG+7F+BrIqEQ0Xpw8RbTRSNxQ0snay
 BH7uUNy1AO/sutG17SBE9Y2haN7Wiqy54b7Q5nmB3H6I26Re3rmD8DEwE1cPth3+E07X
 F0/vESlKs4dPPULRea6z7DlJ4/obFLDgJEFi/8gqnXxzwHXV8yJ8AQTNXEOmpVcN3oU3
 yPZCjwg2/j3l07BxZ3ISggYrwv230gVQef+bW8u6R0rag2ZJomlwNJljANMwvPvhczkS
 8KAQ==
X-Gm-Message-State: APjAAAXdv4KTLTKCKrlPJBlGNqk6fft/b8cX8nUUTiP7Pkoy02RdUYE7
 KMH13MzJKbRJj+LKHCkoi4wrgXEj7Tz/mjarkVQ=
X-Google-Smtp-Source: APXvYqyPaDK1m1wZgfOJ1rhbt1AMs2fk2jJ5Cl6F7RtNJQOIQ8XZ1mR2wdCUyj6gXfFZezGMLMYy3yTAuUieRy0gRV8=
X-Received: by 2002:a5b:2cc:: with SMTP id h12mr4874302ybp.85.1582915516686;
 Fri, 28 Feb 2020 10:45:16 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mvW_cpUhg-JA7pFd=rcYSSvT43rT2z9RGbkUpdR1fiLsg@mail.gmail.com>
 <871rqfaqk8.fsf@suse.com>
In-Reply-To: <871rqfaqk8.fsf@suse.com>
Date: Fri, 28 Feb 2020 12:45:05 -0600
Message-ID: <CAH2r5msk3sQr32a0L9vyQNHA_Z9-WGGzPKuTVsAa-=CNG57=QA@mail.gmail.com>
Subject: Re: [SMB311][PATCHES] parse posix create context in order to handle
 getattr
To: =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I wanted to make sure this first patch which was closer to ready didn't
regress anything so I temporarily put it in to run buildbot testing (which
passed)

http://smb3-test-rhel-75.southcentralus.cloudapp.azure.com/#/builders/2/bui=
lds/318


On Fri, Feb 28, 2020, 05:39 Aur=C3=A9lien Aptel <aaptel@suse.com> wrote:

> Steve French <smfrench@gmail.com> writes:
> > First 1/2 of changes needed to support SMB3.1.1 POSIX Extensions
> > support for getattr (stat) - the main remaining item left for the
> > Linux kernel client support of the SMB3.1.1 POSIX Extensions.
> >
> > The patch from Aurelien allows SMB2_open() callers to pass down a
> > POSIX data buffer that will trigger requesting POSIX create context
> > and parsing the response into the provided buffer, and the second
> > patch fixes some minor problems with the first patch.
>
> I know we want progress on this but this patch is part of a WIP series I
> shared with Steve not meant to be sent here yet (cf all XXX which I use
> in dev/debug). Thanks for spotting the errors and typos but please don't
> merge this yet. I will send an updated version if you really want to
> have it.
>
> Cheers,
> --
> Aur=C3=A9lien Aptel / SUSE Labs Samba Team
> GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
> SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg,=
 DE
> GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=
=BCnchen)
>
