Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E2F2D82E8
	for <lists+samba-technical@lfdr.de>; Sat, 12 Dec 2020 00:52:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=FAb/EbVJI5ZfHGzubR/iAZRPbllsl+TuEsyvjaKRZHs=; b=adjtM+t3Hfqi2JcvJLx9bqAUIk
	Sx5pJCUFRrVA0j7DY9qonoNxH25eAZsUQohPshEeWbwZb9AzeHCbI9VH5TVf+qk+Uib+7uzp06d/a
	k4Q/O4fNfT+4VHl+ny1ylvqiPxg8JtRIZU43z7XWVlL25V3Ia3BPS4aff+BNWvS5+DoIVoAs7liHx
	400EfyzM5d9JFZzzMfwXTFQjE+I2xbzoxuICsttAwuyOOADp+VPIznSMnCkJFzfKB7MMHc9emJSAQ
	YC6H8GjGKvZ/AhtjT/8Rdc4so3rYp2mlJQmggxwz+MsyMIXevfxmbs+3HmIc8ktAueIR9oh3g+eE6
	zkCLwx8w==;
Received: from ip6-localhost ([::1]:38600 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1knsCI-000gVh-Ng; Fri, 11 Dec 2020 23:51:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42774) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1knsCD-000gVa-JZ
 for samba-technical@lists.samba.org; Fri, 11 Dec 2020 23:51:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=FAb/EbVJI5ZfHGzubR/iAZRPbllsl+TuEsyvjaKRZHs=; b=QCmTm/7/l6Vlgz3300MrhEW+Vd
 eSWnNDYWMYmUEM1O2UEeD8yy59pJG60UDgUDme0svjnOGJz+2Ou/MqFP+uSR0AHdDYeqz+4cotVmM
 e/MZJPX1EnI9LUrJCAsDOs/+/n023oM71LmNKu/0kUK5giBkHTH8pYujLjs9yc7b6M5oYp7+11kgx
 Zuv0VbKYzfQs2nXyp48cJMoeAp+NA0JBCw2sY++ct1VVcg/pFMyruAfppVk57xQygWTIqWhArbWhE
 NXNE7uWmKxCW0mXg8GMyIGLz0dOJ8Np/LdA3/UZuY3Z1cMEK/NCrpFDM8gvIv3NMo8dl1PApD+gks
 I4PD5mUcb5GAz407V9qENSfhTXF3VFpxxZRMrxBfgMyw2m1RP+PKOMJ9RNzs227umQBBll3OtKqgr
 1HITxUEROVaRMBkWDHmp3Jug+wimSPb8a+ObtyQHewiUduOPaOG84GsA2pHWNziYkThVWK6NkKDFJ
 iXnnCM6qNa1HxDHvSk3sacrb;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1knsC8-0004Sd-KF
 for samba-technical@lists.samba.org; Fri, 11 Dec 2020 23:51:28 +0000
Message-ID: <848ffb00f04a897090aa726692fcca7a8271d272.camel@samba.org>
Subject: Re: Samba testing on CentOS 8
To: samba-technical@lists.samba.org
Date: Fri, 11 Dec 2020 18:51:24 -0500
In-Reply-To: <380efeccd76b37a958da2a49656a5c1c959a0173.camel@samba.org>
References: <20201208231746.3c15f5b0@martins.ozlabs.org>
 <20201208124406.GF5029@pinega.vda.li>
 <20201209003132.328ca229@martins.ozlabs.org>
 <df4952fb-87d9-6cc8-e55c-a08487ff34aa@samba.org>
 <20201210142744.398a7e75@martins.ozlabs.org>
 <380efeccd76b37a958da2a49656a5c1c959a0173.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
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
From: Simo Sorce via samba-technical <samba-technical@lists.samba.org>
Reply-To: Simo Sorce <idra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, 2020-12-12 at 09:45 +1300, Andrew Bartlett via samba-technical
wrote:
> On Thu, 2020-12-10 at 14:27 +1100, Martin Schwenke via samba-
> technical
> wrote:
> > Hi Rowland,
> > 
> > On Wed, 9 Dec 2020 15:42:27 +0000, Rowland penny via samba-
> > technical
> > <samba-technical@lists.samba.org> wrote:
> > 
> > > Hi, based on what is all over the internet about the future of
> > > Centos, 
> > > should we continue to test anything on Centos 8 ? I mean, we may
> > > get to 
> > > a point where we do not know whether a fault is down to Samba
> > > code or 
> > > code that isn't in RHEL but is in Centos stream. Just a thought
> > > and I 
> > > could be talking out of my hat.
> > 
> > You make sense and I agree.  When CentOS becomes a rolling testing
> > stream then it will no longer be a stable platform for
> > testing.  Amitay
> > and I were discussing this yesterday and we didn't come up with a
> > good
> > answer. One reason why there is no good answer is that we want a
> > stable
> > testing environment but sometimes Samba moves faster than the
> > stable
> > distros (e.g. CentOS 7 and GNU TLS) and this might happen again,
> > possibly with other distros (e.g. Debian stable).
> > 
> > However, right now I have limited time available to make changes to
> > our
> > testing environment.  So my pre-Xmas goal is to open a bug, "fix"
> > the
> > CentOS 8 bootstrap script, backport the fix to 4.12/4.13 and have a
> > working test environment again.
> > 
> > Hopefully in the new year I'll find time to update autocluster to
> > use
> > something else as a test environment.  Part of this is probably to
> > add
> > support for the Debian family of distros.  At least then we will
> > have
> > flexibility if things change.
> 
> One advantage of the current bootstrap system is that as long as
> nobody deletes the CI images that are built, the existing images
> remain a stable snapshot.  It is 'just' the bootstrap scripts that
> break for others, and of course building a new image now becomes more
> difficult.
>  
> It is particularly sad that the end-user use of the bootstrap script
> could become less reproducible, that was a really nice feature.
> 
> I'm assuming that, in the space of a few years another CentOS
> replacement will grow up into this same space, rebuilding the SRPMS
> of a specific RHEL release, but in the meantime this is going to be
> awkward...
> 
> Of course I must say I greatly appreciate the efforts put in by Red
> Hat and Red Hat's staff to building this ecosystem to which we have
> enjoyed for so long.  

I expect that RHEL will become free (as in gratis) for CI system at
least for Open Source projects[1], so we should not have these problems
either, nor a need for a rebuild, we should be able to use the "real
thing", I hope.

Also note that for cloud images UBI[2] is already free, and can be used
now (but there are still some problem, being worked on, wrt -devel
packages afaik).

Quote from [1]: "In the first half of 2021, we plan to introduce low-
or no-cost programs for a variety of use cases, including options for
open source projects and communities and expansion of the Red Hat
Enterprise Linux Developer subscription use cases to better serve the
needs of systems administrators. We’ll share more details as these
initiatives coalesce."

[1] 
https://www.redhat.com/en/blog/centos-stream-building-innovative-future-enterprise-linux

[2] https://developers.redhat.com/products/rhel/ubi

HTH,
Simo.




