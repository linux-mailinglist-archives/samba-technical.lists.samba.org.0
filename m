Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB367D970
	for <lists+samba-technical@lfdr.de>; Thu,  1 Aug 2019 12:34:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=CigtntcGEx92IUDe+NP96Iw5O7r0J54o1TDvBznL9Ms=; b=CFAwxlh3M5UlSRmibny4FIWiZ0
	wfJrRQd6DUHca1z6re1Bk5RGsi3/8PvYk8u6I/R0hmYVLoYWN0JfIEQo3Ik8+dAjDcLT/u/TqJQkD
	na8xn8EjMC/+6+6hJyznAdjmfRzd0oOS3xuCIZR31ls4ZXmVWuOCXrogpEgaB1EbfMl0FPwW7+so0
	1ku9PieU+M4943W1rmUMkrWPPpNC/wYD0BTDIf5eAFkpKrFbCZHJUKZxTHNHIuIWZ4IjD3h8Q+4jw
	LtJqwK6OQ/ewV0dI7FYZ5oVG+mVuRES/WrUIGZdhVKExnCQwKmFOQVugnWXaetzAv21/wQyesv79F
	d0SsIMWQ==;
Received: from localhost ([::1]:58740 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ht8Pt-003N2x-2w; Thu, 01 Aug 2019 10:34:37 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c]:40373) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ht8Po-003N2p-J8
 for samba-technical@lists.samba.org; Thu, 01 Aug 2019 10:34:35 +0000
Received: by mail-ua1-x92c.google.com with SMTP id s4so28189357uad.7
 for <samba-technical@lists.samba.org>; Thu, 01 Aug 2019 03:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CigtntcGEx92IUDe+NP96Iw5O7r0J54o1TDvBznL9Ms=;
 b=ngs3WYRorV6gz558/4w0oGV1qDUdzg5IA9j5pQ/bcYsmIerLoNYItDcOvPQzmIITRk
 GD01TgAdHsTzVl+Vsvc+LK83ytR2qVaXj3jlCBMLXtEu7kg6IjYZ/53zRrH0Cp+3JpsT
 xomcuH5SMVV73Tdw5qmaeAqJWHvgjpJptJCL+B9c2+a1UIrD/QIVDv8s9m0NMTqoB07v
 i5if3DUCXVtmUuOEUH7+pDASgbgqJEP/gOm6wP8YIY4yrRN4hyJ0ZLuv0N3etkOeQAdE
 /PSCNZ/Npx3+nfcIG2XVMYNEgJKhtjkzmFPcLWMoOC7IfnqsWNFgnQ4Pri/y66zUtUL7
 zxLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CigtntcGEx92IUDe+NP96Iw5O7r0J54o1TDvBznL9Ms=;
 b=j4EdFDFexPjC76C6Eyyh5a1tnYx5firnPee2jpt86bfYXzTvlg48xUcHvUKynIdxxn
 i7LbE/zU7qxAneBhHtXNsXQcK8+At2y7/8q4Bdis9cbTbNyUpFWzFlNweADIVCvyi8Rh
 Po/meQHMM66iPIReTwjvzaNrPhcIJDIUEDdPWdO152wC//IeNj0j76iXQ3aevuZDLxjs
 FA8wHgiFbjtt++CpxsmYk0hsBlAmz0fQfsyqgXGDEnbtxwIZJq4uHM/1kyRL/xUReRHt
 84HvDd6S0qMhk6+0fQpnCkX8txTRz2heP0mZuNzUkau6SHg6UeJkDY5tDE0vs43TYA/q
 qx8Q==
X-Gm-Message-State: APjAAAWvBvAokTaDDf0bRU27QY2GK7L034PtjUCJuUKLA2P9rhJt3K0P
 V6o38Pf2pPzZyIv0hxk2WmB/e9xfx9lgatzN91g=
X-Google-Smtp-Source: APXvYqwPQrDMR3D5t1PjwbprfDbM+rTUrwUUX+Bh+0Vxrst6x6bydCKDDCISf+ZUDqPGzvEdwvKc1keWBDCTFX50rqg=
X-Received: by 2002:ab0:5ea6:: with SMTP id y38mr81183040uag.40.1564655670562; 
 Thu, 01 Aug 2019 03:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <1564547155.4261.48.camel@samba.org>
 <11267207.3DhDtICzHl@magrathea.fritz.box>
In-Reply-To: <11267207.3DhDtICzHl@magrathea.fritz.box>
Date: Thu, 1 Aug 2019 06:34:17 -0400
Message-ID: <CAOCN9rwk8fUOs1yCStJhnn_ZnF_U2pXv5_WQnz=tHi44qPAa=g@mail.gmail.com>
Subject: Re: Require GnuTLS 3.4.7 for Samba 4.12 in March 2020?
To: Andreas Schneider <asn@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Nico Kadel-Garcia via samba-technical <samba-technical@lists.samba.org>
Reply-To: Nico Kadel-Garcia <nkadel@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jul 31, 2019 at 1:57 AM Andreas Schneider via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> On Wednesday, July 31, 2019 6:25:55 AM CEST Andrew Bartlett via samba-
> technical wrote:
> > I'm reviewing "Use GnuTLS AES ciphers if supported by the installed
> > GnuTLS version" for Andreas.
> >
> > https://gitlab.com/samba-team/samba/merge_requests/669
> >
> > The one thing I really don't like is the #ifdef on HAVE_GNUTLS_AEAD.  I
> > would prefer we just chose to rely on GnuTLS. [1]
> >
> > Duplicated code is bad, duplicated crypto code is particularly bad and
> > I would really like to remove our existing duplicates rather than add
> > more.
> >
> > Not only are we short on maintainece resources, we would also need to
> > restructure our testuite to force a non-GnuTLS build to ensure we
> > actually test this at all.
> >
> > In doing so I know many folks really like running current Samba (both
> > as an AD DC and fileserver) on older enterprise distributions.
> >
> > In this case, RHEL 8, Ubuntu 16.04 and current debian stable
> > all have GnuTLS versions later than 3.4.7.
>
> Also SLE15 offers newer GnuTLS via an update.
>
> Also note that the older the distro the more likely it is that there is no
> python3 available. RHEL7 will have to stick to 4.10 as it is the last version
> supporting python2.

Python 3.6 is available from EPEL for RHEL 7. It's also available as
an sclo" package, the Software Colleciotns Library offered by RHEL. My
published tools, and several other sets of tools, use the EPEL bnaries
quite successfully for Samba 4.10. EPEL is unfortunately not
officially supported by Red Hat, so it doesn't have the industry grade
"I can call Red Hat in the middle of the night and yell at them when
an update broke my server" support that may be necessary for a high
availability business critical service.

I will give Samba credit that the community has usually been more
responsive to critical problems or debugging than even a good
professional support team..

> That you can build a newer Samba version with python3 support is only possible
> because of EPEL7 repositories. I'm not sure something like that is offered.

I'm not publishing binaries, but am publishing source code to build
RPMs and SRPMs at https://github.com/nkadel/samba4repo with various
git bubmodules. Several other folks publish binaries, like Sergio's
work at https://github.com/sergiomb2/SambaAD .

I'm just waiting on a bundled tdb 4.1 or tdb 4.1rc1  to test Samba
4.11rc1 with my structure. Since ldb, tdb, tevent, and talloc all
require major version updates, and the updates are incompatible with
4.10 as best I can tell, I'm not ready to mix those with the  main
code line.

> Cheers,
>
>
>         Andreas
>
>
> --
> Andreas Schneider                      asn@samba.org
> Samba Team                             www.samba.org
> GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
>
>
>

