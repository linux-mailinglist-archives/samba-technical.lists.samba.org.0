Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9AD1F8DFA
	for <lists+samba-technical@lfdr.de>; Mon, 15 Jun 2020 08:39:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=LMhObOzTYjXjh3ClNrvtUa9ttRonSK8mD4DENvEfOCo=; b=UeWKYJkN+jNPos0BAYa5UyYaKa
	oGTspdmIJcV6pVsUBqsnSXzDsg8mqJxRSKDoX17BEhMACpXCGhBP6qGRKxxQhRBl7HXae4K9nyT/W
	A6O9Dz9LhNRce0pXyqm42QdHbXOnS8qoGCQcy0VpPSoTkQtRuV0ISuYCZzKnWaoPgp762Nd8LdHJj
	LMOR2dqZuOffUo/0iutaHzLBAFnr6s1M/T+nGjgsmoZEBepyq76ylqyOoYwBKRzf6AVsnoton8w9Z
	VKL9dvdIb3kbbmEQ7xjl9uGfHvNIZH+GSmyxLS9MEiZ6CqEAnXkFrWys23D+1w4n0zYl2IBj3Bm/8
	NxinfY2Q==;
Received: from localhost ([::1]:39734 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jkilG-000Nmm-KO; Mon, 15 Jun 2020 06:38:26 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:45213) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jkikv-000NmO-Lw
 for samba-technical@lists.samba.org; Mon, 15 Jun 2020 06:38:11 +0000
Received: by mail-ej1-x630.google.com with SMTP id o15so16121705ejm.12
 for <samba-technical@lists.samba.org>; Sun, 14 Jun 2020 23:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4cAEQ7f4WVFFYZgzFVWfq5VllcJ+b7ryTRhBsVSHY7E=;
 b=GJNXWCl4y1lf76/Q4+zvoJfZmoXizjpiFzSc0qhInBkGRFa1pZjRUOLFzbHAHX67wC
 KnyiqR3kp3/ad4R1ir00bJ9M0uUH4SkqfiI8cGbwZVnkAIRSlqqxXr4MamvLCsSIFGAL
 xBOrHkqJ9w/a8fCwCHMXpmksqPnrSnqaE1Igh4bNUpJPjuq/2+zuCSEVvxSHWhVIMRAI
 +PNwYVtZwkjNxOzCWj4a0iDoDrONgnG1e1y+i3ICLi8F0gR3JWc+nyMsY5L15K3E5E0A
 MFFuqnWqsXKRiW88D0X3ZRGDXk8gJig9Dzrk+rp5ELbMvuLiqO6+bprQmbyTW0qv6dIl
 9NCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4cAEQ7f4WVFFYZgzFVWfq5VllcJ+b7ryTRhBsVSHY7E=;
 b=P4Oo8nuiOz+8D3jrd+/ZFKZ5z19he96IejbTOT9m/zjJ2SmQCboFc3Yq+9MUgr0Xue
 iLOMJlK1EYLKbKu4asQceq+sBdqNnxYuZMTBBYYX9QHui701R0n/pvqRuUv1ElQs5Vxn
 6mcOhyKsWS/mc8ln5K/+RgaFKgWZkLBZALHyJYZag8dQC/oUfnW6UaUqID71EccWtRHk
 Hy/Zn/X4Y3d8NjVvo3ByC7gnglgHdcWgG+iRcZ89TDa6gzgY4Ixjfaa64GDAyHwV0/Gh
 S6DiGxTHNz9V68DDwqVGSstwuEVDMPJ8pWenjrgPD2/jZADTgafVMfiMnEoLIloUO6Pm
 udww==
X-Gm-Message-State: AOAM530AgIyLwKhZQ5DBa7lTjeAIjGvmLf19yAjCrw6Mn07JsI2ugO+A
 oM7ndO9RxFmqqByEeCWWT5+qePrDGoAwIKO0SKlD+iUz
