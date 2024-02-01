Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6578A8462BD
	for <lists+samba-technical@lfdr.de>; Thu,  1 Feb 2024 22:42:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=0Tb06sjWrPRzhThifdjAtcn+11+0XrFzSAC+B9ODkhM=; b=u0k53xzDhpv2HdbIPu3/bmfjUs
	y+8jzDgaS6zXE0Umyvk/oEcEgJvfUdhajMDqmJP5IIBQrDnJpMroAbARZ5om1xW6D4X3ID6S02wvK
	2w5NE0Ghkvm2LnCOOPSr6TMbHXARGnrHjVlPdpDFZaQYvkN4kUBLS2gZrQyOr8Wk3RZN2PbswpRZg
	zWFOFpjmdswJ595TzMDxdkHZegVntOKsibz/yBwgFfUETBhZSSWhlJt7Nl2b7H6OEH7UwvzQv8bWT
	X/g+U1CxMxKRLOTbbK+Ocd9ukmrEaaT3RergjUIrMyUGTVMBUayhoAwksEiNG1XITdhugO3RBgUkd
	2hyJpAEA==;
Received: from ip6-localhost ([::1]:19692 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rVepI-007JLO-Uj; Thu, 01 Feb 2024 21:42:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27210) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rVepE-007JLH-38
 for samba-technical@lists.samba.org; Thu, 01 Feb 2024 21:42:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=0Tb06sjWrPRzhThifdjAtcn+11+0XrFzSAC+B9ODkhM=; b=utlZhPJNC+ueg14biXFN0AqL+h
 VRlqxXhZ5JARJx3A3CZ1WzRkwSuNVtpv183gAqnASKpmYqc4NXq2bVe6XyP65k5xN2WDlZLH+0kze
 2Q+qBqing4+SQowHD/odxHrheDM3zTpx+OdVHtbGlL7FdscQs99nVwjfIqjsdCCR6LLY895IIU08h
 wv1bRZchKu0eKFxaKWglmvOJTstRq4pCLA5lrbeAWYrU1IbS1IK49z2njjeYIMf6daAEcIqEC0axu
 OJGLW7Ps04g57Jql2e0gxSbTd2FULLVB3uKcYWq62kiN0tJJXPuUlFvKNtDCn4BYivh2Fq/2xN2Hy
 z6HpO8xRUXviWxuJAWoGWbOtm+tYOIT/a/OPOzEC7uKXfyw+m3r2Tg9LfY7/ewh1Ie1BrbI72zgZX
 dHAhSfTmOtr4MYIxh0dwHtbjj0lokLpfI636AKffe76ZrwTYqPg+BptH4DvNfRhqybTYg4kuGFAYf
 njhXniRFf1GrZ85E2r86TmgH;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rVepD-00B5MN-0x for samba-technical@lists.samba.org;
 Thu, 01 Feb 2024 21:42:23 +0000
Date: Thu, 1 Feb 2024 21:42:20 +0000
To: samba-technical@lists.samba.org
Subject: Re: Question for time based group membership in FL 2016
Message-ID: <20240201214220.525418b1@devstation.samdom.example.com>
In-Reply-To: <728bedf6-dcf3-4006-b73d-9331db2b8777@gmail.com>
References: <14cf1029-2378-489d-bf9b-844ed9d67081@kania-online.de>
 <6d845bb3-3348-4025-abec-e749287d7392@catalyst.net.nz>
 <728bedf6-dcf3-4006-b73d-9331db2b8777@gmail.com>
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

On Thu, 1 Feb 2024 22:16:35 +0100
Kees van Vloten via samba-technical <samba-technical@lists.samba.org>
wrote:

> 
> On 01-02-2024 21:38, Douglas Bagnall via samba-technical wrote:
> > On 2/02/24 07:22, Stefan Kania via samba-technical wrote:
> >> Hi to all,
> >>
> >> I already posted the question in the samba-mailinlist but I think 
> >> it's more a question for developers :-)
> >>
> >> I have a question about FL 2016 and if samba supports it. If yes,
> >> how can I use it without powershell.
> >>
> >> In FL 2016 there is the possibility to put a user into a group and 
> >> the membership is time based. So I could put the user Foo into the 
> >> group 'domain admins' for 30 minutes and after 30 minutes the
> >> system will remove user foo from the group.
> >
> > That sounds good. We don't do that, and we don't call it part of 
> > "functional level 2016".
> >
> > The things that count as "functional level" are listed here:
> >
> > https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/active-directory-functional-levels 
> >
> >
> > They are protocol level things -- supporting FL2016 means you can 
> > properly be a DC in an FL2016 domain.
> >
> > Temporary memberships is a useful trick that Windows Server 2016
> > can do, for which FL2016 is necessary, but not sufficient.
> >
> > That's my understanding, at least.
> >
> > Douglas
> >
> >
> Still, if you know what this powershell call changes in the LDAP
> record of the group, the user or elsewhere in LDAP, you can mimic
> this functionality quite easily with a little cron script on the DC.
> 
> I have created a kind similar implementation called auto-lock, where 
> (admin-)users that member of the "autolock" group automatically get 
> disabled at midnight every day 
> (https://github.com/kvvloten/samba_integrations/tree/main/domain_controller/manage_scripts#disable-special-users-daily)
> 
> And another piece of cron-scripting makes "password expired" LDAP 
> searchable (which is not the case with the computed attribute 
> "msDS-User-Account-Control-Computed").

That attribute is searchable, it is one of the attributes you have to
explicitly ask for. 

> With this applications like 
> Privacyidea can disallow MFA for users with an expired domain
> password.
> 
> It can't be hard to query some attribute and add or remove a user
> from a group.
> 

Would that it was that easy, but as I said on the samba mailing list, I
am sure the timing is done in code, but I am sure that those wiser than
myself will know.

Rowland





