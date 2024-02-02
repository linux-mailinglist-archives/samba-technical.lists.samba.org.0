Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 21835846DE7
	for <lists+samba-technical@lfdr.de>; Fri,  2 Feb 2024 11:30:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=tHNB6A6QOKkm9EGVPHFiIXPxJ71elxYXSeVsq0s0DKs=; b=K20cCPiyQF53o4SCZmdTrZ4BNe
	VKYWEgBc6crncCKZNdj3KgrHKh6R/H3xTrmlpRhQ5xd2kpztvf5yp828e8ciIuzRCyuQBhnBOsELq
	7WvKedYT3PlpNG5I1Y49hzJIQ3LGJukaekLQEIZxCubfRiqzB8sB7UEP75AyQsh15O2y4IbszMB1q
	qDCrWayJovZSC6qhmxj1Ye0U9y5ha973pyFtXI9/z66cCPGPlWuMfA8dIKPvzwJYKyNekxuGR7tQw
	lgcgZuHTxsy4NCVOYALWBOXHA8eFKSC95j2UkahycXnK92ohKzknf3qVpTfJFYx2fjlRTVI7R2Jok
	Y++dLHUg==;
Received: from ip6-localhost ([::1]:38150 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rVqng-007LVu-5O; Fri, 02 Feb 2024 10:29:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23544) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rVqna-007LVm-Gm
 for samba-technical@lists.samba.org; Fri, 02 Feb 2024 10:29:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=tHNB6A6QOKkm9EGVPHFiIXPxJ71elxYXSeVsq0s0DKs=; b=t3p2IIPHCANieeS2cHd7gRe3p+
 mKEownzfL9iAuWqiuJCsJITVJ7sH9MxBq3a3BX+CGfr5jSxIOpjgKais1YXWPSmyOtavM29PzwovP
 7MM5hu2qRcFQzisOYO/HX4Lik5TP2hH5+BBR7KgZwFiJZQDlOBSzPblZ6gilpvQ1SH1Lih1aiw1To
 qDmly9Xoj4ShYibJg8TSvzMwSF+8CI+dXZQ6xJfmeBviRlBFkIqRzghBdzpVqvFTlgwGm75qFaldU
 ntlNOrtrHSUiNmhNTahcXGmh5vKg6D2NYQ0nVGYUsHozkoHNDb6JCoRpTMklugnkHEhg6pt/JL69k
 TXeJqbSVvh19wtFMZQkS9BcR52g0iEUb97j1oBRlkIlIz32jgEdpiStbloykHyrlIzuMYXauK1lZ5
 MwkE1n0FkdXUx4gf1aOZfDvVSaf+oOskh4+Zn1MwT7iK/IAe07P8YTQD0CNxwzroMPAVkNE40RwUt
 7xxZxf/JzpS5dzAClaqDcDTk;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rVqnZ-00BArJ-1M for samba-technical@lists.samba.org;
 Fri, 02 Feb 2024 10:29:29 +0000
Date: Fri, 2 Feb 2024 10:29:27 +0000
To: samba-technical@lists.samba.org
Subject: Re: Question for time based group membership in FL 2016
Message-ID: <20240202102927.7aba3b66@devstation.samdom.example.com>
In-Reply-To: <f0ebb138-5ca4-4383-b17d-dd5f80ef1459@gmail.com>
References: <14cf1029-2378-489d-bf9b-844ed9d67081@kania-online.de>
 <6d845bb3-3348-4025-abec-e749287d7392@catalyst.net.nz>
 <728bedf6-dcf3-4006-b73d-9331db2b8777@gmail.com>
 <20240201214220.525418b1@devstation.samdom.example.com>
 <f0ebb138-5ca4-4383-b17d-dd5f80ef1459@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 1 Feb 2024 23:32:37 +0100
Kees van Vloten via samba-technical <samba-technical@lists.samba.org>
wrote:

> 
> On 01-02-2024 22:42, Rowland Penny via samba-technical wrote:
> > On Thu, 1 Feb 2024 22:16:35 +0100
> > Kees van Vloten via samba-technical
> > <samba-technical@lists.samba.org> wrote:
> >
> >> On 01-02-2024 21:38, Douglas Bagnall via samba-technical wrote:
> >>> On 2/02/24 07:22, Stefan Kania via samba-technical wrote:
> >>>> Hi to all,
> >>>>
> >>>> I already posted the question in the samba-mailinlist but I think
> >>>> it's more a question for developers :-)
> >>>>
> >>>> I have a question about FL 2016 and if samba supports it. If yes,
> >>>> how can I use it without powershell.
> >>>>
> >>>> In FL 2016 there is the possibility to put a user into a group
> >>>> and the membership is time based. So I could put the user Foo
> >>>> into the group 'domain admins' for 30 minutes and after 30
> >>>> minutes the system will remove user foo from the group.
> >>> That sounds good. We don't do that, and we don't call it part of
> >>> "functional level 2016".
> >>>
> >>> The things that count as "functional level" are listed here:
> >>>
> >>> https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/active-directory-functional-levels
> >>>
> >>>
> >>> They are protocol level things -- supporting FL2016 means you can
> >>> properly be a DC in an FL2016 domain.
> >>>
> >>> Temporary memberships is a useful trick that Windows Server 2016
> >>> can do, for which FL2016 is necessary, but not sufficient.
> >>>
> >>> That's my understanding, at least.
> >>>
> >>> Douglas
> >>>
> >>>
> >> Still, if you know what this powershell call changes in the LDAP
> >> record of the group, the user or elsewhere in LDAP, you can mimic
> >> this functionality quite easily with a little cron script on the
> >> DC.
> >>
> >> I have created a kind similar implementation called auto-lock,
> >> where (admin-)users that member of the "autolock" group
> >> automatically get disabled at midnight every day
> >> (https://github.com/kvvloten/samba_integrations/tree/main/domain_controller/manage_scripts#disable-special-users-daily)
> >>
> >> And another piece of cron-scripting makes "password expired" LDAP
> >> searchable (which is not the case with the computed attribute
> >> "msDS-User-Account-Control-Computed").
> > That attribute is searchable, it is one of the attributes you have
> > to explicitly ask for.
> 
> We had this discussing before: you can get it returned in an ldap
> query, but you can't use it in an ldap filter. Applications tend to
> use a filter to find find users, so it does not work for my usecase
> (with Privacyidea).

Fair enough, it isn't that Samba ldap is limited, it is a limitation of
the tool that you are using.

> 
> My workaround is to have a cron-script do the check and write the
> result in one of the unused attributes (e.g. the telex number), then
> the application can filter on that. Not the royal solution, but it
> works...
> 
> - Kees.
> 
> >
> >> With this applications like
> >> Privacyidea can disallow MFA for users with an expired domain
> >> password.
> >>
> >> It can't be hard to query some attribute and add or remove a user
> >> from a group.
> >>
> > Would that it was that easy, but as I said on the samba mailing
> > list, I am sure the timing is done in code, but I am sure that
> > those wiser than myself will know.
> >
> > Rowland
> >
> >
> >
> >
> >
> 

OK, I have been looking into this and from my googling, you need the
'Privileged Access Management Optional Feature' , so that means 2016
functional level (at least), see:

https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-adts/d079eee8-1bac-4b03-86e4-506a21450905

Samba will also need to implement the
LDAP_SERVER_LINK_TTL_OID: 1.2.840.113556.1.4.2309

Finally, it seems that Samba will need the code to tie all this together,
just having the functional level and OID will not be enough.

Not a five minute job by the sound of it.

Rowland

