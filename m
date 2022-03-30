Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4022C4EB80E
	for <lists+samba-technical@lfdr.de>; Wed, 30 Mar 2022 03:58:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=T7P+lhLAwNo3yHdid/iG4voufo/CuQk3CPPTiBgKuYQ=; b=nxFDKFun5WneED4yKl26BrKV4r
	4ij6kIfaOBNikSByqI2C2t73+9MTSxaSKgBrw1v7uWusqx1VbAZPyBP9SPfQ8A5iGva9CGfp5lvAo
	25RMMBX9odDNa0XwwnXXRtmTypbgw6QVn4DdOAayrKYUxQr20IAqnD4fxZjE16TJhzDk1nzrCh5KP
	XDo3/UbQiaXdooQz72170G4NegCT6JdLdfabSl73QaABSEA0U98EKvQ+t1bNE8tKYF8RQ0XMezvnN
	nzRLIHAf8j+eS2B45MuseSzAZsyR26h4etTw7yi5wAOzChOVeACP3mi6aclIXZklCl6d60tvXz8DB
	jAE7x6HA==;
Received: from ip6-localhost ([::1]:28956 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nZNbV-006bfm-3N; Wed, 30 Mar 2022 01:58:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38022) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nZNbP-006bfa-TC
 for samba-technical@lists.samba.org; Wed, 30 Mar 2022 01:58:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=T7P+lhLAwNo3yHdid/iG4voufo/CuQk3CPPTiBgKuYQ=; b=qOY531UebzslelFPNNfWhZxNqs
 jPmAk0cz+tDFH2PMkI4OMpzX88ASfuVaMXrwAWdmxV5vKuhxVZOZeHmCOEHmxSAya5jrnIsDOtYT2
 4Kk6C0dsVY1rJUEiiXArYw06adFWog2QIjYGvIQndzhUsXguFMqyeQtSRR5nV3RfG6WXTSOTqywC7
 opOzr6Z2JkOuKyJpk1qe+EHXWkjaon/OVxhIYvrJLu3/tKkaX4DHabSAB1ElsX9UYPqgobOpbJ3Ka
 Gr9ypZF6XfOrMWRqIF3UUwAWBXCK7Y+k3FTFtqgGRUH3cdRzyDm3JM/lnUzgVPdvuBQHVow67dGSn
 LCsPtFX409AuU71+HLET//PpTPBS2sfgp6VAUP0bVwCQWh3FdHkR3vmIHxg9HVq3MARhyzs637pEx
 0fXxjQaOcnIhf9leXp66ALvQ7zHLxIT0Boz+Bt4L7+H7NpTMgAQZc55jX26R5boxtSCc3Y0LnVcmg
 pAnPU//hMMX+pdBzKwA/h0z5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nZNbO-004IXC-BN
 for samba-technical@lists.samba.org; Wed, 30 Mar 2022 01:58:27 +0000
Message-ID: <876474b210bd2028872fac9d8cc7fb6174f7fb22.camel@samba.org>
Subject: Re: GitLab runners rebuilt
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Wed, 30 Mar 2022 14:58:22 +1300
In-Reply-To: <b1f45529d772a0daf5da99cb48e9ce2d0161a36b.camel@samba.org>
References: <b1f45529d772a0daf5da99cb48e9ce2d0161a36b.camel@samba.org>
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

I've again rebuilt the runners, this time to get our security repo back
connected to it.  I even remembered to push my changes back to the
public repo!

No change in the images yet, so there should be no differences, and
builds I started seem to behave as expected.

I've also deleted the old bastion hosts so that they don't cost us
money.

Let me know if there are any issues.

Andrew

On Mon, 2022-02-14 at 17:37 +1300, Andrew Bartlett via samba-technical
wrote:
> I've rebuilt the runner host and the runners should start a bit
> faster
> again with new base images (they should have more of the updates
> already applied).
> 
> I see jobs are succeeding so I think things are OK.
> 
> Andrew 'I only test in production' Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


