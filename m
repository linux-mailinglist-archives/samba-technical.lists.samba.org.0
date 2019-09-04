Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EA0A8169
	for <lists+samba-technical@lfdr.de>; Wed,  4 Sep 2019 13:50:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=jRmqStGDkGYovgKrKTUEOS+hjhPDkrom7sA4A1sYh0A=; b=x/L9EXG+VYoCCqOtusSk6gBI+g
	/1yo3DdoGbf/M+aXkFkgU1XEjUP3T4UP/PC8F/p1d/9vDmZKtyhgK5aAoeYESgG00svs/Vr0OCyLy
	VHmxcsXpWDXjLE05ttL+1H7VbmL7ALyDDp6njEtxahyudBws0j1hIzl9I66GvIpdvUXR5fcIerMDQ
	BhoMCgkay1skKhYs2DOAxYo5z712lpM0Fu+fcyW2eMDVqLNgGatv38E+KASrrbYf8iq5tj2J7QR1b
	FL2BvtGmnGptjHq5sas/gG12OUdfsYB/xZ71L7OvegFFpn+v633r3X2dWiIjE6mckc0RU3l3rxH+B
	cGIsKphQ==;
Received: from localhost ([::1]:56568 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i5Tnv-003NbK-Gu; Wed, 04 Sep 2019 11:50:27 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34]:42753) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5Tnq-003NbD-Iy
 for samba-technical@lists.samba.org; Wed, 04 Sep 2019 11:50:25 +0000
Received: by mail-vk1-xa34.google.com with SMTP id t136so4291523vkt.9
 for <samba-technical@lists.samba.org>; Wed, 04 Sep 2019 04:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jRmqStGDkGYovgKrKTUEOS+hjhPDkrom7sA4A1sYh0A=;
 b=ufqGs/WCs5lpfmVkRti80FFsimzGyL7FZRhyBUK8CkzyaQQu07975KRe3msxQuPPlC
 bFMTwk1S75Q6skJcvlrhNBS1xzr0IhGNayzD3F0BCH7cisskhDZ4sBGOAP0HCVVsYCpV
 jhLw7wj+LSQVCYw/ybdwnixzEfuKOh3v1HDHBl2zuRH8BfxMedwbXbuBJ5Xxg9t5CGzk
 9zCYsXUvJQ9XzJZh6SvBk3TpzVpgrO0Ik0QPlIj7ePIpRz/JMt0kE2q0CzSZmiVZvpxc
 3qqf88eauEumbOUJ9GK3K4wP2X+A7sUGWNbctEaXwSOAdawhtZvDxN+js5qBW7StaU9s
 5K0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jRmqStGDkGYovgKrKTUEOS+hjhPDkrom7sA4A1sYh0A=;
 b=NqSLbY7fmvGbychcsbl8Mtk/egmqr9XuOzCx4vI9gYZlR8TGIyjD7jtqEtbd5nHL/N
 4bkCcRwVpkHHrHpJ2Zr5e61/bDsB4kwm5Hu4IjwwTPa0NUgq61c7hPRgiDSebKtadWcK
 I//HxmwJZ0BA823Yb+lXj85PauUpIOCXV25xdKhh0XBZmNvVRZhCpChffh75one26anJ
 +del2B18k5sV05wHM2EEaatICgglaI8m7V/3XHnnSMALZIM3PjfGQ5eyDvonpUFaWqyo
 rWLHwY/WD/x+r5zbQcDxEgEh2ERVc6CaMh1bQ/efWHHx75XXQGuLuOznZkrOK2Kmn1QC
 HGkg==
X-Gm-Message-State: APjAAAWLQJ/CoS9AxtqG4YD21sIwO+wpz8fArrjYgYTWrnmNXGVVSViz
 NzuZRlwQuG2kro6q89lT9gmRsKZUzAkeUQ9Pl3A=
