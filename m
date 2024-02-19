Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FEA85AD47
	for <lists+samba-technical@lfdr.de>; Mon, 19 Feb 2024 21:39:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=NsBb4DUVe7e1XUp9/uGqd15ibA45V6JeMt/S7vMu4Uw=; b=zQgz9joIua3bZgBejwFleCGaOh
	CODTIZ9TH9kPiHd2vcrxJOLxQoPYOscgfZno4U/v+6YYJspyVE0KqNxJIsrkTTpvYs7Vj2SD+X2Us
	nBfknVh6aipg4b1z8eGLTS5hgBAYYF4or8TbWgYR6QcYlTN99Z1GdvkPvEIGCGtlFv67NUES4GVFt
	Xd8MVqTBMGv5xL0znh54bZdVRSeoMjp/yWMzL8CyBAjMeBEmj3Ys/vmwtEIk0q5QuM7Yk3iZJZLQX
	o/78CUusEZPjiK9jRMpPDmMcc3RM5EOq0uIkVl8f54nIHd03wbWOfErAjfOTWaEcGg84iq53UvV6V
	FJkttlIw==;
Received: from ip6-localhost ([::1]:55914 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rcAPV-008wdb-GZ; Mon, 19 Feb 2024 20:38:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33130) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rcAPR-008wdU-8s
 for samba-technical@lists.samba.org; Mon, 19 Feb 2024 20:38:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=NsBb4DUVe7e1XUp9/uGqd15ibA45V6JeMt/S7vMu4Uw=; b=QtTPDiQg19neyJAfmuN0i9QfLj
 mhEGBNxe7g3sr/TySrJl3LG6JVQq6wxPWKOUbwx8J37t4l6Fppoa5hoxi3fiBRMFQSLZh/bdrAecq
 O8U9PMrCYMLpJmeXMSlInMJnwvCp8aGBxvH1XRzfvhb6N2KLPQIub5xUTNSfBB4/MF5nYzH4sAcMX
 IDVucBLkwJ0/WyJOvxpD3xr/bEi0pDA56d/I6RgmpCp4LUaJ59sSnnbWx9rX6KWCcxSAKWzDsC9wf
 11cpIFGiRz/bkjhqxN+Q8VeWtkiwzFLffTx6lUXgn4tMq9WOtEpNOidMW3NnD8LmmdTP7zsdpTHSi
 grDgY4QhccSO7YEL/i2G3zJT6niWArIDDR3jVykVb8RqVf3PNrF77EUw0RGMrFt2eKS0ramf7/u45
 fpM7WX5CdSnPg/PUmi7uaU/D0UwzeSVT4uDReCJZOzclij60kafiiigSOC6UMHiXdOTGhvIwzcHS0
 Oezv9rw7cg3ikWLgMp2TFkRz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rcAPP-00DqCm-35; Mon, 19 Feb 2024 20:38:40 +0000
Message-ID: <017aeac7f3da70b70c14d5f8fbdf9abe20dfc5ab.camel@samba.org>
Subject: Re: setting up authentication policies in 4.20rc2
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Date: Tue, 20 Feb 2024 09:38:35 +1300
In-Reply-To: <20240219164507.6a37e945@devstation.samdom.example.com>
References: <e8210ddc-4506-4255-bcbe-f24ff86b2f0a@kania-online.de>
 <d7e23578-1526-4835-9438-306da6a95ac1@samba.org>
 <20240219164507.6a37e945@devstation.samdom.example.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2024-02-19 at 16:45 +0000, Rowland Penny via samba-technical
wrote:
> On Mon, 19 Feb 2024 14:48:06 +1300
> Jo Sutton via samba-technical <
> samba-technical@lists.samba.org
> > wrote:
> 
> > On 18/02/24 6:11 am, Stefan Kania via samba-technical wrote:
> > > Hi to all,
> > > 
> > > I just tried to setup authentication policies and authentication
> > > silos in 4.20rc2.
> > > Following these steps:
> > > 1. create a policy
> > > samba-tool domain auth policy create --enforce --name winclient-
> > > pol
> > > 
> > > 2. create a silo
> > > samba-tool domain auth silo create --enforce --name=winclient-
> > > silo
> > > 
> > > 3. adding a at least one user and one host to the silo
> > > samba-tool domain auth silo member grant --name=winclient-silo 
> > > --member=winclient\$
> > > samba-tool domain auth silo member grant --name=winclient-silo 
> > > --member=padmin
> > > 
> > > BTW: In 4.19 it was "silo member add"
> > > 
> > > 4. Set single policy for all principals in this silo. with 4.19
> > > that was possible and that's by the way also possible with a
> > > windows DC. That's on a windows DC called "Use a single policy
> > > for
> > > all principals that belog to this authentication silo"
> > > 
> > > In 4.20 the option --policy is missing, you have only the option
> > > to
> > > add: --user-authentication-policy=
> > > --service-authentication-policy=
> > > --computer-authentication-policy=
> > > So it would be nice if the option --policy will be back
> > > 
> > 
> > We removed this option in commit 
> > c22400fd8ef961e472ce2803cf4a2ec58b778795. I don’t remember our
> > exact 
> > reasoning, but we must have thought that it didn’t make much sense
> > for a user and a computer to share the same authentication policy.
> > 
> 
> Can I what was the reasoning about this ? Seeing as a computer in AD
> is
> just a user with an extra objectclass.
> 
> I am trying to get my head around all this, but I am struggling at
> the
> moment.

The difference is that user's log on to computers, but computers don't
have anything else to log on to, so policies that say 'you must log on
to from these computers' make no sense.

Computers can also authenticate users (check their password over
NETLOGON) and are servers that can both accept NTLM and Kerberos, but
yes, the introduction of authentication policies is the first point at
which users and computers started to have a real difference in how they
are treated when acting as a client.

This is also why the options were split, because in development we
realised it was really easy to set a policy that made no sense, we even
went to the point of banning some in the UI.  

But yes, we would like feedback on the real world application of these
tools and while our work here is done (I can't promise that we have
massive amounts of time to come back here and rework) if we do, every
detail from the real world helps us rework once, not multiple times.

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




