Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7DA1F4598
	for <lists+samba-technical@lfdr.de>; Tue,  9 Jun 2020 20:18:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=PGNk/vbz2vIM+NO4RJuYb16I92TyuMdjx3ofAfKQvio=; b=eZaKgavQnBEqVNxog3gE0YXlbX
	1IcNvKtYbsRUYVWIUeHIod/CQEYlN4etc4Xp1zIWZeYJikeUpaJPeXTta57nwdApE6KtSAu3rJ+n4
	79rsH4gMb9K0IWV3O9XHSQyn8pTP0slcmte52n/CiKGMprjqAjEViMtpXcBntqAVIIroGV8i/5yhy
	zdrN6DKA33iqad8D8iV/V/igk0pRkDiOb9kbFkAe1CVqgzXLozQV7pLBhzp+HuwiciZtRdtkwB8mK
	TvoYzb7PRLSx9xuQzd7rdUk5OI/A73JAs5K8LOfljGrd0RF3JLKHODM7RfBCLaLk8Xw1GfEeeJ7PZ
	bDt73r1A==;
Received: from localhost ([::1]:52600 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jiioy-009dr1-Ky; Tue, 09 Jun 2020 18:18:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64668) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jiiot-009dqu-Nt
 for samba-technical@lists.samba.org; Tue, 09 Jun 2020 18:17:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=PGNk/vbz2vIM+NO4RJuYb16I92TyuMdjx3ofAfKQvio=; b=duZ9KrgaxYT4IpBDBKQCi7I21A
 l4fA1B+qe1hKXV567SvbDeWFAdb42aqSNH6FAzqCJ1lvbhohM2LdcryOGithq9gwHfYrYy+jASpCa
 V/xmQg1/5oQbWsDGg1r/r160B677JJVThOQ9rqfrOHAQX89P6Red5+0qm88wMyZNZeQ8wnb8QETOO
 ku9qOYbIbSVFVserJiHBdjyuRQmDF1c2pNstRz54+IPJznEPTDHhGXBqJIJ2/CFOyT7J+R4HivqpC
 EjZbT14/Z0R8mdEUyRkK8jYi61kx+zpesiWPIWF7GuH4B8OXA3jUEjPGRhlvEYV/wmqmETO+SzBrj
 HMz0Kwk3itzpgkHla9bDEXUzzVwBg/SAMyS55jgGZ3oYfAqkfVVKmBrNL1k7iR7EiAIGeAzZOMNQm
 YxSuLO8tdVKesMzYSAcnEdaWGCSrulpSADIndwLIxqKD34BoyuOJgEtPnUwY+0W2gJaVcsNT5JXfs
 hygzVW49Yxj8ZVWDOmzoMM5X;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jiior-00066g-CR; Tue, 09 Jun 2020 18:17:54 +0000
Message-ID: <1d67896e205c71300bc0e6acaf405380ec0182a1.camel@samba.org>
Subject: Re: Schema updates and modern Samba AD
To: Stefan Metzmacher <metze@samba.org>, Upstream Samba Technical Mailing
 list <samba-technical@lists.samba.org>
Date: Wed, 10 Jun 2020 06:17:48 +1200
In-Reply-To: <e70dc906-1bbc-858e-ece8-80bcd6f60769@samba.org>
References: <6519f23f61695e09cc6c9aa9336f69bcd8010da6.camel@samba.org>
 <e70dc906-1bbc-858e-ece8-80bcd6f60769@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
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

On Tue, 2020-06-09 at 16:54 +0200, Stefan Metzmacher wrote:
> Hi Andrew,
> 
> > A long time ago I remember asking if we could change the default
> > for
> > "dsdb:schema updates allowed" to true, so that this is no longer
> > guarded in Samba.

> > What I can't remember (or find in the list archive) is what those
> > issues are!
> > 
> > Can you remind me?
> 
> The last time I looked at it I had this wip branch (ignore the
> smbdirect
> stuff)
> 
> > 
https://git.samba.org/?p=metze/samba/wip.git;a=shortlog;h=refs/heads/master4-schema
> 
> Before we can enable this, we need to be 100% sure that an administrator
> (or even SYSTEM via ldbedit or incoming replication) is not able to
> break the local schema.
> 
> The first thing is to verify we can load it again before we store it,
> I think we have parts of this, but I don't believe it complete.
> 
> We need to reject any change to ldapDisplayName attributes (Windows
> allows them, but we'll just break as we use them in our database).
> 
> We need to implement all known constraints regarding schema changes
> we
> can find anywhere in MS-ADTS (there are a lot of places...) in
> the schema_data.c I added some of this in that branch.
> 
> It also turns out that we don't have good schema tests, I tried
> some of them against Windows, but they just fail. They seem to be
> more like fantasy, than anything useful.

Thank you so much for this.  I've added a link to this mail and a
hopefully fair summary of a 'safe-ish path' for administrators to:

https://wiki.samba.org/index.php/Samba_AD_schema_extensions#Disabled_by_default

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




