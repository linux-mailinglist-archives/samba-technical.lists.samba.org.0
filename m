Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA25846F45
	for <lists+samba-technical@lfdr.de>; Fri,  2 Feb 2024 12:44:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=1pEb0mWbL3upvdhvfS/8LNGnf8xEcU7X55J/2NL4YxY=; b=nWBB6pGQxPizJIXK74uZjh4fyq
	xjvyBXo1dMdTUvE5BhkT8AO1RK6Mz32G66v63RnrOmsMBHTB1joJfMtQr435LwdCOeST9sqiobTVf
	+Ow1+fgYvBvZ/BO9HYHv5Pc+bO1SwRYwy3Qh6xryYbopQ6VNlEo2PNnz+NnVmCiykXL7Kc6U0qPQJ
	uo588JSgrasyJwGCOaUud+Gwt5UyW4/TxZirwUiNsE6xuODIEgpksXhFMyC97w4z5xJyYTHtuHL1Q
	tZh7iB4k6XX4T/RMtsY0q3uh1mlx/ygzslUWSE7/ns3UdczGV+SppTxBxbtyGFlkPIqrecIWYRZAk
	801HFqIA==;
Received: from ip6-localhost ([::1]:49898 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rVrxy-007Lml-R3; Fri, 02 Feb 2024 11:44:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18652) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rVrxu-007Lme-5A
 for samba-technical@lists.samba.org; Fri, 02 Feb 2024 11:44:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=1pEb0mWbL3upvdhvfS/8LNGnf8xEcU7X55J/2NL4YxY=; b=USHiFvD92Ox0OHImIvuXOnxaWy
 cb+q6MSacitQTbfAkwArEdaDbfQro1soPaYh15eE6IgdQ6NnIDWQLU07Qnvtqu8A5DxUl8dlVTnml
 b6S2OZkmCxgJK9wUN1LPIhBe7tIyNpG5LTSABm2tU96XhKsY9CLHXaab5z/SiiKrKApTNRd48IY0o
 vw5FlXxRqWUBn5w+skzzm1XSLZ73Pt17kLOwqXGUlnNxM4W4b/uhH8gPx7ThRFNjh6x+SxHz6E3d/
 SOdTkJOQCnLQYLIl6ydpNbw/L+aM6IcYW/6r1MtzCJygL+8mUPDu1IU8yDCgL0gjHI57qNTmLjv43
 7UyKIbfRrOc7v8delfsT2sWJMopJCCZum8ke8FdnNaCLw38z1mlPLRonII3DO2TmC/tt+GRoV+zqJ
 lWLSCZmX8OgW3ltRuVnQspa7PQNVGR4gb4Z173mcfPdi5YjPcXFt64Xf/vSJA6OxK05GSi5TWyg6o
 A0LP0EspA0/OLfkRihDrrd/g;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rVrxt-00BBQT-18 for samba-technical@lists.samba.org;
 Fri, 02 Feb 2024 11:44:13 +0000
Date: Fri, 2 Feb 2024 11:44:11 +0000
To: samba-technical@lists.samba.org
Subject: Re: Question for time based group membership in FL 2016
Message-ID: <20240202114411.172569b4@devstation.samdom.example.com>
In-Reply-To: <63d903a2-06c2-40e9-ae1d-9457fbe73107@gmail.com>
References: <14cf1029-2378-489d-bf9b-844ed9d67081@kania-online.de>
 <6d845bb3-3348-4025-abec-e749287d7392@catalyst.net.nz>
 <728bedf6-dcf3-4006-b73d-9331db2b8777@gmail.com>
 <20240201214220.525418b1@devstation.samdom.example.com>
 <f0ebb138-5ca4-4383-b17d-dd5f80ef1459@gmail.com>
 <20240202102927.7aba3b66@devstation.samdom.example.com>
 <63d903a2-06c2-40e9-ae1d-9457fbe73107@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2 Feb 2024 12:19:35 +0100
Kees van Vloten via samba-technical <samba-technical@lists.samba.org>
wrote:

