Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3EA290E66
	for <lists+samba-technical@lfdr.de>; Sat, 17 Oct 2020 02:56:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=b8Aam0TXwDjLrkeoDL0s/CqEmucXhtvAjjo0f/idqB8=; b=hZnkA8/JHZRM0hcwlABZQuy108
	e3uYo8HNO6WWYBDS5yPmvsDTJHn6q0TlZtQdZTqkLN2QNeAC6tbAeKJw8hEGVU3sObhDE4NykZvYX
	XJa95eAr/uYS9PMhyYDl+UjS+J9jAVINRprRdGlpMeGm1Tb1ggZTnPuI9Zb8Dx6v2uhUCqyqdigy2
	H1a6Nt+3Pp6YX7kIHP0s6uMOPuCqURNaS/ctFBE/K83RcesvCnn5/p2WXTb43agecbPnsp3PbCRW7
	h989EcMhxVyvZZoWtaWNnfa/IjU+BcDmjaTUrg/n+OXfcJRL+bID6palxUbFGrk6Z4aMU9Nh9uv4h
	06e0Ws6w==;
Received: from ip6-localhost ([::1]:25160 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kTaWB-00CTzb-E6; Sat, 17 Oct 2020 00:56:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:65124) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTaW7-00CTzU-FA
 for samba-technical@lists.samba.org; Sat, 17 Oct 2020 00:56:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=b8Aam0TXwDjLrkeoDL0s/CqEmucXhtvAjjo0f/idqB8=; b=NAhBNFmy49jxEQt6lLZUnh13Br
 Z13rrClGQhDt2HwslNu9nF0IkB2YPdKkkUeYQPiaRH7VzskeuR2Z32FfVWkYxaBPtd1zMbvixSi2A
 +1aih+ckPsv66g+g+GBFHgjr/mLNnA/l5DRt6QzNuhkk/L/u0ZBJZPGfLY294MGNjQtzg5XSbKjjD
 PuJkyJ88C6l8UicUZ+DM/T95MPTLUCJWuQL3JsMRv43sYs7oFeBQK+4wOTzpi8e8slCQaCvgM+qEo
 zOVE84F/xMWeyS4PCY2LCf3smkMnQ7/DwYmoF6q/WG8Ee91SNthkxUuGJN8BkB+58Numc9PCGB2lh
 /bCCtGezG81qaxIa7HFYPaco/RSwGwN07WOq9S440mwH+k9VA7WxmJsxdV8LzpJ8MuzxOs6PtfT3w
 pS4Nv4k2TmQpP/5KfsnGlUmwHAojxb+IYq65N+QX7QjGynaHwO2gJq4ddRdFx8tNdNNlFpGR/14Up
 +UmuTlzAm15wbvnvQ3nF9TXR;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTaW6-0007nE-Fg; Sat, 17 Oct 2020 00:56:14 +0000
Date: Fri, 16 Oct 2020 17:56:11 -0700
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 Greg Kroah-Hartman <greg@kroah.com>,
 Mike Dolan <mike.dolan@gmail.com>, samba-technical@lists.samba.org
Subject: Re: Clarification around the DCO
Message-ID: <20201017005611.GB360279@jeremy-acer>
References: <a4f34abf8b943b01e0f982e21fe1518009fcc556.camel@HansenPartnership.com>
 <20201017004357.GA360279@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201017004357.GA360279@jeremy-acer>
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
Cc: jra@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Oct 16, 2020 at 05:43:57PM -0700, Jeremy Allison via samba-technical wrote:
> On Fri, Oct 16, 2020 at 04:59:20PM -0700, James Bottomley via samba-technical wrote:
> 
> > We'd also be very interested in bringing Samba back into the
> > fold of projects using unmodified DCOs.  We now have 17 years of
> > operating experience and for every other modification request (and
> > there have been many) we've always found a way to add the needed
> > clarity to the licence of the file instead of the DCO, so we really
> > think we could help you make this work for Samba as well.  It would be
> > really great if we could work together to do this because Samba is the
> > last outlier using a modified DCO and with it brought inside the fold
> > we'd have a unified front against the various CA/CLA abuses
> > corporations try from time to time.
> 
> I'm not averse to moving to your "standard" DCO, so
> long as it doesn't mean chasing down everyone to
> re-submit :-).
> 
> Otherwise, renaming ours to "Samba Developer's Declaration"
> might seem to work also (with proper (C) attribution
> added of course).

Ah, I've just remembered *why* we have a difference from
your "standard" DCO text.

In our text we have the clause:

"(e) I am granting this work to this project under the terms of both the
    GNU General Public License and the GNU Lesser General Public License
    as published by the Free Software Foundation; either version 3 of
    these Licenses, or (at the option of the project) any later version."

The reason for this is that Samba as a whole is under
GPLv3, but there are many useful libraries within Samba
(talloc, tevent, tdb etc.) that started life as an integral
part of Samba - so GPLv3, but then external projects wanted
to use them without being bound by GPLv3 terms, so asked
us to re-license under LGPLv3.

We have done this for a number of our libraries, and will
probably do this for more in future (I'm expecting our
async LDAP library tldap will eventually be requested
to be moved to LGPLv3 once it's matured enough).

Doing it without clause (e) is a pain, as we have to
track down all contributors and check if this is OK.

With our clause (e) it allows us to re-license more
permissively as required without the burdon of tracking
down all contributors.

Hope this explains things better. I doubt you'd want
something like this inside the Linux DCO (but I'm
happy to be proven wrong :-).

Jeremy.

