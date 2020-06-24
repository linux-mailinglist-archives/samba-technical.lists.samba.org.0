Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE5D207387
	for <lists+samba-technical@lfdr.de>; Wed, 24 Jun 2020 14:40:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=6QB4xvjM1c0OkiN3db4GazLNS0dRox+VSzM7kRrxVew=; b=NOQWJE+6+RhIPs3c/kZI2Iz+F7
	OrTdObH86l0/q3mQqrXowDr/WUhMO9rD/2h/v+MIUZux68eCyBwTQ9rH7hM/4J+dLJijxNG7laHOF
	TIaGStTr6ZOS8mZOYQgAC50GPXjcu5Yr0FPATQeGggEiXAj6rIDXihMujIphUJ1GnWs2pHgsdu9D6
	/OKmMXkHE0D3Gr1YXx7bvNrHNEXjY430Rm5E4crJUtga+MnSf/igiBzhxOfuaALCvOpPw8LPL8jOb
	/bFlr0R8RL8iOn402Hophrf35YMxur7kkNGSxEOo4k/atAqPGSHyy+Y1TJtkERwTs8ySD2xlXomI4
	fcEuwAGw==;
Received: from localhost ([::1]:40544 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jo4gj-0029XP-V3; Wed, 24 Jun 2020 12:39:38 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:33699) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jo4gd-0029XI-Fk
 for samba-technical@lists.samba.org; Wed, 24 Jun 2020 12:39:33 +0000
Received: by mail-lf1-x12d.google.com with SMTP id g2so1204540lfb.0
 for <samba-technical@lists.samba.org>; Wed, 24 Jun 2020 05:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6QB4xvjM1c0OkiN3db4GazLNS0dRox+VSzM7kRrxVew=;
 b=cmlGvU00e2T5G2ENsEoCmlNE03xEo+twOJ3iAKpRp1lUzdPtqv13SO91A7Vqm+znym
 YHvdRG9ISWMSnpyT69J7K5ydsuNy9GqXMTeNRoZNEmJZPGoUkMX42Si5TJNhuw7ho8Iy
 2Y7b8TTnal/0YFF4bB+O5CY37PWsvZdk4DI8BGlwW28kmS135qgxLD9oDEVKiS45Z0ro
 3XXr/znvsIOHpmZD6xIZEIXQtSATctRhI4Uasu/qH3Y2axd/drJsUW0kGSWb2bx/ZuqR
 Bt/RXLVKB2xB3kHIiyUoRs1YRWbwe6pX0qUTVbrTtXAm2psoFAlvy2pozNO3hCGe+Tk4
 EvCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6QB4xvjM1c0OkiN3db4GazLNS0dRox+VSzM7kRrxVew=;
 b=OVHPYDr/rTVDUb3L+4gHmxLU8cfJf3ONhRxLxUT/5oevDCP/Qvi62x/WRxkXSSPXrw
 Frkgdqq7RFCUv6RPvEq1Wigf1A30vlRiMIgl+3LxPmlcu59Z431a6ZFEf2Ao0CYZjDVP
 F+S8EuUHq+tqKqEr52/HXnxnMt+Er1bRHBaqrw1EnQXoHw6DM56zCuUN4FPghLBd1K3p
 0g7nfXZupuQ2pcyKFjAiHVVUbjbOtCFKBbC0sVsLPvLL9GhfFWcKWYdtgdmvY2iEdqJt
 Nm6v4B+athQ0UJLUK70a3Pv4OnqVKCSR6g+iXMODFlthEmOz/CmHM+xy6GZJFtKgUGkW
 3AKw==
X-Gm-Message-State: AOAM530bjEr+Vv7uMdm5PNgSs9s88jOTkl2jlhvhGIhi3k+0wugO3I9L
 hkKAgXtYKOC5Pvgz/HH/+08A1ZWAih1WOCivkxOOYSTN
X-Google-Smtp-Source: ABdhPJz2Slbd5VXwiJqzugSfNOF6Zhne0UV/FYNPmjSgjpMlu1iDK9mlNA5WjLKJAFr534YWYgXEMAwHP0geHIOhu/Q=
X-Received: by 2002:a19:8c09:: with SMTP id o9mr7261390lfd.160.1593002369782; 
 Wed, 24 Jun 2020 05:39:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAC-fF8TH5sf6ekjfG5QqnEwG41fopV1bWOMxBH_UnodfjDo_qA@mail.gmail.com>
 <20200619181956.GF10191@jeremy-acer>
 <CAC-fF8SYbXaz33yJ_QaZzeYh2uBt3iKxHzbQNtMPm5qqwvAciQ@mail.gmail.com>
 <CAC-fF8Stst7BnrEKVQLP7og-HLp=T+NNoiSpUmRD3mwxXtK67Q@mail.gmail.com>
 <20f59230-59fa-9946-3b4f-937cd1bf619a@sernet.de>
 <CAC-fF8SPmfGbokEzBjZW9zBqbDYeTUg8YN8i_cWY-UN3th1QPA@mail.gmail.com>
 <a2cbe7499956d3d2318326c935954b3636ad8d8a.camel@samba.org>
 <CAC-fF8RQztBgiFTCS6AxVWLsjV3UWyWNUK2Cz7qKpE6hWCy7uQ@mail.gmail.com>
 <e444558549bb3dede91b551e1c13c3bbdae74847.camel@samba.org>
 <CAC-fF8TfDWmVS8iy4Br0oH1KOWessZEGg18QGRmwcO7Chjg11A@mail.gmail.com>
 <5eb2c5d125f7328e234935f15b7591318d521f68.camel@samba.org>
In-Reply-To: <5eb2c5d125f7328e234935f15b7591318d521f68.camel@samba.org>
Date: Wed, 24 Jun 2020 14:39:18 +0200
Message-ID: <CAC-fF8T=Rc-4Owbv7q-5eYkWUoUK1nx7maghawdTQwh6PEASug@mail.gmail.com>
Subject: Re: gitlab: testing of ldap-ssl-ads option
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jun 23, 2020 at 10:17 AM Andrew Bartlett <abartlet@samba.org> wrote:
>
> On Tue, 2020-06-23 at 10:12 +0200, Isaac Boukris wrote:
> >
> > Thanks for the context, still unclear why "ldap ssl ads" depends on
> > "ldap ssl", and requires it to be set to "start-tls" instead of, say
> > ldaps.
>
> I wouldn't worry to much about the history here, just make a sensible
> practical set of option behaviours with defaults matching current
> default behaviour, add to WHATSNEW and document it in man smb.conf.
> Splitting the two parameters would seem to be the first step.

Thanks, added a commit in that direction to wip MR 1402.

