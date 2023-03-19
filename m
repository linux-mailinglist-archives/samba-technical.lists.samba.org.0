Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BA85B6BFFF4
	for <lists+samba-technical@lfdr.de>; Sun, 19 Mar 2023 09:08:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=Y/NIoyhd9H9tyjh/qRdImZS7+s/J8dimOSmOE1UKbvc=; b=EDg6Vlqh16CTZLiZKPCqYDwVYa
	JsCiGRXqfXXhLNokrTMMiHAB3rio+zf/fZmdHS+E0wAOiMb2dzNuvJ9XEAEMkvJkp3lBAdy30SdQ4
	VL98QpR5psJic2lXWKTQZt5uqf3YXmWkV1zNGALfqkCf425WjDonH0zK+HMzaGCHdSFtndIR3W50c
	f2R+XpvudGhWFqGz3L9Pdk3MuB9Yuj0XWJ2paXTgTfBizEicaTT0dI+a8AiBptUd4iNL/O7a5ox8p
	skl3OkAvqdX0X2NBHNDjNZIVCaAM34RSHxpKzAurqklISaL3MCPIb2mIB3LpxP1366hx/1C4xOKqA
	/opGD7ZQ==;
Received: from ip6-localhost ([::1]:58838 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pdo5B-003Mts-Ga; Sun, 19 Mar 2023 08:08:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14792) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pdo56-003Mtj-Cm
 for samba-technical@lists.samba.org; Sun, 19 Mar 2023 08:07:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=Y/NIoyhd9H9tyjh/qRdImZS7+s/J8dimOSmOE1UKbvc=; b=PQJiNy5cHZXf1pjh+K7cmD2T8L
 243Md0uTM7RhNm7V39pnWoJMqEXdKocePqFAUXFz9AXVhLJp9d19I85Fg7qC2gix+Jwku3xJZekfr
 VnQgoN2xjcIt4e5TW5PB3znw3uDtoQFqOezlCOD/WiedltArpQ55eAlvHBsfyj99hG43yvWFxQEv6
 wXeBZJjHz451Ju9XXZYccCJEncEhxoLf+jeRC64FUZvl39b0hCyucoEN6aucU1v/0Z3kdqhQ1oy2y
 rVAPE5k9b8UGlWq9zMVAykyogeqWA6RyAso6Rg887JhU+6qOf+K6D1muRzsBg44GO3WsGgFkTVs25
 k1y+O5Z/IKM7yxI5fztX9m1n8bNst+s5vIkKEXi+j5lCrsJRQ5gPFwVAiDZkFqbJpdg+OhSRkV6PT
 VJGpya4TaEOFrQIZ04sNgdMJYjko4oLFs17DCcpiP0yez3NiNMHa3tP9qukVzx6y4dKdx/I8Ec3y4
 FQs1g9WSljMpe9aGNfBmG+4i;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pdo55-004B6F-M5; Sun, 19 Mar 2023 08:07:55 +0000
Date: Sun, 19 Mar 2023 10:07:54 +0200
To: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Subject: Re: mit-krb5 and heimdal binaries
Message-ID: <ZBbC2rDQ5eMwkBVO@pinega.vda.li>
References: <c2ed6a14-6555-2f51-5bf4-c984aaa43a64@msgid.tls.msk.ru>
 <ZBa55+81hGE4QF7k@pinega.vda.li>
 <31194bd0-05a5-9549-5b6c-ef37bd5d5c17@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31194bd0-05a5-9549-5b6c-ef37bd5d5c17@samba.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On su, 19 maalis 2023, Rowland Penny via samba-technical wrote:
