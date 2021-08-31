Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 413AA3FC207
	for <lists+samba-technical@lfdr.de>; Tue, 31 Aug 2021 06:56:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=yogcMqTQhneuaxmGcTMNdDwKjDiQ+aisBcHqhRy24UQ=; b=09uPlJlVAUQFDaK+W3Vao3PYeM
	wXBzacJBzhxWbJ7zLtczBIGpkDSADG/WWU1TvPWJp5BxtpBRCfhRrFTn2UpTQzepQUWif5YhRjZ6s
	35RtwTwGaA16QvR/hr9DIrR37HFhQCK+JVckrlgd59nHYbfvl+B4RicDrVm4Ff49vzLIS0B4O2pFS
	AQF9ELVKJNXfjmtVxW+koYdBZONJla/lzuqNhzyh/vTYywTIhkF7Btm1lgv2ctx4GUjEeIonN3drR
	KGyeJDstxIfjpyCKwJoyG/ZWvm612gbvcGFvrSNyIkzPsnrmStuLSeZp7qimzSt8uwxniey6xor2T
	m3JaV92A==;
Received: from ip6-localhost ([::1]:63162 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mKvoE-00A3xa-D1; Tue, 31 Aug 2021 04:55:42 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31414) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mKvo7-00A3xM-26; Tue, 31 Aug 2021 04:55:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=yogcMqTQhneuaxmGcTMNdDwKjDiQ+aisBcHqhRy24UQ=; b=iv3/zIGtUo/vKI9BNFmbWIpPxF
 xzcRvH/jg0IxV3XZDAbjlImFW9hn9I6EXq+0/PpwmchO8JYl4AWw0I4AHXXU32zXcCUsc6SE+m7wA
 17bkjLVowmRnXGIr7qk1nL4fKCVaeTSIYsqd949D2ZhmafNY4JBhkcy2c9OoHNCzxfV5y3ewVHqJ1
 7Do4rIsYpRtvlv7bQu++2CJMKDB1n3SdTAgqFQ6Nc7DJi+uVTuD2RpmeAhuYELR9LejozpgT08CiE
 7aXrAfcdN9IxjBIe4WlS0o+PJYFImqNVrV0hmZTpZG0eg5iJqgUJ+7JkP4MWg7shvIUA5X4EHudC1
 x4XNbgjFCUpFE3Jhu4app08xCWrIgHk05bIJjTDfdUzyZQARfSsHb8X2gYmxm1ziEX5M74ucEtboI
 AsaIRCwAtikSh3dsdTyBRucMaxD45iaJ7AJ2QVyQrG/gS/qDScO+eXoERL7nE0Wn+qqL8qmULNfpw
 ZpK9MYwWG/tgpg5q90h/2tjd;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mKvo1-003n52-Uy; Tue, 31 Aug 2021 04:55:30 +0000
Message-ID: <4b50e1f825156d3a0ab9d88065a03a101526aae5.camel@samba.org>
Subject: Re: [Samba] [FEEDBACK WANTED] Proposal to not do security releases
 for recoverable DoS issues
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Tue, 31 Aug 2021 16:55:26 +1200
In-Reply-To: <09cde79a5294b2d1b163674c01c9fb1c56e4a747.camel@samba.org>
References: <09cde79a5294b2d1b163674c01c9fb1c56e4a747.camel@samba.org>
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
Cc: samba@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2021-08-16 at 16:54 +1200, Andrew Bartlett via samba wrote:
> I just wanted to give folks here a heads up that I'm asking the Samba
> Team to change the Samba security process to avoid issuing a Samba
> security release for a Denial of Service where that issue is not
> persistent.
> 
> There are, sadly, many ways to overwhelm a Samba Server, and
> occasionally we find some ways that are not just flooding, where
> particular packets can crash the server.  

I've made that change, you can see that here:

https://wiki.samba.org/index.php?title=Samba_Security_Process&type=revision&diff=17607&oldid=17181

I've had feedback from Red Hat that they would still see value in a
CVE- number being assigned for such issues, but without the rest of the
process.

As Red Hat assigns those numbers for us, that seems reasonable, but
I'll put any further changes to the Samba Team, as the team as a whole
owns the policy.

As this means some CVE- marked things might be referenced in Samba
without a security release, and because it is useful anyway, I've added
links to all the CVEs in bugzilla to our security pages. 

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


