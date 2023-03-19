Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3E16C006F
	for <lists+samba-technical@lfdr.de>; Sun, 19 Mar 2023 10:46:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=hngufsddRlEw3zhsW4tRUWAmiFCUzwqVxoF7ScyEtN8=; b=XNyP7pHYlKUbbx3s32gPXzU8eC
	+NDzlN3UTNJp0CVr0+2qThGXHMeH3UEW67VQI0ocCcsGBfYoBXoCprWOYbfSeMuJDJeKHoOgFD/Lj
	HZp58ZwsMIhNMQ5hm4EuUTwF7WFM0mrPxc/bxvsr94n9XcP3Td9KFqfMI9XS6K6cvPfJbwzQRu6Dh
	DcOI5raqlIz1IjaqLh2xFA96SUeLJrVTSuxNnm4XNTtgsfdkROsN7sr5LpUHqZaBs4FXHV7hgWHZG
	3ShcQN3ChcUetz6sm0L1XZG4qdm64/Mtu9jE3HQgn6eSUGRPA2lr/BxlsLH5Oourq3z9HFs980iue
	UCHcQDnA==;
Received: from ip6-localhost ([::1]:48706 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pdpbi-003OTE-79; Sun, 19 Mar 2023 09:45:42 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:36752) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pdpbd-003OT5-7G
 for samba-technical@lists.samba.org; Sun, 19 Mar 2023 09:45:40 +0000
Received: by mail-ed1-x536.google.com with SMTP id w9so36124103edc.3
 for <samba-technical@lists.samba.org>; Sun, 19 Mar 2023 02:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679219132;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hngufsddRlEw3zhsW4tRUWAmiFCUzwqVxoF7ScyEtN8=;
 b=RA3/sJPEBmoPv0UlhDnUpSTJcnqFDG6uAc7/KxG9T32zRN3mGjKc2Ca6Z+otMZx+1C
 uTnovWjPd8aV0rO+3Ig/UReH8ENbXsbNNKvL4CLnjoEx0L9597/qqk4lfVg0mENsi0Vh
 bffXt6ZT2231EfPyedFrj4nDEN2iZKpVyOp1k0A6+LjJk6Gowe4qt4x8lohpkvIxQ0YX
 lEwBeAFzqbl1PGSCYt5RByjkD+fknopNBZQw7AhgbjpLGBr0vqP5R9P6rz5Cgr2Lcu+v
 C1bG1yIu7/4NGy40W7RT9VAFA5hfPchHzhoxEUGofx/j+rrksaeXIChl1D8xe41E5Bj8
 qkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679219132;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hngufsddRlEw3zhsW4tRUWAmiFCUzwqVxoF7ScyEtN8=;
 b=nQoM3/VNv+YASmjMErw9RhlGUviZPq+Io3TeNKi55jY4KxqZPLHjQzfqnj3Xv0p3aI
 GirvSpRTmElou4MhbhMkdN3SHOuS0jgWw9bQp5+EJjTnolQepID+WvsaL2OyhNWjBmVe
 mLeCHL5UsOASc/jyRzm/SUjxb1/LQMMtL9XaW4xsTQZCyipsn/unsKMwZ/AsuF2HVkiD
 mYwkXSMzUca43tOYvXRMfl/rffdFMmGdXf84lDj099X2DiysXu3bsz93Ebe3zwiJaOaK
 C+kf7Bzreu4zVdXizpfPJqz3UsAYBrAnLaVCFbIyY42qNz5FxcG4TxNZUJwjMhBs2YfZ
 DAWQ==
X-Gm-Message-State: AO0yUKU+e1YhZkeJ0EC6YNEYECWa7Ij4oj2lq6CxOrYuy10T7ZOBAuXa
 loZddb6H1fmZtKPeo75+2bKw81DNlFzj25mG+j/KVzOV
X-Google-Smtp-Source: AK7set8M7Sh9eikQOu1DRf9yMdFCBrrItvRuxnvQEVqLmIhqQV+dTzYEqgEH7o0RilHsrhjYZ+8yvg+9pyala88B1qM=
X-Received: by 2002:a50:cd1d:0:b0:4fc:8749:cd77 with SMTP id
 z29-20020a50cd1d000000b004fc8749cd77mr4519135edi.3.1679219132527; Sun, 19 Mar
 2023 02:45:32 -0700 (PDT)
