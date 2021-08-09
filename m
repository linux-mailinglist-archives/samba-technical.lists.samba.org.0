Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B11013E4219
	for <lists+samba-technical@lfdr.de>; Mon,  9 Aug 2021 11:07:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=dXMIWquwyj944xHxforHqXInhjuHwnHvskVDfwHs+tI=; b=HF1QUuDZO+UHqIf1lPG8LNCRhW
	J/WPTQZLyBcoZN73gWiknLACDE33/MogOXQ5w1Dfe2HUjqBvKEwSR9Rv3cHJ5CE/p5igAYBMKt3lI
	1/DshVWLoIftCagllXRQAOwWb1lK8Wa7KHafHyu4m1+aPREzSC43Por7JAIMwReVnwKZx4te73FmJ
	ZJE7bWW0l3ChbPII8oIcObpaNGryJRtPEVWEpSs8XH9mSVdshEBP7KdqeLtmPrhPgnB7bJjP2ozd7
	EOGvHHDo5UX+BS/X34vsmJojH8I5VFFbmYXnmb28SvikVKexHLNheW+5oyyygEXsF18YXfDuG86At
	gJ2XXpHw==;
Received: from ip6-localhost ([::1]:35690 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mD1G1-005IBL-C5; Mon, 09 Aug 2021 09:07:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20164) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mD1Fu-005IBB-NV
 for samba-technical@lists.samba.org; Mon, 09 Aug 2021 09:07:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=dXMIWquwyj944xHxforHqXInhjuHwnHvskVDfwHs+tI=; b=ffEpVsjIm2kTcZhJxXLCi0IfMJ
 PpbKvRNwt+fcUrnZd9TZAQvkbZ0+1Y/oHzh0GoST3jzbXnYBQEv9lvw/LidDyk2Aoz9yBQha/LC4T
 nA+EX0OjSmY7EMlWkRWljUFw+Y7jkVxh4pIT4TfWGNrr6aRgJBjVz3NHj5aHHO3bS7Ae0l1C6794g
 xFHiNNKd/Yj6C0oR5ED22VEKapouD4Paa2oUQQBSkshsDAkup7qLdlC8T0usJQyZZOUUd3epSMGt9
 4HUBY4H0XscR8WjZzDH07axZ1fSl1xdvghpsWvNwv8USBzcEv1Qc6pQNKqZLBv2GQrS/l+OnTX0uJ
 OiT+Mluc31ScibEbYbRQna4b6CJejcOkuo2mXR51VqOh11BDIwOklnznWbyFIdM4DAU1DgUFKy4BN
 Fyc5RPnIUEC683TERzxlY+zZNgKxg8M8XL+T0XAyWRKZDLcDfjAlaX7qdZ5f1KJw9usJY9cXarFD4
 Zog2sv8Lf5fcMvSllMhIeyr3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mD1Fs-000KTa-FQ; Mon, 09 Aug 2021 09:07:33 +0000
Message-ID: <57d08d6d05bf60ebc0965a311cae267f539f277f.camel@samba.org>
Subject: Re: Heimdal upgrade, really happening this time
To: Stefan Metzmacher <metze@samba.org>, Upstream Samba Technical Mailing
 list <samba-technical@lists.samba.org>, Isaac Boukris <iboukris@gmail.com>
Date: Mon, 09 Aug 2021 21:07:26 +1200
In-Reply-To: <376f7f62-7ebd-fa37-45d9-dda065f7517d@samba.org>
References: <b2cb195314281883e378c908784ac6f9f841584d.camel@samba.org>
 <26713d5cdcc47d0d9fb017b6a1e546d9501d8efe.camel@samba.org>
 <c328766b-d894-517f-966c-fa5305558633@samba.org>
 <a78f79643b03b31afbe505b932df2cc46fb0254d.camel@samba.org>
 <0a68b013c3d1d6988d54ef5473a47e50973d0892.camel@samba.org>
 <fb006a0427d71d5f05a6217ff19e12974a6b647d.camel@samba.org>
 <376f7f62-7ebd-fa37-45d9-dda065f7517d@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
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

On Mon, 2021-08-09 at 10:53 +0200, Stefan Metzmacher wrote:
> Am 09.08.21 um 03:37 schrieb Andrew Bartlett:
> > On Mon, 2021-08-09 at 11:12 +1200, Andrew Bartlett via samba-
> > technical
> > wrote:
> > > On Fri, 2021-07-09 at 22:29 +1200, Andrew Bartlett via samba-
> > > technical
> > > wrote:
> > > > We now have a mostly-working branch of current Heimdal on
> > > > current
> > > > Samba, compiling on all our supported system, which is pretty
> > > > impressive.
> > > 
> > > I just wanted to wrap back to the list with an update.  Thanks to
> > > some
> > > great work with Luke Howard recently, host of our pull requests
> > > with
> > > Heimdal have either been merged or will be shortly (as in, I made
> > > the
> > > requested changes and expect them to be accepted).
> > > 
> > > This means that we are actually fairly close to upstream Heimdal,
> > > closer than we ever have been I dare to suggest.
> > > 
> > > The remaining changes outstanding are:
> > > ...
> > 
> > There are also, which were on the Samba side, the attached.
> > 
> > I'm not really sure about them - I think
> > 
> > source4/heimdal/lib/krb5/init_creds_pw.c
> > KRB5_NT_ENTERPRISE_PRINCIPAL
> > ctx->flags.canonicalize = 1
> > 
> > is trying to do the same as the Samba-side commit:
> > 
> > testprogs/blackbox/ --enterprise --canonicalize
> > 
> > Is that the case, and so could we drop the Heimdal side now?
> 
> I don't think enterprise principals will work without canonicalize
> and we have also non-blackbox cases we need to handle.
> 
> Just try and check if all our tests still work.
> It seems our C code uses krb5_get_init_creds_opt_set_canonicalize(),
> so we may not need that patch.

OK, I will do.  

That horrible krb5.kdc.canon C based tests show what happens if you
have enterprise without canonicalise, I wish the KDCs never accepted
it...

> > I also don't know what 
> > source4/heimdal/lib/krb5/mcache.c anonymous resolving
> > is for or fixes.  Can you shed some light on this?
> 
> This needed in order to have memory credential caches, which are not
> part of the global credential cache collection, but are still
> available
> to be opened by explicit name, which is the exact usage we need for
> any
> in memory caches.

Yeah, that's exactly how we use them.

> The whole global credential cache collection magic seems to be very
> dangerous
> for application like samba, which need to use kerberos on behalf of
> different unrelated identities.

Indeed.

> We already had very strange things happen with MIT, which where very
> hard to debug,
> setenv("KRB5CCNAME", "MEMORY:libads", 1) completely ignores the
> ':libads' part!
> It always iterates over *all* caches with a "MEMORY:" prefix and use
> the first cache
> that has a tgt in the used realm, which may means we authenticate as
> a completely
> unexpected user (maybe administrator), while we want to do an LDAP
> operation
> on behalf of the local machine account.

Yikes!  I'm still lost about what the patch is, but now I know this
much I'll be sure not to drop it! 

If you could tidy up and submit upstream that would be awesome.  I
submitted a lot of your work up already, but I don't think I can
explain the code enough for this one, it still confuses me.

Thanks so much!

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


