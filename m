Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D23A4185693
	for <lists+samba-technical@lfdr.de>; Sun, 15 Mar 2020 00:29:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=UwNRVlIPIlIiPkmnS1MEy3TrJDTv3AFogXXwmbGiRYA=; b=OeExJhV1t3jl5yriZ7lTupIipp
	gS5QCoenUfhU9lz5vq34pD9Zf06g9oT9cVgeDaFuq0Ej1ORDg7rqgB9DCYbNq98Sla/h62QmMLSwr
	ItLepHlmInB1MjLLj23qSw7UqM+GTNZ3JGhW1oR6wJKTkEPGrUucfHU1RZ3OHH7svfzyf8T2S8NMk
	o4CtxbyPdu9o9Ub3TweWLU03xOpxASvkR7jm5D+hJx6AJdKEV6d9kGpO5Ec+12ZvSr9D6BLRIgIkN
	rouOsCIfca2VZv8RIeVTUKPe1fR0wOtLJWs29fZBZGqlaAvOyXHZDhqlGCp8q9BYcmROFcPe+qyoV
	Nkw7HHkg==;
Received: from ip6-localhost ([::1]:20014 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jDGD7-00G8Z5-PX; Sat, 14 Mar 2020 23:28:53 +0000
Received: from [80.20.169.36] (port=56043 helo=mail.promoturviaggi.com) 
 by hr1.samba.org with smtp (Exim) id 1jDGD3-00G8Yy-46
 for samba-technical@lists.samba.org; Sat, 14 Mar 2020 23:28:51 +0000
Received: (qmail 7970 invoked by uid 121); 15 Mar 2020 00:28:44 +0100
Received: from 172.16.1.1 (dario.lesca@solinos.it@172.16.1.1) by
 albatros.promoturviaggi.com (envelope-from <d.lesca@solinos.it>,
 uid 89) with qmail-scanner-2.08 
 (clamdscan: 0.98.6/25750. spamassassin: 3.3.1.  
 Clear:RC:0(172.16.1.1):SA:0(-102.5/5.0):. 
 Processed in 0.241086 secs); 14 Mar 2020 23:28:44 -0000
Received: from unknown (HELO dodo.home.solinos.it)
 (dario.lesca@solinos.it@172.16.1.1)
 by mail.promoturviaggi.com with SMTP; 15 Mar 2020 00:28:43 +0100
Message-ID: <41352d32909c30a5d95b978fe1d2d95b60976892.camel@solinos.it>
Subject: Re: Samba 4.12 rc3: bind DNS say "named: client update denied"
To: samba-technical@lists.samba.org
Date: Sun, 15 Mar 2020 00:28:43 +0100
In-Reply-To: <d4433de2-ceed-dc73-6440-1b8aebf21d49@samba.org>
References: <a144cd2c0219399cea4473f6cf7e86b3dba5d6cf.camel@solinos.it>
 <20200309100715.GK2735275@onega.vda.li>
 <dad25a37497ed4d4b70829925da512b3abb4eb39.camel@solinos.it>
 <52a0f365-579c-5adc-a470-7cf543a0c868@samba.org>
 <2ee4998776b6d690b9f458cdfca7c11626e86784.camel@solinos.it>
 <1e12e848-3540-7651-8712-752600680296@samba.org>
 <0d5fc070b38d2ca948588126848613835255cc6d.camel@solinos.it>
 <d4433de2-ceed-dc73-6440-1b8aebf21d49@samba.org>
Organization: Solinos
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
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
From: Dario Lesca via samba-technical <samba-technical@lists.samba.org>
Reply-To: Dario Lesca <d.lesca@solinos.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Il giorno sab, 14/03/2020 alle 17.42 +0000, Rowland penny via samba-
technical ha scritto:
> > The Windows are the client.
> > Why you say "a Windows DC" ? what does it mean?
> 
> Just what it says, a DC running on Windows.
> 
In my case, there is none Windows Domain Controller here.
The DC is a Samba DC 4.12.0.

Windows are clients (win10a and win10b), and when I join it to samba
DC, record A is not added to DNS zone.

Now I know this should happen, and if it doesn't and my configuration
is right, it's a bug.

> > Yes I have do that initially.
> > But now the record it's gone, I have remove it and I have un-join and
> > re-join the win10a pc and join the new win10b
> I am a bit confused here, is it the Samba DC's dns records that are not 
> getting created, or is it the Windows client records ?

The Samba DC's DNS records is OK, it is already entered in the DNS.

It is the Windows clients records which is not insert into DNS when
client are join to domain.

> > > You are using the Fedora packages to provision a DC,
> > Yes I use the Fedora packages for test it.
> Thanks for testing them, but be aware that there are major problems with 
> the Fedora packages, that is why they are marked experimental.
> > > it looks like you might just have found another reason not use them
> > > for a DC ;-)
> > No eventually, if so, I have found another reason to fill a bug on
> > RedHat Bugzilla.
> Possibly, but it is Samba's code and if it is a bug, you should report 
> it to Samba, not Red Hat.
Ok, if this is a bug, I will do so, see below 

> > Since you tell me it should do it, this is a bug
> I am not entirely sure it is a bug, it may be, but further testing is 
> required.

The Technical details reported in this tread by Alexander Bokovoy (both
updateacl and ssutable are NULL) shows why the record insertion fails.

Can this be considered a bug and explain what happens and why the
insert fails?

If yes I will fill the bugs.
if no, in the next few days I will do it all over again, without using
the dhcp script for adding dns names, and see if the name will be added
to the DNS zone when joining the PCs

Many thanks

-- 
Dario Lesca
(inviato dal mio Linux Fedora 31 Workstation)