MIME-Version: 1.0
References: <c2ed6a14-6555-2f51-5bf4-c984aaa43a64@msgid.tls.msk.ru>
 <ZBa55+81hGE4QF7k@pinega.vda.li>
 <31194bd0-05a5-9549-5b6c-ef37bd5d5c17@samba.org>
 <ZBbC2rDQ5eMwkBVO@pinega.vda.li>
 <fc2818e4-cf75-1252-4d8d-8965ab2e6039@samba.org>
 <ZBbQcMSNinFiIpYz@pinega.vda.li>
 <97d44fce-4373-ee05-f94a-16df2f362ae3@samba.org>
In-Reply-To: <97d44fce-4373-ee05-f94a-16df2f362ae3@samba.org>
Date: Sun, 19 Mar 2023 19:45:19 +1000
Message-ID: <CAN05THRdnc6tAAZTqw6WyE39skJSLR1nc1BqnZNi5NBdn-TNXg@mail.gmail.com>
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

On Sun, 19 Mar 2023 at 19:15, Rowland Penny via samba-technical
<samba-technical@lists.samba.org> wrote:
>
>
>
> On 19/03/2023 09:05, Alexander Bokovoy wrote:
> > On su, 19 maalis 2023, Rowland Penny via samba-technical wrote:
> >>
> >>
> >> On 19/03/2023 08:07, Alexander Bokovoy wrote:
> >>> On su, 19 maalis 2023, Rowland Penny via samba-technical wrote:
> >>>>
> >>>>
> >>>> On 19/03/2023 07:29, Alexander Bokovoy via samba-technical wrote:
> >>>>> Hi,
> >>>>>
> >>>>> On su, 19 maalis 2023, Michael Tokarev via samba-technical wrote:
> >>>>>> Hi!
> >>>>>>
> >>>>>> I already asked a similar question before, but it keeps popping up in different
> >>>>>> contexts and forms, and the more I use samba myself, the more often it comes to
> >>>>>> me too, especially in context of using various security tokens for auth.  And the
> >>>>>> more I think about all this, the more sane it looks to me.
> >>>>>>
> >>>>>> The thing is: mit-krb5 has much better user-level support than heimdal. But samba
> >>>>>> does not fully support mit-krb5 as an active directory domain controller.  The
> >>>>>> AD-DC thing is server-side.
> >>>>>>
> >>>>>> I can think of providing two builds of samba for a distribution (eg debian/ubuntu), -
> >>>>>> one implementing whole ad-dc, as a complete thing, using their own set of libs,
> >>>>>> linked with heimdal. And a usual set of more client-side packages, with their own
> >>>>>> libraries, built against mit-krb5.  Or maybe some other combination also has its
> >>>>>> right to be, - for example, smbclient built with mit-krb5, the rest is heimdal.
> >>>>>>
> >>>>>> An essential part of this is that the two sets (built against mit-krb5 and heimdal)
> >>>>>> do not share any internal libraries, each has its own libraries. This way, there's
> >>>>>> no "mix" of differently built samba, each build uses only its own libs, so there's
> >>>>>> no clash here.  They share the same smb.conf though.
> >>>>>>
> >>>>>> So far, I've seen requests to build two versions of the server (again, with mit-krb5
> >>>>>> and with heimdal), - and I faced the same issues too.  This is because a regular AD
> >>>>>> member server is also good to have mit-krb5 support to integrate nicely into the auth
> >>>>>> infrastructure. While for ad-dc, it is less often used as "end-user" server.
> >>>>>>
> >>>>>> So I can think of a separate samba-ad-dc binary package providing whole samba suite
> >>>>>> built against heimdal (maybe without smbclient and some other minor things), and
> >>>>>> samba "file server" binary package providing regular server not suitable to use as
> >>>>>> an ad-dc, but conflicting with samba-ad-dc, so it is not possible to install one
> >>>>>> together with another.
> >>>>>>
> >>>>>> This approach also has another good side effect, to discourage usage of samba-ad-dc
> >>>>>> as a regular file server.
> >>>>>>
> >>>>>> Or maybe the whole thing is moot now, and we just can provide regular samba built
> >>>>>> against mit-krb5 to work as a good AD-DC?  That would be the best solution IMHO.
> >>>>>
> >>>>> I would be against a blended build against both MIT Kerberos and Heimdal
> >>>>> Kerberos in a distribution. It is not going to bring you anything good,
> >>>>> support wise.
> >>>>>
> >>>>> Andreas and I have submitted a talk to SambaXP about MIT
> >>>>> Kerberos/Heimdal Kerberos-based Samba AD DC configurations, where they
> >>>>> stand against each other and what are perspectives. In short, both have
> >>>>> unique features that do not exist in the other variant and both are
> >>>>> close to being production-ready. We want to change the status for MIT
> >>>>> Kerberos-based build from experimental to production. Effectively,
> >>>>> actual decision for a version shipped in a particular distribution would
> >>>>> need to be made by that distribution, of course.
> >>>>
> >>>> I do not think this is a good idea, Samba should use one or the other, not
> >>>> both. If you do use both, to a certain extent you will nearly double the
> >>>> support required.
> >>>
> >>> I did say exactly that: I am against blended build. Not sure what made
> >>> you think otherwise.
> >>>
> >>>>
> >>>>>
> >>>>> Distributions need to take into account security releases, as Rowland
> >>>>> has pointed out as well. However, from my Fedora and RHEL experience,
> >>>>> this is not a problem with MIT Kerberos -- certainly not more than with
> >>>>> Heimdal. It is pretty much a coordination question and I believe we have
> >>>>> very good coordination on that front with MIT Kerberos and distribution
> >>>>> maintainers.
> >>>>
> >>>> That is strange, from what Andrew wrote, he appears to think the opposite.
> >>>
> >>> I am one of developers and one of maintainers for both Samba and MIT
> >>> Kerberos in Fedora and RHEL (as well as few other relevant projects). I
> >>> personally see no issues with MIT Kerberos upstream collaboration.
> >>> Things get discussed and fixed when needed, contributions get accepted.
> >>> Our willingness to move Samba AD/MIT support from experimental forward
> >>> to supported is based on that factor as well.
> >>>
> >>>>>
> >>>>> If I was in Samba AD support for production deployments, I'd probably
> >>>>> go with deploying DCs in a containerized image way to isolate completely
> >>>>> from the rest of the OS. There are few images already that provide this
> >>>>> setup: [1] was presented at SambaXP by Michael Adam and other folks now
> >>>>> from IBM Storage, [2] is older and also active one.
> >>>>>
> >>>>> [1] https://github.com/samba-in-kubernetes/samba-container
> >>>>> [2] https://github.com/instantlinux/docker-tools/tree/main/images/samba-dc
> >>>>>
> >>>>
> >>>> I personally have no axe to grind over the matter, I do not care which kdc
> >>>> is used, just as long as it is only one, if only from the support point of
> >>>> view.
> >>>> I also only say that using MIT is experimental because other wiser (at least
> >>>> I hope they are wiser than me) people say it is, if this changes then so be
> >>>> it.
> >>>>
> >>>> I still do not think it is a good idea for a distro to provide two versions
> >>>> of Samba, one using Heimdal and the other using MIT.
> >>>
> >>> Yep. However, tools we have in most distributions allow to provide more
> >>> flexibility. It all needs maintainers, though. Without maintainers there
> >>> is just an illusion that someone could depend on a package that is in
> >>> reality not supported well -- whether it is built with a single scenario
> >>> in mind or set up to handle multiple approaches.
> >>>
> >>
> >> Alexander, as I said, I do not have an axe to grind in this, if Samba
> >> decides to move to MIT, then so be it. You however, do have  an axe to
> >> grind, you work for red-hat, who are on record as saying that there will
> >> never be an AD DC on RHEL. Are you now saying that, if Samba moves to MIT,
> >> there will be ?
> >
> > I don't say that. What I said is that I am responsible for both Fedora
> > and RHEL. Fedora does provide Samba AD DC already for several years,
> > using MIT Kerberos backend. That's what I stand behind and will continue
> > to support.
> >
> >
>
> Yes, Fedora has provided an AD DC for sometime, but it could be honest
> about it and say:
> A) Samba has marked the use of MIT as experimental, so you shouldn't use
> this in production (even if you think they could be)
> B) RHEL will never provide an AD DC

This has been a topic for well over a decade, from well before I left
the CTDB team.
And a decade and a half later there is still the same issue.

If no one has cycles to work on fixing it proper. Maybe the solution
is to fork samba into two or more related but independent projects
that can each decide what external libraries to use?
I mean the current situation has been ongoing for well over a decade
and no solution in sight. Maybe more drastic and pragmatic solutions
are called for?
>
> Rowland
>

