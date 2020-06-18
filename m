Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 490071FEB35
	for <lists+samba-technical@lfdr.de>; Thu, 18 Jun 2020 07:59:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Tb4oiOFHZoE4xFr6bpVX+XyVh3LD98usNwU5whVfl+E=; b=RAP9aBOv8bbfhCpuP+P+GqQorI
	rFuj7HYybFRpZX58WyQc8k3D86GshZUk85TKAgCVvd4G5zgGPyAYR3hz0rGx9xL+wJdhsofShZF43
	o6ozpW+7uLRhsBSr52skttNE0Q7EgXPEUP4HWw/i6LxZixv/uwKQwvjeFrc4hJ8UXCpnmdX8evrHB
	Z5OygYcrOxvcydMT9KgMR4pHDV38uNu4YP8swOlnK2i4Wg3UbCpu++m1oBeP66dXBcrF1FBlpyJYt
	A9ta0XN+pTGqLw71fRskLHI0f5Asru4UI9/NL2MGX7tb2B1H1nOcPaDMpHy89R8z9ITqKXe3j1ov5
	OrUPKe+w==;
Received: from localhost ([::1]:36620 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jlnZq-00197h-V1; Thu, 18 Jun 2020 05:59:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61688) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jlnZd-00197I-Fm; Thu, 18 Jun 2020 05:58:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Tb4oiOFHZoE4xFr6bpVX+XyVh3LD98usNwU5whVfl+E=; b=R4naE/ySpLZCQbtdGh3132fgM9
 njTH1wu9vS7z8ublQFa9LO+GlNHbyfWDR3JW+SJvLiH1U5QcmNiYPPdWzQJOrf++KgxIiPcxWOX2q
 Bl8mF7gPxHGv3HlbdRYeLdJhSG7kO3LhMg2FQYP/KviW11NOncopVx3f3ZrZbbZMkXl2KohLYm5Y0
 FV7edVn4gdu561pGebckZtPrEo6L6bl8IZQg86eWWTreVBtKJ6FG2jIDdZwLkt2cG5ZGfqE0aorCx
 n8mEKAy6AVq2QTWBUI7pBrUMvfSYpR1oPcarRS3ksVLchGDTYG55r5IUyHOMbRKruhxgqI3OiQvXU
 C+XG4pTyYDR2PpMlkLMgjYfji+PH+tB/glaB6Z4Em6A+BR+njqXgXEI9zj0XXa1SUAtujqSEegz8B
 lM6cDtnC4j8p2k8irPOMtJVGyYcb9gMd3/oRrS20G+pAlPBcnHzmFoysUhpVwwfcnT0IwNcXv2o+u
 AXIzBHRTNIooZ/W9OCTMGBtg;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jlnZY-000327-0w; Thu, 18 Jun 2020 05:58:48 +0000
To: =?ISO-8859-1?Q?S=E9rgio?= Basto <sergio@serjux.com>,
 Rommel Rodriguez Toirac <rommelrt@nauta.cu>,
 Lista samba4 <samba@lists.samba.org>, samba-technical@lists.samba.org
Subject: Re: GnuTLS for samba-4.12.x on RHEL7 / CentOS 7: encourage or
 discourage?
Date: Thu, 18 Jun 2020 07:58:47 +0200
Message-ID: <2567074.7DuDXevEiv@magrathea>
In-Reply-To: <247468aa185782ba94b0751c82b912426517c5dd.camel@samba.org>
References: <655709E5-BFC6-45A4-BE0A-4A885F74377B@nauta.cu>
 <aa4be4c0b8e46decc96097e93d24dc8a935b0476.camel@serjux.com>
 <247468aa185782ba94b0751c82b912426517c5dd.camel@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thursday, 18 June 2020 06:11:18 CEST Andrew Bartlett via samba-technical=
=20
wrote:
> On Thu, 2020-06-18 at 04:46 +0100, S=E9rgio Basto via samba wrote:
> > On Thu, 2020-06-18 at 14:43 +1200, Andrew Bartlett via samba wrote:
> > > If we could get an even more modern version then we can consider
> > > removing even more duplicate in-house cryptography.
> >=20
> > Thank you , glad to help .
> >=20
> > You mean do compat-gnutls36 packages ? IIRC, already when I tried to
> > build gnutls-3.5, I found that we need to update and build many more
> > package dependencies ...
>=20
> Thanks for that extra information.  I wondered what the issue was.
>=20
> Now, the big question I wanted to ask you is this:
>=20
> It is one thing to give us a really big helping hand for development,
> but I wondered how comfortable are you with being the repository for a
> security-sensitive package being used significant number of production
> Samba sites?
>=20
> Do you have the resources to ensure that if GnuTLS issues a security
> advisory impacting GnuTLS 3.4 that you backport the patches?  I notice
> a number of issues here:  https://www.gnutls.org/security-new.html
>=20
> Or should we instead strongly discourage the use of Samba 4.12,
> particularly as an AD DC (because the LDAP server exposes TLS, which
> seems to be a more likely target), on RHEL7 / CentOS 7?
>=20
> (We would instead suggest that an upgrade to RHEL8 / CentOS 8 instead).

You should upgrade to RHEL8 or CentOS8 which offers a modern GnuTLS library.

Especially because GnuTLS in RHEL8 will either be rebased to newer versions=
 or=20
patches will be backported required by Samba.


	Andreas

=2D-=20
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



