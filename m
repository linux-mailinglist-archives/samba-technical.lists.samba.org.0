Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 747837934BA
	for <lists+samba-technical@lfdr.de>; Wed,  6 Sep 2023 07:10:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=+MqHbdftUSC2HAweiV7CgnLnS65Rgy05qtYpMvx420s=; b=oyiLM+vtOo2f41fa40gIYbGmMy
	ZDXpe7DDWqa9BCWJ8c6Nt2PDc4hb3YHJocrNQu1n4dtZcHzC3fYNRKyz0X/A7pTjIIze78p0n4GKV
	H05MgeQYCGuMxIsZmDLm6RQLJEurgMChqf1HO5Od1qRcfw0fLSZFhouNF0iLB3CvYukW90OemMFsn
	QjKxkSGPNhMJE41HAuNjyMjOGlhvXW963/3wO7vkQP4jU+gcskY7rowmo8kipv5jFOhk2Ttu0jUcO
	0susMTfx4zDl4k1rbtXZGeSxt8lpEAWX2kCTV3v4VYoiqDSU8qlQUlL58HaM4X+2hXPcud0nSBwqV
	RfdaL6LA==;
Received: from ip6-localhost ([::1]:53340 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qdknR-0015zt-Ha; Wed, 06 Sep 2023 05:09:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58190) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qdknJ-0015zk-Lq
 for samba-technical@lists.samba.org; Wed, 06 Sep 2023 05:09:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=+MqHbdftUSC2HAweiV7CgnLnS65Rgy05qtYpMvx420s=; b=WP1KHS4GAL738sLBjumiOqOGEg
 jJ2IxDL66LG4zWyYmpwN5NAwPJlEQkNJCd03MzTTJJpIo3g1n0A03oqutI5uI9lK++SFHFgscYHVi
 3l7Z7nOsob691ENMq8EwHh9qhOJJIXFdbKbYORgMpkNTDz/StDQlRtb3xOgas2DU2DPPrZ4MYBaxI
 55eb9PqByI8g86oiDB3cP0gB4EpmtqpiTFMYvNOeTeN7x4T/k2xRzMh8dYe50XNRkLBNKfur8wyNo
 n2ki9u6BZLOCwLDjZtmNqUMZsvZc47XeCGMYsbgalAuFAl+z8HbP4JJSoRd3v+H221fsbmnIcYf0F
 IrgInah5Bjo9DFASk9rC4G7oGJ6SObD8HiFZvwjCQbcqBwqVpLuL5f4UZgGpQRjalbOASoZf9/jiW
 iqIYK9WewitMO9Xs2mTdfxl9pkCRaVc5XFkvzlJINKbW5gPTYPNPmSfObmy76YUqoAqGPPF3NObzm
 bp6rVgt+JK5uJxuv6PO6876f;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qdknI-00C0IN-1J; Wed, 06 Sep 2023 05:09:36 +0000
Message-ID: <6ba496d3-05b2-3fdc-fcc0-782e6b452db2@samba.org>
Date: Wed, 6 Sep 2023 07:09:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: GitLab runner update - fix samba-fips on Rackspace runners
Content-Language: en-US, de-DE
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <38e471b78bcb1e2584adb304bafa7090c18616b2.camel@samba.org>
In-Reply-To: <38e471b78bcb1e2584adb304bafa7090c18616b2.camel@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Andrew,

> The old kernels were  4.15.0-159-generic from Ubuntu 18.04
> 
> The Kernel under our CI images is now 5.15.0-41-generic from Ubuntu
> 22.04

Can we use the hwe kernels there (linux-generic-hwe-22.04),
it would mean we would get 6.2.0-31-generic, and even more
recent ones once ubuntu 23.10 get stable.

It would mean we could do io_uring tests with the latest
zero copy features available with kernels >= 6.1

> The shared runners are 5.4.109+  BTW.
> 
> This seems to fix a persistent failure in the samba-fips test, eg as
> seen here: https://gitlab.com/samba-team/devel/samba/-/jobs/4840635606
> 
> I've also taken the opportunity to set the maximum job timeout in the
> Rackspace side to 4 hours - within 5 hours a VM will be terminated by
> cloud-checker.py, as script running on the bastion host, and to make it
> not block.  (Blocking deleting hosts is bad, sometimes the calls stall
> and fail to complete, preventing other VMs from being killed off).
> This should help keep our CI bill under control.
> 
> Also of interest is a MR to only use shared runners
> https://gitlab.com/samba-team/samba/-/merge_requests/3255
> 
> I'm shocked to see this all green!
> 
> This would mean we could save our private runners for security work
> only.
> 
> Finally, I've noticed that GitLab upstream has removed their reliance
> on Docker Hub, so the limitation (an aggressive rate limit) that
> blocked our move to OSU OSL a while back no longer applies.  If we
> chose to go the other direction (move more CI to OSU OSL, say if GitLab
> changes their CI terms/fees) that should now be entirely practical.

Thanks for all the work!

metze


