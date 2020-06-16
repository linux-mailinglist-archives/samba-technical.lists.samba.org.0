Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D5E1FBCEB
	for <lists+samba-technical@lfdr.de>; Tue, 16 Jun 2020 19:30:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=jaauv7TmuRSWTSEIi4dld+RzESYwVFwrTkEUrwMjX70=; b=x2aKYlbBQOVH3Akg5v+qZL2Xzt
	BYdVowdQpJMQefSIFpTZFXK510JfRM3/79H3EEK1vZYVdk3N6IXKTQo5YPCi4xMQZ/CXvnXGnPDpF
	gaNs+013ysm/MPbZJo4PZ4Tu31DSPackz4vs/1ESxubZ4NvS9NTjjo3uBOHd3K4xoBXNBlVmGD0GY
	WjGpK+gl/uDVAcUfy0JMBiw6Bxmo3yz+GIJxFezX9MCUUw0r4nSf2qqVbJlnXfF7YvkIEGeJxW6oa
	7lJ6jt6kg9yVPS+L/1Ci1K9+GjiEnrSJ+2ZBTbTjYznJw3rcVxVkbcO+sBcZXYedaEh+o/loxvJyz
	3MeDlxqw==;
Received: from localhost ([::1]:60278 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jlFP6-000jJL-EH; Tue, 16 Jun 2020 17:29:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14702) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jlFP0-000jJE-0T
 for samba-technical@lists.samba.org; Tue, 16 Jun 2020 17:29:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=jaauv7TmuRSWTSEIi4dld+RzESYwVFwrTkEUrwMjX70=; b=h0TmqAhdXS8L8/2LbhWj08EcRa
 qQNVjNMTEwK8S0oOcHgSS6TLQ+at/+B8nWIjfrqJnLdJDqB4UOWmiPQHkym5pqUZy2aawZfnrT959
 JNtlCYVDNnailDKeptbqBk0uR7Ykxcl/DzOZ/hl11HbtA6iDPuLJlirb6Zrszh88flm4Wp8tJgAGK
 RCyQNexUdPaIok+q/veDfASVF2C3HbykbHdTCEs56FF9xSja9sSQ/OLkoIN3Q1t8lo+JmRu/iVU/3
 HetC9BgKgkepC9d5aqLF/jHzLcyvf5kNR+7cdf2angcRjWt8xLaS8UvWJHwIbh4jeX4p6DM/9S0gt
 VHfi4IvdBFYZ2AfTvCYoAX1hONsrkHF+5nW+Epg85EJ/Pvr03GfuaTYq6sO9yZms5KZSsfioax9F1
 QHPbCwXJ6UQxysVYfdpQ4pb2WyDayJuvtkpR9Ayn+0ojeWf5GuVyx0MdSQfC7ICDDqbygbyOnZnnq
 j3fkOfHaKXS4DieOebjhmTki;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jlFOy-0000cS-8p; Tue, 16 Jun 2020 17:29:36 +0000
Date: Tue, 16 Jun 2020 10:29:29 -0700
To: Alexander Bokovoy <ab@samba.org>
Subject: Re: deprecate pdb_ldap and "NT4-like" domains in Samba 4.13 to allow
 removal for Samba 4.14 in March 2021?
Message-ID: <20200616172929.GD11432@jeremy-acer>
References: <d48e22dab11b2cc72cd1e402730814a506e7c363.camel@samba.org>
 <20200616082636.GD3036357@onega.vda.li>
 <bac9c345a806ece858c12211b176fd6bb6d49996.camel@samba.org>
 <20200616095350.GE3036357@onega.vda.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200616095350.GE3036357@onega.vda.li>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 jra@samba.org, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jun 16, 2020 at 12:53:50PM +0300, Alexander Bokovoy via samba-technical wrote:
> On ti, 16 kesä 2020, Andrew Bartlett wrote:
> > On Tue, 2020-06-16 at 11:26 +0300, Alexander Bokovoy wrote:
> > > What is required from FreeIPA side is a set of operations to provide
> > > implementation of PASSDB interfaces that deal with searches:
> > >  - search users
> > >  - search groups
> > >  - search aliases
> > 
> > Can you do that on the FreeIPA side?  pdb_ipa isn't in the Samba tree,
> > could you handle the maintenance of the code it depends on?
> > 
> > Presumably you have plenty of other ldap client stuff on the FreeIPA
> > side of the fence you could plug into?
> 
> So basically you are saying that you don't care how FreeIPA would handle
> integration to Samba PASSDB, neither you care about PASSDB being
> testable and used. Is that right?

No, I don't think anyone wants that :-). Alexander,
why don't you clarify exactly what you need, and
what you're using in Samba passdb ? That way we
won't accidentally break anything.

> My concern is that you are looking to deprecate interfaces without
> providing sufficient functionality to handle those needs, neither
> acknowledging existing proposed replacements need to be improved before
> even considering them.

Not really. I didn't know you were using them :-).
Let's communicate better.

> Outside of FreeIPA, most of home storage devices built on top of
> Synology, for example, rely on pdb_ldap. There is support and
> integration for Samba AD DC to be run on Synology but there is a
> separate LDAP Server component and an integration with that one for
> Samba requires use of pdb_ldap.
> 
> As far as I understand, same feature and support is available in QNAP
> devices.
> 
> I personally don't think it makes sense to deprecate pdb_ldap now.

Fair enough. But also as I said I didn't know you needed it :-).
It is *very* old and crufty code though - maybe you could
put some resources into helping maintain/update/refactor
it to modern coding practices so it doesn't look so abandoned :-).

> Instead, I hope to look into improving its test coverage now that we
> have a good way to create test environments and use them in CI.

Well that's good to know. But if Synology and QNAP need
this also, then if would be good to hear from them directly
on what their usage requirements are.

Cheers,

	Jeremy.

