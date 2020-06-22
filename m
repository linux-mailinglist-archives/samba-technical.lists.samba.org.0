Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F3420353D
	for <lists+samba-technical@lfdr.de>; Mon, 22 Jun 2020 13:01:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=xVOHQHuULNIu4dCMP78Qdk5lIuvS7YGj9sk3ZA3oxuI=; b=jPx+8PyGUNz5tuphcfvjnmqwpZ
	wySDu1Nw/583PW4XVSNdMp0wMDKl/aNnb1dGJCpTkmkgDDxhavjwKaZ7oGI4VcqOD5iSV0ie0Zz5M
	ikYjG0BAnHVzHBZHNBG3JtAcWcln/4dYJXfHbzH50tFzcdk9VxraWiP159506DZTFrislLGO4oMOA
	f7W6EVihR6ZNkDeMJ7p7AEuOsJqxxEZvNc7NSW7oRRfXaK6nJ8GAAHgcKtYOobJLo5Ca9yeGpvrAB
	NbQq+GKJHd1UBf5XxXP4iKjleHpkhlvXAAvRMFwdGdJFCy1fWPaxbCV1uPLexareXk6+FR2RaozFG
	laXgOnCg==;
Received: from localhost ([::1]:32458 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jnKC2-001m87-Kg; Mon, 22 Jun 2020 11:00:50 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:41245) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jnKBv-001m7z-Tg
 for samba-technical@lists.samba.org; Mon, 22 Jun 2020 11:00:46 +0000
Received: by mail-ed1-x52c.google.com with SMTP id e22so2595762edq.8
 for <samba-technical@lists.samba.org>; Mon, 22 Jun 2020 04:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sBJysELEYkHpEOORRCTPDGqVLre04IJYBWv35OwnYNA=;
 b=uVuSj/NlUArbs1Wkn1HRSGepRjwD7kXr93zSo7v4A6VqsPfdB/3HD5RkuaeRrGPgYW
 ebjQhl7bnXUoCo6WWYh9UBLoBtFoRef73Bf9aDSKfC7dfbz3UOhLYkCgF65pt58EIhSS
 xeBAaiwvY+AA0v085XkA9zjTiX74UJQ8EaT3DbpMRotVzmtP0gbecZzrPGQV+mqjhkXV
 fBmihOpbM5zPhcA1stJLnvL3iMCzZb4JNLGlZv1sSJxB1rBKXdjA8e60htq/aFQtisjP
 inP2Ao3/YJRG0fIvHkZ3GvwOe+ZRchjSjvG1NtrAc8BGuYK/Nj9karyKBKh+HIQ7qL1x
 0kNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sBJysELEYkHpEOORRCTPDGqVLre04IJYBWv35OwnYNA=;
 b=sC4kDuXfz4QnUlRq7GA2rd9BPLGjIU/N0Yl62KPZ7/mouuIRG+FWKCxKYdi5U8pmq6
 uW5UHqIhgJKNuoMlAmPayrrN/PJcODOf6f2BIYsHLCL+dhUA6PjL4gUBom/gV5avy4AB
 zoubNGLU9WOsOu93O0s9+eJQLsSzRz0gFQ09fD/sBO/MYyrM2irgY102qs1NMkZbSr5R
 IfbP0wcdkrdj7X6zX37KoZecvS2KX+0US9tG5luwHhDkBQ57WpjLr1FnQ3bGt/qSh9nM
 wdXYUlYy87oREWOTNuXDMRgMD43Id49iehcP3P4aVmjaKnrWTy8GAnx/kbMYXa0k01CN
 +fFg==
X-Gm-Message-State: AOAM532zqLU49e6r0l/zGu7jCg3iNtWTiEe7/sHPbCb0bMTe8BjoNdeQ
 I3MDRm7FkjFitDlQc8pmRBgl8nUZByjCfxVzmrwp5hcc
X-Google-Smtp-Source: ABdhPJx5v2hhhC0OCJwfqyPs9aVvu8cLQ1XB1E1XSpjOBFNSD5jR3P3br1t/2xxglrWCTb3Ys1LOoglj2L/aH7MtUfc=
X-Received: by 2002:aa7:dd8e:: with SMTP id g14mr6012253edv.208.1592823643222; 
 Mon, 22 Jun 2020 04:00:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAH72RCU=2HPWJHjgtMFx7wM061n-Jjo7aYRinxLPDtq8fo-OrA@mail.gmail.com>
 <20200622100601.GK3036357@onega.vda.li>
In-Reply-To: <20200622100601.GK3036357@onega.vda.li>
Date: Mon, 22 Jun 2020 13:55:25 +0300
Message-ID: <CAH72RCVF2NCzTgZim1V7D8MfmZed00+ujKydLw4eyxrLEsrC4w@mail.gmail.com>
Subject: Re: GSoC: Week 3 Progress Update
To: Alexander Bokovoy <ab@samba.org>
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
From: hezekiah maina via samba-technical <samba-technical@lists.samba.org>
Reply-To: hezekiah maina <hezekiahmaina3@gmail.com>
Cc: samba-technical@lists.samba.org, "abartlet@samba.org" <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thank you, Alexander.

In the first image, Sites Management and Time aren't present, was there an
issue with them?

On Mon, Jun 22, 2020 at 1:06 PM Alexander Bokovoy <ab@samba.org> wrote:

> On su, 21 kes=C3=A4 2020, hezekiah maina wrote:
> > During the week I worked on the following:
> >
> >    -  User Management
> >    - Organization Units Management
> >    - Added the patches Alexander recommended
> >    - Changed the UI of components written in Week 1 & 2
> >
> > Next week I will be on working on the following:
> >
> >    - DNS Management
> >    - Forest Management
> >    - Group Management
> >
> > Last Week's changes are in the develop branch of this repo:
> > https://gitlab.com/HezekiahM/samba-ad-dc
>
> Thank you, Hezekiah!
>
> I made a short gallery of screenshots here:
> https://www.samba.org/~ab/samba-ad-dc-cockpit/
>
> The code now builds and works mostly fine on Fedora 32 without any
> additional changes. I had to disable SELinux on the system but this can
> be looked at later.
>
> --
> / Alexander Bokovoy
>
