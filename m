Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DBF8C19EF
	for <lists+samba-technical@lfdr.de>; Fri, 10 May 2024 01:28:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=DnljwazIut5P5IfAyOmMLknEOmhTJP5SZSArin3Lzlc=; b=gHs8AnbKUw2ZaFUXE0pE9FEA3C
	E/pGNtDYSkiydVgcswCghpS/shZvxBEfyd5M2eoIZIQuaH13Ub8NfamTc2tp4HFnYl7Dqnfk2ZrXP
	ZaXGay95L8bOudMt+/WC0dMsF8ImZgc8YNp/KVUK8fTzSUlwEnaLo5SIqYMvddozVBUNkkc+V+RuS
	lSaqU9KOBu3eotPM3ONkEgy95EBsrduQB1JUHYJrMEs/4RwtlPXpw4HQIThuPI0ps/ljKObmc+EsB
	AgCr+/P5iH86i0U1p7Vm6/R4tb+4ZYyN1jWd2+mEc+i25eCu7CI/U3Q4lt0EF2brxt9Vhmz2pVpmk
	7q8liIkA==;
Received: from ip6-localhost ([::1]:34566 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s5DBp-008baC-7p; Thu, 09 May 2024 23:28:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30348) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s5DBl-008ba5-MG
 for samba-technical@lists.samba.org; Thu, 09 May 2024 23:28:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=ir79JAS/imjwPouDI3jGDT8+sMfAovg+8iPJij28eAg=; b=CRc0acxo0+scO+7uWFPmmF38B+
 YjTTpQwB35sbVCWeCxpv23BtWEmi+YuaTodb+IIiLw1pclCSYHvdA83C7eHByaqxFOP0bZDdXWFNk
 5MniXInNEhn2Ch5I8VzR8wfwruLeZQDAcpRwF7dfVmtkhN1TNtMRnL2Ygj8kt4Ik4iASaGzch3Y9L
 /NzGtzM+u4B2tIkTWQvbTMdMkafp28UTuhYNIFy7cs/sPwdvJtDvIRe3cM2uGuJ7zzTj3TeQCzQfZ
 eCdz2bjPSUIqGbg/lbqQwx7X6PF9v6C9F7THmNuxEXUx3ixza4qbx5Uz0UHCYHnyrOZ/XITErWq2a
 eSDrIQQ2Z4gYCv12Keily5iCAqBe9NgBO+7GoX9TJaTUT1097D9AZ0v4gGJUR88f2RUPh9RCDX12Y
 1dRXw24PBxdGYiOQ2TzZtcnPx/eOzx5NveUnECzStZgfkA2Hq/ieZbPLJQss3xgdhTYKrDciNZRVW
 1oLCe7cyo9mw2XclEBGUqi82;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s5DBk-00AfzL-2V for samba-technical@lists.samba.org;
 Thu, 09 May 2024 23:28:37 +0000
Message-ID: <dcb30e48cf3554970f35ab1848e63be187187b62.camel@samba.org>
Subject: Re: Rackspace runners rebuilt:  Also note on differences between
 our runners and gitlab.com runners
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Fri, 10 May 2024 11:28:34 +1200
In-Reply-To: <6ce4a15a3edac8db93fc9a744aebb0138d9ff5db.camel@samba.org>
References: <6ce4a15a3edac8db93fc9a744aebb0138d9ff5db.camel@samba.org>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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

Douglas correctly points out that 20.04 would be bad, it is Ubuntu
22.04.  
Andrew Bartlett
On Fri, 2024-05-10 at 11:25 +1200, Andrew Bartlett wrote:
> Just a note to say I've rebuilt the Rackspace runners.  Still on
> Ubuntu 20.04 due to availability, but rebuilt.
> It will means that if you have not rebased your branch on current
> master, it will now be 'stuck' waiting for runner tags that won't
> appear. 
> One challenge I will note is that GitLab.com is now running an 2 CPU
> 8GB runner, but our 'untagged' runner at Rackspace is only a 4GB
> runner.
> To upgrade to an 8GB runner at Rackspace is double the price, because
> it comes bundled with 4 CPUs.  
> In normal use we would only use untagged runners after our CI mins
> expire (currently we have plenty) or if there is an outage or
> throttling, but for security patches we use this 100% of the time.
>  So we have a choice:  Assume we still fit the 'untagged' jobs in the
> 4GB of ram, or pay twice as much and not waste time chasing
> incompatibilities during security work. 
> A security CI run would then cost $24, rather than $12.  
> BTW, if we don't make a change now and are in a pinch, the
> configuration of tags -> runners is now in the GitLab GUI, so I would
> like to document that we can pause the 4GB runner and select 'allow
> untagged jobs'.   
> Finally, given the way the new GitLab authentication token setup
> works, the next person to rebuild the runners will want to rework the
> scripts to have the 'blue/green' pattern used in dev-ops.  So instead
> of 'testing' and 'production', we would have 'testing, prod-green and
> prod-blue' with different authentication tokens, so we can pause the
> new/old runners again in case the prod deploy doesn't go to plan. 
> Andrew Bartlett
