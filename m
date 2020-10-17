Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 303B2290E9C
	for <lists+samba-technical@lfdr.de>; Sat, 17 Oct 2020 05:22:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=prOtWH0taPNTAJGabMVTgcQjkFZE8OS89ouljJcyb5k=; b=0eBL16U0dg46eX55ODpA0TLYMj
	dUBlcYDIA4x45iGAYbSMZeCn0dICrFpXErHGkczWJS4CKtRqotK7UBNwdU0mEM2qb4Cja0UrUDqOJ
	R/b+chrpQWclrWeKySXLB3jIb/nvRNzhz3igoIF3ahS6VEQS5Fa78C8fwfG46SdWMGZTM+kQlJbKn
	6MCcfAWh8DdZh3QdjrAxKHt5By/pNSC9CRSpTKBqas3Xppn6h6qHpL2+vnpQYVETcxYqFobrKzeEC
	j9rukxgZn7Em+/KSoc/S/xV5ZujsU7PHc305AoDMLhYzjOtgV5wluIrSLnwViYe/YXzlVijJ12h4W
	0jcwBC1w==;
Received: from ip6-localhost ([::1]:28140 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kTcmr-00CUYh-ED; Sat, 17 Oct 2020 03:21:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45068) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTcmm-00CUYa-Ui
 for samba-technical@lists.samba.org; Sat, 17 Oct 2020 03:21:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=prOtWH0taPNTAJGabMVTgcQjkFZE8OS89ouljJcyb5k=; b=XPnXEo5dzn3szU0XWbeh2p+PM6
 X224XVBlN+l3ODqktoQQDl59r/Mgpa98P4r/7DeCumh2bqaHohn6geT1/sFVqZHxPHSUWpkl9EhR+
 iRtdCLLD8B5MxAk5YfLWum9kS2VG1xgJJUz+ErTGEqQSnFKcce+jRGepXq3oirD/+VRjdtMQxnwmI
 FXWelYVxF9hgn8cnRt3YiVwFaYe9xXlbha/SY2WuWPIefYIuzLFjxaZnC1YfJFc0om49TZKPPTh8y
 AK7ff+yj7kmoBfcW8/N/u1OkscqsAuH434AUchgKqfapwT49Cl1dCFfNcwdvBsbKe4crH6xU08vEO
 QnQjGv2ESaVxLWqZiQA356hC9VmaqCUQCAzfCeVPc0Tq9s8BnApKR/ahoXxuX4J0ofVHbmBfLOwVH
 sALNbkv/n2snXgDZ3miJXL+s44WUg1vke8gNEgSeHy5ARDsEjPb8gDl4+h2Z56NFgBpZvpI9gSFqu
 EM+g7VzRk8w0TLYkdgN/jwP/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTcmj-00008O-M9; Sat, 17 Oct 2020 03:21:34 +0000
Date: Fri, 16 Oct 2020 20:21:30 -0700
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Clarification around the DCO
Message-ID: <20201017032130.GC360279@jeremy-acer>
References: <a4f34abf8b943b01e0f982e21fe1518009fcc556.camel@HansenPartnership.com>
 <20201017004357.GA360279@jeremy-acer>
 <20201017005611.GB360279@jeremy-acer>
 <2610e928f744fff79d500a5c964f42ffc9650cf3.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2610e928f744fff79d500a5c964f42ffc9650cf3.camel@HansenPartnership.com>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Greg Kroah-Hartman <greg@kroah.com>, Mike Dolan <mike.dolan@gmail.com>,
 samba-technical@lists.samba.org, jra@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Oct 16, 2020 at 06:20:02PM -0700, James Bottomley wrote:
> On Fri, 2020-10-16 at 17:56 -0700, Jeremy Allison via samba-technical
> > Ah, I've just remembered *why* we have a difference from
> > your "standard" DCO text.
> > 
> > In our text we have the clause:
> > 
> > "(e) I am granting this work to this project under the terms of both
> > the
> >     GNU General Public License and the GNU Lesser General Public
> > License
> >     as published by the Free Software Foundation; either version 3 of
> >     these Licenses, or (at the option of the project) any later
> > version."
> 
> OK, so legally LGPLv3 and GPLv3 are the same licence: LGPLv3 is GPLv3
> with an additional permission.  Your clause (e) effectively requires
> GPLv3 with the additional permission on every contribution.
> 
> > The reason for this is that Samba as a whole is under
> > GPLv3, but there are many useful libraries within Samba
> > (talloc, tevent, tdb etc.) that started life as an integral
> > part of Samba - so GPLv3, but then external projects wanted
> > to use them without being bound by GPLv3 terms, so asked
> > us to re-license under LGPLv3.
> 
> Right so what you really want is some event to trigger the addition of
> the permission that changes the licence from GPL to LGPL.  This more or
> less is why the apache model is broad inbound grant coupled with
> licensing by the project board to the contributor, so the board
> decides.  Without this governance trigger effectively the whole of
> Samba is LGPL because every contribution was required to have the
> additional permission.
> 
> Obviously, a lot of open source projects don't like the apache inbound
> != outbound model (and don't have a real governing board), so something
> else has to be the trigger.  The model I've always liked is all code in
> X (usually lib/) is under the LGPL, so the trigger is accepting a patch
> moving the code under X.  You can see this with the efitools project,
> which is under GPLv2 but shares its lib/ code with shim, which is under
> BSD-2-Clause.  This is how the licence of efitools copes:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/jejb/efitools.git/tree/COPYING
> 
> The trigger is very rudimentary and hasn't really been changed for 8
> years, so perhaps we could craft something better for Samba.
>
> Well, I think the efitools model above shows it can be done within the
> DCO framework so I think we have a basis for exploration of whether
> this can work for Samba as well.

OK, at this point I error out with IANAL, sorry :-).

I think this would be better done via discussions
between lawyers. In the meantime the quickest
way to get to a non-conflicting situation is
to change our name to "Samba Developer's Declaration"
(if everyone on the Team agrees) and add the CC-By-SA
(C) notice so we're fully in compliance.

Better minds than I can then work in the background
to try and unify what we need with the existing DCO.

Sounds like a plan ?

Jeremy.