X-Google-Smtp-Source: APXvYqwsLIaA7QzWNk0GtMCWwjfa+eG9zHUZgpeOCF3BGbPzHg62ly3Ikned0hq4w28SP+MYHJcnl8ypdQcFO7ehJIk=
X-Received: by 2002:a1f:1e14:: with SMTP id e20mr927053vke.91.1567597820736;
 Wed, 04 Sep 2019 04:50:20 -0700 (PDT)
MIME-Version: 1.0
References: <ad9719c06273cac4686726b293ce9e78fecd8ca4.camel@samba.org>
In-Reply-To: <ad9719c06273cac4686726b293ce9e78fecd8ca4.camel@samba.org>
Date: Wed, 4 Sep 2019 07:50:09 -0400
Message-ID: <CAOCN9rw95H1SAZr+CSGQyuOVBgJAUysGuHazxwWQUN4=kDFfnA@mail.gmail.com>
Subject: Re: PROPOSAL: deprecate plaintext password support (in SMB1) for 4.11?
To: Andrew Bartlett <abartlet@samba.org>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Sep 4, 2019 at 4:24 AM Andrew Bartlett via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> It is quite late for Samba 4.11 but I wondered what folks would think
> of marking 'encrypt passwords' as deprecated so we can consider to
> remove this code in Samba 4.12 (eg master) later this year?
>
> This would dovetail with the SMB1 deprecation effort and I hope also
> help find users who can't live without this (because SMB2 doesn't have
> this at all).

It's a good idea as a behavior. But you're right that it is *really*
late in the release process. By "depreceate", do you mean deprecate in
the documentation? Or to change any software behavior?

> I'm unclear if this even works, given bugs like:
> https://bugzilla.samba.org/show_bug.cgi?id=9705
>
> If this is supported I'll polish up the attached patch and then write a
> WHATSNEW for 4.11.
>
> It doesn't commit us to doing anything in master / 4.12 (and we might
> want to wait till closer to the end of the year for feedback), but I
> took a stab at seeing what it might allow us to remove and this was the
> diffstat (and there is probably more if we tried):
>
>  /docs-xml/smbdotconf/security/encryptpasswords.xml  |   43 -
>  b/docs-xml/smbdotconf/security/encryptpasswords.xml |    4
>  b/lib/replace/wscript                               |    1
>  b/source3/auth/auth.c                               |    9
>  b/source3/auth/pampass.c                            |  132 ---
>  b/source3/auth/proto.h                              |   14
>  b/source3/auth/wscript_build                        |    8
>  b/source3/param/loadparm.c                          |    1
>  b/source3/smbd/globals.h                            |    1
>  b/source3/smbd/negprot.c                            |   62 -
>  b/source3/smbd/reply.c                              |    6
>  b/source3/smbd/sesssetup.c                          |  104 --
>  b/source3/utils/testparm.c                          |   26
>  b/source3/wscript                                   |    1
>  b/source3/wscript_build                             |    1
>  b/source4/auth/ntlm/wscript_build                   |    8
>  b/source4/smb_server/smb/negprot.c                  |   63 -
>  b/source4/smb_server/smb_server.h                   |    3
>  lib/replace/crypt.c                                 |  770 --------------------
>  source3/auth/auth_unix.c                            |  104 --
>  source3/auth/pass_check.c                           |  294 -------
>  source4/auth/ntlm/auth_unix.c                       |  769 -------------------
>  22 files changed, 70 insertions(+), 2354 deletions(-)
>
> What do folks think?
>
> Andrew Bartlett

Obviously, Iyou are far more active in the source code than us mere
mortals. But as an occasional software developer, more than 2000 lines
of deletion in 22 C files, that hasn't been through *any* of the
releases QA? That's begging for trouble with an unexpected dependency,
and it's not a critical feature. I'd push actual deletion back to
4.12, and be cautious about even inserting a deprecation warning at
this late date.

> --
> Andrew Bartlett                       http://samba.org/~abartlet/
> Authentication Developer, Samba Team  http://samba.org
> Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba
>
>
>

