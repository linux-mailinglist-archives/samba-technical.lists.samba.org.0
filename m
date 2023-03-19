Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCAE6BFFF0
	for <lists+samba-technical@lfdr.de>; Sun, 19 Mar 2023 09:05:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=z0bOaKLCUQtpj0KV9GDXKQWWiuRna9BWtOk764r5Is4=; b=JWitQol08xuiZY03K0gBEb17fr
	FW1D31bp8DWONviC7iSk5nDQJ21YYEtH5TywQImg6V7IK5lceDiM00+dx/p34MqFDDkCL+EPOW0w1
	C74m5QULgj/slQmlk5lnLEHO5vbz8/iZTs5EEeOPrICMORsB5M8xwO4h3qMaErf1+IPQ8YLrDJeP1
	tJEu8nT7i/RMK4t0FWKqnyAvtDnNmbohYfSAwBGBbQ0cw4IjiZCZDvOgAb69yerJmBQdHBaGMKSo8
	8bPUGGmP/wA0/5i3DhT/RAWtbukvLMyLOq9jhQ6uyVeJGzPyqAtDMOGdfyTLdiKIYUwbgZFOERMwb
	OK4Y9NKg==;
Received: from ip6-localhost ([::1]:47822 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pdo2A-003McN-Ub; Sun, 19 Mar 2023 08:04:55 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:40510) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pdo24-003McE-1I
 for samba-technical@lists.samba.org; Sun, 19 Mar 2023 08:04:50 +0000
Received: by mail-ed1-x536.google.com with SMTP id fd5so35623610edb.7
 for <samba-technical@lists.samba.org>; Sun, 19 Mar 2023 01:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679213086;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=z0bOaKLCUQtpj0KV9GDXKQWWiuRna9BWtOk764r5Is4=;
 b=CSsKe9eZ1qDaSVe7WcHeNZbdTbqB9K1Y0R4CwPer2ZfXfbljsWt8C/2xcPs83VjM1Z
 TZLkTQiLwQAVsY+4t1jCTr7qhjxBq7C/lWznf0+N7Y6WELzrwTzjbJ04c3PlbpDCcmnw
 M+cBVeMQrx7ucfqpmzYzrxIWjw2xOMvPXto+udxWKezcnjhoufjAhVReTb/u1quss7Sl
 dAFIvW7+1O6H9iP7v5Hx2CPRkcrCX6raLOTovnzaKSVxRczql9+Z4yJCflQlNY1TDFZF
 i0XWzCVz8seq6uPFoW+RCQ8afrDDF//3mPXdyYhtvJ+xPDMLObLFhTD6NFnN+/sV2Zqi
 Xp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679213086;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z0bOaKLCUQtpj0KV9GDXKQWWiuRna9BWtOk764r5Is4=;
 b=N/kS0wwW/QdvcsAi9KM8R3uGrEnqNn1U/3ekgRf8KsLC64z8xWLqyoYEC4GWTLHhYR
 mPUO8iupaKcwvod//cYVlXrcaQi2mAlhRhX0P7Jax+cSOxE/50zQu6LcDTLNKm4zGEhs
 b9VEugCPjv7nUuk+d2YbKam3Qv8KStlkMR0f97ezFXQk8rjB3d2P0JBxdhbNT+VVn3cU
 mhlqRz9K6hP7SeikpzdehtJukPivUPfARH3DHecWjl3vBP5Gr6DJVI33kvwNwLC3uG66
 p6k0KG8i91tLYaVMHr8FBWhVjM22b2kJ8zyHmEeVBeoakK1DmAyEFWh0+O2AOKPiHOZ0
 gaOg==
X-Gm-Message-State: AO0yUKXHl8WGMdSNkauqZpKbLVZuZG3HhT2UFPBa/2U4400pm8Zxv64U
 T1aYxBFFbchVetyP9x+X2QD7MKySO7cqfaqRetE9dqbl
X-Google-Smtp-Source: AK7set8eAgr2r7MNS63d5TdpEqOP9b0yk//Rb6VU7auOLVAgOIYVUQJ1EdCRhcvBC/xCOpZjgCi3fN/KnzdIzPGPTbI=
X-Received: by 2002:a17:906:1b4e:b0:931:f8b1:4474 with SMTP id
 p14-20020a1709061b4e00b00931f8b14474mr2322739ejg.2.1679213086285; Sun, 19 Mar
 2023 01:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <c2ed6a14-6555-2f51-5bf4-c984aaa43a64@msgid.tls.msk.ru>
 <ZBa55+81hGE4QF7k@pinega.vda.li>
 <31194bd0-05a5-9549-5b6c-ef37bd5d5c17@samba.org>
