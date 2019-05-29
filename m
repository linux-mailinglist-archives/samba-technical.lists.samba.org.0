Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EB72E7CA
	for <lists+samba-technical@lfdr.de>; Thu, 30 May 2019 00:08:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=cy9YNUmWdyzO8FB117IF8p8GlpwNOkSBhFgHT7LVl2U=; b=t22LpAVpL0fF0J1nbI+zunTsJe
	R6uDWnS1cgedF3hBxRDTkjgKxsMAbExkQ4k3VJI3vl0/hDIGwmcnOlb8369TuH3DdfoGgspKTamDV
	TKtzHNkh0Jjhd+6FZUbxDlweIw+f00QWE/rjKkHB4dUXGdMek+jRgYwrJFIViprAb+CTKKJAb26kz
	km67P4JHLn99nDAGiLK28pUWpoMBNVSxpTCq/eDcY3VjC96UiqDsupngHHQ/NmcjTWqp/M4rkxCvQ
	Mh+q0NcyvNR89vAYC0rxrWaORzqb9vUWGywdSGURXCWazw15Tho35An0Z7hSHXpEMEu1e0HOosaFN
	oM4e1iCg==;
Received: from localhost ([::1]:39528 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hW6jU-002WEB-Ia; Wed, 29 May 2019 22:07:40 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:44199) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hW6jP-002WE4-Rx
 for samba-technical@lists.samba.org; Wed, 29 May 2019 22:07:38 +0000
Received: by mail-lf1-x143.google.com with SMTP id r15so3335507lfm.11
 for <samba-technical@lists.samba.org>; Wed, 29 May 2019 15:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cy9YNUmWdyzO8FB117IF8p8GlpwNOkSBhFgHT7LVl2U=;
 b=V9pIQf3Jm/G3QRax/HHnCxouQsnHXnXCI8x2vpX3sZklNUyssD4KHW2SPW5bZzE40v
 dIerzz/a4KHHym0979JtOd8mzEAZQHMe9HM3pnyp7L+4FcTD9BHRaH5w5R05XwZH22Zb
 FpLjA9664/CGKPr3OttM6+wFCnCEuI8fyh2Ps/l6qEOdIx12QOos5WCNTLzkArLGvtPO
 PjXq+TZKqrOK8Uu4Wd53oIpgunh9G+1Yf7RBF9+ZbJ0x2uC6qx6S9gQjLLFPvoRkbZ2y
 drYZB13/UACghN8Lhg0IXxwz1yO9gQJZlbf3Zk3hJjPkDnv2oUsD0jrtdUkf3oG1A93I
 kdyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cy9YNUmWdyzO8FB117IF8p8GlpwNOkSBhFgHT7LVl2U=;
 b=d4aYUp4UpXbpZGpFPjhYyrLCHDm3ZWLWrKfmiBuchMDPQu+YQaxlrXy1QejhYVFOSy
 FnzOgrcH83H0RsgCKnaXgdhNC8LqNTLDe8vMBOU+MihdVSgE/a2vdOJr/eLwYMQSjuSp
 gh8QZavl64WxWyDO58SJk0AXfxfGDPFbYReEmFJSrUDCVBxDuqAzL6GzsBWKuZgrphCu
 VKqO0lD1vDWPpIpqoC7JfYwMeAA5uPADSIhtp2fficiRdOiNqif05TEwESi88zsCZ34o
 6W6IU8Tygu9HKq39hRuhiRP6pFYPNEd9Wf6PQCLYQxL276lYTZwY/1Fxsnh5zmPfh+qA
 T0OA==
X-Gm-Message-State: APjAAAVdpcu9LhpJGULO0AiZ21mctCf6JStELNINE0PatBCD5shYhwI1
 f0IOyHL9WGFjnfS0ua1rfMQGml2UCbMlBkda1mE=
X-Google-Smtp-Source: APXvYqylOB9xoFIHn19lIrezCXVHw8GOUFd5welXlA1+y4vku7NKqQ91/mN0baAW4UNZISP+aRKlTuBatDwc6DwghIc=
X-Received: by 2002:ac2:5e82:: with SMTP id b2mr126649lfq.3.1559167654694;
 Wed, 29 May 2019 15:07:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAC-fF8RUTx4Zvj3m_bc_tG7gMzbTy7iHyMLVnFur=6b83+pTtw@mail.gmail.com>
 <CAC-fF8SAdgU992P8tsKyGSLfi0iwcjH7vdWrw8ObqqrcZsdycA@mail.gmail.com>
 <2736033.mZseHfHTOk@krikkit>
In-Reply-To: <2736033.mZseHfHTOk@krikkit>
Date: Thu, 30 May 2019 00:07:15 +0200
Message-ID: <CAC-fF8Qt3TH-1h0dGjGVWnROOoXMAoeL0GF6Z1dSizd0FWnkbQ@mail.gmail.com>
Subject: Re: [PATCH] pac-glue: fix delegation info blob
To: Andreas Schneider <asn@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Cc: Stefan Metzmacher <metze@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, May 29, 2019 at 10:04 PM Andreas Schneider <asn@samba.org> wrote:
>
> On Wednesday, 29 May 2019 18:47:56 CEST Isaac Boukris via samba-technical
> wrote:
> > On Wed, May 29, 2019 at 6:03 PM Isaac Boukris <iboukris@gmail.com> wrote:
> > > Hi,
> > >
> > > Attached patch fixes the delegation-info blob to be the same as
> > > Windows KDC returns, by adding the realm to the correct principal.
> >
> > Metze points out that this bug is already logged as:
> > https://bugzilla.samba.org/show_bug.cgi?id=13133
> >
> > And thank you for all the other hints!
>
> Could you add the bug to the patch comment?
>
> BUG: https://bugzilla.samba.org/show_bug.cgi?id=13133

I didn't mention, but the bug has already attached the same patch
essentially (without my terminology changes, but in second thought
those probably belong in a separate commit).

Cheers,
Isaac

