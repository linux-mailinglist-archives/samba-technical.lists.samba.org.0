Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F38E6C035E
	for <lists+samba-technical@lfdr.de>; Sun, 19 Mar 2023 18:07:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=OC/OJ1jiCSoEhVmoryjdqzmxz8IgHmrg7f1/YnRcVkg=; b=OC7F7maATLGMN6UfZdF2mcsc2x
	q6sTya6OV45D3qR4ZxOv5im20D4GepP5s26gpH56pOQ17X95+ih+Yo1XZNOTAyrrqzGsl+J5tD4YA
	2Far+yOCNCtTKG+2aN7iIcxx0eHJnEzid//1FVqxok7q++LouMACMZx4i/xy6KSUnl3fobbHWdTvx
	UT46IqWU7uZ6bihGZ/M6W2K/u9oeyZMOW9Oi6OSMtwobJfVPJQeKROLiVUuIdUdv0kb8ZiXNYAj2t
	m/J8bajrgap0FmdFOEzF6aTdlhtdiIOFeSIWApplM8BDIEYaUZQFIze8x61TkP5sclZOzv2H3We8r
	vbw3ozwg==;
Received: from ip6-localhost ([::1]:39372 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pdwUf-003RCv-M7; Sun, 19 Mar 2023 17:06:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14202) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pdwUb-003RCm-1C
 for samba-technical@lists.samba.org; Sun, 19 Mar 2023 17:06:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=OC/OJ1jiCSoEhVmoryjdqzmxz8IgHmrg7f1/YnRcVkg=; b=hsWO0zJV9izeOIVFYEZAHHsq2n
 pSjfSVSTFzOQkMOJHe7cZF6pbuJdFH99LDuKVQVtwsj7EYz9sdIlJr11t+P8m01MxrMFS7TbkC5Mf
 ZEZF53qV/Nju8PqaKauKbsDmxyieYjUNWJJUqZIeiDux4SGpOz0degQt1O5Dat9x+280lxFWDbMBF
 3R26zp1ZAI2kEVjvKOqjlA6fZBHkfcwiIv1sRVlgUhGWshEKlOSvC2U/PM+XhTqVtjsngMRqGc7r8
 tIhqClrVVj9oVO82hlZMXa6axD9D62lN/5yldyBCZ8qUfr2UauO3c9gGlsuUzEidzwO/JIC9JfDuT
 8AtPZSeBI/2t2NPRlkyGflXpVBC3dqVU40nO4wb8LiJL6jiSidy43cNreDjhSlzrztARXWQPmFwmi
 Ur4bswWKGf1n/bRntTurU0w2g04AbXqLejwJ210mlSqoqhBSwr1q8FXMSV1Nn9jZtjKe4AzEi6EIu
 KFdGYJzsltC29BJtHKVJoiUP;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pdwUa-004E1c-1y; Sun, 19 Mar 2023 17:06:48 +0000