>=20
> On 02-02-2024 11:29, Rowland Penny via samba-technical wrote:
> > On Thu, 1 Feb 2024 23:32:37 +0100
> > Kees van Vloten via samba-technical
> > <samba-technical@lists.samba.org> wrote:
> >
> >> On 01-02-2024 22:42, Rowland Penny via samba-technical wrote:
> >>> On Thu, 1 Feb 2024 22:16:35 +0100
> >>> Kees van Vloten via samba-technical
> >>> <samba-technical@lists.samba.org> wrote:
> >>>
> >>>> On 01-02-2024 21:38, Douglas Bagnall via samba-technical wrote:
> >>>>> On 2/02/24 07:22, Stefan Kania via samba-technical wrote:
> >>>>>> Hi to all,
> >>>>>>
> >>>>>> I already posted the question in the samba-mailinlist but I
> >>>>>> think it's more a question for developers :-)
> >>>>>>
> >>>>>> I have a question about FL 2016 and if samba supports it. If
> >>>>>> yes, how can I use it without powershell.
> >>>>>>
> >>>>>> In FL 2016 there is the possibility to put a user into a group
> >>>>>> and the membership is time based. So I could put the user Foo
> >>>>>> into the group 'domain admins' for 30 minutes and after 30
> >>>>>> minutes the system will remove user foo from the group.
> >>>>> That sounds good. We don't do that, and we don't call it part of
> >>>>> "functional level 2016".
> >>>>>
> >>>>> The things that count as "functional level" are listed here:
> >>>>>
> >>>>> https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/act=
ive-directory-functional-levels
> >>>>>
> >>>>>
> >>>>> They are protocol level things -- supporting FL2016 means you
> >>>>> can properly be a DC in an FL2016 domain.
> >>>>>
> >>>>> Temporary memberships is a useful trick that Windows Server 2016
> >>>>> can do, for which FL2016 is necessary, but not sufficient.
> >>>>>
> >>>>> That's my understanding, at least.
> >>>>>
> >>>>> Douglas
> >>>>>
> >>>>>
> >>>> Still, if you know what this powershell call changes in the LDAP
> >>>> record of the group, the user or elsewhere in LDAP, you can mimic
> >>>> this functionality quite easily with a little cron script on the
> >>>> DC.
> >>>>
> >>>> I have created a kind similar implementation called auto-lock,
> >>>> where (admin-)users that member of the "autolock" group
> >>>> automatically get disabled at midnight every day
> >>>> (https://github.com/kvvloten/samba_integrations/tree/main/domain_con=
troller/manage_scripts#disable-special-users-daily)
> >>>>
> >>>> And another piece of cron-scripting makes "password expired" LDAP
> >>>> searchable (which is not the case with the computed attribute
> >>>> "msDS-User-Account-Control-Computed").
> >>> That attribute is searchable, it is one of the attributes you have
> >>> to explicitly ask for.
> >> We had this discussing before: you can get it returned in an ldap
> >> query, but you can't use it in an ldap filter. Applications tend to
> >> use a filter to find find users, so it does not work for my usecase
> >> (with Privacyidea).
> > Fair enough, it isn't that Samba ldap is limited, it is a
> > limitation of the tool that you are using.
>=20
> Sure, but there are not many applications where you can do things
> with retrieved attributes and multiple ldap-searches in the selection
> of users and groups.
>=20
> Most (nearly all?) applications allow just server settings, bind=20
> settings, base-dn, a ldap-filter and sometimes attribute mapping.
> That includes big names like Postfix and Dovecot.
>=20
> I would think this is more a Microsoft limitation than anything else.
> Or perhaps it is even generic for ldap, I have no clue how OpenLdap
> treats computed attributes.

I do not think that openldap has computed attributes, so I don't think
you can say it is a Microsoft limitation, I would say that it was more
of an 'extension' and is something that most Linux tools are not
capable of dealing with, if only because they are designed to work with
openldap and Microsoft ldap is an after thought.

=46rom my 'limited' understanding, time limited time group membership is
totally controlled by the AD DCs, the user is a group member until the
TTL expires and then they are not.

>=20
> Then again, it does not matter much what the root-cause of the=20
> limitation is, more important is how to overcome it :-)

Totally agree, but until the problem is fully understood, it cannot be
fixed ;-)

Rowland

