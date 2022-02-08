Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA124AD076
	for <lists+samba-technical@lfdr.de>; Tue,  8 Feb 2022 06:03:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=1pnErGirt3hBDs+yBovQ7zsJFBp8BGlThF81BkDofLI=; b=QZdGEMhCh1NIwPbqpTPVzPaDlx
	ZsEDmPnqn3rtXmkVTGefwesiPValM/bApRaU/oe0/JvHiQB9o1oFWaUioqCOAsRhi1ZMcbIz394lr
	5uo550CJYoTLwV/uTmUTR3YmVyJf2pmpsWHatuqdojscLjhw+sj6r/h3csmooq17KJms+EVaLgzWQ
	krg9tsIJReJQOKmIxzjdt78zLd42Q1gsrzHoY6yJwPd+uC4NFyxxxq/K5UoRUJyYBet8kyjZDkpvH
	RHBogIGBmVJfVq4GKTGsbw3QX8qUGiwgAuyVv9PqjVGAKjlziEE/00dfaPdIzRfr67SgAxmOidl9u
	r+ALL0Ww==;
Received: from ip6-localhost ([::1]:59654 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nHIe5-005aaM-FI; Tue, 08 Feb 2022 05:02:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48744) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nHIe0-005aa8-6k; Tue, 08 Feb 2022 05:02:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=1pnErGirt3hBDs+yBovQ7zsJFBp8BGlThF81BkDofLI=; b=uQ+PW6agd/lZ1SkUQCfiZredEg
 niNos+Al/wq0JhENy1eNMo96szuDEvkIJLwPhMIuIr5M7SRyrpHF/XSvxmHmnRZOFNhh2+8mxrsyw
 fqPAhTtKu1nF+uCvq5qUM0N5Rr9MO6dcaOhvEo96AEJEcfeILZ8+OTvW0fk4IbGozzyBTxbxnGchJ
 4a8RsXA0eck2sejeI67Q6eiQnRxlc7lGVcSFZAcLEZgqx/iXF1k0OgEejl1NFHHtzpxA0t7sgNN0i
 tIwEqMbaL40KmsvktSwvx04PyeC5E6z9yxug3uFSb9E5hffkXkwyQObUHzf+K5IPTvQOuxh0zYHqS
 6pr+HDTPeJ5TeziIeFw8UcLY5YTC1bNVclZudi9xSrsNLuCwgD7PTTdEx8HKMDTaMV7GMGIacrnIN
 mPnfzvA/soHqUn/E33uF+c18dx26YQe12kK0/dExn3hUj0UYol/aUVR/eHTm0bc0NyDh8KvpM4gvw
 gl+gVbBcXZHJplzr/VkxCGOk;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nHIdx-002dkS-Ad; Tue, 08 Feb 2022 05:02:22 +0000
Message-ID: <38549bf6f2d849b505ff8c8a416a760735f1e16b.camel@samba.org>
Subject: Re: [Samba] Remove LanMan auth from the AD DC and possibly file
 server?
To: Jeremy Allison <jra@samba.org>, Upstream Samba Technical Mailing list
 <samba-technical@lists.samba.org>, samba@lists.samba.org
Date: Tue, 08 Feb 2022 18:02:15 +1300
In-Reply-To: <YgFUHGD0Rit9bL/n@jeremy-acer>
References: <53125588031f8ffad9e7c8a4b16a7f093781a39f.camel@samba.org>
 <20220126115058.GA936420@sernet.de> <YfF8+OMLV0UkzicQ@jeremy-acer>
 <9df52f1eb4b6dbda5bc6c63718c28793124c7c98.camel@samba.org>
 <20220207170634.GC1203621@sernet.de> <YgFUHGD0Rit9bL/n@jeremy-acer>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Mon, 2022-02-07 at 09:17 -0800, Jeremy Allison via samba wrote:
> On Mon, Feb 07, 2022 at 06:06:34PM +0100, Björn JACKE wrote:
> > On 2022-01-27 at 07:00 +1300 Andrew Bartlett via samba-technical
> > sent off:
> > > No, you got my meaning perfectly.  Even for Win9X there is, from
> > > memory, some strange update to make it do 'raw NTLMv2', instead
> > > of LM.
> > > 
> > > I really think we should be able to ditch this, ideally across
> > > the
> > > codebase but certainly in the AD DC, in 2022.
> > 
> > okay, with the AD DC I agree, I think we can remove it there.
> > 
> > For local SAM's users I would vote to keep LM hashes supported
> > until we ditch
> > SMB1 anyway in the not so far future. There are really still people
> > relying on
> > this.
> 
> Only if this is easy to do in refactoring. If it's going to
> be hard to keep them, I vote to remove them and ask such
> users to go to guest authentication.
> 
> At this point there's no difference in security between
> LM hashes and guest authentication.

It would mean we could remove the actual password checking code, and
avoid having inconsistent behaviour where 'lanman auth' is a valid, but
now ignored, parameter. 

This is the primary benefit.

The lesser benefit comes to avoiding having member-server codepaths
without the matching AD DC codepath (but the NT4 DC code could step in
here to an extent).

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