> 
> 
> On 19/03/2023 07:29, Alexander Bokovoy via samba-technical wrote:
> > Hi,
> > 
> > On su, 19 maalis 2023, Michael Tokarev via samba-technical wrote:
> > > Hi!
> > > 
> > > I already asked a similar question before, but it keeps popping up in different
> > > contexts and forms, and the more I use samba myself, the more often it comes to
> > > me too, especially in context of using various security tokens for auth.  And the
> > > more I think about all this, the more sane it looks to me.
> > > 
> > > The thing is: mit-krb5 has much better user-level support than heimdal. But samba
> > > does not fully support mit-krb5 as an active directory domain controller.  The
> > > AD-DC thing is server-side.
> > > 
> > > I can think of providing two builds of samba for a distribution (eg debian/ubuntu), -
> > > one implementing whole ad-dc, as a complete thing, using their own set of libs,
> > > linked with heimdal. And a usual set of more client-side packages, with their own
> > > libraries, built against mit-krb5.  Or maybe some other combination also has its
> > > right to be, - for example, smbclient built with mit-krb5, the rest is heimdal.
> > > 
> > > An essential part of this is that the two sets (built against mit-krb5 and heimdal)
> > > do not share any internal libraries, each has its own libraries. This way, there's
> > > no "mix" of differently built samba, each build uses only its own libs, so there's
> > > no clash here.  They share the same smb.conf though.
> > > 
> > > So far, I've seen requests to build two versions of the server (again, with mit-krb5
> > > and with heimdal), - and I faced the same issues too.  This is because a regular AD
> > > member server is also good to have mit-krb5 support to integrate nicely into the auth
> > > infrastructure. While for ad-dc, it is less often used as "end-user" server.
> > > 
> > > So I can think of a separate samba-ad-dc binary package providing whole samba suite
> > > built against heimdal (maybe without smbclient and some other minor things), and
> > > samba "file server" binary package providing regular server not suitable to use as
> > > an ad-dc, but conflicting with samba-ad-dc, so it is not possible to install one
> > > together with another.
> > > 
> > > This approach also has another good side effect, to discourage usage of samba-ad-dc
> > > as a regular file server.
> > > 
> > > Or maybe the whole thing is moot now, and we just can provide regular samba built
> > > against mit-krb5 to work as a good AD-DC?  That would be the best solution IMHO.
> > 
> > I would be against a blended build against both MIT Kerberos and Heimdal
> > Kerberos in a distribution. It is not going to bring you anything good,
> > support wise.
> > 
> > Andreas and I have submitted a talk to SambaXP about MIT
> > Kerberos/Heimdal Kerberos-based Samba AD DC configurations, where they
> > stand against each other and what are perspectives. In short, both have
> > unique features that do not exist in the other variant and both are
> > close to being production-ready. We want to change the status for MIT
> > Kerberos-based build from experimental to production. Effectively,
> > actual decision for a version shipped in a particular distribution would
> > need to be made by that distribution, of course.
> 
> I do not think this is a good idea, Samba should use one or the other, not
> both. If you do use both, to a certain extent you will nearly double the
> support required.

I did say exactly that: I am against blended build. Not sure what made
you think otherwise.

> 
> > 
> > Distributions need to take into account security releases, as Rowland
> > has pointed out as well. However, from my Fedora and RHEL experience,
> > this is not a problem with MIT Kerberos -- certainly not more than with
> > Heimdal. It is pretty much a coordination question and I believe we have
> > very good coordination on that front with MIT Kerberos and distribution
> > maintainers.
> 
> That is strange, from what Andrew wrote, he appears to think the opposite.

I am one of developers and one of maintainers for both Samba and MIT
Kerberos in Fedora and RHEL (as well as few other relevant projects). I
personally see no issues with MIT Kerberos upstream collaboration.
Things get discussed and fixed when needed, contributions get accepted.
Our willingness to move Samba AD/MIT support from experimental forward
to supported is based on that factor as well.

> > 
> > If I was in Samba AD support for production deployments, I'd probably
> > go with deploying DCs in a containerized image way to isolate completely
> > from the rest of the OS. There are few images already that provide this
> > setup: [1] was presented at SambaXP by Michael Adam and other folks now
> > from IBM Storage, [2] is older and also active one.
> > 
> > [1] https://github.com/samba-in-kubernetes/samba-container
> > [2] https://github.com/instantlinux/docker-tools/tree/main/images/samba-dc
> > 
> 
> I personally have no axe to grind over the matter, I do not care which kdc
> is used, just as long as it is only one, if only from the support point of
> view.
> I also only say that using MIT is experimental because other wiser (at least
> I hope they are wiser than me) people say it is, if this changes then so be
> it.
> 
> I still do not think it is a good idea for a distro to provide two versions
> of Samba, one using Heimdal and the other using MIT.

Yep. However, tools we have in most distributions allow to provide more
flexibility. It all needs maintainers, though. Without maintainers there
is just an illusion that someone could depend on a package that is in
reality not supported well -- whether it is built with a single scenario
in mind or set up to handle multiple approaches.

-- 
/ Alexander Bokovoy

