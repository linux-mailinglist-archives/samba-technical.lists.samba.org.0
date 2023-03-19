Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B416C05FE
	for <lists+samba-technical@lfdr.de>; Sun, 19 Mar 2023 23:22:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=B3JyHWYCJ/LYjUnupOJA2Cj1glpoz533D7gpOPsKvPQ=; b=14B5+PcRX+ALs5XcU0VRKg7jV5
	Q8V0HKb4gnLhQBOltahdAzg/CzvSkOa7dDDoNM3+YX6uYRRx1BhLGqqwW6ovfAaUKMrPBpgNt6JjB
	yclbP8k5oAAJKBeqJW7SJm3jkmD5CxEcbxbYLHtp9E3q6fSQ3nbmmyen6iRVww1yKW11++0EGYTJz
	TdBADZ4kk1YUevcPEOMJJQVexAFLwl2eXImrgdNd5pIxd4NH0hzFdY9DCQoUb+fFeu1/IyrGtV6uF
	noBXZIVmkxzfS/l52AR1eTwUC7ONPQ9NKn5esP/Q5yShJeLvcY8ugF/Bo7uWct1ZFxG47yZir1+db
	+Ef1TFNA==;
Received: from ip6-localhost ([::1]:51294 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pe1P2-003TAq-Sl; Sun, 19 Mar 2023 22:21:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41314) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pe1Ou-003TAI-I2; Sun, 19 Mar 2023 22:21:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=B3JyHWYCJ/LYjUnupOJA2Cj1glpoz533D7gpOPsKvPQ=; b=J90NMO7ritrVh0H8H+Frc5kdRl
 4hum2XitI785kh1qj7mYeE0leKtMTN7DrBMlTrV4Fj2aUoZxIcfSgHcj5vGb0joYIPGrOtnIGYuoo
 g7kVkFX/0PYX5/MjGqGnEMVrb5doBuqB8qHCNWmfsb+CsOV5GfzkeHJewX6X36qXULa7XVNMEJP3b
 G2tUGoXCW9NkOEAJqyVjuxbKos+3N24a07d3GOgv8ntLgEPWv4NPgqqDey8F8lIQ1fQi/2TYtlhEe
 REim3gRbWlgXviWZ7v01tdU0i5I3ybJp7xvtDEBg8GB6jiYQau56gIRDo+x6oo9HV/QYwAhWpkk4h
 OmeKggFQ1QzQXk4TP8tAJ4Ab4LOryxmLi3c0mf8agQbeMlMIP8dYjQoVZDqOGO5KUr3ITEhXWb95x
 Ie19/SOSCVplwn25VitmZtFCTUkoKoiudXLAs3V7NRc2CaTSqJOOikUfPiHxJ1YRATBak4ThLX8lR
 YxaCXFPPPxKqV1rWTMjtyyRw;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pe1Os-004GJG-1h; Sun, 19 Mar 2023 22:21:14 +0000
Message-ID: <9b05bc0bbd74c3d8cb02bf2a59713bd5fb0b677d.camel@samba.org>
Subject: Re: mit-krb5 and heimdal binaries
To: Alexander Bokovoy <ab@samba.org>, Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 20 Mar 2023 11:21:08 +1300
In-Reply-To: <ZBa55+81hGE4QF7k@pinega.vda.li>
References: <c2ed6a14-6555-2f51-5bf4-c984aaa43a64@msgid.tls.msk.ru>
 <ZBa55+81hGE4QF7k@pinega.vda.li>
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
Cc: samba@lists.samba.org, samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, 2023-03-19 at 09:29 +0200, Alexander Bokovoy via samba-
technical wrote:
> Hi,
> 
> 
> I would be against a blended build against both MIT Kerberos and
> Heimdal
> Kerberos in a distribution. It is not going to bring you anything
> good,
> support wise.
> 
> Andreas and I have submitted a talk to SambaXP about MIT
> Kerberos/Heimdal Kerberos-based Samba AD DC configurations, where
> they
> stand against each other and what are perspectives. In short, both
> have
> unique features that do not exist in the other variant and both are
> close to being production-ready. We want to change the status for MIT
> Kerberos-based build from experimental to production. Effectively,
> actual decision for a version shipped in a particular distribution
> would
> need to be made by that distribution, of course.
> 
> Distributions need to take into account security releases, as Rowland
> has pointed out as well. However, from my Fedora and RHEL experience,
> this is not a problem with MIT Kerberos -- certainly not more than
> with
> Heimdal. It is pretty much a coordination question and I believe we
> have
> very good coordination on that front with MIT Kerberos and
> distribution
> maintainers.
> 
> If I was in Samba AD support for production deployments, I'd probably
> go with deploying DCs in a containerized image way to isolate
> completely
> from the rest of the OS. There are few images already that provide
> this
> setup: [1] was presented at SambaXP by Michael Adam and other folks
> now
> from IBM Storage, [2] is older and also active one.
> 
> [1] 
> https://github.com/samba-in-kubernetes/samba-container
> 
> [2] 
> https://github.com/instantlinux/docker-tools/tree/main/images/samba-dc

Regarding the support and stability of a Samba AD Deployment based on
MIT Kerberos, given the advances in testing over the past few years, I
have, in 2023, no major concerns.  The features that are provided work
and can be expected to operate in production without concern.

The "experimental" designation is no longer correct, but it is not
clear to me what different word we should apply instead, the closest I
can come to is "unsupported".

Just as a distribution can and will ship a pre-release version of some
software, to meet that distributions overall goals, Red Hat is free to
ship the "experimental" MIT-based Samba AD DC, and provide the security
support (in particular) for that configuration to its users.  Red Hat
has the resources and ability to coordinate the release of patched
Samba and a patched MIT Kerberos simultaneously if required, for
example. 

However, things are different upstream.  I would suggest that, while
vendoring has well documented costs (as seen when we got stuck on 'old
Heimdal'), the choice to embed an copy of Heimdal has been a
significant advantage to upstream Samba.  

As a current example, this is allowing Claims support to be added, with
the KDC-side changes (to link the device and user) recorded in
lorikeet-heimdal and proposed upstream but not required to be accepted
at the time that the patches land in Samba.

Likewise, security releases, which have been a significant burden of
late, can be made from Samba master and directly consumed by our users.

I'm very sorry I won't be at SambaXP this year, as I would very much
like to be part of the conversation around any changes we make here.

It is not that the the current situation is ideal, but it has come with
a number of significant advantages.  

In both cases the development process includes tests, and these tests
are at least initially marked as knownfail for MIT Kerberos.  This is
not as dire as it seems, because more then 50% of a Samba development
task is tests, those supporting the MIT KDC are presented with a full
set of tests and a list of know failures the address.  

However that knownfail listing is the limit that the developers
providing new Samba AD features and providing the security support are
expected to provide.

This last point is critical, as only one of these Kerberos
implementations is funded, and currently the Kerberos distribution that
the developers involved are funded to provide is Heimdal.

This choice may of course change in the future, but as far as I see it
it will always be one or the other.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead                https://catalyst.net.nz/services/samba
Catalyst.Net Ltd

Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company

Samba Development and Support: https://catalyst.net.nz/services/samba

Catalyst IT - Expert Open Source Solutions




