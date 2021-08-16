Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4163ECDCD
	for <lists+samba-technical@lfdr.de>; Mon, 16 Aug 2021 06:55:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=rjn3VQp6BvmqavxDkmjV+Bmm6IOXEWXREUu6FeIRgRM=; b=cw75+3FL1GfOyn95DVyK1ko9Z0
	DwyyNdbQSQRh3sl5wAF2koMADZHuGsj2dMzjPPxBj/W5zsY7PNrbx6ZSrYneVj2VnInSFPzOx8PS2
	97WgOUUyNGxHXzEMCSMNC8XOOpMb2O18yP0TSGewT2/MF7dytqwokhhaATtLp17icRE5q4pg0dR4T
	UY0m+Quvi1qAT5uMSGFaIMvlN2ChnjxZtXcibN5i2NBn5miStHc6L9rbwfoP/oTQ8wRsbPzWQKYXL
	+nnEUGSBO/hzpQtTp7+rQwUkL5EVnB8blIfwWuEPRpM/OpCwiXHf/P1v1ZNbVffa5IcU4bYfYsYcv
	Ra3MneEQ==;
Received: from ip6-localhost ([::1]:47084 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mFUeL-006KC7-P4; Mon, 16 Aug 2021 04:55:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34568) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mFUeD-006KBs-NU; Mon, 16 Aug 2021 04:54:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=rjn3VQp6BvmqavxDkmjV+Bmm6IOXEWXREUu6FeIRgRM=; b=HUFO0UUFGewhwPfXpI7scgHW+6
 xcuCJTKWHH/F1HuviehMtd4qcQOIAshPGzjDC6JIEdACO6PYaIZ9Tu2xENDXWr7kGuPsUqXj/XYxL
 VlD4qsfEPGRZDIVpkpoYc3w0VHa0JG46MybTVlwi5xIr9C7uClddW40lK2OHjgfKR+ssRyzNjCwAC
 Rpg9CET/uyxJsuhOoOh+J5q84t7E5BIivCEXEpJunfYdWmhPWsV4GWfVkWh35tqAkBjUbU8itBRYh
 QtQ3KMVFpPCBQTuNhGcv3mNolYjT7TJrBZRvo/hqw9+5l2eVUZ3aXVLmRBxGuTBnfeTw+8g91+dVB
 8ot39YzJY0t6h87J1/3Om5Jao05a5+AYTNSInsQOFxSuPQg6Q5jEBrA6dr84DoU85kklyEqKbyJab
 aHypxAC7RYq97lMvqHEZuKUFYMrjcnv0JwLeqv9qQCtrGavAWLIFGJoNVFjIpunK8H343cNDCQzOi
 7bwXTqcEv3GUzxCO9pNE4Ph8;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mFUeC-001Q36-76; Mon, 16 Aug 2021 04:54:52 +0000
Message-ID: <09cde79a5294b2d1b163674c01c9fb1c56e4a747.camel@samba.org>
Subject: [FEEDBACK WANTED] Proposal to not do security releases for
 recoverable DoS issues
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Mon, 16 Aug 2021 16:54:48 +1200
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

I just wanted to give folks here a heads up that I'm asking the Samba
Team to change the Samba security process to avoid issuing a Samba
security release for a Denial of Service where that issue is not
persistent.

There are, sadly, many ways to overwhelm a Samba Server, and
occasionally we find some ways that are not just flooding, where
particular packets can crash the server.  

Where the issue is just a crash - say a NULL pointer is de-referenced -
and where that part of Samba does auto-restart, for example in the AD
DC for the LDAP, KDC and RPC servers, we would just fix the issue
without a full security release, and prepare a backport to the
supported releases (but not the security-only branch).

What my proposal would avoid is allocating a CVE and issuing a security
release, patch and advisory in this case.  We find security releases
take around 10x-20x the effort of a normal bug, once everything is
considered, and by their nature need to avoid our public CI and review
process  

The reason for this mail is to ask for feedback, in case I've missed
something about this change that would significantly impact you or your
installations.  

Do be aware that, as I mentioned in my SambaXP talk [1], it is already
a struggle to address all the issues raised - some lower priority
issues don't get the full attention they deserve - so part of the
motivation is to allow a better focus on the most important issues by
avoiding large costs dealing with a 'simple' Denial of Service.

Please let me know your thoughts,

Andrew Bartlett

[1] https://sambaxp.org/fileadmin/user_upload/sambaxp2021-slides/Bartlett_Inside_Your_Samba_Security_Release.pdf

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


