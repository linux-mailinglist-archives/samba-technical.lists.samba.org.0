Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8F43482D7
	for <lists+samba-technical@lfdr.de>; Wed, 24 Mar 2021 21:23:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=yjv9wCQCwo7j5JtZxFVeE+pZCblzzpYoyUVRpkx0aNI=; b=l6JGm6kkR7sZf7NazF1xs6c7ev
	tkq/yFX8KPneiX7dlQqwW/PSYP5KSzFG/z0qGTPrt7e3gY2t8miR7791ybn1h3Z6sOS9RRhF5xLY9
	HcHtik8Hv6mq5aLZR3Tu5GO96nCzFud9qRT7IBjD496zoEIEx4/ABun7CKd/mA9o4yXCVbAJ/cSPm
	F8dxGx2iaCtLoNs8d5ZicCcYtHxJaqiZcWIgRhnWnJZT7WOtD+i29ERbtC8WQOsw3hpzPdm4/WTGf
	0qdQarQd2PeTa2V3q3RQb7cDK6bmmgbp9ca1+Omq8eqcR6lNPLQr9rbYBHAyZ2s1HgWOJ+9xSqtya
	79P3GRVA==;
Received: from ip6-localhost ([::1]:51786 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lPA2g-006eMc-Ha; Wed, 24 Mar 2021 20:23:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28462) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lPA2c-006eMV-6c
 for samba-technical@lists.samba.org; Wed, 24 Mar 2021 20:23:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=yjv9wCQCwo7j5JtZxFVeE+pZCblzzpYoyUVRpkx0aNI=; b=TQEaCr1UUjGNS+pXy2IJrIRZm5
 EbaXrUEq+uZapFuq7f+m89qgqKn3y+6xk0yruuupXfLp9oJlpbM31xCy7S7Ttn9N+QKUE4NmtZ+T5
 IpmzkIH3TzRd4JOlSlgAa49RIlrzjaeJPfovq/rHsBZAzi47J/YDDVpwXmqmPOnXZLI5Bs/wWJGTw
 HpzWl/dgUyXkLiKaD6TccKR7V0RLTMGdCTfZmAUfC0fu9C0r/1332SWl0BP2/WM+D55HmjiSTTklR
 ZRly+GTItJDEd1cyx2VbL0dapmTBwgaOpU5M38QGYmXucVY4vkzJB29RNeDX9CmEwTWZo3JsukSLo
 P05raJNgtvfnCZyjIk0r3Yxg9WODgUHzKL9Nm/G70XajZA/48NOSX6iKk4c7LlF/Ot10D8h2m+5aF
 EDaMqoz2z8+XGMxIUumftGDYkgl3Gege51ISTiSt3nSlVHNa2JhLRwON8iOqzIhFpKqsf4CHY8OYZ
 Gecw/jZllB9YK8/kT8Dbng3G;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lPA2a-0008Gi-FC; Wed, 24 Mar 2021 20:23:45 +0000
Message-ID: <190c273a00fe5b37f6dd494d4296acfcceb2ca2b.camel@samba.org>
Subject: Re: Drop NIS support
To: Rowland penny <rpenny@samba.org>, Ralph Boehme <slow@samba.org>, 
 samba-technical@lists.samba.org
Date: Thu, 25 Mar 2021 09:23:41 +1300
In-Reply-To: <4e8cd599-96e5-361d-28c7-ff26082a7644@samba.org>
References: <4045140.l1vqqZ3lm0@magrathea>
 <20210324161244.GB818616@jeremy-acer>
 <3742e07eba544478383ae1a7e9e56197beb12616.camel@samba.org>
 <359f492d-7dbd-2e95-1c8c-3178d9e51344@samba.org>
 <5f50518b-d317-f5ff-d9dd-a34497c21873@samba.org>
 <4e8cd599-96e5-361d-28c7-ff26082a7644@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2021-03-24 at 20:16 +0000, Rowland penny via samba-technical
wrote:
> On 24/03/2021 20:11, Ralph Boehme wrote:
> > Am 3/24/21 um 6:57 PM schrieb Rowland penny via samba-technical:
> > > On 24/03/2021 17:52, Andrew Bartlett via samba-technical wrote:
> > > > On Wed, 2021-03-24 at 09:12 -0700, Jeremy Allison via samba-
> > > > technical
> > > > wrote:
> > > > > On Wed, Mar 24, 2021 at 05:10:15PM +0100, Andreas Schneider
> > > > > via
> > > > > samba-technical wrote:
> > > > > > Hi,
> > > > > > 
> > > > > > could we drop NIS support for Samba 4.15?
> > > > > > 
> > > > > > This means getting rid of lib/replace/system/nis.h and
> > > > > > yp_*() ...
> > > > > +1 from me. Let's see if anyone else is still
> > > > > using it.
> > > > > 
> > > > > So the current list for 4.15 will be Tru64, HPUX, NIS.
> > > > > 
> > > > > Any more for any more ?
> > > > Just to be clear to others, this is not the so-called NIS
> > > > support in
> > > > the AD DC which at one point helped Active Directory Users and
> > > > Computers managed the rfc2307 user attributes.
> > > > 
> > > > I'm happy for the real NIS support to go.
> > > > 
> > > > In terms of other things to trim, what about some of the
> > > > printing
> > > > modes?
> > > > 
> > > > Andrew Bartlett
> > > > 
> > > How about idmap_hash ? The one that says 'DO NOT USE THIS
> > > BACKEND' at 
> > > the top of its manpage.
> > 
> > ...unless you know what you're doing.
> > 
> > There are folks out there using this at scale so removing this is
> > not 
> > really something we should consider.
> > 
> > -slow
> > 
> 
> Well according to the manpage 'DO NOT USE THIS BACKEND', they
> shouldn't 
> be using it, you cannot have it both ways. 

Rowland, the 'on new installations' is silent, but implied. 

> Either it shouldn't be used, 
> or those warnings need to be removed from the manpage.

The world is not always so black and white (and would be far more
boring if it was). 

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions






