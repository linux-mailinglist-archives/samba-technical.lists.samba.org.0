Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDBC655285
	for <lists+samba-technical@lfdr.de>; Fri, 23 Dec 2022 17:04:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=CYcsKMSa2ITgYuOt3LCefQX/to3Pk4pvA21Gy4LiEew=; b=tLZjk6G8WnpAutTeQLucL/WVRe
	YJUerQ/695ZpidJtIwnSHTkKI9k/NfeVaqbjrubXdVHSZ/GP5qfZq+YqsuEyWer6rmk31PqvGtgyM
	sEj5QVgdF2cEk7CHgQBKoLqKJB5odBOUe1i3OB5xqoS8NcIvxNdF8/kmwVtG6Thpjgn3j2KFvfYEc
	s129d66ziW8SpqAR/FVYnijoI+te+nUpxkiGx711UBES3kRcEkCInPf3tDSte0CNlEEOvg+jVtsMT
	LG4Ma5l+RrVA16Uo+8j7IN4WFueAYt5rzjoFRjqmftLwoG4/Xbt2vQLyED5BYtW+m43+tm/+crVbZ
	6WFWq9JA==;
Received: from ip6-localhost ([::1]:20108 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1p8kWW-00B4FC-1m; Fri, 23 Dec 2022 16:03:52 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:41706) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1p8kWN-00B4DF-CW
 for samba-technical@lists.samba.org; Fri, 23 Dec 2022 16:03:48 +0000
Received: by mail-pl1-x630.google.com with SMTP id l10so5315635plb.8
 for <samba-technical@lists.samba.org>; Fri, 23 Dec 2022 08:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Dcm9R9lOvB78qFqlMFnubC1nMU4SWhRkwNHzadCu7/Q=;
 b=QEDo9VbMDDvgxcTKHsymM/FR08xFxp1mN0N7ZvapI+zJmtL7KN897RupOIKfGe8NIP
 b33UsXxiEm222pvP3IBtdHXHauXp4x5UkIkbgM3uQTsND5acn7Aoww4hnT8D2BaWJ/xa
 I7d/9Td/6kKpyX23RtiBsEtGIUQxzgwTjxwPqrv0+rLKAoklqJHJfyCg5mV846U7zicn
 uqbqWkNeOe6wgUuSxWzyKIyYVtSU0/WtH25RDDjdk5aJ1T976yx0W4a5jGcURZRpUlyl
 yHu3VvZstiwG3roil5HdfmQWeQeCxU3eAhVZEyQQj/+BgtWiDX3LSr8X+n3FN0KKtv79
 /deQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dcm9R9lOvB78qFqlMFnubC1nMU4SWhRkwNHzadCu7/Q=;
 b=3lLkpGSrEFO3gmbrxHEYkanM7m5RpEkWFPNqAwS6jY/tSmm7lrvXFSFJLDkL0twP1y
 VFgbU1uM27Zdq6VZSNS5Ul9XyTZIrocEGttfJX1fZs2yaLQFLdW1etylnh947rL3x873
 rlwQfaQ5+82YYZzzIg4kbiFS1H8etQM7GKmHqMGO22oA7T8hh+8yViTaXkvbzGHhgCF5
 pHmUP7gPNRfDdUfJXGhSafOW/N0INkw+AcDzjFo8Hg3EQeSlY/nUEIvFTFuiEXqhd/yF
 APcj5fdVetHXNdNyqOvAsCUrZaY9sFTniC8+E9gWV4ocWsR6oRBdlOIgVjd+inpUQd+O
 v9JA==
X-Gm-Message-State: AFqh2kqGl6YM1HqatwzN8zDp2UeMNp8rgVaF6+EpUKQxrxnUjGdkSk8+
 qPeRdnZJtutyb4R06C5Iha5+tPF7RSyD8PsmjpLziQ==
X-Google-Smtp-Source: AMrXdXvWAiQVJAkhi9LmdDikbvj0nLpfkmAMDKbCnPdinYObxWhVGu0s7Ji64MGRXynvDib1RDIfvWWRqR1YxDP6XeI=
X-Received: by 2002:a17:902:c94d:b0:191:24d1:3b31 with SMTP id
 i13-20020a170902c94d00b0019124d13b31mr391096pla.94.1671811418831; Fri, 23 Dec
 2022 08:03:38 -0800 (PST)
MIME-Version: 1.0
References: <D3FFCE09-CD20-485D-9925-6EB995A8B6E5@karpukhin.com>
 <4452622.LvFx2qVVIh@magrathea>
 <CAB5c7xpsB2E_QrrpLFKsf3wmL91FWrJGeewwkM=VFjVYFanAeA@mail.gmail.com>
 <2130605.irdbgypaU6@magrathea>
In-Reply-To: <2130605.irdbgypaU6@magrathea>
Date: Fri, 23 Dec 2022 11:03:27 -0500
Message-ID: <CAB5c7xoXeqqifBEwEMCDBpT6RdYMC+qn6uN4s9Zw70b1=yQd_g@mail.gmail.com>
Subject: Re: "access based share enum" is broken since 4.16.0
To: Andreas Schneider <asn@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Dec 23, 2022 at 10:34 AM Andreas Schneider <asn@samba.org> wrote:

> On Friday, 23 December 2022 16:20:06 CET Andrew Walker via samba-technical
> wrote:
> > On Fri, Dec 23, 2022 at 10:12 AM Andreas Schneider <asn@samba.org>
> wrote:
> > > On Monday, 19 December 2022 05:38:33 CET Andrew Walker via
> samba-technical
> > >
> > > wrote:
> > > > On Sun, Dec 18, 2022 at 10:40 PM Vyacheslav Karpukhin via
> > >
> > > samba-technical <
> > >
> > > > samba-technical@lists.samba.org> wrote:
> > > > > Hi,
> > > > >
> > > > > It looks like the access-based share listing is broken in the
> recent
> > > > > versions: "smbclient -L" shows no shares if this option is used.
> > >
> > > Bisecting
> > >
> > > > > points at a7c65958a15149918415b7456d6f20ee8c9669d2. I rolled back
> to
> > >
> > > 4.15
> > >
> > > > > for now.
> > > > >
> > > > > Regards,
> > > > > Vyacheslav
> > > >
> > > > FWIW, I have MR with fix here:
> > >
> https://gitlab.com/samba-team/devel/samba/-/commits/anodos325-fix-access-b
> > > as>
> > > > ed-share-enum
> > >
> > > Hi Andrew,
> > >
> > > I'm sorry, but I don't see a MR with this fix. Also we need a bug for
> it
> > > and
> > > backport it to 4.17 and 4.16.
> > >
> > >
> > > Best regards
> > >
> > >         Andreas
> > >
> > > --
> > > Andreas Schneider                      asn@samba.org
> > > Samba Team                             www.samba.org
> > > GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
> >
> > Fix has already been merged:
> > https://bugzilla.samba.org/show_bug.cgi?id=15265
>
> Oh great, thanks for the pointer!
> --
> Andreas Schneider                      asn@samba.org
> Samba Team                             www.samba.org
> GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
>
>
>
There's an additional share enumeration bugfix here:
https://bugzilla.samba.org/show_bug.cgi?id=15266

Basically, registry shares aren't making it into the list. Regression in
4.17.4 IIRC.
I'm running through CI again.