X-Google-Smtp-Source: ABdhPJyr4GRDqDdhKh0e8DCqpxKmDTe5YUG72sSw4BSPWoQUsXo/F/vtYW1jQrAQd0sUEMhyfEeEFaOafLC4O0IdOWU=
X-Received: by 2002:a17:906:fa92:: with SMTP id
 lt18mr25782441ejb.423.1592203083419; 
 Sun, 14 Jun 2020 23:38:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAH72RCVhmE3Gn1uiC2iRV2_-EbC7bWW_WJeX+n8xs42me6bgVQ@mail.gmail.com>
 <CAH72RCWeHHJRftd+gm+yX5jdQW2fqvoxMVJPRWr-cq9iKi3R4A@mail.gmail.com>
 <20200613211507.GB3036357@onega.vda.li>
In-Reply-To: <20200613211507.GB3036357@onega.vda.li>
Date: Mon, 15 Jun 2020 09:32:51 +0300
Message-ID: <CAH72RCWf4R=RO=TspqQjLn=hhK8Dw+Gni8=t0zzMLqZwykcT1g@mail.gmail.com>
Subject: Re: GSoC 2020: Week 1 and Week 2 Progress
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thank you for the review and patches.

On Sun, Jun 14, 2020 at 12:15 AM Alexander Bokovoy <ab@samba.org> wrote:

> Hi Hezekiah,
>
> On to, 11 kes=C3=A4 2020, hezekiah maina via samba-technical wrote:
> > Sorry I didn't to give the link to the repo:
> > Here it is: https://gitlab.com/HezekiahM/samba-ad-dc
>
> Great to see quite a progress, thank you.
>
> I deployed it on Fedora 32, here my notes:
>
> - I had to create src/css or otherwise webpack did not complete
>   successfully
>
> - I needed to patch webpack.config.js to allow webpack to
>   finish linking the code
>
> - On Fedora Cockpit does have patternfly.css as patternfly.min.css, I
>   had to change the reference
>
> - There are some issues with the content security policy so I added one,
>   may be it is not needed
>
> - one needs to provision the domain first or loading the app never
>   completes, this is because you never set addcStatus to 'false' in case
>   testparm doesn't return "active directory domain controller" for the
>   'server role'
>
> - once provisioned, the app starts showing separate pages but I wasn't
>   able to retrieve the domain details from the 127.0.0.1 IP address
>
> There is something wrong with the state update -- at least, I was not abl=
e
> to see values updated from the forms. This can be seen with domain info,
> for example -- since ipAddress state is undefined by default, it is not
> updated and 'samba-tool domain info ${ipAddress}' fails:
>
> An Error Occurred
> ERROR: Invalid IP address 'undefined'!
>
> I'm attaching some of my fixes, feel free to check them.
>
> It is a promising start, great to see it.  Please add breadcrumbs to
> return back to the previous level from each separate page (e.g. from
> samba-ad-dc/users/index.html to main page in samba-ad-dc/index.html, for
> example). This would allow moving back and forth without reloading the
> page.
>
> Looking forward to next week update. ;)
>
> >
> > On Thu, Jun 11, 2020 at 10:31 AM hezekiah maina <
> hezekiahmaina3@gmail.com>
> > wrote:
> >
> > > Hi Members,
> > >
> > > I wanted to give you an update on my progress for the work I'm doing
> during
> > > the GSoC 2020.
> > > Week 1:
> > >  I worked on some bits of the following:
> > >   Computer Management - List, Create, Delete and Showing the AD Objec=
t
> > >   Time - Showing the current time on the Server
> > >    Domain Management - Provisioning and Domain Information.
> > >    Sites Management - Creating and Deleting
> > >    Contact Management - List, Create, Show and Delete Contact
> > > Week 2:
> > >  I have been working on the following:
> > >  User Management - Creating and Listing Users
> > > I will continue working on the same and hopefully write tests for the
> app
> > > before the end of the week.
> > >
> > >
>
>
> --
> / Alexander Bokovoy
>
