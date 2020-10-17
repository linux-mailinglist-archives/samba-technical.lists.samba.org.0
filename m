Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5F2290EA3
	for <lists+samba-technical@lfdr.de>; Sat, 17 Oct 2020 05:41:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=TfjXVnuqp4tXfWT0aAl4zcx21fUcj/1sEMRpKiopJjc=; b=mYpM4+jkPuKsAWNj23b9Ra5X05
	sPWsKi+Wx4qkASwCvEpXHJUb4TAjJ+dqupJJPunEBk3BVRBeMdoc2l6ulfYgWlfHF8tfCy/NZH7Xj
	gxbm4oMNr3tAw9mViDms+dK9s29BUfKpb6Yceaog67SBJnGzMvTMZ30UsiOCuFS5z94DJJdf4MmUj
	3eJ1K2LE2/wFZpIwETk+5skMrzCc6WpHRX7UiSv8AtcnC/UxqNZQwHUk+NG7dTop2TijmmAkBBE1i
	txdA8hzRmLSveyeW2M8dqDy3qKSmckj74yiOSdl0fmcjik3QD5dl7sdEBpYprCWF40ObRfiHA7iNF
	fO2Nz54Q==;
Received: from ip6-localhost ([::1]:30314 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kTd5i-00CUsO-4V; Sat, 17 Oct 2020 03:41:10 +0000
Received: from bedivere.hansenpartnership.com ([96.44.175.130]:48088) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTd5b-00CUsH-Er
 for samba-technical@lists.samba.org; Sat, 17 Oct 2020 03:41:07 +0000
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id A52221280033;
 Fri, 16 Oct 2020 20:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1602906058;
 bh=JF121Db7o5bzZMVzXUIpIJDEML5usaY8Jqoz0a3Et0g=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=lUV1MwJEBPd6jrAHle6qQWe2WkDRCeUSpsrrnXk1lXpdCv8SlYR6F/oTDpceZF8WX
 D4fmB+f+AZgLcWEraUlTOKyJEly4f60fBSQEzDV76Wr5sabhJaAXTz2OBcd2ySEkd4
 Ld6e02/DcKmPnJlCEI/ZNYVk6tXUaPx3EIBDBeF4=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id fNWEzesx8JuA; Fri, 16 Oct 2020 20:40:58 -0700 (PDT)
Received: from jarvis.int.hansenpartnership.com
 (c-73-35-198-56.hsd1.wa.comcast.net [73.35.198.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 41CE41280028;
 Fri, 16 Oct 2020 20:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1602906058;
 bh=JF121Db7o5bzZMVzXUIpIJDEML5usaY8Jqoz0a3Et0g=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=lUV1MwJEBPd6jrAHle6qQWe2WkDRCeUSpsrrnXk1lXpdCv8SlYR6F/oTDpceZF8WX
 D4fmB+f+AZgLcWEraUlTOKyJEly4f60fBSQEzDV76Wr5sabhJaAXTz2OBcd2ySEkd4
 Ld6e02/DcKmPnJlCEI/ZNYVk6tXUaPx3EIBDBeF4=
Message-ID: <b4ffa63890d179b7f532e64b840b031f0e4dc422.camel@HansenPartnership.com>
Subject: Re: Clarification around the DCO
To: Jeremy Allison <jra@samba.org>
Date: Fri, 16 Oct 2020 20:40:57 -0700
In-Reply-To: <20201017032130.GC360279@jeremy-acer>
References: <a4f34abf8b943b01e0f982e21fe1518009fcc556.camel@HansenPartnership.com>
 <20201017004357.GA360279@jeremy-acer> <20201017005611.GB360279@jeremy-acer>
 <2610e928f744fff79d500a5c964f42ffc9650cf3.camel@HansenPartnership.com>
 <20201017032130.GC360279@jeremy-acer>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
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
From: James Bottomley via samba-technical <samba-technical@lists.samba.org>
Reply-To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Greg Kroah-Hartman <greg@kroah.com>, Mike Dolan <mike.dolan@gmail.com>,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2020-10-16 at 20:21 -0700, Jeremy Allison wrote:
> On Fri, Oct 16, 2020 at 06:20:02PM -0700, James Bottomley wrote:
> > On Fri, 2020-10-16 at 17:56 -0700, Jeremy Allison via samba-
> > technical
> > > Ah, I've just remembered *why* we have a difference from
> > > your "standard" DCO text.
> > > 
> > > In our text we have the clause:
> > > 
> > > "(e) I am granting this work to this project under the terms of
> > > both the
> > >     GNU General Public License and the GNU Lesser General Public
> > > License
> > >     as published by the Free Software Foundation; either version
> > > 3 of
> > >     these Licenses, or (at the option of the project) any later
> > > version."
> > 
> > OK, so legally LGPLv3 and GPLv3 are the same licence: LGPLv3 is
> > GPLv3 with an additional permission.  Your clause (e) effectively
> > requires GPLv3 with the additional permission on every
> > contribution.
> > 
> > > The reason for this is that Samba as a whole is under
> > > GPLv3, but there are many useful libraries within Samba
> > > (talloc, tevent, tdb etc.) that started life as an integral
> > > part of Samba - so GPLv3, but then external projects wanted
> > > to use them without being bound by GPLv3 terms, so asked
> > > us to re-license under LGPLv3.
> > 
> > Right so what you really want is some event to trigger the addition
> > of the permission that changes the licence from GPL to LGPL.  This
> > more or less is why the apache model is broad inbound grant coupled
> > with licensing by the project board to the contributor, so the
> > board decides.  Without this governance trigger effectively the
> > whole of Samba is LGPL because every contribution was required to
> > have the additional permission.
> > 
> > Obviously, a lot of open source projects don't like the apache
> > inbound != outbound model (and don't have a real governing board),
> > so something else has to be the trigger.  The model I've always
> > liked is all code in X (usually lib/) is under the LGPL, so the
> > trigger is accepting a patch moving the code under X.  You can see
> > this with the efitools project, which is under GPLv2 but shares its
> > lib/ code with shim, which is under BSD-2-Clause.  This is how the
> > licence of efitools copes:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/jejb/efitools.git/tree/COPYING
> > 
> > The trigger is very rudimentary and hasn't really been changed for
> > 8 years, so perhaps we could craft something better for Samba.
> > 
> > Well, I think the efitools model above shows it can be done within
> > the DCO framework so I think we have a basis for exploration of
> > whether this can work for Samba as well.
> 
> OK, at this point I error out with IANAL, sorry :-).

Heh, that's OK, I've been talking DCO processes with Lawyers for an
incredibly long time ... something rubbed off.

> I think this would be better done via discussions
> between lawyers. In the meantime the quickest
> way to get to a non-conflicting situation is
> to change our name to "Samba Developer's Declaration"
> (if everyone on the Team agrees) and add the CC-By-SA
> (C) notice so we're fully in compliance.
> 
> Better minds than I can then work in the background
> to try and unify what we need with the existing DCO.
> 
> Sounds like a plan ?

Certainly.  I was just exploring willingness to seek a unification with
the current DCO process ... I fully accept that it requires mature
consideration on all sides to ensure it goes smoothly and nothing is
forgotten, so there's absolutely no need to rush it.

James



