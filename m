Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBC9F09A
	for <lists+samba-technical@lfdr.de>; Tue, 30 Apr 2019 08:38:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=MKy7OqF/QD0bkHTc0q520PLaxAc+O5ATX8qaiVmLi/s=; b=MdwzkDo7AQoh3oEVrY5AhnUKwP
	KBzyB9PPDg8jXkqTlIZgL6sz/1o16j85dmEL9LcEP2jWOnv4a41G1FJ7MXa6D4WJkgonyriOFtxpn
	biQL6mqRY3omZZVZgm123y5m/0kvPRLkRvPIWWzmPKNf/IFz2bz3csVJn+IowOp3uedWwNzWYJNc8
	A4vbD1o/I8YSLecyR+M7j46V87Qus+lZGWAXTDCbCwbwMdNKcqa+hCE3REywyygvXekhURjoFhFOa
	ANKJPEDxGRqBIx11HM5H9QIV2+3qbhR1BiUihufglJ1l6D/I/rHK3XyN+VLck1f+8KWcG65qm8qtg
	VaQPtYZQ==;
Received: from localhost ([::1]:24972 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLMPN-003nZ2-It; Tue, 30 Apr 2019 06:38:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:18422) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLMPC-003nYv-8R
 for samba-technical@lists.samba.org; Tue, 30 Apr 2019 06:38:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:Cc:To:From;
 bh=MKy7OqF/QD0bkHTc0q520PLaxAc+O5ATX8qaiVmLi/s=; b=FvlJAf7W2GYeZQt4TaGpWUiDMc
 q6nttJVWfAa9JtFy7O9w3XYd1WyXhxIcgkRG0bQRq3REzZpSJVoncsQXRshdnXOgmQgenm8LWksoC
 QGIIZGCCY9znv7zwaTJgcdcajYvnYLVlMZewjLxYWgaHpTajce4ABK19pyIFw5T8x8vQ=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hLMPA-0006yX-RY; Tue, 30 Apr 2019 06:38:17 +0000
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: getting centos7 into bootstrap and gitlab CI
Date: Tue, 30 Apr 2019 08:38:16 +0200
Message-ID: <1634253.Q9F5WFE65d@magrathea.fritz.box>
In-Reply-To: <1556598606.25595.91.camel@samba.org>
References: <20190429193555.GA28948@samba.org>
 <606612F7-D9E4-4043-BBDE-4A2C1CE0ABBB@samba.org>
 <1556598606.25595.91.camel@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
Cc: samba-technical <samba-technical@lists.samba.org>,
 Christof Schmitt <cs@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, April 30, 2019 6:30:06 AM CEST Andrew Bartlett wrote:
> On Tue, 2019-04-30 at 06:21 +0200, Ralph B=F6hme wrote:
> > > > Also, could you please look into adding CentOS 7 as a supported
> > > > platform via our bootstrap system so we don't regress here in the
> > > > future?  There is partial support already, but it wasn't finished
> > > > (mostly to avoid chasing two rabbits at once).
> > >=20
> > > That is a new area to me. I see that CentOS is listed under
> > > bootstrap/generated-dists/centos7/. Would the only missing piece be t=
he
> > > centos7 entries in .gitlab-ci.yml, or am i missing something? I can g=
ive
> > > that a try tomorrow.
> >=20
> > that would be much appreciated and I can help with that, but it's
> > certainly not a requirement to get your patch for the missing-field-
> > initializers in. I'll review later on.
>=20
> Thanks Ralph for offering to help.  It has been really cool to see so
> many folks stepping in to maintain and extend our package list.  It is
> lovely to have this task, but even more so the knowlege of how to do it
> practically, distributed around the team!
>=20
> I totally agree this is not a pre-requisite, thanks for making that
> clear!

Here we go. Should be fine as GnuTLS and KRB5 are not that old as on Ubuntu=
=20
14.04 :-)

https://gitlab.com/samba-team/samba/merge_requests/399

=2D-=20
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



