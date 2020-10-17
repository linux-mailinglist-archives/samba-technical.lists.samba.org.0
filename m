Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AC85E290E70
	for <lists+samba-technical@lfdr.de>; Sat, 17 Oct 2020 03:20:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=JsULW323fD3lC6ysP92ve7AgTmVWyOAltD4KHVkWUNw=; b=hMu9ncPhke9MrLPKbHDDCp9Y7J
	/LFFOPrQ5nYgGdGhRUEpcp3SYcpQmiJQ21D7EYg4VxSEAuwtJafbin+V0EMNABTFTz6iMiJuCEQ2x
	RnSw1z1ji5050foGNM+t4gVuyXvtV/vw8aKgnc/m2EzyR9WYhNXMi4TUyiWk/ejCD2nsUDv6HAWMx
	XW7g+MA66rwYVo8pReUGV1fI3kOuUBVh6KulL7V6MFhtoHQWR+5LxJssesWF84obZUMyth/k7UUwV
	URNa5kka7CRs1vSjlGNPLD0aK+yL12TgvnAthVnOq2g+ZLDhNE5YbZCMFDRIxXthFGE7V1Un0OBK9
	81hQzf2Q==;
Received: from ip6-localhost ([::1]:26632 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kTatJ-00CUD6-VC; Sat, 17 Oct 2020 01:20:14 +0000
Received: from bedivere.hansenpartnership.com ([96.44.175.130]:46838) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTatD-00CUCz-Th
 for samba-technical@lists.samba.org; Sat, 17 Oct 2020 01:20:10 +0000
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id ACE1412800A4;
 Fri, 16 Oct 2020 18:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1602897603;
 bh=Q9Skzg0MaFvgxNHLwEnXmme9gFK/1DugMgElP2BdHHk=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=u6skfCbPbT8KQIDqEiJivP/EnGiTaEIyqb46GlVVQRzffeh090blK/E2XlpMe3wam
 z3x/IR6Hz6XB+iXgv9lnsiHsKgCWkPB34NkM7nILE+jY6A7BsboSBm/RyITBCzfEhZ
 NUgFSYkhOwXAMPZTuZ5DqatGV80Y+/imclAuQhQg=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id QBZDOTVyTg_y; Fri, 16 Oct 2020 18:20:03 -0700 (PDT)
Received: from jarvis.int.hansenpartnership.com
 (c-73-35-198-56.hsd1.wa.comcast.net [73.35.198.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 4285512800A2;
 Fri, 16 Oct 2020 18:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1602897603;
 bh=Q9Skzg0MaFvgxNHLwEnXmme9gFK/1DugMgElP2BdHHk=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=u6skfCbPbT8KQIDqEiJivP/EnGiTaEIyqb46GlVVQRzffeh090blK/E2XlpMe3wam
 z3x/IR6Hz6XB+iXgv9lnsiHsKgCWkPB34NkM7nILE+jY6A7BsboSBm/RyITBCzfEhZ
 NUgFSYkhOwXAMPZTuZ5DqatGV80Y+/imclAuQhQg=
Message-ID: <2610e928f744fff79d500a5c964f42ffc9650cf3.camel@HansenPartnership.com>
Subject: Re: Clarification around the DCO
To: Jeremy Allison <jra@samba.org>, Greg Kroah-Hartman <greg@kroah.com>, 
 Mike Dolan <mike.dolan@gmail.com>, samba-technical@lists.samba.org
Date: Fri, 16 Oct 2020 18:20:02 -0700
In-Reply-To: <20201017005611.GB360279@jeremy-acer>
References: <a4f34abf8b943b01e0f982e21fe1518009fcc556.camel@HansenPartnership.com>
 <20201017004357.GA360279@jeremy-acer> <20201017005611.GB360279@jeremy-acer>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2020-10-16 at 17:56 -0700, Jeremy Allison via samba-technical
wrote:
> On Fri, Oct 16, 2020 at 05:43:57PM -0700, Jeremy Allison via samba-
> technical wrote:
> > On Fri, Oct 16, 2020 at 04:59:20PM -0700, James Bottomley via
> > samba-technical wrote:
> > 
> > > We'd also be very interested in bringing Samba back into the
> > > fold of projects using unmodified DCOs.  We now have 17 years of
> > > operating experience and for every other modification request
> > > (and there have been many) we've always found a way to add the
> > > needed clarity to the licence of the file instead of the DCO, so
> > > we really think we could help you make this work for Samba as
> > > well.  It would be really great if we could work together to do
> > > this because Samba is the last outlier using a modified DCO and
> > > with it brought inside the fold we'd have a unified front against
> > > the various CA/CLA abuses corporations try from time to time.
> > 
> > I'm not averse to moving to your "standard" DCO, so
> > long as it doesn't mean chasing down everyone to
> > re-submit :-).
> > 
> > Otherwise, renaming ours to "Samba Developer's Declaration"
> > might seem to work also (with proper (C) attribution
> > added of course).
> 
> Ah, I've just remembered *why* we have a difference from
> your "standard" DCO text.
> 
> In our text we have the clause:
> 
> "(e) I am granting this work to this project under the terms of both
> the
>     GNU General Public License and the GNU Lesser General Public
> License
>     as published by the Free Software Foundation; either version 3 of
>     these Licenses, or (at the option of the project) any later
> version."

OK, so legally LGPLv3 and GPLv3 are the same licence: LGPLv3 is GPLv3
with an additional permission.  Your clause (e) effectively requires
GPLv3 with the additional permission on every contribution.

> The reason for this is that Samba as a whole is under
> GPLv3, but there are many useful libraries within Samba
> (talloc, tevent, tdb etc.) that started life as an integral
> part of Samba - so GPLv3, but then external projects wanted
> to use them without being bound by GPLv3 terms, so asked
> us to re-license under LGPLv3.

Right so what you really want is some event to trigger the addition of
the permission that changes the licence from GPL to LGPL.  This more or
less is why the apache model is broad inbound grant coupled with
licensing by the project board to the contributor, so the board
decides.  Without this governance trigger effectively the whole of
Samba is LGPL because every contribution was required to have the
additional permission.

Obviously, a lot of open source projects don't like the apache inbound
!= outbound model (and don't have a real governing board), so something
else has to be the trigger.  The model I've always liked is all code in
X (usually lib/) is under the LGPL, so the trigger is accepting a patch
moving the code under X.  You can see this with the efitools project,
which is under GPLv2 but shares its lib/ code with shim, which is under
BSD-2-Clause.  This is how the licence of efitools copes:

https://git.kernel.org/pub/scm/linux/kernel/git/jejb/efitools.git/tree/COPYING

The trigger is very rudimentary and hasn't really been changed for 8
years, so perhaps we could craft something better for Samba.

> We have done this for a number of our libraries, and will
> probably do this for more in future (I'm expecting our
> async LDAP library tldap will eventually be requested
> to be moved to LGPLv3 once it's matured enough).
> 
> Doing it without clause (e) is a pain, as we have to
> track down all contributors and check if this is OK.
> 
> With our clause (e) it allows us to re-license more
> permissively as required without the burdon of tracking
> down all contributors.
> 
> Hope this explains things better. I doubt you'd want
> something like this inside the Linux DCO (but I'm
> happy to be proven wrong :-).

Well, I think the efitools model above shows it can be done within the
DCO framework so I think we have a basis for exploration of whether
this can work for Samba as well.

James