In-Reply-To: <31194bd0-05a5-9549-5b6c-ef37bd5d5c17@samba.org>
Date: Sun, 19 Mar 2023 18:04:33 +1000
Message-ID: <CAN05THRpJu92-viS-kbJr1F_hoQP94VPnWTzcy3+1s4j_kup-w@mail.gmail.com>
Subject: Re: mit-krb5 and heimdal binaries
To: samba-technical@lists.samba.org
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, 19 Mar 2023 at 17:52, Rowland Penny via samba-technical
<samba-technical@lists.samba.org> wrote:
>
>
>
> On 19/03/2023 07:29, Alexander Bokovoy via samba-technical wrote:
> > Hi,
> >
> > On su, 19 maalis 2023, Michael Tokarev via samba-technical wrote:
> >> Hi!
> >>
> >> I already asked a similar question before, but it keeps popping up in different
> >> contexts and forms, and the more I use samba myself, the more often it comes to
> >> me too, especially in context of using various security tokens for auth.  And the
> >> more I think about all this, the more sane it looks to me.
> >>
> >> The thing is: mit-krb5 has much better user-level support than heimdal. But samba
> >> does not fully support mit-krb5 as an active directory domain controller.  The
> >> AD-DC thing is server-side.
> >>
> >> I can think of providing two builds of samba for a distribution (eg debian/ubuntu), -
> >> one implementing whole ad-dc, as a complete thing, using their own set of libs,
> >> linked with heimdal. And a usual set of more client-side packages, with their own
> >> libraries, built against mit-krb5.  Or maybe some other combination also has its
> >> right to be, - for example, smbclient built with mit-krb5, the rest is heimdal.
> >>
> >> An essential part of this is that the two sets (built against mit-krb5 and heimdal)
> >> do not share any internal libraries, each has its own libraries. This way, there's
> >> no "mix" of differently built samba, each build uses only its own libs, so there's
> >> no clash here.  They share the same smb.conf though.
> >>
> >> So far, I've seen requests to build two versions of the server (again, with mit-krb5
> >> and with heimdal), - and I faced the same issues too.  This is because a regular AD
> >> member server is also good to have mit-krb5 support to integrate nicely into the auth
> >> infrastructure. While for ad-dc, it is less often used as "end-user" server.
> >>
> >> So I can think of a separate samba-ad-dc binary package providing whole samba suite
> >> built against heimdal (maybe without smbclient and some other minor things), and
> >> samba "file server" binary package providing regular server not suitable to use as
> >> an ad-dc, but conflicting with samba-ad-dc, so it is not possible to install one
> >> together with another.
> >>
> >> This approach also has another good side effect, to discourage usage of samba-ad-dc
> >> as a regular file server.
> >>
> >> Or maybe the whole thing is moot now, and we just can provide regular samba built
> >> against mit-krb5 to work as a good AD-DC?  That would be the best solution IMHO.
> >
> > I would be against a blended build against both MIT Kerberos and Heimdal
> > Kerberos in a distribution. It is not going to bring you anything good,
> > support wise.
> >
> > Andreas and I have submitted a talk to SambaXP about MIT
> > Kerberos/Heimdal Kerberos-based Samba AD DC configurations, where they
> > stand against each other and what are perspectives. In short, both have
> > unique features that do not exist in the other variant and both are
> > close to being production-ready. We want to change the status for MIT
> > Kerberos-based build from experimental to production. Effectively,
> > actual decision for a version shipped in a particular distribution would
> > need to be made by that distribution, of course.
>
> I do not think this is a good idea, Samba should use one or the other,
> not both. If you do use both, to a certain extent you will nearly double
> the support required.
>
> >
> > Distributions need to take into account security releases, as Rowland
> > has pointed out as well. However, from my Fedora and RHEL experience,
> > this is not a problem with MIT Kerberos -- certainly not more than with
> > Heimdal. It is pretty much a coordination question and I believe we have
> > very good coordination on that front with MIT Kerberos and distribution
> > maintainers.
>
> That is strange, from what Andrew wrote, he appears to think the opposite.
>
> >
> > If I was in Samba AD support for production deployments, I'd probably
> > go with deploying DCs in a containerized image way to isolate completely
> > from the rest of the OS. There are few images already that provide this
> > setup: [1] was presented at SambaXP by Michael Adam and other folks now
> > from IBM Storage, [2] is older and also active one.
> >
> > [1] https://github.com/samba-in-kubernetes/samba-container
> > [2] https://github.com/instantlinux/docker-tools/tree/main/images/samba-dc
> >
>
> I personally have no axe to grind over the matter, I do not care which
> kdc is used, just as long as it is only one, if only from the support
> point of view.
> I also only say that using MIT is experimental because other wiser (at
> least I hope they are wiser than me) people say it is, if this changes
> then so be it.
>
> I still do not think it is a good idea for a distro to provide two
> versions of Samba, one using Heimdal and the other using MIT.

Distros are always going to ship with MIT as that is the default.
Distros might also have to ship Heimdal but that will double the
support and maintenance cost
of Kerberos support at distros.
Forcing distro to ship Heimdal is not a zero-cost decision.

>
> Rowland
>

