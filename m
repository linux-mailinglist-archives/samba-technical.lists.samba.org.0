Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B52E290E6D
	for <lists+samba-technical@lfdr.de>; Sat, 17 Oct 2020 03:06:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=PHDRM7OelU0PhmPXnT/yGmr5NxyifjGO3NA7LjaHKyc=; b=wez2lNl4is5EEmLQK6/9ZJod/6
	NUI8v8D/nOwwGsjMy9Qi+9bjLplxmGr0uYxSVOpQJOF+M5QG9FoZeZRXz+vulO+FTYSKQ6DqdyIYN
	t88t4g776IzmPvbJLZSB32IZLFFPHsxMoyTnOEeyIp5hVrcTOJehyEPKVW+P0GricCWy9H1y74Cfs
	upYeL2YpYn5TewOIhlkD5eVsqSqSkC891X5YGQ3Lr2o/wIdzlvnN/Dv5iaFa2qPi5Ye2CD0JemtEW
	x5J1VIBskBvl1zhVBshnrJvdQMhpPg3Ywy7emVxEh+X498W7JT3gZRTnjrAkcU/PKFKgqljL3tqsk
	7r9eSRjw==;
Received: from ip6-localhost ([::1]:25906 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kTafF-00CU6F-KY; Sat, 17 Oct 2020 01:05:41 +0000
Received: from bedivere.hansenpartnership.com ([96.44.175.130]:46662) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTaf5-00CU68-6G
 for samba-technical@lists.samba.org; Sat, 17 Oct 2020 01:05:38 +0000
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id 8AEFD1280F6B;
 Fri, 16 Oct 2020 18:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1602896709;
 bh=i6hhSBpiwaFu5Fg/dfygh1DrlCKeH/KegXNy5onIR6o=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=Tq4DkRe3LR7VJ/HFCxy8YhzDEQrL86ABYrqnecxlScyZTpwjwT/JJDu5tVFR2MrIq
 buNVP1+d3t4fz4+lJRZmKiPkGjoHC0MIvHfKrbD7T8gjZpOYyVJiDRzlshczYjaTxx
 wDrzTmeU4c1cHD8aFsS0oOqa39boEF0VQZScFhCo=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id nloHvRuGfTyT; Fri, 16 Oct 2020 18:05:09 -0700 (PDT)
Received: from jarvis.int.hansenpartnership.com
 (c-73-35-198-56.hsd1.wa.comcast.net [73.35.198.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 2922D1280F63;
 Fri, 16 Oct 2020 18:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1602896709;
 bh=i6hhSBpiwaFu5Fg/dfygh1DrlCKeH/KegXNy5onIR6o=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=Tq4DkRe3LR7VJ/HFCxy8YhzDEQrL86ABYrqnecxlScyZTpwjwT/JJDu5tVFR2MrIq
 buNVP1+d3t4fz4+lJRZmKiPkGjoHC0MIvHfKrbD7T8gjZpOYyVJiDRzlshczYjaTxx
 wDrzTmeU4c1cHD8aFsS0oOqa39boEF0VQZScFhCo=
Message-ID: <8e21b36ee0caf95310534f939173210d7e03d21c.camel@HansenPartnership.com>
Subject: Re: Clarification around the DCO
To: Jeremy Allison <jra@samba.org>
Date: Fri, 16 Oct 2020 18:05:08 -0700
In-Reply-To: <20201017004357.GA360279@jeremy-acer>
References: <a4f34abf8b943b01e0f982e21fe1518009fcc556.camel@HansenPartnership.com>
 <20201017004357.GA360279@jeremy-acer>
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

On Fri, 2020-10-16 at 17:43 -0700, Jeremy Allison via samba-technical
wrote:
> On Fri, Oct 16, 2020 at 04:59:20PM -0700, James Bottomley via samba-
> technical wrote:
> > I noticed the thread you had about Renaming the Samba DCO:
> > 
> > https://marc.info/?t=160278497300001
> > 
> > The kernel developers have spent nearly two decades trying to
> > develop and refine the DCO process so that any inbound=outbound
> > project can use it in place of a more formal signed contributor
> > agreement.  When you introduce a novel legal concept like this, the
> > key to getting it to work is to have broad unanimity about what
> > you're doing and why ... in the case of the DCO this is what the
> > DCO actually says and what Signed-off-by: means.  To that end we've
> > invested a lot of effort in trying to prevent DCO fragmentation,
> > which is why the licence of the current DCO says
> > 
> >    Everyone is permitted to copy and distribute verbatim copies of
> > this
> >    license document, but changing it is not allowed.
> > 
> > Firstly, in the above thread there was some confusion about who
> > could use the name DCO with a lot of other projects being
> > cited.  Every other project you referred to is an unmodified DCO
> > user and thus is fully entitled to use the name DCO as well ... we
> > encourage this unmodified reuse to keep a unitary DCO ecosystem and
> > spread its utility to other projects.  However, since Samba
> > modified the DCO, you don't fall into this category.
> > 
> > Secondly, Bradley dug up an older version of the DCO which had this
> > licence
> 
> Yes, that was the version I originally based ours on.
> I thought it was a really good idea :-). I called it
> our "DCO" as I just assumed that's what such things
> were called.
> 
> >    The Developer's Certificate of Origin 1.0 is licensed under a
> >    Creative Commons Attribution-ShareAlike 2.5 License. If you
> > modify
> >    you must use a name or title distinguishable from "Developer's
> >    Certificate of Origin" or "DCO" or any confusingly similar name.
> 
> Yeah, I didn't notice that bit :-).
> 
> > So if you want to keep your modified version you may, provided you
> > endeavor to respect that condition of not having a similar name.
> 
> I was a little concerned about the effect that changing
> our text might have on people/companies who have already
> sent in our text.
> 
> I don't want to have to get re-submissions from everyone,
> as I hope you can understand.

Absolutely.  If you manage to go with a standard DCO it would be
because it fits your retroactive needs without having to do any
resubmission.

> We provisionally came up with a name of "Samba Developer's
> Declaration" which would seem to satify the "different name"
> criteria.

Yes, I don't disagree (hey, double negative ... being around lawyers is
rubbing off on me).

> > We'd also be very interested in bringing Samba back into the
> > fold of projects using unmodified DCOs.  We now have 17 years of
> > operating experience and for every other modification request (and
> > there have been many) we've always found a way to add the needed
> > clarity to the licence of the file instead of the DCO, so we really
> > think we could help you make this work for Samba as well.  It would
> > be really great if we could work together to do this because Samba
> > is the last outlier using a modified DCO and with it brought inside
> > the fold we'd have a unified front against the various CA/CLA
> > abuses corporations try from time to time.
> 
> I'm not averse to moving to your "standard" DCO, so
> long as it doesn't mean chasing down everyone to
> re-submit :-).

OK, so lets work on that then.

Regards,

James

> Otherwise, renaming ours to "Samba Developer's Declaration"
> might seem to work also (with proper (C) attribution
> added of course).
> 
> Cheers,
> 
> Jeremy.
> 



