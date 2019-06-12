Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 926F74311D
	for <lists+samba-technical@lfdr.de>; Wed, 12 Jun 2019 22:50:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=4yfJhVYRablgimYqfgDiCISnQDnHkGlKTCpooJOF8iI=; b=hyB6aoF/AMeMJKVt3hvQshFUiO
	ZF76CDcn3fQO0yz3gDmPIbLyYa8KdFrgUvxyg3IoUe1k9KuOiCKRzvK4+zhGvNPiyOjPsUPBiVqTe
	RQFcBLn/gKHbGcsTo7XqsTK+2MuYJL/PT57CNX6TrAI3Hj/yYbQU84OVdx4eueBAbAL0ld84ay9Uh
	AfX9LlM2THpP1kOucEr3OWmhmMss+f+pTZuda7SbQDP20cou2t+uo1io4K6CxV5xVWV5hME4aCW8I
	1eODQ5Pqme4nVC6HeSBgLbZohou7+NEi7lwcSZ8LQmZ2lOkn6O7swbt50T4CCUv3auvZ1dIyDoRvC
	wXu5oCTA==;
Received: from localhost ([::1]:62966 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hbACK-001N4v-8x; Wed, 12 Jun 2019 20:50:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35984) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hbACC-001N4o-Rc
 for samba-technical@lists.samba.org; Wed, 12 Jun 2019 20:50:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=4yfJhVYRablgimYqfgDiCISnQDnHkGlKTCpooJOF8iI=; b=VCm5jv1LSKv0wiBdznpljN3Cqd
 rqxz7p8JNlkOggnfZyeHU+uvJ8DBHuL31HPMMRsno0xDMfQtnUoY0vR19+j6n2MJsE34p/YAimBau
 XAWuh/UBtZlngMBigw2m1ReG1wzLUoIoV2fbGnQBW2NMgnCNaHr0nGGgzgrxfCs+nh/0=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hbACA-0002Rl-Is; Wed, 12 Jun 2019 20:50:11 +0000
Message-ID: <bba2b7b229846f564753bf28cec3d490b268fba1.camel@samba.org>
Subject: Re: Some bugzilla work and thoughts
To: Amit Kumar <amitkuma@redhat.com>, samba-technical@lists.samba.org
Date: Wed, 12 Jun 2019 22:49:56 +0200
In-Reply-To: <b37e1c69-bb71-68a0-24e7-555d09cd6659@redhat.com>
References: <c976289f207aa7ab941cb368e38e806201eff36c.camel@samba.org>
 <b37e1c69-bb71-68a0-24e7-555d09cd6659@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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

On Wed, 2019-06-12 at 18:35 +0530, Amit Kumar via samba-technical
wrote:
> Dear Andrew,
> 
> So do you have plan to reduce/work/close(RFE maybe Not even in
> pipeline)
> on bugzillas to lower their numbers.
> What i find is It's even tough to search and start working, Since
> quite
> are in NEW state while patches are attached to them!!

Yes, that was the idea.  I was hoping to close around 10% of the bugs,
and perhaps encourage others to close another 10%.  This was
optimistic, I only got to triage of 2.5%, closing around 2%. 

I agree, it is very hard to know where to start, plus patches really
(even if not known at the time they were uploaded) need to be merge
requests to avoid being time sinks for the reviewer. 

I'm no longer convinced that Bugzilla is the right tool for Samba, but
I don't know what would be.  

This isn't are reflection on the administration staff, just on the
quality/properties of the tool.  

Thanks,

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




