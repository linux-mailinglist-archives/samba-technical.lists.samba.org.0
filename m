Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5581FC5B4
	for <lists+samba-technical@lfdr.de>; Wed, 17 Jun 2020 07:36:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=GvDPevtt/3cC8O8hE4fnlkDjd9lr4MgjcROaI1Ir2hA=; b=R1sxCwzU+fsUi/aXEgoY2lHm2o
	XtIvbNLTa0Fgmct/yKif4R7WKfHgnZqBoKAg0/158QIR8RRPYRm9UzpcJAyFPJOioslMpx90ywUhR
	wDEAXVXehVvy6GZpnkLI19h7or9xRt89gQtxe4CdsS71SUhGhVTzADk2+Dgbnp9zmv6/Yssn1OzKS
	k/kI5HMiejRRbyHCe8x4sP/YVby1Bz/D+wB7u/qisYGeZPXJAZWmqvkXIoMJozljCiExF5ce2rdlu
	YeGOsMbjNJNh/IZCbW3rFzSe7aKTdI8okFxQUKFPg9Yx8MBCOGnKiGe+1Anev8R7ZOKQ6AD7GkDs6
	MYRXvyBg==;
Received: from localhost ([::1]:28366 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jlQjh-000omH-Du; Wed, 17 Jun 2020 05:35:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35950) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jlQjX-000omA-9G
 for samba-technical@lists.samba.org; Wed, 17 Jun 2020 05:35:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=GvDPevtt/3cC8O8hE4fnlkDjd9lr4MgjcROaI1Ir2hA=; b=zBc31QLkiAfwBW0dSyzTpVRZJm
 wopVHao5uhd4v9sIC4XjF0REygk8waCabdiHDXrsfAhphUpHhM8aVLyzBV2L3rh3uOqU8Gt4gX2+1
 M92EPNWrzdiZNrC3boUpQrMTapdFuz6CvYYd57VLUenOONRk7YUNgGT4GQqyrmID5TVsL4BI6Ibp5
 3Tf99AMZdxE00cisNgTZq25tg+xAc2le8p3i8NoQuu4RmTou5knCcfhZBLD2Pdw2wXpY2OBAXn9jV
 h1AkXDKa267A+OL/CXAtIPcjfu+dfv4CnC3k5LlzXrEzEQiWQLbAVBbj+NmSehOedNlssjVbXHZyJ
 aKDv0fnS1C4JykXcPvUkP61qnJ4/CiF7vrqv22YsaWoAtonLq5li1Mlmd3hpDDN2jT8wwlNeJnEoq
 dUARsa1IdTRapMmCmVMWUr1bprtQY9HkviBtTBcztnDXRt36VwlMEGpgv8GHAjqIWoN1wdyd0CyKD
 P3nx2/jh54zP3L+/EgjT57IZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jlQjV-0005iR-0r; Wed, 17 Jun 2020 05:35:33 +0000
Date: Wed, 17 Jun 2020 08:35:30 +0300
To: Jeremy Allison <jra@samba.org>
Subject: Re: deprecate pdb_ldap and "NT4-like" domains in Samba 4.13 to allow
 removal for Samba 4.14 in March 2021?
Message-ID: <20200617053530.GF3036357@onega.vda.li>
References: <d48e22dab11b2cc72cd1e402730814a506e7c363.camel@samba.org>
 <20200616082636.GD3036357@onega.vda.li>
 <bac9c345a806ece858c12211b176fd6bb6d49996.camel@samba.org>
 <20200616095350.GE3036357@onega.vda.li>
 <20200616172929.GD11432@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200616172929.GD11432@jeremy-acer>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On ti, 16 kesä 2020, Jeremy Allison wrote:
> On Tue, Jun 16, 2020 at 12:53:50PM +0300, Alexander Bokovoy via samba-technical wrote:
> > On ti, 16 kesä 2020, Andrew Bartlett wrote:
> > > On Tue, 2020-06-16 at 11:26 +0300, Alexander Bokovoy wrote:
> > > > What is required from FreeIPA side is a set of operations to provide
> > > > implementation of PASSDB interfaces that deal with searches:
> > > >  - search users
> > > >  - search groups
> > > >  - search aliases
> > > 
> > > Can you do that on the FreeIPA side?  pdb_ipa isn't in the Samba tree,
> > > could you handle the maintenance of the code it depends on?
> > > 
> > > Presumably you have plenty of other ldap client stuff on the FreeIPA
> > > side of the fence you could plug into?
> > 
> > So basically you are saying that you don't care how FreeIPA would handle
> > integration to Samba PASSDB, neither you care about PASSDB being
> > testable and used. Is that right?
> 
> No, I don't think anyone wants that :-). Alexander,
> why don't you clarify exactly what you need, and
> what you're using in Samba passdb ? That way we
> won't accidentally break anything.

ipasam implements all but few passdb calls. I need to complete some of
group/group type lookups and then it would be more complete.

The problem I see is not FreeIPA usage of those but rather lack of
testing in autobuild for the code paths that lead to the PASSDB calls.

For example, tdbsam has no support for group lookups, no trusted domains
support, and that means any related RPC calls will not get tested
upstream even though they are used in environments like FreeIPA.

It is on my side to add those tests and I am working on them. Since the
whole set is simply missing, it is not an easy job and requires time.

 
> > As far as I understand, same feature and support is available in QNAP
> > devices.
> > 
> > I personally don't think it makes sense to deprecate pdb_ldap now.
> 
> Fair enough. But also as I said I didn't know you needed it :-).
> It is *very* old and crufty code though - maybe you could
> put some resources into helping maintain/update/refactor
> it to modern coding practices so it doesn't look so abandoned :-).

I am not sure what is 'crufty' about this code. It actually works and
works surprisingly well. Sure, we might change smbldap to be based on
something else but what does it actually give us in reality? I am
genuinely asking because to me it would look like a lot of churn for
relatively small gain, if any.

I had somewhere an unfinished tree with some of smbldap refactoring but
I couldn't find it anymore. One of bigger refactoring was to move to use
tevent-based approach but it was not really needed for PASSDB because
this API is synchronous and doesn't care whether operations underneath
are asynchronous themselves.

Andrew raised valid questions about ASN.1 handling that were part of a
recent CVE fixes in Samba AD. It doesn't though apply here because that
work is being done for us by OpenLDAP in the case of smbldap API.
CVE-2020-10704 is also a server-side LDAP implementation issue, not
affecting client side use in smbldap.

My attempt to see if I can use libldb for the same purpose led to
immediate crashes because libldb code is not capable to run against LDAP
servers with a schema that doesn't include (in DSE) attributes expected
by libldb. It makes it useless for the purpose of pdb_ldap and ipasam
PASSDB modules, for example. The crashes need to be fixed but it shows
there is very little testing of libldb against real world LDAP servers.

I think adding a test environment that imitates a typical pdb_ldap usage
can also help with libldb testing coverage.

> > Instead, I hope to look into improving its test coverage now that we
> > have a good way to create test environments and use them in CI.
> 
> Well that's good to know. But if Synology and QNAP need
> this also, then if would be good to hear from them directly
> on what their usage requirements are.

This can be said about almost all our users embedding Samba components
into their products. We hardly hear from most of NAS vendors on public
mailing lists, yet there is a lot of effort to maintain stable and
predictable API around file server operations. I find this a bit
amuzing: there is a need to be fair at a treatment of various code paths
and yet somehow there is simply a rejection of that.


-- 
/ Alexander Bokovoy