Date: Sun, 19 Mar 2023 19:06:46 +0200
To: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Subject: Re: mit-krb5 and heimdal binaries
Message-ID: <ZBdBJtzSFwjZl+8E@pinega.vda.li>
References: <c2ed6a14-6555-2f51-5bf4-c984aaa43a64@msgid.tls.msk.ru>
 <ZBa55+81hGE4QF7k@pinega.vda.li>
 <31194bd0-05a5-9549-5b6c-ef37bd5d5c17@samba.org>
 <ZBbC2rDQ5eMwkBVO@pinega.vda.li>
 <fc2818e4-cf75-1252-4d8d-8965ab2e6039@samba.org>
 <ZBbQcMSNinFiIpYz@pinega.vda.li>
 <97d44fce-4373-ee05-f94a-16df2f362ae3@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97d44fce-4373-ee05-f94a-16df2f362ae3@samba.org>
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
> On 19/03/2023 09:05, Alexander Bokovoy wrote:
> > On su, 19 maalis 2023, Rowland Penny via samba-technical wrote:
> > > 
> > > 
> > > On 19/03/2023 08:07, Alexander Bokovoy wrote:
> > > > On su, 19 maalis 2023, Rowland Penny via samba-technical wrote:
> > > > > 
> > > > > 
> > > > > On 19/03/2023 07:29, Alexander Bokovoy via samba-technical wrote:
> > > > > > Hi,
> > > > > > 
> > > > > > On su, 19 maalis 2023, Michael Tokarev via samba-technical wrote:
> > > > > > > Hi!
> > > > > > > 
> > > > > > > I already asked a similar question before, but it keeps popping up in different
> > > > > > > contexts and forms, and the more I use samba myself, the more often it comes to
> > > > > > > me too, especially in context of using various security tokens for auth.  And the
> > > > > > > more I think about all this, the more sane it looks to me.
> > > > > > > 
> > > > > > > The thing is: mit-krb5 has much better user-level support than heimdal. But samba
> > > > > > > does not fully support mit-krb5 as an active directory domain controller.  The
> > > > > > > AD-DC thing is server-side.
> > > > > > > 
> > > > > > > I can think of providing two builds of samba for a distribution (eg debian/ubuntu), -
> > > > > > > one implementing whole ad-dc, as a complete thing, using their own set of libs,
> > > > > > > linked with heimdal. And a usual set of more client-side packages, with their own
> > > > > > > libraries, built against mit-krb5.  Or maybe some other combination also has its
> > > > > > > right to be, - for example, smbclient built with mit-krb5, the rest is heimdal.
> > > > > > > 
> > > > > > > An essential part of this is that the two sets (built against mit-krb5 and heimdal)
> > > > > > > do not share any internal libraries, each has its own libraries. This way, there's
> > > > > > > no "mix" of differently built samba, each build uses only its own libs, so there's
> > > > > > > no clash here.  They share the same smb.conf though.
> > > > > > > 
> > > > > > > So far, I've seen requests to build two versions of the server (again, with mit-krb5
> > > > > > > and with heimdal), - and I faced the same issues too.  This is because a regular AD
> > > > > > > member server is also good to have mit-krb5 support to integrate nicely into the auth
> > > > > > > infrastructure. While for ad-dc, it is less often used as "end-user" server.
> > > > > > > 
> > > > > > > So I can think of a separate samba-ad-dc binary package providing whole samba suite
> > > > > > > built against heimdal (maybe without smbclient and some other minor things), and
> > > > > > > samba "file server" binary package providing regular server not suitable to use as
> > > > > > > an ad-dc, but conflicting with samba-ad-dc, so it is not possible to install one
> > > > > > > together with another.
> > > > > > > 
> > > > > > > This approach also has another good side effect, to discourage usage of samba-ad-dc
> > > > > > > as a regular file server.
> > > > > > > 
> > > > > > > Or maybe the whole thing is moot now, and we just can provide regular samba built
> > > > > > > against mit-krb5 to work as a good AD-DC?  That would be the best solution IMHO.
> > > > > > 
> > > > > > I would be against a blended build against both MIT Kerberos and Heimdal
> > > > > > Kerberos in a distribution. It is not going to bring you anything good,
> > > > > > support wise.
> > > > > > 
> > > > > > Andreas and I have submitted a talk to SambaXP about MIT
> > > > > > Kerberos/Heimdal Kerberos-based Samba AD DC configurations, where they
> > > > > > stand against each other and what are perspectives. In short, both have
> > > > > > unique features that do not exist in the other variant and both are
> > > > > > close to being production-ready. We want to change the status for MIT
> > > > > > Kerberos-based build from experimental to production. Effectively,
> > > > > > actual decision for a version shipped in a particular distribution would
> > > > > > need to be made by that distribution, of course.
> > > > > 
> > > > > I do not think this is a good idea, Samba should use one or the other, not
> > > > > both. If you do use both, to a certain extent you will nearly double the
> > > > > support required.
> > > > 
> > > > I did say exactly that: I am against blended build. Not sure what made
> > > > you think otherwise.
> > > > 
> > > > > 
> > > > > > 
> > > > > > Distributions need to take into account security releases, as Rowland
> > > > > > has pointed out as well. However, from my Fedora and RHEL experience,
> > > > > > this is not a problem with MIT Kerberos -- certainly not more than with
> > > > > > Heimdal. It is pretty much a coordination question and I believe we have
> > > > > > very good coordination on that front with MIT Kerberos and distribution
> > > > > > maintainers.
> > > > > 
> > > > > That is strange, from what Andrew wrote, he appears to think the opposite.
> > > > 
> > > > I am one of developers and one of maintainers for both Samba and MIT
> > > > Kerberos in Fedora and RHEL (as well as few other relevant projects). I
> > > > personally see no issues with MIT Kerberos upstream collaboration.
> > > > Things get discussed and fixed when needed, contributions get accepted.
> > > > Our willingness to move Samba AD/MIT support from experimental forward
> > > > to supported is based on that factor as well.
> > > > 
> > > > > > 
> > > > > > If I was in Samba AD support for production deployments, I'd probably
> > > > > > go with deploying DCs in a containerized image way to isolate completely
> > > > > > from the rest of the OS. There are few images already that provide this
> > > > > > setup: [1] was presented at SambaXP by Michael Adam and other folks now
> > > > > > from IBM Storage, [2] is older and also active one.
> > > > > > 
> > > > > > [1] https://github.com/samba-in-kubernetes/samba-container
> > > > > > [2] https://github.com/instantlinux/docker-tools/tree/main/images/samba-dc
> > > > > > 
> > > > > 
> > > > > I personally have no axe to grind over the matter, I do not care which kdc
> > > > > is used, just as long as it is only one, if only from the support point of
> > > > > view.
> > > > > I also only say that using MIT is experimental because other wiser (at least
> > > > > I hope they are wiser than me) people say it is, if this changes then so be
> > > > > it.
> > > > > 
> > > > > I still do not think it is a good idea for a distro to provide two versions
> > > > > of Samba, one using Heimdal and the other using MIT.
> > > > 
> > > > Yep. However, tools we have in most distributions allow to provide more
> > > > flexibility. It all needs maintainers, though. Without maintainers there
> > > > is just an illusion that someone could depend on a package that is in
> > > > reality not supported well -- whether it is built with a single scenario
> > > > in mind or set up to handle multiple approaches.
> > > > 
> > > 
> > > Alexander, as I said, I do not have an axe to grind in this, if Samba
> > > decides to move to MIT, then so be it. You however, do have  an axe to
> > > grind, you work for red-hat, who are on record as saying that there will
> > > never be an AD DC on RHEL. Are you now saying that, if Samba moves to MIT,
> > > there will be ?
> > 
> > I don't say that. What I said is that I am responsible for both Fedora
> > and RHEL. Fedora does provide Samba AD DC already for several years,
> > using MIT Kerberos backend. That's what I stand behind and will continue
> > to support.
> > 
> > 
> 
> Yes, Fedora has provided an AD DC for sometime, but it could be honest about
> it and say:
> A) Samba has marked the use of MIT as experimental, so you shouldn't use
> this in production (even if you think they could be)

Fedora 27 release notes had all required details:
https://docs.fedoraproject.org/en-US/fedora/f27/release-notes/sysadmin/Domain_Controllers/#sect-domain-controllers-samba-changes,
including upstream references.

In Fedora 39 we'll add more notes as some long-awaited functionality is
now implemented, thanks to hard work of Samba Team and contributions to
both MIT Kerberos and Heimdal.

> B) RHEL will never provide an AD DC

RHEL content is different from Fedora and its discussion does not belong
to Fedora. There are plenty of different packages in Fedora which either
don't exist in RHEL at all or have a different support scope.

I am not going to defend RHEL's decisions myself. I think it is better
to focus on what we as upstream developers can do to improve Samba and
its integration into various operating environments and not on why
someone's business decisions do not align with our expectations.

-- 
/ Alexander Bokovoy

