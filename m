Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 95392DFEF1
	for <lists+samba-technical@lfdr.de>; Tue, 22 Oct 2019 10:05:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=iuITTNEmxnt306+rYoAL9Of8NYHk2v3lPOoB++XfBgM=; b=zTIvhxHpKK38crnYHrTWypdXG7
	KlYoeaUGXY6jIfmtNp/PoAMldYtT/mHnG+gk4uwaPqle3bxGv7PZgSBZ4GUD2iQcNclao2UN8SFU+
	GmJS/bFTBVOFcIGlnPdOA12nQI1JJL0rc1k1FXVrN+HGYfDxia2z4JWx7SWchay57t6oFVEzQg9qY
	VHpnLq3vbVwckZLJnpDVIzFOI9iQ2i/ERecpxkKQNQI3itdPdTjPbnpyI4EbuCABiPWTU1VXEE5fH
	ZIkiQIBpbOkHepoxnv8K7TMk25aWEAkEjvbZCG1D07xzVlo3yb4A26o3iKfZJ0Q6H8Qj8QAErTr9U
	EZASWqog==;
Received: from localhost ([::1]:35262 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iMp9r-001K1k-TL; Tue, 22 Oct 2019 08:04:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45998) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iMp9n-001K1d-6Y
 for samba-technical@lists.samba.org; Tue, 22 Oct 2019 08:04:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=iuITTNEmxnt306+rYoAL9Of8NYHk2v3lPOoB++XfBgM=; b=P+ShHRWKTWWVFuWMmNf4s1YHQ2
 vWWG/Od9f4lvHvVBXac8AQmNfUHM8LtnGaEDBybqA0AECtOsWMfIZQS7elSMuJS3cdySErWnMHi9U
 AEQIp97fGMT5HELiLHeTL5qt5I2Z/ay8/nbB4nEEPjJX3lzOTs77ZFxsK7uRvb2fFYQ4/xl6+2f3m
 1hm5fVW4b3li+OJijAbjAZbazVwL3wNxJjIwkRra31HdukZCAl8NfhRngXslgiGwkCMFVJ/txUJxx
 jakr9EcLXsNJoJOh2F6YhcrElc0owoi2g2vsH0PjKf1qIZHrK0RyQGF2wya47AbOfBHD/wIDVa4bt
 4zGci3w3WeDdTnzrB6XsCMFpfUlhdSzsRDPi4Q7xcLBxkJhezf9a5P9U2EgIB0cgKEhzFQvvIK1kn
 J+dbcafKZ1Zs6L5xJCNhIglX/3YD8idZMWR/uYnk83tMu5FS2LcOelDHVrUO2Kzn2Bk7Z/jfJ1nfe
 xp2CL8EpkTSWPDhK7SLocTKm;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iMp9l-0001aV-ON; Tue, 22 Oct 2019 08:04:42 +0000
Message-ID: <62d5ad8c301b265e872120c563b8e991674a00c6.camel@samba.org>
Subject: Re: Converting SMB1 tests to SMB2
To: Ralph Boehme <slow@samba.org>, Andreas Schneider <asn@samba.org>
Date: Tue, 22 Oct 2019 21:04:37 +1300
In-Reply-To: <477d3bdf-2afe-35f8-bd06-15bd00568c83@samba.org>
References: <f0f71737-cd07-b361-1c26-58116e6e8ed8@suse.com>
 <0981db46-93bf-f153-c98f-15d5cf404353@suse.com>
 <ed7eb92f-46a7-758e-f3b5-185d71b8b98a@samba.org>
 <8323638.P3YhLeQRCy@magrathea>
 <477d3bdf-2afe-35f8-bd06-15bd00568c83@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
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
Cc: David Mulder <david.mulder@suse.com>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2019-10-22 at 09:57 +0200, Ralph Boehme via samba-technical
wrote:
> On 10/22/19 8:57 AM, Andreas Schneider wrote:
> > On Friday, 18 October 2019 14:00:53 CEST Ralph Boehme via samba-technical 
> > wrote:
> > > Hi Noel,
> > 
> > Hey Ralph and Noel,
> > 
> > > I don't think the additional work of letting the tests use a different
> > > testenv really helps. We'll just have to go through the knownfail list
> > > and look at each failing test to see what's needed to fix it.
> > 
> > Well SMB2 tests should not be run in the nt4_dc environment. That will go away 
> > at some point. It should either use fileserver or ad_dc (if krb5 is needed).
> 
> yup. I guess the tests I was talking about (smbtorture base, raw, ...)
> can mostly just use fileserver env.

I (at least I presume it was me) added much of the duplication during
the great merge.  Many of these tests are also run from both
source3/selftest/tests.py and similarly under source4.

Care is needed when removing duplication (to ensure there isn't some
aspect of what is tested that differs) but it is very worthwhile work.

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



