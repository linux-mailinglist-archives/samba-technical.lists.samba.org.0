Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9404C51CF22
	for <lists+samba-technical@lfdr.de>; Fri,  6 May 2022 04:58:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=QzwQ7ZAcEQPwtbnSudEblX1O8eV9/B6IxrvQU2VxLgs=; b=FJXJRKYI1bsjOoGkG/3tOwmto2
	9EXoG5M4L9Ds5KWT1dcEPpjIZvga5J4ALWFsVHSvQaN3F0RV10EE02bC13394ME/zcMZ4p7l9o1iz
	Vet3Kf2Y+EhvAhPjRVTotumTWdwrQSUj7XRQU/dTaLaoFeoAOVEHPoiLNdfZ2onx2gaSYTmf3RgBT
	ZUejk923mSbXJPIqFCosMDwqAeKSBUerCQVmwSBuL3yA4jVWWNb254bJ5f4tcLxtpsrPBnjKdvU3q
	FVyaC9F1ZRoai9DPogghl6j0AyTICNvbUxhm0uU+XXXwd1LcWBUhzGlYxNfMQP90u6EK2VtAKiRny
	x7fFETHw==;
Received: from ip6-localhost ([::1]:21444 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nmo9s-006J8A-HU; Fri, 06 May 2022 02:57:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53672) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nmo9n-006J81-PE
 for samba-technical@lists.samba.org; Fri, 06 May 2022 02:57:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=QzwQ7ZAcEQPwtbnSudEblX1O8eV9/B6IxrvQU2VxLgs=; b=F+h8gkZ1Tvkny5hxBn0xIiHix6
 6IRIZLDsKxDBNa7g5VVrHR/3pzKFKbVT6o9ZoThRm0ATMoIu9h6hM7kfavDaeM30BQ/3LNjXLNKn+
 SBA3ElGRwcMxSUFVafsFty3APQ0TM0S480G50GHbPDORZptU/V2xd8WE+u/dI4wFzZBk1mXiZGLdn
 P2Q6WW8s9GY0idMKTrZtxf/mYkaUEuUgcykM90FzR83nS28MnKxVY1qp7AB9aDMkMRs9DCJW7IfuN
 jit+aFGgzyGgKo08rgznat5bopSalAer2EBk/hTmAuFkxqRgdcZttP9fSWVRHE9xO0SCBsl2ndvA2
 4JYbWvI1vljRSRIFIszzyQw5bQM2pf/NRRj9xTlwx78ERrUXt+XSxNOpueOU58dl2vnsflxpTbzeo
 xqfve3au7vFwqszQtQRxm/tHMRmvUU+/Doj3t6egPl4uOZbMvYsaWmdC/Ex6s2TO7uNWjYNCugy4A
 YMFktyK2LImr9ELGSQTLUcly;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nmo9m-004Qdq-8C
 for samba-technical@lists.samba.org; Fri, 06 May 2022 02:57:27 +0000
Message-ID: <cce05b792f8377095d010cedf715bdefdcc580cf.camel@samba.org>
Subject: Can someone try buildar for building our bootstrap CI images?
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Fri, 06 May 2022 14:57:23 +1200
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

With GitLab CI starting to be limited soon, it would be really helpful
if building a new image for our CI tooling didn't require a privileged
docker, as we don't want to enable that.  

We do this in our bootstrap system, triggered when we want new images
as the dependencies have changed.

Currently we rely on the fact that the shared runners provided by
gitlab.com allow privileged operation.

But there are tools that replace docker that claim to allow this, eg
buildar per
https://codefresh.io/devops/docker-images-without-docker-practical-guide/

It would be awesome if someone could have a practical look at this and
if it really works in our use case propose some patches to move us from
privileged docker to buildar, yet still upload to the same GitLab
registry.

I'm more than happy to answer any questions.

The files and templates are all under bootstrap/ in the source.

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


